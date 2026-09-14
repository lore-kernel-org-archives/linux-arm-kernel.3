Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB1C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BiGb6WiQWJmFrzRKswfmgWeyhlzVvwsEuctPqCr7l7Q=; b=X7wbcnKsGf/lx1rh+bm7iXssXG
	Z14q6LWm8xev9893p534lVxJXoqJVHvyYyhWK3B75vTPLO6whTud0aOqwhoyNMWKhhMZs319siYLA
	YrPQtWpMKGamBlLJ1USEz7Mgy7amNFVkU1M+ksh2G7ygOMmrMg08z+g7Mzta6/w6mqU/uwHJtnqer
	OvTybhDMabrJS3TmbLnpRADxi2UoN+9ZA+66M4Ggjd1hcHittCAIZklVl4wEeI8GmuG70NRZ87yQM
	REiTkrRwPShhrXdI/3tRrcCgfBju2alBhYxmWY7up9p5057EypWIRN8MH5DSy2JtV6+en5LV4qbt/
	QRCwN8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62LQ-00000002ol7-31IW;
	Mon, 14 Sep 2026 08:47:20 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62LO-00000002okK-3O6X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:47:20 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so11354635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789375636; x=1789980436; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BiGb6WiQWJmFrzRKswfmgWeyhlzVvwsEuctPqCr7l7Q=;
        b=6ep1CKuwdKRbmOik6UubsaZg8Zac1H7b/uMEN04qF8BlG6gyKDcR7WjRR58311mU1D
         Dq7z5018VoyCFJh0XocdbNce1TDoXJlLL0nl3J6nKUZ7tOB/CyzqMekP+nhyGBQwDVzB
         MC7roeyUSvP4wOcA/UGRvOfH/5gcARQaqQMkH0suMH8vww5VoDQRvgxoxv4WeiPqmnhI
         lgco4CdNq93W6iGdkg3z+T8KbM4fZisWzFbuuf/Qt5sj/lngeslgDG6Oth0Xo+8XLxpv
         cZg7pfysUHEaNFPUSLPMO/625kMp7uMAKq07X4upKy0z+mI2Jbti3pMn/O/pIu9+w0dR
         bPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375636; x=1789980436;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BiGb6WiQWJmFrzRKswfmgWeyhlzVvwsEuctPqCr7l7Q=;
        b=coEjjqB9zFp/8XtQqTrwSPFEHgbNTgkTybi7lbR5VSTaT3fq6MKEY7u4hIwLNfWJc9
         TUCGJESJxsy7NMsruS4n7Jf+iHjHnwfdUVIW6T3F05tiaMzUEbuTQbjHX8tQVeX8R8H7
         Blp+F1kioIeqpDvNByb7jNAtya0wsT+2moFT9DxM3i12l/hpp0SZK5xHcWxtzt9trG9d
         VF6/i/y0LH4jYNHgkO/0vtLldzcqQFX/pMerbrc6RWY+0UAGT6cxTJY4HrtoK74WrFo+
         oYhqeMX0/x7Y3TguN7or6rUb+D8DXeAqHk8YXyKgk3BwLszDmgTvPEaXIYlvVX4UgiuR
         p9pQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1cdI7zgdyxnrHJ2hiXuuAVpZmEk+SCfKTONAmcjj9O//srgRP79JQoQKzUtnVfiaTi4yHfEP1zFRk3+l5gDnr@lists.infradead.org
X-Gm-Message-State: AFuF++k9TS/PIu/JQ5ADTuEdhqeLxPGMgrtWCfZvDxCtB2Uonw3TrB2s
	xqYSoyOgm12Fnwsl96yzc0oS3TxX8YPRphMOjkq9/yHO3XsoNY6ggKKZMGTJnkCUKyA=
X-Gm-Gg: AYBFou2jiztd33+OXX9hWwYYX9XRwxizbmVDxaARFcEgVUhqW1lr7/FVE/559CqAote
	GWxSL1/g5oMEt0JyCmHNarC9qFNwL89ybaobgONnKk8n9LqkbTdgYcFGKAeeaMLnS2Y1Af8ZreE
	mna0EUKAp1yRLx06PDDhSa3BtEnO3Notw3LnU0taItdGefPEm7pFzAbFU7BnOXj9vv45GcJUi67
	Vk17KDSUHFdp6fNHusGKyXBlvY+yvtEcDarvoYPeGMcr5ZnpFeeTIEQSKlkQsLnSiHTUQV6MeHb
	9XtaIBIuKSyTstdSzTSlfiEKyqWuV5dX+sVFUrwyydyzPXcJUEXjExjaQ7rc8dTr5LWnmyMxQlq
	3zBmOrFqx4I2rLoq56F1tqGxE2n/VetJ686DU3qtkOwDucUpZqTJKQY+1wOgBCYD6WI3Dc45nqU
	BbO9rTVTPkRWNLUZ6bm5h0mF81/MINUjCyoL6GvmavsDsA7QnvSI3e15SAQI3lHyS/q8kzKAnFC
	KzXUd4a4FBQuarXmF/5
X-Received: by 2002:a05:600c:19cf:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e7a663d35mr22293075e9.6.1789375636366;
        Mon, 14 Sep 2026 01:47:16 -0700 (PDT)
Received: from alchark-surface.localdomain ([146.70.184.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6cc11607sm199520805e9.12.2026.09.14.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:47:15 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 14 Sep 2026 12:47:15 +0400
Subject: [PATCH] arm64: dts: rockchip: Set gpioN aliases on RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-rk3576-gpio-aliases-v1-1-ce5f86f9ae0e@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IWqPxKuIipqOOLRoyKgXx7
 k3r8i3+P0EoMAk0yQmBDhZel4gsTcBNdhkJ+RkNucq1MtkDw6soK42j5xXtm62QoHHKalXXfWk
 GiKUPNPDnf22727L3M7ntt4Lr+gIIVSeBdwAAAA==
X-Change-ID: 20260914-rk3576-gpio-aliases-9c0a6088b59f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=alchark@flipper.net;
 h=from:subject:message-id; bh=xSsTA1+Iig8rnrr46UdcEnmTqyfP4pnCIpRKT/lZv4s=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQt3zKl493uJBmRTYsfxiasex+ntehC9OljXSWFERvsA
 mfd/1JyoWMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpblZkZPgc/9Zs9pLzqxY/nhGV8HvV+a4TP/0nLDXQdtWPW3FtodMhhv+lMQ1
 7JS9MP6Y6Ke9bbihns0MOn+PB0x+cbJRm7zq7/DcnAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_014718_874957_114FC2B7 
X-CRM114-Status: GOOD (  11.06  )
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

With no alias, the OS is free to number the GPIO chips arbitrarily, such
as in probe order, which is what Linux kernel's rockchip_gpio_probe() does
if its of_alias_get_id(np, "gpio") fails.

This results in GPIO chip numbers arbitrarily shuffled in userspace,
causing confusion and pain.

Set gpioN aliases in the SoC .dtsi, just like other SoC versions do.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index d418bfc04097..e87ace5d05e6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -21,6 +21,11 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &gpio4;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-rk3576-gpio-aliases-9c0a6088b59f

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


