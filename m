Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C629CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=; b=WqZbaFt4hH+uoL/skFBc4+ikZe
	da01We2CZPvia5d/M5Z6Dpp3UfYacXpcOkgsp8r04U0RC/6rYaECm6LqG/n0/lQoOq1HcHRvQ1Adv
	NPDb3rd6nFk8VaYzCZqgE6P0Dq7kOp3rBRnav2bDXzlYplAXEPxPP3ITZHJsqYKgC6iLByhJAfMC5
	NMJNglkSs7LRNy7eszWHaomsWhN7rRuqoliHozugFjF5FB/3SZKDUax4uqSQvwk89MKoiVuRT2k2v
	X/iZLmP719fTBjcG00/syjwqtR61lGI24gT/HRm8LugRNkeTDX/ZHajBe8PAExut0QCK/8ZE8ZZUp
	Tcwktkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMg9-0000000CrNX-1DS3;
	Mon, 11 May 2026 09:11:57 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMg5-0000000CrIn-1FZM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:11:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso1968004b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490712; x=1779095512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=SswUwB7fxpm+3rjHMArsayba4+J6x6iwUmc+cuMrMAzhbcyvWuBO1jZbj493hw5S6g
         UiClKqAYS9EHiKeLMrTAJVYsIV04+bTY4tg9vcrwFWASbbWCe+6SXBrC0ZB9PuXv5fyW
         NKs1n/dW6o+kC0ZTMM4VWomVZ8mDNGv8qr+QBj1Ivk+dkOw8e3lq3PhXIgxlghkJ9r7A
         w5v2M+H/pk+DN/+QGBg/5Wi0GawADFWQ0sSZYUViKwEFmARShjC4NBboylz6XjRqPcg1
         HuO4SK7mfZQOCBF5G5oRGzZeYe5gU2T1QYPrFkuda2qS5Z1rvp/z9lImlqQxtS+NGzOp
         IiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490712; x=1779095512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=EeWqKxNUjJd//V5EHxsyTQ6zGRqcZs94cvKRx4dwkab7l2mTlVIWI2iFkLEUwRUoqg
         VnutploSv6/ZYuZUyFeLnNwwYFnK5LwhTnpQld4tTw3MMm7oTpPmdJhgUeoRGR/s1Wxe
         FEmH6W6AzMVFiNTMXsgxY2ZsBU6c6SYTee0CjNz9tePYxbXKUU0nRYfxh9u5ay8FsnQf
         V/uAH25ADFh5mGWbSMj3NXErIdyE/qwa33aLkw4ytuY98ueyNFLEpoZQG3ZGknu7tWN+
         D28pOKaaNN+wKbGqCJUmyvcD/qLBnl0hQ/yNtita0+Vi+VSroy06zLwsoYW1W0Gl9NHK
         ZhRw==
X-Forwarded-Encrypted: i=1; AFNElJ9xvwZBKoizn+Yg47yxYOx4hX7/3XQ2KOeZz93AqKUoaZh+fakOI5xzAQeJJwmGPGZnJtyOyf9epEIWERpUVqn3@lists.infradead.org
X-Gm-Message-State: AOJu0YxKkD9Pig/S+KG/r6h/p7RqCJcVG5ls8NIGsGIc8S3S8Aorko29
	B3r6uz0SQCfsu/E6JmdZg9jmKFK/Pe1xNQyC0i98TiT5/pXuOkBY6lRq
X-Gm-Gg: Acq92OGOZmNx4eaUXEDFdr9ScTFMhprleCHjeX9PFY/5cg3q21FkYY9nnISWXiymxKS
	tYoiHPIZfW0IDi1TWYPtWpvRg9lnw1LfkgsfV3gpxvR9jJH8KGJwIVut1UimnEoqkvRk6fC7F9o
	auGfWBOj/NWbL1c9cNXnM5mEdxS0lEm4qZS1RNOcNMq1kNo6Ql1VMN/TekbcoRje6g0Ya/fpTee
	gFb5bP6imrYp8Z5YI2fk1wwpbio0OEM8hSsYUqPz/idnZC4JE3GM/kCgmRhx5uXERs63dZPzIJ9
	XayxmgZAG6uKGS5RAVfEkCLA0Be0AphsNGHptd7crV4eRbGOq85zDXiRf6kxGL5KKoYOUZQpWa0
	UQ/zCCnqb0LasJGkzMqPkNJPS2fLU/8U6d5kfXIfmoqySSgG/ZICxuq3VpPgD6J1/OSjoZtbQZA
	PP0U89El6K8KHrcJiSZl4CArE=
X-Received: by 2002:a05:6a00:a93:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-83a5bec54f7mr22142513b3a.15.1778490712503;
        Mon, 11 May 2026 02:11:52 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:52 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 11 May 2026 17:09:24 +0800
Message-ID: <20260511090924.269106-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_021153_541233_135D5AE7 
X-CRM114-Status: GOOD (  11.32  )
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

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / post_div1 / post_div2 =
25Mhz / 3 * 90 / 1 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.54.0


