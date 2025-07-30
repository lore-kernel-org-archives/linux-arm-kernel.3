Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81C1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZFPYlDdJ0rVu0VNavE3SZOZbmVPr53MAqWXB77UPjc=; b=hPPc7FWoqNfor//aey3eTzstZQ
	Cqtb02kebLATp8UaMQw4ygtQZTBBJiLV6pkKHaN5+uqhqIYzuDyv5MDUVs3e839VIG7bhkJBalMrE
	BVJMmZemYc9ClC57dK3QnxVkbu6FE0E9dfSsUuXK7/SRhJQ6lo0IrtZhIslh8Hmw1iVa9yltzCzSk
	fv26RYfd8gb99BlYz0v6f6Z//R3oqgsAnc/a/A68H27q/SlpzL9srPeE3gGg7ItiCQ6l6sEbTkwdT
	dKgnCFUtGxiYek9SjqEs4+fIX0B2wqrx+ZIcqy5qG4z6pnYJqeLxHxLHJ4yNHbwvYdMydigZhL1Wu
	myuUog4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh14B-00000000rsw-1nNi;
	Wed, 30 Jul 2025 07:17:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh11g-00000000rWO-3D8z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:15:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so3656955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 00:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753859699; x=1754464499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZFPYlDdJ0rVu0VNavE3SZOZbmVPr53MAqWXB77UPjc=;
        b=eLDFjOZZ6OlFt2i5P5rDRP63GHH8wzGvxwWbbK8KVlFs6BP+op4vDCcQiCzdL999wU
         cg6mkgtBTIAGLeaU2ZfRtX390+KHtMakDm3ZuZcyf3CEzF6FnQZQZZi936oJ65laZ1Bs
         oUcFe5O+lD0wIHTeMZ1UItqu6H/xQMca3Y3+hAGZ+UfX1cacQV4yL5lizCd5fa5IJgWO
         QmiogkNKz9mfxVMVDen8glkK+KA6oQqALsjn7Kl5xBmY1UCtGv+p5Yb6o/TZzPS6A9L7
         sp9+eDRPJSfd/tjf9rp0Z9FM4UcGBlJLZuHLrYSq6hGKZd22pepTm6xlSlHs/qVocPoE
         MSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753859699; x=1754464499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZFPYlDdJ0rVu0VNavE3SZOZbmVPr53MAqWXB77UPjc=;
        b=hWbi+onInX+csKQlZr5gLo6kmUPoIYjLIZ2bsHMFFiyUth6E3ygKDbXTHZQWAfv6N4
         53wL92pE/2ONIMIxLh0HveJvlDB2MyXGayoPzlz7/hz+t3cUoZGHajAGzcpO2kwE8G2b
         asLO+LZicYKXf6aP46Fxv2TFRFAyoajg8oMBTv90cT1KZrjBX2MAsa/pK4q/osmfaJ8e
         9olcZKh/7Kmvks0c4s/EcEv9ZswoGVnrge85ZyX7zQ30ai1OWKuiMZyHt+I57WcsJrJQ
         2AqGRmopQEwtkw+g3Nekm9dgcjWMtCe3HVRJ+Bbfmj2wJma4SavNnhZXAlD2ZMPXJT5F
         P+kA==
X-Gm-Message-State: AOJu0Yxs9LcO0nVYdRlbw1jLn+iqQ5sCgy259d5DGsCN9Z6s/wsYTpi2
	MmnWvTOkmEOcKakia0UL/5803b+1pMTYw20PHzhi4eahROkXK+6I5zemb1CIOxi4J+Q=
X-Gm-Gg: ASbGnct3vQt2zaxUEJYcJxIh/4iNkVDhiN2H5t8A9AnP3XULy8+d9jywHg150u6xntk
	b6ydYNx4b+Aw5rUdeIgWOr46WfK13NjlaIk3w0zdI5sZbqny83YhZcyUySxsSFTqGxN+oKW5D6F
	NHoukAglfajiteqpC64gRYuPmT+wtlLyKnUyFYiI0rS22LHCPb7t1ecr6fSvCKS2ISfqBxqKetq
	SIevBfHaqCCpCiv+wTeEFE1kAbGx8VM2SdO67mDq1lxeJANlvpFvBlrTARzHHWBsvzgt1AZyFsP
	50vUyuThvs/rW2ClGU5UCC4j/iWy07Bo6ZeuF2AFKlY4SuC8f41SAK8M+MIx8aGZUy0p9/0Dzdx
	HGabRTWT1yH1/qm03DNBV30lI
X-Google-Smtp-Source: AGHT+IHNb3WqBOl3BcnyoTf2mFnsCMBFsTDjTJbP6rodUQ7rplDyO6pwXBZDtxJ0tWuM+n35yFd+5Q==
X-Received: by 2002:a05:600c:3d8a:b0:458:6733:fb59 with SMTP id 5b1f17b1804b1-45892bc5895mr18567715e9.19.1753859699078;
        Wed, 30 Jul 2025 00:14:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e75d:6dc4:a638:ae8e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb284fsm15118926f8f.12.2025.07.30.00.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:14:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] ARM: s3c/gpio: complete the conversion to new GPIO value setters
Date: Wed, 30 Jul 2025 09:14:43 +0200
Message-ID: <20250730071443.8758-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_001501_044705_23FB4782 
X-CRM114-Status: GOOD (  14.70  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit fb52f3226cab ("ARM: s3c/gpio: use new line value setter
callbacks") correctly changed the assignment of the callback but missed
the check one liner higher. Change it now too to using the recommended
callback as the legacy one is going away soon.

Fixes: fb52f3226cab ("ARM: s3c/gpio: use new line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Autobuilders pointed out only now that I missed the other line that
needs changing in my previous patch. I'd like to still queue this for
v6.17. Either through the SoC tree if it's not too late or through the
GPIO tree together with my second PR for this merge window. Please
kindly ack it.

 arch/arm/mach-s3c/gpio-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 206a492fbaf5..3ee4ad969cc2 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -516,7 +516,7 @@ static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
 		gc->direction_input = samsung_gpiolib_2bit_input;
 	if (!gc->direction_output)
 		gc->direction_output = samsung_gpiolib_2bit_output;
-	if (!gc->set)
+	if (!gc->set_rv)
 		gc->set_rv = samsung_gpiolib_set;
 	if (!gc->get)
 		gc->get = samsung_gpiolib_get;
-- 
2.48.1


