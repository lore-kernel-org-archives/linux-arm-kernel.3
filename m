Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0028CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXemVp+XP5C7K8PhG6mE03zKRPQX07LLYcr9/0qBaeY=; b=nq+HAkZAoIOTCl4O/arkjtZWgr
	r2dAbORJfsOmZ2O7IR1dAJmxTN+EvxniwzqQZQ/DeYaYcDRWFlbwVyVmDSS749NQGu/nPMjLcpeD7
	am3EEhvuMoffh0R8IILfnrs4Vpa2wW9JAbpZCIDcF9VBPHDmtaVYapXO+/RCx1tQEugzxH0PVZQ1S
	h56h/2N/+N81CAtqaHEJIfCrWi22hYPKzdoA38bildyQMkC/VbYJLFDEho2kP64ueLf64hwmxdm0U
	LlSpx7AJaW6mdfLA2a/ClOyap3CP+MUhDp4bG0SPo+LoPrEeYPPV99j2aOqOGJnXo3fPO3tOYlhMD
	D5Boq6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh8p-0000000BWBi-3Pvn;
	Sat, 25 Oct 2025 16:29:19 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh8o-0000000BWAn-09XD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:29:19 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4eb861a8e66so26158221cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761409757; x=1762014557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXemVp+XP5C7K8PhG6mE03zKRPQX07LLYcr9/0qBaeY=;
        b=NtkdRqQHLpN5eSPBm8LSZcQzVr51SpPCilx5mkWSsTY/4OZyNTK7Cd7s6vlDVt8jSg
         R0hyKB9425khcerLbO8dm2NmENJhfFNSndFWsZYARPvLMMnqpTw9FNaIwzaS/R+zLFLK
         ltVT+gF45T0X4qCVaZTPjcgjaVSjOtH/6CM7hY1GydPJLY+IYwfW1cMOQTt9nw1NAGXa
         vOXP4taFNgxKGM4q+Kc/jA3ii+Z+i6vW22N+X53Wtdw1u1TOXOD9Reh+OzzD7L5jZ2+B
         Z4Vg20Xo8MGiQ/n4DLvJg88VESNATyp2BbUSQ8JAUkqZy8jditxc8GY3IKVFppkXUh9j
         2TDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761409757; x=1762014557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXemVp+XP5C7K8PhG6mE03zKRPQX07LLYcr9/0qBaeY=;
        b=V8CyRfuLgXfHtQXK3jB3NVcV2vxfuFkhlXGBbIlQRsq4jYF6iqwFGKUpaj4EZu/NSW
         n4o+wKdlfZomZMykO61le/4gOHOjty04az86OlZkdp8k7xwZylHpvJjkLV8Gy/bPn77E
         D9fqH/8nIcxbCuiJ/Uv4o97c10ialAiuKdzU7NbPSzKtax/9jRBgNzKbd/CLkD6fGTkX
         EOHrq4TdlKNlXRxXYQotSav3BIxdrJKjvagrNKJX+7ORlHNzc6GZLYEUxnWugH6AetEK
         uDNqGWtU0cFzjkQDEM9sKApsdilA4xBGOO95ZtPMVbirJ5+LVWZbefaNh0eLq7F94kVi
         mixQ==
X-Forwarded-Encrypted: i=1; AJvYcCUytFgkIphC/qcILRWZ2SYmW5c6Rk2qHZeq7W/p2qmvyEVhzBPZ5youQ6xl37WIcoX1DSpLvrhvjxa3uo2X74wl@lists.infradead.org
X-Gm-Message-State: AOJu0YzGwE7xTGFWQ7qBAq4iTrnTEZq9mYWu2ymVpAKVia3YxiTVSEEH
	2GtvASFY59ZJ9iB/UzW/rxlclCNMupiYriSGeKFhK0TwQVxuCBVWweDe
X-Gm-Gg: ASbGncvafiga6kQivk6BXRg1OOawx3vH43KTuCgNolqt85pCzTkTjt3HRhc4zThL4Ym
	EKpM7nbw5WhhxO9xw3pxW2TqcbYKLPUbK4XyqTvmjLNjkNSAoxXh2aEIEXakvqToezEOlq0Z2NX
	IffoelfhbBPl+5hARxdXrdblLXjBFsEo42arV3PsjqyzV5soWm7uGquwv6ZzzVWSWafsPad6EqP
	whFcWxM5M8LKn0Oe4Y3CulQAhhDa8ZYchc2ENyCrwotS+n9hy95MukigkdzsTVKsz5y5TCgfxqx
	05w2TL5i4zEwFXvJeR3Su0uWJ6AMYO/q8lEt5OpYiDWM1q67cBR+97nKEzGXI16wazzg/7qjl+M
	Kcsw2zWo6SxF/4iks0/vSK9nL3km5sYNUg2zYEa5vcT99luroHWA7iwnb1hkx1aQEns9uIgGP
X-Google-Smtp-Source: AGHT+IHpyFrHKiL1MaHe1LWs1dN16AdeBx6FjJoNTEhnZ8XH3TR+6NumbQnfk6ta4v10mj6oyfvxsw==
X-Received: by 2002:ac8:5d8a:0:b0:4eb:a8f4:270d with SMTP id d75a77b69052e-4eba8f48ad8mr17559461cf.65.1761409756596;
        Sat, 25 Oct 2025 09:29:16 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f25c91d9csm170613485a.49.2025.10.25.09.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:29:15 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 06/21] mfd: prepare to generalize BITS() macro
Date: Sat, 25 Oct 2025 12:28:42 -0400
Message-ID: <20251025162858.305236-7-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_092918_075517_D8AD9A1C 
X-CRM114-Status: GOOD (  10.48  )
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

In preparation for adding generic BITS() macro, add an #undef directive
for the existing BITS(). The following patches will drop it entirely.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/mfd/db8500-prcmu-regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/db8500-prcmu-regs.h b/drivers/mfd/db8500-prcmu-regs.h
index 75fd1069372c..25d2d5966211 100644
--- a/drivers/mfd/db8500-prcmu-regs.h
+++ b/drivers/mfd/db8500-prcmu-regs.h
@@ -12,6 +12,7 @@
 #ifndef __DB8500_PRCMU_REGS_H
 #define __DB8500_PRCMU_REGS_H
 
+#undef BITS
 #define BITS(_start, _end) ((BIT(_end) - BIT(_start)) + BIT(_end))
 
 #define PRCM_ACLK_MGT		(0x004)
-- 
2.43.0


