Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D705C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77ZQnV/idoKQSJwHe+JyKu0EB24gfw5+CVNFL3AarEo=; b=D30IUil0xxyfa5FvzQynxivUVi
	Upjz6oL+89Zge8HxYH/z7O+4CYA+++/S9koy+TWslEjR86UE6BnDyI+5kYjrpsATLdY+PBE/r+FYU
	Lk/PwF+Q796pL0EsppB/DuVDTisSW0b8GrIwr6J5VFcGbfRqC2bLisuAbveF6lFylrijbXIbrzVVE
	r9FNyiDoFw5sZ4iZ1IN7GSSeU0NNHwK21ZQYgEHfzIC56B9YnFSswG6HwSoMXSQLigxvMiJP9ID22
	OuFB41tfRQ4X5R8vR/u52KoJaYCEC73+bLnQyWH9mOJAlq1DRgEcw+uS7V7uLZx4UGAiIl1SkZmqw
	BimJ2x0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCUK-00000000Dyw-0uH0;
	Sun, 09 Mar 2025 08:58:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCKv-00000000CP4-3iHk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:48:42 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso2608983a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510120; x=1742114920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77ZQnV/idoKQSJwHe+JyKu0EB24gfw5+CVNFL3AarEo=;
        b=G4muSpYSe1DQmYg5m6DfTwL0GfT/QgPQt+MlsUXMnn/Csu7vdl+DhR9y+10VlWqMCv
         kKZwIVXXoeanHS8ihfzmmrsxS7TbPMl8u5XXH1QEkU/Jh7HlMtsGzUGmKEHQ2u+fT8sW
         YgrGqWQthUwREgG2ICHdMQCqw6e/WYlJ3CsYgSnU7orQ2s8tga/02cFMCJVsh4XCZzeF
         TjpbVYY1mJtaZu61HkSpreWa0TliRNwJfppr349vRPzvCjZ41UqnjTOX50XJxO+PCVpp
         4994MU8xgl5HwLJg8J8yY4px9x+BH4laajMP3Z9fJxP2Xl5m7kO1cGHlOw6FhEYp27+0
         gIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510120; x=1742114920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77ZQnV/idoKQSJwHe+JyKu0EB24gfw5+CVNFL3AarEo=;
        b=OUsYeT1WK3p98wrxRxpB52ZvxxcBBGS4SeMmt29J1MJ2qMsm0vNXg01kD4P4060FdM
         2WpjvU7R2EPa7gWMxmfJ7B/Ke8FRScy0WX5z1wANMYptjAYLyMPjnpQ/WTSFSDjrkJtJ
         t/uFwXzEBHJxBbLT416cOUUrntxb/qFa5LfkYqDe+AiftS1AJz7evirNp0r93pXeQnar
         SlaJBoFcFqSfE+8jCxvPipGSaZa9YKtDr89YKXSH2FImQVznGYMQ8abUo6ZT2UvKlT/2
         0R/LqHFeRhWxZtYcxyMrKV/ClT1NZz4m4zV0qwjc9AYyQ2NSq6X/KxP1e2gP5XXZKzph
         YW0A==
X-Forwarded-Encrypted: i=1; AJvYcCWc9dMeoPaGCH11nM5BWRJl2mNgOynQtPiFfilGEvsGcd0jsHtTw7971pRT4vCdU74ncz69Pfvi5dy3So4rqZgF@lists.infradead.org
X-Gm-Message-State: AOJu0YxpUr+kXPHS4QnHTHBnSzgrwHZVp81AmXR0J0idFUjjdW4SN8X2
	iybsp50pM/Rx9bJK2TX+RdwZcPfF1OnjSSr44KVBZMlP/NGYcIs7
X-Gm-Gg: ASbGncvEXv6WWwFSiqNoe3xk3gdPMVrK4qQr6ZuY3GDNpcmoNIlOGT5US+NhKk3lnBx
	PD9T4O74/2O/Dkg9rtTgw5JKGlU/JBxV5Ws0T/CAbLeDfVGbT5fXRJLz9v3FQVJ85KLrkZBsCkf
	THOOqpzcx6BMJBPlCLGCX9vrK8tqnOm6yymAZZQZL+Ev3vM49TmotEMvxmeCNd0xXuRKxv8KaQG
	g2l240x4+SzFDPdpWVyWxpyTCYzs70vc3SWu+q+QhmWhh7G+eqpfncwjrtX0YYuVsrzm4HM+rcq
	jnyryJxFrHuI68lwxEFznyaYHLkNc+GV+Or+OhLZY8SXpIt/f7PPnMroxiGawX6sl8uf
X-Google-Smtp-Source: AGHT+IG0K1+lHlFBOdHDt8tr0ZKEi9pxD/wAXNM/pWihzP5DjPiNDmSdaUAc5wV4ZJZ+UdarW2Vo1Q==
X-Received: by 2002:a05:6402:35c7:b0:5e5:c010:e67e with SMTP id 4fb4d7f45d1cf-5e5e24bd6bemr20287512a12.31.1741510119914;
        Sun, 09 Mar 2025 00:48:39 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:38 -0800 (PST)
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
Subject: [RFC PATCH v2 05/16] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Sun,  9 Mar 2025 10:47:57 +0200
Message-ID: <20250309084814.3114794-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004841_928642_0275765E 
X-CRM114-Status: GOOD (  11.98  )
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

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 0a43582168a8..31fb62debdc7 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -24,11 +24,14 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
+  MAX9295A only supports pixel mode.
 
 properties:
   compatible:
     oneOf:
+      - const: maxim,max9295a
       - const: maxim,max96717f
       - items:
           - enum:
-- 
2.48.1


