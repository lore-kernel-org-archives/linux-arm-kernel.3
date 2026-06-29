Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF10C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xiqxqnl2C9k1tEYMUAaXcebc+AhGr8jKaRPorea08vw=; b=mwt+KMOaq41v6E2ZhmTS/2iEox
	84sPJMBQmk1IUwedGr3RxVQQ/tlB3nuxKejBXRAMz61DqjMjzchFUxSbejg3LFwde58+8qEpeoT0z
	51ahUyKC+M1+vQZHuwMUyag8CjwwRuJMd6VBVWlSQXogMB5NDwOUg1CiKwNUmL87HhP9Wl+um41aS
	XljEan/slPJU3l9Hvenm+DF8j288Dmg5xf/cjwrkR7r+UzbB/aJ2HfG2ledNKG8xD3ERlk5USfAjE
	WBlikKy4DXKiJT2j55T/QMFg0jaARpNh0WKtLYiSZc6W1TOTGubuZPkU4dkMzQcTgbqP6YTxjsUVh
	mGTyWzKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA0w-0000000EPgX-20Wj;
	Mon, 29 Jun 2026 11:18:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA0o-0000000EPcZ-2f7z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:18:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5E87293B;
	Mon, 29 Jun 2026 04:18:44 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D43A3F905;
	Mon, 29 Jun 2026 04:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731929; bh=c+XyEzulAQoBKy3bC5qms6TVrv23+PzJGKXX+3KrzbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OGpZWzvQuIckKo4atC1MYfX3dT3D8bZUS6vo3AL5prJTvpyeTchPOwZK02zoensWd
	 xIKCJU9emP+k0oXUv9pxy3fbyGuDjDmHxvncfQxNXiyvVRRtDF30B3KpHhSA+DhHZH
	 f/JwVEmIoWe0a/br0ccwekaIe9GjfWWVHYkHXIF8=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 04/13] arm64/sysreg: Add HACDBS consumer and base registers
Date: Mon, 29 Jun 2026 12:17:52 +0100
Message-ID: <20260629111820.1873540-5-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629111820.1873540-1-leo.bras@arm.com>
References: <20260629111820.1873540-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=leo.bras@arm.com; h=from:subject; bh=c+XyEzulAQoBKy3bC5qms6TVrv23+PzJGKXX+3KrzbI=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKcQhL0v2tuD7S6rn7Gv3H3f1mNsAviGup/lfhc3xZ9D jPRm7iko5SFQYyLQVZMkUX20fxVPN+nZBy58mMBzBxWJpAhDFycAjARhruMDL8r5u5abxdoWFsq 4dGybt9Gn7yQivtb6nrqvIWYDaevWMLwP2y64d7fLU1Nby0vvrv0oqkiQuGHsquRyb17t2Sm2IV yMAAA
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041850_775672_CC20E4A4 
X-CRM114-Status: UNSURE (   8.64  )
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

They will be used on a later commit to make use of the FEAT_HACDBS
mechanism if available.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bc1788b1662b..7b7c3d6a0f03 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4627,20 +4627,50 @@ EndEnum
 Enum	9:8	IRGN0
 	0b00	NC
 	0b01	WBWA
 	0b10	WT
 	0b11	WBnWA
 EndEnum
 Field	7:6	SL0
 Field	5:0	T0SZ
 EndSysreg
 
+Sysreg	HACDBSBR_EL2	3	4	2	3	4
+Res0	63:56
+Field	55:12	BADDR
+Field	11	EN
+Res0	10:4
+UnsignedEnum	3:0	SZ
+	0b0000	4K
+	0b0001	8K
+	0b0010	16K
+	0b0011	32K
+	0b0100	64K
+	0b0101	128K
+	0b0110	256K
+	0b0111	512K
+	0b1000	1M
+	0b1001	2M
+EndEnum
+EndSysreg
+
+Sysreg	HACDBSCONS_EL2	3	4	2	3	5
+UnsignedEnum	63:62	ERR_REASON
+	0b00	NOF
+	0b01	STRUCTF
+	0b10	IPAF
+	0b11	IPAHACF
+EndEnum
+Res0	61:19
+Field	18:0	INDEX
+EndSysreg
+
 Sysreg	GCSCR_EL2	3	4	2	5	0
 Fields	GCSCR_ELx
 EndSysreg
 
 Sysreg	GCSPR_EL2	3	4	2	5	1
 Fields	GCSPR_ELx
 EndSysreg
 
 Sysreg	HDBSSBR_EL2	3	4	2	3	2
 Res0	63:56
-- 
2.54.0


