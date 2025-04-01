Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7192C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kITiRQQrnD33DOiE+C+JBAjD6rrVk5TPx/ro5x/mJl0=; b=hoKKyFCb01atHdspfBEjXyUmmU
	zCqSyN/uDtLIhGmnf5uTCBabQr5Bjj33m3JFn0MtZjNxJggsm2Zk0cm4sczUzULKCKp9p/8FWu3x1
	DI8tFOojpwQw4O9bvY6LxqLmwF5aOdNb0NnnwUBpNSaNifVt67MQwnXkMYviJmeBkmEZCNVFZcEiv
	d76dVo1OxhKnyNACsAAO31Zn9KAmiS4Tgmwp6fi3nTovVwizaTBJQXk1Gpi7ub6bdKx+xuQmj0BPW
	cmWWmrnF/osQSgYYUYCK83pmjA5WyALl3LNLyEkNpRaj0F6QE9LRf88HtmP6RQZSlcIGOwWtPoX48
	aHlaX61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tze7i-00000003oX5-05Un;
	Tue, 01 Apr 2025 16:05:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdvE-00000003mYf-20VZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:53:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so41410035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522783; x=1744127583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kITiRQQrnD33DOiE+C+JBAjD6rrVk5TPx/ro5x/mJl0=;
        b=hucdSA1cWWn1dHCG/Tr4J0rxwUKd++Tx9Py+tIjY/Nd5HCL4ju1tMfeyW1R6H/QQ/m
         khvYXMUZOYziSy7sbGelTUtbwoYZYv0WgKX9tIJOA/9DarT1qdy88wQ7TN300Ecvp3uk
         q47Ys853vSUydq7kIIJKyx03MnrxMacORuQK0QaK7aBB01vp1yx44fEpnl39HYznAQbO
         vNCmOPBrCp+bPsGzL8kCRaaehUdWWr/h0gd0CzA+0uDzgEaSIIaQUb1o6adhr9+35Nq7
         sNKtHoVBqk/S8152TtKTaFH6Rq1JBF6PsuFfJzfmtvixOrZSK/7UVEWuNLKEROyI7peF
         /jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522783; x=1744127583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kITiRQQrnD33DOiE+C+JBAjD6rrVk5TPx/ro5x/mJl0=;
        b=Ydlu8bvIsXFilCNtzJ6bvkKopUm1uBA0mwJrG86cMhdyr8c7nr8W3ASgU074EEWb14
         BQkyU4SCChW6JoqqGPPb8YM5+sah8A7CXdMRlafPKXxpL2gqO76fgw2+VgoZFwdlfeMp
         YuWqyTTdLs7S7J2FSPqri8N5F+eBmlQn7LOSGmwy6G4WL54Ngh1ZeGl10AnXfymKsH26
         IDBQvmOfqfP2A1E99u167KpH2nOFY6k5n3NXkTp+qVd2TzVNkgp1usOksSw6hbEHanFo
         X0eTY13fbVoHvnDUYiJwzssUBfawdzMiaRkqGaM5Np1cw3ECNOH3YhDmltQ2LY6k2F/T
         Teww==
X-Forwarded-Encrypted: i=1; AJvYcCUYTZHPOdqR5wREDS2eGug02yyuarVsMPjCu6vSI7R2kqv6v4J0DxslXYN28fb7rxYrP9Q+KfDmVTGwcX3GiX3g@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2d0R8v8O8OSiGHFxih3PhFnPlb6kKWi5miA5pcPiJD84xl0oP
	N7Ugs8zmu4MvUzg/weEUyKuPbuIuk35rjZPv0d9tpxNz7ziux+k6
X-Gm-Gg: ASbGncvFPB4QbFlYiHs14WlLD2lSPpHfEQeHpvcaMXUmQiTlxYfYmtmTzjE3ARzXVxe
	J6+PJzbpvj+UvOmHGlWsUF/1Ac4xkY2FLlMYWc8hlvHHnytwOGzlXSTRENy78gLBBmY2pmTtZe+
	LYqWYNDA5WAh1HuV4vrWhnjs4qR2044jgQFvUghdC51Iln47lDTHyg4uS9wYt2LzA+6OHzT9RvM
	ci3+WSjgZPhunWtjzfSjymoyTXf+NFecAdw9PJePpqc2+L9gQTB06wh8xJWFcFKwo9iRclxu74H
	Qj8L+WWB9gr6hy8uxaoLiMk74IfXgdG8OK8AWHzBaupVYcm/u9yJUnziCtd9qAm9ngpWshgCIpV
	SqmMo6dY=
X-Google-Smtp-Source: AGHT+IE+beBF8OgJ1mJr6OkCFfzKqGsQqpmFHMqJYTzDl+77IV2PROx2yo8oGc/N6za9BEbNxq9Krw==
X-Received: by 2002:a05:600c:4e12:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43db628c48bmr110750555e9.21.1743522782395;
        Tue, 01 Apr 2025 08:53:02 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66363fsm14938762f8f.36.2025.04.01.08.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:53:02 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8qxp: shrink dsp reserved memory
Date: Tue,  1 Apr 2025 11:52:44 -0400
Message-Id: <20250401155244.46239-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_085304_515827_BF8F6305 
X-CRM114-Status: GOOD (  12.56  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Shrink the size of the memory reserved for the dsp to half of its original
size to avoid an overlap with the 'dsp_vdev0vring0' memory region. 16MB of
reserved memory should be enough anyways.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05138326f0a5..a65c5a2c4a81 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -185,7 +185,7 @@ decoder_rpc: decoder-rpc@92000000 {
 		};
 
 		dsp_reserved: dsp@92400000 {
-			reg = <0 0x92400000 0 0x2000000>;
+			reg = <0 0x92400000 0 0x1000000>;
 			no-map;
 			status = "disabled";
 		};
-- 
2.34.1


