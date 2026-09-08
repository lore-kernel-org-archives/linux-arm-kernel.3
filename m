Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31DDC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eN6yqcpqAjYfvv8rc/zTcsykokPXr/AOywGzcoVI8dE=; b=kCar/g9c9QVavExUY2jqVzCvHt
	XHTEbPsTkcSc/b3Rj/TtMOqFHedPQzwMEAYIPbSIcXF4TZG+QxRXKJ2LkGOy0vmutWwavwHsT5gPC
	8oWckSNhI2yuA9iNnaRkg4snXxQlU0EtfdP2aO74ppBEKvmufJFNdLG492aG15sBJsPdseNyfqwcg
	fLlFur/vNWmzjV25/6fzwhasMrFJSS5iyhH1MpE9eS/QIrxr3coPHAKCXRc5ecgc9v55rEA+uPLHi
	wv1HfdRCqpxiW2OhEh2kLyJXUw2HliZWp3WkDTk2njxa5aoCFGyPMwxLCHYExROGSksbuwNlS+o/T
	zWwainZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZo-00000009oVV-2F8i;
	Tue, 08 Sep 2026 17:25:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZm-00000009oUK-2f9k
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eN6yqcpqAjYfvv8rc/zTcsykokPXr/AOywGzcoVI8dE=; b=fzV1WCw+8OSjIRJ+OZ72Y28ep9
	bD3jh6yEP0wO1QjK5TQvXe0lCtI89cugexc4QCZZjZ9aGVjeJuntdxnj1+9R0N6T7obGapiMrjsfp
	IFsZZMxG9fnuRfVV0kze5ok7LeB79H1U/2JbbJaU5QHCZ/8dxZ2f/ZTPUN0/DLRkKKUWGuoYgHhpR
	7bGnnA8sibAEXawJgq+n5QCGcJWPab0/HX10Maxweb3ePSjdw2xiexXd65sKiY6P5BJSoMiTtPMOO
	ZHQPfczAOkfxaLJB2TaS7dDErPXQY4gm8zM61FXkyj8pu4LgUJJeYgxDgmqsxxpIbb4Emwe3LKSTG
	b5L0SSIg==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zZj-000000009hR-35SV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:25:41 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccafb750so168052a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888337; x=1789493137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eN6yqcpqAjYfvv8rc/zTcsykokPXr/AOywGzcoVI8dE=;
        b=mmBjnGS2Jybn9ce4S1S14UTCciXGqO0GLejrnVh0FrmdMEnTDAmclLYCgUryf9E/Qb
         WoMFdUPSFaRkrYd71EExkMBWPwK/Ari9WTazI4WMqzD/AvyCkwzLvJuQYKm33ahpKxSY
         uLEvS1tmtDXMCadt6fgAWJIBv02lGSZwZcCtnbzOXgXwjldXe3HjijDbVbEQrl8GdrDX
         uxw4wKVHuHye3tgZ2Z03/Jhh450L1JnykY0miz34VNGN7wPxyF5P8lIHnQCOWIkNDZSd
         ftq6UC8DO03UdR4Cq5qypJwZZMikOEqoy1sPiYKS8dXF/GG2MhrGCv8BIS3W/Kod4kg/
         FvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888337; x=1789493137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eN6yqcpqAjYfvv8rc/zTcsykokPXr/AOywGzcoVI8dE=;
        b=AQtkeH+IAPl97Xu4GXYqpLj0tBPTydlYcipQRhXD1Dk2UvbHCXtLF2t+LHq02YYwg1
         PeLCbTocEsmQMiRMSanLUUf1y2Z8wSEEDE6z9jAyNcN+kR3a7JSojB6nQwySHvpj8Nf/
         vMFBINtbD9ynzI/e3CTkSeSoZX/V1k8PXIKk3ppS8f5/NRBBXmTWujgYKtPmpVR3SPbF
         599R++YwbAqmiJQbdOuSCxMfFYr1b9e/ZBRkrt7/faK3o/4c+OShv/ZUpWVm0bWpl4zo
         IJ8y8j/EGOjKtoPmxlU+zq/dmxyUusKu4ThoY3WqFEkO2pmlsBXGpP3aVRfJQkv51Gq2
         7aGw==
X-Forwarded-Encrypted: i=1; AKwUvBz4/Ywzv02q1cmDE5GVSE++uD59hUc1aZg5HRKaFl0xGMfY11Zfia5YCWQN7/r5Q4KC2oWDt+5AIA0TZZfysee1@lists.infradead.org
X-Gm-Message-State: AFuF++mkmAO4KVEQsrP+/jUUQ1AJo+k9LFVDYcBpikBGJqPdyEdSJ/Y+
	/IPhnweSPfpKPKSAwqK5s/H9nIzIsqOgSTPIqQI/wdmnKkMp8USArQtH
X-Gm-Gg: AYBFou1qE1m/sLaCWyrqT3HJ9hBDcmQz8RNFFk2kvs2fJCYW6eYc2yhH/EEC4DIzBSc
	rUOT3Td25jlIWA1fVEYyo8tvoWAOi8qyafTRzjBu8Fr6XPT391GuogmVTHfuV7ee4MRq2RPapX9
	R2e36eh+0DRhe7sbCyoC8jaFuVlhOlfuDHFBrSI55TItj8ur61AzkrwYENTmY3AXjhyrMnfgjg2
	bNJo28cLsb16/4fp4gr9Jbi7MIomwxALxfWH7OgWHScPVoLDxlJ1YGs+zAKP0eVkaHo71KSSKGw
	HUTE45iZiqRIHETw1TrSMfz1Gp7MmUsvhVdXaBlwcm5ArSQgziHXu2sS5LMNzSHx8EpCFBSWws7
	CzL8FoLnonKFZ/ZpYoO0iqnhnCqm2JNAAujDogQSpN5MuR4ciWXZnzYCwxGIpU5aHhXLfk7VvW6
	8Wgz7Btb9MylSCbigoivdGAQCBoerUPF5WTAP5Qy/XBa0ckdUgwZpeiU8CnDo=
X-Received: by 2002:a17:90b:2787:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39bac34331amr1274961a91.16.1788888337459;
        Tue, 08 Sep 2026 10:25:37 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:25:37 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 5/6] iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
Date: Tue,  8 Sep 2026 22:53:58 +0530
Message-ID: <20260908172359.30003-6-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_182539_890808_563BAF5A 
X-CRM114-Status: GOOD (  12.78  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Use devm_mutex_init() to tie the mutex lifetime to the device and
improve debugging when CONFIG_DEBUG_MUTEXES is enabled.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index ff271c7fb2de..9881a3104c26 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -525,7 +525,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	adc_priv = iio_priv(indio_dev);
 	platform_set_drvdata(pdev, indio_dev);
 
-	mutex_init(&adc_priv->mutex);
+	ret = devm_mutex_init(dev, &adc_priv->mutex);
+	if (ret)
+		return ret;
 
 	init_completion(&adc_priv->completion);
 
-- 
2.43.0


