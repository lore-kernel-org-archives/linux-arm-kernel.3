Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5F5CFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 19:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GMZhcN2wxaEKVyD7wZBJpczX20+L4j02F2j/QYQHmSI=; b=gDfASf4Mv9Y13bzyYsZPhrFY9h
	ynvjamh7i7sGwxCJpyuj2uuYFvz7ILh2D6sW48PwzWzYf7sS9xrTFGA4zmNAXyW0nBh9oaz5i+rWZ
	9E+EhhaMn6noFYoFNEWOcJvJMw8NP0FJltWL+rgqkdE8AXFofs8EKcgvWPKPv9zC28VU5teFdPZie
	RFRrC9w/3lEwqO8eYqomlMAPfjEIj81AAnh33bGAoqiHbUSucOsTWAZUS9RJeMTNOmhuxCGm/bw4U
	ZQGMVhoQpaea0Eg8kETFnRfdWdLD+4E2e5zLUcg9GsQoyAOki0oAqegXqvNw9BGdoDYnpK1KNCUTc
	UyKf5NyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9tf-00000007Ftl-03CH;
	Thu, 20 Nov 2025 19:00:47 +0000
Received: from hedgehog.cherry.relay.mailchannels.net ([23.83.223.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9tb-00000007FtK-3zwV;
	Thu, 20 Nov 2025 19:00:45 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 316AA8A16BC;
	Thu, 20 Nov 2025 19:00:39 +0000 (UTC)
Received: from de-fra-smtpout3.hostinger.io (100-98-121-252.trex-nlb.outbound.svc.cluster.local [100.98.121.252])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 390268A103B;
	Thu, 20 Nov 2025 19:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763665238;
	b=Pinu1RcfNLrxVbkFsgs/fr0F6O4bVKf2NMgdl3RRqRClEevkJXGYqtBTfQ7UgQzqjozbva
	cEpwFe3jgX7Oprg8L67MWomD4m2mo8zj7sNX5roeiNk1JRdosOkjaJ3xpkywaLVDpw+hbe
	iP4pLpCt9tb3mHTp+ESfm7+HDRzZR3XD9LRyhQM0SoaMchrehdQ7WLpkmsaxckCQ/z3gOw
	WqX7CScx8XbnyNSvCF2ljV7s66v9t4wwxhTGXuJfH+V6Q73NP+lwFkZEwBWlWQrF7VsbLY
	Wng4ceayU3b3NtGCQIDdA9vHtYZBhbW7TKZD715Clb0AMkBJ1ggqxqS2MHB7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763665238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=GMZhcN2wxaEKVyD7wZBJpczX20+L4j02F2j/QYQHmSI=;
	b=E/8+lqlf+TdlZESIRmIAWd4yeKS/CZ6iXBndssNtiDFxvKr4mstPh0PcmqkpJtaCwscqfp
	b4MQGjT4kPcUyaEalfPWEIn0vwDRnSMLiQGhw75mf60CWjAjwvp3MkIuDF9XKhI10r4NLY
	dI63RejyCRG9/82fYsXoYB6hpRCgcBMTxZfqL5+tV36h9wndXUOC39g1FYdxoE8x46y3yN
	WL8z62YSSw97ChacfwcaH89MsC0gc/flQVGrS8pBrPspWDYBmQCA8/CoBLpMe8DQvC3blx
	L0jRIGXYRUhNcpeOvrEIe4D0R6g6EEJuoKdxNljqN6l8h5msg543c3B6rlMIaQ==
ARC-Authentication-Results: i=1;
	rspamd-55b59744f-26rgb;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Good
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Interest-Hysterical: 22b0686558f57138_1763665239002_1388945392
X-MC-Loop-Signature: 1763665239002:2199312045
X-MC-Ingress-Time: 1763665239002
Received: from de-fra-smtpout3.hostinger.io (de-fra-smtpout3.hostinger.io
 [148.222.55.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.121.252 (trex/7.1.3);
	Thu, 20 Nov 2025 19:00:39 +0000
Received: from [127.0.1.1] (unknown [IPv6:2001:861:4450:d360:c7dc:44be:8206:c29e])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dC7365stJz3x6l;
	Thu, 20 Nov 2025 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763665235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GMZhcN2wxaEKVyD7wZBJpczX20+L4j02F2j/QYQHmSI=;
	b=HWsP0ZYQsCCSTxee4G+n5ylXSOBS5OS8dqQ+DAtIhrb3YnslYCVaAFMWYDSMxFSXLq7bij
	GYOAmbpyOp1W1HfDfx6ZicPRrdu6fKDSsSvzQ2GrU7cttk2SsxyZLOmHHVN5IB18l2qp6X
	O3bcqrNjEeW8pnWHiqJiVPNNZ7xn9K2uMiY+wqgHLSHW09Jp2AkD3pI2KtY9ZOcH5lDn+W
	0ekjeFEiqMTHwSOhwjWzdCQG+a2Z5n5Eniw5DQ3GpZ2CgyVfEFhVVquZ7xhgC28QGCpgBR
	QLMis6e8RvKckcUNhTTAQ0HE0b0ARhBCqK1sd5q3luZCrmlCaAm2NiMG0TzDPQ==
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH] arm64: dts: rockchip: Enable i2c2 on Orange Pi 3B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-orangepi3-enable-i2c2-v1-1-2e023a74012a@rootcommit.com>
X-B4-Tracking: v=1; b=H4sIAEFlH2kC/x2MUQqAIBAFrxL7naAbSnSV6MN0rYWwUIhAvHvW5
 7zhTYFMiSnD1BVIdHPmMzZQfQdut3Ejwb4xoEStFEpxpm+9eBAU7Xo0jw5FIONRkzOjstC+V6L
 Az9+dl1pfumRWW2cAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.13.0
Date: Thu, 20 Nov 2025 19:00:34 +0000 (UTC)
X-CM-Envelope: MS4xfHb745rDjt/k1t+lwLX1j6r2lQ0FyP0JBNZJ9Rco4lVGhWAvkfCvrH+mu+i/HGCGMq6dKg5J231vsJISCX06IuIdpXLRN5pa6+A2ANlxOJAfp2oiXueM i4kiE8ZrScUheCyk3ivf+CCWSkF/dISuW/0DHRAjjMRZHmUch/yvM/LOki9/FSW1xXBN4WwpyufEVuTjcs0Y/DfUhmDgoW4yyYGGc1ZIO24RoVDMOJmQ8kXm 8I6E65Ms4WSGkDns114yDKPcMu61Zta1YCkWp4qdsOL8PJlhWuClrPCXZod8SNuqyg9+BCVOz+/LVDa+fzOjjfaxeMNaKwYu4FpJwAn/Ap6IBcvzTPppKJeN s5qA+v7LF/dXiBaC1dGoIVhhd6MdRez2QBIpm+n1xzs2DG4RAaEqXMCl7tZUw/p7HT2GrMTXVZnqe4/pizo4pjfI5xRRV4wuYcbuUqMiheZGpyTLkpBQAUM7 pjbQdtkl2Pn2R0j3VJOAM5G8f9h3YmJTL0mGdvrav1n71Mo06w1Ht02KjQYMqOHuAFDjGkP2IdR81lrzmwZZS6Y+eT3TAF+5w4v0B9DTuOJWp17n557WHNpI EN0=
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=691f6553 a=CjJ265PZljfpLgeKkM6P3g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=5dAzR5NRAAAA:8 a=d70CFdQeAAAA:8 a=vGUGW7KHnbn2mzzjei8A:9 a=QEXdDO2ut3YA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_110044_466613_1701C5A6 
X-CRM114-Status: UNSURE (   7.40  )
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

Enable the "i2c2" bus on header pins 3 (I2C_SDA_M1)
and 5 (I2C2_SCL_M1) of the Orange Pi 3B board.

As documented on http://www.orangepi.org/img/pi3b/0719-pi3b-19.png,
such pins are the only ones offering I2C functionality
without conflicting with other SoC blocks.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
index d539570f531e..e2f0ccc6dbe7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
@@ -435,6 +435,11 @@ regulator-state-mem {
 	};
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2m1_xfer>;
+	status = "okay";
+};
+
 &i2s0_8ch {
 	status = "okay";
 };

---
base-commit: 8e621c9a337555c914cf1664605edfaa6f839774
change-id: 20251120-orangepi3-enable-i2c2-fe6d25ec681a

Best regards,
-- 
Michael Opdenacker <michael.opdenacker@rootcommit.com>


