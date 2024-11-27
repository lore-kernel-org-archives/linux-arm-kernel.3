Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280C8D609CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpRTZD3rQ6fcXSI3x3w5V3GlJGBpXq/aq88YWpZoftc=; b=2Jxzgf/T2YP4AsBdOEriKtU/uO
	/kBo2I6AJPK98vnyZ8bRy6Kwl7y17CF2MhidyXNDo4GSDk5VP2DxrqCzBub9b2C5aoQZ1TNQFRZVG
	0NSFePEXr2vhaBbstn9+ax78fNDlmqYqsGHWAA7vVYhhcIajYPMuxlICeLx6pa574hdh2Fk6iltlx
	zFT1ccNgr6lj35oKIV0iIGFrmkkalSbGntQk++mYzvDLL9PFWvKmyoaw1PEFy0NfmMWrx4gfg+013
	9ymn/WJ1kbstBn+jUjcE5CYZAW6E0XIiGCB2zg3ha6h3/NZnSov8Y33+6dZ5HpyeCX3Fc770j55ar
	7YWyEbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFPX-0000000CsDG-28Tj;
	Wed, 27 Nov 2024 10:36:43 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFK9-0000000CqyG-3Yer
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rpRTZD3rQ6fcXSI3x3w5V3GlJGBpXq/aq88YWpZoftc=; b=ApVr8M+KE8vU+gn1q1aC7Yityx
	sc2dSDSVljqDpPiLxEuKKjC56nYdwV+6qQEr77t98vVZDzEMonvqIViilqBtQ7SPHE+R5qA/4aGn1
	FCz2gvHkJPXDbhhz3O1mjgBZVKTByGb/Lsyk5vheI/OZlMFxMP2slbvwgAG2icK7io4ZmQJKVjCt2
	9jpkHkEhbYTkueW9W0aZLCuZQFbXaHtm1EJds5gVT+66khGh8PLc/BHaG79e0LcCuVwQy3wFzMM+s
	raW1Kme0Yw+IKP3nCRg5VMcmOxsncUJH3kg2J41NtT0VZKFztl3VqZMP9e1OW2794Y/opJTmNk+cT
	OuW3tWDw==;
Received: from [89.212.21.243] (port=49750 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tGFK9-007Rx6-0K;
	Wed, 27 Nov 2024 11:31:08 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set custom lvds_vcom
Date: Wed, 27 Nov 2024 11:30:31 +0100
Message-Id: <20241127103031.1007893-4-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127103031.1007893-1-andrej.picej@norik.com>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_023110_058705_DAF0C107 
X-CRM114-Status: UNSURE (   4.58  )
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

Set custom differential output voltage for LVDS, to fulfill requirements
of the connected display. LVDS diferential voltage for data-lanes and
clock output has to be between 200 mV and 600 mV.
Driver sets 200 Ohm near-end termination by default and since
LVDS_VCOM_CHA_LVDS_VOD_SWING (0x19) [3:2] sets both data-lane and clock
output voltage we have to set the register to the value of 0x0C (0b11 <<
2):
- Steady-state differential output voltage for LVDS data-lanes:
  min: 300 mV, typ: 402 mV, max: 511 mV
- Steady-state differential output voltage for LVDS clock lane:
  min: 234 mV, typ: 314 mV, max: 399 mV

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 .../boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index a9de42cf14be..709b555ca753 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -179,6 +179,7 @@ port@0 {
 			bridge_in: endpoint {
 				remote-endpoint = <&dsi_out>;
 				data-lanes = <1 2 3 4>;
+				ti,lvds-vcom = <0x0C>;
 			};
 		};
 
-- 
2.34.1


