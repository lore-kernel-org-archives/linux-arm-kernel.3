Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B00CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sET9CEszVQFsTQEBjINbwDd749FE6ul7+R4eIg2DXlM=; b=bEWzSv9jqDZxFKKpH+s95lasan
	DByRQGJ1WWrjJ+IEugbiJAvEiQKIcCVAHYKejnPhLmBcGk9JNdbF7Sm2xoP72Xbsea5JteuWdksOM
	OVd2U9jEREyBqoCxUCtKSQInRsuwtkx4d6lEcO3tJX1knFBu1aLJvEmEtyxxKnNT9FyA3HmrRYv+P
	jL+hGutmzMiCfhKr/yEmSVhYaDp0TYMcRdkGX4TwaehLyGgWJJV9cMh4etUbsDvE5M8A2Y/TOLjRj
	doRtgFHATXtLTD1cTX1nlIHCm6Ubv1gZRJEcbQTUL8dC67v1DCwead6/RvRlmZ+3tOeD20ZWPaNXN
	fhrTzF7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3D1-0000000B20q-3jJI;
	Fri, 26 Jun 2026 09:50:51 +0000
Received: from sender-op-o11.zoho.in ([103.117.158.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3Cy-0000000B1ze-2WU0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:50:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1782467420; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=RmUS6VC7km4sAsheGaE+ETBO5oS5aEH3fyaG7G5XXqDm6F/nVQXeqA1+ozTMeVgDMeWJLnCpoXpafGaTvClsKckdqSQvPyYAWyPKqg9sALGq5vR5bWvqPRiCrugMYQgX7eqn89vVD4mYbsajEg4UgOFzQ3peVPwGd48hXs7g+PI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1782467420; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sET9CEszVQFsTQEBjINbwDd749FE6ul7+R4eIg2DXlM=; 
	b=H0ln0DFzGyDl1PwJVQeaqazdV4RPBFG94KffCC5PSOsSHdNJA3xdkNF86TY1PlzeYO0q9gEsKiu2sXhUPgVWtaHdG2cpZB5GST/zMRVfwnxzNxNpFolNbc2y5RiXfc/tqKr+G3WYG/p7lF8LEEKUsiyKdbCBp/f0CbiXpZ5wz3g=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=rebhu.com;
	spf=pass  smtp.mailfrom=shubham@rebhu.com;
	dmarc=pass header.from=<shubham@rebhu.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782467420;
	s=zmail; d=rebhu.com; i=shubham@rebhu.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sET9CEszVQFsTQEBjINbwDd749FE6ul7+R4eIg2DXlM=;
	b=rgjH7fgq2WWXDhMRgQ7nf556xTWh9TOcZXvObvzfQS/RHC/8i47lyXDxJoWnCtlr
	JcEgRfDQvSj+iRbzKGAVR1BCp3Q/oYfzoZ/zdAzMKHWWprmq+yURG0Aw6G0yTEMkeAZ
	6AXj2FxvOsFtLsTFwWnWOU6ikQbtdLBdcvC77Jzk=
Received: by mx.zoho.in with SMTPS id 1782467418005855.6222380842893;
	Fri, 26 Jun 2026 15:20:18 +0530 (IST)
From: Shubham <shubham@rebhu.com>
To: tomi.valkeinen@ideasonboard.com
Cc: a-bhatia1@ti.com,
	afd@ti.com,
	airlied@gmail.com,
	aradhya.bhatia@linux.dev,
	conor+dt@kernel.org,
	devarsht@ti.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	j-choudhary@ti.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	louis.chauvet@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	nm@ti.com,
	robertcnelson@gmail.com,
	robh@kernel.org,
	s-jain1@ti.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	vigneshr@ti.com
Subject: Re: [PATCH v3 00/15] drm/tidss: Add BeagleY-AI display support (and some more)
Date: Fri, 26 Jun 2026 15:19:56 +0530
Message-ID: <20260626094956.243978-1-shubham@rebhu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_025048_940421_B84A33D4 
X-CRM114-Status: GOOD (  12.63  )
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

Hi Tomi,

A big update on the Raspberry Pi Touch Display 2 (5-inch, native ILI9881C
MIPI-DSI, 720x1280, 2 lanes) bring-up on BeagleY-AI (AM67A/J722S), still on
Robert's v7.0.x-arm64-k3 tree (7.0.11-arm64-k3-r20): tidss + cdns-dsi +
cdns-dphy, DSS = ti,am62p-dss (dispc_am625_feats).

The earlier "tidss comes up before the DSI bridge is added" problem is
resolved (cdns-dsi now adds its input bridge in probe, so tidss attaches it),
and after fixing two more issues the panel is now alive -- but I'm stuck on
one last step and would value your read.

What is now confirmed working
-----------------------------

  - DSI-1 connector is created, tidss initializes, no probe errors, nothing
    left in /sys/kernel/debug/devices_deferred.
  - The panel is ALIVE and initialized: a DCS read of GET_POWER_MODE (0x0A)
    returns 0x9c (booster on, sleep-out, display-on). So the LP command path
    over the cdns works and the ILI9881C processed its init sequence.
  - cdns-dsi looks healthy while a test pattern streams:
      MCTL_MAIN_STS = 0x0000000F  (PLL_LOCKED + CLK_LANE_RDY + DATA_LANE_RDY 0/1)
      MCTL_DPHY_ERR = 0x00000000  (no D-PHY errors)
      VID_MODE_STS  = 0x00000001  (VSG_RUNNING, no error bits)
      MCTL_LANE_STS -> clock lane in HS
      VID_MAIN_CTL  = 0x80A0FE00  (RGB888, packed-pixel DT 0x3E)
      VID_HSIZE2 hact = 2160 (720*3), VID_VSIZE2 vact = 1280
    cdns-dphy PLL locks (no "Failed to lock PLL").
  - The DSS is scanning out:
      modetest -M tidss -s <dsi>@<crtc>:720x1280 -v  ->  steady 60.01 Hz.

(For reference, the two fixes that got the panel this far were: nesting the
DSS port@1 under the controller's "ports" node in my overlay, and correcting
the BeagleY-AI MIPI mux OE polarity -- it is active-low, and the data-lane
mux had been left disabled while i2c still worked through a separate path.)

The problem: cdns data lanes never transmit
-------------------------------------------

Sampling MCTL_LANE_STS 20000 times while the pattern is actively streaming
(modetest -v at 60 Hz, from a second session):

  DATA0 states: {'IDLE': 20000}
  DATA1 states: {'IDLE': 20000}

So the clock lane is in HS and the VSG reports "running", but the data lanes
are 100% IDLE -- the cdns is in video mode yet never emits pixel packets.
The DSS VP does not appear to feed the cdns DPI input even though the VP
timing generator runs at 60 Hz, and the panel (correctly initialized) just
shows backlight, no image.

What I have ruled out
---------------------

  - Videoport selection: I tried the DSI on DSS port@1 (VP2 = DISPC_VP_DPI)
    and on DSS port@0 (VP1 = DISPC_VP_INTERNAL). Identical result, data lanes
    IDLE in both.
  - tidss correctly treats the cdns as internal: the bridge of_node
    compatible "ti,j721e-dsi" is in tidss_internal_bridge_compatibles[], so
    dpi_output is false and it does not touch ti,am625-dss-dpi0-clk-ctrl for
    this videoport.
  - Overlay/graph: cdns DSI_OUTPUT_PORT=0 (panel) / DSI_INPUT_PORT=1 (DSS)
    wired accordingly; panel attaches; no -ENODEV; VID timing is correct.

Questions
---------

  1. On AM67A/J722S, what internally connects a DSS video port's DPI to the
     cdns-dsi DPI input, and is there a clock/enable/routing step (beyond the
     DT graph and dpi0-clk-ctrl, which tidss skips for the internal path)
     required for the DSS to actually feed the cdns?
  2. Which DSS VP is wired to the internal DSI on this SoC (VP1/INTERNAL vs
     VP2/DPI), and does the DISPC_VP_INTERNAL path need any handling that the
     DISPC_VP_DPI path does not get?
  3. Any reason the cdns VSG would report VSG_RUNNING with the clock lane in
     HS and both data lanes "ready", yet never drive the data lanes (no pixel
     packets) while the DSS VP is visibly scanning at 60 Hz?

I'm happy to share the full overlay, dmesg and register dumps, and to test
patches.

Thanks,
Shubham

