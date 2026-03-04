Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A5FEFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CAARsnlrqcfDm8ekZAoMmoCRNxm299rJHElT0uztVl4=; b=j2ZYc7bf4dFyE6Zi8Um3BJhUVP
	ULlOZ2atZfP0O1vs/zkgOb5nIcT7PJRbB2bT2ROjEN5oPIpfeUbeNIKjR0RrA1cqRDFVcI7yioYdn
	Rh6lbwNByc73q+3GTUmR5C576Iaxc1cJJtQ11DwE3ZUyZRDHt7NYS//dAF67aYb9okmXWqTB7JNBU
	AWUc7SSGM8DPmka1J0oJHH2Jk2Xb8hAQrm2/QXx4dSrHeo5ay5dKkjjp3NoFIODTO6vyAmY1NsUDY
	K8tx9rrJAyXylNiD1VRp60efoKEAye5N35gYjOgEEUjNOQKh7KmBma9YJFBFPz1uekfdYnBlGZ5bJ
	j9SnEGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqh3-00000000JJ8-265b;
	Wed, 04 Mar 2026 18:11:33 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqh1-00000000JIa-3K2Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:11:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso3650325b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647890; x=1773252690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CAARsnlrqcfDm8ekZAoMmoCRNxm299rJHElT0uztVl4=;
        b=Ayc0e6NaBTXyd+ouliQOboGCn4lsnIB0TVSBnNqDEf7J8qtEgLKoHkldcguUK+ELvq
         1BzLPCCid8WD+e9sTvctw89vEmwHUZK14zPGgU6XQdUGcTkOny0YBYJ4GrRbdk48qaIq
         tJUwV1Fi/qt0FOA+bNYHaw9X1JVgm0VqAxldXEAWprYauWq5YgmmgklQAGsW3jTAknhS
         tLh7dM9K4mqxQGhcT3NIObX8fhj6fDfh39UF57m9h/tuPYdogloHKIopLXeJwCwAeWCu
         gZBT/9ksJoyMap4zFi2KvMrYph+M3hygHLRevHpiX8hkETCJIQvL6+k2NHSTn7RTVERJ
         qe7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647890; x=1773252690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAARsnlrqcfDm8ekZAoMmoCRNxm299rJHElT0uztVl4=;
        b=APhS2m0PwOkkMKpxN0Ailgout/eKqDb5q3Kc0z1zVrih1VMEmWd/lP3Qv3U9m6ZJLB
         xqHYFTS90FKztRcR8brS96sly2ze7P73bl/77we+O5fUETONultY531aVD93pz67jtCB
         5mvFqOfw2SEOANrmJsxORJ2LHN8NHlYdnsHVl1W5hFpUPK1gBn7i/FJAzQhLo6pUMK4Q
         M5blpCFpAmyeG8fkDcbe7sv9C5aS+XJwXSdEm7kWBfRp+qbVhQkF+BOIvLqX9g5lNFcG
         VRdT+HYOFoTNpK1OTegXU/NNYrHNjTqaeKN4hPIhrctqKPqihSgR9ynmyEUCc2AQnN/R
         9v5w==
X-Forwarded-Encrypted: i=1; AJvYcCWIp5bZWt/2+G/NXNqgK7Of31cl5pcKlEDvXYLWgl1jUMnOF+0FY1cSVDK9EUuClP8I5PSlVDeH6b58d+rgcWB7@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv1eMHZUVNk6MNJvRDxLDort0eTxZ1PXv7YPGkb5nx88ZypOCQ
	tkA7/tvEENsatUlPODBceO2CzRErRrOVpjDvX7Tqwx352ZsHnPWnGZKlKMn0aagL
X-Gm-Gg: ATEYQzy2fG9Yrfy3nN+O6bno3mq8Hxk2nAbTLCw9MDuX6n2vOyNDvDdirt1uIunlc6Z
	ceKpRTM567MtxmmiPndl+7TKgfQNuDLrx4Egu0gejDFU45zthZdcPNtJDNChdEfDrxiyonh3gUV
	sMuuaaFn/FHfNN30SM9bz1gYKIvvDnyRYBrzBB7vv9lJoBeex/5R8+6rtG81JyUTHib54tRMMhY
	WklXJqQjJGKu5/f8yo5a3kc6T8ybo4MwZ+bAgozkTqFmrSMkyA9ci5rN0x/bJ9ZMiDYDFBNO/lC
	3BCMMOaJwXvBtR6gNfVwJAhEXnSGtLac+2goJ4X4lU7GOys425xIOqVHOagHOdur4tqf4Cd7UFI
	csVvi91MpguYwYZZIy+F6im48lcjVsyEv2VRmFrIUD7Nr8GotLpY4vwyohpnTE2NZwUlnvJznzr
	VCYtCqv0xRpcnTKoW5ilRjf6Uiv+A4D69U+/+y+av+nnWEL3Z5ocAEWP/UxQp2+HCzPk7PUtx2q
	fa3QiQ=
X-Received: by 2002:a05:6a00:a21b:b0:827:433c:ba7e with SMTP id d2e1a72fcca58-82972ca0908mr2672299b3a.41.1772647890346;
        Wed, 04 Mar 2026 10:11:30 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:27 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 0/3] Refactor infracfg drivers to be able to use common helpers
Date: Thu,  5 Mar 2026 03:10:21 +0900
Message-ID: <20260304181024.738391-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101131_837028_459460A6 
X-CRM114-Status: UNSURE (   9.13  )
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

This series extends the MediaTek clock common framework to support
cpumux and converts existing infracfg drivers to use the common
helpers.

Currently, many MediaTek clock drivers implement their own probe and
remove functions, leading to significant code duplication. By extending
the mtk_clk_desc structure and the __mtk_clk_simple_probe/remove
functions, we can handle these sequences in a unified way.

Summary of changes:
- Patch 1: Add cpumux support to common mtk_clk_simple_probe/remove.
- Patch 2: Convert MT6795 infracfg driver to the common helpers.
- Patch 3: Convert MT7622 infracfg driver to the common helpers.

Akari Tsuyukusa (3):
  clk: mediatek: clk-mtk: Add cpumux support to common probe/remove
    helpers
  clk: mediatek: mt6795-infracfg: Switch to common probe/remove helpers
  clk: mediatek: mt7622-infracfg: Switch to common probe/remove helpers

 drivers/clk/mediatek/clk-mt6795-infracfg.c | 70 ++++------------------
 drivers/clk/mediatek/clk-mt7622-infracfg.c | 70 ++++------------------
 drivers/clk/mediatek/clk-mtk.c             | 18 +++++-
 drivers/clk/mediatek/clk-mtk.h             |  2 +
 4 files changed, 41 insertions(+), 119 deletions(-)

-- 
2.52.0


