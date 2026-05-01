Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C6CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 09:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8cBbebvkgmNYiigpFW0uBFgVevOeLSPr7Jmw5f7oUM=; b=4jVUurulnAWxZr7Ajf/yrwdyoL
	w5N6tdc2L0X7koT3+UtOfqw0o8CHyt+354NYzNoUOFOK1rv8gI0FADdo3ziQySgU4T+GBdx0F/HLn
	FLvBsuC91LQq1zjZ42jgKLZdMCI6z1NpnuP4FyE2pfL5JEXENOoVaoJ7aIhAJDiYrq1tvxPNCJ16K
	P00HZkoSI8jxN6COaBGFuBtOLxClBCGkpUkgTeFfCU/LjoJdaN1ThCR9lOyFEXHkAeSlMRaSRUwIS
	Ofo/X7YyDmmHjC/BHUCpyYbDNrEG/YucTxFNHxx8N+NNirFbpV2OzvW6FXT8IOxULzpMcU4ub1PFJ
	JVTBcUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIkd6-00000006ZOf-498V;
	Fri, 01 May 2026 09:57:52 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIkd4-00000006ZMt-155U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 09:57:51 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c7971d0d97dso1028184a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 02:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629469; x=1778234269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8cBbebvkgmNYiigpFW0uBFgVevOeLSPr7Jmw5f7oUM=;
        b=RUJ/hKgSt2aGIf69gsG16ghem2Sxq1mp0w6d2SUJMPyQsP5qUA0eauATGgYlTtmntU
         wgUa7/NGKxftNKzgpRYdv02+I4TORS+VPutF7us9HGFqKTIQvVC7ozodrQo+UzTN4UWq
         pTeYH4F8JbhvtSFoWXtji6xgyBBwSdL9bxy5Z/2LRuwNpOZjzeB0hA29ZnG3Vns0wygY
         UFnsDFiLxKF+ogDylqfOfKcbUxdq+l4+6H5oFugvFcF8MH1hje7NyuhwfVg6RIEqViId
         IZnCU8qFa6JAl8P6g2ZKU2+evSstLYEtYn1QyLRNQ0Qh8LdBW8nALfeUvi0TMXUxEQ6n
         Delg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629469; x=1778234269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8cBbebvkgmNYiigpFW0uBFgVevOeLSPr7Jmw5f7oUM=;
        b=fNGCtgEORfTUpvTbS2Jejw5Fvu+DNf6PZavpddKO5IHzfYLLnjM91hQNJoPtbANyyJ
         2wnN7s9z0mZE7WOYwOGiCuyikmST7/c+HrhRoiioxd5rneC1/QMueJc0ZFy7Vhzb1FdK
         GGH6GRPBfdzQlcc+ihv/1nMC+uhLBWGXVn7DB0gvtKUqheheV7spIvOTAaiKpAx4+a+2
         h7uAR4Y9IYqnEUXBb7GUvDqy4Hq60cRMg5/ocB7DwbPIDxCyrNyH7gTOyjbT4gt9RD2o
         hkFgtyH55ebCnrp8fD71HaoNScobMPj7eb/0zousWLqEKzD5LnYP4tud0NQgi0OgCOFQ
         39JA==
X-Forwarded-Encrypted: i=1; AFNElJ+rAakwRTdlSK2SKx6k4IwINU7FTFiLA+eEtv9D/enZkFgJH6wRTVvMKb8uhWU+HlLWOxJDiDVkGax3C9iR8VZK@lists.infradead.org
X-Gm-Message-State: AOJu0YyQijRFcWG2A0CPoN47+dSd5kXNULQKcovqMPxtm6VS2OYtkRqC
	egQgl50cqCafFJsn2W7ZuC1RRuM68i/UV4q4E+1y0a9DkEG8lYlCbIls
X-Gm-Gg: AeBDieszTdVTm+UG8OhKAOVzCMlDUL3grwpJ1Cg7s5QLux/G2DsS4ncbEqb3FoRnyC5
	Nm3Cdcg3Oe2GyM3Po5FoeW6vdhElY3vjFuihrNE1slwOGK5AEMmuETCW04kxrlGaPU3FHGYrQXS
	3ablpz5I5NHWVRY9V5TCiZQePUtuEIW2MZpshdbX9Vs29BA/7eIHM7HQrbO+OnVTf5sxQBZHeuK
	abxmRCDTVwvgiGwkF8z52IBqV0BYt0CJgMcHMKu7otoLiVsrdbkVC2GMVkd9+zWqL/AQMxnrE1G
	sdACENeczEwy2qCo5Qr/Sh8hx+LVV//9AYdlkXo5gnMEVytLZzNWBz8bGuFjsHHZNnVymflU8lk
	r9KETLQ8pQCgTHyGU1IRrSuNoQY2+0RvTikjnDODVxELaQC/iU6w50xe0FFmn4YPADBbCidtAlt
	YWiPPY/OsRKCXfPQ==
X-Received: by 2002:a05:6a20:258e:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3a3cf8d8f18mr8009215637.48.1777629469654;
        Fri, 01 May 2026 02:57:49 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:49 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Fri,  1 May 2026 17:54:33 +0800
Message-ID: <20260501095433.1609309-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501095433.1609309-1-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_025750_296252_CD37EE73 
X-CRM114-Status: GOOD (  11.92  )
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

for the detail, please check PATCH 2/4.

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


