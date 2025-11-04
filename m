Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15215CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJg//KOLtGKSYp8Owm6BTGh3ScE+qyb41BzG67dVSA8=; b=kUbBjSpkVnth2Nj/oFenap2n7x
	4t1IzS6BfgMQcu5bXgszT9I24RVaac9WZPqJcpD4iM/8W1s0glo6jSwZpYJP6+jrv1eHiZvktLmy8
	LRALtKaXe6M3BjsG5fs4LCoFH80jL09SfjTrj0dLvtEg6tAvqJCBJbS6ajaxqPaAVorsOd+N2pPNE
	o2I9UqgigZSROoar23jPhmrc/2yrFKvgRGtn1LI7wxzHRr+BT/yf58KyqSCPuFJfkUVfOuB3Jq7UL
	Y5PiObvm52oAOba0GvMe5ZDJQjnGK7aGiO/cE/IRexRj38ZUT6SjJJfLzAaosgz3CZR/HZY5Sbrad
	py6q6GfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIcm-0000000C2af-03s7;
	Tue, 04 Nov 2025 15:07:08 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIcj-0000000C2Yq-0Ypm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:07:06 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640f0f82da9so938003a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 07:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268823; x=1762873623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJg//KOLtGKSYp8Owm6BTGh3ScE+qyb41BzG67dVSA8=;
        b=X6Gj2Sqa1P8dCez3XbPVXVX5wCaWEgoiijFGoNhAJpDuMr6i7ngCnVlnZSfD6LS3Bu
         glTNQ08QSOTTrN47JKQ3gh9YHDu3yCkMgxnA1L7fn4MWnJu6deU8uqYeqbhO/EmAcRz1
         uGjaKIROb7tQ38wRwspqsNF6aRtIkm/UWEEOv0Ne9fQHVdpydYYqzryiztUS0+p7vPyd
         SsIhqbQMLpoMhhYO5Q1o+fcjTFPC85lqVnJ5aOscHcZdcINvZeVyz/f0lz4FhIoZZfsF
         7LQDu4cbPS7r5dKFmVg/32HumXqC/CP7afqQNtJYyO+PLU/fXmxke74wThEL2IaEEXLF
         bpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268823; x=1762873623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJg//KOLtGKSYp8Owm6BTGh3ScE+qyb41BzG67dVSA8=;
        b=wRLrnADr8zi4Esf/PVwCYbePfU06TGvK2m79gj5CzDH5z8V7UBVnkwdDLlXPZJgaY9
         PRmbHxpGtTDROnjJOD78OySx4VW8h6G1QYNa/KRAnm7ykmz92o/1SMrC0D8Rub4xiTJo
         uSfU59KVfusiLJ8Aeo0mNh4qp0X6+Svz05SVQF3/1ROnxXal6fzVM61ypUO1/u4W5BRP
         2bCi41H1KuMq5yAqDwDS9e7P+6gEDrhVEdMJrSBHN1ZJijLWnKvvD6hdYfPpibSE8sXD
         NqqZ3He0mspjmnPdAA9tBTyAycRo2PfuDG7PGlzk+CrMxuHFXMJB3kB2NeLX5b6efBeU
         0Few==
X-Forwarded-Encrypted: i=1; AJvYcCVCt5IYsZ/VajTiEighz57mmZ/sHz6eJZPHsgqaSzqGBwtIof2aFyeazOUSS1oxR0AvMyuYnJDBemMG3z0XAPbS@lists.infradead.org
X-Gm-Message-State: AOJu0YzgZ6zBv+S+gCDj7DKCvzIFsmCr2QCC1CIUU/RlVYtErZ5CbFpW
	WO51uLUsUH+19rEKcnqCXuvrD7cfS6LIVfWn5Fcn+U0FHb8sB1D9xEJk
X-Gm-Gg: ASbGnct5E5+dbsWFO05giPJI0kVqifc1FZzYjCen1dowc4pvAad/F0uRYNrvZxghr4Y
	Ap3QxMGPLjWSsS4WJESH/GAXKFzsFUK7fLzQzCMMyZkx1rsKZL8QBq1nl3Zde4qIaTD1gDc62Im
	S8VusOEW+pMFL0ZS1FhL0+1vFq/Gk2KHQGQcnqOU6tjWtuDDPHOz+xZnTv0qh8VJiiZ9pymwfaq
	H41IPov0YHR+mSGdhjL/N2OqjJDcy6yg5uZwOiRXFGa7VxnbNuIN1mB2sUN4ysjuAjCFBjW1MJ6
	JChN7lIZqE459Y3r/Q1GzVGgJQTkP0T8bxQYkl50age9vSHjcfBNdd2rlz7/zrSFa3uPpn6CGnO
	n8ycAKj959PCoLGBcqEfH2qGY99+Pqoi/V/2PjbBHvereoicUeEAXbFtWjsgdhBv3kJHshWH4O7
	frj75utpr2MC2ZBkTA7KmQ7SVIGg==
X-Google-Smtp-Source: AGHT+IHSgCJ70F1XxE5ENSob586eoO57raX+3jUNcbe4Poy+4oAmY2PXokw7lx8dEM+M4PlDYQMzJA==
X-Received: by 2002:a05:6402:4309:b0:640:b1cf:f800 with SMTP id 4fb4d7f45d1cf-640b1cffb38mr8047514a12.4.1762268822882;
        Tue, 04 Nov 2025 07:07:02 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805da3sm2342014a12.15.2025.11.04.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 07:07:02 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue,  4 Nov 2025 07:06:11 -0800
Message-ID: <20251104150612.1874-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
References: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_070705_185282_D89B7B06 
X-CRM114-Status: GOOD (  12.92  )
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

Change the programming model of the "aips5" node to allow configuring
the security-related registers exposed by the AIPSTZ5 bridge. Without
this, masters such as the HIFI4 DSP will have their access to the
peripherals connected to the bridge denied after power cycling the
AUDIOMIX domain.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 7ab321af9e15..426c11853d84 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1428,12 +1428,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.43.0


