Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6702DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XW1fv0kwi/nQ3dGRXBHzXPUX6o/kxBDhAxFNh3mGUUQ=; b=oFhDhnNXpK9rqLRxW77CKFJ5y4
	JAg17IKx7HIinBt+x0QFauZe8oZsOq6/OjE1t58RwHKpwzdGpXNl2cqf6XDyg7jBVYzQcoBLKPqWr
	J6rgFbdcW9kPhcNjcr1ClIldB7bI3hUFwvMmFBCUDOKx7Txlsy2IC/bNxq3ZKSoyM37oS3gngAZRo
	GP/PwBW8EenzZf01LrW/hbch11/uOIjSI9Dkh4jYk1DnPkWPvC+8KVzHTjoUoL4gli/lYIeNe1rGd
	Ok6/8J6sfc2khnHeGycZZxOWglq+as2vnGabHYfmtPYDZANDUm3VGKo1H0WFnt3U6w20lDEKfd/WO
	dSX0CvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10GZ-00000009BIY-1elM;
	Mon, 31 Aug 2026 11:33:34 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10GU-00000009BGZ-2soG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 11:33:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d6f9e2f681so30772615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 04:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176006; x=1788780806; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XW1fv0kwi/nQ3dGRXBHzXPUX6o/kxBDhAxFNh3mGUUQ=;
        b=ITAaG5n/zB5lpXKmp+aWyhQWmXYeJhAOhqtavLeAoYLTbwb8aV5Nvr/ukMh9aYbIGN
         akRCGFO2Hsu0eZNkkbSnFvRYi8bCVC2PBXhd5R7RuLmH18w3jmSfdF7Oax1RkSyhD0mY
         4vT5iZNx4nq5Rd/1AgZvXxI11fglcdiCJgets4K4G9PHn2EnrCKP74vugNe8rXjgDSjr
         eaODtgjdriQ2LDnazGEiN9oATShMeMd8t+eAk909e7vkfr69i+kfBtu5ETadLtO40xbX
         hQ6KEN4BvDlCW3I0v3UxkQ94rQ8KypMSZBj8CD4KcMujcbtxgaAqy32dXEuyurfoGPKP
         LFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176006; x=1788780806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XW1fv0kwi/nQ3dGRXBHzXPUX6o/kxBDhAxFNh3mGUUQ=;
        b=gye8TDK+Kqs8RcOp3Oqapb03NkqhYxVsJNHylb+5+HOkf32C0oYOEbBRjogwc8qweG
         bUr4xW95M1g+KbDVJU92B8OQJ/9M/YjYvHiXXDjao5UJMaw/rNc5HKNYX1GwOWkZ5FeX
         MgvhilBKEY0+Uw7zqrDPVdw7lLtND7RO2I5E3XETZz6FVPbJ+3Xlyv6pb+IT+Z+Usl5I
         VjuyzEg8iJGO+Geo0nsk05VLV94LeAGN88GqhUkPPDRHyKuXdMExF4e0WrDJEQlAxcrN
         6UmRnTVbJdMYKXRVxYasPczZC1zQlXAJL1qHstLN1LtGaGII9I2pvH0tUh+o3r2bsRQQ
         TOIw==
X-Gm-Message-State: AFuF++nq80rp11mGt6X6kW9ytYK6HrBVS9WAkKmTupkYqKzwZbCKb41h
	/d2rVRI/bRmcKZz7QuNDISXwVaJ8/0olK1cq7Tm1aMgCO1q025bXx0ioIw5UZA==
X-Gm-Gg: AYBFou01rY7Is3tu739LW3myGdIr+wl6ku1gFtLMJTn/QpABh+YdeQ4TFNJKyj4FPbz
	gik1qeVkRt/TMX5LqLKv+KGwlSPgdAAXn8t3t9KW0g1kBD5h54TzK540ovB7ILU2SMuaXqbf51E
	4oFRxBaVhOTYDM+4NnAfmMFM0+89bPVB6DZvYjqoOnjYIsw1E64olhNhNhp7nTH2FJFwYqb0fQM
	TjBwi6xjW7cwE3vFm+CPYvkKZtENIac8Q5P/DwLOtbatcn6V0VpKLoxElOPXeBlJKtvsmqRStF9
	Oeh8pzcPEWiOePYL77PUaznZLiddfMQk/CoSnuEcsb6b/VnvEWf9GhlVsVYzIutMZiuPvEmYI7D
	7uJSnvmak7/XWg0RpaRqDB+aWm09qXWZ4MidKOyihbxwYoUhROzWYE+GA3sJ19kK4iKnY4Jxkxw
	BsPT5xCCo9wGVaVRJhJ8K8081iDHbblb22bh1KCc2TBvrA1wtjEnWgdcne5NZEBAg+d8z6/Smco
	Ph7lI/AxLZ+wDc/kDkpiDU8VM+/2o58b1L6YfM0bPKsSiuJ0tLBhNH/3UuJVjVovXJ3mEt6iBan
	a8TY3dBfpLSg8+DbBdcNEfvrkjhYsFEKgXpxYHp7QdmjEOw=
X-Received: by 2002:a17:903:3884:b0:2d6:3c22:993a with SMTP id d9443c01a7336-2d74dbe96fdmr395526865ad.3.1788176005776;
        Mon, 31 Aug 2026 04:33:25 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:40 +1000
Subject: [PATCH 2/3] ASoC: tas2764: Initialise SDZ GPIO low
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-2-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=h18x5qh3r/K2uj+PUBPj504Z+VgTxPWjoOZOzfgxBqQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04oyv55k+3NF4cXT29vvFYhfSD7A7TVvhaD5tDAH9
 U6pH3npHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKn++obhr6z92WVLP/QJBez40W5z6LJLu76SzCUd66dqfr5PlhS0LWL4n97hU7y
 eq69PXNms5+onSc8fF8QLUtttV3+6clXGQsOcCQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_043328_601680_20C3E012 
X-CRM114-Status: GOOD (  18.11  )
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

On Apple Silicon machines integrating TAS2764, the SDZ pin of all
codecs is connected to a shared GPIO line. The kernel's shared
GPIO infrastructure relies on the first change of the GPIO state
being marked as its "default" state, and allows any consumer of the
shared line to assert that state without consensus from other
consumers.

If the pin is initialised high, the shared GPIO core does not
allow the line to be asserted without consensus. This breaks
resuming from suspend on Apple Silicon machines; the driver attempts
to restore the codec's register state and fails because other
codecs are still holding the line low.

Initialise the SDZ GPIO low so that the first state change on probe
asserts it high, allowing any codec to pull the line up when it
needs to.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index f9c65c9f6d0a..b3c08d106dd7 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -960,7 +960,7 @@ static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)
 		}
 	}
 
-	tas2764->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	tas2764->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(tas2764->sdz_gpio)) {
 		if (PTR_ERR(tas2764->sdz_gpio) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;

-- 
2.55.0


