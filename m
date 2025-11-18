Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570D2CEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K5Hp059A5Uei2IffQzjxZlhfXpudEyod1/uzyZ2qBEI=; b=LXnhT3IIkj0ch2TZ19VeN8aZPh
	Qm+DTuuuS+V/8uV6uB3+vVksveOoVpExTr9V+rNHA6cm3F9FjtEz32RkWzxrstiCO/qqW+9AuoPDL
	D64hk++G88x8Klnj7vU6yYyKxfGfP7IkUNymM34tvpret5L2yZwIai3dwz4bGbpB3orWFYD1IkwoX
	0/CTj/VzSX5fRgSHWo2xkPkRIhkmB0nfsFYshPoijeiXY3EAVqphM4JhgAwxzZUPj+Fw0lhXbfZ1+
	ie5TGBGrpe+XxFgImL+9CMm5HgUw4MvXdFGfWlDGYaZWEytaKUsfvPgcOAKKIMYmEI/QTs9OBWHO4
	AGcsXjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBlc-0000000HF8s-0QFN;
	Tue, 18 Nov 2025 02:48:28 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBlZ-0000000HF8R-2FE2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 02:48:26 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7c76f65feb5so768126a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 18:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763434104; x=1764038904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K5Hp059A5Uei2IffQzjxZlhfXpudEyod1/uzyZ2qBEI=;
        b=m1jzL660vUi7bHNkstU5eYOPo29+llwO5dmK/X6g09qWmVR1VjM48i8JQeXuvXGEcR
         vcf9375mz01lqiF+HoaIftNrfLZLDOQvoO5bBRssDJymDJ4vbRo8zDUwcgvgssjDqPHf
         JmZe542EeT82UmZIbn/J0JqJI/oRzutncN/uI2q1a6JWuLOBkEY1qBnntfdmzFRpLOOt
         v3cf/RHcirAwRKIprJh3+AHTyYC9yuStudU2kRl6TPdVcHm8ZYytQtzl/mpixSJm97Mv
         yI15yCgAHqkrSr4aTy8BZCVsTduMUhg1kMbME/pDKAvnzxkgepBmWaS0DW4XkEuPyUtG
         YKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434104; x=1764038904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5Hp059A5Uei2IffQzjxZlhfXpudEyod1/uzyZ2qBEI=;
        b=MiSEgg0g95sRB3C25HQWI6sMxcY7qJ47INeEjH40OyEmFXqFUrCLZaYrxw47cfrZmd
         DYkv+bqXBhNToVDg3QY3A8JHNxsJIhFzh5Z9Q995cj9uRUVTuAMpn8iIUzVRh+gwVW+9
         a1txRkktT1Kra7yoquzf12EfJRq4zzdeREaPbTSwIG4BBu0EDdBMnEExtIiLcNap2x6J
         asmKhMBnzltuZsLtiOXnT2KnVr3nRxVTaALLxqLfJOIIc68jcaSbrHHq6Ps3G1hnP450
         xP2kS9aT5FmLhzQYoV49y4DWuKIFqU57vdhRFj9agGhKoEnO1FjdWOz70swIrKpzksH7
         hfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU59d6oGYuyw0FSsIPCgKCVaUJyZeJwIINc7Nmsvcm82KEX8oHV2/mS5mpvZr9sIDO6IWA5bLzBaMqzlckwZeDY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwdxp9BMRVDyA+XVe6GrllLr1faIArEVa3aDbpQVLwwt+dlG/R
	t7BT6JTn8g87n4+ddJxrFc1WKTESKKRdvhsN/bilrYTWiFpZkwX+rDkAuQ4YMp64xTg=
X-Gm-Gg: ASbGncuMZcmN0iTCVgNCkdNusxLSj7TXzCQf0alLPBw5ZlITkZG4XhXd27AAjv9EUnS
	rmleXJX3+Ekje4tsg2Wg2tvCPaeeEzQTEWmVckgd45cNHQVVjVZXLvKQUyUzJzA8nKzXmCjGuEB
	DA03Fzr45jaiBqRCl4/gTcOacrkmfpilqEtM0wyynbmo0ylKqA0TIpN22Tv/QD2iErtERPV4FlI
	Z+tpsszUC+wU98PJxmZYn/iFzs/3MQfQU0UHPvin2It1hRrn+ji1PxAPLxstOeLmEn7D66lrVOb
	U+U9ajmdyleKVp8w7xlZhbrLPFNGsleqhDpnMCWhr4ScUsZAojcksq8UB7TIJ2yC/Gc6Qd+O8SI
	aZFlDL0jVn7sab0l4nQ31uVtkSVMQd7ony/aqZeegKVEBfub3Kzxv21HVzIwBwklVCsCCXVBRgM
	un++uq95oFgQ==
X-Google-Smtp-Source: AGHT+IFhHfyQKNAmkKCUvpiYWdk49opO+ptbcr+IJLwiDT8vc7L+R3s61PznZxMlKVdQi00cNS0QsQ==
X-Received: by 2002:a05:6808:2183:b0:450:45d3:a50d with SMTP id 5614622812f47-4509746132bmr7150898b6e.30.1763434104168;
        Mon, 17 Nov 2025 18:48:24 -0800 (PST)
Received: from localhost ([2605:a601:81da:7100:264b:feff:fe59:d7f7])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-450aadd23ffsm2501610b6e.0.2025.11.17.18.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 18:48:23 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] tty: serial: samsung: Declare earlycon for Exynos850
Date: Mon, 17 Nov 2025 20:48:22 -0600
Message-ID: <20251118024822.28148-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_184825_594038_0E4B5451 
X-CRM114-Status: GOOD (  10.61  )
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

It makes it possible to use just "earlycon" param in kernel cmdline
on Exynos850 based boards instead of "earlycon=exynos4210,0x13820000",
as described in [1]:

    When used with no options, the early console is determined by
    stdout-path property in device tree's chosen node

[1] Documentation/admin-guide/kernel-parameters.txt

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 2fb58c626daf..c1fabad6ba1f 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2830,6 +2830,8 @@ OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos4210-uart",
 			s5pv210_early_console_setup);
 OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
 			s5pv210_early_console_setup);
+OF_EARLYCON_DECLARE(exynos850, "samsung,exynos850-uart",
+			s5pv210_early_console_setup);
 
 static int __init gs101_early_console_setup(struct earlycon_device *device,
 					    const char *opt)

base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
-- 
2.47.3


