Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EF5C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnXYEL+Iwd+FkZKU2Svs3nKV68LblPhpKmHXDrM/87E=; b=SHIU6V3C3K0T13Rh5JL0BgR4rt
	gXWabHF0k9Nb4EArAfqvsSAg6pclisd60r71Nbx4SBoDccgLTtJkdfrUGj3TfJlbZsvchsTJ/t966
	i7WWJ3chifX1iB+bym8kZo2mUWu7ppLvdfX0q1iN7q0gk4DVkPNGsn9DN0ql0WsyoQHVRMFyv6ZmX
	U1nd2wunxiYsnF5fsK5U2IaDLehIYC8LYV9bnLRP0eqc0nqr9DHyLZMDHdToOdkKRovzNFw728Csx
	eOXVtYQde6EGQwIHTErsWxF9Ox8RRw7EHsyqxwljeMUTb7Q657jD3HVzZcH+R3ORbc9KtPfdO3VoO
	AtPsYruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWf-0000000GI12-0j8d;
	Wed, 07 May 2025 17:25:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgzE-0000000G1rq-1WXR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:47:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E24DB202C;
	Wed,  7 May 2025 08:46:57 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C9653F58B;
	Wed,  7 May 2025 08:47:04 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	huangxiaojia2@huawei.com,
	mark.rutland@arm.com,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 2/7] prtcl: introduce PR_MTE_STORE_ONLY
Date: Wed,  7 May 2025 16:46:49 +0100
Message-Id: <20250507154654.1937588-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507154654.1937588-1-yeoreum.yun@arm.com>
References: <20250507154654.1937588-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_084708_442538_0C39AC8B 
X-CRM114-Status: UNSURE (   8.45  )
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

PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
opeartion only.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/uapi/linux/prctl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11..83ac566251d8 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -244,6 +244,8 @@ struct prctl_mm_map {
 # define PR_MTE_TAG_MASK		(0xffffUL << PR_MTE_TAG_SHIFT)
 /* Unused; kept only for source compatibility */
 # define PR_MTE_TCF_SHIFT		1
+/* MTE tag check store only */
+# define PR_MTE_STORE_ONLY		(1UL << 19)
 /* RISC-V pointer masking tag length */
 # define PR_PMLEN_SHIFT			24
 # define PR_PMLEN_MASK			(0x7fUL << PR_PMLEN_SHIFT)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


