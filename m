Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C62CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zupGbMwuSB5pJigRGD6irptM+15GY/4lbepUjeraZg=; b=z3UtaPuph1dhcQTVaTsf09yWCq
	tYcZ1K4lRzY7UqzNIMsFknn52uwkoDt5FM/h4zoQPYcWDSgrC+jb+9OJ2j2Ny+m0Mj/sfGs15GZXl
	Vs8wTZxaaTLT/oJKYTA8OIAPnqkpUxpr0tiytSL5QSz/W446+e4bEz0kIiK+7H+kUZgRYsA3kKj0q
	FzOZyFi+HlHEf015gKwtyAG1tMVkbjVa25ajL7sPWBcwOuEhSA7SwJ3kqmKAPEnamk1zd/c7daHqE
	K5ldYW68i38+V6r1qAmmrGs7mbBFl6ryECAfi2ay8zettMgPBz+MXCCO7m55eY0CaEJXQLXy9nt2E
	nLwb1ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZN7-000000038Xc-1w6y;
	Fri, 05 Sep 2025 16:33:09 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVxe-00000001oLX-1Fgl;
	Fri, 05 Sep 2025 12:54:39 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1900291b3a.1;
        Fri, 05 Sep 2025 05:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757076877; x=1757681677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zupGbMwuSB5pJigRGD6irptM+15GY/4lbepUjeraZg=;
        b=JFz4S+HEzjINy5asTxorKntNI8vCblA8fM6OA6YCLipvcLlcxAaHGZJzshyvyAAnq6
         lyKFtSMPNS1IhYQ1gECGcayUhqako5iF60BOnJsrixekjf9V+ulf2mCayGm3OYFgJS7u
         IlVGV5DGPsRiKo3kct6N6Uw4U5pBu7vJPcN3sSWYHISlDmUYMpKomGlUqLoxPiDu1crK
         NPejjkKQb9zb8dewGbA52LzSniN6zPzCGwyXo+g49Beu+KDffHybgCfT3XtOb30s9wTc
         ndIzfLGVM4nAupvS0uFSkWAPvdVooXSqK36qBYEH0bPx4gmWW73X9gzKyZu9skNzn2Dh
         XnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076877; x=1757681677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zupGbMwuSB5pJigRGD6irptM+15GY/4lbepUjeraZg=;
        b=JTrQwcYK0lcRz8DdHL7J4pBKfzGPs2mKxtpNl0PfsBiCK8eDfGiNn/FGS+RQL7gP12
         ygPnJZ3zXDykZ4tbqdU3eZUEEqdXp8uQtaehj3Npa0L1otG4KjzQi8fqHyrpm5SLJvRF
         oJzFp67KKN+r3yBFDy2muQPxRbnNYO+WAiA82zLDw3xZntGSPDSOFYAeCJ+r0o/PRaDR
         TC/ZoW2pUVupONEtKVrMF0kmb6aNfO8Q3kbvYQamMUxnzwOGWODGR6Bf39qb3oZhQqWJ
         uTalkegGRas1Tq/YKFlp+jrqmxNn1VyZSLh7Ifxc6/Hlf451P8pw+3MnyqzgVZiNbYKb
         QZmA==
X-Forwarded-Encrypted: i=1; AJvYcCUaPjVtVtP8AWrYhcMq+9C1TiUcjbKHwBoUoMfmNC8ACBYcnMd9DMMRroTKNCDSFU7lMc1FFg7LFDUiRDwVYaQ=@lists.infradead.org, AJvYcCW8HSpwF2/4bLz7GoI/09S9Suc/MH9PN+dQzn9uzhjDNhnYjG1f5xiL01A5vssFXZpaI3Nkelg1pK6O5EGpXxDS@lists.infradead.org, AJvYcCWqbkcTTvs/7mjdForUErr8ZvcBgEBEgEliSX87oBFI8wZz5L+dPI3zEOfQbaBrT3mkp9m4aRRy93p5@lists.infradead.org
X-Gm-Message-State: AOJu0YwsHv+Khf4NfCwye5ZeF2ClJ4Otvmmh+iXeHVVZysHX2HIdkG62
	r8UkWUTPn1mAa0PjTmdUcvJKvs/w0MnR9azBelkogvF9vCQ9MzATya7s
X-Gm-Gg: ASbGncvSEuS0n4/BNd4IufeqzE5YuA9qEDchIUhwbHMSBOlFEcjm3j3DiIU1B6tuErA
	kD8XkJZowTtpoAOz8z8XyLhLvDelRfbwma2G5/1JiR80L/Z0Y2UOc5cznvr/tUfkvsg237EpUm3
	1Cfs8gePTXj1F/c7RWxCRHvkz4Nr/4hwHC8bFsaL1G+Q7HI9wDyV9fJ0qyVporweKp9hvisDqpj
	xqiP2cceeK00d1ZXI4Btx9v5dNSTjUglXHPxYMcsTQTDwCq/FYNjz/6ItNrvPRVOSIGGYaK8JJ7
	9jiz8BahvCULFmvawTwYWaXg1X0aBT917vw7qUZu6cUXS1js4kZkw8NhLxP8XRo5uI9cv9GbLY4
	KFCgtqgqfCeU=
X-Google-Smtp-Source: AGHT+IHz8ZpqtG/43s7cNTW4AIO3toc8lazJSE325RJNj8fa1X+mR1KxOA03A5DcboEutvT3Z2i+sA==
X-Received: by 2002:a05:6a20:5d9c:b0:24a:8315:7ed with SMTP id adf61e73a8af0-24e83e26e68mr3563566637.17.1757076877333;
        Fri, 05 Sep 2025 05:54:37 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fb98f9f6asm4992305a12.8.2025.09.05.05.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 05:54:36 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 1/4] phy: rockchip: inno-usb2: Add usb2 phy support for RK3368
Date: Fri,  5 Sep 2025 20:53:14 +0800
Message-ID: <20250905125318.7956-2-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905125318.7956-1-cn.liweihao@gmail.com>
References: <20250905125318.7956-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_055438_339120_183A091B 
X-CRM114-Status: GOOD (  11.30  )
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

RK3368 has one USB2.0 PHY with two ports. This adds device specific data
for it. Device specific data get form rockchip downstream source [1].

[1] https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/phy/rockchip/phy-rockchip-inno-usb2.c#L2805

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index b0f23690ec..c6c575bce9 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1847,6 +1847,54 @@ static const struct rockchip_usb2phy_cfg rk3366_phy_cfgs[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_usb2phy_cfg rk3368_phy_cfgs[] = {
+	{
+		.reg = 0x700,
+		.num_ports	= 2,
+		.clkout_ctl	= { 0x0724, 15, 15, 1, 0 },
+		.port_cfgs	= {
+			[USB2PHY_PORT_OTG] = {
+				.phy_sus	= { 0x0700, 8, 0, 0, 0x1d1 },
+				.bvalid_det_en	= { 0x0680, 3, 3, 0, 1 },
+				.bvalid_det_st	= { 0x0690, 3, 3, 0, 1 },
+				.bvalid_det_clr = { 0x06a0, 3, 3, 0, 1 },
+				.idfall_det_en	= { 0x0680, 6, 6, 0, 1 },
+				.idfall_det_st	= { 0x0690, 6, 6, 0, 1 },
+				.idfall_det_clr	= { 0x06a0, 6, 6, 0, 1 },
+				.idrise_det_en	= { 0x0680, 5, 5, 0, 1 },
+				.idrise_det_st	= { 0x0690, 5, 5, 0, 1 },
+				.idrise_det_clr	= { 0x06a0, 5, 5, 0, 1 },
+				.ls_det_en	= { 0x0680, 2, 2, 0, 1 },
+				.ls_det_st	= { 0x0690, 2, 2, 0, 1 },
+				.ls_det_clr	= { 0x06a0, 2, 2, 0, 1 },
+				.utmi_bvalid	= { 0x04bc, 23, 23, 0, 1 },
+				.utmi_id	= { 0x04bc, 26, 26, 0, 1 },
+				.utmi_ls	= { 0x04bc, 25, 24, 0, 1 },
+				.ls_det_en	= { 0x079c, 15, 15, 1, 0 },
+			},
+			[USB2PHY_PORT_HOST] = {
+				.phy_sus	= { 0x0728, 8, 0, 0, 0x1d1 },
+				.ls_det_en	= { 0x0680, 4, 4, 0, 1 },
+				.ls_det_st	= { 0x0690, 4, 4, 0, 1 },
+				.ls_det_clr	= { 0x06a0, 4, 4, 0, 1 }
+			}
+		},
+		.chg_det = {
+			.opmode		= { 0x0700, 8, 0, 0, 0x1d7 },
+			.cp_det		= { 0x04b8, 30, 30, 0, 1 },
+			.dcp_det	= { 0x04b8, 29, 29, 0, 1 },
+			.dp_det		= { 0x04b8, 31, 31, 0, 1 },
+			.idm_sink_en	= { 0x0718, 8, 8, 0, 1 },
+			.idp_sink_en	= { 0x0718, 7, 7, 0, 1 },
+			.idp_src_en	= { 0x0718, 9, 9, 0, 1 },
+			.rdm_pdwn_en	= { 0x0718, 10, 10, 0, 1 },
+			.vdm_src_en	= { 0x0718, 12, 12, 0, 1 },
+			.vdp_src_en	= { 0x0718, 11, 11, 0, 1 },
+		},
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_usb2phy_cfg rk3399_phy_cfgs[] = {
 	{
 		.reg		= 0xe450,
@@ -2289,6 +2337,7 @@ static const struct of_device_id rockchip_usb2phy_dt_match[] = {
 	{ .compatible = "rockchip,rk3308-usb2phy", .data = &rk3308_phy_cfgs },
 	{ .compatible = "rockchip,rk3328-usb2phy", .data = &rk3328_phy_cfgs },
 	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
+	{ .compatible = "rockchip,rk3368-usb2phy", .data = &rk3368_phy_cfgs },
 	{ .compatible = "rockchip,rk3399-usb2phy", .data = &rk3399_phy_cfgs },
 	{ .compatible = "rockchip,rk3562-usb2phy", .data = &rk3562_phy_cfgs },
 	{ .compatible = "rockchip,rk3568-usb2phy", .data = &rk3568_phy_cfgs },
-- 
2.39.5


