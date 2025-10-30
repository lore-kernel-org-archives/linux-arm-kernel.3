Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFB9CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjW3C1CanmjBXvji3P3r+GcdLtaisbUFYZKTjeAGaLg=; b=syV6HYfj87frMlMs4rYYVOF+C0
	Ltjk1sOZtAQ+pKv+bTAyjuWO5u4fR0ERd7WO/4n4ZtjkyKNfYenBF4Gayx62jMYe0jiNgQ8Qwnlyl
	liYxiyn+mrSBkcnH/w4VYg6w9fLkcEKjEpTONuCIPJsKYREAOAPKg+QLEQzEwvS+g3RWOdAQvYgXl
	u0aTukTNFH6YVPe3KCAK0wB9RsSiCaHGzJWJLoH3hkgIQFyOj7P/cG404KkvblAoRcj7mFa+Sxnm/
	YEz5skvJFIlPWZINgluF0aFRsXcs2yz0uqelWJ5xhX/8BGVfBvgBOW0Jr/h9rlAlnPfJVx3OS2DWU
	fUvu6PaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPo6-00000003xxb-1bz6;
	Thu, 30 Oct 2025 10:23:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPo0-00000003xvU-21dT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:22:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A50F2C42;
	Thu, 30 Oct 2025 03:22:47 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01BEE3F66E;
	Thu, 30 Oct 2025 03:22:52 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	perlarsen@google.com,
	ayrton@google.com,
	ben.horgan@arm.com,
	sudeep.holla@arm.com,
	stuart.yoder@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 2/2] KVM: arm64: support some optional calls of FF-A v1.2
Date: Thu, 30 Oct 2025 10:22:45 +0000
Message-Id: <20251030102245.2313898-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030102245.2313898-1-yeoreum.yun@arm.com>
References: <20251030102245.2313898-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032256_595901_44B379BA 
X-CRM114-Status: UNSURE (   7.47  )
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

To support drivers or components that implement their services using
FFA_DIRECT_REQ2/FFA_DIRECT_RESP2 (e.g., the TPM driver using CRB over FF-A)
and obtain related partition information via FFA_PARTITION_INFO_GET_REG,
enable pKVM to support both FFA_DIRECT_REQ2/FFA_DIRECT_RESP2
and FFA_PARTITION_INFO_GET_REG.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 0ae87ff61758..81e8b33bbdd3 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -679,10 +679,7 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
-	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
-	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
 	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
-	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
 		return false;
 	}
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


