Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3285C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piiRWCJ1kku+wXo8orOGF6kurBcejDUkIGQIzstV9bA=; b=bjs6HfFh3fAW1eSAPRipQIXE7N
	TzcAOnhZiJjkLFQQy7253JavxM1iWwpBi/chLxZoIcAMAcaxFB2mhb0lihkRfZhiNfx0AnT+U72mf
	Ytu75g4G3b/cbkyjnv5z5JzLUcdw19up+vmB1PH9XnE+dKuiYMkVevf56IjrGVJm4O1r05CCC06Zy
	1nEDQMtjExqA3NUsjsxbit8VIQ09JhwEz2GnuZHVN7mpv/EayHRaNL7FbtdttwSHq4pX6p9Y253MZ
	/kxQIaCPyFeF7raAFVkw8h1ErvCMCweh9nr9X+adCQwMHHmY5sRwrRYFwA6WRABsK0LA+90kwtOlC
	AVfcyOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0e-00000007T2N-49I0;
	Mon, 07 Sep 2026 17:19:56 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0T-00000007Sul-33hd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:19:46 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so28156395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 10:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801582; x=1789406382; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piiRWCJ1kku+wXo8orOGF6kurBcejDUkIGQIzstV9bA=;
        b=pNPbhhezWsU+ghDUnXUZ34PZ/uuN5UGHWEryT7cfA5bBsDeK76ZuGTdLJYgsq97/Hb
         aPY+Xe/v0EEvvTMdTd3YDGxOZysTT8PqkE/9+X+I1exySetlUc8uK/OwIRQGUow4Lh+x
         572vKqHuQKv5RQ/HRooPt4Wr4x1qxvvprKHhaa/tUoNMJuaRymSuFa1e8PUG/Didekqs
         43wcePN4Fm45cX5UXEoz51PsHhHHYHSD/q03SpySjX6GUyVOzHq3o5mpaZXXow54Hc8s
         i523O1yZ4il3dJDRVeWic06V0t7TOhEn6YY2pK1yze0qMHurP+S9P5sBRtmZvx+J1g43
         5dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801582; x=1789406382;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piiRWCJ1kku+wXo8orOGF6kurBcejDUkIGQIzstV9bA=;
        b=oUS5NSBsVmlIp6R1I9yZ6X4m507Y8MubFciYgpIQdLFg3Qo44sHMFdTAFXTvbcXOkV
         RXXgPos3ACapzSh5OEUPZ7q2xeJK42ldgYd2cR52rucZ5L7Cwml0VTNGS/zGu+ejdBn0
         GV2bxrhO0fSGM/muZ2OkQDbIOjxSjFDItpIbVQ3CoTAcP8BcJzRerQB/KgUtZpUUB+gg
         Wt5odAYxVj0F+uGrlso8nuYPxNnAJWXCbsnU1wLz2pxlz37p0dBpEpjtNFlaIRIrCUFM
         ywB0diUJOT9x3DOxnWAd0yQYSRhd5sNKLCLscLrfxI+5k8HXmNHFA4X1eM26LWr5rMIU
         ywdw==
X-Forwarded-Encrypted: i=1; AKwUvBw2nL1Nx8mOSprMp9B3wo46ThFKqfAI8pPkjq9nVYwIAdZweCC6L9aaPC7JPsw22thRYdcbLOaApHmF9fdhwrOp@lists.infradead.org
X-Gm-Message-State: AFuF++mTOSlBOsWNmn0kvUlqQWXTCmQEqfdcDqWOwA0EHTnEXzJ2SqDE
	nopXgpQZV0N9FtSl/8XbCNeYKGmDdmEPva6xjKYo78kPxdls0I5dP2gjDpQYOFjNMSSZ1Cc/grd
	1rDONxGQT+XWHCv4/sq29W1eLOIe8mA==
X-Received: from wmjx23.prod.google.com ([2002:a05:600c:21d7:b0:49b:96be:bdd])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c48f:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49cf825d507mr246019025e9.9.1788801581830;
 Mon, 07 Sep 2026 10:19:41 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:26 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-5-sebastianene@google.com>
Subject: [PATCH v9 4/7] KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_101945_806567_68E6E42B 
X-CRM114-Status: GOOD (  14.76  )
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

Allow FF-A notification SET messages to be proxied from the pKVM
hypervisor to Trustzone and verify the arguments.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index a1ba4463d1ef..923f32caa04b 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -43,6 +43,7 @@
 #define HOST_FFA_ID	0
 
 #define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
 
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
@@ -694,7 +695,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
@@ -933,6 +933,27 @@ static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags & GENMASK(15, 2)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	args = (void *)&ctxt->regs.regs[0];
+	hyp_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res = {0};
@@ -1001,6 +1022,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_UNBIND:
 		do_ffa_notif_unbind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_SET:
+		do_ffa_notif_set(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.979.g7e5102b832-goog


