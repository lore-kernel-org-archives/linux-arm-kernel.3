Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4338C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtuJK+NS7IlYpY3lUfxDpExS70jRA4KXDLtMxQhzExE=; b=H5zpoZtanpNGahZpXSuWcygDKY
	q8vMFWxKsqG0vzY+UAycSDwUvSl2CDiWhAbCIaAGkF0FfLmjdsnSxOruZoqgKCxyzW1tGQnxZ5oBT
	0I1kV2Dyn3zpSbeeGeF0Y/FJLnp42R9tbpJICa/MPWfQ4xsTRX8aJ8DUtVINf5KLxTaVumzKUqAqK
	KYuwX2HV3psLMrnlk0TQWRPRD7i+3diw4F1oSV3PJn5VqsU7CE8wELw/KwxjtKN5GbINOm0VlUcd1
	nxOApGvQt21WOaAGLKJoLRjEkDHX0Qkb1psbaaELRUMBHlAo6tXXoUENiPZueZVMZVGcOY76Bs2Zz
	Tj3Bx6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu70v-0000000G2FP-3996;
	Wed, 12 Aug 2026 11:20:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu70s-0000000G2DI-1aj8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:20:51 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cf52d15d88so8432005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533649; x=1787138449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtuJK+NS7IlYpY3lUfxDpExS70jRA4KXDLtMxQhzExE=;
        b=Qcp0FEWJnIZRSOIS9+3vavnI3uiDII46c6SdKar0dOy9wcsD+nxlGjwzfLgeeV1Crd
         GNWvNhRlUVBFpNJQCbICH71rLHIXK2xCkXHAcWmBxmxgUj4jlLGzz+rx9PTuM6LAKVe3
         cCDUijZnqu80uYOfyAtS4OeSMGXlJqxCAoi6CKrESBUKr6FJQyzbUCCrDjJvpobViLJ0
         yXn+KoJ9jSexoxXTe+5tgjNmsRMIVKAlALb6AWsT8DwunYLyzijOd2BvFq2LysHUHA6r
         PHxxqXU2uafs02uOkw38cPrrKqyi/fCkZzXOCVivGD/6g01Rs7oX4q2e/OyP3n7sqGoo
         243A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533649; x=1787138449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtuJK+NS7IlYpY3lUfxDpExS70jRA4KXDLtMxQhzExE=;
        b=ggHSQQj/Djnc+ksCgodTemaknk4SKKUJLq+L67wIGiApoVOvaQXGeqfqZ7H5ansbM8
         VE3PymJx7lMFgRNnm6oY8XevrykZtS9RjJjmeoRhd4EzyXH2eAOsnNlEAGHlvdfIROOl
         HOKzkEniUkzvJC1IcrF+SQvknwc9I2HYihed/WZpy4aYP40Ii8KiIOgAALKLm9wfCf6G
         iXhmzdCy4Dw2WpqhcdNHVtOQuLaF5N8nSpXZwktzY7ofeXZg9Eg/JkWa2T5AjFHdnKmS
         /YcuvdzVXJGXLrzj2LVWifS0E4gkBQXHRCzed9eXcp2c3dV1axVk6phO680sNkiCmFUN
         YHBA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8gH57BPwCCGMLhAiFskp40CqtLy6DTtIYE9KQonZUX13xDtxzYr5sciNdiWIi2Fktd/fppDEpnnaCGypw/PWZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxgPpXtQQuihFnx6/QU3i10P8mrutGxoSsMH0PkhF99qdXQiqHU
	dxfT1IqEhZqhOm8O1o5s+AWUhVFV2CYPM55IsZ7iOsjMQAVPvYioD3hI
X-Gm-Gg: AR+sD11yq6n4gfevZyynLXDjbXZeqpSi0Zcln2MVP++cdnHUUGuPc6gB0oOf93N6GHo
	u5/RBNYLUORWgkGg+7ciZ70CfPfKQAH92IG2afybXqIXCKKdQWediaBcIQ/UCqfdEB8wIz3f6MF
	hBxDkd7B6BjX8nSvCFgaUXO98sEFFEmZGV384bTWoT4hOqI2Yy+o3qGW6hG9gcImn1UO1rivhVw
	tMES8L7UOiD4OfZut+XUOmaQsB2n6wKIA9yzH6gv6D/lnRdYgwK5oeFba+1p5SyemCgbd6TOuA1
	G+qFdwPr64jZbgF4Ei5nkFz2FPiIY8U6/Or9JfdD+l/h0p01gFJSYhINkjDJr7L9Qv6bRjFIlqG
	qB5CrNTPI3L4XmkRuFyH8z15FqxlFW+TkixHNWZW0UsMsERQRgL/8FhQ1gnW30euVzuKlqRJ4Em
	4nwYKXNmi/PAsXGmYO/+CexQBvvw14tvuv/jK092/wmBs20uaG0ninavxidrqzLGvA+pa+PYYLX
	PamPGBdQgQLYcbrOWZ2tP94gTz5pzgyOfEBbz6wgxyvOZGjeZ1a1fz9FYN66gGq6Edozjx9gPLs
	wx9Y
X-Received: by 2002:a17:90b:48c7:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39301490a70mr4771248a91.10.1786533649457;
        Wed, 12 Aug 2026 04:20:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935f5ecsm3193765a91.5.2026.08.12.04.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:20:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] mmc: meson-gx: Handle errors from optional IRQ lookup
Date: Wed, 12 Aug 2026 18:20:21 +0700
Message-ID: <20260812112023.42254-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812112023.42254-1-phucduc.bui@gmail.com>
References: <20260812112023.42254-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042050_472222_D59CB53A 
X-CRM114-Status: GOOD (  15.42  )
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

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

However, the driver currently stores the return value directly in
cd_irq and continues probing.

Propagate negative errors other than -ENXIO, and only assign the IRQ to
cd_irq when a valid IRQ number is returned.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..af94c8138fcf 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1185,7 +1185,11 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (host->irq < 0)
 		return host->irq;
 
-	cd_irq = platform_get_irq_optional(pdev, 1);
+	ret = platform_get_irq_optional(pdev, 1);
+	if (ret < 0 && ret != -ENXIO)
+		return ret;
+	if (ret > 0)
+		cd_irq = ret;
 	mmc_gpio_set_cd_irq(mmc, cd_irq);
 
 	host->pinctrl = devm_pinctrl_get(&pdev->dev);
-- 
2.43.0


