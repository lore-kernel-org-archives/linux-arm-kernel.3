Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743EBC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAqNzOFflinZMwWtXBZIkd7G8+XaYao2cwGX1v4/ej8=; b=04+1VX+GwmvnHl0/lmZsaWMu1g
	NFhhzcdlkZNsbwTmnQhDGmnzJqisu7/aKUwG3jyPDBpMFnH79C6BrEMhAb0OjVUY3kgbcwyqMxwqH
	axTYF/ei0jfKZYIakz1B8DzuF29TgiFuAclBbNebBKJUqvX+KQYOyGHFbVGeBwLqAx4YuVnoS1DH1
	pE/hyN+6OjbLVqzI38HF173t8s6Ocl0YLMRlUzvIs0vs0MWkcCdoDn71gz27TmLnsGVI1pHblER3u
	bOP8QqZq4F8YIwmaCFfEi9o3ktW4qVs/uRNeMRdoUQ+z436FRf4Nr6idhd/MZbQpKEhcczy+TZnF4
	rH1J0Iow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRX6W-00000007Vmj-1z29;
	Tue, 17 Jun 2025 14:16:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWci-00000007P60-3hyM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:45:14 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a528243636so3252163f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167911; x=1750772711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAqNzOFflinZMwWtXBZIkd7G8+XaYao2cwGX1v4/ej8=;
        b=I5BiHVjt9NKLNVPKGR1lAIFlTkQYfYnUwZvg6V77LuYBrVzLTGrlesmtpDOxpEZbti
         1JSvnP13ejYHGoDrK5Rw/Ia6WTcTx0DZWZC1jfrGON0/pGNedcExYy0Wa4/t63C5S58N
         sJcfpmuNQPxNrfG35GGHZ5Mic3jS53v9u7f6UtaIclY6ysu58fnTfOFaEM+W1VMt2dkU
         kYpD8357UfT2STUifPoqPOtH5+c1h4Aywwe1kNeyZI9499ceXGNkO0TNPCieDyAbH7nc
         MtF60thnqzeWByT2a4ywWeXsUPbh2W+qcFvC599xeSGZfutzUiSXb2V+qWJOW7M9HawP
         XD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167911; x=1750772711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAqNzOFflinZMwWtXBZIkd7G8+XaYao2cwGX1v4/ej8=;
        b=kzmDWT5k2EWkw8ZxcO86r1Cmz+sq6dPhKirvgi3pgoHuqE8ODWYkOTm7ma7Mr/cQ8f
         6U+VEkyc89pD4GEvMS+SJmPd2SDN/4JXbrJu+w1EUGgHbfLzVeLtGwACeHf1OIYE251B
         C55ge9cPpL31LRsl3BmUanbo8/EaPxXkBx+PPGtsc/9ZG8SE+WYMerMMSqtggjB2xMwn
         wA34ZB6m3wm+bqKg6nd0AhckkORl6Ok0mpajY7and51pnnVQovPAs1vpbuelGX1GMmI0
         KLfOaPeARIpe+HUn2fkcQFdpXYsPwMpA8VuqyNPmNKmIt/SH/GSQPgsa/zkzBijOMhid
         eW0w==
X-Gm-Message-State: AOJu0YxSUSSQH3jEcgohkJH3/850yL1LoK5xcShZ6LMztR5Rbw6IXPOB
	q606ttYN9enELJRGN47iFoWBvlKAQArdSjHaK80RuCgCQOXV85makfyV
X-Gm-Gg: ASbGncvJu8Ntt7WnvdGH7LgHIPw89xAeyFHxgBqJl5zES34GRH4sxaB3aHYsMPPKzRK
	UI4IaYRCuZXRYzeENcuQ+sR/aRqzvQ0Jp2GrDcyNOOzeAZ/ccKKnOuGh0tJJIGI2p42QnboKr5g
	swvboOsPrZZoyNDbODZ1qCfk/Zr6KvSjW2kNHO6T1s3telDcYydn3matRvVbqAY0Q9eR7AICosQ
	YzlABlhPaENLR0jF+IZz6iyRyTCss0NWfnJeihiynZw4cQX40z7c+2d1LPibnUnAbelSZGOGMkJ
	3yQEtOXpwvVIc7ajfmU1Oiuq8cJawiEzDfwxHgB9IgkJj6ic78rQIgSCr1PAD5YF4F7H9csNmtz
	64P9dIjteoXI=
X-Google-Smtp-Source: AGHT+IEIBy/qhhThKzZjZs15iuzXDn5mHLJsctTHGEcXER4Z289sGD5otxtVYLG/NG91JzFkXG6SQw==
X-Received: by 2002:a05:6000:420c:b0:3a0:aed9:e34 with SMTP id ffacd0b85a97d-3a572e92ff4mr10040312f8f.48.1750167910898;
        Tue, 17 Jun 2025 06:45:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 4/7] serial: sh-sci: Replace direct stop_rx/stop_tx calls with port ops in sci_shutdown()
Date: Tue, 17 Jun 2025 14:45:01 +0100
Message-ID: <20250617134504.126313-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_064512_922503_B69DE1C4 
X-CRM114-Status: GOOD (  12.05  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace direct calls to sci_stop_rx() and sci_stop_tx() with port ops
callbacks in sci_shutdown(). This enables the RSCI driver, which reuses
the SCI core but implements its own stop_rx and stop_tx logic, to reuse
sci_shutdown() without duplicating code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1c356544a832..5c4283ce542d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2289,8 +2289,8 @@ void sci_shutdown(struct uart_port *port)
 	mctrl_gpio_disable_ms_sync(to_sci_port(port)->gpios);
 
 	uart_port_lock_irqsave(port, &flags);
-	sci_stop_rx(port);
-	sci_stop_tx(port);
+	s->port.ops->stop_rx(port);
+	s->port.ops->stop_tx(port);
 	s->ops->shutdown_complete(port);
 	uart_port_unlock_irqrestore(port, flags);
 
-- 
2.49.0


