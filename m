Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B32C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkuRXqfexgxoL5mSMdXFC8efpsK9InFzKX5Yb1zxFIw=; b=aqJVMd1+jdNtFP7Kgp1dKrEyaM
	qLgqWiY724OJdONITtb6CdgLQnDvkREagWdJP/5Lai0WMI/ciRFAa4iMRahAfJxZiSN1+PA0kozWv
	OkUnAaaV70GMnYaflPMFU11Be0V93iH5Nwomt1mxM8wUk4njaYsnkzZU/n/Wp4IcRkWCP35BjamUB
	yMbsfdrb5kN5KcMI5dMSlOpDR8lhALPsGfcd1eHd9Mre3N4Mhsxkrez3geB6X+alq+XaRCYqmXl9u
	Ea9iCFf0Zu5+1Avf6cqfRbhaChWRL7RQ0Q9NMkZSs6SYebT5ox/xu3v2+r+BeotaLQya0YosG+1e5
	dzwIGhlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhBC-0000000Ap6y-0wW3;
	Thu, 26 Jun 2025 07:37:54 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUh6e-0000000AoPi-2ukD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 07:33:13 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 83370260DE;
	Thu, 26 Jun 2025 09:33:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXotwWpGQbff; Thu, 26 Jun 2025 09:33:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750923190; bh=TmZI+dJjqSOEASAovjfXP+gAUAtkuQbCG5e7pb7o0IQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ArFG9bigjBmicupBq48TjipjwZXRV2KB8Hlty6N6rrSiih7jNxte1b+K+FRtKGiQX
	 Zkv9Wlql4Fwy+XP3vifZwmsZ/nClj0SvGdr8kt3ZeVfIVjkVVkAetXCLeRdNFs3X9U
	 ImIU6X4cK7JhMApg0JXFhrDpZMUc8k0Rz/dYP0MS2EoPgPWTRG0hXIVwp4I6+avRZn
	 fVn/jwleOFZZ+A2b3svj0g7bf6MrdqinBLX2lxRrRLXzFwP0ayRuwn7qva9woReZCN
	 bUwGwsgwE03Bp6jNuIUznqV6NOEnc46VWxgl5832l5a4Y/VhW+J1qQgMNblI50KSh1
	 iBpMqFMGCJwBQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 26 Jun 2025 13:02:56 +0530
Subject: [PATCH 1/3] arm64: dts: exynos7870: add quirk to disable USB2 LPM
 in gadget mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-exynos7870-dts-fixes-v1-1-349987874d9a@disroot.org>
References: <20250626-exynos7870-dts-fixes-v1-0-349987874d9a@disroot.org>
In-Reply-To: <20250626-exynos7870-dts-fixes-v1-0-349987874d9a@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750923181; l=1090;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=TmZI+dJjqSOEASAovjfXP+gAUAtkuQbCG5e7pb7o0IQ=;
 b=G0kQn22NK2ihs5Tr+HK01RrY6Cc/upBoIeYSQkqR1+XW+Kz7qLP0eb7ZLT50LTe4pRBgbLfsb
 fLAXBaGWFWsCw3DuxpYOoYkZgEkhmK3y1iSApZ03jVLmqZXk38xt83H
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_003312_867766_EC4E0E7D 
X-CRM114-Status: UNSURE (   9.47  )
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

In gadget mode, USB connections are sluggish. The device won't send
packets to the host unless the host sends packets to the device. For
instance, SSH-ing through the USB network would apparently not work
unless you're flood-pinging the device's IP.

Add the property snps,usb2-gadget-lpm-disable to the dwc3 node, which
seems to solve this issue.

Fixes: d6f3a7f91fdb ("arm64: dts: exynos: add initial devicetree support for exynos7870")
Cc: stable@vger.kernel.org # v6.16
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
index 5cba8c9bb403405b2d9721ab8cf9d61e3d5faf95..d5d347623b9038b71da55dccdc9084aeaf71618c 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
@@ -327,6 +327,7 @@ usb@0 {
 				phys = <&usbdrd_phy 0>;
 
 				usb-role-switch;
+				snps,usb2-gadget-lpm-disable;
 			};
 		};
 

-- 
2.49.0


