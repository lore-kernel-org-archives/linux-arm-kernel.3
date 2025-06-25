Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7F2C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 05:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdewN+OqwPnfjHa4kNqJuR+GOLJuDMWb9fhOCDaUpO4=; b=QbLdCXmO8S5+reBVm3euo/bc6+
	ZgdhsdTBI5qpK0FXL+WWksDGxRdl9DT06vwpSzSeE8TyOICu8bfPG0wOhn1F2u0/2VH2Zhffy7gWT
	YMgyCFwg+x3R0bRnNjEM6juuvh+fiRgupnWb13TEZB7mh/ISnaXhc9eO0Ji7FTeWMdveoIanG/ost
	XI4gmizrHAOq1e9mKWfS8FG3LyMuhNFcM0FAj/hDRwhrxk1Od1s6hf+o8tsbJ7CcjjbYC7MQy5NkR
	mj1k0xyZsuSjQlWMdpDZGVBGFnvZM7g0Vkek4J+XWBsZ7cXUrNmIchrwTnm9WGivLSD03VxIMT6Lg
	n1xzh4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUIbr-00000007a2n-0pxB;
	Wed, 25 Jun 2025 05:23:47 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUIZZ-00000007ZxW-05UP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 05:21:26 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-747fba9f962so407699b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 22:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750828884; x=1751433684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdewN+OqwPnfjHa4kNqJuR+GOLJuDMWb9fhOCDaUpO4=;
        b=Pt6yF+AzgftcS/zkGOs85Fk9aza0TVi6Y6Xo0EMIU/iKfhNiffDfuGek7/VmQbiUWq
         nuDSafGlnpd+YdB3xTFFHT8fvdYHUiKD93aVcr8Ijf09EjndsOzdOABAQOdtHgnfAj9N
         PfUBGHV1aJvQQ4qTe1eRIs+kAbikRNkLEE8nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828884; x=1751433684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdewN+OqwPnfjHa4kNqJuR+GOLJuDMWb9fhOCDaUpO4=;
        b=urENSEhRt7O5WFAFnSnYr959xJvnV+zIymTUHfQ2TzHeSKz9/MerktZ48mgeNyt0C2
         ZUfOpGbmz4ohF8Enph6HC+BMvG7utViJBHTHpLhDcFtJW4cGcDA3YpUkUIuQZBlVeRL7
         /BIq3tW2W9lCSBHJXY+xA3zeymQuxEHuPCanAAEv1xzAAdRvzsdav6AjR5+7Ez40j9m/
         WetGRS3LdIxfTU6idqKNdnWTTFpcl9WYixhcyQzYPdh8W/kaOJk4xIGgMjsIY08B4gzK
         6XvGL7iEa+aJKGcdO0D41hLpoVy/l6Lqgg5SBr7D2n5ATqt4Q+St0Ubs8zwenOVsxPZV
         BdbA==
X-Forwarded-Encrypted: i=1; AJvYcCXXl6JNxRRYJqrFlzIzdIU1noLoMGvEja5jKGNW3LfjVzlVvR/YpWBqKyPTq0U/TnXKbT7b9/ieRxq4xVM7tgPW@lists.infradead.org
X-Gm-Message-State: AOJu0YwqkmQyaj+jSpJBS/obU5700gwPSIi8dYa33EaZ1e8BFRjqjHNa
	DFo1hmcVcVQQGoV6IvWPAE6A7TIDdBE5S6Lfe8831X8pkwnEJ2gn2fenVQpXD5b8bg==
X-Gm-Gg: ASbGncug9AEbV7wuKqW0KcWngVRyqCSWCk91bk6MPfMwwU12BnyV3y7UuUA1w9av6OV
	vvjH3jI6+TaoKusJ3PyXgwLa/OOFyaGefQcpNj2BzUCH9RlXycAVHYzc1x7/xKWk7SUJw/N+Aza
	6csx8YsJOSlYBeiUmhlPIJoPNi5V4/Ie7XQ6edJZLUQ//1KO6RM+4kyBXs2HCx6Xq3yPN5vu7Md
	bG4LthlDY09xovhOU/9+t+UlT/qCSEwlu/yD8wtij9qAcRu9ccF0QfOmfjhFmfdwRfAmeai/OTY
	cOb6sWxwOLKOn30dv8BwSs5yhbTkkY/fGU8DC2kAc1c2KcY7NktYuzTm4e7yS3CiSBMRamQQP0F
	0SFb9zo506C6Z
X-Google-Smtp-Source: AGHT+IHtRUvI4BFjONg8E4iCJF2EoVUYaYsRjRtF6W4pN3FGjeweBp2iZqpmntUDbugSl88Vu2pCtA==
X-Received: by 2002:a05:6a00:464f:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-74ad4ad593emr2674902b3a.2.1750828884013;
        Tue, 24 Jun 2025 22:21:24 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:301e:ee9a:3fb5:c761])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c882cda6sm3536393b3a.96.2025.06.24.22.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:21:23 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] mtk-sd: reset host->mrq on prepare_data() error
Date: Wed, 25 Jun 2025 14:20:37 +0900
Message-ID: <20250625052106.584905-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
In-Reply-To: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_222125_080401_8FC6C656 
X-CRM114-Status: GOOD (  11.07  )
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

Do not leave host with dangling ->mrq pointer if we hit
the msdc_prepare_data() error out path.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index b12cfb9a5e5f..d7020e06dd55 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1492,6 +1492,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	if (mrq->data) {
 		msdc_prepare_data(host, mrq->data);
 		if (!msdc_data_prepared(mrq->data)) {
+			host->mrq = NULL;
 			/*
 			 * Failed to prepare DMA area, fail fast before
 			 * starting any commands.
-- 
2.50.0.714.g196bf9f422-goog


