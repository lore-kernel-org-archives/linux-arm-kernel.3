Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE084CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 16:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CHqaJ4PRUSilEEuBUhPDMPm/tElwzkSvosfNFVDPAgk=; b=ta1MmXuAs091IZqyzXbMIfo3iC
	2dzC0cCbpThVI3lX4Fk3RzgbKZvf4mb6Lg4IHw2W/strZbgcMi/5055wpa7zqrwBzVYazRaBhcrMS
	6hDCiT5UnGmU2lqeOloOw9TNwC3wO+0Omi5FK2b00alIr11dIxW7Q8ECogjzxXaBKbxAx5ZR/Ys/4
	9vt/PFJ5RUpPIhoXrsTRkKN6EdciauPrDUM+fe6wSLGDYes/5CmWTr0aswpUKsOeniQydimw3S8vW
	x65CueyAR8l9ak6ClAqyQbc+xE7X9wqpq7a1el8TdiywvD+wE77r0Zrs2OyOzSqwZVXtU4hd99PGs
	ekCDmuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XPE-00000004LFn-3pgM;
	Wed, 08 Oct 2025 16:52:48 +0000
Received: from cssvr7.cse.ust.hk ([143.89.41.157] helo=cse.ust.hk)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XPB-00000004LEd-3vE6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 16:52:47 +0000
Received: from homelab ([58.82.196.128])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 598GpsnR2103175
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 9 Oct 2025 00:52:00 +0800
ARC-Seal: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse; t=1759942325; cv=none;
	b=sLgBefLwQLI26pZPfzu5Ls7dGY0JA+2XMh9dYtn7nM4oNooUGNkjm1ZGY6eaIOgzPJTxzwO6K4XHQD2Lcunn6Q0dfj3ZZPkADGAVIaLfWR0wYKnc0cI6qwafXbCy2E6j2Dw6ZGAUap3ipHj6Ycb+zII8cHj1/w5jFcTDgTsseDU=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse;
	t=1759942325; c=relaxed/relaxed;
	bh=CHqaJ4PRUSilEEuBUhPDMPm/tElwzkSvosfNFVDPAgk=;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version; b=y2wBmouT+KpS+s7l0jA7LWALt6lUL0YShTpAFi1D3bQ44FZA2PJD1+MSWgRxf+qF1T4JDI4k4ajXn73FlY2NSKJxLwPIw2pRPKc+DKxGnu3qakscf60trSolBuWKXkOP/5cjDTlk+m1sBJPZvuGo/b/waciIwQVzGYvSwJdm6I8=
ARC-Authentication-Results: i=1; cse.ust.hk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1759942325;
	bh=CHqaJ4PRUSilEEuBUhPDMPm/tElwzkSvosfNFVDPAgk=;
	h=Date:From:To:Cc:Subject:From;
	b=WxPe1G5JaciuAHoqFZVV1F4w/H+S1CRG8XwUhXA8fQ+yDN20ddbt0G98rlIpAS0M3
	 41TW/YHiB9e8K6bUcXrGv+2YqcTXVBnWIoGQjKoRvVcu41UbBMftGGdC6BxPJC5B1r
	 RtGwPbnIKwdu6lAYfzODKv+yXfbvucmcNBMY2FBg=
Date: Thu, 9 Oct 2025 00:51:49 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Jonathan Cameron <jic23@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: David Lechner <dlechner@baylibre.com>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] iio: adc: Fix pm runtime clean-up in sun4i_gpadc_probe
Message-ID: <aOaWpVGZSCY6kN-6@homelab>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Env-From: sfual
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_095246_589855_2A7CA86E 
X-CRM114-Status: UNSURE (   9.63  )
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

In `sun4i_gpadc_probe`, in case of thermal register failure, the runtime
PM usage counter would not be decreased, resulting in a possible
inconsistency of runtime PM state.

Fixes: b0a242894f11 ("iio: adc: sun4i-gpadc-iio: register in the thermal after registering in pm")
Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 6b8d6bee1873..ae4a59a965b9 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -644,7 +644,8 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"could not register thermal sensor: %ld\n",
 				PTR_ERR(info->tzd));
-			return PTR_ERR(info->tzd);
+			ret = PTR_ERR(info->tzd);
+			goto err_map;
 		}
 	}
 
-- 
2.39.5


