Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B393C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MAJzguUYhBfDEljgxRB6xfhBZs+MafQSb669WMeyxY=; b=yygNY+DAvf+6BPWZbTDuUzUSSI
	bU0fVAdVmNkzW0U0X6JQCC9wGCrwMi6C7NQ546ki1MGO9ZiaW5QjNQ2uTtOu/+C0XJDBJgrLg0vRv
	nfh9D7F+Kl7sWmIkN2wR/kxuxpItBNvaZUtMGXZzWqYL8ImUbddx+KFwQHsgfgA1PiAyCT2icqjwq
	ASFkcOkrC76e0AyVue1k488qkNAXcY1OrQlplPsKJReWcn/c6KJ1Ffct7A+8bIZ+jjhbsIaMNsBd5
	FifEYd94H1qrn5+wkkIWz8lQflMQaqUISBYuVODcU16C7oYoAMP0PikbF3ljq0l0sXYP3qnbUlljx
	AsZ8BJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx4-00000000Ffx-04rF;
	Tue, 25 Feb 2025 16:38:34 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuzd-0000000HNUT-02Oq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:29:03 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250225132856epoutp047138203efe0118395361ea1ce34a4cf4~ndo7dY0Bb1774617746epoutp04M
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 13:28:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250225132856epoutp047138203efe0118395361ea1ce34a4cf4~ndo7dY0Bb1774617746epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740490137;
	bh=2MAJzguUYhBfDEljgxRB6xfhBZs+MafQSb669WMeyxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CZsN1oNeGXBmm1SlgXmF6oVXCJQtQADBRLU2rvOCF8tRQ+9HnkdbvXkLJyn33Yok9
	 uKHbYWLNie6nNGOq12L5apalg7DXSE4OyYH5ZwHpiBCx/jPWh73YksA2tDyGvWQuAl
	 BM0ygObAqsuiwsON/sBmGmnIQiTlVw74DIMz3aJ4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250225132856epcas5p4c00e3f2c4785a8c34a3d92831b28c9d9~ndo674h1D2353323533epcas5p4O;
	Tue, 25 Feb 2025 13:28:56 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Z2JN65Tbtz4x9Pr; Tue, 25 Feb
	2025 13:28:54 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9D.2F.19710.695CDB76; Tue, 25 Feb 2025 22:28:54 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250225132507epcas5p455347acbd580b26ee807e467d3a6a05e~ndllaSuq30676506765epcas5p4J;
	Tue, 25 Feb 2025 13:25:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250225132507epsmtrp2cc1f0ed3025eda297d65637b9082b286~ndllZUgWT1195711957epsmtrp2N;
	Tue, 25 Feb 2025 13:25:07 +0000 (GMT)
X-AuditID: b6c32a44-363dc70000004cfe-d3-67bdc5966a7b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	24.C2.18729.2B4CDB76; Tue, 25 Feb 2025 22:25:06 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250225132503epsmtip25254faae58fd31792ae09430c3351f4a~ndliPTjwt1947719477epsmtip2o;
	Tue, 25 Feb 2025 13:25:03 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: gost.dev@samsung.com, Varada Pavani <v.pavani@samsung.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] clk: samsung: update PLL locktime for PLL142XX used
 on FSD platform
Date: Tue, 25 Feb 2025 18:49:18 +0530
Message-Id: <20250225131918.50925-3-v.pavani@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250225131918.50925-1-v.pavani@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphk+LIzCtJLcpLzFFi42LZdlhTU3fa0b3pBh/2qVk8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WCjY8YLTb0vmJ34Pd4f6OV3WPTqk42j81L6j36tqxi9Pi8SS6ANSrbJiM1MSW1SCE1
	Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoWCWFssScUqBQQGJxsZK+
	nU1RfmlJqkJGfnGJrVJqQUpOgUmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsa9qdIFOzkrPq5d
	xNzA+IS9i5GTQ0LAROLJm7esILaQwG5GiZbW2i5GLiD7E6PE8oPn2SGcb4wS85qnssB0XHn4
	mREisZdRYv2Ew2wQzhdGifeHNrOBVLEJaEmsnrocbK6IwBEmiT8nUkFsZoEIiV2NN8FqhAVi
	Jf4eawKbyiKgKtG04A9YPa+ApcTH89Oh7pOXWL3hADOIzSlgJXHtxzuwkyQE/rJLPO37zQZR
	5CLR8+kfI4QtLPHq+BaoZimJz+/2AtVwANnJEu2fuCHCORKXdq9igrDtJQ5cmcMCUsIsoCmx
	fpc+RFhWYuqpdUwQJ/NJ9P5+AlXOK7FjHoytJLFzxwQoW0Li6eo1UNd4SLT13WWFhEkvo8T0
	td2MExjlZiGsWMDIuIpRMrWgODc9Ndm0wDAvtRweZ8n5uZsYwclRy2UH4435//QOMTJxMB5i
	lOBgVhLh5czcky7Em5JYWZValB9fVJqTWnyI0RQYfhOZpUST84HpOa8k3tDE0sDEzMzMxNLY
	zFBJnLd5Z0u6kEB6YklqdmpqQWoRTB8TB6dUA9OTzFqF2DOT6/wfLj+7WGxOZ0z90kKZ3Ybm
	ZwNbLDQ0k+KWx/kFc/C9vWkw2UmMdcdp37cyLgd6w05Nsdqs5zPVadX1wixWO7P9cs9Ub74+
	svHolvbrXzdali2XnrNqruOfb1Y/Cvcv1OjKY/+w96w2S9y6bZFuP1UsueskXHX+PqnQm/Vq
	vfemFWn6TVEfDF93Td2dfb657HECf/z53JNT57yebh5YZOxjMeFtbKTtHDNzDd2covz5aW/Y
	fosdylEptQ26JafWILjVsjxm3ZUJj8WLtk4R2xF3ISEn5Km1hWc7X+752X2LM4Vj1+4w+a00
	51/R5igzc6aFtjLu5w73/36363j8/jn119zX6yixFGckGmoxFxUnAgCZA5atFwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsWy7bCSvO6mI3vTDQ5wWDyYt43N4tDmrewW
	1788Z7W4eWAnk8X58xvYLTY9vsZq8bHnHqvF5V1z2CxmnN/HZHHxlKvFoq1f2C0Ov2lntfh3
	bSOLxYKNjxgtNvS+Ynfg93h/o5XdY9OqTjaPzUvqPfq2rGL0+LxJLoA1issmJTUnsyy1SN8u
	gSvj3lTpgp2cFR/XLmJuYHzC3sXIySEhYCJx5eFnxi5GLg4hgd2MElPPPYRKSEjs/NbKDGEL
	S6z895wdougTo8TL9kY2kASbgJbE6qnLWUESIgKXmCQOHIEYyywQJfG6dSUjiC0sEC0xe+Nl
	MJtFQFWiacEfVhCbV8BS4uP56VDb5CVWbzgAto1TwEri2o93YHEhoJpD3z+xTWDkW8DIsIpR
	MrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIziAtTR3MG5f9UHvECMTB+MhRgkOZiURXs7M
	PelCvCmJlVWpRfnxRaU5qcWHGKU5WJTEecVf9KYICaQnlqRmp6YWpBbBZJk4OKUamE7Hsrk4
	7HvzgCVx0/nSKWlMKmcvihQH2fjlOQh6VO7x0v6xjduM6aDIwxfdej8eal2bfnzB62/mx5TE
	XfSzTpg+a2QukZOM35vyyXq2D9Pv3bde9trftFBPObIpKcuK73Aqk97niRcVxGuXXmI5vHvf
	tpytj1/673+e80cz3v0FY1+W8YE9qgvj59qYWTbyPjozpXXLU6m0Yl85Zaf72jLPgjxPrPxf
	Xr5yq0ZCy8vZb5/8m7oxwKhTd8+l0D1COwNk/xYpnRdbaVfy4MNK9bxD4dt1uqeucPqoc/H1
	q76DxRnV6+p5rBVuzQs/3v5HYcGRdRcnWXZt72HedUFW4pjltqbN3Gzf3ug/aZ/myaLEUpyR
	aKjFXFScCAC2dwDCzwIAAA==
X-CMS-MailID: 20250225132507epcas5p455347acbd580b26ee807e467d3a6a05e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250225132507epcas5p455347acbd580b26ee807e467d3a6a05e
References: <20250225131918.50925-1-v.pavani@samsung.com>
	<CGME20250225132507epcas5p455347acbd580b26ee807e467d3a6a05e@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_052901_363183_91EE8EAF 
X-CRM114-Status: GOOD (  16.05  )
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

Currently PLL142XX locktime is 270. As per spec, it should be 150. Hence
update PLL142XX controller locktime to 150.

Cc: stable@vger.kernel.org
Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 2e94bba6c396..023a25af73c4 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -206,6 +206,7 @@ static const struct clk_ops samsung_pll3000_clk_ops = {
  */
 /* Maximum lock time can be 270 * PDIV cycles */
 #define PLL35XX_LOCK_FACTOR	(270)
+#define PLL142XX_LOCK_FACTOR	(150)
 
 #define PLL35XX_MDIV_MASK       (0x3FF)
 #define PLL35XX_PDIV_MASK       (0x3F)
@@ -272,7 +273,11 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	writel_relaxed(rate->pdiv * PLL35XX_LOCK_FACTOR,
+	if (pll->type == pll_142xx)
+		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
+			pll->lock_reg);
+	else
+		writel_relaxed(rate->pdiv * PLL35XX_LOCK_FACTOR,
 			pll->lock_reg);
 
 	/* Change PLL PMS values */
-- 
2.17.1


