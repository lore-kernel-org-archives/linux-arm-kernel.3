Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DC7C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIjCGhz8tLixz44uwO4xKNvBCCKp5RNzQO4yWFCNcHo=; b=qee+3QCaOafaGQH5c7hcWSmH8l
	S7YxdRp4U/1l0dvu9xVY5YvxptqxEkjOSQ/vHg8dQ1U4iWrqP5P0ou0C1vxHAJ5zp5gdc3AcWp/2P
	4mkOw5P5G5qKqzn6l/oFDKZuOEgkUrqjmE7E+B+Nv8TJyLeNE00rixczC/7tUqYUjhsoLRNityZki
	NrqYIS5VGRGaKNwgfgXsJMe90Ks3GnKalhUTIzypJDTHpxcYOP45KQhlotbNSdziyeCUDi2XhLQ+L
	Us7Y/zp8iiSa25VefD3gJArJ+/ROw/DPbT6wKW3Y9klZsu2Vs+CR69ylFuOmq+PgppLX2z/febvtG
	ekOJaSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVfR-0000000411u-0lbN;
	Thu, 31 Jul 2025 15:58:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTrB-00000003lk1-2t5B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:02:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b782cca9a0so800463f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970524; x=1754575324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIjCGhz8tLixz44uwO4xKNvBCCKp5RNzQO4yWFCNcHo=;
        b=V0SGR4rDAcw+v/X8pefCuvYAOXCQJGM8AjeHdiwWVT146UYqxNgme15amb3np/AVqA
         Iqecg/T6KvvzZOYw+mzilvtPJ1qENPJqavn2sUVLVn6CtujEXH14GHh6lpbBm+JxGgyZ
         wcFT2Vn1uy/7Q6qDBQ+BRp0ERZza5YmjKMV2r3H82a6dleFLOqla0Vy6Dx1Dp9M65+Oq
         OrgRIq4SSN/pV7PLyaVZLDtDck+lUZY7HypvafX+9mQrgocgCDjAxSdv4FEzwVH+eOip
         YpOdwHtcbI0oCFGk7Ys2T5lfNDgBcOd4jg1oIJg7oAhxTGcXEBl2GJE0pLz7V2dpdon3
         cHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970524; x=1754575324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIjCGhz8tLixz44uwO4xKNvBCCKp5RNzQO4yWFCNcHo=;
        b=jMu6mkgPQdoTibsoJRNO1FsCHk//tnwomoPLIpbeRC6RLM3LFS2csPEdBsIzI81Jel
         XUVPpu4qwk6P0//5c9gJEa8cLsEIp5sEAVIsjoR+AmnP2SB/HaYoHEXJcam0+9nHreE5
         UvYzLMTbIzzr+vKp3Avrqhpb7OKxZXmOket0X4j7c4sIb/QYIETCICUvhpQH3VodPAKc
         ZbWul5O85xmqIB70ofQnMUk0M8wmPC535Fuvq5A7PfGMzBy5MXla8ueFfvl60OD4A4lZ
         VM6UDdzj67LbVcA7OPJ53wbxBPhnqNZ0P12iK8r25+NCGlDKrpVh7gEcwrZTxoWl3975
         M0SA==
X-Forwarded-Encrypted: i=1; AJvYcCWTo6eXe7A+rIVdUBr3gbktaZhvQz6dCyf7YFSsanVgkN0ltiimSK9uaN/qd5bc3WokOXVwHDSebLE2iSCEXhwq@lists.infradead.org
X-Gm-Message-State: AOJu0YysCQQER8Z158N6vlozV6pVo0SjDkSGMC+yyHG1n72vLZ6gsD1h
	voTdGb9vwbOfIPWEsAYiANZgz21u6KLjkj0zun9PGEy/s7qeXt9DQUg4Xbc5mZq4/EI=
X-Gm-Gg: ASbGncsJ95Ww4vlWHPA327RH4mac1RpdVRK5aFX2+nhggTY9qADJeJAjSAqqCRARx+v
	oTQ/X84MfEdt6iG0OwSd7kCrbRiG23L2c9plILCQbPNjgYCyRyJ9CzdscH/6WejATcx9NBXwZx8
	b8GXQB0RjW4E3hqouJ411qtI+Em5VbWMK2o/qnwA6Zlvk6+p90oszdTJTv6bvPQhwB3z1LKWyV+
	zXbWV5PPIdwpzk+M+HBk7eqI56IwmBUGph84YniKnQyQUQzwBAMiGi4sofl+7RP9HM9gbO4x2/+
	UvPUospmi8OKKp1c3q1+7IW368FL10vDVU/D6OclUnq23nPBFOr6w1kyiYxbwbbetH8l8UcmsfY
	k/+biqZBLLPPfEm0wRNVCdRTW7iU17K2Dh9pV58Wy/ZsuWSAikwoPmEUOxjY=
X-Google-Smtp-Source: AGHT+IG/HsPKeTgglpnFos4WwXnhrkZuA5HfDzh0mWx5wGuKVHOsX/A/E/TRT6CmAsPxomm8vH7Xvg==
X-Received: by 2002:a05:6000:400e:b0:3b7:994b:8409 with SMTP id ffacd0b85a97d-3b7994b8636mr4606215f8f.39.1753970523586;
        Thu, 31 Jul 2025 07:02:03 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:02:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH v2 6/8] arm64: dts: s32g274-rd2: Enable the SWT watchdog
Date: Thu, 31 Jul 2025 16:01:39 +0200
Message-ID: <20250731140146.62960-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_070205_724137_CB6EF453 
X-CRM114-Status: GOOD (  10.74  )
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

The SWT0 is directly connected to the reset line and only one instance
is useful for its purpose. Let's enable it for the s32g274-rd2.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index 505776d19151..4f58be68c818 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -56,6 +56,10 @@ &stm3 {
 	status = "okay";
 };
 
+&swt0 {
+	status = "okay";
+};
+
 &usdhc0 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc0>;
-- 
2.43.0


