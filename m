Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301EECD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCEJ/9yhLVB8JdzIcP+db8CqyYZgJF5pDJrP/8tLAoM=; b=dBhuYPIom3ZDv5onJjVaTO3Z8w
	o4mj+eodzogW7tbYSi04rDZdKfxGzUr4W7U6rLaJuedgB1nEv4D3AFJQReYnoK6kd2m/ct9Y6XsXV
	tWdJjhVVKhW6OvJmSIGmfA8F5YQjX7AlK/XcXFA/HwAsaf5KySGbjzpoE5i/0HLn6TTJauw6nx2b/
	Pl18ULZP5e/ftecf/IuipKwa3j2fm+IqRq886AJkUayPT5CpDjinh+E9iIvE81ihqRh2dQJE+blNy
	j9tWYgqe91AeDxtddL8Bavs6Bmm4PLV5kmbUrvnSPVhO+VmhXdHyoEh+3LsnDs0UDMvfWTRH2GOQ3
	FqZfA2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV69a-0000000Gde6-3Q47;
	Thu, 04 Jun 2026 11:22:26 +0000
Received: from mxd-1-a07.seznam.cz ([2a02:598:128:8a00::1000:a07])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV69W-0000000GddK-2sNg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 11:22:24 +0000
Received: from email.seznam.cz
	by smtpc-mxd-5757bcb9c-s9zn4
	(smtpc-mxd-5757bcb9c-s9zn4 [2a02:598:128:8a00::1000:a07])
	id 38506878803f45f73aaef2e4;
	Thu, 04 Jun 2026 13:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=szn1;
	t=1780572117; bh=wCEJ/9yhLVB8JdzIcP+db8CqyYZgJF5pDJrP/8tLAoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=iCR879YNeXrrl8oOQc7DgJZ8wIrA2BTQRmcLkyvfkH0E94c8ZPUTR0AhJcNZKzr87
	 GMCt61YCOnWvYYkUCQLEaPJ1boXU6TKy+7+r6qdI8J+sq+PsqwzLGHGS2cOLxIE/lS
	 YW98gM4iDb3yE7qEgHWumbNmwn+sbBftgAd1LmdPtqCec1loqVGVtXbJa5ergq3Go1
	 H/xF2wq+214/A+0YowZ/asWdu3rMvzaZRlDhxKpyBSNcrYWDPXHcgExF/pNEfh2tVv
	 SscYn6H4rcW087bLiRuheOukpZzuF3f7ycN12DYmz7eLoTGY19B+1aFSDj6vyhnfwy
	 H9jQXYMLqBnjw==
Received: from archlinux (ezechiel.sdb.cz [185.100.196.77])
	by smtpd-relay-b58bfc659-d5tsb (szn-email-smtpd/2.0.73) with ESMTPA
	id 9a322fe9-fdf2-4ac5-9e75-bb9bb4fd8000;
	Thu, 04 Jun 2026 13:21:48 +0200
From: =?UTF-8?q?Vojt=C4=9Bch=20Kr=C3=A1tk=C3=BD?= <vo.kratky@seznam.cz>
To: linux-iio@vger.kernel.org
Cc: =?UTF-8?q?Vojt=C4=9Bch=20Kr=C3=A1tk=C3=BD?= <vo.kratky@seznam.cz>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] iio: adc: change from %ld to %pe for PTR_ERR() printing
Date: Thu,  4 Jun 2026 13:19:00 +0200
Message-ID: <20260604111921.106936-2-vo.kratky@seznam.cz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604111921.106936-1-vo.kratky@seznam.cz>
References: <20260604111921.106936-1-vo.kratky@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_042223_155198_7CB89D93 
X-CRM114-Status: UNSURE (   9.69  )
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

Found by Coccinelle.

No functional change intended.

Signed-off-by: Vojtěch Krátký <vo.kratky@seznam.cz>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 479115ea50bf..5d7a61abcaea 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -508,7 +508,7 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
 					     &sun4i_gpadc_regmap_config);
 	if (IS_ERR(info->regmap)) {
 		ret = PTR_ERR(info->regmap);
-		dev_err(&pdev->dev, "failed to init regmap: %d\n", ret);
+		dev_err(&pdev->dev, "failed to init regmap: %pe\n", info->regmap);
 		return ret;
 	}
 
@@ -639,8 +639,8 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 		 */
 		if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) != -ENODEV) {
 			dev_err(&pdev->dev,
-				"could not register thermal sensor: %ld\n",
-				PTR_ERR(info->tzd));
+				"could not register thermal sensor: %pe\n",
+				info->tzd);
 			return PTR_ERR(info->tzd);
 		}
 	}
-- 
2.54.0


