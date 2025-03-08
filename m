Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DE3C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 19:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAHmn6rG6ETfCx5uG55oa9NiQsZ2fVF1iLru44ItkPk=; b=b94IGJB01yDiGQ+2iCpkiRMxoE
	cUIsURTVv+D54AvIS12YVTI1tAeZ37PQnKWPODPnX9wgcNoHDkoNV2POpm2VA2nFcBMclwG/hIbAT
	TCChzGJrmN782l9VrhVZ0paMNxQY3XQ3cToK6i+3XsY8gXgfa32mqJB4t7Gdd9TcULr4pN8y3g5eL
	JTEa0HIdIpdlensAFjjYQFOEn/Cn2KutZYqrSVFSOEwu1c/DzKiDLPKD/PNytaVHYb+8H6svhJNnQ
	nW1ZaVLKp3AghMosLBw1ePQuxjzx+8wYZqKUNVq/+ZWxscQrSCmpo/mvCU6rqgDDxugimOk2eXkc1
	CJy6FTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzT6-0000000H4V1-3ZmC;
	Sat, 08 Mar 2025 19:04:16 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz1U-0000000H0Sh-1bG0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:45 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abfe7b5fbe8so419172366b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458943; x=1742063743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAHmn6rG6ETfCx5uG55oa9NiQsZ2fVF1iLru44ItkPk=;
        b=dR3wg4WNl8SoNkcPpGLJGlQRwja8ogzH+/UzzxsQ0bFsB9/Y0MOn+nMDp1kCS2r3LA
         amNHto6SDTn2KqRCILChWUyzaHoZ3Lc1dFdaIY4fTBNGvAru7K9EYylfSkT2rxTXMdY+
         KsAtMlPDmp+YFlCZTdOvZNfcx3CpQICBYmD6M6I66f5DOEemNp2qtG2mfj0wT7FU7Bbg
         78qTkgv9KRFzwBgqkk6KxGEQe1QqSvOXpQs0qhDXGuSsk8dwIQ+uobEXjWBPpoXveoem
         9xjGlI9Jp9lgwlOTL/4TDxNHkF7EZbokDsMtzW9USQOW5gA5TydIx4P+VvF7Led0eX6k
         wPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458943; x=1742063743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAHmn6rG6ETfCx5uG55oa9NiQsZ2fVF1iLru44ItkPk=;
        b=wjhNQKonwx7A8c119vZmx40zafeP4H0IICFAi9IFd24MqMw5t+geLpQpp/ysbFQQi0
         s4U4DieZR/NNzLVKE1vWA+E9D06Hpxu7HqNUq6qwM9G8RWpXNh1DYMj797EqaAupzLY0
         KDqL7oZBx1aJ6+wojZwUX3QvrPLajC6nVKxhrdzBNZx5HwJL1H8p/QoQbz3ypILXlaHa
         nSg3Kfh57qB/fMmPArNEIytcIPGawvEtSJ1a3bkJLVG3rFdEo+FYDqP3W5a/hQDQh+D/
         fJVNnAdRxhLytsRKO01R4Xz5G7MtOkuvzJR6qAlqP7spzTCZCM6WHT9m8c68lnRFERR8
         4fcA==
X-Forwarded-Encrypted: i=1; AJvYcCVmfw8OKPgrfQ86JT2mG6L6vxQJ92KNj6JxCZyE8jgc+77SMze56e4be7pqphdomOirWZwtWcM9FqN5V5HtPutb@lists.infradead.org
X-Gm-Message-State: AOJu0YybMkN4NPKweieeSTnKd5KjbfgqHoZQVsdvMhiiaFexPLyIM1Pr
	CzF9uMuHOFU8K8+miWPeUrYeLc8o5N6ga9ZqKGX5/XJQlBJOvHr6
X-Gm-Gg: ASbGncvJaPPtCV707HY3akWxK2TZJ+BDJ1Fs4n8aW2kSPpJxAClU9acH+qGBpxeID4e
	5qxUkecHcmC1jlfpJnEhkQC8jtxM3hRtAw/MNoq3paOOZ8hAuxDELIRAQ/lEeGr/NGRcCG0ByeG
	A/HEwkiuRxk38MoJXedR6qj3pRgnUG/wzZzoyNK9pIoO3SgdtUl7OVHoFCm21fBsxQ11pnelMe3
	2Wi5iF9w3s1jMgmmvOVIVo/4m+w40Qc1m+SlWG32wPoNW+fdp37gF8E9wBwvCtS2yWXSBKZkx96
	bjfZtGqyJzvl7ameHbq4CoyQU6egWDymgfCGNG/7eIVYbUfSxM0+6mciiw==
X-Google-Smtp-Source: AGHT+IGrMwcZh0pY9ViCetXCuLx6l8flR98nHFGVJmFE5NhrBR9RFuGiHgNwfMO7DQSkLgJr5+3lrA==
X-Received: by 2002:a05:6402:845:b0:5e5:c76f:c019 with SMTP id 4fb4d7f45d1cf-5e5e22d8d92mr22199896a12.17.1741458942777;
        Sat, 08 Mar 2025 10:35:42 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:42 -0800 (PST)
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
Subject: [RFC PATCH 17/24] dt-bindings: media: i2c: max96712: increase number of output ports
Date: Sat,  8 Mar 2025 20:33:46 +0200
Message-ID: <20250308183410.3013996-18-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103544_417900_2EB57DBF 
X-CRM114-Status: GOOD (  11.82  )
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

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration.

Document this possibility by increasing the number of output ports.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml        | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 148d196b9acc..52b5603c2f53 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -45,10 +45,10 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: GMSL Input port
 
-      port@4:
+      port@[4-7]:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port
 
         properties:
           endpoint:
@@ -66,8 +66,15 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required:
+          - port@4
+      - required:
+          - port@5
+      - required:
+          - port@6
+      - required:
+          - port@7
 
 required:
   - compatible
-- 
2.48.1


