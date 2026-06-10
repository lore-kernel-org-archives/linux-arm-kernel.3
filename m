Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3722CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g48rDzZBVCGDCg/97G6a3N/2kOm+y9KrRj3TLV6zvrU=; b=DISDVv64FEx/6Lriu/WlBs5ee7
	SQCFDP8eVAYT3AayeIiZyePDjSwYWfOgg+yNYz3TSfZk8aWF8uqKIu7wp0UXlG6jfpbzPwUUlW8Yj
	xSQM/5N/nYKM2GcJL2lf3cszpG8gKaicKrlJVh1r8nnaVeLojg7j1cxg13sANcY96uCZfugeSsQ7Z
	jZPKB+ZjgT9TVpZzhpG1Sq04SqAI7l1yfVFwCvo9Dwapv3EN/j7gBLL3gaaHNs5H15QnL2Oxzl4pB
	OU1aFWLBXUOjaNheJYc16+UDzNlOMne2wxWkec78RSH8N5hO4h6/rG+oL3zaPPggEHYdW48Yxlitn
	Q/Ux7Leg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3W-00000007N6O-16NO;
	Wed, 10 Jun 2026 10:21:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3S-00000007N1w-1Paz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bf237e1433so72434185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086861; x=1781691661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g48rDzZBVCGDCg/97G6a3N/2kOm+y9KrRj3TLV6zvrU=;
        b=CwpjbXsW2dcI74+KTHElnzcIq9zeReJSiq36jTLdhNtIb2NBUgktGpY+R3/Zm3UqkH
         RtRqQvRmPKO06A+7QX/BfKOI4mJRCeFU9ys+jcIBAANENtAWoaiGw6rDR9d+CvZXVIdY
         dQg1i3sWykdiTZsiNL0SQE2CbTKCx0GQIUQyoAgvoiktAz4AkpgLLiGaDgYMm5dtVu1L
         fXX5hZRT/8HJfOHNFYldAo2KeJJc5sFXI+zFhKLIP4eu0NebsgE50YI3vSMiX3Ibi7Rb
         qy/Ua33Jq25a843YueL3BJxhg/Pf+oeB20megzQsngdLOEYdWGjTl1GyOC50FBIG9+GI
         pv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086861; x=1781691661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g48rDzZBVCGDCg/97G6a3N/2kOm+y9KrRj3TLV6zvrU=;
        b=bPX0oVbZDnUNXyXJLQZJaroe6nIYoYfhKb5rFb6GcL1kk+F42ZLPSICjobOj1ZuZGG
         VrZxwLu7hZWt+s5cQst9/+Bu7MUqVgHFO8KTy/f99LIs6M4RGuCfOI6TfiOzvpkBrC0h
         0IRJcsgAFQ7/4KwE92u+aocJimTQlAHsbOW6FZ3eskbiZvuPwflti9xWdzZQBac5dJx3
         kCliGjt186jhH41yefv54V5EDsMavyjaMt3TCNI6CxjK/DmnOC7sM/VPUfbb+t89+yuo
         QtBjVdZKX+ihCjvNQM81v0Sn1yN+YIIYR5aL7kqwLkahvQh3gZH/6FXmL6pmCN4apu8N
         Nw3A==
X-Forwarded-Encrypted: i=1; AFNElJ/LFNG+riLu+dY+9arJ17tMk9cERjkrJPs76Ypy0S9t/uWVokN0NNqq7Gwmj4QusIY+opvLYNBfoiGUvNlzhLDd@lists.infradead.org
X-Gm-Message-State: AOJu0YxkIuvWpbHmS8MLk6QgepnJD12oOloTe2kxKiPqXyrsKoemIH6s
	B+fltrs7IWzHpdMnTxZufb2Khmc6ejMepe2W9Tj2+9sx9oBt+dKiAwLy
X-Gm-Gg: Acq92OGbEbB1+6/BxOilAttQ1BsRkmqJBxiavxKD22fq/8t8GNcFQKCZWhFCfRK9ZY4
	fkTLsd55uWwkXXujJhg8AAq5n3sPk9cg1VosjImJC+yEfToehcgOZVHZlTzWv0FGz48qt4fsR6r
	6C39Hfx46CK9xjexiheLJE+xt+kbEMFQm9B42uj2UIUEas9wvBaBccC1rjd8IM6FcXfnDGxqpBm
	2sdKuVBVziy+TQ/DGDFItYOLwaa4kIdB+y/pZsb+ZLlsg+MSqRhA0TiJgp7cF5r3h5tEPakq9vq
	eceHj1mgDJyxuVETxb+Lo22Ur8OJEhcx/Ja2k99a+Px9hLfE/jzQU0njg+ryEGKHx1nvbI2WT0W
	y//FGnsEDm//QaI4kYUxeJEEwZIvLGUmsRq9VoQqyX1daUnlz24oJ1WAPkTpZuCJE8AHTEpAj4m
	MIFucN+u7ZXYIHQnsBXD4cjgqdYU8ugHdivszvySdCzIRerDbxnx7oH4K/MyucoDc7xAgnnP5XO
	Ndb518=
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr310019635ad.1.1781086861478;
        Wed, 10 Jun 2026 03:21:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/10] ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:16 +0700
Message-ID: <20260610102021.83273-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032102_376838_662CA564 
X-CRM114-Status: GOOD (  11.53  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Convert the explicit mutex_lock()/mutex_unlock() pair to guard(mutex)
to simplify the locking logic and automatically release the mutex on
all exit paths.

This changes the mutex release point from immediately before dev_warn()
to automatic cleanup at scope exit. However, the affected path only emits
a warning and immediately returns -EINVAL, without any further processing.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index de5e1deaa167..b993ca2dbd7c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -208,7 +208,7 @@ static int mt8192_afe_gpio_adda_ch34_ul(struct device *dev, bool enable)
 int mt8192_afe_gpio_request(struct device *dev, bool enable,
 			    int dai, int uplink)
 {
-	mutex_lock(&gpio_request_mutex);
+	guard(mutex)(&gpio_request_mutex);
 	switch (dai) {
 	case MT8192_DAI_ADDA:
 		if (uplink)
@@ -296,11 +296,9 @@ int mt8192_afe_gpio_request(struct device *dev, bool enable,
 		}
 		break;
 	default:
-		mutex_unlock(&gpio_request_mutex);
 		dev_warn(dev, "%s(), invalid dai %d\n", __func__, dai);
 		return -EINVAL;
 	}
-	mutex_unlock(&gpio_request_mutex);
 
 	return 0;
 }
-- 
2.43.0


