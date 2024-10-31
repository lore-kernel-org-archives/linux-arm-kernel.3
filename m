Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FCFD767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eFpuHm2y8IhduDZB/M513Whn86C6+1mG/A5c4wAVb0=; b=HI8CUk7PADlDX2vikrVxj9iXcA
	RZSrioS1UILRykfvhpAWboJWrdAh7Lv1aP+Au49+gupTNmtMV8hiRg7g3DtMi8oQFsuzwUjLG0nQR
	Q+me49geIifBN/Ga5mSmXmTFCUHzw3c21du6SAEIDtHqjcV7jECAHC/IrBZ51vdKBixanQt6IV/Jw
	EXv3rrFYSNiccADhoh8cigX0GDKwPUK3HfrCLuIrrmd7LHNReHOSgNb/0+7zbFEc70B6tbPLF1d5J
	GrgV4LNGNqBcOSPl9ZCyVlFThO2m/6XyOuo4eGE0fnApnkt49ve/6Pk8JOgChxst3jrlMNXYjnN3C
	jGID9/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XJa-000000042nQ-3Gxt;
	Thu, 31 Oct 2024 15:42:26 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X52-00000003zJh-3p3a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:26 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53b34ed38easo985003e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388443; x=1730993243; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eFpuHm2y8IhduDZB/M513Whn86C6+1mG/A5c4wAVb0=;
        b=ZMsUxvkWNPk4NkBGZobVmR+PsX36YN5GJZD5oqmJPGcG3kJCsJuk8Qsr5MaRus0BBa
         sz/0PCbSKrdIqgB8mwQjfohrR51U5aTXHxRgst7Ijs2AHbEhTqgd2kGON2DcU8WirLOW
         TcQ3gzsJJWzN6oPAJXL7EWGLA3N9BTtD74zZCCBgQVcVzZ+kp+9FzFathFnRJVXSa1Sy
         qV1tQzcnlhN9NhGXJenq5rbrpyub7ewJOlEOwG8TVg6ub+rWLnnPw3i3qacYqgh109+g
         IFGzIQKlDPfPBT5mgQuI5hnxMvojadYP6OQ/ZqMjFW0EY+OHJSk5O4FXCqoOIdNOWeQh
         XjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388443; x=1730993243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eFpuHm2y8IhduDZB/M513Whn86C6+1mG/A5c4wAVb0=;
        b=FHGIsVzJ242zlIit1HT9PJH07xqiqam/FeVOJHg3Cj0EirL3DHkYQfefB6vJjCc2CZ
         M5NLh23zxii1dKYNIUXMHOxUozS6bwKyVzq+S7ud2boiFduIh5tjQK1YwjpYEQezgG1c
         D9IYISvB34yu9Y5mt3azu0ZDltiPRE1vvhjG5BBMxZlfythlc8A9TikWhXfAC/pVuIbo
         9o3vR2q0CupnfuxS1BWLKKAArUvDYqXz5o881D0JvkFrnfktkKjAjO6JNaigZUOsjzt4
         FHJHosXTw3NdXny4ekSG6kToCUT/JejeUhxOoLcpI4vIxFK/Hz28ztAaStm8nECPdGi9
         FEng==
X-Forwarded-Encrypted: i=1; AJvYcCV+SjVhcWkU4FEgdvCdwbgH0TmIfHPD3Y7a9rwyH8HmkY00patkgmQmXt/J623UtAQEzjZrhiBqVHYS0YrDyk8z@lists.infradead.org
X-Gm-Message-State: AOJu0YxNfqMgtOHALPmzbNHSqUoSmZ8J7yXxCwxB0BoOgfUADbec5mBa
	T6COLFcv9H6qAIaGOU9fWXVPh8Du7N8OIEzu67y4wzlH/cJyH3WJVtsH/5AuSPc=
X-Google-Smtp-Source: AGHT+IH9GtPIDfEpLZ8dUQUUPpUuX42GuH32Iyi1Pg0JcJazEapLSrEjVmA9nEmKnKLQDMdChJoKlg==
X-Received: by 2002:a05:6512:2341:b0:536:554a:24c2 with SMTP id 2adb3069b0e04-53b348c8978mr10450230e87.13.1730388442599;
        Thu, 31 Oct 2024 08:27:22 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:22 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:10 +0100
Subject: [PATCH v2 15/15] iio: light: apds9960: remove useless return
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-15-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
To: Mudit Sharma <muditsharma.info@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Anshul Dalal <anshulusr@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Ramona Gradinariu <ramona.gradinariu@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Dan Robertson <dan@dlrobertson.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Mariel Tinaco <Mariel.Tinaco@analog.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_082725_014507_18F2DF6C 
X-CRM114-Status: UNSURE (   9.73  )
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

return 0 statement at the end of apds9960_read_event_config is useless.
Remove it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/apds9960.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index 7b3da88885693c488807da459ceaa1cbb3881bcd..d30441d3370309fce9d6c717d42b829ff1db3174 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -749,8 +749,6 @@ static int apds9960_read_event_config(struct iio_dev *indio_dev,
 	default:
 		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static int apds9960_write_event_config(struct iio_dev *indio_dev,

-- 
2.47.0


