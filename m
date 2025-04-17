Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3511FC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IMlCG6dKgbc70WZaRCp+xgycYGsZNZ1T+JeRrzHG38=; b=B7MFMXio/lRdc/3h31/e2xLjEo
	9J9gJD0Klm6bUA/4frZNInd0cBA2xnSK0p2Gv2F9T/v/+Jzq2X25ab9c/mOLdlDYHAeeN2rH8XYDd
	K0Zri/e+9LFzZmizHdqgI6UhSDv3jCBcikbkf4/f4Gi+OkJFaNoexhMm9Fj6E7WI3mmKMw1pwoT1a
	zyD+bbXWLRl56RcbrgQDQfLvbIVBLGM0+u7vW7SbATJG4LsujnxKZO2r0DZ0tWKAT4zPL8W9N63SG
	a9WL/MCGC87wmM84oWsqyQnPDcgKll/pPrNYiMXJ6ZyHd/d91mNawh843JNGXoRalKpp0zrfw6904
	I+xVHFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sll-0000000DmyJ-1FgT;
	Thu, 17 Apr 2025 17:11:21 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUo-0000000Djk8-2AQT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:52 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2c12b7af278so674194fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908829; x=1745513629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IMlCG6dKgbc70WZaRCp+xgycYGsZNZ1T+JeRrzHG38=;
        b=SVyjgHWqNeYVLlYbFZAhvjA9cvpQGRfJdsSd1ajLJ8Lk2Q7VSanSuV8ZD4pCLtv0MR
         uq0jXCQ6GSFdBoMpOS8crPyjk0QMsxMFq397xmR07CGewVzlO5XUesbT318ct3RnK7zn
         tf7MAeonGjFgCU9H6Znb1Iky2U/axQeAH4FUygZtoJpi7pkuMieB8WnEfTYtn1M6Sh+/
         a+Q+GKKb7p8T05WI6aZcwUI7bJu5bfm3CDV2VzIzNurU04/BsTn5MfKUFdzyYhaVtsmn
         xwIAfa/EPeOIBCSBcRQ/u2NLHpbEDFNkEU6E5yoOeGTj6ZTHOZztY/U3D5WYlN9IPsRS
         IpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908829; x=1745513629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IMlCG6dKgbc70WZaRCp+xgycYGsZNZ1T+JeRrzHG38=;
        b=JXUdUkF7oY/nKk7XJrTcsK4EjlWK6/a0x1/FYHrYqe79Sg7Rk/oa838ImWciKgLymv
         wH409+tT5OtdpClOLMtK2lXatAmK3e9J4F04O806wwgCCMs7NpJZ+LVzoYzSuPxnbgHz
         MU068docv8V50SKQSjcqn3ABmAW1+dmIxveQGphWqYDhOJXbJ7KAs5r+qVBDFu5LcD1X
         olu7JZ2YZXy5l73lWl0c208EeN42BkM8h3NBdazkaNvk+zDcZ3MMlnbAwGHzwYmPtDmn
         piEaBQp4rbmxzY7xTl3ipEzBbzUKx5gAfJBzPOBiP9G3U0cAJPTJsMOzo3hUcNjT/Wyw
         2vvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx8d6NFgEE1GDVH2ueu1h3FVxKhhirGii03nu12kp2rgAiJvaqbYFeFD9oICDMwiwZDTsJgnXu2KWwhSByKAyn@lists.infradead.org
X-Gm-Message-State: AOJu0YzG9VyFchCOpPaDtz+zMNEtPbd8i8zAsoVKnAWOCaysI2TpfkTt
	NdnwMMkK4ln3SFtngXRWElAAy3KOPqY8Nber+iyzQDn+ZzYVb3CC/jwPP+IfP+s=
X-Gm-Gg: ASbGnctexPIU+4xFHPYIxvuU+NhfH2M7h+lHWSUoBz3PMi7QN7xLtPjiy8d5hdoAqqd
	5hOSh7kiMDfQU2/irTBNeSKmgKajOnKBbBBYdEXwm/4Tbtc74u7DhDg/2pfHSkoMH7QhcHuqKpl
	cUbdoyJR/R5jmtX7VKZ7Ouw3jC9oR+GutRtLp8PSDWHoH01T098Oi3hc1FO9WpwNSYjaFXlBSvk
	LlMxBSvSa0G4mkxan2pdpiCbvCNpxr7imBza1ePwOOSZnJmXG9s6WzHhYQQzqvGIRTQd96aWvpU
	p54m5HDer1NrUBqFE44isR3RbsO0duGDtuG+4oFzIpnWWzw=
X-Google-Smtp-Source: AGHT+IHWDVE2JOtKPQU7CbidZGVyB/2fs79a+6FRXoQ5Jm7PUZX3WMp/oUPBswy6Dx17VQWL+Mf4bQ==
X-Received: by 2002:a05:6870:af85:b0:2d4:f247:3675 with SMTP id 586e51a60fabf-2d51d858794mr378775fac.5.1744908829446;
        Thu, 17 Apr 2025 09:53:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:40 -0500
Subject: [PATCH 8/8] iio: pressure: mprls0025pa: use aligned_s64 for
 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-8-eafac1e22318@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=dt+1gVnXlBpBf9G5BqjNbQcFysZQg2dzjajvzJ7EGVY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATIHV4NNNWvRCnxHGqKpmu/bY2WH0c2xw0wRI
 MBr9oYxE/SJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEyBwAKCRDCzCAB/wGP
 wJxmB/998v8PSB/5F3IVjQ/L03FccQbQvgcinddv5IhMAvKwG+4u3ZgXoVkpfQEc1Oi/TyFXTry
 D/3jb/fsR53axXk54ddIaElK0Oird/9HbVfsLw0KOvACbrty85JS48EvTq3UCyt9nHyQHCVsd5W
 8TLc1kECCNVsf6x1LB7DxLrQNsd6VvA2FuLb1a5VribVYxR+okowWqAAmjEu3F4CnAGZWvZXljZ
 iQ1hjfWdxslpauWfw7HRAqmVqLoLhxznPLLpFpGysSKe4XAe3wlvC/jYIVlZRMVKlT2fn7r55tV
 o3psJa48e65bIp8T0K9RY7/W/+GEVn6tymZGuZlaKtYyIGFE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095350_549282_FA600DA8 
X-CRM114-Status: GOOD (  10.58  )
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
timestamp. This will ensure the struct itself it also 8-byte aligned.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/mprls0025pa.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/mprls0025pa.h b/drivers/iio/pressure/mprls0025pa.h
index 9d5c30afa9d69a6a606662aa7906a76347329cef..9fe9eb35e79d992b2a576e5d0af71113c6c47400 100644
--- a/drivers/iio/pressure/mprls0025pa.h
+++ b/drivers/iio/pressure/mprls0025pa.h
@@ -41,7 +41,7 @@ struct mpr_ops;
  */
 struct mpr_chan {
 	s32 pres;
-	s64 ts;
+	aligned_s64 ts;
 };
 
 enum mpr_func_id {

-- 
2.43.0


