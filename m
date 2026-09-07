Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB5FC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azXNvPaknVBy0Syf3YnOWO2EVMjwE6S1Z11nRdavFo0=; b=2570txLwC4S7qapBis4zTlcPxQ
	nAlRLt5er/QR0fOI2T0STjjAiHkVqIvV7UPCL7uELVhhAplWpiNzdGuWvne+jJqCjPB1qvG4fSA8w
	ayXXJYYDXvccVi/tl+tn1DNV333hFJNXAakeqNa8JcL44xJZ3mERZ/Zy3bkYlBMh3y315QeeeukX0
	wIbMoOwsCtymTBosa/OCQ/LkWcGzvWxwlEuCajj9uF4CZGvXDN2T9OlQjkJICV3hm6xKG1SNh9ztm
	QNk7QtzrHPgf67nTe/LvHJ+5DELrQok/JHXEfn5MMl8sBUg2su+ABqe8pQmbyA7zXEHNyEKTDul4r
	kXkkYuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0f-00000007T2g-0Rmv;
	Mon, 07 Sep 2026 17:19:57 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0U-00000007Suy-1wbt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:19:51 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-4843313047eso2326135f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801584; x=1789406384; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azXNvPaknVBy0Syf3YnOWO2EVMjwE6S1Z11nRdavFo0=;
        b=a9qkLKXG0TRm/xPWMsKRHgyFQgGW/33QioJgggfxsiz3ko1TAjIiatvOOdRhEINk4a
         xb4esRyMKbRkc8c7Zy0KlM3eD7NWa8Ytn4MrZ6vR+b2duonhU/gQDcJobALfTYdcWbuM
         DZS++g1UFNUmqdN4jXWOvOt3cKb5G+p4ar+LMBq6nX1bSOju1JRX2WFjDPy2TYvt9Ugb
         mxdkEQWESA/ZG5uETav6ddtEIPTVbR1s/Kb9PlBOBvij5kZCCZ9qeDaLGDR88R9E9i2R
         XZvjXD7ytp41fwecmWdSMbdkCimVnpcyyvr1IhKHoszB06TIXPyMryOuq6pSw0v0hgXq
         NqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801584; x=1789406384;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azXNvPaknVBy0Syf3YnOWO2EVMjwE6S1Z11nRdavFo0=;
        b=YxGLvj3hUyeA7VWFExqQ4+96ICE/vZrFHGq+LjHBKKt1ERpA/6bBEVuBc9ny+QOdeH
         hTlH+l7YU7+t3HUUveuQYdPW7j++GkkVbIP/J+kLGpAznco+aSlQwy3fVI8r3oElyIiJ
         5Gzl9Dyd7TgNaiLxPHGewZe2eSeNb3QoH8AN3Pbx+G1KhesIBgO9cRO/ZADtxawUITdR
         wGRRZW+D8lMyYCqGfMfrOM5Jb3YIJEUmy6QrXyQ6MU9Mt2M1Pfw0Lu7Lh7WAz7oF8srD
         BDBebaGNcp28qBSVj6PPsEWUNHPY2AiQ92nBFiTDVC4n9suEb+iPZ/QqCS5zOX+mbtJ9
         N3qg==
X-Forwarded-Encrypted: i=1; AKwUvBzW4KXm6RutlhqQlqJ5vdgTxZ6gCSoB9yST/x/gT1XN4QvNiryg5UuHZ9LngJOgoXb/PJIo5kYmyi1tOSxNujD0@lists.infradead.org
X-Gm-Message-State: AFuF++mu2WCctrPwPczsMfpPHNipWhH/kdpD+8JL80AlQWYODfoi7o8f
	Ykga7lcAb5urPtcGM3bVCp9ZzFHeDZt57ofB0aeYGLv8CfpVoLWVp3w5Gi8Q/DeIeJiTF7/fqUE
	OkQE708M7toIVUwZtD5+KaIkQ6V8DHA==
X-Received: from wrwc18.prod.google.com ([2002:a5d:63d2:0:b0:484:3922:d684])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:993:b0:485:847f:fd7d with SMTP id ffacd0b85a97d-485872d5061mr24058104f8f.24.1788801583354;
 Mon, 07 Sep 2026 10:19:43 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:27 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-6-sebastianene@google.com>
Subject: [PATCH v9 5/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
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
X-CRM114-CacheID: sfid-20260907_101946_692555_0B398FD3 
X-CRM114-Status: GOOD (  13.58  )
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

Allow FF-A notification GET messages to be proxied from the pKVM
hypervisor to Trustzone and verify the arguments sent from the host
driver.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 923f32caa04b..e11fb06df63d 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -695,7 +695,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
@@ -954,6 +953,27 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (FIELD_GET(FFA_NOTIF_RECEIVER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags & GENMASK(31, 4)) {
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
@@ -1025,6 +1045,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_SET:
 		do_ffa_notif_set(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_GET:
+		do_ffa_notif_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.979.g7e5102b832-goog


