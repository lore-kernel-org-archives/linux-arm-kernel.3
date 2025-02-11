Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40E5C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RFb9A4U5YyWgy4kzIOhyisia7n5ROq1RTJWpcRxL5s=; b=TFFTaKOuZ3G+fUTGJlNBELAWy4
	tEdaGnDlspYr+zpb9Cbi59CDqwzfyZgSIoNu2I8KjunQoID3l7OUSamBXuSukUPkJHuZ29HusghIg
	sH4Af+kqTZ0gS0eanatsqkoait9XFMIg8zOTxpILXe2cs/7DXP+t1v/TSU+U3TOyXgw9Y6Ubz7uJg
	hlQRYwbIHdd3noBcI6VhuB5kaTTQFcUqm1vbhtd8UQplfQdGKeXbgCixH2javrulg2KywCUMvCRIU
	Vvc9oJSMTE4pXrl+uQ5L65WFNw4F8U1Dr+W4cU6qL9RbdAmra0FrR6H4ksYjShj/0x8YAGLLDW+BP
	ffMjTchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlsd-000000032bM-3e52;
	Tue, 11 Feb 2025 08:44:31 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlpx-000000031tN-3553
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739263305; x=1770799305;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4RFb9A4U5YyWgy4kzIOhyisia7n5ROq1RTJWpcRxL5s=;
  b=ht7rhN1wGPmaSIziOsfJ92apUZPnQWhr0DndaHsbSyQt3pe+PAEnrMTl
   MsBGyaFDeZhoUv4Ud6shZ0NYvVRVMe0vIPqNM53Cfy93Tln6bn7DH2AfI
   0VJ9n3u/f8zeQGiHPP048y6n8bt65WdYFak+32PvpVzsMFBKvhYMX+iTD
   BtPGBVBc6DaIoc4ZYLLPcsaok8mJwhJUsj7Zwb/0Wqe9bPDxceNGoivDK
   bycpLgJYLzMA5pzdO9Xu6X+Od1uPbefcs3VzxEp60lCtaKmNfsFefFGZI
   gKGhTnKJOlBCgDd1TC7wE7+Izai8OX7Qw/XwyMINwFrnFFfdZqJiqPrZE
   A==;
X-CSE-ConnectionGUID: j0tyI7jSQeGshznAOusVTA==
X-CSE-MsgGUID: emYshl8GQ1aoyScGBzvbtQ==
X-IronPort-AV: E=Sophos;i="6.13,277,1732575600"; 
   d="scan'208";a="41744827"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 11 Feb 2025 09:41:43 +0100
X-CheckPoint: {67AB0D46-30-28232521-C0C2250B}
X-MAIL-CPID: 63B22B090640647039E5A23306925933_4
X-Control-Analysis: str=0001.0A006378.67AB0D47.008B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7738169B35;
	Tue, 11 Feb 2025 09:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739263298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4RFb9A4U5YyWgy4kzIOhyisia7n5ROq1RTJWpcRxL5s=;
	b=ot8Ty0paEoLYoZcqnTi134PC18byiWn8/CX977l0j/Ul36QedKf2kiEDwDMSjk1wi6eHek
	zWicf2skVWKrnZ2mH6Ebt/oF9XK/W/lyJ88XQ1x45QDUFGSu1AuyMYnAeFygYGjpm83v6g
	X/KZcf280IJajG7t77cPMiSTKUHWKjvc5DeHNo2TW+iHJ1lzOIu1jfuaUcZEgtfhGZZf+x
	BGJJLdR52obnjKWl6Ee2RUiMjaj55EQ5VpKsYwU044Zbu6Sa0A3g1V7Dn8Qu0m4Ys6Xlvx
	Vi+F5JKWtaJFnXJ+IsL63iR2gC6NZcZtgkhhg0fMfcPYYGOWTcM6m5xci9rtJg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] i.MX91/93 parallel display bridge
Date: Tue, 11 Feb 2025 09:41:17 +0100
Message-Id: <20250211084119.849324-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_004146_269779_83E816BB 
X-CRM114-Status: GOOD (  11.33  )
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

i.MX91/93 support a parallel display interface. There is a single register
for configuring the output format. There is not much documentation, but
apparently this does some internal conversion.
Add a bridge driver (similar to fsl-ldb.c) for connecting a bridge/panel
to lcdif.
I'm a bit unsure about the name. There is no dedicated IP, according to
reference manual, just that single register. I would also agree
to imx9-dpi or imx93-dpi.
Note: It's only applicable to i.MX91/93, but not i.MX95!

Tested on TQMa9352 on MBa91xxCA

Best regards,
Alexander

Alexander Stein (2):
  dt-bindings: display: bridge: ldb: Implement simple Freescale
    i.MX91/93 DPI bridge
  drm: bridge: imx9-parallel-disp-fmt: add i.MX91/93 parallel display
    bridge

 .../bridge/fsl,imx9-parallel-disp-fmt.yaml    |  78 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../gpu/drm/bridge/imx9-parallel-disp-fmt.c   | 213 ++++++++++++++++++
 4 files changed, 302 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c

-- 
2.34.1


