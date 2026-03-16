Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E395FF4645E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxNzXROiVNr7+UUfLEumcf/CNbcQ/TPD3rd4fIb/4jg=; b=RpHxi1QVr9AW9GKnIXAQdEU21Y
	N2Pf4V1iVfeYiaRcKIud8kkLrTEkLtKavgrxwgzQpTKB6Xmcf9QfGvCHy4Kk3hZEk2m2GOjcvDqq5
	/ktN6za3ZOWM7LLhlwjSgsYbZYKalbsEZGuXYzmZCW5cONg860cbcfhd6yctZoQVKVG1XAdiBIade
	lMj+1uh/0EKQxzezTmKtDaE1ybGvOAHXiZnxerKWRP5jYMU+38jspFtO5HOASmbyrvrgSM569tkO2
	qDv+motCIJZtUPRAMIQBFcVggk1Ac/LAqXwIK/USnG3Q3a8YP3GYUa2AwosfC0TQ7oHyLsXG+rNbM
	qs+Z5OxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26pJ-00000003uva-1OXd;
	Mon, 16 Mar 2026 12:13:41 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26pG-00000003utF-2N3B;
	Mon, 16 Mar 2026 12:13:39 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id AE44A20B700D;
	Mon, 16 Mar 2026 05:13:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AE44A20B700D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773663217;
	bh=qxNzXROiVNr7+UUfLEumcf/CNbcQ/TPD3rd4fIb/4jg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kCmKGzvYncQUiJWqt/Z+9Vj+di6RNMWorU0zQ9qy98ppbIh3yfCTkOqXutmuqfRuQ
	 OoH54gVCHkASeGsnZT/6YU3F/B9laj8xfw9AUZW00PHzw1Qk8Fp19j9waS1QC/2cKz
	 Y4hKnRWh7cuVVoAHR6tNkmU20pZZ+K6ceIejoD4g=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	ssengar@linux.microsoft.com,
	Michael Kelley <mhklinux@outlook.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 06/11] Drivers: hv: Make sint vector architecture neutral in MSHV_VTL
Date: Mon, 16 Mar 2026 12:12:36 +0000
Message-ID: <20260316121241.910764-7-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316121241.910764-1-namjain@linux.microsoft.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_051338_650280_2F0A9556 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Generalize Synthetic interrupt source vector (sint) to use
vmbus_interrupt variable instead, which automatically takes care of
architectures where HYPERVISOR_CALLBACK_VECTOR is not present (arm64).

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 drivers/hv/mshv_vtl_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index b607b6e7e121..91517b45d526 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -234,7 +234,7 @@ static void mshv_vtl_synic_enable_regs(unsigned int cpu)
 	union hv_synic_sint sint;
 
 	sint.as_uint64 = 0;
-	sint.vector = HYPERVISOR_CALLBACK_VECTOR;
+	sint.vector = vmbus_interrupt;
 	sint.masked = false;
 	sint.auto_eoi = hv_recommend_using_aeoi();
 
@@ -753,7 +753,7 @@ static void mshv_vtl_synic_mask_vmbus_sint(void *info)
 	const u8 *mask = info;
 
 	sint.as_uint64 = 0;
-	sint.vector = HYPERVISOR_CALLBACK_VECTOR;
+	sint.vector = vmbus_interrupt;
 	sint.masked = (*mask != 0);
 	sint.auto_eoi = hv_recommend_using_aeoi();
 
-- 
2.43.0


