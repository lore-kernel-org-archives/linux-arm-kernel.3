Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FD2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1XD9U4StAFSYqOP2eTxiCR4wjRB2kUp7ZaqDyYPEZA=; b=UKlU1apX8Og6H+tRhiAp5DjtUd
	gqDR87yfKlh+bagQsdhJOfJed00OA+7XPhLQM1p2+WupGzJwubLIWsLNGQMiqhwg8gXGD94ndj5fm
	WzgUwBxd2Fw/uG5C0yfrvxiM6+NXevpMWcsl6e8zSjUYvkE55cXuP13jYFK/KyGBPQpxMtZisbSv3
	ffVvjiMIU6zRV4uT6637LW3gYx7/plRVx6lqXKeozrnazJMsuS4UB07fIy4VaytkKMPlj3XPDKT+V
	YYj447YvIs9/CQSDJFMqH+fcQtYM2jyCk9t/RXHCaeIMLQdURBhSlu6g97TfnbhkaLMwddlClhVpo
	TJy5pvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAG2-000000057Dv-1rgM;
	Tue, 07 Jan 2025 14:08:34 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVA9P-000000055XH-0fxK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736258503; x=1767794503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q1XD9U4StAFSYqOP2eTxiCR4wjRB2kUp7ZaqDyYPEZA=;
  b=E/mF9A73rywWT/kcmrR5PxBZTgLFmavqjlovLcgWbh219sSlB+G1zhIn
   AWTDBQy88fo2Bpg5yTsJz67m810ccZ6UFcldKl6QeAewtZlD3suTj/Zi/
   3hH2Z+BE+GT8lGNFJQ71jTCoR0S7qLPQPwfp9CK1c9CqaXYcGSe/j+GtY
   t7d31taC6YzkNCfJOqeLjqiICup2kGqfSBkLzWuLUdrN5Dezq7kS6cdFG
   hEtY7oRkvaC2N/LgCaodvRKjIZgXxPiguBqwAS5Bxdez6UTd7ZeDaOxjG
   6GpZoGpl/ckGFldRpJF2oP5j+kZbhPeKltvIHr3r0/UF7qMhobtOsTig4
   w==;
X-CSE-ConnectionGUID: GfXL6MakQDK+HcvJTisHHg==
X-CSE-MsgGUID: oJX5ki0jSguRNjkjSHYVvA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896228"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:01:42 +0100
X-CheckPoint: {677D33C6-6-1D00F64B-E6C57517}
X-MAIL-CPID: C00BCC96483421507554777F05D4DDA4_3
X-Control-Analysis: str=0001.0A682F1C.677D33C6.0040,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 171B0164B12;
	Tue,  7 Jan 2025 15:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736258497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q1XD9U4StAFSYqOP2eTxiCR4wjRB2kUp7ZaqDyYPEZA=;
	b=gIEQmtsWVR7vCFrnQQem9F222ipijPihSgz8s2jp3qdWw1hpt6PaphqO6yZIXEJtv+JiQu
	/7bU4JlRAs8F6dK+XjQgbJIb+Vpp3XL+is9VjbiK3j+mPEzWfzPrRzDiruTDRnxoUT3+ZY
	k4fLWSvYNakdetzn8VLuZeXuIs0L7q/FcI7F7kpssKssRVXN8LC3vj5wr4SRnlSiTtSFeD
	FcjT9YIN20++Kz/oNk458XKbRP2Y/QPBvizXjc3k+qh8OH4Ij+xYZgQWeV7D/iQ03iu+CB
	PCIgffNc0vbeGXpupO+ZtIeL1oD/wMVmtwGRwXiXFfELVGJxYJ3HPIFRV0FcMg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 4/5] arm64: dts: tqma8xx: Remove GPU TODO
Date: Tue,  7 Jan 2025 15:01:09 +0100
Message-Id: <20250107140110.982215-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060143_499359_B0C2BAFA 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Since commit 6196fe777513b ("arm64: dts: imx8qxp: add GPU nodes") GPUs
are supported.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqma8xx.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xx.dtsi b/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
index 50aa41e3b6d51..58693b774d4c8 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
@@ -75,8 +75,6 @@ partitions {
 	};
 };
 
-/* TODO GPU */
-
 &i2c1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.34.1


