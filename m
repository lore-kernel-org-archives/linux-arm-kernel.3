Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD8ED49795
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 03:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTsDv6X/TDHosGjWCj6G12vDDaZPM/8Azm3atM3kxEg=; b=EKpzkAX4Qx0mMrZqn3hjo3U8wi
	k+LyelqNWJlYKKfWy/025qUE1qkLVJ3+oK/hw1X03O65Wv4guKqdefOwE1plv7X/++TtjHkRo6Ypc
	+LMfouZrIi7Vv3smg9Er2lQtQFl1jbBAsoNI34oa24FMWoY+1LwDJxiH0lzuKyWVY+g0WuxdkG4Ak
	OKkHZijSIUe+naCN+njU16pkWjDPrDlypXXXG/VUN+AA1oA+3i6IYyqo3aIE5sNghziw0AjkVe1bi
	9Tr/+2oAeVugqm2TPKaHwYir9BFIxyoDxElyipzLH1MbUq2zJAXUYAsxYiYj13f4hX2IXhiuzpMNO
	HUI/ZulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx4x-00000004wG3-24Fs;
	Mon, 02 Dec 2024 03:26:31 +0000
Received: from mail-pj1-f65.google.com ([209.85.216.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwym-00000004usf-2AWn;
	Mon, 02 Dec 2024 03:20:09 +0000
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2ee74291415so1176098a91.3;
        Sun, 01 Dec 2024 19:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733109608; x=1733714408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTsDv6X/TDHosGjWCj6G12vDDaZPM/8Azm3atM3kxEg=;
        b=HprJ3x0rP16DzbenrG/U5BRYMmztsCyGz6iZsG78MVm9nK2YoyyUPkKN3kfHpnRwvh
         99zTaG1rRhFqJzW0VaanO6W/LBoBV1EMgsEX9e5xzteMv84Q3ubsbwC6bIPNJQVkUcP9
         QSlYLGekwWwTsTil5goUSvmVz8YYTV3Wv36d3oFe+XhMv38YTWjORq7f/J1gEuPW84Y7
         aFs4u24KQ5vs16CXNvsjISU6MkHQ8NnT5i4VVyZZ93U/fA+yP1PAgZMxmWA+iQ0ARF8J
         8XF0zV4QHZ3q2BcAeXAdbL/a1nq6z5sZ7YS11+GX2YHziwCBAjELU0MX6vPKMKqNOLE+
         sfFA==
X-Forwarded-Encrypted: i=1; AJvYcCVBl/bVAEFh1xamiNIPj3ZfVGF4qRsS8B9YaQe7n+WcYGBu5qPSrYAOlrbYHawG9e1mYo5d4j6Ov3jNlwEjV0Fc@lists.infradead.org, AJvYcCXkxaEIVeUcE5eFuUbwUPhCGV6OIcunEJeSSccipT4tw/+AqUBAIp6AsB4OZa3wA13ZVJXQTJZQITasxzCZIsw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yys3UtrDazH7JmzoCI5q1Nne0riO2G2BbP0GFJQsdP9KCiLNy+J
	XdcVoPI+DYkSG+zM1uchHR0KdHf0Qz7zfg9t556Zyx/Qji3c6JwX
X-Gm-Gg: ASbGnctzQKG8uVb8PACcd9+Gejveb600VFXEEpadCNQtmNkNHbIc+B0xhp0BL4IGGBK
	aqAV1IpafnFrPJ+6T47gMGcVW4DMhATu4d2qUulIQL7VzDmgFqEGNTdWHI1Vyz5OFZtN9aHBgpF
	vgf+RPeDzZvJXJv+S4UkoOVMIx8ZKBCaNTu0Ljx+LREt/BpnkXVJDwlEKJaVty9Ehw8i4w0vuIC
	ubTIDzl+LepCaDD0SdzTVAFG9pCjEQtq5QttUGZCuI5jT7Ln1WlB3T240EgO+q4BUlkiaJT8w==
X-Google-Smtp-Source: AGHT+IEZfu+l1o1hoQ1rEHsHEhSrUCQ+IgltJe4rj/iDVEpIiZTQOzNjgMefNIoGfMKiTtnF13E2Dg==
X-Received: by 2002:a17:90b:180f:b0:2ee:d024:e4f7 with SMTP id 98e67ed59e1d1-2eed024e5d9mr3157086a91.0.1733109607587;
        Sun, 01 Dec 2024 19:20:07 -0800 (PST)
Received: from kylin-ThinkBook-15-G2-ITL.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eed19aa971sm540723a91.1.2024.12.01.19.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 19:20:07 -0800 (PST)
From: xueqin Luo <luoxueqin@kylinos.cn>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: howard-yh.hsu@mediatek.com,
	benjamin-jw.lin@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	chui-hao.chiu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	make24@iscas.ac.cn,
	xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH -next 2/2] mt76: mt7915: fix overflows seen when writing limit attributes
Date: Mon,  2 Dec 2024 11:19:17 +0800
Message-Id: <20241202031917.23741-3-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202031917.23741-1-luoxueqin@kylinos.cn>
References: <20241202031917.23741-1-luoxueqin@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_192008_552666_6A8ABED6 
X-CRM114-Status: GOOD (  10.77  )
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

DIV_ROUND_CLOSEST() after kstrtoul() results in an overflow if a large
number such as 18446744073709551615 is provided by the user.
Fix it by reordering clamp_val() and DIV_ROUND_CLOSEST() operations.
This commit was inspired by commit: 57ee12b6c514.

Fixes: 02ee68b95d81 ("mt76: mt7915: add control knobs for thermal throttling")
Signed-off-by: xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 6bef96e3d2a3..77d82ccd7307 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -82,7 +82,7 @@ static ssize_t mt7915_thermal_temp_store(struct device *dev,
 		return ret;
 
 	mutex_lock(&phy->dev->mt76.mutex);
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 60, 130);
+	val = DIV_ROUND_CLOSEST(clamp_val(val, 60 * 1000, 130 * 1000), 1000);
 
 	if ((i - 1 == MT7915_CRIT_TEMP_IDX &&
 	     val > phy->throttle_temp[MT7915_MAX_TEMP_IDX]) ||
-- 
2.34.1


