Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF837E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVVIvwMJ1kFj7ARNI9PQB5xeCct+X8ALPUkf7yd8p6g=; b=YqZlk7eYw/a/GHVKJDbvc0L71Z
	XGaRev9VtiM78lH4vIZ7WXl/daWMvHF3tYLvwnS2RgoxfxsWfEI3MaWo/hMCFVVevPrzm2qDzAqcV
	W4NeBKyQhliTChbr3PKGP/e+qb3H4LVK8MivltpeyJbj10Bt2ogpoC2bpxwr6jhIZ0whUjLR6VcZC
	v2wioHDwytrdUzt7kxQzn+U/wCkJZI4cNhT+NnzdhQeFRC0W3MKbI/ORsTCEzKcCFe71PcL48VN2V
	FrlP4fkrLPdNDlj5jaHlXuFy8wYmdiv1ebDzx6uITZZPww5DNHznn+MgrZCWQGDZfQ5tCgyyddzjB
	/qH+PuFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5zF-000000048ul-2fWi;
	Tue, 07 Jan 2025 09:34:57 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5wA-000000048AG-1zq3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:31:47 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d27243ba8bso28856531a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736242305; x=1736847105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVVIvwMJ1kFj7ARNI9PQB5xeCct+X8ALPUkf7yd8p6g=;
        b=EZq/Y/ns9/kCwXRoWqiz++nXhE/8JSGM3IIHqajEnGvTKS8YOBdLbio5JcEJxWvHv2
         VGW7RrpxTztN4hp9bbs3P4dPfbnpqb3KK2BJ3kZV7LtLRnYYC4f8oFiJWEgheWiRZp/g
         PsVDnExMWgI4nbbF6l88sbtBWxCywVH6iZMDXgohDWIqFkRKHeGclk1Vgy55Raqkq9Ap
         4cHaPP7WOpFaoBVc9jgmoiFA9+M2ntBGF5DGi1Ys+JtQjeK8EIIx0cp2gOZpONpLy/qO
         JVB7/xL01Zh4txnn8txcpB10mCV8+CcNVyp9vIOsq+i8QHbA1CYf5l4OSz99eAgJtkCy
         1jRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242305; x=1736847105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVVIvwMJ1kFj7ARNI9PQB5xeCct+X8ALPUkf7yd8p6g=;
        b=VkfKxLTWaYLAII9XsJUmlmBsP4RixFqnP1yyYBUwe56P9KDefRTQcUHwKJEj1sZt1T
         HGDiZhq24Do6En/Izw7dZlz2+BR9icbuiFvm2G5g0rhOSiFOnH91WCtL5+cFyPlEmHxY
         WxdYAYJvajDvTl02Fl7gORq9clzOec5dH/1sphNIpPdKot3b/4CXrxS0nYQgnVpDe2q8
         P9pkM+wtLoS4i7Nk4QWqItbiNSw8Ww3LVFIXN9ZLUUlr63HXjIL0C1/aJh4pWcgBypb6
         Xk3QBzZ7HHMPjNK/0Ok1e1UW0x8u1Ilxtg5flSvfUjub9jkxN74qdWD6sfd0TECFD+8y
         u1eA==
X-Forwarded-Encrypted: i=1; AJvYcCWVCQqsgYmmMtaNuvB+VPf923LLBpipKrWBNCdehCoWUIe9iRh1h8ntY1uUNrCTjua6CtMd+rAZhgam+g0jdQRu@lists.infradead.org
X-Gm-Message-State: AOJu0YxKw0GSPnKBH3cY4OncPGMp/m+tydLz5wcJSx+1m6RA0wDcM29u
	BGbTWZ1TV71CnPaSmA0Z9/Fc80JgOioTKzVnxIAQoayfEJ1y7WP9I3mv/A==
X-Gm-Gg: ASbGncuTgbUffqaT4T89CHHkIHou5zsF+k5yMCwHFs9mZfT2qNol6hJyfn/wza35uo5
	lQksU/L7lzAAVvuq7ZuRLimuuIythf/4c9W2PFwKvaCsm2mXxvEm2lrDaVmDIbuM6kibQOcnKek
	eCXTSjhpnzStsuJHWhvg6X3KimbpxdBk9E3GDHV3xS0XAf/89VQWaHwDCkk1R8Hjw76eIeI0I12
	tbxoOE+JedT2PJGXNqZwuss1GtBNP/23FZTUhlAR6WjgbXGurTthVI0bDNGnXPB4xQnzkQgQMB6
	NXmcP5b38IF9NKETay6mtiKA2g==
X-Google-Smtp-Source: AGHT+IFxd3YBOxk4ntPc+MGfHTxmMyeBqIw3Ey/TIoViFJfaz0wCgI08UnQ4BfUpSjzeL2SymnOtSw==
X-Received: by 2002:a50:cb83:0:b0:5d9:a55:810c with SMTP id 4fb4d7f45d1cf-5d90a55817emr12774693a12.5.1736242304417;
        Tue, 07 Jan 2025 01:31:44 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806feddfasm24976300a12.58.2025.01.07.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:31:43 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 07 Jan 2025 12:31:30 +0300
Subject: [PATCH v6 1/2] power: supply: max17042: make interrupt shared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-b4-max17042-v6-1-3d0104ad5bc7@gmail.com>
References: <20250107-b4-max17042-v6-0-3d0104ad5bc7@gmail.com>
In-Reply-To: <20250107-b4-max17042-v6-0-3d0104ad5bc7@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736242298; l=1245;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=OsA1dEJLjjYZ2BIUPRu/DSyAQjTWyqdaRkl5xknsg7U=;
 b=J0dWnGbnmiouoiodH/YY3fMMFLG4B8Gx/vWl0yc/WZJl8KQeP94ZetXT2O/N9KE1/fYvk0BB4
 x1EvIJYj6moAFniEnk39u1QMcPvRqdk7vkeILsipJQhrNpB8Lnhv7v2
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_013146_518355_7CDAED1F 
X-CRM114-Status: GOOD (  13.41  )
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

Fuelgauge blocks often are incorporated in bigger chip, which may use
only 1 line for interrupts. Make interrupt shared.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- reformat commit message with vim 'gq' to wrap closer to 75 chars
---
 drivers/power/supply/max17042_battery.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 496c3e1f2ee6..99bf6915aa23 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -1103,14 +1103,7 @@ static int max17042_probe(struct i2c_client *client)
 	}
 
 	if (client->irq) {
-		unsigned int flags = IRQF_ONESHOT;
-
-		/*
-		 * On ACPI systems the IRQ may be handled by ACPI-event code,
-		 * so we need to share (if the ACPI code is willing to share).
-		 */
-		if (acpi_id)
-			flags |= IRQF_SHARED | IRQF_PROBE_SHARED;
+		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
 
 		ret = devm_request_threaded_irq(&client->dev, client->irq,
 						NULL,

-- 
2.39.5


