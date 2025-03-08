Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8BDC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0RTV5VskyQw4SxBnUu+Jki4ojhQmudu+bw9SS3hYws=; b=BPkuYIgg3AkSDU03oQZ0gn6TE0
	fmlZS859qBLopxwNPk3o6plmctUskQJqlmU93lVehcmX3Imb94gXr1JUDOoUHLAr9fgVDVuxzcP9L
	IrtuVcSSCIgGLNLGJUallX9tH7a48Fj7M/AlRHOtyxqejPagD8xeu6uLT07Wwtuviv6L5poaY3w0K
	xjdnhYiTLJfhEJ1OaCT9WhUtyctldnJ3zYyUMdXe7xeMpSbnMVeEet5eJAhwfWrMr0ZJXur5f5WO5
	RK3ATo5eHgoocTbm+3krxYW91oS3VdcqAk/pR+ljyloQSVmPZRin08S4p9YzxZSXacWJw1xWXeIBu
	0obtkEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzDA-0000000H2w8-0JVx;
	Sat, 08 Mar 2025 18:47:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0i-0000000H0Do-2KoG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:34:57 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaecf50578eso526355666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458895; x=1742063695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0RTV5VskyQw4SxBnUu+Jki4ojhQmudu+bw9SS3hYws=;
        b=RLjHBctQnzO/gxHaP3OTcYyqueAnaacdZ/253yFaBJPSl+tD3nHasq9ZEAE2n0/vR0
         RIrEX1aqehwSkDCpEVveKhimXGfppqWnoDRCJedzJOEBn1WQ/tQZsxu5gp71ND6qEVA8
         b9ENs4UzK0NAi0/ILS1jc+T/1UeeBFd5OTwTGRUUXaDW5eynmNDeLwXT9uhYHlzXKixv
         MJSPrNO94y3TM/XK+yDAuVXBS6Skmr2xJQTaCmnYbWKrOvKheABmb6014Vc4dj1yeETg
         7/KGoZJx7jl/nlfBE5zXtoNqCOV2rSiP5O9soJU98laOCt/eG1cl2w/EBnbYWafxH3A9
         6SbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458895; x=1742063695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0RTV5VskyQw4SxBnUu+Jki4ojhQmudu+bw9SS3hYws=;
        b=fd0fNvBQ2zSqfCHmWa91YlZSDms1OIY5Pu6EwClCELOVbPA6nMNYL5zR+lG8NXahOO
         Wib4l0jwBGlMhB+yZDIIB24NFsoVDcGphuhK1ZVoBL9uEUgp1F+JkLwo+pHslU0ydC+h
         +MoK6g81L/Sp6xziGJK3k015aGVByU9pprmLujgCtYICx+FdWe58u/Vy8C53g1KAl983
         Lcs2nEjzAtxCWlj5ThVCiS8F4a0BENTcR5aywpTuZ/0m7rilBitVMERxCEGYVilm4Mu0
         wLRj/VSTque8p0q0qRgdk27wGtauTqMsyMfxerti8TrYgGAiSPLyHLy5EReXktQ3hNil
         nZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCXRRzH5MAAmriJAC/dc6yy/0b660uMJ1MK01Yi5bTC0yXIiljGyBkgAdz7dWgFZULLRf/Q+uy+lHQL98+BD0f7y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8wpJ8i2YGPPWaFk6bzWMqlgDcneuGcvuR7zCNYO38K+gKt2PZ
	CUFPAT8TxbUtvxVsuCulTDSICsH9SklrgAQo3Vpg4BDVSaUixixi
X-Gm-Gg: ASbGnct04KHLGQiCSTzsoU/iw/7Riu4amFBgV5W+5R3DWmjPNOmvX/roDzyeuqovQ0D
	GAIoN0OlYuzfZawG3mNPfBp9+5INBPBUGKxTtzhXM0Y2HoAP/B5GKFHRnAicfiy2ZscnVLTsKzh
	0r8RZIuA8FDvJErm5ti0kAV6aMQahKpiypUaifvlK7MoWFMO4rUdR4ESkxjjBVQZX82BOT4mZ8M
	eYmAm0diM60A2sfSKs1GA8RfZCe4+3PUFGuJLMhWdXb6D/0/oSutV5XXsAGypzplYV04nglnI95
	ayXgyTWWE9c+tu9LF3JaXaO3ptq3ZkJvc2WHUpbRYhbq9LZYim0KlQnfkA==
X-Google-Smtp-Source: AGHT+IGUMLDPU+kLqQqakvTwdZEbBOPDJZa3MFxXA26YIFzmlmYTztaOBI2ZGBOinmdRJLH3zGhkDQ==
X-Received: by 2002:a17:906:7303:b0:ac2:3ea:c23c with SMTP id a640c23a62f3a-ac25273a0f7mr996974166b.5.1741458894715;
        Sat, 08 Mar 2025 10:34:54 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:54 -0800 (PST)
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
Subject: [RFC PATCH 07/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Sat,  8 Mar 2025 20:33:36 +0200
Message-ID: <20250308183410.3013996-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103456_593580_CEDD8E4C 
X-CRM114-Status: GOOD (  13.12  )
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
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..44667b74296c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -9,6 +9,7 @@ title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96714 deserializer converts GMSL2 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index f8ffb7cff9c5..7fcdcc57c8ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14191,6 +14191,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.48.1


