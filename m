Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3504D3A699
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zykG5xT9htU2beqODKL0ma8uO47wG8f6mRcFvD55rTU=; b=ETrxQL6IuDQrfZ4Tq8xCIg4SJM
	Nu7nE2p4p9cEg23W4LNMPEZj15qQhVH0fGq/v89QIjHLS+J4Zs1RmuJJJW7CHqk35ZRem7TiQvcSi
	BklVk+GlAP3fL28yIarZYPMIwgPzK/Mgv8FleiBmm05Y72weBs8QIlu4m8YjpeemrdrGMCjED13Tp
	NhCyLTttXph+iWt1o0FQfRhOz9yyIXDWeZR7vwUwNWh5i5R5DCYVi3Fh8JkqJgjAzqve/AFqZRZAD
	6InlFPp0D4mqMBvqLDjYK7EAOn2w7nIvQGcn6dPHoxEa8qV18WmvwE2FtsXoJnePYyAEewBRMgnZL
	FTxYOBLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5swR-0000000FoEL-2xMH;
	Tue, 29 Oct 2024 20:35:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sl2-0000000Fl7I-485C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43155a6c3a6so7118785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233442; x=1730838242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zykG5xT9htU2beqODKL0ma8uO47wG8f6mRcFvD55rTU=;
        b=QQI6elZF6dXSGNbtRSOrUqtcfaMdoIjU7qREaBzrDeZG590eH0cEsHZPMeAutPIA/K
         v/UUfUm8+pWMaEAWD7Kiz92H+RmPP9m0CPvXzSi6P0LsSNZH2pjDza9V1SG17pSQzQm5
         z8X4iUOuaR+7Of6b+UcTEktXQGlXUT1ADSRydiMALTZA5U8bl7Jdz7jO/A2elp8xhfMX
         OX8msjHJRazI2WPt0D8bL6LMjFKwAtgElB+fICI7M4t+Wfpcct9OyBtz2iP+xih2/HDt
         CwBFW5hP0lRRrit+1nEnnQfebF9GJOE/X+kpzpIKeAh2udVNG6OfEPNAr9h99s2mnbyj
         I2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233442; x=1730838242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zykG5xT9htU2beqODKL0ma8uO47wG8f6mRcFvD55rTU=;
        b=qyJtB/A01zmY9wGefGYA0NSewebgY6D/Ge2NfYB+xu/8lFkcnKvbVFjbgoSAqUxQR8
         XH6z4RuPa12nDC91LSjHJApQfLcLbF4nEo3jWobIXFyCaKC4XY9z+EHnsG+iEtzhKkgC
         qjzrP8TG/3Dd+/8GQDz3Dhp1y2wc3SspUO62z8gdMS8PhV6LLeD0ASksYZD1TkwpT4Gn
         9fw3LKd1UI4SZWijzfwXSkDxpifXE0DgssTdKBjKOA2BGXnYeB5sPftFsWf98j127vtK
         /3KLdWzbirl9Zv/epnmQ+h3KvM8uDVWXgKufn5/QD86yAjzG+DqR2rCFn4zsyadN6tMP
         gCog==
X-Forwarded-Encrypted: i=1; AJvYcCVuskNEtOSYr2JpqherF/WASbU6u0Ux1hPt63UpWghu3hTMuruTCqPESV5wcfYUz1MLVPkICcc4PfjdrJcOyFwr@lists.infradead.org
X-Gm-Message-State: AOJu0YxZl8mfTjycHIR3miqUCVhvbkod4zIYZSQZr+T/mx5CcKqVo7Hy
	9rqou4T9bFXLTLgbwQ2lAN9iGYIGEtGcgp+xvo09oYYFWi7TsyI3
X-Google-Smtp-Source: AGHT+IHmAsezJTQ6HDzRiPuCCGE+RMKKJV1S7Rnrkqh2NL2lY4iIeUnDKBM6QOnU1gla9isevRSz4g==
X-Received: by 2002:a05:600c:3542:b0:42c:ba6c:d9a7 with SMTP id 5b1f17b1804b1-4319ad08603mr47418785e9.4.1730233442025;
        Tue, 29 Oct 2024 13:24:02 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:01 -0700 (PDT)
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
Subject: [PATCH v4 06/23] ARM: dts: socfpga: add missing cells properties
Date: Tue, 29 Oct 2024 20:23:32 +0000
Message-Id: <20241029202349.69442-7-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132405_168806_9A455749 
X-CRM114-Status: GOOD (  10.61  )
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

Binding requires size-cells and address-cells to be around for the SRAM.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 7f7ac0dc1..4b19fad1e 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -684,6 +684,8 @@ nand: nand-controller@ffb90000 {
 
 		ocram: sram@ffe00000 {
 			compatible = "mmio-sram";
+			#address-cells = <1>;
+			#size-cells = <1>;
 			reg = <0xffe00000 0x40000>;
 		};
 
-- 
2.25.1


