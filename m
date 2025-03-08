Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3DFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaoNQqy4aLD9/xA6TRYAtkr7klI/0e6BppeUXZTiyUI=; b=bKuItlAuUX3MXO9C8tfQzI8Ez+
	chIzT25sfE/fpe3N0mZFFDyBNynDRZHP5JoLz8XNAhxSjA5S65MRjgtYKGAXY5t2833vKNY6naQFB
	01iXK5LxwE5Cf51PGuEkVCPx5027ZM/wQNiNQWH7A2FSFYVQFqNgnvcEcsvWQLHFqKATLWwoKeWQr
	lxsDei8KxfWOLtOfk7ZodKplA7aEnpRScjH1ybmCKmps1bWsEfg2R/zdPwkn04id2LMHOUtNA+KoC
	1u0x2riAvOlUwGATEJhlqrSrmxxKKdjlMKAkk5h5OZDJfBDGQPelA2+t4biJAfMdJF3p6shysZebY
	iOqGZQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzBZ-0000000H2bH-1pGZ;
	Sat, 08 Mar 2025 18:46:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0f-0000000H0CF-0Szt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:34:54 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac25313ea37so349742766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458891; x=1742063691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaoNQqy4aLD9/xA6TRYAtkr7klI/0e6BppeUXZTiyUI=;
        b=JCEm7Nqs4zp0zoMTKkMn+5Gsq17+C74dF4bCuKdcLov6iM61jjl/PEdlr8sHD9qmkU
         KX4Vrb9j+PaIpLT+Gs0Ok6Jr/V/Rh/h4hF6j6qQb3bdEsu3oR8otIKKVWIpENs7WnPCV
         7VDSMHIS1ER5RxjMG0++S/UKYKC/QmyLvEudjncZf1W5bD8oPF2zFlPY2CG0yfxjqPAJ
         CkgWd9xkkymWO1B+tu6Rqp7Fufk7xyBC3BcXPt/3UMEmYgNxRCB8LwdjiFvCDXB1X15z
         cLFO1c+IPxLUpCfJUwdfR15JrbVR00E1m9kWrvOE3kC4UUydNnaZrJ+oFiQT20NgTfvv
         abHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458891; x=1742063691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaoNQqy4aLD9/xA6TRYAtkr7klI/0e6BppeUXZTiyUI=;
        b=JGNZOSPAxDLy1kzRU50yzZX9nVlVu98VfU3tzXXj+ouT9Ts3NBcKvkYBLhYKVvZUOk
         rmDRY3GpLsVGZUovI1SZ5I+zkk+UPM51vZejo2siYJRgUmYXcaEV+jR4/kWS6biNfymO
         6gwApzpCqSO1+VkzgdSnA1iouEJ2R1Vde8L6cIo7/+aJMIyY8EL1l0XegSsNQVgzayir
         UoDczPpx7clr/oa0kzEg/Ac2zqSNz9HIEZMSq/cACZ4sS4+zF3hHgwZJlihMxMwhrejR
         YKrCzXsRX+ddOZ2FXRtKIUn7+rodj5+Gs5Ol1Tzo2xA83N9qVljvc+ByUn7Ii7Oezmu0
         wklA==
X-Forwarded-Encrypted: i=1; AJvYcCX6nRpmuV+vWeDx4DvSIDG9hAoBiZsYT6ytfhq4H2VKy/CEvg0DDHtbAKCEixfTK8EfLo5QEFVG1U/v3VdQep2W@lists.infradead.org
X-Gm-Message-State: AOJu0YzCaBQJ47FV7DvMh1Z7X5zHfJIFeB5z0FNUcv7cNq6nE3CcYp8U
	Wzcp2SJJcELqhuR0+4zatc7OJGxIe5tTWgW6m0sAmnDgO6ZS1I0B
X-Gm-Gg: ASbGncvHGEJd7RpyMFfomQOpQHXvAP+2b2n2SNze7o36Su+tDLuXvrcuYVbUw4GJI5b
	44o8TT4gI4xJ51u5ujBuHYQb3RP/DEEhK9WDt3Iw4EWeQAxUtSboOzOWXAwAzSgn2ljHrLFmtXl
	heeB9pwh7kqi3cw5eEILMzRW1YNo2+5qpOanRuQm9QGseLuNr3Zyt5+QiLEXufXt391hjQNzj3s
	RBf80nNLUgqAnbe8FEoWsv+HylwsgVhZgngmVTvGmbspXQr3pSZRRWrQli3d5RJ9NlCa9Q4voFT
	xg9gzZugMXzA9nsSPRRxBmcJT/NWuYrbuXD+lPLXHNhX+OgKrkwc19nxKw==
X-Google-Smtp-Source: AGHT+IFezFam6alDx90TUfBdNmoublXmOdXfqhoT08gBkDkGLkO7nMPBmg+CdG3FyRvs8OOwhJtfsw==
X-Received: by 2002:a17:907:7ba4:b0:abc:c34:4130 with SMTP id a640c23a62f3a-ac2525f958amr896455566b.18.1741458891246;
        Sat, 08 Mar 2025 10:34:51 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:50 -0800 (PST)
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
Subject: [RFC PATCH 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Sat,  8 Mar 2025 20:33:35 +0200
Message-ID: <20250308183410.3013996-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103453_150663_92385163 
X-CRM114-Status: GOOD (  12.06  )
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
index 1e5b85167d0e..2d7440049318 100644
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


