Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1DFC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqjYc7dDru0kL8YLEcuxLULPz2o0kXFfzdXcedJdC2Y=; b=f6r0woo1N6/x4xL/ijOfZUz6Qi
	Zm9vj9dx6kRDxyQY1bCuZO3XhZ5LQfd8eY/iE/wS5dstfG29tqcCHLT18IAKxiEEfxpx1ieCtx/sM
	MqvI0JjzS77i7YNxBysY3KKvaATLD1Cy3eVS5EexuEr8R6X7EuF/tgRaVJToir9gUYaKJoyDxQos/
	EGV4shOriEKCTTAn/0noyNmZ3K/Wbqx7rSrtdtSXDdaZEoMVgfEj7rUvzk0dTa5X90XXOL2r/dl7V
	SyJrHMU4qeJ6kSf44i2sStcUHQCLSKGxNlVA3QfKVkToLWd1yvzp02JtlzLiAU4YcxCNxAbYmeVPA
	DfNZA2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1ny-00000007aBz-1pca;
	Wed, 29 Jul 2026 10:46:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1nw-00000007a9l-00y8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:46:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3A7B1688;
	Wed, 29 Jul 2026 03:46:22 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EED7E3F66F;
	Wed, 29 Jul 2026 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785321986; bh=29KJvYtZhLDWSDN98h2HJ49voDEmV5ePH1jVPl+9zog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u8i/Gl88D07lb5k4+Cgxsdi0M/R14ubYZK1UxBLc5XTDNRvyCulTwXzwdBsPzh9WO
	 7ZH4JnZC6Ysq/2yUDhZs1cX1HtLhTGA601OLFUb29zcdxUec/kSYiH3dMkBWcNqh8a
	 U6EdzPt7lGEEwYIFlD2OoNNWx71k9YDdo91OVYiA=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Morse <james.morse@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v3 03/11] arm64/sysreg: Add HACDBS consumer and base registers
Date: Wed, 29 Jul 2026 11:45:38 +0100
Message-ID: <20260729104548.3439958-4-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729104548.3439958-1-leo.bras@arm.com>
References: <20260729104548.3439958-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=leo.bras@arm.com; h=from:subject; bh=29KJvYtZhLDWSDN98h2HJ49voDEmV5ePH1jVPl+9zog=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLIyb16ds/nkne4E/xide58mbtsRFRztXPs0rnV78f6D3 U/cc55adJSyMIhxMciKKbLIPpq/iuf7lIwjV34sgJnDygQyhIGLUwAmsiaKkWHl1b2y+czBz16f rqoT3TL/UOqDNa0bDf77etk76hxkY1di+F+cHSHeYBz0X40tUqhealZivuAUpS1nzJImiXzN2nU /lRcA
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_034628_117921_C5874449 
X-CRM114-Status: UNSURE (   9.41  )
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
index 7cb61aca3797..50ec9751b44d 100644
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
2.55.0


