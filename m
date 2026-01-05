Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4AFC98335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GBZeQW3rLDeCb+Oyy+72B5gGlMwUgX2Swy873t0yAQ8=; b=SlE90ZcIyysJ8rhfXARjzEGMc9
	8/6LUB1KMIiqHwuGnRwpxH7X+7L9RJO++V3OeF9NLKCaxuDQ3zv29syn0LA37f3UQnKI3OWe4jK9u
	1OUBKKyYqX7Q0Ce39kPdS+03IYQ/LQHj8kaUefvF+qtA2obDckR5Br9dhpOBneg9h83FbnSJYOrCx
	zrP86GTAQXDpjhNttKUmfWxm56EmNCFSlBLM/WgK0qyWyfnqhuUgDch5vL5Q2Z7/URfA9M1ihlQHs
	f8/RNAtUhJkaqkdoal9Ix+QRslB1Me9Zp5OkTjWLmGafYi9CPJfEQ3i2yP0ytJ9UpA0D2dHXhkC0s
	6LcxEclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUF-0000000C4PW-3Yxd;
	Mon, 05 Jan 2026 20:47:35 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUD-0000000C4Om-3xr6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:47:35 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b727f452fffso338284066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 12:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646052; x=1768250852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBZeQW3rLDeCb+Oyy+72B5gGlMwUgX2Swy873t0yAQ8=;
        b=kHX93APjzFvnkMVKDTsuwIplw31vWbDjWAS4MLhgUVoxisnKEGOpGOZja7HSmGZBE5
         PSZZjJdN3asyrHCc/8vl/IuoyNKSZrdiCRbRdnxeEUzEM9hRz2cc2g2WKtDzst9rABgk
         nE6k5g4XCM/udy9ATdupuhNP6FsrkJ+w06lAcib0QqW8XN7vht/VZ65J5VMM69dusyx7
         QKq5QDnuGL33aqpdimI1BUc5QUjJr6mp0wdoj2pI1bRUGYmqloGS8sfP0krd+5YKnkxh
         Q1lwRTXnp9ImP2hJ9U52ap9eQ4Rf5s2Tt+OFHp/HaoVw0AzrSdiWgoQcvSUTTuOnXvlj
         7wjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646052; x=1768250852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBZeQW3rLDeCb+Oyy+72B5gGlMwUgX2Swy873t0yAQ8=;
        b=lIpbQg3RgxSe11cuGcD+tBH0b1rMYF6yPPX91/YjgniE2PIxMufsCP9ACTwFmKINYC
         TcksAcT91b7eVqDpFBUanr4Q2yG/pHriAjEoDEQoakxUHegrzcjAVOBKHE/NjIj4sgfS
         j31kZDEnwMGZ3TwET9HsnZl2fiKRza+tKpFFO686SA+3bnPJnE7/3fp7Z9aGsMyzPk9y
         twC545qjEXtQZRLob2VaOPDFs+nOhzRevDV5lpL5iZtUeoov6TKgUf/xmDa7q8DLZWso
         ukK79o5nwMk/741uWtu+bmIZ1MAqyqU3pgYm89An3Dw2nEyPVwntxntBe+CwuPu7VW5B
         I7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcYS5+1Or4K+TyieqdsBNdX4WwyAgaiayIiaePDz7jUILjG5E17pfkLi/dkr9Vi7xkjzlkh+OFtL/1YTrviEbf@lists.infradead.org
X-Gm-Message-State: AOJu0YzuRU+uhOS7XKZA7Js48p5HU8Zcwe9iNFMtjG3E/rCVYTf4hXFx
	6RJpmyUVGaQvlAoCYMrPnpnAPh7gnZlxh76f1oktnvRJlakEKSgE/pvx
X-Gm-Gg: AY/fxX7B51O9g/4jNXQuS3j22MOuQR5Mxmi0DDQfk0V1mPZofYRAOIo1Lc5ylpy51Yv
	IktYOw7+DHqBrSHjxh3LsQ2QfZ11bApI2Y+QR/DEFlnpucrdaAHawHZzrTotPvQ1H4cELFNBQcl
	veN1dabfj5fYiYb9A6a4dXJu0uC3zZz8AytrNo86T4uTF4e7wSTvVZ+hLaYkmQq2Kh3uqrd+43q
	lFCsA19CiXWegWAiBffIXd2YFrFZyX96silaORdlRqdKP9E/jhMlQoJc3Wxn8KdrJgE/N++KREZ
	RO8rojRmPYsVOjv7hW7rcb/cKp7vY9L0jwzYNAcHb85eRHpWpWcbKbYTZjbWODTTPCXj2qm90Gp
	B0M9c0eXvE30tm+e47HViSNQR+EcDBscL9uTiJ1w8ICiyDfPRkzhu9i92pKDWuXJpNvZt4eRFx0
	U2TD3RSgLM2Ykp4c3BK33rdo3x/b2s3f+rZR3U/rZ9HE1YWAeWsZ9Isd3E+LLdV4LKXVN79pK8F
	R9sJiod9Ozd524bX/UiErCkJQxtUFWy51oQ85hJew==
X-Google-Smtp-Source: AGHT+IG983985xcXDR9yciOy4mjbs0yhKZ2yFQoVEgq36/qbmuPPSyYeCXHNkblnpNi806zQM2DtvA==
X-Received: by 2002:a17:907:3f9c:b0:b80:3fc4:3762 with SMTP id a640c23a62f3a-b8429892021mr46330366b.1.1767646051708;
        Mon, 05 Jan 2026 12:47:31 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:30 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
Date: Mon,  5 Jan 2026 21:47:07 +0100
Message-ID: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124734_023707_619B9E3F 
X-CRM114-Status: GOOD (  10.47  )
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

Hi Jerome,

this series contains two fixes for preventing HDMI PLL OD /8 on
GXL/GXM and G12A/G12B/SM1, like the downstream driver does. See:
- downstream GXBB code: [0]
- downstream GXL/GXM code: [1]
- downstream G12A/G12B/SM1 code: [2]

I have verified this on GXL (Le Potato) by setting HDMI PLL OD1 to 0x3
(which should result in divide-by-8). The resulting frequency reported
by meson-clk-msr is double (meaning: only divide-by-4) compared to what
CCF sees.

These are not critical for now since the CCF code-path for the HDMI PLL
is read-only (as drm/meson directly programs the registers).

Additionally there's a cosmetic fix to use the HHI_HDMI_PLL_CNTL3 macro
instead of calculating HHI_HDMI_PLL_CNTL + 8.


[0] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_clk.c#L505-L627
[1] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_gxl.c#L501-L553
[2] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_g12a.c#L671-L721


Martin Blumenstingl (3):
  clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
  clk: meson: g12a: Limit the HDMI PLL OD to /4
  clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro

 drivers/clk/meson/g12a.c | 13 ++++++++++---
 drivers/clk/meson/gxbb.c | 19 +++++++++++++------
 2 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.52.0


