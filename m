Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACA3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niTukLIvAiAEZdTX9VzP25J+OMwBy7xtkz5/2stDFtA=; b=j0beDGK66Q5aEt6g7/UHaV/SVX
	6zEGDaG531witjPNPNYDzS93iewbFbWqB49ZgUPDg9gIGD1O/wsish0bWx4GnO4t10xaOsdGs+QMc
	e4ikQLjCZtB+9YtTDamQZdKA2CoR37eO2Pw02Fob0kpr1XZ+8pw9B4DUbUA6atPso7deVLudnrwpi
	o6vZUh04bp1Ms5KHIHBn5O7spMzeUMXs/mN6QmuMW86ABu5spcDM+YBmvAEJZSb/U76RWW8mOw1xP
	IKAs7AJCJpfPjT3NleAjytKIxX/LU0gQbuLsyB3Ugr2vicqVx4R/eypqDLQ7UNVUrDIp8JoA09qhz
	DGELOOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz9x-0000000H2Ht-3InB;
	Sat, 08 Mar 2025 18:44:29 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0a-0000000H0Az-3wcC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:34:50 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so3653901a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458887; x=1742063687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niTukLIvAiAEZdTX9VzP25J+OMwBy7xtkz5/2stDFtA=;
        b=PkGFPPwe+Gn7qnCHHQJW7PutnFkkviPBfilFUhiGj/fd1RWnwZofBRAmb3bdVaIVDm
         t8OZg4VDz09flUnPzHJTmdFcqrOhc2YP9TZ9E6AsxV8UrNdYThzUIV03rEWKIsVpFJxh
         5vLgAxUk+DE7UK+Y/jC4wFCTKNNljcN7Zrpr3vC13hVK5gfOpzaNRfycLzq0U4tG/fwE
         w7rB5rwfvx3reAeqmZ47km28DhMJQE5T4pGFJU7IGoCtM5YqDuECe3i7ynZKPD9umeIu
         Q7/pZMcEO3Z8XuBgXz+FGH1EWkvKOnZKKTPccZGmKNYAA25sDM3DCqpNcDO1GgxVImPO
         HOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458887; x=1742063687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niTukLIvAiAEZdTX9VzP25J+OMwBy7xtkz5/2stDFtA=;
        b=mrLMIY87vZyQYsb+C5C2p3/I13dVdjaz5WW3mXkQI6uGdsP5kGmzU5Hy1uiZB8CCEz
         sVU3zZFpLTWhlorBRb0RjFfWblh4NTobkcpqKHxF1s6aIG6R5Z9BigYfzxxJFcdbqjBt
         KTqvZ7MrjSm0TS2EU7ei40NInp5RnNnxsmQFahVC1EMiomQOhq1SSgNO9eCISf7jPrUS
         UWCZGqcl6CygOKTmRtm6luhAPldL9yNxn3IpfS9JHGJ6V8C5OzcjpxwQBjpxh7tZpOK1
         DFd4oS8FmMNO8rjubbBvQBaFHDkD7d1Tl0cOOSMSn6DjTSdGwhChLENJbzLE/z+pEGs5
         Filg==
X-Forwarded-Encrypted: i=1; AJvYcCUQjziCAHz7iyAH4nsIOIdzRHSTfSMcgtwibdHRN2BLywQP4V0Sr1kaCx9WgGGsovS68lyN94wn1wT2AAmKVOzM@lists.infradead.org
X-Gm-Message-State: AOJu0YyY6iPDUG1Kxpc56y3OFVQKB/8ZGUVdsR9lSrsA+EA/e8nXdIJS
	7yMnsoAeqolTh4X9pR7RtiE2rqD7ld6ZYQoZgo9otYtNi/c8aVuP
X-Gm-Gg: ASbGncsjCWGL78p0CEpvL/FcrzVicJq62/AqalyPGBvg2GfaHrK2dXbAk2oMUq38GzN
	WXhoPHksgalcp7fZ7BE6w9eKdiK0tjaKG2cYmZIgJoXrxM9mcUJvRe+MFBxBqxmgF1tYMvpXA4m
	y7SOkeuXrnLhsDkN89e6Hn2PSVaWyBWy56TSQz1PIqgl8kdqu1n/qBajnwB3VAee5x2APiNwcim
	0aT64MFmvm7L0S/+JmtC3sbTZuaBPALj9U6esIEnIePQJrlvPejo+0octhuN62kPKJmDXz/drxJ
	MlgLDRm2HTd3EBWDXlZNjvwvgMhzKtfU4ZL0owMwY5EfZPafIiC9VjGCoQ==
X-Google-Smtp-Source: AGHT+IEYfnZZSKKwlnhzVkFTovCEetnxmc3aAYiYEW+59CxQQ6vlMjKTl8zXdIYjCmymG9n4u7FXQg==
X-Received: by 2002:a17:906:f59c:b0:abf:6389:6d19 with SMTP id a640c23a62f3a-ac252a9e5demr952699666b.15.1741458887103;
        Sat, 08 Mar 2025 10:34:47 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:46 -0800 (PST)
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
Subject: [RFC PATCH 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Sat,  8 Mar 2025 20:33:34 +0200
Message-ID: <20250308183410.3013996-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103448_978797_90FFAF67 
X-CRM114-Status: GOOD (  11.84  )
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
index 20114c252e01..1e5b85167d0e 100644
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


