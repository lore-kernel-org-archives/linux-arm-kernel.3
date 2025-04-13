Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C454C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 20:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Yy/848/baLEzkw8qa5zoxS7nq5QkNFAJau0dpZhAiE=; b=026Dd5Poyzi3OMwuv97PCqiOhW
	Flb9G056iGqRtwRAr+MvPzRBVVz3RRaRZwHajKQpnrckWYgY4E6+/phNdqw7mLjwuwTT0vtOhsdKD
	fatmE7GEKtkt14XPbco9k4E2ZtVpIXktmQvdGIkJaoK+Yyt8NPu5GzWWGRB42bHL4OxYLYl2X64uH
	s3v649Y+ntJM/IrgptvPBOqvSDSZJpAOgRPJ/B2y3CorAk6lPS9bPp/flB23u/t1Uv7moThpl42XS
	h5Ahiv0oobBKSl33LLWfumnd7bd0hubaxP8uahlr/Q17uR/LufvsmJT3bEoe4TJLC4AZ5tM3bbmwf
	zL1uJjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u43Wy-000000004XI-2p2G;
	Sun, 13 Apr 2025 20:02:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u43V7-000000004DB-2TgQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 20:00:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso39323685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 13:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744574419; x=1745179219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Yy/848/baLEzkw8qa5zoxS7nq5QkNFAJau0dpZhAiE=;
        b=pvcu3R3HGS2v/PR/QeL0vFqw/lb0UHaTn7mE0EioNdlxQj0kR4JMSDOiDPIRbOefkV
         irCdYSFwPMNBU1dPFb3YOgr0AOwTu28mb++TnZGhMOF7UObt6EWgNZe44hca0GsvUCvS
         ni27q9BRMA5WEXO4TXtQtQf02IhlPoDSKX8iY24oYxZpiVKRjp6nxp9FfesgEJdQBevM
         Ca3n4tpQRW1ot7qzgSRWHE+HFq1VXEZmQ/+eoTBwTUjZR4qmaRO7sh6MJp+3LS27Vz0F
         GLq3dhpuw+oZ7tQAMVLqvVZvcUXhyW3N40ITK2COsbMu3i/uUcb48bsZW6CujqS4vucJ
         3Iow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744574419; x=1745179219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Yy/848/baLEzkw8qa5zoxS7nq5QkNFAJau0dpZhAiE=;
        b=KtN4yUgeOQweZpV47g9JOFm1tE94Q+BqjtrV/L9zXSwflBgQOeP3IDPFAgwuPtXxVw
         p0jEqAafK/bH68kpuzRtXxUmh/cWAqPkjUn5FzWs5XYmWIikzWSXX55AMxpBdccqxlbS
         9czpHc78OKomV8s//f87i6wtqTum6kPpmzCLaaFOj+5Wmx9Oib6KFvuKrDz7GlTFvupc
         cdNvpT1HZoA955wHL8nR/TSJGi5d3ZXvE18oJEnI9Wb21NC9t7oGNvpaR42eZeQJCwx0
         Y47TvFCQdQUpd80HifxrInnrFPRaDRdbVbZehjVFArgJUsLxIQmbHY3tuqNaJouTeQK9
         MPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOcV9WDZ0igDNybzU6arxJlwaA3VGL+XPJ+l44ybxPCUt/EbU43la3zjz3oxNV35qI+sHQ9xc86i8d5b6Tig4e@lists.infradead.org
X-Gm-Message-State: AOJu0YwCl+zbQ2Pv5qFAU+BsI50ggKBEDcJjh2M41l3rUhDWJMHNtKLK
	D6x7yIeVD3q8bDM0xxyycnCf1ZyXmz5nFmjaBaZRhJIvHviiez+KwIQ7Q14jhKk=
X-Gm-Gg: ASbGncsYSBL8UBXFc2i/LROtXPgLOZa8+fSFqiFWQhanhVeHGzinmpNXqZa5s47RzwI
	KV44ppE/PnrGi7pKLEFYu+ChANraNhFXykPdY8u9EpFcGg4+6CQ7RrHMzS7bcwHk21bMYwV7xo3
	Cfe92S22ykfQNTReoNBFCaD9YBf8dAg+nuRL02YkxP1kQV4uMdzFxijBMwAxOGEfzQlmfWKrEBm
	GV007AmpRzjxCVCPFXpgdMqZGz1qdThk6k4f5gqgf+1BE3ehmzSJQfguMXXqCwA+Yd+2rG7RKA0
	TZfYe/NwWNuch24EMfZXNOG2/MPRjAjnzU2j
X-Google-Smtp-Source: AGHT+IHkeeRojU6nphRcBzcpFgA1HGJWrqUBo0zw7NF6Zq4RRkjDJ2KrUAA7MSqPk38slZirAV8Kmg==
X-Received: by 2002:a05:600c:3c82:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43f3a933b99mr83516875e9.7.1744574418483;
        Sun, 13 Apr 2025 13:00:18 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:e852:1f2c:a4b2:8e89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce0asm8810540f8f.70.2025.04.13.13.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 13:00:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	theo.lebrun@bootlin.com,
	Chenyuan Yang <chenyuan0y@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
Date: Sun, 13 Apr 2025 22:00:13 +0200
Message-ID: <174457440296.11196.17152391053685137943.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250412193153.49138-1-chenyuan0y@gmail.com>
References: <20250412193153.49138-1-chenyuan0y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_130021_890271_A40A751D 
X-CRM114-Status: UNSURE (   9.87  )
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


On Sat, 12 Apr 2025 14:31:53 -0500, Chenyuan Yang wrote:
> Add check for the return value of clk_enable() to catch
> the potential error.
> 
> This is similar to the commit 8332e6670997
> ("spi: zynq-qspi: Add check for clk_enable()").
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: nomadik: Add check for clk_enable()
      https://git.kernel.org/brgl/linux/c/4521e0884c261fd286c02da942e9e8596bf2e7cf

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

