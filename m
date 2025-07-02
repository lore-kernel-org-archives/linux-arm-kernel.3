Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B857EC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPtAO/bCMb0ayQy1ZZ4Q4T0/klypPIiDPkWybUy1oW4=; b=INe9yz51gdzXTNz8AW+WxefL7P
	+DfIWV2f2mOq/cG3F7F9zvaRPLbDu8wiKKToZWhl1XYh/suz9CB6/l63HhL9FIJDm7A8I6S0cvbq6
	GZ3IAC9xeVKK52gxg7sjRtyHlu3cjOyd8NE30DaA9XvR1Qe7uz7mOHC9m1f0pjE+CC6psvmyvChIz
	7SXXqWfIs69xCCQXESj1RIM/dCCNWtpysgBPYS5ifLHrWUQ7eQP9AJL+zdzlJ1wArxJo3Tv6uCExL
	7E1d1fjp2Sc1y27CIzUcLE5+QHPZA3nHEFv8OaiEuuPNsazez1fFR8I0Wek8b928UkjSo6xn7O8Pt
	AkHZvt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxeJ-00000008U8O-0jEG;
	Wed, 02 Jul 2025 13:37:19 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxOn-00000008QmP-0cAB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae35f36da9dso893297666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462475; x=1752067275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPtAO/bCMb0ayQy1ZZ4Q4T0/klypPIiDPkWybUy1oW4=;
        b=IF4Dg4hRiBC9XW8VX70kcBF/B6gO29hU9DUx0SCJQEiD2KsYRURPJply2F7JBxNVr+
         zNObbOm5x1LQmH4WmVXeSzM16vvEbBd6a0V2IDx2RG06Fk2zMVLxKc+CXeIqMqAcW55N
         K/dH6d0JOPvDxx6YkPI/RpscnFyklPqE5s1ldO64bld7d0V/SVw9kcLzd9jwnbmdTcJd
         JedX+hHoEQJ7GKNrqddPEgNzABxxjRdCqveCl5p6lf+EQmDTeph5tZcTAYUvXMb41R0Q
         z0IKfhb7B3PL/ffBkwyZtxRqvYvBYw+Ow1uwVFmDlcLwzolRSfuJ43kWvZBgbJ2hsjZ7
         zRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462475; x=1752067275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPtAO/bCMb0ayQy1ZZ4Q4T0/klypPIiDPkWybUy1oW4=;
        b=oIeALk0igtciJxCKZ3x1fPwESmjnvtZImcGUqwv56GcsU3gMMUhblAur07Ip2LGCKF
         hHIGSI2BAOyCYQZsxt3VJ+tI3Wibfx1IZ4nlMyJa0S/5fLEeMqBgE2Jzyp5kgIQ7tApd
         yT0muZFck5eybVcq1QHuMq+YMqVCG2xCeFqYQzqJX4HyqaKTqsfDTrVp6j62dmUP20KA
         1uj0J4pbUCqo8+rh1JRNWxfY4q4ANeCwRbIM7wqaylApELcgOQwk9SdDQ0WkKe+VuWEg
         M3aGF+Vairc2LXdOkIRqk7qOvvHfb4zXEA++ft5y4CRBc1gZJf0x6gMDfF70oBOcYdpi
         3CWg==
X-Forwarded-Encrypted: i=1; AJvYcCUk8b5eMH4B8XWqQK9FJHyaTq1oOg6wWliM5CiVyNfxiWMRGw8hN+iHJiKFgQvdWyhgaAjuS/r8oL3RjT8llgLS@lists.infradead.org
X-Gm-Message-State: AOJu0YxLMVsf+eAxUENnjOgHlvo1FnEdUDiWJAmD2lO50XynRzJZtzP+
	uadKepLSMQ5wRrsKnyuB1rw0C9pG53OXmQXgKPJXONxfthgPG/tRgKAV
X-Gm-Gg: ASbGncsb68PRxTIPgZ/tyFn0r/75K6sP6Lk5CNQ/5a8vzasjs1i/iIR8J9GKGeEXIyw
	Sqjlt+TU/pWX7eGeZ1wCTidHyxIqg5wCHZQtpkxjT/BYYx3kNYAfiC+J9pVOVjjltxhc9jMaWIb
	8eH7tC/ZOB6vDDlL+tc13dYaWCNuAnwNYaPSX03AJiC3gBGppeKZ2q1AuwJne+eGuZ6VTT/Kwby
	woqhauwgbIKw9Zbba7RlkdgNN9a64hhQp3d0L/F1wbKVLVDZK31V1mMduBjltWpWh+tFaNpIN8F
	ocwaucyGr6yVHZoLiM8VXs0L4qALg8Y6ZBoEdwgI3E4qbgR20Vzseew6efO9lK10KqHEU2LAcig
	=
X-Google-Smtp-Source: AGHT+IEA3de2m4giSGKNLKSmBJkZ2z0wYHzUm6md3r9AFoIBaZoB/eT8gjgMNLZxZI3iFqQoSe+Zcg==
X-Received: by 2002:a17:907:1c13:b0:ae3:b22c:2ee8 with SMTP id a640c23a62f3a-ae3c2dc3540mr275616366b.37.1751462475207;
        Wed, 02 Jul 2025 06:21:15 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:14 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 02/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Wed,  2 Jul 2025 16:20:28 +0300
Message-ID: <20250702132104.1537926-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062117_189773_82B6B70C 
X-CRM114-Status: GOOD (  12.75  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
index 276c5a0b2dc5..c4bf1503eae3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14742,6 +14742,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.50.0


