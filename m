Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A8FCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6xgaogVQKQX2VRV+ySbrwbZYS0YU53xZ1QdE3tIb0k=; b=KFYc978n9Ver4cwTl1FBrZjq5t
	DxGkLxlko416XfOm8Sh+4tZeg4XZfcUXgP5Ta58n/opMQ7ckuNERD0HhjYlbrFLw/tCOXkVyScakD
	ydtNVWU/wP2fs9izEk17MWPXIa0FYizfM5mM6Zt7DlRFubSl2ZEfaltOPiEk4ptbWUho9DVadRnmN
	/kRsT/fGNqLwcmeiEw0SrvvO5pTkxn6cDMkpiXTEPc1hxPDs0JmpoMHQRUWc+51rQMTMeZMTaB6oW
	Z724jGebr0hN3jCiz77/mFjBkg4MQl6879vFVeXA1b65kGR1sE3ydvn9tI7h/MC+z4O6xVbq5HXBh
	kQEZGrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXak-0000000Fpa3-4AwH;
	Mon, 08 Sep 2025 08:51:14 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWpd-0000000FYAH-0Z3q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:02:34 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7725de6b57dso4757010b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757318552; x=1757923352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6xgaogVQKQX2VRV+ySbrwbZYS0YU53xZ1QdE3tIb0k=;
        b=d1qe8gZheR7xqyVGcfMCS1MXjoHOTJwaI8jjunyuzUDmX0h00sntYoRsm8e7C3WuN+
         B3jEZFEVPcJc74la9FT2hunHK/ZjDxKtTt3D6O5ZU/Fr5RY/QgVUfC1G+gi9JnW8VQCo
         Si64Dj046CJaIpGpnNdKRsaq+cxxOYWZCMJSgSvGWO/3iP2VaGOEQAk1GYTbdWqi6539
         GtRaVdRs0jeY1eaMBOQiI75UWSzE+jBgeE/dSBxO9VDA8E9IhZBqKnNTcPuD7kU7OYK2
         sXNIsYNHhdRobEwo5i6i2lcN1/tOtWvML+3Qc1EmftqOcObyJFPw/E1gLvuNjsLOkyxw
         d5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757318552; x=1757923352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6xgaogVQKQX2VRV+ySbrwbZYS0YU53xZ1QdE3tIb0k=;
        b=AT8VomJ/jx9cV73CZpZ5ZN+tkYFQyIRNzu+UfEAw1fUArS9gUkqF05P5GdfYFs9Xtl
         V7ZH9EEsZYewmPdj6/kSIMd9Y7OD+TqYzTjZijvv9rcBq0mYsr2Yu4PnKCT6/Mc3uGG9
         f2t9nLqyIzI4q2oeY4mFysK/ZCduW51FoYKYcQ6Yd+0w+20yB40EUHR4g61BJPvP+NeJ
         D8h2QvF1gLOADqqHViUssKxU2RlO7vegUhf3F0HIr2En0aobU0nPxZ5hygSB594Out2t
         QNWkJVUAR05fwf7FhHjDTbDQAcEphT4VKvwNp6bJbCkxFhpTyT91HbL8N1h08ofxmXsJ
         UVeA==
X-Forwarded-Encrypted: i=1; AJvYcCWa2zM/N/2wV2Xr5DZ4l6AdCaMHRqatpeZlYfYkG/Sj2XGhhJ5HX1aiCAYECSrRP8ZIDnFTWQiPptC2xsazVHjs@lists.infradead.org
X-Gm-Message-State: AOJu0YxGU+98kJZ0HuRFXv8UWpEL/fA3/ETsnlxPKuf3yPPJXHMunUFn
	HqXLXSYV5PnZLXWwxujeSfWsitro+08/bZRHtnHAoVG8rwCQ5hMhYWUD
X-Gm-Gg: ASbGncsY9g1rFS96eocAYU8GtXZN3TfPw5YdSuDf7kIkQc+AUnR96X1vYuYdavlZyIp
	5ikihYoXB/Xb5/J6o0uK++nCcuIBw/U1X8MY/l/lZCdFogLUll92IO0aBrFnwnjObnuigleIq6D
	7smZVFPP3Q+WyR1jJju0kF6Uoago3FYrSzzPPt7WgyBOD7NvekDSlhOxuiZZVNu2MaWTxZcb3sD
	HNFf36QteSIzAHojKaGSqOSd1h0bpdIiIovzUiBfzODpyWNqva/QHG2aXXXCkV21MD0HlSz7idJ
	gX+OiWTtacqocTxWZat21w3r7vyefpvERhyoKzU9fY0TUyqO+7eM7d3ltf8SYgpya/6ctgX4RWH
	UDVYYrQD4WqKdAc0/PPeh+QxhqY32glGCC/UAQn/jvIMhSUJyAkGD83VY/K4AFYzCs10bZu5D0r
	SQGK5XWATr6M1v2xOigl4xiuPFVWR6GB+I252NuAypdOhUcx4mCEvUy9Ft4roEEvWcCIk=
X-Google-Smtp-Source: AGHT+IG/RzH8Pp7y0ft2xmHf4XmY2h/VHUbNeQ55YY0ob+wos3GdVYgnpsB9e0HRduW0lDHzKpD69A==
X-Received: by 2002:a05:6a00:2e11:b0:771:ead8:dcdb with SMTP id d2e1a72fcca58-7742dda40e5mr9781984b3a.8.1757318552056;
        Mon, 08 Sep 2025 01:02:32 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm15186600b3a.9.2025.09.08.01.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:02:31 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
Date: Mon,  8 Sep 2025 16:02:13 +0800
Message-ID: <20250908080220.698158-3-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250908080220.698158-1-fredchen.openbmc@gmail.com>
References: <20250908080220.698158-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_010233_173204_D1398EEF 
X-CRM114-Status: GOOD (  10.53  )
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

Add the mctp-controller property and MCTP node to enable frontend NIC
management via PLDM over MCTP.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 2f5712e9ba9f..a453f8dc6b36 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1248,8 +1248,15 @@ temperature-sensor@49 {
 };
 
 &i2c11 {
+	multi-master;
+	mctp-controller;
 	status = "okay";
 
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
 	// OCP NIC TEMP
 	temperature-sensor@1f {
 		compatible = "ti,tmp421";
-- 
2.49.0


