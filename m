Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B065ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdyjQVerHnCtQC9pVNT1b72KD6sF3r9Hbrbb+1r/mbI=; b=LgFo7HVaWXVYJnb5WPSxLDKHmR
	zKRjycG/6iaLzPLco5WdjGtQ4nzF6Aic2WUEXB2v4z3lMo8ud8nth/g9abIHZELe40KROVTrr9Pn9
	N6LHm/q1x4PATNBRpSb0O6dsH1pgBASlAAWLHfwFDxeNiCXE6OPUTUbHVMYhmWyEsGnmAdXCrBzTl
	KVq476NfQjhhZZFCGu17KH7hj1li5H7aVzrQmZpKb2qzLf2EyyzERlXr66I4Mn8SM7d4lC6w5d7Kp
	uqS3N8ixfIScfgJE02w7o9WaiKKoSS0wFRmLK6qpNK3mxZItrPjwO4j7DUPMxoP0FjBN0SiP8/INI
	Ki+HNZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zC-00000008t3f-3Ouq;
	Tue, 09 Sep 2025 17:18:30 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyRI-00000007OtO-2wwH;
	Tue, 09 Sep 2025 13:31:17 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77238a3101fso3992568b3a.0;
        Tue, 09 Sep 2025 06:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757424676; x=1758029476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdyjQVerHnCtQC9pVNT1b72KD6sF3r9Hbrbb+1r/mbI=;
        b=g6Qjzb81qEr40TZyN2I7XpvXlWTjJN43zaWG1g/MX5PvdYkO2Hak3qWzhH4gsqGzLo
         cdjEVehmArAGyeWcZcqE3dzPnt4rMtDzwXvBgXm/tAE7DAqj4iNcv9XK/fzseXY4JTbr
         8vqJ4MKpOovXeuOTmvqukQgkXLiHvtuiIO6ZgQ+NWzW/CCu6wcvCuvfPdtWm5r4+86Yt
         vntNSGJOQ9P+2eyqNwsFvBUQVYV4e68iJhzmvAWq7FEdV2vh9HRaCNXu8W15ZZfTewnI
         977lKN2fDNmXCx7zRM949In4Yyxf0Jem4mKiTQ44xWMscEGo0k79DJdMEcQO70cKmtNH
         swrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424676; x=1758029476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdyjQVerHnCtQC9pVNT1b72KD6sF3r9Hbrbb+1r/mbI=;
        b=J2Kkdql5Q4WWBKEZXHC3OoJsZL2Q0u7zcQKmyoiaQz1CPwppCcENHkh5RLeiLHzT4G
         lt6MHYnjxcKOuoC4GMbWywxZqVWr09j0v4wC8gEajnmBnL0WZdBLnUxaENCANnpPQ/15
         EOUvjrEP7w3yEYL+1+oC/shJu1W9vebVjG/D6sANXDQagWzQH3sjoLpjXXm7HFILqxbE
         n7I5rAiUxEScOfNSjO/f3Wz/y/cmmXkJx4Cq6mnWrE2Dg64NDbbnxD06Dk05+VHDTE8u
         6owv4AT/uAqSto8M67f8n/nqRr6wwRllDZXGbrk8psg6CxGx4SuVDEo8EinA3lp+kwf/
         MWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV67ebb7rSSzL9MjPHk4G+nplm58GXZQFp87DrtIMUbScfa12CS2tU6/2MPNOkcs3OyiakQdb3X7V4F@lists.infradead.org, AJvYcCW2ZyUD2JeqipDNH4aIIvjtZNsbChPaYnPIPQ9RxQWwXhoa4Jqn588e2dn6rWCOw5OFAdqsFdCWGsTdbP0KxaAG@lists.infradead.org, AJvYcCWlAPWCrNvArwMzD7IXqyOkfZAuceLxLIlYwDcw0wv3CYbyBvhNBWoWvDoC7PAf2u0eYVXi//680WFfrWXcyU0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt4FLOciyWyGiDiaMZv82ZtsGK1hT7eAt97OndfwEsTU/nHaZa
	6sc/SGZa7E8af9mxab/vTf2h2wj2+R8gqZjgDBLtKJiOk79GxIaD4QCu
X-Gm-Gg: ASbGnctDP/wjWBWub5McNgfGIvNO3/apil6FmIGMxwzDO4E+6ZQsi4Gl8btwsL2mCDo
	zde50WquOCpQ5ot1ekrFx2Nv7TUjr5MFqdExPevko514Wi7rIsyg2M2mx7rx48Nrn/ucuPIBsaK
	DSNno1tjwQ1LnTp1m3uMhalICjm7s41SzI8jyklcNevNKwHpUag5pZda28gu4Kr4mrSv1Xr9Yak
	7FTz+TCyrZQKBM5XJxbl0k+bPYS55k4JgS0rQ73xpt2H4Hta/A/HUG+6pvOiQDMn54eFIi2jVuw
	58h9QHgZt6CQt0dcfk74keMpEXxUZPwVtXlishzS7641s1idW4qko6ewBLLHopPGkcUP3krJ6XF
	Cbmeb6wZtkEXG+qPy7tEG7EV5ZqId4ZLkuHYTen+i
X-Google-Smtp-Source: AGHT+IHwBbZsks9DdQ6XHABej9H6sI60c64zySW2Wkkud1SiiDf3inSmEJ4jwNop9RIJz+LR1AwSRQ==
X-Received: by 2002:a05:6a20:734a:b0:24c:1f78:1811 with SMTP id adf61e73a8af0-25343c5f206mr15647342637.37.1757424675720;
        Tue, 09 Sep 2025 06:31:15 -0700 (PDT)
Received: from localhost.localdomain ([240e:3a6:1c4b:13c0:db95:4539:1490:64d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab173060sm810778a91.5.2025.09.09.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:31:15 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: rockchip: Add USB2.0 PHY for RK3368
Date: Tue,  9 Sep 2025 21:29:56 +0800
Message-ID: <20250909132958.26423-3-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250909132958.26423-1-cn.liweihao@gmail.com>
References: <20250909132958.26423-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063116_746149_41E5C390 
X-CRM114-Status: GOOD (  10.14  )
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

RK3368 has one USB2.0 PHY with two ports, This adds device tree node for
it.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 1b21787269..b09e431a64 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -766,11 +766,40 @@ cru: clock-controller@ff760000 {
 	grf: syscon@ff770000 {
 		compatible = "rockchip,rk3368-grf", "syscon", "simple-mfd";
 		reg = <0x0 0xff770000 0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
 		io_domains: io-domains {
 			compatible = "rockchip,rk3368-io-voltage-domain";
 			status = "disabled";
 		};
+
+		u2phy: usb2-phy@700 {
+			compatible = "rockchip,rk3368-usb2phy";
+			reg = <0x700 0x2c>;
+			clocks = <&cru SCLK_OTGPHY0>;
+			clock-names = "phyclk";
+			clock-output-names = "usb480m_phy";
+			#clock-cells = <0>;
+			status = "disabled";
+
+			u2phy_otg: otg-port {
+				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "otg-bvalid", "otg-id",
+						  "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			u2phy_host: host-port {
+				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
 	};
 
 	wdt: watchdog@ff800000 {
-- 
2.47.2


