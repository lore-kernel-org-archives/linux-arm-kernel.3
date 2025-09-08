Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C8ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mf60KEpOtYo2ftzrTueGZy7sJLq7dX4TNfcH1iOJbrQ=; b=GSr1UuMIUIPDBAjOsRhKUtkuLD
	4dsBGxGVzkjULG73Rq0eQBCpL4vT1rrP8/tJHSk9gNMiDDfqowX6kLNoU/JP7+brWjhXelX8aSkMz
	bRzlOA102v05SgdBHU2qE6aZnB6ISNwLU6NDU0B94xJdZIw8hMhVORu2kt8ZmsEEzqigsWD473tz4
	5YvUOGKxgI6veqP4ICF/nYLsqvwQSPYwJimqfXkbeRmADz1PLgDRpRuwe2ghvTSUT86jiChtnKBiI
	R5FgB3XjNYg0WvyAryTPcTvckKi3Zh8MQxOK2C4P+2OESH2WaQ3MS5s9VMiFTVqDpi2Bj/ZORITue
	gk/FjCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWBx-0000000FFDk-43jW;
	Mon, 08 Sep 2025 07:21:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvW8C-0000000FDuu-0z4W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:17:41 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3d1bf79d7acso2340709f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 00:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757315858; x=1757920658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf60KEpOtYo2ftzrTueGZy7sJLq7dX4TNfcH1iOJbrQ=;
        b=p6IM2oXEA2/jz1Vrg7XUYzkCJiwA8YjTLEAnfL+Lm5lFTFM2j6k6XMbx9e6bLyRapQ
         MiG2d5sow1Y9nlUXcigyKh8wP0xsyDmkweGrT7+NbK5MfbPFP/WEHfhhaIVjvDpkXeqM
         cf0o1OU32GPnjVHcHRvKkL0g2UnhiPciS+oBkEHmlJm4v5tDMh0tmypwnziaAfExUp8u
         pTjFEHczElU18mP6kWGEEkWK2RrIJo+wT4F5I/F2Uu/jZVujXjxhkLNDW4b7c7N2YNKT
         zfYqCqmqptnPB1upr8B8xs+i5gLcGhBLWHq0Zr8ZhJ436H18hexPU9YO2I7WUZu8DNps
         W8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757315858; x=1757920658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mf60KEpOtYo2ftzrTueGZy7sJLq7dX4TNfcH1iOJbrQ=;
        b=m+paRXqbvaJALjISh7Y+tTADlqXiaF4q94jYAAnwfQBpjx29fo1mwvcrs+bRKPMXli
         xz9vrR18OF0FYdUxrcHR6zs0KM+sBW+De+yl4fX2Yc4RLvX6QRbShQXI98OsxrfeMLwy
         uUKBrd2ZKID5LZiBVtPt+u6gcySBCJBqnX3DR0tuExR4GZAUVz9aAn1yhvWW/PtJZvA+
         E1zvU+4RVAc1mbl9qmLaKJzI38u9gf07lpbzoJCbXekQH3mDz1TmXeqBLNPrXTI6EdNp
         j8Q4ZhWEap52LkciHt4VyWhPh+UJrrQb3fkEm1bmsYPH+EA009tavbG/ymv2YqhyDdZj
         QT/w==
X-Forwarded-Encrypted: i=1; AJvYcCUEdnQ99Qs+e5DauPXU698I8wOCDxdwcBQZMy5JS/tmktfnEvq3ShOmWj+MNm/6cdHHjRv2pKy3+/NsBoq6bUNR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy14AZws/snzQsR6juq8LbWUecPB00+9pe7DWDzaf5Jj1T9amFP
	kDHo8aExBov9NtKPb250wxKe6N+eZOb9xOOvUvk5SMsTAHLYkTtuM8TZ5xAP4TOvBNOsIOnosS9
	KcOWU
X-Gm-Gg: ASbGnctCdCZMzvyv+uGmfraQfmrs5Q9+wC3WJ/F2sNFsgT18R/VSpcKW+3RBLgESG2A
	ai1fr3rEBTDLIEqEyYTR+JYGQKDX3J4IXXw3Bm6J06hET2nSrFSCHWuTVarc8Cz3vpFRUfrrQ+J
	t08OSstj9wl4CaQoozK+Ia480PLZgTY0RP2ObRuGwOm80pFDnvIMNGCTMCK48vB9Sj42z9LmfQS
	BkMQ52sxz1QWeUMSWBfGHl1BvL7dM/mpfI6iOmEVww1uhfiRR7E2s5dEWIiulyFDEqAAX+ds4KW
	FiSH3z4icMNjQOOSZBUjSTjezCMcM6h1N+dWHGMwxD6iKvvD500t/LgiiiEQ7l0QjKQYPSII3un
	d3IJd74rhRDWn0O1TOMTkX8L8RMvpepyTpd8=
X-Google-Smtp-Source: AGHT+IH0JqpYFZVqWeKkKeYkUTLaNhia75dqiVhZQk0HOUL9KAlQ31w5rYSX1BpNLT/wUCE9UcSj9g==
X-Received: by 2002:a5d:5889:0:b0:3e0:6dbd:df8a with SMTP id ffacd0b85a97d-3e64c3b02c1mr4817342f8f.48.1757315858062;
        Mon, 08 Sep 2025 00:17:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5cdc:d980:b6fb:1eb3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e748aa8104sm2982913f8f.40.2025.09.08.00.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:17:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] gpio: replace legacy bgpio_init() with its modernized alternative - part 3
Date: Mon,  8 Sep 2025 09:17:34 +0200
Message-ID: <175731585128.11344.13482539951129166733.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_001740_514585_6E0C5C82 
X-CRM114-Status: UNSURE (   8.75  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 03 Sep 2025 10:00:04 +0200, Bartosz Golaszewski wrote:
> Here's another round of patches converting GPIO drivers to the
> modernized generic GPIO chip API.
> 
> 

Applied, thanks!

[01/12] gpio: ixp4xx: allow building the module with COMPILE_TEST enabled
        https://git.kernel.org/brgl/linux/c/b23c22a8d715e6f681381592db377aaabc1a2178
[02/12] gpio: ixp4xx: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/bd9bfafae0239f9d7187116dace6e0d80d27b678
[03/12] gpio: idt3243x: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/f21c10649acc15802e942ca6ae78cb76657a0639
[04/12] gpio: blzp1600: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/59b82bedbfe7452996a7163a9a19ff1239fb86c1
[05/12] gpio: tb10x: order includes alphabetically
        https://git.kernel.org/brgl/linux/c/76e61b03d1228914928eb57e55dcb2c62b6caa0b
[06/12] gpio: tb10x: allow building the module with COMPILE_TEST=y
        https://git.kernel.org/brgl/linux/c/682fbb18e14cbb47dd30d2c65053be9d8f39a23c
[07/12] gpio: tb10x: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/8bbe11bb2fa378016a7e764c6207f6f5360cc979
[08/12] gpio: mlxbf: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/fff086ebc554b8f7942e3839a758cb8e8dfc945f
[09/12] gpio: ep93xx: allow building the module with COMPILE_TEST enabled
        https://git.kernel.org/brgl/linux/c/74dcb9473054954fcd8b91f7155aba5af3e4d555
[10/12] gpio: ep93xx: order includes alphabetically
        https://git.kernel.org/brgl/linux/c/a685ac653958f7249e7503d69f4f3fabb0642f45
[11/12] gpio: ep93xx: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/ab61c8b6138f4987cd1cbe605d6cc698b4902aea
[12/12] gpio: mlxbf3: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/f3c19e70eb897544160c4b96b9ad6b7d921c9fac

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

