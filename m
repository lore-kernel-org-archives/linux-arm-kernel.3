Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51C3C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 13:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xq5ntvdixTiMxw1S/ZM1ceyovGwDVcIx7hfQrpd8SjY=; b=R0qHSDdcWGCc5UIQJ4bQUWpYYx
	egPYTw82dQmOZfqYM0OlQGEbJUqYE4xApH518hImYXnyzBQ+aFmuwXMtFChaJm97yNvPpzhJju89q
	clFaGwCSVu6UkM649LXN4Pj/EZX60PCFiYPsMDzjCUVjwBlgEqvBk8Q30vDagzsVxF7jM2+KCztBQ
	fqz0j/3S4eSXRpVUvN7utXgywtVD2hp43tOCavCM8NHkyyPhIKh7Xq3XaUMtEFjFWHylSSTe/8ZWq
	jAp5A84CQFi39ldLLDQPPlZwcec/vCWAmw1wZ9scG5w2KD+jJgd8thO9X6kioTUnuT3SWIyPvONHh
	3sjvvgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUD3-00000008oSZ-10a7;
	Thu, 30 Jan 2025 13:03:53 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUAU-00000008o2H-1lma
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 13:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738242074; x=1769778074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xq5ntvdixTiMxw1S/ZM1ceyovGwDVcIx7hfQrpd8SjY=;
  b=Y2LkQmdGaNrplHQX9ALcSaq9RzFjyomXHXXFKvGwPp6HHkdAyWw+XFh0
   0wMzvCDr01WEu5caLGoJw/qqKhmI6dOP8ee/ngiVXXJkZeuVKbQrIf9CK
   NhCZZ9Gn6aNwfUGcAoTmJbGK3ykk+9+d0OtMIadAR69qmch0UMSA1xlV9
   rLAqb3HOWHHnvjZks2ktGfD12BCUGXeHRbso3kkvVI9ktkCBC8+MTwAdE
   Yxh5YUlR9y3N732X/5lLkYY4BSIDDVMzW+nb744gWewHvLqYcKWK/V/42
   qW+5VYHEluRgIdHMrtlVcRgNhfI5WtJHd/83gHBMCJhF4KeLMy3+KI2cO
   g==;
X-CSE-ConnectionGUID: Xpw1lbTSSA+LmV+tlAdbqA==
X-CSE-MsgGUID: Jg7Qd6jUTN2CIa1azzepQA==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; 
   d="scan'208";a="41374598"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jan 2025 14:01:13 +0100
X-CheckPoint: {679B7819-39-31397509-E321C4C4}
X-MAIL-CPID: 9BA95ED871756AC7173E720217D157CF_0
X-Control-Analysis: str=0001.0A682F21.679B781A.0002,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 141261675B4;
	Thu, 30 Jan 2025 14:01:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738242069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xq5ntvdixTiMxw1S/ZM1ceyovGwDVcIx7hfQrpd8SjY=;
	b=UR1yUV+70I+An2YmuusWORYL4BjlpiS/BTwBrJNm/+PFoMO9bDCS9TKCI2EMrLOBBHNhFo
	rYWa1E/gvtMOEcDdLpSaRWOYZwM2gpm+fM/q0bR98mVFPmf4bGKRZMBH7hoJhZdLPslodI
	SOOt31ld5pQa1rTVVysSFN3s99mD75x6zn9TE4eX8Q+UFisk/bE8oX6grAgpo26rttsikU
	RJ1Ly+346pXDyUqVWjBG2EcX2mrIv2NBBK7XrqM0HCy79RrMMTGKRsj1cIwqMrf+8zCQBc
	+8IL7ffBGiKcmRznMDIejAMqPvt/8r3VMM/27R3lpvmKlIAXl9CGmMnKBSjMsw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: nvmem: imx-ocotp: Add i.MX8M Nano access controller definitions
Date: Thu, 30 Jan 2025 14:00:58 +0100
Message-Id: <20250130130101.1040824-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_050114_763957_396237EF 
X-CRM114-Status: GOOD (  11.20  )
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

These are the definition for the bindings of imx-ocotp for disabling
fuses.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h

diff --git a/include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h b/include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h
new file mode 100644
index 0000000000000..6e554edefd488
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX8MN_OCOTP_H
+#define _DT_BINDINGS_NVMEM_IMX8MN_OCOTP_H
+
+#define IMX8MN_OCOTP_M7_DISABLE		0
+#define IMX8MN_OCOTP_M7_MPU_DISABLE	1
+#define IMX8MN_OCOTP_M7_FPU_DISABLE	2
+#define IMX8MN_OCOTP_USB_OTG1_DISABLE	3
+#define IMX8MN_OCOTP_GPU3D_DISABLE	4
+#define IMX8MN_OCOTP_MIPI_DSI_DISABLE	5
+#define IMX8MN_OCOTP_ENET_DISABLE	6
+#define IMX8MN_OCOTP_MIPI_CSI_DISABLE	7
+#define IMX8MN_OCOTP_ASRC_DISABLE	8
+
+#endif
-- 
2.34.1


