Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872B4CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ez1Xhq1H9VVtiiULLv6l2O+VSNqbdV04NQCVQ2RP6/g=; b=c6rb+5trkmtvG5ng+z8gTnLAua
	ocNCkIZyn9vRHXIQH49MzXsn0wcZ0POMz6iEaGNbQaJZ2JBEcL7QeDgTORaMVHXHFhLioKmmTws2D
	aAKYHK7J/oz4K9EQ7C+xJv3TcHER2E5gVjXBCU4xAgv3khjMgFUwldJ1cTnIC8bcypxVHNV4gysBc
	IWKqH37kMOV8lg+O9Npsdf0Xzq4++KUdVEa9eHADKtz4gFqlgcELef9L1ywCA+r80hr7ggu3mcOEl
	u34sV1T6ZpdISF5dxMoh5aa6Ax53caFsrJEJtECfW1z7FT+MnNrSnssPQTm3l8X/VOlIcFG8uyt/4
	nCKdxmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4f-0000000DCgT-2J3W;
	Sun, 17 May 2026 18:18:49 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4V-0000000DCVe-08nA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:18:40 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-404254ffe8aso1347278fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041918; x=1779646718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ez1Xhq1H9VVtiiULLv6l2O+VSNqbdV04NQCVQ2RP6/g=;
        b=dTkTNKOoUWJ5MLHkc5+tmfzMzLsjz4UcF8M0+Y16Rcjog3CyEjkFIKM6TUkENaKFSe
         csl/9WPCn3U9WNRiM8iA+DtVWe3p1wEtk8Gl1N77QlC+2p2aYQqin8u7D3Da/0zA1zrX
         341B8CiHvgOwQy6N9Sk6pGqDOCax4EOHMwH2UeQBtKlDmNW8niLOSJs5bGd0e8CJasnG
         52AdUJNPXQWYF/eE8tp/dLJR9ZRWn7td6DCS8aemolFwb8FXs+numv20+gzFcmjjJXpm
         Dm8tP/pv5qRqhtKe4b5Y6wZJsL9VUShkh4WC2KpnsQgYdhzczEPwAnt+82KlsR/2yOyV
         wZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041918; x=1779646718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ez1Xhq1H9VVtiiULLv6l2O+VSNqbdV04NQCVQ2RP6/g=;
        b=Hoe0PhRNC0c4lcgPcXRQNw/uDn8nKQO8r8mQzkzi7C767y5aCszfLJK09kEjDr/GAd
         yatytvptZu2HK0PV14VnPiPQ3uG0OvtC95tTsxMkTxneGNhD4q+yB1DqzS47sRQQ9MAZ
         0iRUNfeFsMMDsvpk3ZzDz7CqzV1NM3uJktwSnXWMIQ68jhSw/tjKayVtvCXvqSm9Vf2w
         rw64EDCgDI6RnvnM6RgAteBeTzJUIpWYZVrBya5/HkVdD0l630mHkPhfpO5UK++ywIs+
         CMUJr3OklNFPYDsIdVrHELbPzkBAe8h6zqqVcQVlpnHQEFemciOZeVyxr+vMydSxG5Uc
         BVQw==
X-Forwarded-Encrypted: i=1; AFNElJ9HTK0MPFY6WUZHot17qXmuhi76Jn2Vdo6Jdr3DVAQDkioURimXgB4l3I+84E2f+eQf/IQqZxiCOUtosPZFVjsJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyAtWLEb5qOnMOyMU8SX1YnIJPMh/zQS1hAzY95haqN2hWxevRm
	tE7yYzKBuiDVQiSbPm667I5MfD760Obtg1Zt5h2pvf+Ga+P+LZkmbwcuCKzPsX86sOA=
X-Gm-Gg: Acq92OH5WnZFIwDxrsTFScXiXl4gautP59BzYoTuS3pi6xC3CIVKiPg4vFp5pJp67bp
	Nb2D5CPLrBnuMrvnfx21RN9Rl9F3MLuSujHXRxJb6UThlN6NKDFXDSjykcwe7IDpHr58vNznY6+
	0nXFyVe3a2+tIf6gr9p//2QUYzDWmQdZS3ji030HdPGw7RgHsqeDD1LPoOiIjVPEvntOYi/Etj9
	kYAO/xuEOl/zrDiaMgftUJ1wHE9lKq3OUmeBUF43WAdMmQLom8fkYjcwo5kl/z1OnRlqKMVAyzY
	ffW5DGKXyo8xes7mWB/n93uMI2geMGgkUHcqYo2gAt9d9otbNC+zasaJJZ73zVrucYAYD47y6jU
	0mRw96Na0I7PTRby9uEmo0Mql30bPpUsExYccDHNaGhqCP72KDiZ1XjfjpdzicwPnzJiK1rcndA
	zqP01yXmUOKJg4wLeYEp8iMZFxcfBOFUj9rJ/Xfw==
X-Received: by 2002:a05:6870:1750:b0:404:1843:e5bf with SMTP id 586e51a60fabf-43a2dddeb0fmr7311064fac.18.1779041918076;
        Sun, 17 May 2026 11:18:38 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:24 -0500
Subject: [PATCH 7/8] iio: light: cros_ec_light_prox: simplify timestamp
 channel definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-7-61fb908c11c7@baylibre.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=zB7k3lhSdqbVTwNkTinjxGrJXZtNT6Oek8UbqFGJVDE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZfqM0vragiRqGTD7eEpg/krmTzQCfTGXB1h
 0z3rSgndWeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGXwAKCRDCzCAB/wGP
 wN/7B/9mbxgZ1arMG7zmnev/BZ3+8rddj+Wn7ufPv6TcTQVYZzFDkOaHVzTOdhOhQywA7LeEEEV
 IYxyzLebUsY7Cvp2hJfywA+NbN6mvVmcxj3d7MNcdTYL9x4UdjBbqkIPV6CTxo2VyRM4/QG2Rk8
 nXeiJ7FNalUuj/gJKBAdAsEbnZbV2jUTYylcaR7OcLTK3VbQ/uPpePkxwsx10WIjNYsUvt/g0eG
 DwEXz3vbLZSJCMhlKhEIdi/N4wcK8Q4Rdaa1PF4w36R70uw/HT3E6MFRjz5JnYuCyliNZUqykHp
 FNKiie0h+NYOJQVharYkgWkfNDV7xWjPxN6K248678aKDb6Q
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_111839_080897_438AFBAA 
X-CRM114-Status: GOOD (  10.99  )
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

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/light/cros_ec_light_prox.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
index 815806ceb5c8..6c8746236030 100644
--- a/drivers/iio/light/cros_ec_light_prox.c
+++ b/drivers/iio/light/cros_ec_light_prox.c
@@ -223,14 +223,8 @@ static int cros_ec_light_prox_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Timestamp */
 	channel++;
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_index = 1;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 

-- 
2.43.0


