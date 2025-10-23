Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37931CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=; b=mtkOUFP8JJl3I6RN2q++Dx9qoy
	3+cs+HFxCpQBSP8UTBajY5KzBiEYOLOI/FtEKcoLA08LIR4oVaDnLorkfULnVrQOape2fF7dbK9tX
	T2NASQLosioVihS2PgvzdK5Sf2H7zBHTeazNcM73Fn29GMoGJEoU0m2WHwMU2bTANtyoswzQqlE9I
	BfyXKRCA7tApX7kap8U3jJWS4fxqmMBPhr9ez12QIaMKNeNYmHLVwb1c+005HXFZtrKicMSlhKLLj
	Hx+dqqfDYHXybfX/mbv2V2H+U2cAFSCdBpvwFeB2dEJs5BMKf0l1o4y1LRp5xxQle+b7NtJrTEbr3
	c/XRxXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2Gt-00000007ZIb-2eGy;
	Thu, 23 Oct 2025 20:50:55 +0000
Received: from mail-pj1-f74.google.com ([209.85.216.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2Gq-00000007ZHK-1AkY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 20:50:53 +0000
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-332560b7171so1933220a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252650; x=1761857450; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=;
        b=3TBx6iJOducUyqag+YTO0Md1FnCe4TREIzzeocTmNKIxSG1+R+yqKSo6RMhZG2Zq1g
         0Rygv0cAp625rxmPH8YtJ4raKVip29TYfP0Ht6OiMyASlJneccn+YdWoKY0ZAl6aoxCe
         MO5oGVfC+a6fGzKs7fcCuqYTUCN9vnBnVPVGWYXCF5b/Mmcjah3k5x2cNWrm0y8uT36S
         h/624znq7QnitNSNeTcz+r0hX6XTUQEOhbJQYdkUcpQN+I0RcjGJjiUhkr/jHvvqOuOl
         b/xp5SrgbeHlOzObAhwzNhjuyWfQ8MuomKyS1IjSr0w+lKt/nZcG9d4T42C62e/TVPgW
         J5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252650; x=1761857450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=;
        b=sqbOrd3ZRMSqv+4Dcl70oUhnaFuo2Iz+wExU4tDMlcPwgHnrDqqIorMrwygFPRgVIa
         /xW1zdQpTM7vnkApXYBbC2sYa7Io0Jtf/g8lbcRkzD53fVVQTR64bMhVdt/KAsgNBDec
         Iq5S78OosZ+Rp9CdRPgrRJBVSRffubL5KOmJrbXgjypPRMgHYX0gjUdPZoWLwSusUhYO
         jAuXAie8CG0n+QTHPo5AfAR0mmMYKxzOVn3erQTNqIwnT4bWci3eNloXFxf77jOrmZqV
         QySeDrVlAmeArioZ+z1vrchJBx/B0BZnW+/WDOWGm4m4C8k5/OJYIPTc0Yz6I808T1Kp
         kKvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4RWC25NBKslzl+wSkfNT/zffQnAt2WLZKN2H8Jwe68+m9W1nLc+WBJJTx6bPgVInJ73JqRUhXIz3+y7ct7lht@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz2TzDXjPXmrN1Y9INTJ6Lsm0cacq0DAS08tbZIGmCUSjGPUKQ
	HfoizBj6w/A0CoZGOkw7xmrv2oH4T7cJgyqhe8W6S+o9GST8jN9AOztNd+s36pYRoOmNYMkWhMi
	24OtO7I+dgKkQdLUerE2yFQAF90/wvg==
X-Google-Smtp-Source: AGHT+IGNMg2DMCJiL+F+pPhnBIlXppfMVHZRBUW9I2WIAEdbh06XGL0yXf0m3s/lwp4/2Oi/pJT3D4KTbFExW6OHopg=
X-Received: from pjih1.prod.google.com ([2002:a17:90a:5801:b0:33e:28eb:7df2])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5490:b0:32d:e309:8d76 with SMTP id 98e67ed59e1d1-33fd3bbda7amr336959a91.10.1761252649957;
 Thu, 23 Oct 2025 13:50:49 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:50:27 +0000
In-Reply-To: <20251023205041.2027336-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205041.2027336-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205041.2027336-2-willmcvicker@google.com>
Subject: [PATCH 1/7] ARM: make register_current_timer_delay() accessible after init
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Ingo Molnar <mingo@kernel.org>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Hosung Kim <hosung0.kim@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_135052_385554_5E62C7D5 
X-CRM114-Status: GOOD (  14.10  )
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

The function register_current_timer_delay() is called from the
exynos_mct clocksource driver at probe time. In the event that the
exynos_mct driver is probed deferred or the platform manually unbinds
and rebinds the driver we need this function available. So drop the
__init tag.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm/lib/delay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/lib/delay.c b/arch/arm/lib/delay.c
index b7fe84f68bf1..acfb87143f21 100644
--- a/arch/arm/lib/delay.c
+++ b/arch/arm/lib/delay.c
@@ -62,7 +62,7 @@ static void __timer_udelay(unsigned long usecs)
 	__timer_const_udelay(usecs * UDELAY_MULT);
 }
 
-void __init register_current_timer_delay(const struct delay_timer *timer)
+void register_current_timer_delay(const struct delay_timer *timer)
 {
 	u32 new_mult, new_shift;
 	u64 res;
-- 
2.51.1.821.gb6fe4d2222-goog


