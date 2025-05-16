Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F411C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBgpumen4wqAs/XPAEFa1O1c2gNsnbjjB/W/W2vVpUM=; b=frYacu8nNh3iBtP2+xEznX14fT
	OE43RTdGYF4fOivFqwT0GhhkaI/adFxcgDIKsYGh3XwtqOEViNymMTK0WLlBeL5h3kEBqy3nCsxLe
	7mdkFsoGwS44Em0+0lWuFdCSwmLjVsul7qjakZVRpEwSERguTMK0vTUNzYlrL9YrNtP6zmDLv8ED4
	TiMwJoLbwmMXrum/4ALQG7jpUF01e+jDIfqON08lCfPh4jOuawY1nseI0uN0SsW+04On5r/r3kmso
	u+riV1/TuzFXjRaF7TBOmFWsDEJ5x772LZfhmjf8Grt+7fsuR4jl1n4P3wfZmql7p/5eXnOhlF9jE
	hdQm2Odw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFu19-00000003Lr5-01Tp;
	Fri, 16 May 2025 12:18:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtx6-00000003LD9-18cl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:14:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60C7F62A01;
	Fri, 16 May 2025 12:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEA5FC4CEF2;
	Fri, 16 May 2025 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747397650;
	bh=9U/85KTSy2soaOEUs61BjUU0CpktmnMb+qsPkLo0B5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WJ4FtaOgH+39q/9UjmhBnMooZm5KoX+Lc6xfPXvNDMNsfCAUl1pWOMLWya5iMBnLU
	 wQHuSLJspVLnn4hZ+7Wrs6EHUyfiEcN/uxOz+R2KXldLh6DTJYyiHxhBmln8LXzWok
	 7ectKHLZB0vpmDVhMnBdDfTzVVRZbku0PUpce2wSurbzrXTxDycqtBywlvLJT61q8K
	 MBsDGJeSnouqRehj/aQ/ijXR3VoX2bK68XluFlyhvQqwle27WmbGw6KWo+2WDBFxsy
	 sOax37hTqGWCACMP9df94JZGvlK03PflBQsWi8oaj2vZD2xKSx0D7gVX3pO2LyFUPH
	 JRO3lU3n7EHZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C7CC54756;
	Fri, 16 May 2025 12:14:10 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Fri, 16 May 2025 12:14:02 +0000
Subject: [PATCH v4 3/5] KVM: arm64: Mark FFA_NOTIFICATION_* calls as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-virtio-msg-ffa-v4-3-580ee70e5081@google.com>
References: <20250516-virtio-msg-ffa-v4-0-580ee70e5081@google.com>
In-Reply-To: <20250516-virtio-msg-ffa-v4-0-580ee70e5081@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, sebastianene@google.com, qperret@google.com, 
 qwandor@google.com, arve@android.com, perl@immunant.com, 
 lpieralisi@kernel.org, kernel-team@android.com, tabba@google.com, 
 james.morse@arm.com, armellel@google.com, jean-philippe@linaro.org, 
 ahomescu@google.com, Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747397650; l=968;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=tJ9HD4wjZlLzjCNPRFEt/uGpoSjzet6nmsUHE2M2Jd8=;
 b=7xqRt3arz28xQfkhqfvJ+B+4UnOt54PAFFfiTGYmU2Bp36rkep1XJN9kBTDpFAIJFbkYVqlts
 V8tkLlIw+XJDtVSOeWXU/FptsGDEfrLiQLuC1y1FcBgYG2ZSPS91GWU
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
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
Reply-To: perlarsen@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Per Larsen <perlarsen@google.com>

Prevent FFA_NOTIFICATION_* interfaces from being passed through to TZ.

Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index b3d016bee404ce3f8c72cc57befb4ef4e6c1657f..a545d25002c85b79a8d281739479dab7838a7cd3 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -632,6 +632,14 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
+       /* Optional notification interfaces added in FF-A 1.1 */
+	case FFA_NOTIFICATION_BITMAP_CREATE:
+	case FFA_NOTIFICATION_BITMAP_DESTROY:
+	case FFA_NOTIFICATION_BIND:
+	case FFA_NOTIFICATION_UNBIND:
+	case FFA_NOTIFICATION_SET:
+	case FFA_NOTIFICATION_GET:
+	case FFA_NOTIFICATION_INFO_GET:
 		return false;
 	}
 

-- 
2.49.0.1101.gccaa498523-goog



