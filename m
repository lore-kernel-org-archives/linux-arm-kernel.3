Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30690E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 21:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmawReunhMQT1RzOmjM1xjN/S/KwjF4WQ4NuUA53NuA=; b=E1zyCz+DMivAXeeq2zoZyt07vc
	hlKzZwKGzwE5Mia/yl/jc9A8ZInjpanDrVZZp83tD+RjQL3IEVki3V7y/CE4tVI5jwo8MM4Luv4q1
	gCiDrmlA7yEwUaJtEmHTs+Y+rWZ9Dn1NQRxAfhNJG6wc3f9aix8+LyE+N81su/L0LG+cS64XAZAko
	+tdCShWS+iEQDgCTObSPuzKei84fpQ8tvg7ITmHCyTBzBSqlwlT0mBpt/7BodbXC/40i8Nhj+FWwW
	/vut9Ljn0k1vSotMQ4GYd788WNAS5XIBcQb02P+yB4bz/ogXQIyjNR6MWRD+ZNGVM7PP+N+UtHEyi
	j/pUlFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBIR-0000000Fc1J-312U;
	Sat, 04 Jan 2025 21:03:00 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBAY-0000000Fajo-2Tp0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:54:51 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa6647a7556so241511766b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 12:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736024089; x=1736628889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmawReunhMQT1RzOmjM1xjN/S/KwjF4WQ4NuUA53NuA=;
        b=qbjGLl+SMSi3gJ+KuqM6TyYyWj/x5l5hqw93uy0ZNXNJAUtxU2ZJxHfGtZhLGra2Bd
         vDKVNxoGbqA6rdRs+VJcC/roch9/tjUjy0oDEj8Vm/2fsV5ohu3TCo4k+0O/wmUB07Gf
         BODar3Rgkecw5iiR1RPnC+YRF0+Gadut7eTRKXir96WPvBwoaca+v+B+6JDKWvwqBGTe
         mXM9UV5D/OnqE3NNmt1gnYJB5/WpGQdi+MarfgIKRagesJz807psUltn61JyG0+ufGlz
         IWBjU563h4hbK4GpiX+DmWYowasOpM6ts6iWEggxCe5Zwi/3egsPzMBLo4yN5V1T9DbG
         46dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736024089; x=1736628889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmawReunhMQT1RzOmjM1xjN/S/KwjF4WQ4NuUA53NuA=;
        b=b+KRB0+hGL/z8DHoXRA958ItgWZwbpLkAbhCt/iYF+GxYtpG71K8fAHV9UoUlatCxd
         6vA8wlSwKVshQfFLDTpvYzKoiWUd1v9+Lg8BcHcJw9mGy6J+e9kilJQjYS4icqlp0lMP
         t1U2BnAsrL7p5m9dZUEEPqb2O+ETYL0ndA+Fqddvs/vnIO5VJuZn5q4h/eIaqCocuqvM
         U0jbAvckWJMw1RjSh4N3tlwgOAXYa7DfJZypjC/AxOHIBSxiq/jRE/G8/GPAhjg6AwJu
         QyjSa8uwEYQpVgJfmhYT71l5FoFTPnHvIAzBVZPJVvSeMIOjuRLqTIoCmCOjSf/eAufG
         dexQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7/40iDHNIE55bQevnIS9cUUfqzf/agwzsq2PJSmgiKOPaieSJutgtRNwPhYe7VfDIw4FnhANSu5VNizotyCr3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9/7tI0skEX6yZ+NF8dNVIy7BrfRQWeEdy8TYJh/ROI6v6ZWW0
	EDE/khoe3/JUrc1K46m/TlSyO4Pma86vXIltreT+jjopDX9OVVP2VqwmV80NZos=
X-Gm-Gg: ASbGnctN7eluuvRJfhMbPKpnpLxpQrTzQ0eTEbKZgokOhALBBR8jBsyhxQM1z/Nc9tj
	PwDgXy0rIeJLJt7cg2UXPpiHR/020TDs5wvLF+leUB23agG32TlKyuSl1F10uC+QA2p/vHN+XEL
	k+/J5IJD1fR+u+7ReThF8ctH/XX2ZmHbR/tbMcKnuKijE7l8YumqYQHdTnie0Y+yCr3AN2f/QVx
	8CK+lk+4RAR6YMNuwieHYzHnP1RjSboDjLYd1fYst8lff3zRJQlvKCDpJg7PnYl1Z2kOAg=
X-Google-Smtp-Source: AGHT+IG0xF9hR17ga58c9EDJR/+6VF92Xk90OmLLRzHetd12T6z8pp2lmmUMDY7ynIlHUG5keK+6nQ==
X-Received: by 2002:a17:907:d9e:b0:aa6:aaa8:b4a4 with SMTP id a640c23a62f3a-aac2d431db3mr1515258466b.8.1736024088851;
        Sat, 04 Jan 2025 12:54:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm839666666b.137.2025.01.04.12.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 12:54:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] spi: cadence-quadspi: Assume device could match via platform
Date: Sat,  4 Jan 2025 21:54:37 +0100
Message-ID: <20250104205437.184782-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
References: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_125450_625620_4AE43AE9 
X-CRM114-Status: GOOD (  14.02  )
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

Driver has only of_device_id table, however it also has MODULE_ALIAS()
for platform name, thus assume there is a configuration where this can
be loaded outside of OF system.  In such case of_device_get_match_data()
will return NULL, which is already checked in one place of probe()
function but not in the other, leading to Smatch warning:

  drivers/spi/spi-cadence-quadspi.c:1942 cqspi_probe() error: we previously assumed 'ddata' could be null (see line 1885)

Driver should be consistent, so assume device can be matched via
platform bus and of_device_get_match_data() can indeed return NULL.
This is also possible with malformed DTS on OF-platform: no unit address
and device node name matching driver name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-cadence-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 47477f2d9a25..e9197bf9d739 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1939,7 +1939,7 @@ static int cqspi_probe(struct platform_device *pdev)
 
 	host->num_chipselect = cqspi->num_chipselect;
 
-	if (ddata->quirks & CQSPI_SUPPORT_DEVICE_RESET)
+	if (ddata && (ddata->quirks & CQSPI_SUPPORT_DEVICE_RESET))
 		cqspi_device_reset(cqspi);
 
 	if (cqspi->use_direct_mode) {
-- 
2.43.0


