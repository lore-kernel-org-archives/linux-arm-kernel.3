Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266A0109316C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 01:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9vBhGUN8OPoScRphaoW0K8IO9rLvRgQvYr+dDolmQLo=; b=Qd0WIAVgWydhWEw5E5DpZzvWqz
	u8PueZLTHX+srh/DXekXAy7Uoeb+PNEEeaRS8pUNDI6M7ph1vXwi7UOKhJ/zLI1XhXmzO1iFXTWuu
	b1JKNH5xLrwFK+RX3SFnX6EQ0VSY0MSYZ0NQAnd6V/KNNeYfgizn1lHJIKsyvkRyVUztpWLOMdBsg
	H7IR6ISkNeT0BngUuriqAe+VvccLlm+UqykNQMiHtwfGpf+P0vBfcjyuCr6m5e5M095wrh5A3oXMS
	T7xXsNgOwtLGgoPKvvJDmRLGjSfjCuB1tAkj/fw7ErJAqJtoKXMcreBq15zqedUGvGk99t+rghU8f
	sr5zNoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3OJ0-0000000Brc2-0puS;
	Fri, 20 Mar 2026 01:05:38 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3OIy-0000000BrbX-00qF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 01:05:37 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82735a41920so671912b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 18:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773968735; x=1774573535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vBhGUN8OPoScRphaoW0K8IO9rLvRgQvYr+dDolmQLo=;
        b=RoC9va5K1ReWnbfYpxsiR6xSxw0nYk8cTBZlRS8YbWX5odQFBvUsn4qEAIR4T/6tdL
         Cbf9QkDkK72LLo91R1nV6guxZA6Nhbb5whk+O1C8so8I/38DW4ndujVOPmQumVgFxRTA
         PouAlWYwg8etFJX74xJC6EPeZ9E2tqNvd4cxQ5YCAjZ8Rs6VqJ+joAJI5qJwtf6QByqV
         Z6UXLLrwGAGbQFR6/WfH6mz026ZXnl1GwhX7cOFAWJ56R/vrLtC/JsCJ2YPoc3ZMTf9U
         txsN0kn+o+Lh4u0a5oAEyKUExgO0dOmU1OLcDoCQKK9Praynl69miLLtgfOSIbsiG1L4
         Tklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773968735; x=1774573535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vBhGUN8OPoScRphaoW0K8IO9rLvRgQvYr+dDolmQLo=;
        b=G5LkaezEE5dy9kkS+6d/loC6pmLs/n3uZEZ+jFGKlH5U26pao5EJRIr8Yl2Ej51ijC
         yvVbrpqzTuh5T3+/5HEQlf4+sK1TZ+BSV73GeJFp8C9pEfjQ0xUlKDZEgwSB7mFBhQgo
         9lWqDQd75Ie+q5NAyUEw5yxvlgXRj1/tCs/Oc9gIAcNgLp4ZL+R8wWJSSeug3AQpNeji
         /1Xlv9UQ5RkArUk2o5sb8oWDFp0EavR5+KkCRduIYtZsWaCto1pQBNXFF9T9+8jU08NY
         deB0KRafK98nbfU3b/fzKDHuN4gLZt5DTWZt0vAbtz6qTyoNT43qsz0Xq9oCIdRXzd3K
         gR5w==
X-Forwarded-Encrypted: i=1; AJvYcCVsFNlppCIfadRWY3yiVnIfnDjkbURJxzpCbS2JJFEkhc9WMynabHGbbXsXUPZkjprrI6xEsf8PXQG52aSjm0ni@lists.infradead.org
X-Gm-Message-State: AOJu0YyxEYWd777/l5LeJMU1l8CJhScLH99osjAYuavKHxQa9PuI/UTe
	qNYO1PyPl2aR1Bzz8nNxeza+Olhf3jA1NKii1FdEOWasfNBXUtgZRroj
X-Gm-Gg: ATEYQzzAQU4OU1Yo+jg/lt7uqHXuQnd/AX6fGY1cmQqzuM7KWI99oZKrD6x+M1JcrmR
	KymN2cTU2D1WBR6fW/VIgPxSmUWcL0bYBGAUzU+z/gfEmO0KHjvr7nwi6GqwHxkZkgA9Ao15JzO
	PQ7Y/Yw4aZMpxcIwJVJkvAjxr0qd1nAXAmUiPNOU8AFdZsIEBe/L+sFjSWl2rAUvEm3PC0TpYro
	x/pvjRPRTzz9GwhYORNnduCVmAKRNr5Dkkb2ZdTkV2gjgU5Fdn/qdPR1WZ5SEChRyVoJRtx3tYp
	dQzgsRg5dTsaZotIeWqDAt5oznLqxPOxq62tKqnwoJW8uliCTvrdav8j/0eaLuS3QZnDdn71MLH
	L/9MvJedn7wfNIaNkwlKkN+1w2Hb+KRopES4JAdCYBiaeijd2ME3hCamrwoc6uf/zWpFmj6+RuF
	Pc663fvhAEwHTW1GzNAj3i/SZfkBzHGxVntG3knLoHSS4lc9c7+CxGh4E=
X-Received: by 2002:a05:6a00:2991:b0:824:afe1:f7e3 with SMTP id d2e1a72fcca58-82a8c27dab0mr926974b3a.15.1773968734924;
        Thu, 19 Mar 2026 18:05:34 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409c681sm420476b3a.37.2026.03.19.18.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:05:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE)
Subject: [PATCH] reset: sti: kzalloc + kcalloc to kzalloc
Date: Thu, 19 Mar 2026 18:05:17 -0700
Message-ID: <20260320010517.31917-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_180536_043840_AFD5971A 
X-CRM114-Status: GOOD (  10.07  )
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

Simplify allocation.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/reset/sti/reset-syscfg.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/sti/reset-syscfg.c b/drivers/reset/sti/reset-syscfg.c
index 2324060b747c..38f78d78fa4f 100644
--- a/drivers/reset/sti/reset-syscfg.c
+++ b/drivers/reset/sti/reset-syscfg.c
@@ -41,7 +41,7 @@ struct syscfg_reset_channel {
 struct syscfg_reset_controller {
 	struct reset_controller_dev rst;
 	bool active_low;
-	struct syscfg_reset_channel *channels;
+	struct syscfg_reset_channel channels[];
 };
 
 #define to_syscfg_reset_controller(_rst) \
@@ -135,15 +135,10 @@ static int syscfg_reset_controller_register(struct device *dev,
 	struct syscfg_reset_controller *rc;
 	int i, err;
 
-	rc = devm_kzalloc(dev, sizeof(*rc), GFP_KERNEL);
+	rc = devm_kzalloc(dev, struct_size(rc, channels, data->nr_channels), GFP_KERNEL);
 	if (!rc)
 		return -ENOMEM;
 
-	rc->channels = devm_kcalloc(dev, data->nr_channels,
-				    sizeof(*rc->channels), GFP_KERNEL);
-	if (!rc->channels)
-		return -ENOMEM;
-
 	rc->rst.ops = &syscfg_reset_ops;
 	rc->rst.of_node = dev->of_node;
 	rc->rst.nr_resets = data->nr_channels;
-- 
2.53.0


