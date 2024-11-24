Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC0D68BF8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 17:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgvOPIVcmn/fCNeSBTscd2rg+Hh+ccfkLVCJnQ7wUH0=; b=JYjzlrsKoJAaXBk/iqvQcz0gqk
	basIFYY473hMpv3yqv8ObzPjNE3QVz3ppUCnrITKAsxhM5k4bKv7hDyTuOg3r+WT8VF8Jrzjmh4xu
	uqEberEFH/oPFSXpj/kLpAc5JkVxvIt8MTHYcka3apdFBWsZrEhDiNQ0xP5gi2wX0TJXcG6vb2AM6
	d/belNMxjCq84zrJ6ZilZio6V57RIV7M8KSrPmhgHDPF+r8sJ04yLt3S/mlXUu2239ua2xJQ3iNFd
	IPXcfJfhHjtr27sBtKWD8qoHDgby01116wqc/utdfastTtBhYBS7y+nq1ZlVjuKr+oz6diBp7HPQN
	286cUg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFG2f-00000006Np5-1aLl;
	Sun, 24 Nov 2024 17:05:01 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFG1h-00000006Nin-3e4t;
	Sun, 24 Nov 2024 17:04:03 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 50157C0005D4;
	Sun, 24 Nov 2024 09:03:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 50157C0005D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732467838;
	bh=0nUyTFgN93JxdXis2A1wjb0ApbtOrSZY//1Dp6Ir21Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZLwfTd3k1VZLYnirJBPxFlwYvo4yvosVee3xExCJ75wy5e8Xqkk/KWSaSC23RdlgK
	 zVjxm/q/fXcmBO7C2sbvxPxjKZ/8i+vyURWadI+I3h/3ZqcVOcAV0NCA5yI8oe8kqa
	 YabO1eWeQSjeRAFU8e1gkvvJnWHpdDgLLxBtVlnM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id BFF0418041CAC6;
	Sun, 24 Nov 2024 09:03:57 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?iso-8859-1?b?TWHtcmE=?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 34/36] arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT
Date: Sun, 24 Nov 2024 09:03:57 -0800
Message-ID: <20241124170357.710628-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025-drm-vc4-2712-support-v2-34-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com> <20241025-drm-vc4-2712-support-v2-34-35efa83c8fc0@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_090402_008692_4587C5B1 
X-CRM114-Status: GOOD (  10.16  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 25 Oct 2024 18:16:05 +0100, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> BCM2712 still uses the firmware clocks and power drivers, so add
> them to the base device tree.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

