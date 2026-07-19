Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B88EC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlP6ff475vHhLHgiF4j8BdmWTsaSA5axHhKG28Cf3RM=; b=WMX0qeOI7mtsLa+rXjh8FLgoXM
	Iaco517TaH9apGedWRTDrJFu8LldnrkrlTW83St1CO7s9pz4fXTAy+QK5wW6Jx/b6VvkdD0Hx2+H7
	pG3d2daTlD3iraE09fVzof+mcOiQwGf6tY2+IiiMSn27M03SRpRg8wRIhDjqXPoQP7mKRmjGYu44h
	bqJg7pRw3XVw4DAVJuMwxcU4ht/ttaD/Fsz1gWF1PcPiHiWhTZBrcGte12AcSLA31iS3EWbhIoGQN
	BDYXTspFnFk8++osph2xtb6gjMV2BOhGVEWp55P/0oGeF/+7r24O7l2XKqLyAw+t7dCGrOfnwytUs
	MS7WluCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGr-000000056Q5-49hK;
	Sun, 19 Jul 2026 15:17:37 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGn-000000056Mh-2g8T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:17:34 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-39b22d0e488so103114041fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784474252; x=1785079052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlP6ff475vHhLHgiF4j8BdmWTsaSA5axHhKG28Cf3RM=;
        b=SCzJyThMIgfYPISAULTkw0ocIlikpj++Dy0BhoMHiR6cAw+VSKIBmZzzK0MLbR5kKu
         3uG0dDJ9xiiQYNeyRgdib4rw/cqBaXDiTE0boXk8A8vlkDC/pBnbrcBqJbr6rCxTBzjO
         8gRdYq+sOCI+hyScXE8FPJXnQCO6y93HjRaadnTmj44NGHFYi+WD2Bgm9e2EKn6j+mFn
         QF386g8V4XbAx+SbfJUVs/YQVN+CJHOBEBueIOKVX0Sg4gOEK1gHup+jq6E+uDcj7DR0
         61bwPemEO/zSdYtHxbuENpu/52NlZ79ufXxENeDxwn+VW6pFloOJCw1Btixe1uAM48sB
         WeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784474252; x=1785079052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlP6ff475vHhLHgiF4j8BdmWTsaSA5axHhKG28Cf3RM=;
        b=gxXgx7EiCR2CXYR0aEZrzr3gemyOqjAegvyCu4AfttfUh+bgIbaqDjBPsJfLWKALhw
         Q3G8zqKnUiViksouQhlQIPNicsdlMWqc7Ghp1f9FwCuexjOdW8SFqm+BSBaSxBTHkPEz
         ZZd/LiEjS31WaAS53oZyOP8vnpHeB5gwCI1BzH/uFh/gnZ5geXnw/RmxXTJrOtpe8ada
         uMMDl8M4iPy3b4gYwD8adunxBqtFNf3jbSg/IhWaEAYaGA79suHAO3wGRLXObRb6TRDA
         +SuDKaAMzMZjhFxSzIwN0OtVAQJ9KcC5VOq7k85SL+I6dodcIHremLJbPIrJQJWenxOG
         EpDA==
X-Forwarded-Encrypted: i=1; AHgh+RrfxmBRJKM0i5bvrjyJx+RW/LNDjzeBQwi75uO+n+cWhMQlnfvKIrLsaerrH+0GLphlLsmkMVRWLzCPtXkJSeig@lists.infradead.org
X-Gm-Message-State: AOJu0YyKDNX002wBaXrqFntfDaDKQ+jUWe2HbfrBJdxHfRKKguhFHIZf
	KBV+4SJ3ssWxy2k9l9SKTCjqKSMlT5opTtNga3M5aidkMCnWW58pPeKJjGGGyX0+A4I=
X-Gm-Gg: AfdE7ckCrbBxLqrlUUNYxr3ywkWJmCq9uZ+pE5I1LTZB77mL3GWcSXY902xdcCO9onJ
	2wvukncX11dKjdqrw74v9SMD7jOXqcRTVDRrm9nCSfkC9Ou4Ud4NLGdYCgZf3ABWR6bXU9qjO6S
	BMnZhDEi59L0rqhxJdu09hu2YH43+JnhZ6dy96WOWLHZd3SkK6m3oj441EPWLZ0vjR642zgJRlP
	G98thc1sKsQAExPJnroK3zqRZGU9j0SLqRgJgOMtzoPetJTSrJEgoSJjoik2STpTDlS4nvwqolG
	I5Bi+FxXZEzUvRS/77cn+sHj098BeyiReRwxQhW00FP5aZ0xZ+/vQZOGTTLLUaHtvy1ePfT9M6G
	8tyETdBj1fZF5Wf6iqnNb8ZyEZ5uaXqFBulw46W6Gfq9TMGg/MfDeegdj4e4U7j1p9ViVH+Ib0j
	rJqeXFQHH7NG5rmINWJof3H+m22lx9L5krTxrxlCS+xN3tiLc=
X-Received: by 2002:a05:6512:6885:10b0:5b0:f9d:f7a0 with SMTP id 2adb3069b0e04-5b28f85e9e8mr1213236e87.8.1784474251690;
        Sun, 19 Jul 2026 08:17:31 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e26e5fsm1835096e87.80.2026.07.19.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:17:30 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 19 Jul 2026 16:59:49 +0200
Subject: [PATCH v12 6/7] i2c: mux: ltc4306: set correct idle_state in
 i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-i2c-mux-v12-6-a5010d623a57@gmail.com>
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
In-Reply-To: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=767;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=yzE9PLCgDjOTow97MHP1nSRzWz6qa/3+7ghuIIxf6gc=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqXOqNBqVDEiT8/ZRgbDKXqttDBy3Co+sTZ+EAC
 DdKTTE4iWKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalzqjQAKCRCIgE5vWV1S
 Ms52D/9ZWJxpXc+69YwDbf5mbGgWacFFbjO/I0QaymoY0pE4e8SbHnyw1DsTqcsABQykmYAE1cx
 ulrzhhYNkteLeEqN9QTbdJuRZ8G3aNthHgQ9QkQeGjjL+3W39YmbUeyVndbjR8RXpFJuUgsS1MV
 lxztf7vEp97T5aXYjH1wMXOB+QdMqBl04UkHRJRJwrVAV5vELLZ6IaKqUwfq5z0EoYYa8Vgb1d9
 1AgViuvhriqlBp9dYwDHJ7ACM7cqdnOm7PNIk9InQUtRkeP9lhU0wFbzICCiX/UXzc9bLURDsuy
 mBksggtiAlAUcev2DvGpXW3T2P2qKsKCqKUCXIvTbJ/bsDhLUW1SlII1gZW1g9VTjeP/VP4I+S1
 6DzYHfDJhmKxccKhQPQFvSU3Gexb1ZrYuO3hdlh6Bw3bCesHntRkiepaMjBfmA3uiELxPrWay7C
 SBuT9gtX+uMXJa9DqedphJbPKBZQFDtniEpytnTSUpmJ/fmZwA2/OGYQbh5L1+iZY4tQm4rHXMS
 5SNJlthuyPLE3r+iaKKgurQ7tq5Ox9WE1CxIp1rHs/tRr7MMvfm5WMnwgF51hqHvBu/hXRS1K59
 yh3FoIjEtF1SaSYh0jXH4l0qoZI/FwmjWfKCRF/FzGvWAT+GS9hVgj8iZxgH6Hj1NsJRPOTX1nM
 Gnksjc+ueyP077A==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_081733_704257_57EBDA0D 
X-CRM114-Status: GOOD (  10.05  )
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

Inform the core if we intend to disconnect channels during idle.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 18228f5b80e8..df7136b7b042 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -232,6 +232,9 @@ static int ltc4306_probe(struct i2c_client *client)
 	data = i2c_mux_priv(muxc);
 	data->chip = chip;
 
+	if (idle_disc)
+		i2c_mux_set_idle_state(muxc, I2C_MUX_IDLE_DISCONNECT);
+
 	i2c_set_clientdata(client, muxc);
 
 	data->regmap = devm_regmap_init_i2c(client, &ltc4306_regmap_config);

-- 
2.54.0


