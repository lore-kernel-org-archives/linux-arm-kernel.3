Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24220C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IWzsE4Lq8l2QV8yxJbGClNJbawPu4UbyHy7mtC5t8To=; b=SDEOtCkdG2JWk5UXOmkNzGyzao
	DkHMmdnLBCRtZ3fH5Wobwpo7SxJ8wCEjYc5q01aIPWISltK5eR8Ct+FKlK8MmlXcOI26i7s6jA3HW
	aRa/Dt8LA+5BUqIFqe2f9bF9ZQ6WgxrYleKO3Q/m+pQHZPhg9Qygl4QK6pJ9Wwd7Ql1v1jRboRUZm
	QQIA+rTJIP8U4ulJGuare11NRVh83ubKqfrIxrWGfYjc4qSCwpKlcALlHemJJ9Mh/kM/f1ZncPCGJ
	qa1P6Kx7HI77T7YI20Zmu5N7Bkt2SHxzX2+eezIe66vNtR66yFuCdAylFwbcgyaYvK1M9OuHFaLsq
	Wv25S/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfG15-000000008v3-3Nsv;
	Tue, 04 Feb 2025 10:18:51 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFyJ-000000008YF-0pGs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 10:16:01 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso921178866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 02:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738664157; x=1739268957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IWzsE4Lq8l2QV8yxJbGClNJbawPu4UbyHy7mtC5t8To=;
        b=rtuoOG7W0fZgrKdysvJfGy2npIpQWrOcoq6s3Cd6yxxwwQXfwQzk695J05YfbiQoJr
         BtRniPtFVG/YGJT3UPs1dqKASevSqacE1y54fjaBptJKhnaXxurYVWsVYRcyh0eKW3U/
         tX+u1TSPJWo2JYoyXbwBQMnxsafI4u3dq2V63WwxP6j9yyHWRPGoGan8ixAkUd0ZskRX
         GTOOLLuN5lZFqC5ESpd+DZNh9/r75grdx29dQA2/ogexatlU7ir6yn+sb1DiCAHgbl9J
         4EHRHXJEr4ngiCCqPmjLLmK7X6SVPcs/wX1mkRb3XpbL6xU4QjF3O06cfGcYC2alK6ag
         UmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738664157; x=1739268957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWzsE4Lq8l2QV8yxJbGClNJbawPu4UbyHy7mtC5t8To=;
        b=a7tTRvDsUdw/bHbrWwP2NhQLqxE2Qr/vy6RyxxIq8f3xIxTG2tkyYdYq+0NragbnG3
         xjtYBQos2/b2mCj3xkF4TwxGea/Q7xncEjeDezckBQ73h0FMG75KZgFTHEtid1Ajglpq
         ikx5GGN/UEne5KFDtznSK4BwN7xeiTZREURUeUzdkCdxaW3LD3RyoQL0Jwi1HBuezdLR
         UycONFA2/sztNDqIMiDfaQxfxIW11KUMB/o24sn+umAxUgK8/QxZylwkXF8jAV3yhQFH
         4otoNU7XPff7OhXlpg4ek+jQivmdqp2BlwETMIat+DvvhJFVrgVVkq5zW/52gzpvz8XM
         wHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY82pgKvLS6oUhvfdIlHglW4mJBogt9iiZQ6poJfrVO/dyvTc9HRMzwr8eBsvD2cQ+RjB5Y4T+6GNnj7FjYkpm@lists.infradead.org
X-Gm-Message-State: AOJu0YxK2VAfmDUuCm2oZU8wgqiUT89kpWDpYYIlcBMFdweVvRz09FCp
	yap5ss01CValmjnEBgXQkitifKtYVyBT+6WkzEFg3Mzg7WRN+7VieJ3vJY4EOLU=
X-Gm-Gg: ASbGncsgaTKKstaynSO4ErmEFKVlsFeDobVWZDpbQf/AdWr8gnWWL4MRMl/owo8OP5p
	NeUxW0/8OKby1w7jx2drHbDAvfDpq+KkMXlROZUFzq6b2ZBGaYy9CsFwhvIb+dmo+Yw0B1/EpIt
	mPejPkZkBmOgHRkFvolIERhLWrBZ6I95hEAMgnp9tHkwcMY6/Y5W7AX3+zDq6pByvHg3O5Sn3Dk
	nyLJgN/NEZs5FXIoZGqYBHUn+OTDkCMiiqmEFeWqa4T84g8cObD2cHEOKeQwK7GcPA0j5RQljS2
	B3yIT7TuCXLtZtd0itPLwmXUbypNKIbCMWQ5no6rualFk0q9GiXv3NfmeQ==
X-Google-Smtp-Source: AGHT+IFGZ/qAd6VR9nvEmBZmJWy5U6aynPpSgzBtGAYBTtH7dvjRJals94zdqW3miqEi1CA0qhYS3w==
X-Received: by 2002:a17:907:94cd:b0:ab2:fefe:7156 with SMTP id a640c23a62f3a-ab6cfdbc4f5mr3049912966b.43.1738664155967;
        Tue, 04 Feb 2025 02:15:55 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47f1e23sm889444266b.82.2025.02.04.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:15:54 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: imx: Make IMX SCMI MISC driver only selectable on i.MX
Date: Tue,  4 Feb 2025 11:15:30 +0100
Message-ID: <20250204101531.233549-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=800; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=pyI5zeAGo1cg5BRHuCJdzEULznntBdU7+JnQZZUx5Ks=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnoejEpJeaH19FkPA6LQtmE3HsCS2KLT0uVt855 KDlWdrfnYOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6HoxAAKCRCPgPtYfRL+ TlbJB/9s+ed9pSYLeQw2rtTfIEzVKE2VZhGfKuVAZFkCNdWpG+JCsYc+ZdBpkTXzWHZlUxYOqHy qFQzJV8+2IC9l7MEhlfguEG/R3kTvM4QdUD1sZnGtwfKClI65sZhSNW9eVGT6+dCbDsyV/Fg1pg keq2zH1rWhw2nKiP8DUJd0H4sepfnysDOaiMSJrjjNNhFt6MhmqafjrFyDENaePwiFu1/KGZAWl ex1DhB/EQB6VX787dyDGmaMmIvG4RXxFU0PupMQQ2/daMLdDLxNKT0UIgl71hpTR7yaHNSxEnyR C3DINmPM8hUVlMrnLmN688939R8dbnMty0cDbdT/VlylFrtO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_021559_495939_226C65D0 
X-CRM114-Status: GOOD (  11.04  )
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

This hardware component is only available on i.MX9. So don't offer to
enable this driver without i.MX support or compile coverage testing.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 907cd149c40a..dc685b94285a 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -26,6 +26,7 @@ config IMX_SCU
 config IMX_SCMI_MISC_DRV
 	tristate "IMX SCMI MISC Protocol driver"
 	default y if ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
 	help
 	  The System Controller Management Interface firmware (SCMI FW) is
 	  a low-level system function which runs on a dedicated Cortex-M
-- 
2.47.1


