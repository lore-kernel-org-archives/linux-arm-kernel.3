Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC124D767EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eDKpTruMZP+IxXjbPpb2d8Qn7H2+5jIQszhP7gdxmg=; b=kpTcgvAGP8ztOJQH+/Ah00D5MP
	loiqHpynjMxIp4xcijuWQxxnsveupx0ZtYlf3eKNnY16ejiiqGgPjsIx8sOKgsMWidtUrxkA2DQIi
	cwe4f5pWedoeSmORgUJDqvyNxZk/5g/bBe5xGYuqpphYBaEQeJ72mGbRRBzgUuLblQyBUzxcAqpJs
	gSvl9a73HkbiOmm3A71Qi35+6ENk3oP/qo7qFhZ8hgMHRnh9WMu/7LznM7hqkmfVJs8stUNn4mXz8
	02ux6IJlVz/fekpVeWZ52T4WefYiKVJcdAmN5jk8i3oqbVKVQtAXYKGdjUB9dPh2wYWn36HLPcVHO
	CsRPPueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YXk-00000004HK4-2Ap8;
	Thu, 31 Oct 2024 17:01:08 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X4r-00000003zEu-0JkN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:27:14 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53b34ed38easo984744e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388430; x=1730993230; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eDKpTruMZP+IxXjbPpb2d8Qn7H2+5jIQszhP7gdxmg=;
        b=iZEDOvznGuVSsUD7X982+ibb9MBfT6BYt8CBD0ci2M8RouLPD49PSfcICmSM8rfKnm
         0evj6zvY+izmrNAoLbQSwiY2qOJ2Qve1hyyu/eTwHrDMLDAPLXnc5v5cwI0qVVggJKx/
         q2IMq+Uhox7Dwpae93Ap7b3nfiO5x2/lS56ePWGdqw5seOHhrFnIVqCz3pq+hM54sd7C
         hZkiRHcrJgkEjxDUO0ge98GIeMypH/n8y//cnBbmi31ufF+oVdC7Z0t55O/qBNjL9Ei/
         H97DNmYWnfLLFKC4IqD3zaMpLVpVJztsfZIKYd4R+C+1ylhHfmHvYLPtiCmZ6n83l17f
         PuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388430; x=1730993230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eDKpTruMZP+IxXjbPpb2d8Qn7H2+5jIQszhP7gdxmg=;
        b=KpL4v1Vbn0YZDbhEZWX5s34gL/drVv29gCSgAzESkUXPOeQJHbiRo5mT9D3krSsUa2
         AE7hMUPCvOvnYJdiKiBfZMag+9Ig6t6fJf8QJNdSUwjyrfxql1MFm7pIpSr1asKJRQ6B
         8CZnDQMCk2X/W7VvxezwTLQAt2Epge2yb1SoAQdpuIqQ4CXJ7M49lT1YfcG0P3MO9KnO
         WOMueqSXAReo/MklMQMtRVzuyvOEA1XtqAaJq6LMsJeFhA3cIVOWEGuqQgmYbiMUNmQ7
         Dl2esa95zQ6N0+9Mpv/4i2QEvXz3+KOdMpcPvYEnPCXaBxEy0WSTpXdbq+zdbJgdq6/i
         UXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgQpZk8QGuhv6+EAmpCXT1tVAH1Tzbpd0DP4KSNbXnSB7P8TgsjdHM+yL06AyXU1JlyUrsZI47vwy0YpbKXWC6@lists.infradead.org
X-Gm-Message-State: AOJu0YzWTR5+mDpM6PCGW/UwmOt4SSGAnQfz9G5CdhBCjDcRKWWGPrto
	yvWb/GWfLKyVkKmxnKkXYh+QmrBI1e/yH+0elB2E9QbJAT4meYvC7ePJht8s/qs=
X-Google-Smtp-Source: AGHT+IGjr93P1e7lz+9DxAcqNxw0ZM4hWmcWRfsYdyiLlzZAFmm8L5DUz7on0ZrmWR0iZ8h9Nc8dCg==
X-Received: by 2002:a05:6512:3ca2:b0:539:f699:bb29 with SMTP id 2adb3069b0e04-53b348c8d6fmr8574506e87.15.1730388429624;
        Thu, 31 Oct 2024 08:27:09 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:09 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:26:57 +0100
Subject: [PATCH v2 02/15] iio: proximity: hx9023s: simplify code in
 write_event_config callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-2-2bcacbb517a2@baylibre.com>
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
X-CRM114-CacheID: sfid-20241031_082713_153231_E17AE627 
X-CRM114-Status: GOOD (  11.88  )
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

iio_ev_state_store is actually using kstrtobool to check user
input, then gives the converted boolean value to the write_event_config
callback.

Remove useless code in write_event_config callback.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/proximity/hx9023s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index d8fb34060d3db88a3ba5ecdc209b14be8e42e8b9..38441b1ee040c7c26047b0cb2ac443ecb8396df3 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -879,7 +879,7 @@ static int hx9023s_write_event_config(struct iio_dev *indio_dev,
 	struct hx9023s_data *data = iio_priv(indio_dev);
 
 	if (test_bit(chan->channel, &data->chan_in_use)) {
-		hx9023s_ch_en(data, chan->channel, !!state);
+		hx9023s_ch_en(data, chan->channel, state);
 		__assign_bit(chan->channel, &data->chan_event,
 			     data->ch_data[chan->channel].enable);
 	}

-- 
2.47.0


