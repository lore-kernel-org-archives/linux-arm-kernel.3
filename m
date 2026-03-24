Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ECAFEC0F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU53ztXeIg9rAt/w2RhxQEA1HrNV+jGEvjmkGqWYdZA=; b=tW4vSDgnCo6V3OdY17uScECSeL
	5hIwYd1xFyGXgh/kSJzciECTueUxnon+9tZDiPfn9aoKm29BH+6zVLmd8diG01kewpuD9wjMs3kbl
	4rEN2Jdn7NixRRMPk/sjYj+S9hIQaQHZpDFdGfT7fYPmm2Bvfw4AubGJ8oDBwtRY92HVueIRK06lr
	iHUO8i4QyYneQAyiwG99faE7d9qd3PVF4ADCgnPJjV5iLzrQW64YKc/cLXQaArUJ2KlsBE278iEIK
	4HcFTwto+7dTHwTTB+83zhSEZ8aE44UUVDALcyV7HUkGCgmV8X50djbJueUb0IoNMzQzXPZvD+U7k
	yE6ss+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56TO-00000002432-474P;
	Tue, 24 Mar 2026 18:27:26 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56TK-0000000242F-1wJW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:27:23 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35b95e21ccaso84202a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376841; x=1774981641; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JU53ztXeIg9rAt/w2RhxQEA1HrNV+jGEvjmkGqWYdZA=;
        b=IVXM+vq5rMFSnzTz4bKAdhndpA8OVysf78aI1/iFuBsCMKoVpmDT2DTTE3DBpTMGt3
         DkLKP8Bx71PuCeU3dMnv08082pgJtgsTe7QhqqoUYHLZC2EoMHwhzJNQ+GLXgF75vYzT
         FFc3L8NX3Be0QT5TUy4fydUH+GPyBaS1ycowkEkdW9hUAGsn9DBotJL7B8k2WTAoa2tv
         ku8TxIjgMHsVZ5mwLp8FxxUFvwZueaTPmKbAC1iPN2aZ9xAucudb6cVkRTEnGJnJQJVE
         ZSSMmFbzIO7we6gybaHZlIAz9L/K0JIUJv1DIrdACkXzDohYEV1aKtXY2CVE3wCblUZq
         qUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376841; x=1774981641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JU53ztXeIg9rAt/w2RhxQEA1HrNV+jGEvjmkGqWYdZA=;
        b=ItehbLNGO7ionXOzXRRj1DyEr/eEkm0diQ9KcN7bI5GIA0iriZxh2Yf5iOfh/+Lpdh
         qAWDEj9uk7RxsHNhMwyRAiJ/sJx3u7UC2YDWS00i4nTOC8VVxUAn3Gc/ZOpB3OK5I0nc
         cPEMdS39Vd6w7NJlz5ZOyDtPDRf0ECMJ3JE9I98cH9zFDjA0vMOHzA418KIbw3yjUMZv
         oMsjH4QYbSeyzYtKMfHlUgvkSfY1P7wcKGw2KRhmhcz3hK73SQc4DDWO7cnZ4YkEVgTa
         n4ucsWVvRy7JzO1/eF2kAW1w6C1AhJF532VADnvfDlmzVyXqxiJwsOyoninNIiHRDEZl
         MeLA==
X-Forwarded-Encrypted: i=1; AJvYcCUkLX83xYN6hNNDaT/32OjnVXGCiNmy071ewb4Rldd/K6dECi01aWreZtQGFMKOXLgEHgjBW3nrKLs9KkLsJFoT@lists.infradead.org
X-Gm-Message-State: AOJu0YxEUKCVyo79EMnRI4lxGfGPT/s8eIwy4ZrlWv052BdrLHqQ/DPG
	JkwTX6hl6s8H1hlJTvwPhtauLIbumMQpxV/XBxfUdJG3+vL0+4hOLZuB
X-Gm-Gg: ATEYQzxww2bzpaKCOTt5h1VxjYJ8I0RNaocpno843qvGRgV7Z84klTEyS8T17RSDISC
	BYuguzgYgVuNKpfc8zlC9szZ4Apcp4/Yr6QfkV4DMIeUXWoLcjnTByKZbJN6bP5R7AXcBS3bsaX
	+1gvS04lnzSK/nkDwAYu/4c4kGRGgkT5zPpS3+hRNNaqQIaXcIPMU/oK990bVU8oqgohsmco1DH
	JlLK8KLXl3bif6pOnZQusKRsIRFUT5eWb3XmtHhu+EwoFLP9ptJwRmuGKcC+054C1ZJSfjKLJo1
	YVn0crqI12BV/0TIzQPUv4nwAbJvabT4+uiWFUFtFz59oGEVf+Ps2inOEjFpQbeTSEHmte+2PnG
	ONP+2Prud5dUauLRKfAcfRSz5eWYtW704vMGDoGAxeT3fXJ2Ac3t7UoAF8gW1yuFApgwaQarH1H
	CIV8BJ0FlZuwU+k+mUpzhXi7zW+w==
X-Received: by 2002:a17:90b:57e3:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-35c0d1451d7mr559615a91.8.1774376841343;
        Tue, 24 Mar 2026 11:27:21 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:20 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:49 +0530
Subject: [PATCH 01/10] i2c: tiny-usb: Replace dev_err() with
 dev_err_probe() in probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-1-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=922;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=/rm2EO54Io9Vb7rL8ZSyeOBixCamQEqxJe9F/gCdBcU=;
 b=ndfdbjfGLfy7wqu+RVI89cU1BdFSOOxdC43vbHuPhEqbITAhbeTXofEpCDO4hCGofdSsBz5rg
 /eaMZdocnKzBw4U70BqYrFGGqU2cbJzMF6jNMLwPSl+hIPTFUD50Y/N
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112722_509893_9701D41C 
X-CRM114-Status: GOOD (  10.81  )
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
 drivers/i2c/busses/i2c-tiny-usb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 9ef495f88ef2..0637c71126f9 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -260,9 +260,8 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
 		 dev->usb_dev->bus->busnum, dev->usb_dev->devnum);
 
 	if (usb_write(&dev->adapter, CMD_SET_DELAY, delay, 0, NULL, 0) != 0) {
-		dev_err(&dev->adapter.dev,
-			"failure setting delay to %dus\n", delay);
-		retval = -EIO;
+		retval = dev_err_probe(&dev->adapter.dev, -EIO,
+				       "failure setting delay to %dus\n", delay);
 		goto error;
 	}
 

-- 
2.43.0


