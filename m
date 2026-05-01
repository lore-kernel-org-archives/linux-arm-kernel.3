Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8261CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgCd/8OCqeyYKCVUvRrf/jlOcP1suVHYVb2aR3GPrKU=; b=4cThaHQYlgtpMQmz9DYwBJwuXi
	45caCifa9Vo0aDBErE0RnmXhQEJN/nwsDxBvOUbHktSkM3DmqP03E0jismlOXlNaa+SAG6UMhhj1a
	btflZUEuNoPVyKkMuxtdd15CUXtom4e6MMQHoQVvEu78aEcl6uYkPAal2IpRj5Mq0XUZ9g+Zo2r1J
	QP1LCIJqcPYvKOIE8g6fq5S7SLsvouxCO6zRQTttikjA3FuLYr0Xr4KlAh+x9Idr0klZYC89U5nPN
	u4JR9stSgihhARmygMxQKhnH6UtSDZ2pyUGYQjKUhkNKtibedrZyVX4LgRcAkCYVrCYsfRbs0EgBS
	pRGKGMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoPW-00000007Cpr-1foi;
	Fri, 01 May 2026 14:00:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoPU-00000007Co2-1gis
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 14:00:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43cf7683a28so1238618f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 07:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777644002; x=1778248802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgCd/8OCqeyYKCVUvRrf/jlOcP1suVHYVb2aR3GPrKU=;
        b=gAur0YQ4OB/tuqH8RYba1/dSenUr6jRfzwz0cG6ElAePequNIpGDl/QivqBRYEhZEE
         /vXbD90yB1sD9EFyVmj1baiCPn/1dInNoED3ZLme7u0iXmc9/AB0uBPGMgo5ZoxVUptV
         yUWfkFev/ZxEZMTyrWN6sAaqjs1C8Bbodb3rDlCYoCdaGlbRznfoC8HliwqFNgnBjkwU
         zhcAozo9/aIw4JEo5fJQpFXFUBcNRwgA404TghgWkbSPfHKvqo9xZKPBu61skEKDePT4
         m1Ferte99KNpo0ngDymilBd2x2hRADW8q+MIKvSA/9fQf356yFW23ier95rOaUYNhpnr
         eq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644002; x=1778248802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgCd/8OCqeyYKCVUvRrf/jlOcP1suVHYVb2aR3GPrKU=;
        b=cBzgOLjCzymgYUTmMyFxJGNsqqJAk5ki2ksZvqPdG8pIIfPWjHbJ2zrkGkKslYn+B6
         qiNyAa+0o2hpapBSPMTaGXKc+hEMyDHVX8x6xK/Qj4r59pCIt8hjI69dkwIzexfW93zL
         iQLBVwh/4G3Xp425tRecGIKlGMZGvGY/uAf8t/KUCReGWuPE/Fq9bvUvVx9xpGyNI7AY
         ZMCvtYutgZLkDv4GnCwGY0Exe47p8EBhCC3ZMQFF9Hd8kwZQ9qBDU67Vnqpj3CaUrlae
         DmsxLn4UiyyoR5bAbaAaMply+CrCzfuRthVoEswmrCLKNjNgVhfxkhmXnyyozsKAs5bt
         7hJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qrHGmfCOwp0DJLrenPicLjkkYjXtdctzqUSn1qWJQU8/dD4nyug0BHsuwctK+AEKrw+nXnNemrD7Q22L2yjrI@lists.infradead.org
X-Gm-Message-State: AOJu0YweDYG08iTHk4S1wCPkSORFjFhgyypuk5cgIWLwxH3ZVwWU+aKN
	LYmwcc6ckF+aA0XEV7vVDqMEcXjobSwcgTlRiz0xXBjEFc22zslJnBSM
X-Gm-Gg: AeBDieu4vYHcFW5d+pvqByF9K+H1hXkbu5kfjFSa0lle4eDlTd+x9UgJn/UVjMBcJGl
	N9N/9+i7jx/yE7qCz+LHFPJOQrnP4uMmZ+UfKKD4f2YtTzPJCPjnR3G5CJfaSiaD160fuTX7oH2
	XVyFOEVnLwCVjprBbZ4PidT4ZhEAV7d70kmo72WENQQZBN4/mu35rfJvcTpZuCBLUZbcctKL5et
	e4NHhZyoPlSXEhD7+pktHG4PpatPIuuvXpPKWVBhY5d7/bxjyNUIyAAsd2kdWsLg1Z55d8hOWmq
	pcvOBpmxR/fLy2eS2xi/qfNUS9D79LwRnkgWJJoNxa4j1LxKEXfvMfwLziAmS/MToKbHT7UrHVp
	Ng5tnBtbDrQuPPpt+DGsVeINk4/BH3UkgKk8hpOHmO7lZ0gsDVj6IxmF64BPR25QX6y8axg54XK
	a90RiBV/FzgCYHs3KY+qjnVc7Qr88xfq1zN7DahtMHGvBvuaWcUHDmtIktYw8mJkx2mnYMcXhtg
	3Jv
X-Received: by 2002:a05:6000:2b01:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-4493cf2d5e0mr7464637f8f.4.1777644002422;
        Fri, 01 May 2026 07:00:02 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm4823539f8f.33.2026.05.01.07.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:00:01 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	carlos.song@nxp.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 2/3] spi: imx: Fix UAF on package-1 prepare failure in spi_imx_dma_data_prepare()
Date: Fri,  1 May 2026 13:59:50 +0000
Message-Id: <20260501135951.2416527-3-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260501135951.2416527-1-john.madieu@gmail.com>
References: <20260501135951.2416527-1-john.madieu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_070004_460243_73F2415C 
X-CRM114-Status: GOOD (  11.65  )
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

When transfer->len exceeds MX51_ECSPI_CTRL_MAX_BURST and is not a
multiple of it, spi_imx_dma_data_prepare() splits the transfer into
two DMA packages. If preparing the second package fails:

	ret = spi_imx_dma_tx_data_handle(spi_imx, &spi_imx->dma_data[1],
					 transfer->tx_buf + spi_imx->dma_data[0].data_len,
					 false);
	if (ret) {
		kfree(spi_imx->dma_data[0].dma_tx_buf);
		kfree(spi_imx->dma_data[0].dma_rx_buf);
		kfree(spi_imx->dma_data);
	}
	}

	return 0;

the function frees the package-0 buffers and the dma_data array,
then falls through to `return 0`, telling the caller the prepare
succeeded. The caller then dereferences the freed dma_data array,
producing a use-after-free.

Return the error from the failure path so the caller takes its
existing failure branch.

Fixes: faa8e404ad8e ("spi: imx: support dynamic burst length for ECSPI DMA mode")
Signed-off-by: John Madieu <john.madieu@gmail.com>
---
 drivers/spi/spi-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 7ae8078c10ef..4e3dbd01d619 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1709,6 +1709,7 @@ static int spi_imx_dma_data_prepare(struct spi_imx_data *spi_imx,
 			kfree(spi_imx->dma_data[0].dma_tx_buf);
 			kfree(spi_imx->dma_data[0].dma_rx_buf);
 			kfree(spi_imx->dma_data);
+			return ret;
 		}
 	}
 
-- 
2.25.1


