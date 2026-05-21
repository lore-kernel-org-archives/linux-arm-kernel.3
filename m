Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DC9CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5/wPOhYT+XNTnHhWuUbsn8hIMZp5hhEHwfl/Nd0UJw=; b=KXTx7IeZkRWVtNEbVXge9S5Yoa
	IvVGeizT2ISSkwPzNVQzBs6xgaLKtCS8VFqcQIOu/urrEgrAGKFas5oGWuCIUtmiWhO5mktxP+DTf
	Ffw4VOlo3RT7/C8XqANwGY5LmKCDobx4f0IK+Z6/9Xi5FoagjLE0Q+GmJiGut8yW2qqk7uKMP9yIR
	QLc/UWcblvFcpceHLA69Zei60+uSWmvzJLgHWrXYO13P//jGyj9K7Y//qEipC/aQfbdSkVLDawXG4
	4Du4RUGjIJndi8gapf/PlYdKCZqIZaUMpxWilJPQp6x0dIlNGwfj9SfqRYNH9YupiinVhBg+JkKYI
	QlE5gxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2nI-00000007lGZ-3NLQ;
	Thu, 21 May 2026 12:46:32 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2nD-00000007lDz-2B4a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:46:28 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48fde68e420so53156975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779367585; x=1779972385; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5/wPOhYT+XNTnHhWuUbsn8hIMZp5hhEHwfl/Nd0UJw=;
        b=AmWZNmQO3g4MjUphmk+Lve73QwmiRt1aArEFgIkvKREb/vrXzoHqm3R64M9pct1ovm
         wjN/O/XzidNPOMOGfn9kw/8rSeCSWu9X/LqXnE1Jz1f/Thb94VjsZllOOQNTVt0TLDi3
         b2zofWnmSGdACxrK7flI2X2gwKsDstBpUDhxUMiKJpGQijETlJbY3JD/oS88KeHb5QbN
         hp34db7dSsDuSOXQYh5SMOfqfaZ5zPdb+kEorHLqGcDy1HWiIei8Q3g36CzypT1urVKO
         VW6sB5og5Bw+z0vbu3R2dnVQKo/Z9bk2BMnIroSHxNxJX0iDge7ABr4nXD/W9TYPuNIa
         ZpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367585; x=1779972385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k5/wPOhYT+XNTnHhWuUbsn8hIMZp5hhEHwfl/Nd0UJw=;
        b=Ye70QMzHMKQXPp37tDyKOTMzRSTyHQbjdZBunj7bt6iNIQa6IQzpIGdBPsALFuR5oD
         aNYjdheuqKWEI8CPFp8TMB2AupaAYvERlfOV3QUeHTJwgJ2AkddYm8uIMLf3vQdicf0U
         jjgAkhDF7XUQCe081q93m5Q1KTAmIndj2ZQm6lsxyJgoOu1ZBO4aSL+Il8xfKvpU9BwA
         z2NDKa6fm6mpeQh+w5i8wmFrxJsSDh9yGvHmp+DdI23jmJkLfGboFfQrtPwqD8wknto8
         iAPYZe4GUNx7HMrJ5cmXR/gmllCiNacj564SRMCHKX/mHGPN7fkNMX+InWauPAZAxyLg
         QQ8w==
X-Gm-Message-State: AOJu0Ywleg7lyUIg1WK94ahSDUSDvg9ZA5Ini/ZtOg/3uC/rD467A84g
	PZxAF03LamCuvuS7ZFluQC1mE3YE69Jen30f8J4a16tIEOE2NHM8ZfNoZ0rAJAbODd7Ub1nKiE8
	3Vu7Dyk9cvXVqteaHxBiRkA==
X-Received: from wmrc10.prod.google.com ([2002:a05:600c:aca:b0:485:3a2f:2f7e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b0c:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-49036036692mr34346335e9.11.1779367584557;
 Thu, 21 May 2026 05:46:24 -0700 (PDT)
Date: Thu, 21 May 2026 13:46:11 +0100
In-Reply-To: <20260521124613.911067-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521124613.911067-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521124613.911067-2-vdonnefort@google.com>
Subject: [PATCH v2 1/3] KVM: arm64: Fix meta-page unsharing in pKVM hyp tracing
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_054627_563658_02CAFBC3 
X-CRM114-Status: UNSURE (   9.03  )
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

As the hyp_trace_buffer_unshare_hyp() function name suggests we should
unshare all the previously shared pages, otherwise we leak hyp-shared
pages which won't be reusable for hyp memory.

Fix the typo by calling __unshare_page() on the meta-page, ensuring all
previously shared pages are correctly unshared.

Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 8b7f2bf2fba8..06805b426101 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -189,7 +189,7 @@ static void hyp_trace_buffer_unshare_hyp(struct hyp_trace_buffer *trace_buffer,
 		if (cpu > last_cpu)
 			break;
 
-		__share_page(rb_desc->meta_va);
+		__unshare_page(rb_desc->meta_va);
 		for (p = 0; p < rb_desc->nr_page_va; p++)
 			__unshare_page(rb_desc->page_va[p]);
 	}
-- 
2.54.0.746.g67dd491aae-goog


