Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54D6C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meQ0Mipo8UgEq53792yFhZe7Xcnc763+mjkb31Obgck=; b=h6BCB2BZ3c+vmYPu6uDICHntuF
	m6CfDg0Is/Co75TD989juiH5LwSX0lwEms/sWQ+rjTM1RUnUxk7hMIGmsS3D6JrxCtvJm6PTta8w/
	eEUfnUqFZMRBuQ3wbRBMN2RcKufXLFv9FcoA+9kjdFS4Y4LFH8OAkIHzUuXaqYygb9ylg/uJ6m616
	eysB3LCeiX5+xTVnjiKAruUHhQVyk8Y6xbuLC05nZHkbY2Rj0mr41RpKVIJR5vpI/55pgx1SW9Yqx
	/SFijzrsOjkur45NMcuJJrrIDZ2QwNk0Sbrm8wtXNjYRWVhjljiRoCGAKMiV2P97im6xJU537O4CK
	vH6VIoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twktG-00000003gw1-1lql;
	Mon, 24 Mar 2025 16:43:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkgu-00000003eUT-458R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:30:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3912baafc58so3657557f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833819; x=1743438619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meQ0Mipo8UgEq53792yFhZe7Xcnc763+mjkb31Obgck=;
        b=V90Fjogagm9h68tffakirr8zcqO9aC0CXw14uSYg3JuapDq5HaFtCURngFtBAgQ0yM
         DLyAVNYWX7sunehaPMU5atS1Yq3T8SR5RPwQD/tGMxcKV0O99Qapn76ligbw3yRDWrwL
         MVGdguBmew1/Iw+q4iAtvDM67b6n5HBbnILl3fkmORxaarpSI1JgnTruOrZHxoJwZeL9
         ee3D3uLqP0CRXUB5tgVr1H9NSOcylOgfGPowzx5j/NNQd869G1/mNWqDmcyDy1HnuvaF
         YgwhrHZCFSaFjBXEShmc+/aRaCmBy/lXkTx6Oql1NPMXWZHHY1baxOXqWQ37/z7lyTEB
         O+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833819; x=1743438619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meQ0Mipo8UgEq53792yFhZe7Xcnc763+mjkb31Obgck=;
        b=qRgDkK0hpxD7nEzpHQuaA7UxhFB2fYLKyB5kkzY9ULXGxg7l2PxPtq3oWqBRS4qCiK
         ZltDrmS9hk8YBLmBTLpmLYfNvSo0A/v9naYQmZEco2iG2BXfv7E5WXZRSfhtH67BzNAG
         QxQARFwqGccOEgtMH8jfFGN96dmW+TJLFBjLvltqoYYYlyy4mfvyBfAgR+QRtoa6KwbZ
         7xV0u7EkyfJmFbW4zdRDgsUpWeG3Z6ZdEvy3821PM/w3EL+f2WUf28VtuolEZXMyJT6G
         uCtTZcaLC1be/rzQVZkqB+nOO/2o/1cEzITKCqHj1ponxeSB/aqkZxPLw6kyEV8BSwIT
         6EMA==
X-Forwarded-Encrypted: i=1; AJvYcCW9KBpqYPij/DmV0Z6wUQVBHlH2JRGRHqhCuay3zRqlcvh7oK/g71KGzETAa7mgYer1ysSJSwI6okrU0yebBHpQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxeNpFRCugnIXWwEXWKhBFpALv+HrLiCtvzoSuouNajwPGF4fmf
	lIqbpblnOBLLUbq7ESycqVuLlVvFYL5xigi7K/cDNDzP4cVYUVwp
X-Gm-Gg: ASbGncvrP5AdsrljVLeNMfbWs470w8QSLnFpGkwVvzQR/n4ZeTPXbQbTFYH0T+RtpuX
	/qZUPsVi+K0JfV9fg2mibxaB9W2+7N011TkZ5wnxl/RDeVv0qdSjtXQ7rMsJMa0FB3F+rtxxUr9
	po3sB65hgt/+vMKX+ezHqh+EG/sY2NVG/LR2ObQyJY2qv6YWJNInxYZw6j1JiUP82M4ek9kEVKD
	VVwo34xYMoTc31pjkdqtrF5WBkgccVwAFxaYy3p4a5Ibq9MF6NuBLOvecMgbbeaumxDAf0I/7v5
	lFpEs/zEvkHH12pzejPOh/R+lWCmDwhVwdxY6WaJhc9Ab6c8yasyJmHdPSlTc8iWBtFloWWeh0f
	2OyaA/lA=
X-Google-Smtp-Source: AGHT+IE66Gqa84UGtwTooRZYvTVucmMfLSU4uitXios1JhaytT2gQ5+HpqGU4z5hPX3SCx18hnX4JQ==
X-Received: by 2002:a5d:47c6:0:b0:399:6d54:25ce with SMTP id ffacd0b85a97d-3997f8f9cc4mr9475035f8f.7.1742833819118;
        Mon, 24 Mar 2025 09:30:19 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:18 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Mon, 24 Mar 2025 12:25:56 -0400
Message-Id: <20250324162556.30972-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093021_013213_F5928677 
X-CRM114-Status: GOOD (  12.26  )
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

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce9f6da1e257..db14e85023a0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1


