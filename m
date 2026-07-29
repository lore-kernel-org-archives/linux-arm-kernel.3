Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC61C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pT6ME6+uuPUFrDLhBZ77UVbhr4cwcY1ivaQIEa4otBU=; b=i+xcN67whnDV1hBmHMZN51Vmje
	d9Vr8zdJk+lUmriu8ZuQdsdothaPAgnAZ0GVvwjS/a0/iJKNIpSbBs3MA/7Urv/EkZ027dIxuj8SO
	gvM9Ru3iQj13oB9ccy+SFX255fGenEC04mxw89YHfC44hkOemyWhozPU6QHf+/IysJGGqPOhFnxTn
	qWC/Lp4zlDVV5cQj3Y42cf6gH8QuYqLyRj7ThURH+5o3+msHMWJj3L8Zs1DRkJXgj3bNbJ3qPsg0h
	ULNPlFA4HToFB8yCck6s6Q3wW6ylCLusBjySOnOXv+T0dKNf9US2M54NV0NJ0IxSUYycbq2gWBSZ8
	1jdhflXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AY-00000007qn5-3p0B;
	Wed, 29 Jul 2026 12:13:54 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AR-00000007qhp-1ZHE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:13:48 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4954b1c6310so8264975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785327225; x=1785932025; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pT6ME6+uuPUFrDLhBZ77UVbhr4cwcY1ivaQIEa4otBU=;
        b=IcKaLhVHq5HD51tkUHsBstC9ZaolJZr+1g5aeq+4XQ3q7sixnhWGuUqukdC2qVizRe
         Cx2cxJb8Jja+nmHI4JToQ/mtoegY5OAoiaheVf67PLkyFHH2uNbwtUd8+3XGKEo/2jGe
         5CU607XxzskXTTJxMllhadeUfXuLF0CazdERY1IISGVf/MXcvzHZlBSid6IFR5JNcTdd
         Jr341JwUXvZIJk3XFljqN3f7CIgtHNFvyNcnek2tKwV52Q+qXpMCWJmp4vEK+GZoC2Ff
         mkk2hHcVBSUKykaYe32DSxqmWUp72Hv1bVuIMMx7UCZLs0311bRT2lYAxcGsuicRxC2L
         UwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327225; x=1785932025;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pT6ME6+uuPUFrDLhBZ77UVbhr4cwcY1ivaQIEa4otBU=;
        b=Ok+rwz+0K5Nn5gNFWtsmgdkw57SsqDtS8QGGIgrq1ItiM4RKCwMnrT5TVtEgz6jP6Q
         qKuZsU35h/HaI7tVyHEjW61j+mgFnRFig8isBBy/V1Y9Xs7P44238xGOqzyFLvjnU9gY
         81awcVb7iC29ZviBwEe/XquM0zP9auDkRfezmATRuhxFDMTJ86LIo263z20l8XVhb+C8
         yHp+Og6OKJtzv4EhidG1OL1pcC0puMRHZQjyKd1Fq5BR9MHyedf9Fkhm9UwhPm5Sskti
         zwcBJ+TZiKMGPyEL3l+UweO9onu4udZsI4tGfvPIBExb4AaLxXQu8w2llCNLd14oL06Y
         Bx0w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3AV3LGAJHUPTC7IWkv5TcSvRZbAUT3N9nD3GBuRgPJ0sH1MvelFjul3M1KQPFxfqi42H8070KOkHZ8HFxa5sR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz3NvUC5u7kDd1f4DNuVka+de5r/Rhs3D+DUfmBL6ff1tRj+7I
	+ls0AsZqGQme9Nf+hRCimfto1dJdWil3542uND2bxYsZT1O32FiHyNvCydZHne1iYpRrGAWcNzn
	NV7TeNR5+LiBhOCxiM2meNgL7uLJFAg==
X-Received: from wmsk18.prod.google.com ([2002:a05:600d:8492:b0:496:c04d:501e])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e52:b0:496:df96:ea8 with SMTP id 5b1f17b1804b1-496df9611bamr36752175e9.17.1785327224777;
 Wed, 29 Jul 2026 05:13:44 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:13:06 +0000
In-Reply-To: <20260729121306.1519473-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260729121306.1519473-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260729121306.1519473-8-sebastianene@google.com>
Subject: [PATCH v8 6/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
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
X-CRM114-CacheID: sfid-20260729_051347_416049_FDBFAD8F 
X-CRM114-Status: UNSURE (   9.74  )
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

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
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
2.55.0.487.gaf234c4eb3-goog


