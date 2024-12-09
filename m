Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13B7E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 20:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFk/8lTOXAJBBD0iMswUxwnGCPazYsTsiH7Y9OBU+PA=; b=AXw8EIMwRqEeRwj/rz4uJ8M+0W
	zcCgjLrZpbyakCyTY5HlqQK2eOBUB4rmMxEJ28F33LDmwLWq+YkWZMI8t2EclycbrPhnq3SoPpVER
	6th7kaY/LUQ56q1UC6IUQfKV14oFQbPQoLdJOn0deapsDQ/9otm8gOHqwUMuJmCSCMkO/6We/jbFG
	mqzGX9G2a2MTAQi4wjjP8CZTrXT800UFGQgPnGRFcVqQaGiF2VlssU+JcV7f5LHEmBY6LNVP0xsx6
	5ceSTZzUDTxmHv7WZZ+ibAr5zxFHy7fuxPME17EaUcjpjE3mxLZgLfSRPuKTj98p/NgfH2m8iLqNB
	J97weUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKkaq-00000009CZN-2opr;
	Mon, 09 Dec 2024 20:43:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKkYq-00000009CNY-02Pq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 20:40:57 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ef83c68b47so1755656a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 12:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733776855; x=1734381655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFk/8lTOXAJBBD0iMswUxwnGCPazYsTsiH7Y9OBU+PA=;
        b=i47N19v58PEbV3hdb3eZQthxeezeHZzulJAVB0yIfcbFQn1kDpqvGbMjcyTKf28ZG4
         HPc/InDHGkoLLOehMeWDIoHla5+Rnx5QWltT07eI5Nbt97idL8sVuAJCkI+NzYdGhx5B
         8vKewpW5l+5nW7JXUFxR+9Xl1mj+/rVgIYgjrdKtaJoBu8kOGdp9HSNg9hM7tAFo3mnk
         FWSHu+0sJ6mWlMqurZAgBv4rxj8r7e76usvnegDzDG6s0e+PPpG8MZzVWnBQycOTDp0A
         /5YQmOG1KXs+PT+Crej41RMnxIOwcp3zobCJDB+MYFAvU6cQOsI9KdXPNpUs/0pFC8sV
         nc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733776855; x=1734381655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFk/8lTOXAJBBD0iMswUxwnGCPazYsTsiH7Y9OBU+PA=;
        b=T6dw/at9b158DQ9Y5BSCbiE5gYvmZPgsxx5XQDBLL6iKHcM5RUDf19kHc10tkCg5C4
         tUTr9zJQf7GkHyVYw80iUSe4iuhy+VG342EJFwSj48DYV647d4OmSPrvYYKeY6D1y6oG
         ASGxs1vOUnMO+eBgfwdSgbU0nHxbH2Gcn46UADLbxUn/939OXzMH881SDLPvenIgx2Tg
         RvlHq6ELYYA4tSM4n0mnapa2te9uTvKrF9633Y6gQKxC1dywiqrXKd8elaVr1H6KzMxo
         c5BGzxBdQFS2RT/p3sMly1/BkY5uTSIaqUnj1ZeGpDpmgZynBHJJvEVBgQwMZlmi54bU
         kzGg==
X-Forwarded-Encrypted: i=1; AJvYcCXt84UYyK4zjHAFUWZHCBU5cGv6blfmViJopK5J8/V4doQxXxDPi0xESBHRV9ShlBz7hepLH3ITy1Qz94uN880X@lists.infradead.org
X-Gm-Message-State: AOJu0Yw56rnTZwMwSMVpiw2aUo2c0fo62A3qHbCjeE/p89jv2GDrjUAq
	cDPsP9uMgAE5lm+eguJU0kcXaioGrWoU18X5KYa63nto4WblukV4
X-Gm-Gg: ASbGncvwSjlsjE8l3BDgcIxSwA0U9VGVTosF2qO1RW5/6aS3Ujy1JPp1TD0XoirBTxT
	krpgXk5uNWr/HF9NVNUq6sEw9DdjGUHqpcjj2SF39UYbBkmkaN8jswsQsL0gyaVoku2erpEZfma
	fHajaDjomesRpPxlnlmCl62xm7Fwo4M4Zy/p7kt1LAmdy2Sy1QCQtrPOJysKuo5id+z5xCX0Uku
	ZBdGmYw2r8B9sUjswFcMJLyvZxodwGfa2PXx/9ey4riABgh5bDcOgRjYXUYK20=
X-Google-Smtp-Source: AGHT+IGkseJIUwCnXZApvQxM0FacDoY5qnz7kx/Zk4ZEw+I0M4KgH3VzNxAAY/RYu9/pFD3vDsUdGg==
X-Received: by 2002:a17:90b:1f85:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-2efcf10d3fdmr2974170a91.8.1733776854833;
        Mon, 09 Dec 2024 12:40:54 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d7c4:c4a9:e35:ccbf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd5207528csm1707219a12.36.2024.12.09.12.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 12:40:54 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] arm64: dts: imx8mm-phg: Add LVDS compatible string
Date: Mon,  9 Dec 2024 17:40:03 -0300
Message-Id: <20241209204003.1295503-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209204003.1295503-1-festevam@gmail.com>
References: <20241209204003.1295503-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_124056_045909_5E08D1C1 
X-CRM114-Status: GOOD (  11.80  )
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

From: Fabio Estevam <festevam@denx.de>

The imx8mm-phg board has an AUO G084SN05 V9 8.4" 800x600 LVDS panel.

Improve the devicetree description by passing the LVDS compatible
string to fix the following dt-schema warning:

imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of
['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05',
'chunghwa,claa070wp03xg','edt,etml0700z9ndha', 'hannstar,hsd101pww2',
'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
index 75bbedc6164c..a134b1833649 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
@@ -82,7 +82,7 @@ reg_usdhc2_vmmc: regulator-vmmc {
 	};
 
 	panel {
-		compatible = "panel-lvds";
+		compatible = "auo,g084sn05", "panel-lvds";
 		width-mm = <170>;
 		height-mm = <28>;
 		data-mapping = "jeida-18";
-- 
2.34.1


