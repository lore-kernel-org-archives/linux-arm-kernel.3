Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C4BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=; b=iuxorJOE05a/LbzHIkJLxtR4kl
	WZmvrQkk2zHPIxUTCT+0fyUry25CEt7A/bJH1jjpWcB3U10pf1AQ2LYLHKAiUhXOoNAh2AktwEn9U
	XGCLtTl36OQ/EZwd/K/oViSOkpaR8BP4NeK+dG/QbomTkfLX/ntclralV1pjhIbK+UTuA0iDTH4K1
	oczwRp0nyKyVAELaSvNQYFnWzIth/OV0j5s7BwWUhaR5sBYQIPi77WX/55tD3lIDMqM8Gj6QlxQQG
	UdEhCSUfZB8Bw0CizWgcwYVG4Rr6fwtg/tU6NA20CYuQc5jou6PQaaKq6GmcKZBBcEfFG6HpNxw2W
	t4uypBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz5A-0000000H1IQ-2szZ;
	Sat, 08 Mar 2025 18:39:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0Q-0000000H06Y-0AQm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:34:39 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so626301a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458876; x=1742063676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=nl83aFkSCHWLr0d9WA2kz81g3mF+JWYtGg6kFwIodwDmZR7hsFb1ZKj++FdDGRW2iA
         XX9PyKLoYtC/+/vg7BvR99xCklLPeSjwBTA99wMYtKQuFQplZheNKAeuhiFWSuRzLDP3
         0j3Xtt+fbI15vD8FE2B6rh22iGO32bfPAh7uLyasp0I9uV8aIgVSfZwhLx6nHGC7ix8W
         A3ajEbPHYbWm65c7f6VVGO4UBEN9o4aOMRg81/4C0Gu8HF2DN8aTHwewPps6a4g1ETTK
         ODfn7ew/AWNTYQKx7EhZUg0DCGWQwB7wgN/wyt+5IQjHsTJFhyDN2N+GGKxmhVCmxuNu
         oTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458876; x=1742063676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=p5i8Cjx0cT7P9Se9HrnZlNcngVNQy9yRmWpG0CQP8kfsTxhpP2ChcmxAp43cY1L8ne
         xSO2oAlZlqChazMLK6HPrO1B3fnwv0vdHnyCQ1aAcJp+6ewcKabMp/c1Lq5c+vsfCHFf
         LiFxyj0xCzx32OPXVhRs3+ENBwPG6lje0W2ssu/5FdHkOX3lMmm3c41sZ5P6TEzL+ZCo
         xFE7bF2SJb1wix6z4wgwcAEVL6hbyGvvnvqrp6eDADqBWKOg8hd9GEeluMp0L0RB4ngW
         xxlOzISc3kPZvgNLL0jxq77HfJQK3eeDRYVj6LwAFkHkOMbSmOWiCwx8sYv5bBj8xZIW
         JgQA==
X-Forwarded-Encrypted: i=1; AJvYcCV6qgOfCO2K68UPeh9fNpL9cVgtgGqx4wrM3z8jM6RUhi+oBqs0mNARuJcvyZbiFg4SgCIxaLNosR77bBRB2ECv@lists.infradead.org
X-Gm-Message-State: AOJu0YzvYwPm9tp8Bp6Nacw9ohi4fvWROeY1ZCM6aaUeVwNQd5TDbbmH
	nl4v7kof94lLjvkY5pOdbnG3fPU1CYWVkvczb0tGwTG8135VFoIs
X-Gm-Gg: ASbGncsjzaOqIVLjUTFRe4H2dCNy36gorkbFj58P1W+SBlQ/Vjm1xvzSpR1b+x2Bza3
	v/yHYNTeijd0dgzjgm7RL7tutEhsR8tPPL9FZgVZaAfSjbdAyxDKfRVjkSHvI1MBSWvkmPKgvpq
	kubK7p+SL5CO18KbajVIHz9ydzwBTn6sqA/C6qCxzKKypyDVVkjyL9hfLitn7GhxpzeqTt9DPwm
	i/HaCWhsJ1526dVex0qrMz7IrQIYAERrLvIbYJInfz19P8Lngj8qSKFzkVn+w2Zx+OMyE3KkG7T
	mwZtJHLiRkerf9qxOOa5tIizO8vuYvCkFUG6fj1OM2uXeaMslTz6eAS3sRKZC33SK+5T
X-Google-Smtp-Source: AGHT+IEFo+JxS1fGfKbCZ1KRjt4dKQZjHo5NR/dqzrNE9XeFG/awZJXR120fbdrpTpOmQk9ld8OSKA==
X-Received: by 2002:a05:6402:518f:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5e5e246875fmr19328628a12.24.1741458876037;
        Sat, 08 Mar 2025 10:34:36 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:35 -0800 (PST)
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
Subject: [RFC PATCH 02/24] dt-bindings: media: i2c: max96717: reflow text
Date: Sat,  8 Mar 2025 20:33:31 +0200
Message-ID: <20250308183410.3013996-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103438_077548_600793E0 
X-CRM114-Status: GOOD (  13.06  )
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

This text is using weird line lengths. Fix it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..1026678a17a7 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -12,16 +12,15 @@ maintainers:
   - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
-  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
-  into GMSL2 serial outputs. The device allows the GMSL2 link to
-  simultaneously transmit bidirectional control-channel data while forward
-  video transmissions are in progress. The MAX96717 can connect to one
-  remotely located deserializer using industry-standard coax or STP
-  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
-  the MAX96717 can select the MIPI datatype, while the tunnel mode forward all the MIPI
-  data received by the serializer.
-  The MAX96717 supports Reference Over Reverse (channel),
-  to generate a clock output for the sensor from the GMSL reverse channel.
+  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input into GMSL2
+  serial outputs. The device allows the GMSL2 link to simultaneously transmit
+  bidirectional control-channel data while forward video transmissions are in
+  progress. The MAX96717 can connect to one remotely located deserializer using
+  industry-standard coax or STP interconnects. The device cans operate in pixel
+  or tunnel mode. In pixel mode the MAX96717 can select the MIPI datatype, while
+  the tunnel mode forward all the MIPI data received by the serializer.
+  The MAX96717 supports Reference Over Reverse (channel), to generate a clock
+  output for the sensor from the GMSL reverse channel.
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-- 
2.48.1


