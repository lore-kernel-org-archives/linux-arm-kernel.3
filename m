Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2819AC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nu4943dg2Pk+bcmuLvvHqjkr3/0Uk0VMgvuphC7zY3o=; b=YxGF8iNxhLQlnqVyeJc9XfaoXT
	TzRxAT/R+fagkhYXqA35EHBMnoRsKUOAD5H9nE2x7Q8L+Z4Usu1IUf7ey1TUgd9hFQf8coUTiL3bV
	ccGyvhoJUPMZB9q+PSSZyKSddKkizqFPMbZW1ooKB2mZf1ivD6LyHyJ3OPpXQOO1i8dgpEiJJC/Ch
	PfdvbVONkzB55iOeijo0pR/+M2kYjifesxFVXFkumICDaewdUluSVcEw8LBhfmQhLv8XUA6FgPzWn
	6voDBOIqh0454RP1ZFWjn1Wk8kH1+omAFIC5XMNyEjc6UgOdW2bNg0pGNuf2nUmCK02IFbVylFXBE
	tetfExOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SYw-0000000DkiV-0JgZ;
	Thu, 17 Apr 2025 16:58:06 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUe-0000000Djej-1CVj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:41 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2c2ada8264aso516801fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 09:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908819; x=1745513619; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nu4943dg2Pk+bcmuLvvHqjkr3/0Uk0VMgvuphC7zY3o=;
        b=zqoNMdCW/tfbCXWEkJJh5u0EIzEo9xRn39/RHL37vhqvNN9sZ4HjF6l0/2UO9cfORk
         wI38DDCmAWeDx/bWl0XDKYIkt7iUUtWjZ57kmRe7WRkE+IHb4vsNsx4hV3SCI4+ZVmg4
         kZOkDnqSZzw6tWYrIQG1j1zvQMkl6RT7nCEFXOzD2FJwjLIp31Fb9oCISOLx7JXDV2qP
         Pu4lrxtWgl6ImSf3nusmMcCXCtXflHddc8e6sHDkIGGpB7/6uM7BOcP9UH8OPbrZpHVW
         ZGkNf78UApWle+Yf0YCiQ+do7neDpYlIPbrNV2upFqgy+jTsY/lLsjUHUErBibe/GDb/
         9uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908819; x=1745513619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nu4943dg2Pk+bcmuLvvHqjkr3/0Uk0VMgvuphC7zY3o=;
        b=ZlCGzhVW1uXYCro0FQuEstTqSmNqa4VK+nmizNNU5e+Qkik+vhnAI3RPE5K8ALqn4H
         eGwlrtAjA6AUCMqGNH13BsGh581sCrKcjeO/x76qvA+hTK4NhIOWLefmq7dDnsndIM82
         WDVSsbpmodb0F8L09tKXe263Vutur39jyf5waF29P/oYG7uzniWEUjckKDBTrSFGnfhL
         exnmDWuSpVgxiwX/8nn3nQ3LW/r/9U6sUxyOBGYg6mZJ+eHz6v9MfTzl5JU1jq54F0TC
         Gv8MyKNZRJyBbY45quh2oJx0GLbfHobHtyBIgyGXMDhkhmxpP41+fJnE2I0zVVIYPjWI
         L5zw==
X-Forwarded-Encrypted: i=1; AJvYcCV/MdPhckOjxIeQPgiuefR73FxOEogZ7Sd2O7esv1naGcNDnJktlJ9PwJrc4qSvcocp4uhlQ0edS7bYQ0U49xye@lists.infradead.org
X-Gm-Message-State: AOJu0YzpY4wQ1OiDWCCM1fXdh6CKIzmSnC1++vgr8tamjc0NBVJzBFb4
	mB9czu5WiLwCtlZITpmBfl/PwTQoHLQ5i/ams3kMlVCWfJFrVMGOieEfY1uPX6g=
X-Gm-Gg: ASbGncuTUIG+jKIzkObnZSvVXZSXDuiMlX6vT433ChUHEradsjxuldEbHomCgEu+J26
	5VKRxYeY7Wp0TFWlqWMfAbGx81bpAUNXA5gOYTGjg+/PNNTZZQChPaVUmdBfkB+i5mS5LQcc6Oo
	TzV6EWvtHLPqvBdya9b0w0dmZUHtG63DFhWxsZj8vtgekH9RvahWBWnc+oAg7v7ANFEWepbay2L
	xn2pUjNMxd9Cm3H2ul0HTYOzHF0rP0Vv7nvRWZsxLRe0C/cIeHF/3fd01HZLjq9wuBEsuR2Jbsh
	6kTosqB8ZRZcxvbzL1REheeNCfQSmoCLEOgWqe6tWMhFJ1FqJS29HL3MyQ==
X-Google-Smtp-Source: AGHT+IGwEsmY3NyPkCPBCO1td4MKsKQCaHFkR6HGlUIvu5S2DBjcqDrjeSVGpeTxzrXMhy/9DDR21Q==
X-Received: by 2002:a05:6871:d80a:b0:2c2:d2b8:e179 with SMTP id 586e51a60fabf-2d4d29cc3f6mr4240604fac.4.1744908819277;
        Thu, 17 Apr 2025 09:53:39 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:37 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:34 -0500
Subject: [PATCH 2/8] iio: adc: mt6360-adc: use aligned_s64 for timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-2-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=WBd+USN8oBva7x6dTXqEXzGbksHW+JPbiqt083CEvM0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATHgh/KpCPdMfDSZdZwO0twpeUH8w6Bp6mw27
 yM9Paqb04yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx4AAKCRDCzCAB/wGP
 wOBfB/4sAtaobNgfH0comXMtYx8J/ZbqnniJM6PBSi81wigpWaU6BQwSLvZ9apGiXVtqYlbncIG
 y7Ip5Rezb3ea9YAeAHCbFjFHPww3jTaKbl9Pglw6HYss+9lIZkjHa9fsAJCb9nlDlWauj1gjBlR
 uhE5aqLGU/KisOj4QWs8TV+EM+/MeutNaGWGrALoVUjG7PvXK525ug7W+N8E7P3cXksK/572yv3
 RJp516+TKyALXADXXpnorGRvP+y5e9QW7JTQTB8gGxopm5ZxtGWVTHDvqosipIbiNH2hXzF+URT
 TkDamo8F67AwrSBmKUadZJxl9wyzUrN4SQJQRHAZV+Pp4mU6
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095340_340925_833F03DA 
X-CRM114-Status: GOOD (  12.04  )
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

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. This will ensure that the timestamp is correctly aligned on
all architectures. It also ensures that the struct itself it also 8-byte
aligned so we can drop the explicit __aligned(8) attribute.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/mt6360-adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
index 4eb2455d6ffacb8f09a404df4490b5a11e49660d..f8e98b6fa7e923c6b73bedf9ca1c466e7a9c3c47 100644
--- a/drivers/iio/adc/mt6360-adc.c
+++ b/drivers/iio/adc/mt6360-adc.c
@@ -263,8 +263,8 @@ static irqreturn_t mt6360_adc_trigger_handler(int irq, void *p)
 	struct mt6360_adc_data *mad = iio_priv(indio_dev);
 	struct {
 		u16 values[MT6360_CHAN_MAX];
-		int64_t timestamp;
-	} data __aligned(8);
+		aligned_s64 timestamp;
+	} data;
 	int i = 0, bit, val, ret;
 
 	memset(&data, 0, sizeof(data));

-- 
2.43.0


