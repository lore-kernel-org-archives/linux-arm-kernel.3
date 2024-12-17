Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D2AE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaD4PysxANBxyfICzMF7Bx9LmmQ9tlQ2zhPWGPCuCLg=; b=wt2D439Ax0n5xuU0kcwXQuS/X1
	RSVRdsaMBP1VRD+VjUJ1jxokSJVJTEnKYa9ptVEJ5hMgM8RWhFoN1cO1jhC1ltWo3MTdGFF3oz613
	s3w/zoGJ7YBB/f6t6ChSCY088YGballnPos+PnrRK4bQoX5SgyyEj7RPq/12nTeIWdikfZ3HaU666
	ql/hDZrMNvc7E9EzoefacxefLuCzPjagX8S7CFIC2fXPlYOs6CIj8Fsh4FIZXbadLpUbPrHj8jBw9
	KJZD2QPFmHfUuKMLspU2MJYFYX7SKf3mZ1ZvxispB3xDvQj8KkcVtgFjtAtCC6aTzL1S7pZ5CeMdo
	5FLZLDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdQb-0000000EeSs-0riP;
	Tue, 17 Dec 2024 19:40:21 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.208])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdNm-0000000Ee3h-44Kr;
	Tue, 17 Dec 2024 19:37:28 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B384CC00283F;
	Tue, 17 Dec 2024 11:37:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B384CC00283F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1734464245;
	bh=ejzO3Cah0Zh00B1elpz5PcPT0EBkIRvG+U2+wWYQm+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lyHD6LAbTwFMYbzNQCOpM2a38wKD+wEMvRdvKRdAbPMHA8Rph2oAPjv6Mbij/6iBR
	 p6l//zwU2hx76jnRxj4OGM6Zg7zo9roXG3TJhDIS/kppavK5xnkB/SK7EhIO/MD8qY
	 QEcUYAplmhGonJBE6pi8p0k8QwQF2SxmYoqg66CY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 337F218041CAC6;
	Tue, 17 Dec 2024 11:37:25 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	=?iso-8859-1?b?TWHtcmE=?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 6/7] arm64: dts: broadcom: Correct hdmi device node names
Date: Tue, 17 Dec 2024 11:37:24 -0800
Message-ID: <20241217193724.899605-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-6-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com> <20241212-dt-bcm2712-fixes-v3-6-44a7f3390331@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_113727_082359_0D00E482 
X-CRM114-Status: GOOD (  10.94  )
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

On Thu, 12 Dec 2024 18:36:33 +0000, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> The names of the hdmi0 and hdmi1 nodes had addresses that
> didn't match the reg properties for the nodes.
> 
> Fixes: f66b382affd8 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

