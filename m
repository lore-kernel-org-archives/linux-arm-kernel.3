Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F490C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVN//MuR4wm6RUmqVn0fG6wm0+/9v921P5UHDogrHwg=; b=H45mWIzju3Kf0H1MitNqBkIHlr
	8eOoE3RoApP6YStXn6ZJNL/pVGnh0h9PruYVPjWR7y7orxe01v9BNdJUbXHxQoqRfi1x72++6IlQF
	zLJmrzf2ULrEmzxPvg1FhO4m7AtNi8Ce4rUg5OWe8P0Uo9IdTqNzjLgrhsBhK07PTTtW/u7G2SuMU
	dhb6eccj0brSPS/raVRH/7+uuPD8hFvofD4Osjmnc2ZTGHifb52cfzOZHQV7c7jXf+M/Yk7vNMtwJ
	c0tLTTDxoXIyOYmfoLJUjwDIeBgGX9WSNA6FgZergnOGAmU0EQsuIN5OFXa7ZNQUiOjM123LGGaWH
	m6wh5NzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Si-00000003U5N-0Mnk;
	Tue, 08 Apr 2025 09:41:44 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Ir-00000003SBw-1RTM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104693; x=1775640693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xVN//MuR4wm6RUmqVn0fG6wm0+/9v921P5UHDogrHwg=;
  b=ZlVAHDJ5zQ+hf6gOcaZ9lPzF2Z3z8D2zNlV+SLr+7rmhqyCs4RdN8ZgA
   0iFRnp20ho75OlPpeU4T7Wyu5xVSawHvoRGsliAP2y3zWFSEwpl19HkgJ
   iIFuvvdAIp1buK7PKbqd7HqKHkGrir/Td7vu7zANPORlLJyMliEyD4P38
   PRi+k9GpdAlcPJ9BdIk6L2PmV3GTIKtMzo/5B4G2kjN8OfBsbmaXrUb1v
   IEtTl9JjFQMAD7acoE41Oly2pT8y+HdP8FybOZBe+/EXSlkkh5MrNynyg
   7L7MeZFlDZif0Olft/E58ceo+B2kWw3pFDggSRwWqzQfVeHKtrAy/sRr+
   Q==;
X-CSE-ConnectionGUID: ynzVERnIQKmWPsPEt8TdYg==
X-CSE-MsgGUID: 0ibdHDc9Ta60iCwm60/znw==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397369"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:32 +0200
X-CheckPoint: {67F4ECF4-19-2417938-F0170C2B}
X-MAIL-CPID: C7C12BB62A1A0985F39A56B6586A990E_2
X-Control-Analysis: str=0001.0A00639A.67F4ECEF.006B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A53AD169635;
	Tue,  8 Apr 2025 11:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVN//MuR4wm6RUmqVn0fG6wm0+/9v921P5UHDogrHwg=;
	b=Z5562KSnIZtr6IocODh6/+XRXyiIs7RhQvVrNwFTpj9ss/L/yKT9mFtUb0dd5VH6O68e9w
	6I8rWGkt707mn4pwOTHIpybPi8HJz7tU2L8IJEJMJl644Az71xMYKE5YZfEiM6ljE6/tDX
	3BlqjK3A926Gu+bqSOYF24LvGiIZAR3cvwwmMnSyllbTLg5TTRbNL+lZjp/jToPYKGGwN0
	ix2QasvSfKhSQIqb0Y8tCH6JWHS/m4eOpFLNiZmI6bmiR06aM7c/RgcV+Uo1U4hyd4669c
	VAahsrY7Cqpz8+zDuWM2RMVpFbRJw69d0O/LrpqL/mWOczw/h91yqeRkNwaFug==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 3/7] ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
Date: Tue,  8 Apr 2025 11:30:50 +0200
Message-ID: <20250408093059.551700-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_023133_682836_13095AD3 
X-CRM114-Status: GOOD (  12.72  )
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

This add an overlay for using the RGB-to-HDMI bridge.
Note: As DDC is directly connected to general I2C bus, there might be I2C
address conflicts. Hence not all displays might work.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/Makefile             |  3 ++
 .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso

diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
index 14759331dba24..225a7665b8ad1 100644
--- a/arch/arm/boot/dts/nxp/ls/Makefile
+++ b/arch/arm/boot/dts/nxp/ls/Makefile
@@ -6,3 +6,6 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-tqmls1021a-mbls1021a.dtb \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
+
+ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
new file mode 100644
index 0000000000000..e713a2ecbfc25
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&sii9022a_in>;
+		};
+	};
+};
+
+&hdmi_out {
+	status = "okay";
+};
+
+&sii9022a {
+	status = "okay";
+};
+
+&sii9022a_in {
+	remote-endpoint = <&dcu_out>;
+};
-- 
2.43.0


