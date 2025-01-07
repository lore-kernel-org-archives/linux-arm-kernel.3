Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEC6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bec8u+1NcRe5MOhOgFsUDfbyCQeJhWQLLR/Hj+tPPhY=; b=ijxxbXn6bzQHFakEY7MdH+hxbh
	fTMsNVQxytJhVpAVLE9NadW0ExSBv1tiU8x27zW7kreJcslaV66XmCMNY1IPouwOYTtyRlSrFGWDo
	WmYF2RCzRMuY/bJK3wYrG7Wn9OM2aIKdlouu1b4yNaCanAoX/dfPSST4+n/EMjacS32sBfVWcTPyn
	wCuegcicFwQrEzEgzIWSCUes/SOufgLe0p8ERhHAq4Bp/eACczGr8JqmX6CwQ7GCuEH1l/UsjL6wK
	FaIh1816Rf4OVLjkdxucmDJIKvc08eSy1UtKb+alZEcn/4WmC2vmDyS2P/sJ16cawjUGxmTtJauQa
	YMZhGCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVADg-000000056eM-4BGo;
	Tue, 07 Jan 2025 14:06:08 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVA9D-000000055VA-3vvE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736258492; x=1767794492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bec8u+1NcRe5MOhOgFsUDfbyCQeJhWQLLR/Hj+tPPhY=;
  b=MVgegVojW1pnvpNPv3KmDviiEgd1JDgpM4gT/35YgK4QL0m5C2toubeI
   64OcftWcT8CCrAMrjdv+XJZpynuvO7eHKuPOxOL9VcBMIPBS+3cGeG9Um
   MTNzabwTOTXHwkhvXff5QoZMoHYmOrKuWrEZ4qHvcWdpFxCUku80l3ReV
   rcBQ7uKy8o6A4icDB2Ttt8Qw62VY023lc1ciykPs+pxyMmmZHA71XFG6V
   8vTXge6bowvaGw9/4E8Xo+UXNdIlRjXWCNE1k2kBfpeEd16SBPXsDkuV5
   D713NwpVefPxN1QmW6BS/dEg+cNwooyb+XEAbpPDZgBhV2I27v9ORJcgD
   w==;
X-CSE-ConnectionGUID: OlD5Y6KiTVSl3Sim39BQkQ==
X-CSE-MsgGUID: UnoUyx6LQcmtncIo8MSlSQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896219"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:01:31 +0100
X-CheckPoint: {677D33BB-13-1CE016C0-E589DA3E}
X-MAIL-CPID: DF236D25597C7ACC707A8E20B831674A_1
X-Control-Analysis: str=0001.0A682F28.677D33BB.0087,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FC03164EE8;
	Tue,  7 Jan 2025 15:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736258487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bec8u+1NcRe5MOhOgFsUDfbyCQeJhWQLLR/Hj+tPPhY=;
	b=idYU8onfqkDJ+YHA7tuREnGQuUz8yKBy8QQ/dLM4+u2rYVvxFjGrNnnrsCKFdk4kEngqAF
	3/3K2LQncWqt/1ftsy0+K7mY9kH4Q5uNDgRUxemOMsGktMpibheUcBh5QeERJ8x3f80dXt
	I96J9Qjk3H8iTKrBs2r7OD8OkY7C0OapkFA6mY/5am+HO16at2FT0xWG2ywLIRO5l7CUY1
	xfu9+CoDQO4VUzVByQLWEYsRfUKhNAbhpI2If3p10iQC8i9SnKjsVSk5ZhNvVOD3oXQMfG
	Guj4fbvm5sW5BjyYYkc/gvtYnXGmQPEZ0Nsu40AwEqPTOZwnnmf42Xp8ZUD7OQ==
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
Subject: [PATCH 2/5] arm64: dts: tqma8xx: Add vcc-supply for spi-nor
Date: Tue,  7 Jan 2025 15:01:07 +0100
Message-Id: <20250107140110.982215-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060132_275640_3EF1B2E8 
X-CRM114-Status: UNSURE (   9.90  )
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

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqma8xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xx.dtsi b/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
index 366912bf3d5e5..86b4e2b75adba 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
@@ -65,6 +65,7 @@ flash0: flash@0 {
 		spi-max-frequency = <66000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+		vcc-supply = <&reg_1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.34.1


