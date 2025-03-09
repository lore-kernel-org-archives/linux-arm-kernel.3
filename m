Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349F2C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgEysl13OPBv6BFUaZyKQ7UjemHKnyK7wK7vWTFZ5dA=; b=FlAlPFsv+lRYCOz7atyp0d12Lv
	M363aKqHfmE+QUH5qMrvQqJKMXJVLbT/wh25MrIXy3WUksAeufEM2ZhiozaC7OSK7fz9wgs05ScT3
	DSPi0GGRxoWaFyccVOysliAV08fecDmTmOsmZ57iBBOJXjxxk8PYZg2QFaRdQ7NKt71yVGP65FzoI
	lQf6qoGC7oxRzD6zr7ZUAvTVsIpKECgClI4JVf5zBKkkOdae5HJuhihPiQ/OgnNxmQ8jlofwcVzDc
	Brkx8u1uqeYox7FQC6vaaU3Eluiq/n76l+S3HsrA7KucTrvT9TMYNhjiIN38uRHSDmjzh1LodLpDQ
	FQ50b2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCVv-00000000E5r-3gcx;
	Sun, 09 Mar 2025 09:00:04 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCL0-00000000CQv-2goE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:48:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac256f4b3ecso360594666b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510125; x=1742114925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgEysl13OPBv6BFUaZyKQ7UjemHKnyK7wK7vWTFZ5dA=;
        b=csauvmm5l16aYX0W49gF+fUKuDHpGIU+UekH8aNxTEX+eELOF6tKF9A3aujFoylrPy
         tS/l1IrYzQsZXOd0BmZ4IbjN5LlTogERkTORAiA/5oZI19pP+ITSaNoWXwca23Fw7O8G
         eSyuf9GVS9bb3HakiuBrSiqOHvz/o9zAAEEmAKQm5piSC7kyovaneQeTMh6oxFfTctsY
         LY8qS4lwPBeZ95l9jkr/ZQluCY5fIcQC1uUvZ8az955+3sjCBdTiQD1/XfBG3utqKFl4
         m/lmBNBemHSvET+WeSdSvSnA1FWT2ggRCZlOpI7K/hjUom+3SsEcu5BbBXvX5EOYxEyG
         476w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510125; x=1742114925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgEysl13OPBv6BFUaZyKQ7UjemHKnyK7wK7vWTFZ5dA=;
        b=RcBwRNx59eclPDMP5S9pwYoPuYLQTk+LhLX7lZ1FbK35YROAbndUHME/d+Q33QP4+7
         syX2ySNN+vryuEruBTn4p4BEl070dpiASHpTKhdEWAR3dPIwncckV5no8h2y+1SBJ5D5
         MdxpyzjlNDkUp2gV5f/8jc86yAXbnzKW/GPkASlmHKN8Xy8pn6vTkU8Zxle4mgOEa88m
         CMvVC9USPB65UFAWaSSfhjjsrxVveXREmV2QzYvAPyI6Stx+eJ8ORYp0QrtSB6LMIGyx
         XA8jNn5FcDvHoGPwsYa8qlvnOgNiVgIWIpRvgUy5MACI8irxMVu8jA8Zy7dWokWQ9lfy
         8AjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0cVdNgVpVoPuY8/JjiJfWaBY5R5BalR55z1BT15gA4163XlpZGDcBQE2CLZrxAZDs6J/Gzr8XW+5TkXs/OK5I@lists.infradead.org
X-Gm-Message-State: AOJu0YxjR8QShE73UsEB1RWSVMGSVzCqFDQoEi7t+gMH91lFoGndb8ni
	T5HeKE+DSmusyqn+3DaIB72nD+a8rrFkjskTt1nElkkW8DwDWqJc
X-Gm-Gg: ASbGncv/wY5vs6dhEFYLuY/Ixne+U+USZo4LkgT/NC2zotyk+TG/yRGg++kH0u51cuQ
	1GAVlUXPFivN3PYczWIbsca4kXwLfphhYl+DWwv+bRJo/VCTzr0XVckr2VlfERgtM+juZfRCGhZ
	ylLAfeot7yvTW7tEXrRcSnV9vMbNdVAWgadIXjWXyjA+mgbDWQcdDMVo/Z3cBOMG/qVAHbwexe5
	mcw5OZtbmmoLWzVMcu5Yhr/AzyN7TTz/IeygLkY+NbmGQTWjhgxIDD+7IJKtTBBzZipZj9ajU8A
	ndP/RSJuoZ/UrlQzdKTJ1oZ/QFT+lbneT8hs4RVwxl6IKpAV65vhyr+rfA==
X-Google-Smtp-Source: AGHT+IHJpkt6LaAM5QKyrUuU+iBRJp7mmLxht9TMjFEsX0Ab2stz5/9LcnbbS6wVDa34wHlHd/EPJg==
X-Received: by 2002:a17:907:7f23:b0:ac1:da09:5d3e with SMTP id a640c23a62f3a-ac26ca45477mr637973666b.12.1741510123537;
        Sun, 09 Mar 2025 00:48:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:43 -0800 (PST)
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
Subject: [RFC PATCH v2 06/16] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Sun,  9 Mar 2025 10:47:58 +0200
Message-ID: <20250309084814.3114794-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004846_682108_63396365 
X-CRM114-Status: GOOD (  12.21  )
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 31fb62debdc7..02857f0364c4 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -27,6 +27,7 @@ description:
 
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9295A only supports pixel mode.
+  MAX96793 also supports GMSL3 mode.
 
 properties:
   compatible:
@@ -36,6 +37,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.48.1


