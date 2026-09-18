Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285C5C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 02:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=; b=s9aWKqqiism8bhysPOUZCGZ+jN
	1j+vn/zSfcMagVmBNOJiu4MLApOCKECDkdxYI2Bk62zvwlhlCmdQEr8m1lq68XZtTlws4frSSyo5q
	qk5mlo+sNId+XxihPRDARGYfCoiorbbDmy3M1zAuR7qphRp/9GEQ5foRBF5SE11eYhWvc9fQwYLTl
	4tjstfB1qlRwkRxkdeVISIjUn5fJThhK5b1/80wQXCT7Wq2rcvWY1FLRbBLpmY2Gh4oAhTqIFvHPs
	mVuj4+eQHhLZL/FPcAXV9xhgMAOKorY9xqyMBA3kH6mv3feWSLSGlUh1fd9e152W0xo6LM9Eli65E
	KAHiHMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ODA-0000000DIM6-07Yo;
	Fri, 18 Sep 2026 02:20:24 +0000
Received: from mail-oi2-x02.google.com ([2607:f8b0:4864:32::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OD2-0000000DIF0-08Tp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 02:20:18 +0000
Received: by mail-oi2-x02.google.com with SMTP id 5614622812f47-4a49b13b745so123499b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 19:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698015; x=1790302815; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=Gkj5sbbXeGj4bGinZ+bkkox+xvxO8k38WFbVlxlUVxy3rphrrVS8WvFGc33xsx44CF
         JAmtJpjF5VdMieLRa9Pq+4am5D8JlXy5pbNluFroBNN+sTTKABgM0XV8NPlMZNmbtiqE
         IFsXAqqIeCeOgtZDpy4Thgvrhl6Kufc6FHNoK0u7SNo3nRdQIJPo23f5ONTR0IqvyEZG
         DITTTkF2SVT/KjWJObOm1MRsAZgqVm369dcGouqU8OENlo+1u9ld//SuPy+/NB0fZtKB
         vypKFFb7MVKLhBVp5IVtPEolIgKsWT5nTMGJ8hK7MrwEpvqaZqAZomXzV+IIdK6nrTdP
         JbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698015; x=1790302815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=JyXL46uKDjdVZMmtMH6ZU0rtN8HTS7wHilxPpzycgBD1XmjDFFHcqlr5RucnTOS8yF
         QpVZ9AfEetbaZJkU08/BYVfoGUC2w9m1Ani5pU0k2oZZyT5rogXPptUzJiOyvfusFjW9
         hE/A/KoeR1a0ukZZVVWQI96603TIIoLdkyiYy5JF0PQbhbZAI4NFXgFlwgYNbkcOl2ip
         TTFPjBT+6osCYrqeQSANyMsoSmclG40K3Z9LurjmyIN9ey7bcMSia1yEadwo3dL7L/kT
         p9Rl5sIWL5HlKtamXIJ4FKGIJUphwtonCkX+WCSnOATOtAtzX+gU+XGAIHaETuBpQsHQ
         USJw==
X-Forwarded-Encrypted: i=1; AKwUvBz/br2ZcjoGODYkq0Ot/y/tbhOQR26IVP1jyO5JHM5bt1ryhzYWFTn8Zt68ToL41R9TkqSbOc1p37E2kj3IKv7V@lists.infradead.org
X-Gm-Message-State: AFuF++k5cqIw6leOdL+HBEYj9T1cLugm6YkxQkHtCVZzKjJGrd3ayT4g
	midjySmnbJSr1A/4T4Z69ouS7RSsk+z6LOeNQ7ZMy76IPrcVvWGCNC8w
X-Gm-Gg: AYBFou2bYM6dx/h9uJuO1u/28lzM0/YgiijZc2R8WPaTWLiVgosqSZUiYtvaMMzTJ2f
	BWA/rNIDtYV/jKagkeARKQ6MnKxulVdmreREg415THgR+M/U05tZqHQ44oC8hTLlnnfUApBikLF
	ln+bdvS89QWkynLhd5SES+EuP4v106W1To3mghNZqhNrK+qQQyD7LqQ8DMkOiqn7Z9M9UmHsrvb
	UOyPjDA9xkBwrdu3Fl3KgiyP6QMBCLxPAlLUWhz/JCG9yAAaNG+sCZp29kJhe5fnEC34lw+aJnI
	3ScDlW8+f1MS8J/bZKLQTr5ZyYhk2O9SP49J4wOVQaOWtgbI2Cgl8RY+lBtUx8Jo5hgF0seHOQq
	C9awDq2dcNgJIciZlb6aWM9rXgsuKuCON2Ow3fgLsW2caD05wu8377qZPo5ZuQjnpxvfkJA7ZGz
	gnwrKoEd+YtyLy3bOdEF1ekAyjwdzJ8DjRRzTJnKk5y0vQWOi4g+YIFqHk9GKWJlz77Q==
X-Received: by 2002:a05:6808:bc2:b0:4cb:f21b:6f98 with SMTP id 5614622812f47-4ccf9b8f79bmr1640523b6e.43.1789698015057;
        Thu, 17 Sep 2026 19:20:15 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm295476a34.22.2026.09.17.19.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:20:14 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 21:19:52 -0500
Subject: [PATCH v2 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-3-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698008; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=5AvlTzf3l8b4LLef4GkI1AU4KWt0gDt38qriJ2bzdYxbLUme++T/DOctXG9bxd6ylcEF2KKoj
 2xObESmwo23CDAaFIvEw6+yWIBFc38l1dxVsxUSc08ka11Xc1GqGfja
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_192017_000249_84BD0B91 
X-CRM114-Status: GOOD (  13.42  )
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


