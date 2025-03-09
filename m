Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5F5C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=; b=S8mbwDXxhypnHfxg8kbkMALPBr
	WD8iJ8I85xy4QK1i7ICGRvUqALjmtwpMWZXQ/RWPU9BRTaq36gaiYQqjnf807LS/w++shelSBQfJE
	Jf2zsl1Z+1urSzqZfAB/2l+PEVpGZ9rMwxrVIw8vACtuy3N+Yohuix22unS/gzkoOnHvs8lLfS+Vp
	s3vLUo4MK/+Juxw9zA/ACwigDccXiKJmBv0hKGgmFcG25j6Us1rxZsOFa8IbnF4XNbjQuxKcbkteK
	rCNq6yYHbuV8PdrBKkSD51rS8qXvW9lKCJqU8kJyBOL3uVQFwIwNP3Tzi3Pe3Gm/R2RauUDPHbrfq
	gxkpxMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCNv-00000000D7Q-1oDt;
	Sun, 09 Mar 2025 08:51:47 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCKj-00000000CLv-1BB6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:48:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-abf57138cfaso618594666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510108; x=1742114908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=Ofu4cN+wwxo9UHUy6EUZ4Rxs6poFLO/28oUNhDNtrvL8aWK9fIF71rQfJW0eWo/3BV
         zIyYMmeBTReE5H2zEUKDf7Pn96kWsRqdEzSff4aObOqYXfrASxVXJ2oiHaFCIK6Zgimy
         u1sC3YzxbrfnRp15UGbSYq5+6b+g3F5WfKazE0Rdndr5sW3NTPIJh4k+hspwLq5m83hA
         oflQmvQ3AgOUIjdN7ax99nWZ+66a9hyRZskNuF+pFItntSW/7zxGYPKn3Z8lUTAfG0pb
         GpNghk+cjFkdOwMdL+OkBBqiq/DxTCvUyG8H6sD7df7yAXU6SSprvjOIkAfIysLrTisw
         KamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510108; x=1742114908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=XRuw3zUaYLwYIwloZ8TnxSuhKXFkJahKCK3tr0wFUgu4ol8lJg7DeJI7sVSmuqHNnI
         O/EFbVyuTe2G86RFYioQBfIRRoXM1AT4j3ytjw5195NlxI8gztJc8zsQAtucIdZJyvES
         xVvYtNJkhTr8OeKItS0Alt6KfhHrT81C9ISk4U1KG/6SuDQGR1zxQUR47TS2JiywKcaV
         OEaT67wGiRjTlKryHMfZOco3gJ+Qnhyl3asFLAVIVCZFUitK3GiLf6XBEWupJIF85g4I
         Hax8i2ug6o4NWEaHSwa14ZV+Sq6xX3mgPRniVfQOAYIntMTfF+Ir0e2VA0xsQOeM3AAL
         6lWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/FXrToQyNRPijyGYseCFg4sSdj25NQN3vO3QqfwTVUGHktZKpvbWE//tlk/QVNADOa2Oyl3j4zbG4ZMbbXKWQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0AoB9noLZF2tO5vkLXwCwYzO9Cq/xeaz0TMlFBX7AbOZTSkWp
	IgbuVTw3usmDGbfKzcckoPbsmengTyx4T/LAIW+4qbpq0GQyFv9R
X-Gm-Gg: ASbGncsKoiBv3r1bouWDq1MMfQ8SPphIcoxoD/1yMlKZrFlc3hS42O9p0oXDAuTqqmY
	nUjwVMq+mZmnXIh3ygS3qX7Ta4v7RZrBRU7GLdf1MQjnXif/LW17mQJb839wrAPHuR60b2XQF7y
	Pg7Z9l+j6mwcrVf1MKx75GDweNXCgJQGDgcN0pejvS9LdC5+JsMMbpHwy6R1gkNCfwSo4oFjvYi
	ImtsFQQmg47UnJnnf8nB0q5bJBc6dGahScz0I/dkTwBkObbe7dI4y6nx3ya6mViJd2PvimIbStS
	9KJl1m2EvgKcwEyWBnmKeQL8t1a4B8GacHL/a4aw4/gz13Bq/XLiDFa73Q==
X-Google-Smtp-Source: AGHT+IGVFkKRzT6+IwXblZWULuiCcIjFTpIaLv4LnJDpvJxC9xj4WrXnY/iTgXKB48kvflgou5SSnw==
X-Received: by 2002:a17:907:7255:b0:abf:51b7:608a with SMTP id a640c23a62f3a-ac252738131mr996109666b.5.1741510107207;
        Sun, 09 Mar 2025 00:48:27 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:26 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 01/16] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Sun,  9 Mar 2025 10:47:53 +0200
Message-ID: <20250309084814.3114794-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004829_312551_870B1917 
X-CRM114-Status: GOOD (  13.34  )
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368e..15ab37702a92 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 1916d0636408..8f463ebca056 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14198,6 +14198,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.48.1


