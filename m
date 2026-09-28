Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D89CCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=; b=z0H7TwecQqyucysgr3zEGN++k0
	ETgN9xwOKJRKPyUyfiPbAAY11VZRApyRT4N8JkQ0s3uzncb94cOrHd2krDD+euxetEFtYS946cs7h
	QNEY7Xx0vhedEvNbfZIeUSA0lj2cQAkrerMWdJr84WGZBafbm+fNW7m1fqXq+MUqsO+ddybFilLL8
	1Pi/EQ89r55OnWO5Borboy4hCtkSyoEIkRzX4HNvfHt6flKpv412ZKWlBgCFhxA3Vu/KcbkfWc4a/
	zpGpZ3st1io4nkSEbc8g7mlThPzImjINV4X0gH3uypEAW0Aa3Ba77MkgA0hXzPQNwe+JEnLMW0jnk
	PT8STROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIQ2-00000001dSU-0BLz;
	Mon, 28 Sep 2026 20:57:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIPz-00000001dOy-0usA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 20:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=; b=LGuIFMRBvJ/F13tgTQ+2rfJ0C9
	S1ZKvTc8i6EvHAuualMGpaxUGkQT1ijTS9lKJ9+4TDxzyMEzhCWwNhbva+RNFtayQhRAyM4fN1bmW
	ZFhA8cXu3/QRFOYFbPRxfGB4BEileW3G22gd4NB0qkUcJBJjCfkXN5Q5PJKf/HN9euQBec8GBsQ7c
	8LtQU8PdBbMOgdC0UZVfFeT3aibBWYgSzfrZk6yG6j6d/JY1w/5Tb2yfy7cqx9mMP0pOUJypuEV/q
	eXcLvW186UeJV6IDqoAJHianRrpXlSoJ6xJBT9jZBiJvsmBmVg3vBQl2oF4PqQujft9bbNjoklbSS
	Lw62e9Ig==;
Received: from mail-qk2-x05.google.com ([2607:f8b0:4864:34::5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBIPo-00000001trL-0Qo8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:57:45 +0000
Received: by mail-qk2-x05.google.com with SMTP id d75a77b69052e-53347efec86so10654141cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629054; x=1791233854; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=;
        b=fD9wO29TKUPzxMayGBC9fwCVKuW4OBLjoxbtRo6vNgUZH5V6QBN/Iv5WTVYxCt5L2r
         phDgTdYNU+EILSXTwhMyvZNGuMkm8ARkCrQ2XxXiwd9EsdYzQJIZXTUIQfeWWV7BB4qb
         gyjTmgir+tpzGh6DdBg2//5kJ1Z4rQnnaraU/tgHpBXG+KogeWPUHaC6YDzTJN1nAruJ
         aEEl7GzlPPpcnVJ3W6RjuarETjsCgdeQx9sjANVkdy+/LSu7PHxOf0qdzkezHvV4htz7
         9yhKSapyAs3N/n9pOReXZymg1RUoyRAEZstj/qy7Pi/wY7ThjeVXBRuo6xuic9SUiV1b
         4lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629054; x=1791233854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=;
        b=lbFVyNcqpql1NDhX5RO9UrpCdTZb5p7efi7mlKHVTA1NjFLUXPWCZBdMc5ju6PC8mj
         jKrqIqzIgMlKvhg0/F90z7MTe0gM1qidC0kHy4mPmgA+vf4rpssQScapyZoUIuGUHOOp
         UsCEiGcV+x3L+hkvGE2wsnPR9MumORmWNjF21typH37MeNHJ/dPdyp2vrzqepPX3h6YZ
         j4q3ySegvyrcDx9C7ocpfrScbtTSdh1AwlLDuGqx0eDl8Bcy5oIgbsP/8wu+YBdVey4w
         02ZHhyYyUvaVM2i2IP7u3ZQ53Y3Si2g4s7tECMluvWtzFvmRqazF1FWvuQ4Y7B39D+Rr
         slNA==
X-Forwarded-Encrypted: i=1; AKwUvBzR8SlXURL4vYeyvJgqzNCb8JvZ8EayCcKk2hN1tpy/SSpwqWyOzlqtQVXIM63Ytgtp2VFP69+eJNvjefzVHNro@lists.infradead.org
X-Gm-Message-State: AFuF++mUTFVv9wezWuiW5P3jNCFDwx6dENPFHV0mGuoBG2QtJjKWwwl4
	S34YeNA1h1BwVGKXbi1K4m+SjYekJh0Lqn6AipHoHmy1tXwbrm9W8pal
X-Gm-Gg: AYBFou0PR+kxjaRVk6/t+V/5PYKfKqKmqelulLTEn0vmo/16pUXHJ+YAkf/a84iwDkj
	NGgFGOiPlgMfn4RYV8Kcbmr2R5Kk4audROahYNi/e1X6iogGgwdKH+/a2d5T85laFr+WSPtcUR0
	LJeICgJsYoUwJbm/Gbu1t+YI5XABQegzOLvixgw5fIb27TbcPC9Jj7Joda9qOJlVu1Gx79xZ1Lk
	fCuqh1OBOF5ppAZ6K8iBLB4GOOhEyz45Pno+4PpZa0jIIdE5+UnBVEm5tkghk9i9pb6Xr2C+6rY
	oP02RRkF2R5Ona1an/bx8W0jkFpbuYXWyeU18/hkXdsm7/W5g1kcCJE+sqe7H5peAqrRcMqrC2+
	dvDCTl9bm0J6nagys1etJ1n1GMfIywlFnsYX0Sc4muJhcYlPffKSSyKLrYluFc2gBUl+mVK5kM1
	C04DaawYs0pm90yl25FeEpzLBQ0Cozr/0V2W1oaHiU7QTp1kC3p/aVZll60G3DjPop9k/jDsxJF
	A99M7FyitN/Y8bY/ltURe0pwfft8VLn0PCalIew/offkCwSrD9iBMaYXkeuq9uj5N9Fwy134C8=
X-Received: by 2002:a05:622a:13d1:b0:530:e343:b65a with SMTP id d75a77b69052e-5330b6ac001mr253823481cf.51.1790629054051;
        Mon, 28 Sep 2026 13:57:34 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223c6d82sm71443421cf.21.2026.09.28.13.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:57:33 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 28 Sep 2026 15:57:21 -0500
Subject: [PATCH v4 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-3-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629044; l=905;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=7RoUzDOZY1QDhkSdG9ZG4g/IuQvy7fWK/zAReNc1Fzk=;
 b=A6AqE7eu3ncyQ70or985e3ODrK8FHn79n9oI/zJvG4E8nupeafb2sik3BBKjwJARUxbfOYIEG
 cbE3E3gNJVsBZowBHGPEj6IcOlHtEOy4pJejW+IVae1ULrZIHdD/kjd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_215744_376176_24DE815E 
X-CRM114-Status: GOOD (  15.61  )
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

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0


