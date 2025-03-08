Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E67C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 19:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=; b=mVlAP3MCxOztnMujQ/Sgz0mx48
	65NTNcMCV0HFVqVaRTt4LMuD4yCTo+vqMDaO5hrz1rGqppQ0yd8zESFD643ImPcp+avuM5+a8ihbH
	uKx2L+qvNfp5vMCANXDczZqQi1W4iDxnabHqpiud5Hj1hbRb/QYWpN6s6xa/0puXWJqmx8FyZeW+E
	QgEGL2iQNITYT306CkjgrI2p7rKR8CHZpoRIrBClhFkhLtnPDYt7LzUbLhDSPk48rdsUoxjpp5Dsn
	sZ8aKBPOgF6FODk3jJ5vHmmCtCaa40ajI9Ur6iKnWYIvZBWpd8Rwt6CD/DgJ7M6QIWM5Mu4bIgOPF
	XcsZ/IUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzXt-0000000H57J-47yY;
	Sat, 08 Mar 2025 19:09:13 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz1k-0000000H0XG-09Xt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:36:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-abf42913e95so422745966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458959; x=1742063759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=hbjbiOM7ifMAMdVjTLmaB3P3Cn1UaYV5C5Dq4xZeLbi2xPO249ElTY7IstZtca5Bcn
         3vWNHT3o/4BCQU5fxSHNf+6sz9WOVKCHG27CmZJnLOusPk95XpFA8StrrdSSGf91iTYa
         Y841klWCTvZGbybVobL6WT24cIn2isECc+ZY0EEND0QGYo3iuIpPo2lNZMi8CsHgWnpj
         +k7poADHDB/elvf0gu/ASWPMvgybOzJcULGRVh8kpE4ixz68k4buAClycRdkzWZaa77o
         1NHC98B6B5s46CBoRbkb3ABS+6Mh+FHfkoeGh90VLi3FAhtVWdQkJan4hmmdKiRkgxin
         1uQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458959; x=1742063759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=aNAFifjGVFQ2x7nR9QP/WlWtLK9poeqig/wxwbBQY0/BERGAqE9h3QQXww2ZdS2Buo
         KWxuKQJm1ySJobfr2eA7uEPZR21+LigFP9vJctbFRHOX3D1VH9O+7wYVjABSWXgSPn0o
         W+6yqGdBnJM1BhXMAaDHaUN8rF1y9yxMRuRqEi4cz0c1A6QbC9Gv7Ubew0hqEi6Cjd9Y
         7loynFmt8G9Lxf3R4VYaLVtVWHC4MZnSjJAHFnRWtFhUYugFhIUMFz4X/k50Y3800epu
         UiNn8tNjtTeJKOF0Tzsm1637WjqOQ+1fc7JXdZ6MiTIfpjVnGty4z3/6nKXK1izJ3dv7
         RdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVubWr2HP2rhrFDwgzzt6W8TiFa3MxS+mErLOmirPzKmsNRJLuZP2euoBFO4JKPnj++ncpp0QJIcLvxthozCocW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsi6zhFiUeXamTzQZEBzwyM14HLvme7ZXMbxiUNlfJHxu7faDp
	2vITHsA4oalwt1HVdqKVJQUm0A3uxlk5UAsKCylbkfbV53/W47D9
X-Gm-Gg: ASbGnctIY5qEnZa/3aM/+Lyxn73oxN50T7R30uIIp57jpTUJj9HhqEs0mBnigMtNiNV
	Z6pPdDr8KBgepnz+wjauNxdkRC39sfqD2rsARKq00xgUgSJSj9UY+rGwueLm7Qyu2m6MvgbBZve
	AVQLb4jOh6xqm9LkOTLBHyXP33Vh5Oepmm6x/8nccPPFRpU9H3IIYKbVzzhnUyg6GsXHBOW29d1
	6CNRoMTqaNZ4ztDqz6cw89aoYqgVb+haDc1NI6PUUnb6qYkHu1uFNB47gPrriOVonvZ+ANqS0p4
	9GxLBNOLTpi59kbKpRBC9o+bfsCHFa/I3fhi2YHvo/bKJZZOOYzrw0Vq2g==
X-Google-Smtp-Source: AGHT+IFeTY6f+Z5x+qQcdIB8S71nVbnmrDN479LQd6qexMksrmnIptmPnmurHuelrlJDcIOha3YkMA==
X-Received: by 2002:a17:907:2cc4:b0:abf:5fe7:40db with SMTP id a640c23a62f3a-ac252b5a1fdmr879505766b.31.1741458958420;
        Sat, 08 Mar 2025 10:35:58 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:58 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Sat,  8 Mar 2025 20:33:50 +0200
Message-ID: <20250308183410.3013996-22-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103600_077726_3F82304C 
X-CRM114-Status: GOOD (  12.52  )
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

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..6e9bd9072d11 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1272,7 +1272,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.48.1


