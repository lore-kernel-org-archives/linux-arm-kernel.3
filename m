Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06C1FEC0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOh7L59SGXDe0n/0/CxydhLmu3Ccl2K/OUt14k5rUoM=; b=tK4EbslBvyha4Hdy5IwVnwWKFa
	oF/pCiALAPw9rHOgSJW/J1iIGvl3JXlguW1ebqnf2wrSmHvc2gSCjSqAoscKmRKwoQyXsVvpU4lXI
	YHQndmzaalI/NAuIszuVTxsitIspATpKnn044iSi4tr4rlcI00pwlp0jDIOwNwoftRE2XBxBAyniE
	csxdhoIaPAC3zivj4cXlQVyQ/p3C5GkWlLJR+ilzWh56Tcki8Vl05VUO48P9DJxqSoUIlOtPz0lY1
	/xvTSAM+/ScgxNi6NDbIaAOda2jOVNcSHKO8zLjLu76eqJY9QDS/Jj5UAQSAe8GiJwhzqfu/flP1h
	H74YKsBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56UE-000000024R0-2q27;
	Tue, 24 Mar 2026 18:28:18 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56U9-000000024Ne-0Wcs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:28:16 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c74244dc0b3so1001093a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376892; x=1774981692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOh7L59SGXDe0n/0/CxydhLmu3Ccl2K/OUt14k5rUoM=;
        b=JPxFNdd0Nk/bQje6pEZiUIEIDRGvS+Ny7lgddK/SOjbBytGpRgkx4Cq52amumxTX4h
         8C67FiTBcnJ7d+c8y0rtot1q/YMmqKdWWevLnO2LRrgaxzCUWIMWIQuW1MGc0ln/AfJb
         1Sz4uaceto3F+hWrhE4rruRsYX8tWdUk9JbCysplkR8dAEoXUaKJnlfC1NKHpncgCIo5
         SvDepB7MVKteM/+/EmpV0eDAtI3a2HH1SCBW6+OClFA5b5Zts7ydZ5iLWTOrmrDe8w2w
         7nXeu6P4vkCtMwZmeV5cC+L7g0RZhTuoGpjz0nnh+ZR0Z4p5Cr1G9QD7bmUDEuQM2Qet
         clBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376892; x=1774981692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LOh7L59SGXDe0n/0/CxydhLmu3Ccl2K/OUt14k5rUoM=;
        b=g9f48UGTiMX4uzf3pCouunPnokf3yalbPO2BXNm9e5uvSnuycijS0UeQiy23r2Weew
         TdLJvX5Uw3gWDsqUWxbgmeeJxAA/+0kx8VLb4kE4TCiJVFt/rWxZ6RqVrN07l6rxs3FD
         s+dRaSjRG/6GeNoGXkeCLBJEzE5LlFLfDhet+EhoPPEFdH7LBNJT/bPL+F4sthv5JDTz
         C3qiXu9pM9NvqFXzTif86/gBiE4sMAAl1EzO+T/tT/zHRI/XJuYju4cFSp3q5SolbvzF
         J7DjB04+O3ISb0xV+PkwnAmjfGeF+mOnhB9/IQnCh2o8ropVShsYjD85b9MZtB3WYnPl
         FnFA==
X-Forwarded-Encrypted: i=1; AJvYcCU/dRpLZGZgGl50hpsb3SeG1EmzYSlq55b4uELE5tLD3eYub9RmSNQM3QQmAAF5D8QoGcNrLbKJKQc6VI5JYtsr@lists.infradead.org
X-Gm-Message-State: AOJu0YwnELWQOsUA+4cuaw6i/aMs36FbmBOz9u8nwPvGwHtyDyuoUNy0
	XKVLZHpogfV7nrcOzJQai9FmlyApOQgFqK142wzQnOPZbazgZPymdjl1
X-Gm-Gg: ATEYQzz2RvZK8MqWWxfeISYR3L7v9sBydWYuaW9AAMV/4KMNTrDXdm0LubQegAoJUw3
	6pgEwLbUos2zXAGuBndDj1RS/H6S8Syj0+qqhjSET+K78LNRfo6yds5n6i5qMBSVl1ruFgMmiUN
	O1cZe4aTHIKaa7r0/gwXP23Exfc4cqBl4jNTLNPtY61qwPqN6775MUjG4Pwr/S6J/zgvKPiv5nY
	19MM3QyH07y8jRuZIo5FAZJRaEhKRfF1XlDab8ZT6Iy+FcpPDE05pEZtGG7pn7Iztrlkh0Rc8hq
	lLmUkLtIS3WFLZOPJVyd0DDSWHDE+N0g2kSFaEeBqEZD7N0eIamYN17I6Tp7TXl9zQlYyJCq0mv
	rqD6DOfsH8W3xaCAZJxmqXegOehwQ3G2+sZaIBkgTbFGRPf7BeUKnPGzlybuZjuWrphXvAmalWr
	Zaq6PMF6AeZpmxWGKE86gjZDBoqQ==
X-Received: by 2002:a17:90b:4a4f:b0:359:f22:8879 with SMTP id 98e67ed59e1d1-35c0ddb253amr350462a91.22.1774376892133;
        Tue, 24 Mar 2026 11:28:12 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:11 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:54 +0530
Subject: [PATCH 06/10] i2c: stm32: Replace dev_err() with dev_err_probe()
 in probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-6-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1144;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=fGh6XbxSkvU5zsFALrHQqBdXVjE2X7LO7LjtYihQc1Q=;
 b=bSr5WSYN2sBbQ56eV/RU7Nsc30A+f8iif2b8KvF+i2QPU4oV/n2gxZwRlmFwYUL0Sn4WgwU3t
 BHbt5Op51GJBjc0aJ76ljbLTb0hDHykJdiMU+4SpjB/VkJQQUf6r5CT
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112813_182152_9C903BCC 
X-CRM114-Status: GOOD (  11.56  )
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

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index becf8977979f..064e47d6c96f 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -39,7 +39,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_sconfig.direction = DMA_MEM_TO_DEV;
 	ret = dmaengine_slave_config(dma->chan_tx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure tx channel\n");
+		dev_err_probe(dev, ret, "can't configure tx channel\n");
 		goto fail_tx;
 	}
 
@@ -60,7 +60,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_sconfig.direction = DMA_DEV_TO_MEM;
 	ret = dmaengine_slave_config(dma->chan_rx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure rx channel\n");
+		dev_err_probe(dev, ret, "can't configure rx channel\n");
 		goto fail_rx;
 	}
 

-- 
2.43.0


