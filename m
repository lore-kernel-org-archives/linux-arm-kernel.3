Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FE1C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zc5CpEky2NIZDfhanuWrTwGiO14SFMDkXoWyMl5EyRg=; b=0ROY3WYmDjm2TheaSurMFiu9IX
	IiRGZ0D9J6JkHFVyxhrMXK09FvbcQdBWcEabC0Btfequyrl5bNComIW1sSYTca3vkvHSIH6tja7gV
	FQUNYivLED514QfsxeLdhSk2bcEpDRUs2kZwnlthZJpeFgVdTUxuTez7YZPFWBPR4CT6bln5osWYc
	ztjbvQMiMvv7e7vrTVS4qg7SKsDNflsisihIWfLi+bgXfGbecSJaws2hOK/f73qH/xG6uquJW6lRA
	NFBTN7rl7uvmPLG3lq6PDaXqIe7j19ikHwrQcrMhD54NVYiDv+F98UKY3ZrtI7velRzr4KSPSooGY
	XJmd111A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBbB-0000000B9UG-2qdZ;
	Sun, 23 Feb 2025 13:00:45 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBYI-0000000B9Br-1kKZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 12:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1740315458; x=1740920258; i=wahrenst@gmx.net;
	bh=zc5CpEky2NIZDfhanuWrTwGiO14SFMDkXoWyMl5EyRg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kD4TUfWZEP27ktDphP6TLIFtLqDAzh/XdBN1DU2rv93CzPK5PP6DzyqeH/xwBjMT
	 QVRs8mYAUtqx/DRayVHe5CAmACjLz0VvhNz13RSU7ILIHPDAkb9ZX1H0nbgke+0mM
	 wpGDHtlAFhLhJEd3BiX/BX9tVw99QIbo3JgrHFuCS5rbT/64tsKF51pta4awIWK55
	 senSMSqAngAeBuvytM8HymE1vVPxx5zgB7Nsq+kr6cxL9oeo7Q1XIKdyPYazTS/f7
	 sc+TdKnmcWElVKej1eAeVFKUgqLNANEUQL5h9YOuE+Ed8H88k1Yz4kRhXcfzf9XP6
	 MezJlKjHHt02Q5szMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXXuH-1tojqn1mut-00RtW8; Sun, 23
 Feb 2025 13:57:38 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/2] ARM: dts: bcm2711: PL011 UARTs are actually r1p5
Date: Sun, 23 Feb 2025 13:56:13 +0100
Message-Id: <20250223125614.3592-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223125614.3592-1-wahrenst@gmx.net>
References: <20250223125614.3592-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tJfhFtLlSGhjDfQBOf4zyVel94Tr2+RePyIQd+wtxYdxooAheJi
 AVO1n0o1lTf1wTOOQiNNpvqnKbJva6Kge82l7FuVljgP3iNjXDqLAsuTXlrOuBtxw4sz7c3
 lfIy/xA7G20FvQclkUmd/BtU/mVe6tA2Y+YU9hS3wkBHH90JfpvXDWuKMNbHoJU0/8A5eV6
 1lbwInj8sAw6B29+NhUog==
UI-OutboundReport: notjunk:1;M01:P0:epv+g7wgT2U=;PxNsoeA0w2+4YjCTVlJt4Cvp+aM
 nNcR231aF95ttCymSmoY/EGQGW2uZD7kjT6ShKy7oQraX9Ae5USywcyfPXCv+GaSGNiH6rmH3
 qPrXwIMyECD9/WU8Eo8390pKx1ns7moZKhCIlruYnHLvRHsscCJDpHKpUV5kogBqyhvNIj65+
 EWQQc9FsZA46goztD97RaVH6gmpAbrrQKJP/hlUiX8v7/vnWkypzD9n7HGVwIV3UHaC1dPgZQ
 ccznzb6yufEN7sxxwjISsPTf84sdwtbXqQPh1QbsMHQI+ujYri2GV/kHSqeRqYFzpRKv7b6ti
 ueC/Q0PD53AXl2gFsZkcYbExsSBx0qAmm7R/UQYMFjzDD4KDIOEbZBXF0tTORQCJF95+oiHuy
 exLa8RaxdeHO8y4eltJz5+251i+cuUt4VkYxTTXawrEel8bes034aMjddG7K+JOBScz7+YBsg
 BMlfry9eryq7aWxhWQc8ORdENOfqh1Yoq7N4hbVLl0u5RRYbL+aYdsgloYqjyFqY4YhedOdEn
 aQ72BpmknYdvoR2bRELaOjuhjODarIRXKohXflSJOMmP+ULylpRmjTwMgLn8drfI7scsh/s1/
 6qHi8rsl5tlH5+YrP18WciuI3Bhzcj4BW77klWsk/OlcLvq6tByosctxFv+qg0EPrbVuQxhdx
 irtiHBCAgnSrPFJ2UMgobWAHFixUWLR/e7OJg8D9htP12X8NMfZVFJfBv2HKhIJ+WZHTxvxZ5
 NzrdCV5R4fWXNuHVoOaYjcGOVbVg+FcgT06/N2ndTrTBM5b29veI7jx4gVM1AtBcGp7xKCN/M
 3/4ktP9KSsSdq9Mi8SNpLNpWggpFI1FJYl0GECtylZgGjGpdcjR/wKICfdhySX9J84mp+7k4K
 nOD1bTspBmdG+7OhsqZ66QdCVSJ4XDBGD1KbeCY7FTdBzJU5kZY5z0n7rOEG8T8emuJ2Kzn/B
 PHtwb0s8qNbCXLokVF2NBY8n0qGXt7oki0Nw+tsHqtyWJ0GUo5adSdc0C/ct4p/OxBuh1GhHA
 aIta7hEUh3cssFQP8AiGn6RwTRrPLYVWzsM/lyMFKHuN88EWXwUw/O0em0oX6VO7TAnEstb+s
 XFzHczei+vuhTiuT70YRCExD+ceYxJg+BWGuxVIRZwuqFai9hpGzO2ukBnqAATpli41juyscB
 dFhxUHdRKng6yXOKeavWz+IDvqQPZ657yx1nZqeNrVKbIkqhKlUcUDN17vW26fIdK7DO/okY+
 kVjFGlK3tdW+dMumj8ILNIiHHCDF0Ac5fSe/zH6nmMGUFNhKM++p8hfQ0UOViIVcWxmc3TJi6
 5tPePqFVBmg/T3N1jCxMfB+D172Umjw5c5LAwF2jP1CpRzFf3DsaNzHtaoA2cIdn9BnQqUBAM
 d4iNNipwE0+9fcOD/+0Gk3qda11lb0xxr2K/JfsO7uD3s4SNiKuMPX7VUB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_045746_747489_480DCD63 
X-CRM114-Status: GOOD (  10.06  )
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

From: Phil Elwell <phil@raspberrypi.com>

The ARM PL011 UART instances in BCM2711 are r1p5 spec, which means they
have 32-entry FIFOs. The correct periphid value for this is 0x00341011.
Thanks to N Buchwitz for pointing this out.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/b=
roadcom/bcm2711.dtsi
index 7cf93fdc676c..cdccdef267f7 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -134,7 +134,7 @@ uart2: serial@7e201400 {
 			clocks =3D <&clocks BCM2835_CLOCK_UART>,
 				 <&clocks BCM2835_CLOCK_VPU>;
 			clock-names =3D "uartclk", "apb_pclk";
-			arm,primecell-periphid =3D <0x00241011>;
+			arm,primecell-periphid =3D <0x00341011>;
 			status =3D "disabled";
 		};

@@ -145,7 +145,7 @@ uart3: serial@7e201600 {
 			clocks =3D <&clocks BCM2835_CLOCK_UART>,
 				 <&clocks BCM2835_CLOCK_VPU>;
 			clock-names =3D "uartclk", "apb_pclk";
-			arm,primecell-periphid =3D <0x00241011>;
+			arm,primecell-periphid =3D <0x00341011>;
 			status =3D "disabled";
 		};

@@ -156,7 +156,7 @@ uart4: serial@7e201800 {
 			clocks =3D <&clocks BCM2835_CLOCK_UART>,
 				 <&clocks BCM2835_CLOCK_VPU>;
 			clock-names =3D "uartclk", "apb_pclk";
-			arm,primecell-periphid =3D <0x00241011>;
+			arm,primecell-periphid =3D <0x00341011>;
 			status =3D "disabled";
 		};

@@ -167,7 +167,7 @@ uart5: serial@7e201a00 {
 			clocks =3D <&clocks BCM2835_CLOCK_UART>,
 				 <&clocks BCM2835_CLOCK_VPU>;
 			clock-names =3D "uartclk", "apb_pclk";
-			arm,primecell-periphid =3D <0x00241011>;
+			arm,primecell-periphid =3D <0x00341011>;
 			status =3D "disabled";
 		};

@@ -1175,6 +1175,7 @@ &txp {
 };

 &uart0 {
+	arm,primecell-periphid =3D <0x00341011>;
 	interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 };

=2D-
2.34.1


