Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9403CFD8773
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MK795KpPXyjO/YxzSnwJyz0MTRv/X9Db9MYpfOCj3BE=; b=QBUkA335myYtD9K2gRo3pbMx0z
	YYAPNQdsp6Rs8FYNkM41fmuZdW4HreWQ+YvYD92MjytuIM3u2U/AqUZ1mPvDgAeTmXIeCXCpiHr0U
	t98H6u4PrsgYZ0+yUZhsOUG9wsO8iueYZF850PnRUe4MEBnEqJn2T3YOil3KvtileCEPdrufCZ/id
	QJpouyQxTXyROTfWiYActxNrzAsYPqPJr9s0QWeVWJkx2SCQbnTu3vs23WYmUmhgIhz0Mfc9sZCmy
	vOz2lqJ+FkK+iLSf5RkKTfB3SamWSdEpxSXOLi+EjOAbfJvJu+9aWVv+JYaora+0ZA8Z2uNYeQZX5
	gJAARmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UlN-00000006TVF-0uJa;
	Tue, 17 Mar 2026 13:47:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UlL-00000006TUo-0U9w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:47:12 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-824c9da9928so3676679b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773755229; x=1774360029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MK795KpPXyjO/YxzSnwJyz0MTRv/X9Db9MYpfOCj3BE=;
        b=JMl0jBIIO/UK7AekP4AD7SYnRsma38V8Szyk/WFNYPXPK9GyhcPzfTDrStBw5f0oPn
         7s/L+piT8U2F0aKG0yLywaL1mGqrCTxUiewmgsl3LJxsCb4sNB9ixWpRR3o2xoR6aGFt
         806mVvN9RDCk1s3nDONa1HJs+RDJ12Vo/JqvzNE7GosqGDjE3UJrbRNJEfhxVnagjFdv
         uzcwR3Nf8/DiDtKdhs5s4BzK2gCQ3CK9bf+Jy/L4ZAfqpaSXYRRU2wigqOPgnfggYtWT
         1y4rZMziZs0etmOTUrycpEhX8eDOufhk72dMT565M0XgggxhwSkud3Juzrpr82TF7VVO
         tQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755229; x=1774360029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK795KpPXyjO/YxzSnwJyz0MTRv/X9Db9MYpfOCj3BE=;
        b=a6nmwMD5DhFZNpAXa6limsBhlqMQOK3soyZejVfx/l+VObvTN4OtAlcZwb2MStf5TF
         hS7YV/9ooA9RDZmjRBlOKhj/hFsPGpghbtS3bKhRGEbd/1RCNrK77AzFwtVReGLR34P3
         Oyb9fyFSi98O5ntg5JCpqnHE/3bbKOaoP53tFkPeWv9mLIh2oE4F6kAcgH5JlaORzJ7s
         ZjRC0cBhM8L7HNuYUUZgL9TlfCaNb7Jjq460nup42NixiiiFrJgkSaT3EkTeW1QyWv9N
         xuKCmSPMwzY5RI9Vw1T1TCDVPQ6hDpRM4Ckr0RwoSBOgQVEBsEUlZw5GV6dDbqwqMBhu
         jWSA==
X-Forwarded-Encrypted: i=1; AJvYcCW+njCaNUpgPFBiohNN4yvlA0iuwpy9UpzvE9A2LfPUz+gbV/zzVB2h/zeWVO+8uyXjfp4ooDYLeTAroQYZ44Us@lists.infradead.org
X-Gm-Message-State: AOJu0YybmEKHnGt+hC0jCdPXSTGh9oiKRZ0Sl6J+LYY+GqoIxbDJbHty
	7ucde2W8bmQ4/sD9LfyiH2FuuH1s3eaKHgirO1oeJJ1uBemEe7Tr2Kea
X-Gm-Gg: ATEYQzwHUerHxj+INqBFSRN6JgoPD0helv331A0lFEzHSVjsItF0oMvJlFwuJphc7An
	TYcdLh/QpfYNj6G02u+2dXLqo2m4QvtlJOoLZoKV7aao36+5QMAjeiD/GRQmIXH/MPzKvYHjUUc
	kMtDFBeOLJawtVKgsIBM7YVSe85YsLYY7n6RHBxuDLQfz0PsDeA320NTN11Bj7n+FajixDdY5uz
	oIqocFFfv169uEgE+mRui4Q5IFwVJBMqwFN/FoXrQgEoL/vcGBrmjpiLyzcY8KigjPJUxm7fHS0
	nZ11y5Ta/bIWApWcwRhTE952Q/qAzfY++CJV5tZBrycczyUHJ3mdaXBagHgvPW3+P4kcIbs+nEH
	x2FzApLCodNYAiE15QnpHgtUR91UT+d+CEBufGLQ5DDZ9kZnMnyE+21psI9+xfeRASIK2cQ4uat
	1ejFGN125k2jYEw2TTGcbod7i9m+HhHp+x4PjoXw==
X-Received: by 2002:a05:6a21:50a:b0:398:9f1d:8a03 with SMTP id adf61e73a8af0-398ecd9d561mr16769427637.61.1773755229144;
        Tue, 17 Mar 2026 06:47:09 -0700 (PDT)
Received: from padmashree.. ([2401:4900:91ee:4baa:27e8:65bd:dbc5:b65f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eba9e183sm11898643a12.14.2026.03.17.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:47:08 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	mchehab@kernel.org,
	s.hauer@pengutronix.de
Cc: padmashreess2006@gmail.com,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] staging: media: imx: fixed a brace coding style issue
Date: Tue, 17 Mar 2026 19:14:47 +0530
Message-ID: <20260317134448.389123-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_064711_177395_FAB99CC0 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

Fixed a coding style issue.

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


