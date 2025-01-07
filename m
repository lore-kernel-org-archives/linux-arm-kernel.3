Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF9DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PcRc8LgBBacdtMgCc7Ma6Y3V6HlZ1g1g93eqellQlQc=; b=MBKvihJkr3BUNMjeZd9/DBv8M7
	DqSuUXKKe85lfPGFynJByMC9cvymY0eKHeGn40+k3HmTt3d5A6+Ca6WRr195NRzU1XLhnn5mJc9s6
	sqtYdetKcH//mK/HhM2Tq74R9D7kOxpz1FFC7ZLJODIqBJo60gy5meQe+04Z3S4Xye3EjTFBpiFUL
	K6fDfpGkkjE+QIJ7e6P0OwERHdST//M2VLcpKeYa2qn1c5oIlXjpppsUBxgXoU7gtShQvxqEliAff
	xKKLkmJru6IoPOVq8OIuAVc8UEz+6+mvQ+i6tZ4egRe08XWKl5DCLO+Cs1ywFkm+9odz70VTkW74t
	TYMZZP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6j2-00000004JhR-3o91;
	Tue, 07 Jan 2025 10:22:17 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Dx-00000004DGw-0976
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736243409; x=1767779409;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PcRc8LgBBacdtMgCc7Ma6Y3V6HlZ1g1g93eqellQlQc=;
  b=hxIdWlofYfaIV1ZF1LAezJC4EyNF+VZKP3Qpk6Bkvw022l9XB/5C3e5b
   VgtLYA35/bAsibJrR3JAVRtq864sXbi49djPD6O4XTW2rz3uvnCjLm+An
   A2RdUVu5A0RnoGhTGF6yqd2MBoQTLd9wlEeS7ekYuq+pVRfrl2sn9pSpb
   elEvBZ7HjM1T1gj3sPWQ8XTHD/vhGE9Hgl5PgtgokkQJxt0Z8keBp2d48
   iK9p0StqH1MfijBxscJpHLjcnrXyc0v7QKnKm3XHRu9uwfEa8YgZjBMWW
   IJTa/r8MmfyMEUc+VESoCdwXhAQUr1alfSYbG0+0vd0UmzUCXvHdTUUBv
   g==;
X-CSE-ConnectionGUID: l89s+UkTQN+ueLLX4NvYZQ==
X-CSE-MsgGUID: K6k3wwvwQbaOpsw6apa6vA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40889014"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 10:50:05 +0100
X-CheckPoint: {677CF8CD-13-1647E5E1-CA16D1A6}
X-MAIL-CPID: E34F364A6D90C75BD1DDCF5165584C53_2
X-Control-Analysis: str=0001.0A682F27.677CF8CD.009A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 225FC163FA3;
	Tue,  7 Jan 2025 10:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736243400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PcRc8LgBBacdtMgCc7Ma6Y3V6HlZ1g1g93eqellQlQc=;
	b=LLx2ow89MHuHd9LpAlM4yq0HD29ldcNyTMzcvUSFhgjGBjiN+6zBw6XtgZGQrJffzZZX2k
	Cl5gh+qHs7IllTCWcOnlCGen5amj0/s7x0HVs6SyAecQ11yHLIC+QrGngkRHkU5jx07S6K
	uR1+txFkYrxxSECqiEMrqbdND7BcOd1ZjDoeEjYlSMfQF25pioOqHbss7tZI3jIz1Z+ia7
	uua1HxPKNH5asorsbOah3i4P5vJku95aD1HCfVXbd+XdwyO2sV16mdPffmAAwdu5BcDEVp
	ynixKC1yEclGFixz4SE+6slCjYMLy2uj+qKU8ajpCSVfyMKXOdQ2vBcpBYX2Hw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] i.MX7 DT fixes
Date: Tue,  7 Jan 2025 10:49:40 +0100
Message-Id: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_015009_576144_AE9DDC7D 
X-CRM114-Status: UNSURE (   7.77  )
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

Hi,

this fixes two dtbs_check warnings by moving the video muxing node out of gpr
and adding a new imx7 specific DSI compatible to DT schema.

Best regards,
Alexander

Alexander Stein (2):
  ARM: dts: imx7s: Move csi-mux to below root
  dt-bindings: samsung,mipi-dsim: Add imx7d specific compatible

 .../display/bridge/samsung,mipi-dsim.yaml     |  4 +-
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi          | 56 +++++++++----------
 2 files changed, 31 insertions(+), 29 deletions(-)

-- 
2.34.1


