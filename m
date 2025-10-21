Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB20CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GqUCglb+0FDwyycEK2V2KsoX30Sw+xzpkkOZ9ZURSbo=; b=xHjKYCDsDAAFjLMjGqZiWUFjql
	nwi+UqqXzNi1ruoyyDfebQU/5vaKCrJNUT0OJe4LVTgihpWa7mQ/A5r1gTvqn2bw46i0xUUG+QSXH
	IrMil4rqwuMl2JU/CpEYcISkqDcQKNvKZlprVJdknNiBmtnjFmE91JKGIp8h5NsuZX6o+XllRSJyd
	hDzUG0LEp/YA+nmjBL1J85KHJGRYIqW0J1M/cFgF1Y1ooiIe1WPvNSyx6UGMWB1+SY7Pg36jXlOU+
	Ftfn1WYa2F54s3AG280pRsEQFwCjbwBpPPzQFLVaH77tjNKyCxqtT80ch9whOyv2ngUWLP+sckZ+P
	6C+wAUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCno-0000000HDfk-15xa;
	Tue, 21 Oct 2025 13:53:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCnl-0000000HDe2-2fam
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 13:53:27 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b463f986f80so1088570566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761054803; x=1761659603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GqUCglb+0FDwyycEK2V2KsoX30Sw+xzpkkOZ9ZURSbo=;
        b=C0T63Hok1ipoJd5r0/E+i3IAZGIxXROiuj21yB2LYXqdG12BngFeni9rRvP2ndVxXt
         hyCexkBUViNAhH9XBq3yrYJFFTHjHobHm9JiNXpcZavi/X+lBxQx3nvSBY1eyU6yQQLF
         WBdQtW+PIkKxEPSfniUmWU1vs2Tw94plkN4l71QfeiL0j0xjiDXLCXncOjjylWdsBfP6
         x0eX0s2zdW5tQkcc25J6b4aeg7ib/beCQYxP3fYcWPMEsF6yLLlv/8wlkV4lOcLQUfVa
         tEJ97ngq/85Z/QHdH9VI0bL9Su/OQhBhjVNyEpSE11YjetsrEVb+70QznI+E8bk99f8G
         3p8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761054803; x=1761659603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqUCglb+0FDwyycEK2V2KsoX30Sw+xzpkkOZ9ZURSbo=;
        b=jwso8aDUBYM+zeEuPgYyMcxmVokUq2XZqNDoMd3BPs+ASzb+m4OvAdn430u9GVpVrg
         tBfZcMnqRbFnw9fJyNv6c6djJi3Kw/c29DKZ5VZfXb3uK+Vt5ZBNVzJ9edeNwLDtfgfx
         MQ2O9dlSbWWkkdDMTYMB+6X0VsZmZC00b9C3qeOO5ju0/ArHhz3iZYP4CZiCw+MCjjjw
         lQOlKXRj8Owxv5U5sfa2S0jUKDYVKGN3Vn4LfkF8vykMpeMTbDnI/pcxqM58llIoQIT/
         wGPtjWsYB40a2/ZKp+uPIV1ld2ZLI0vwE64OxK2za0A4Iqa7wD5KwhX9Achr+pWfFjxk
         X23g==
X-Forwarded-Encrypted: i=1; AJvYcCX6zpLCYN91+MQ/g5j1df1gtIoRwGiS1jNh7sYe2fDjUE8JK+GjFiwVZRznU48BTq+QhZvY5kwJhpgR20bTPreP@lists.infradead.org
X-Gm-Message-State: AOJu0YxWvoOEcExz7E3WH2Bw8qlbJQdtt6L51wHjoRR+ehGmGxrnsPYt
	6f+HE9ObQh4BJqSUxQi0Y/uW7YISiZUYfXCK3JKbtBC4Vt3cLjbSbBugntAZR/MNeq4=
X-Gm-Gg: ASbGncuSEzs8BU4OS67pv1yF45gnbKkrXep1lvSyGhx+WmgOKeQMeZztphZeRCijLSh
	SqEgfS/JzmR/+h1gs6RpmE2XFm8ehrN6PhOhRy4EchMv3hP2J7ErAJzc0+3kOuiPO3MikZASxwC
	sXhMPJ3fz9DpxwlQ27535Ad/YpCHm3MKZWEo1j4M5N7dQb3vLX90umJrIBz35GmHZdu0n4MP80X
	FNEs4CIdWcRAkX0oPHyOcFVwBPiCoTKyeZdvvdSkVsUyqrwGbS0Gz2Qs6o4rEQ6ENIoD71f7QOe
	J9vtPE6Ocj65S6y4Swd5k6IrpJFf4ahr5CYE1k5batB71J3HymMfKz6/zPYdCJisqu08kp36LF0
	EeqT04mM0/fRBCRcV6om0FMHAY50JwOf2QoFu05cKm/E7wBQeT07QvpWme+r9J+mpNSNTfvmCUX
	r9aewt9/+1G4x+aI+s9Yi9w8NFVpb5+EJSlFdbutZRDW645j5PuesRDujLnTaJzw==
X-Google-Smtp-Source: AGHT+IGzJ1sMZhzOVfrRQ+JvVbLUEVExvUKiHVvXUfDKq0+hkvumJylkHNfbe6040lXwumRTHkh/Vg==
X-Received: by 2002:a17:906:9f8c:b0:b40:5463:3afd with SMTP id a640c23a62f3a-b6473147238mr1967688766b.26.1761054803200;
        Tue, 21 Oct 2025 06:53:23 -0700 (PDT)
Received: from localhost (host-87-9-62-200.retail.telecomitalia.it. [87.9.62.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e50da6a6sm1106448666b.0.2025.10.21.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 06:53:22 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrew Lunn <andrew@lunn.ch>,
	iivanov@suse.de,
	mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH] arm64: dts: broadcom: Assign clock rates in eth node for RPi5
Date: Tue, 21 Oct 2025 15:55:33 +0200
Message-ID: <20251021135533.5517-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_065325_690550_F94E101D 
X-CRM114-Status: GOOD (  10.60  )
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

In Raspberry Pi 5 DTS, the Ethernet clock rates must be assigned
as the default clock register values are not valid for the
Ethernet interface to function.
This can be done either in rp1_clocks node or in rp1_eth node.

Define the rates in rp1_eth node, as those clocks are 'leaf' clocks
used specifically by the Ethernet device only.

Fixes: 43456fdfc014 ("arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5")
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index b8f256545022..09a849dd09b1 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -23,6 +23,10 @@ &pcie2 {
 };
 
 &rp1_eth {
+	assigned-clocks = <&rp1_clocks RP1_CLK_ETH_TSU>,
+			  <&rp1_clocks RP1_CLK_ETH>;
+	assigned-clock-rates = <50000000>,
+			       <125000000>;
 	status = "okay";
 	phy-mode = "rgmii-id";
 	phy-handle = <&phy1>;
-- 
2.35.3


