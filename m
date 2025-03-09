Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCAEC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=; b=Fyda8dYQzl95XafkZZJx+BPc6V
	jqS7EcU4OHwa6Fdw1mnrK6UXoc8oZW2HFGoe+laki3BZ1RoYZvPpeXM1hGSMoiCQXuMPhd5HkWzB/
	oS9mdcc3HRk9FHQaBr+EwPm+AODwMMSEmkCCPbMKyiZe2ydwL+Pg4ww650xgUUwwBBMlWlwd+kZJd
	KXWR/+hi9w4XvPPnJn0Dn9/zsnwTH6PcS/HVgqpkN89jloemoyaEBSsU5aZJbgx3TNabrAH76eTss
	urPIBHZVGl2TjTTVwUqLcnjStrH8TD4EN6oguocMY0atRlXnHr1gdYn3lzYCRHY/584ivvv4EXLM1
	9obVzH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCPX-00000000DQi-0cSp;
	Sun, 09 Mar 2025 08:53:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCKl-00000000CMH-3l5x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:48:33 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abf615d5f31so630105966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510110; x=1742114910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=c2kO/hp1NBKp8EaZjitmvpoAghHTfRnSgWAX4qlFGLyC4EKL9RfjbkvaPuZHD5dEKB
         yGjEVMoTQy31BtIiYqUIZX6NtjWFeRSSRJ+lg68lwaTtlCFTv89tt7TAQe59+4Fn9tsQ
         p8Virk1wDAYC0PRDhEeJbpkkZ4lKRH8lXPelZi74KXdoKBzBMuG2+UTotyP5yLB8g2Y6
         gHy+TiXdropn/pzphe1OltZLUX1//Jh+il6lNzDjYM4r6mkyYnALuEjY6Vm7Peqgi6FJ
         vVbEyqSWU2zmXDiRHlM/K70cxU/C/r/3GNF/sYQ/JBpC+A5OUBZYDsSLFi/mcbVm7LEX
         0R+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510110; x=1742114910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=jaGt8fjyYRUyt2dSr1UW3aJmqkZMeYFSHTARCQzgKFMMVeSM7OQktVnPRsbBmhrbQs
         kddzPEJ3hRAaVXxhs2IhoTmZnJX+/0fulnIP2x5+vhSxO/naTiopHb6v8H023ZEuMrwQ
         9o9C2Iz4Figi1jASVD9lKs9ERt2+YjWtwP6n53JuDnjsUmlKUUJTB/cfUxNI2iGK795J
         p3ftKV+8cObjfF6ye6jImHjDbALIzE1Xh5d8D8MvbKLM7viLS6dMLUIMu3F2NJM465pI
         j7FFrOM3M44FkCzaiJSk0UXgTFuMIp+RjFNWys8gpgbNAWTnpkQsuIQ8WlAhzB11KQgp
         krKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+M1kC3syZZsDfPriLXygXlt4x3Gv3juqKEprVnbum7CXT26DPb+6OkwLG6Utzx5j70/rV7//nTmGT01tdMm/3@lists.infradead.org
X-Gm-Message-State: AOJu0YwcpmI3SdtA1y9i9zYn4B7GdGgGo5/ll3I6Q1dxBZXHWCAttHMU
	QSz4gGfJIGSfbEYwzTY8dcHjQyx3q2erbi3fWIGPUmggbQITDF0m
X-Gm-Gg: ASbGncuHSCc9gqd9nHGb4wJxdmo01op1OApQ1P0vtAnrTUl+Y/v2AfZqDQpnwGhuHOU
	BBienu/LrFbTc5Hbz9XIVkyopJmwejBRWkCZ6VayC0FDJkclVd9/F8Hluf/lSZIZMZqPEjTWosv
	UjCsh3lZ/x+Vovi2ISAn1yr/81xraEM8P29fUR7Hm4YvLX1HFRrSuhwxRY2mQS9LgnyObyBPw2I
	4Fwf+7e4zqdYzbCOWJnQml8IJVVcRCA64E4FV+6HSFpoupvZR0n3kKgzAADSIJJ2AH88hlzW5cr
	dhAw/LctfTi2CyvUzJ5FTpsrhpcfU+V50KH1jUqd1fFjl/jWmxC0E7vWFQ==
X-Google-Smtp-Source: AGHT+IEfjqH7txw3ZNGvVC8ODURGsipO9FHidgAsOnuk5C0y4Kr3jGdwpFvRT4Ar0+alm3pK0kJ5Aw==
X-Received: by 2002:a17:907:6e8e:b0:ab7:1012:3ccb with SMTP id a640c23a62f3a-ac252628ecamr1038989766b.14.1741510110006;
        Sun, 09 Mar 2025 00:48:30 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:29 -0800 (PST)
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
Subject: [RFC PATCH v2 02/16] dt-bindings: media: i2c: max96717: reflow text
Date: Sun,  9 Mar 2025 10:47:54 +0200
Message-ID: <20250309084814.3114794-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004831_927262_2934F97C 
X-CRM114-Status: GOOD (  13.37  )
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


