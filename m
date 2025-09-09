Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03668CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWkcAixsHGM19sxUvUtGscd74QmWi7n2SnlzLzrgGQk=; b=ctbfXGytJpLJnzFw4oWmIyjksR
	p1LZEKxjKVwDV+fePGUOCRUXVuvQHzClgeyzJpaWWXi3JAxgukyIkIBhbOSB9o/9YmsCBZOlQhyl6
	DH9s6jaEU+n//xRl9Hqm7IPJT6Su4Jgp7pDoftbuAbo1tDzM83XwQ/qq7fhnPVDawhDiibydP8efb
	czSkIaWoozmvy+19HE1i4Ehmdsm09Gq2v9efctTXnVBWub0batz9tyUCiB9HGYN4/O550q+aEs5Py
	5kj9uUbX5NfSACxTqfrlg6WfFImlSlTkiN7z8ZLSlukcpkTNNykPtum1IFaUM8iz/ZWuEZ9kL2R4n
	ApWsYWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zA-00000008szB-2d5w;
	Tue, 09 Sep 2025 17:18:28 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyRB-00000007Oqz-0rZk;
	Tue, 09 Sep 2025 13:31:10 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32b4c6a2a98so5749230a91.1;
        Tue, 09 Sep 2025 06:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757424668; x=1758029468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWkcAixsHGM19sxUvUtGscd74QmWi7n2SnlzLzrgGQk=;
        b=Ex4Y0GzG3HTX+LVR0NWPpBOaWSiXMEvIqXVEkj7qKpC2PUrWmpPQsuPV0gz6V8THTr
         VX4YpLEorPGN+Zl5rLiZkhTos/AAQw+ZiEgPt6ECwKRaubIj2RlElk6BjdQjkhgel7n2
         4cHJTq3DdtOoEeznGC5cf5bepomEJ6WeKWy1yC61erfDNsawGyH0gqfIpXzlwnMtlsUw
         c2P7hZ3Vt3Sh+yEuUFLMPMiMWrRL4hIPVM5F7blymSKQPLMmOeRi14uh5TTHjWKo1kX7
         Dfew2IviVh5sY+6cYhW3QBdhG9K7k/7uyOjz+zTPWS5w435B8AvarllKeE4Cor9Ap6GS
         T7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424668; x=1758029468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWkcAixsHGM19sxUvUtGscd74QmWi7n2SnlzLzrgGQk=;
        b=CUq+r3h3kF6rMMXsMm8qw1PCw4b+XrurIaWTnOT9pckeuKGwSczMFNvbnIWsF6Rq5Y
         KbNdAnRyzP4HmVxbowlL9G36pLOKB6ASzc/VoVofl5lHBJb8KoN0Nefn7o+l0fESXsFz
         ctHE2HENf9yvHFNNLrUY8+oaVgTrp/VJpakoKtLFXNgTBQKeOJ9j+KtpdG/NLbND9cpU
         Eih9Vv06/8M6PshLn4k+ILrc7LJ5MO3fGHMiF2cnf2U1obHY6u2TeQH7xYFn8A/OFThj
         BIhqREHZlllCGHh1IBbinXLkYtmviOmrp5oNAI7PYgpr9YqKrKZ26jtZ7FBYSH8O+OxH
         HXbg==
X-Forwarded-Encrypted: i=1; AJvYcCU7uQl194kUA+Iitq7N4u6gQax2nTrIxNOjIoU6icKiEzQqGRDoTl7A+vCszczXonWLf5tcyszOaO+YOagHUVU=@lists.infradead.org, AJvYcCUsnHI/7OlCGHTaw/J+GaBtEnCFvRzFEVgO9l732ChWthiEn5EM8zluEXfhZ7hJ/yQviLKv/5iaMUiE@lists.infradead.org, AJvYcCXaomrff5t1lls7MojDhguhPv3kJeNvHDZWgCi9Wwy3M1n+jRb47lNeH4PdO9KwDm8G+ijpkEAkY4b9TtAVGAzR@lists.infradead.org
X-Gm-Message-State: AOJu0YzExqPhWfgrr2jKrsqlpYLUAsKpIgorNJKmOTPU/5LoL3pSiOEa
	6+gqEQ0L/n4JmUswTibw8C5ofbhG6dwQQ4vMXZpjzGumeQss+b8n6t2t
X-Gm-Gg: ASbGncvmLXyvghC0m+hiIBHoD0hNiMH9ehAJbtroj/7HFhDjRUCJvP8D0rMd9zrHXIJ
	yb+dDE1h3YesnGnd4CUk3E7P0fFVgRsU+zIyknpJquuaHOtXapwlf+QO+8OP6GSUWQAuq3Y4P3a
	V+PYDJnruh7zZPjJYBGF0v1/WBC6q2D0Cv5ICmLEKMzKhj6NGQ9gp3/XBRuRpLTnUbhLxhsAJGE
	oujf0nF8OkyoGJJ8ibwTPgx6wNHUqVFMRRiPNI6Jpxkf1ci9CIevetVdhaAtahVFAkH9EQk4PTO
	nMyd3QSgoaLQu5WkrNcbW0qoVqWiORR3Ct1vY3F1LfUQzeiYTktMsK3ZaDUQ00WGql4kBGesKzU
	/NsKT82gMwZVHnDFjVH/pWzGeezxDyKNBC02py9NblShMoBNwrY4=
X-Google-Smtp-Source: AGHT+IHqROdQImdvdEY0U/BqL0neIDZHUA1DGKWu1ZNUro0s3KD1rqjv15uBTzj4q/7BVZR3LI/efA==
X-Received: by 2002:a17:90b:3ec1:b0:327:9b36:87cf with SMTP id 98e67ed59e1d1-32d43fcf16amr16685269a91.30.1757424668244;
        Tue, 09 Sep 2025 06:31:08 -0700 (PDT)
Received: from localhost.localdomain ([240e:3a6:1c4b:13c0:db95:4539:1490:64d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab173060sm810778a91.5.2025.09.09.06.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:31:07 -0700 (PDT)
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
Subject: [PATCH v2 1/4] phy: rockchip: inno-usb2: Add usb2 phy support for RK3368
Date: Tue,  9 Sep 2025 21:29:55 +0800
Message-ID: <20250909132958.26423-2-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250909132958.26423-1-cn.liweihao@gmail.com>
References: <20250909132958.26423-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063109_245520_81A3005E 
X-CRM114-Status: GOOD (  11.90  )
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
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index b0f23690ec..df574337d4 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1847,6 +1847,53 @@ static const struct rockchip_usb2phy_cfg rk3366_phy_cfgs[] = {
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
@@ -2289,6 +2336,7 @@ static const struct of_device_id rockchip_usb2phy_dt_match[] = {
 	{ .compatible = "rockchip,rk3308-usb2phy", .data = &rk3308_phy_cfgs },
 	{ .compatible = "rockchip,rk3328-usb2phy", .data = &rk3328_phy_cfgs },
 	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
+	{ .compatible = "rockchip,rk3368-usb2phy", .data = &rk3368_phy_cfgs },
 	{ .compatible = "rockchip,rk3399-usb2phy", .data = &rk3399_phy_cfgs },
 	{ .compatible = "rockchip,rk3562-usb2phy", .data = &rk3562_phy_cfgs },
 	{ .compatible = "rockchip,rk3568-usb2phy", .data = &rk3568_phy_cfgs },
-- 
2.47.2


