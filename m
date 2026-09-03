Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA548C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ldFa7oMAa77O6P3elMvA8a20lvnsyT7s/QBQvG18bbc=; b=jnXe7FbltIWMcG
	hhkiVSvk+0DlyzOHZhG9cXdTHR3mGGqxFmmrTf275sh8WhM6O1OID6FY4VP65AYdB9HbiiWL+IQ69
	uoGF/JLkICXLhQzZeCPtrwKQAAkDpHSSaO4SUf6gXLAIicpUgGWf1Xj7gRPVeEiBfOkpQ5e6yPVM3
	xIVYuQQ+rjJS9S3U9GS38kuus9EFikH75qFzyByYKJrroJbPjOtbH4D7JZFG5AwyJdXq+jQrZ9uy0
	hA/AsK6hOmMMkKKI8Y6Zrgy65Aa2yBPF7NDyygDqBDKiIxHRR4fK2tL2oY4Y1JQuhRBC3PIQQvWyg
	sgzrZsXPkjGdrqMj49mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Av2-00000000FPb-3ZmE;
	Thu, 03 Sep 2026 17:08:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Av1-00000000FP7-07nh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:08:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso1107625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455285; x=1789060085; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ldFa7oMAa77O6P3elMvA8a20lvnsyT7s/QBQvG18bbc=;
        b=VVanKAzVd+s7vG13iiI5z+yXOs8Qd7fEzReDrbo8b1ypFmrUJmx0XV97WMdwQT78NA
         52L1FUwhVmk79PAQLn49JtRX45nqF3uyP3el2KpiiD5H1G8H+tga4AfsM8yUtJ5BMyBj
         fzsr5AZ3kRmmud5bvyqO19k7GbXPNLj0DxQFf66viskR8L4tFwWnu7AB9G3LqPgG/s4C
         RhMw2f1sBHLXMsRcGt1akZDqu24RX5qsW1xZHcBo0fhpJvorstBYK2nKs6+EOTs4H5M2
         iXF4zzEJ/DtxJsRODgvuurz3W7AOFSraa18TtstX6TVsny4CRj5N1z9+NTleSrjwFP8H
         WgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455285; x=1789060085;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ldFa7oMAa77O6P3elMvA8a20lvnsyT7s/QBQvG18bbc=;
        b=G5AxC/GgtLB1drDjia9r2PYXpWyy7oVCzzFB2vVqmbM6Y2T4bIIJBf6l/MmhpUvCzJ
         Mews9clEe307lcD/PHOQysjWnZZv7TbZmecBhZPywWFecWeKwQapZOZSYgwK3T43us6i
         tMhX3lhaiXxRAv2uus2yxOVnSxaIxEahwgaEJ3Qcw2yqeWwxW8MDHcgk5/FWOuDENaJT
         njMwk+sooexT5ES4swPlpXxWOoKH9dTXFbkLBGzrlcawX/Swpgd4aB6D0bTgH5ID9q0Z
         dXzFtTGdVmtBnypPuEsfKa1STpA82std6pOI44yl8X9B2MF2vW7G75oaeCWxqfMm94Kt
         PMCw==
X-Forwarded-Encrypted: i=1; AKwUvBwIDkArOtn8ne0CEHh6aTOA4j1G1EPClJhQP6M2VDmfIFkRqbc+XND4x4Ijfv4M2PQCkjpi9YjRdhZLOf+k+He9@lists.infradead.org
X-Gm-Message-State: AFuF++kZCXnxFw60nx9QYsDiuuxcDi73uqcgeSfkfVbeAc2u74eMemHh
	ashp2XWbJ5tVvd51l099kiGEhqWeOxbRfQ6X5QUxQuuPxh96VZIppQmO
X-Gm-Gg: AYBFou0gqd3asq3hUKWM3n3urQc5E6wYMegfNZ9rV+eOItys0jaF+RESjNMjFNuSYqu
	wZOj3kAeW0kyW/Kg0tvbFLbPEHnhNfhNz5grhkoE5jZyZH6xK9ybp8XOaj19cbewR0ezAXcqV/p
	XTVA0UhmptlZjdqlwiGbMyAXomKWm3uzjOyXDd80dkgeKQULh1D9uqJTB5pJoZTo2ZIgLD6GN1L
	mFouGZa+CKbSBD7O+X6zSC9V5HeAZJX9ibnhLT/AB3ugPZDckmIimu4haY6QBFLPGAwS/BB64MY
	FCYwzR7wlDmWdVwu4LPNPOO5LWcCbJstMGLiSgjGdWnqXKGFX1C05xukx0Q5QXiXrlS9cNof6Xk
	TcyWQ33r6oBrWD5Kb+wvIpVZbTowXWh8gOfBN6ZDw54kPpIwGhRDyozmPFlLRRsUI5VkJHmdSLh
	TVoPLB/ttslFUTM8m3vCQ0yCvw+FlWecKJGkaKQKRWJUvOpclphy4vHlAi4QMVCS8ru/HkFrr7M
	C3Zp8kMMdNlUWkOqtoAG+p+DZFGLkEaHSwpFuPtVuHnr5efIexbrHRVOtcNPKAN9EZMqQOqnSH2
	UR9YgRpgyhpwOV91JMUa35Nv+Ukmuq/9U6UqogkARK3137Yy3A==
X-Received: by 2002:a05:600c:698d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49cf4e14cb9mr86335745e9.16.1788455284516;
        Thu, 03 Sep 2026 10:08:04 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:04 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in
 SGMII mode on Toradex boards
Date: Thu, 03 Sep 2026 19:08:00 +0200
Message-Id: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCpmWoC/yXMQQqDMBBG4avIrB2IU7ToVcRFmvy24yJKkpaCe
 PdGu/wW7+2UEBWJhmqniI8mXUNBU1fkXjY8weqLSYx0pjfC1ntGQHa8rTEL329tK53tMYujUm0
 Rs36v4zj9nd6PBS6fGzqOHxKkxIZzAAAA
X-Change-ID: 20260902-add-enetc-port2-735526a9ef2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_100807_093903_39693686 
X-CRM114-Status: UNSURE (   8.32  )
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

Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
is connected as an SGMII Ethernet interface.

Enable the reference clock on the modules and enable the PHY connections
on the supported carrier boards.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (2):
      arm64: dts: freescale: imx95-toradex-smarc: Add ENETC port 2 in SGMII mode
      arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode

 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts  | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts     | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi        |  7 +++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts     |  8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi |  7 +++++++
 5 files changed, 58 insertions(+)
---
base-commit: ff1bb9ccce43cd06c766c3ddef796a7e40e623fe
change-id: 20260902-add-enetc-port2-735526a9ef2c

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>


