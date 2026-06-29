Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0480C43638
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnfFrOcHXwa5bmm+nV3SBHa/UP6ZPQaBfRpC1K8u2Oc=; b=tZwYpQEEaUwR+wQN4Xw8g5lcW4
	By6EOXk82YHWDwO4Du3mhMQsBIidbtCNSQlj8kPdF+C46QMjgpCrtEgCsoSFV+bejL4m+2ucWQeLo
	Jw7iKsgsQBKETMY4VG4ID1IueHIwR/0hICaQ6DIpqpxM1toqFROlggGzQJOw5Jbzjye2XIH8hx1wZ
	AJWXfv0BnBgOKrmBavwX+/ASge8cPsDa53AKzevGivyOMOHF1OllKQsMPMkqY8BqAfkwaXUTEvfPr
	DOFXGJ9cGK7Ebpp5dSTJXz1ZT17CxX574Fbhc+mo8OtptntuGeLanXFbUjFOTXJd+OSwiq1WTKaNA
	JrI/bhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Pq-0000000EBaP-1oPe;
	Mon, 29 Jun 2026 09:36:34 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Pe-0000000EBUc-2UH9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:36:23 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-493b0fe9659so6108405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782725780; x=1783330580; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FnfFrOcHXwa5bmm+nV3SBHa/UP6ZPQaBfRpC1K8u2Oc=;
        b=AY9tT4WFdf0b5z9u1Iqmm1rl6lo/v/oXDfxmIdqv1sQzrXQ/zFkI+vb34cKIPED3eW
         cMKXip6wQqrg0Ua5vusd3FiqrkMISouQ/u5s5gshtC0yjMyK1EtGqkYPeLr5V2KYmwnm
         V46W1zuyAHrFqH20jf5slUwQvfZEIctE9wPhgysipk9Uj36AbZgKnJ3TPJ6vuZiFYGzk
         Jf1bq7RF7IuxDeZ+op6pMOBukkyW5HgoZUS7HO6T2pHq2wpjXL69EDYftIT36Z04nXSb
         2WmP8BFYOQG83UOciX0TaqsBfSS5w4a6Fup6XTH55krEevgl3X9m+Txj02/vGDHw8J+1
         5CCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725780; x=1783330580;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnfFrOcHXwa5bmm+nV3SBHa/UP6ZPQaBfRpC1K8u2Oc=;
        b=ojPcW+wgWu7PPqXtMQSn3Q8WfLT1ynraijweIYUQxX0UQaGOSOJu74TWA2jMPAdeCb
         h+p0fcpYg7qlA4v0Y9hLY2E3s+nkbrPhlUB2OHi91Zs5aexcilWlcgBBvGa1Rg8Y3/yw
         d7FXeaTqV6uRayjeKofi0BatoQXS7i6tvh8Dp3kTAi50W1r++licukHpK3Jir3JqTQya
         9nNRNm1xj+1cZq1g0lYoeDqKpXw7lyHKZ8q0YX1614s4vfOO34R+kLoiZ4BmD/L5iG9t
         V5k7Zky971D/jZZwmk8Bp6rdEE2whYVQEp/z6C/ZlZfsw+KCwg7hcD4wExovVKpbaphy
         lXhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BXBUkapMuTwPJwaeYicRyQflnN9f0W2BDL4J2ghxdj2rkY7RCy3cuE92p72niiO7F3wi2Fy1CIG0p+vRbayo9@lists.infradead.org
X-Gm-Message-State: AOJu0YymAEcZ+xfzbzp/5EWON8rF7Evha2uzFS1SSC7e3dJKuov0JOcu
	BNxTYI7N/RGTxmlbCSfnIMzqO0jOVNDJjxu5mflMoLWGKSXAr6gsqL/88WIIeVznkyk73rK21aV
	fFUcGeNlO04oy7cIENYql59nc1UIMkg==
X-Received: from wma2.prod.google.com ([2002:a05:600c:8902:b0:493:b2c0:5a0d])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a111:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-49268bc34e3mr160747885e9.32.1782725780006;
 Mon, 29 Jun 2026 02:36:20 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:35:57 +0000
In-Reply-To: <20260629093558.2425257-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260629093558.2425257-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629093558.2425257-7-sebastianene@google.com>
Subject: [PATCH v7 6/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_023622_631753_135067F3 
X-CRM114-Status: UNSURE (   9.65  )
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

Allow the host to send FF-A notification queries to Trustzone and proxy
these messages from pKVM.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index c22fe4514741..712811e89435 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -678,8 +678,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
-       /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
-- 
2.55.0.rc0.799.gd6f94ed593-goog


