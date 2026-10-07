Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FBDCA6009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzDDB4ucLbbRTjxu5VYG/uPmoNmYS1X+sYC6plaG5JY=; b=YSAALRfc9ABpBuq6JWvKMisWlH
	ixJphrKqAAMcjPIyqRM3hXFFKjaPfm6HMAAzcuJdK+YmEHrD0uD0Y0Vg9qddvHNoA91ZFXg24txLM
	ILlpAv91We7roHpff8ssQbWZeXpn6kO1NYctinjki1hUek9cubSfKjjd0iu6lbKztolckpOmKTa6I
	Zp+sgP/Oe9UvPBS9UC7JR3EXY9Uu6/tqbUpFi/qCtUBpBqApYHxTgmZHR1NTyhUESs9hGrYCn3+Xj
	ZZfrHSXs0x80gBeDl2WKN83ctkvm1TMG4lpYoksc/2zraVQZ/vIpvVOcfmWF3imD9yinuWYlLa5bb
	ke1mMtsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETBG-00000002fwO-3vr2;
	Wed, 07 Oct 2026 15:03:43 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETBA-00000002frt-3QNW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 15:03:38 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a17c024b89so16344795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385414; x=1791990214; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzDDB4ucLbbRTjxu5VYG/uPmoNmYS1X+sYC6plaG5JY=;
        b=eg1Uck0eTjpHAa4mDEwSRdJ+LbI0glS01wLFSC4eVkZ7GegCWw7eKAoIAC8ocDfic7
         AG3rb6KzUMEp0wozhx+4sPgQ9T6R/hYSJmYKYcEAOtmuwWcb4xMYGMkV3xK7t8oG09xd
         RiJcdjav507sCeowN1eKcaJDGV2789lg+7+dMurZuquSRlEJPNBrF4p2N2ivYpusmID8
         CSlF+UN5lnkudLZF2yGXzmk29AKgpyi+vC9LLEr4KPfv0apJwxGp48y2OFjcJBcm5Miq
         ejkD9xhF5Gx7sSTUgy+ahSIiZLeThikclhAX1dc1PvZuDyRIPKonhjD0dfWzydW55u1M
         JbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385414; x=1791990214;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzDDB4ucLbbRTjxu5VYG/uPmoNmYS1X+sYC6plaG5JY=;
        b=azl1QUZ4UcLiOlJCW8Vp0w0v1sstvPpcpQp/mTX2zjkTT7k3G7RO8lUR7d8VhmWCKf
         762QMz5KzYqN2iEw0k/iTAn7BoZg+mtbbsI4ZOD5RYZeOBcCGUpISXb6iAtvJD1XketE
         7gjP4/LvqsD0TEDpaYXTLZMoWDR9pGEqd+IC1PXeeZm1c+ot2DcKn6npML3XFVNfNPwE
         TOJ2vnZXu/F/EDmLhZD+3zLLtcayn28zapdb7v2t+Rscdxkp5fM5dJo7NeMyTjD/Lxsy
         4oyh8ZBJfztuXCqOk2oTrO7lRnjmwdKqYpl6tiHzMxLs88mRg9Fp+xWfp+43wFX5ILCg
         9GfA==
X-Forwarded-Encrypted: i=1; AKwUvBxb224FnZwH/EwdymM2kKS+jXtPCA/eoic8rtGR37K33Fl1SHxIxnJpD+3+bgJY9nXWAkui7ilxOmr7piDWyo3X@lists.infradead.org
X-Gm-Message-State: AFuF++mphDO1Qmms0LyDlRqMvgUKUhZisFz9G4xwJTZ0TU4urBPNKNhQ
	gESzb05CLeVD8A8M1vzEC8DqMkJtgJgkhw4Eh+kP9TfUObPXi5w9ZCAMfOR9oGrTKeqjY4innjs
	B0p/pAOhdcNDrw4I9xZZ6Ig==
X-Received: from wmgb2.prod.google.com ([2002:a05:600c:1502:b0:4a1:6d54:16a6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b64:b0:4a1:6dc3:f5e2 with SMTP id 5b1f17b1804b1-4a180650499mr41927855e9.33.1791385414013;
 Wed, 07 Oct 2026 08:03:34 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:55 +0100
In-Reply-To: <20261007150255.1648849-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-6-vdonnefort@google.com>
Subject: [PATCH 5/5] drivers/virt: pkvm: Allow granule larger than PAGE_SIZE
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_080336_951889_F2362CB3 
X-CRM114-Status: GOOD (  12.50  )
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

Both MEM_SHARE and MMIO_GUARD now support a PAGE_SIZE smaller than the
hypervisor granule. We can relax this restriction.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 3852be6bd16b..e3363a69a7eb 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -135,7 +135,7 @@ void __init pkvm_init_hyp_services(void)
 
 	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID,
 			     0, 0, 0, &res);
-	if (res.a0 > PAGE_SIZE) /* Includes error codes */
+	if ((long)res.a0 <= 0)
 		return;
 
 	pkvm_granule = res.a0;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


