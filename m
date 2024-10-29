Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CAFD3A696
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qk9braQhcUfjQhD1zhHgydTWlqcLCgBL7v99PtqcEgk=; b=FTk4hIBmP6wxuhnyVtp/Gl7bJh
	z69jE2yAqgozxfLSMPDE612+DhwxMMFwcTnpe68OT6D6kZ9DZoIt8qagjSwRoHsD+WNAwanW03DxE
	wMzIEeGVBDBaT1AZrkahqhxj316M/bHw/L5bCMltH1qVRY5W/cDzNp7bhqI7fr0c403vIRTzj4yR9
	uYrppmXmFJOk5dZ3fzXaK7Tj2DGHn/ldDY5Jn98Os12kJNdq09L5MfiO8fnyhuqsUZapX2H0iy5KA
	e5Yf3ANXPvaYuLVXMTt0IGkEIrtfjID+2yMU2QcBr97BBBfX4LuA0gjougiLWZLBk7PjAoKertIe7
	GRm37XXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5srV-0000000Fn7Z-3G7N;
	Tue, 29 Oct 2024 20:30:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5skx-0000000Fl5Z-3iUK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4315b0bd4ddso7082925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233438; x=1730838238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk9braQhcUfjQhD1zhHgydTWlqcLCgBL7v99PtqcEgk=;
        b=HgHA4MOmwmg0W21eZnu4rQt98B7OVFQ12nDNJ7RpL84rwag1vg50bjoqDkgjNy3TNS
         Xs4q8L1GUiZ+WPdG2bB5EsKzm3r16tRC1+6vyRSZP4oAhwQVkZWos1HlOCojMuNz2mcy
         4ssKg7uy6mpjMtOEAtQu+E4rhy1vIjjXWBGHReNCSssKzF0+mR0Nx5ybvFIvwQEHLO7v
         WKN8Mc9ylnhGLdpFFX1vZhFm6LfevI6cz+QlrS6CggqAnTLaysJ9ZVzHBGbd+tNY4B5g
         ruNhzImY9Wlo8/ViC/6UqPrOEwcPo2jVxJeXXKD/psnCVGX7S2TRQdq6RA2KG6orD35L
         j2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233438; x=1730838238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qk9braQhcUfjQhD1zhHgydTWlqcLCgBL7v99PtqcEgk=;
        b=FEhVijN+cTfdHVXUdjrqjtVPdxrxyZC8UnKnKKw5eEUmrZHPnF/OUXmK6nDMtEnyvZ
         DCHtwastYnRL8ZmXec5H6i4eIM6A8J7q0JM1Tv/oWHFCjr51OGEFiYXwT+nVLUp9c/Hb
         p+z7h9UxKe0oB1YXMhyLk1ujuYQJ5jnbgUzhmNDHp/67Ep84NG8KTn/GcXIK6EleI7X+
         scn6Yt3NFy1lQOtGYFVP8a0bJse1oJgyz/PPq01ShSp+tesNGmrTh5Yt9rxdrtrpWdlz
         b/pmMnichWYXM9UCDUP2wGt42sS017g2SBHV5Wz2/9IA8TLpqc2gULAM8qCqG6jzFAip
         HCmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEwSvFoXiyE5m1mPyttaV9ejGseK5OjPy6r+GysWwy7782GinOsg35uJb8UvELlxi+Cx1exvHGeTmojveaO6Cm@lists.infradead.org
X-Gm-Message-State: AOJu0YzfopYwvuYD7sweuey+sWZRv8dEfO2GbRX5P7LXbdDDgd15DN8M
	euPqsxVG83QJROyqPqsbH8tB4rPFdNPUVum2jQjGmcJHxszA8Ykz
X-Google-Smtp-Source: AGHT+IHXKDESh6R0R2pH+YTSOSGmekompPP5kRB3raByIC6HZykFMvR8z13eRdBzBJ15DbPxCjmrrQ==
X-Received: by 2002:a05:600c:1390:b0:431:4e33:98ae with SMTP id 5b1f17b1804b1-4319ad14ca6mr47168295e9.5.1730233437588;
        Tue, 29 Oct 2024 13:23:57 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:23:56 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/23] ARM: dts: socfpga: align dma name with binding
Date: Tue, 29 Oct 2024 20:23:29 +0000
Message-Id: <20241029202349.69442-4-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132359_931973_8BB877C9 
X-CRM114-Status: GOOD (  11.77  )
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

Binding expects the node name to match with dma-controller.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi         | 2 +-
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
index c7ba1e4c7..01cc5280f 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
@@ -68,7 +68,7 @@ bus {
 			#size-cells = <1>;
 			ranges;
 
-			pdma: pdma@ffe01000 {
+			pdma: dma-controller@ffe01000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0xffe01000 0x1000>;
 				interrupts = <0 104 4>,
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 7abb8a0c5..aa0e960a3 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -60,7 +60,7 @@ bus {
 			#size-cells = <1>;
 			ranges;
 
-			pdma: pdma@ffda1000 {
+			pdma: dma-controller@ffda1000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0xffda1000 0x1000>;
 				interrupts = <0 83 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.25.1


