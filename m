Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B866C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqaLFrErmA8TuMfUKne+UP0vowW73z4ybOt+Ip1qbmc=; b=OtsTl/jmpACcrmdJgUfmnqwdxG
	KQdF9qDj5bxezoiHvJ3YE3631hkgiI6cNWy9a5iP4C64UaqQ7YDxog9MHr1OQkA7H1BvJFezGCfIH
	A7LD0Jxjv0nVbCSJ1xNmHoD7MdClk/WicaEDGrz1XMq5eb1fdzgnO+D7Aqf6hVM6V1QMnNGOy194s
	Z4r7SIn/TZZOCSw4JPWM1ogLJBc/iNWUKFdYCvz2DlZNN1M3JaDJ/uIIuTEeg2e15XFjTUB+PGJFT
	JyopTYZhRL8gC+q4/GXG8lSdonr+AVMr72V+XyhDSvUAeEh7wh4a5pQIokOWzN637r6OFrVRUeTtp
	coGpXC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5LC-00000005X6m-0aPX;
	Mon, 17 Feb 2025 17:55:34 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4UI-00000005NQI-2BSR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 17:00:55 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so3476218a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 09:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811653; x=1740416453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqaLFrErmA8TuMfUKne+UP0vowW73z4ybOt+Ip1qbmc=;
        b=cGUHWZqt1k4NsS/JAoRXHG3hW8FSY04nYxQ3p2/DIC2ofn7U8gdSdvDv+HERYglR+8
         U996/g/iPfpnCg6hULYiwKHru1Poqz5/2HZHZLKq0/C716P6dEt8031X+Hr25+xacyPt
         cLZcR3Ap7lZPUL9766p2zrcJrNkHlGpo3SkxR/lznTj4910vlWRJHLtS1nLG+7/OFjta
         8fyckdJJta99aUFuiMuxB5Kz5YIanPXpfFiNDytadtyV0AhWjWB/4ioN7KWEFI87d+cm
         vJ4Z8jvnUJZZp5KHqig86xu+PnaEDW6lvAaH1VAvUWBmEr1wWtoUpYgAWWWme1Oy0gKk
         eJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811653; x=1740416453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqaLFrErmA8TuMfUKne+UP0vowW73z4ybOt+Ip1qbmc=;
        b=aIdN0lYMSM+kmwRYXG6uzp574iFKJSJAhOL7cKfhpjMDX5/K5rUwF9e8fnnQOXS2m3
         iKXwm6uUK8LAaN5GGN724f9AOTUtQpD3vV0oaTNXaVmT2IiPlZViqU6Rf7ykS/SzclGQ
         Yy3Axz3+VSJ8PxfhoD/Vjn9QvEQszHyYiRcg5c7JCJ69EUAFCt1f0JDGs05APDxKtfAh
         kJnjJekG+DKke/uOkukUcIVfzwDXFTZ7ie6Rnh16Sav3cpRdweQvCWDxA462DmkCsTyS
         2jLQAEgR2u4v4WY10ks/M/DaLA+sAoLK4DzplQcuOTqYgk3CDNjg6diXPBYkaJ5GHA7B
         8Tiw==
X-Forwarded-Encrypted: i=1; AJvYcCXK55sm14qkE2uzHcm5Glqd4MxsUnGOjT+UbifWADWVNFG9SYe7j8dhEjAw/CfnADw7XH/o/w33FtdsqF70+Pjz@lists.infradead.org
X-Gm-Message-State: AOJu0YzvTljlgRx9bP4IInZNYzWHRGJ06nVIlpZxfeUOoxtfxmtYOQbM
	FqpS1gbAl41vz/eo0OnXmGqQkFAMtOe6kODMgAHFerme0U38oisMru675wK8
X-Gm-Gg: ASbGncu1/h7eTEDLRHJ4DpUxifzORfUpYyJDzZ0DYXNaA/qRLgOL8nINbbLMT5D5M9c
	QI6Zm+eHzmZOpV8v9PRUJ+2ERckBKQjn0aGu7vvr6AhI/hwZqYH8bB1uq6m+qDXhjnQRsWJrnJ6
	kMpUtedc4um147XTqIVSIR++amkoUR7Zfoo4wiqr5ArvjJKHEN5kqRCj6KaRejwT9w+0wEzylNR
	wk+Z3xDf1Jzkq4cxqiCpy9DQ6kP2Ab1xD+TCsGa2cmOynmolmGidzjKVInMzXoUcijfDS9nriCN
	Z4q/bPBpCrb5jF0Wzhh0uxUl2p0OyaM4jtoc877qRZpKw2dCSoSYfQ==
X-Google-Smtp-Source: AGHT+IHrNiu7Mfg0Om2Rj3jVA5y5sNcTyvnjB9HoCWBNScTUmN+dS44zo9eg//XHmKb0LBd6UmiAuw==
X-Received: by 2002:a17:907:1b12:b0:ab7:bfb1:99c3 with SMTP id a640c23a62f3a-abb70e323cdmr1177370066b.53.1739811652549;
        Mon, 17 Feb 2025 09:00:52 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aa2sm920570766b.103.2025.02.17.09.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:52 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
Date: Mon, 17 Feb 2025 11:57:18 -0500
Message-Id: <20250217165718.74619-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
References: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_090054_557895_842E268F 
X-CRM114-Status: GOOD (  12.80  )
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

AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
applications running on the DSP expect the core to run at this frequency
anyways. This change also affects the AUDIOMIX NoC.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 86c3055789ba..54147bce3b83 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -834,7 +834,7 @@ pgc_audio: power-domain@5 {
 						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
 									 <&clk IMX8MP_SYS_PLL1_800M>;
 						assigned-clock-rates = <400000000>,
-								       <600000000>;
+								       <800000000>;
 					};
 
 					pgc_gpu2d: power-domain@6 {
-- 
2.34.1


