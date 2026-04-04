Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF6AE88D8B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 10:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8M156wfxsw08c/N3AsfeAf2KagUFS03fu06PBN70kOY=; b=rUhMPZE+8Nma4AoJ1Ix+aupvay
	/rZmigiyzcTXIITc9MJplcfUNcNmfRQUlgTuZ8d7i1BCvDOd34cK8Uq+MPsopGU9qotiLl41CW329
	bLugybS/HPx1I++ZEEPRTpjdPAuI2vEUCjyqtMiPEP+kk6r+kBqBE4ejudkXQqvJTl364r/b+Gdzw
	UxLQxGqcj9QPZnf64ZQQIH5jNitcZhoE+oznTNdxGMziGEVdQuoSdv/OHY1XIgxtIz/mOMg1Tc1RD
	lTCXVgCYhRnjNNaGWBfPiw9oX+jqWWwdwdt6ms8l/aBj2jKYzrKBXl+yJpHlm1Rut/XYD3FCdJYbJ
	/qE3lHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ye2-00000003OmQ-0tMo;
	Sat, 04 Apr 2026 10:54:26 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ydx-00000003Olt-3trO;
	Sat, 04 Apr 2026 10:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8M156wfxsw08c/N3AsfeAf2KagUFS03fu06PBN70kOY=; b=dJK0HsQaEwf/UJnpEs487pcJ4C
	Y2NySHfJUwbOrj7lPO/sbgDir7632a63T/Z4mVtF2UHOEfgENzTSKiSfVuvdZtIyvTbl47/83OyCq
	4Dgwq1FhpFF/ulQWj0BhGFGcbqbesr3VHOZZqmuCRJNw1vw54OzROYYiAMeCe2QrBLG3JOMUSFr+P
	c2sesOCbIuTzoZFCwmqbxX8Kbr9Lnxtro43dGE2pcIBbfZKzqefTJyjH3GIFpa4NhgFyji4oTjf9e
	EXBZkv50/xkMk5V/rVxv1ZF4DxoF1MSsO7i5sc4ubkclhKz4ZLipz5tjER9McfZkOG/Z5KGLZtyQa
	pw0WPs3Q==;
Received: from [189.7.87.169] (helo=prince)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w8ydf-00Bnm6-9R; Sat, 04 Apr 2026 12:54:03 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Stefan Wahren <wahrenst@gmx.net>,
	Maxime Ripard <mripard@kernel.org>,
	Melissa Wen <mwen@igalia.com>,
	Iago Toral Quiroga <itoral@igalia.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	kernel-dev@igalia.com,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v9 0/3] Power Management for Raspberry Pi V3D GPU
Date: Sat,  4 Apr 2026 07:52:31 -0300
Message-ID: <177529993945.2604999.5241727039867600030.b4-ty@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331-v3d-power-management-v9-0-f52ff87bfd36@igalia.com>
References: <20260331-v3d-power-management-v9-0-f52ff87bfd36@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_035423_091690_5C046AAD 
X-CRM114-Status: UNSURE (   7.32  )
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


On Tue, 31 Mar 2026 09:35:50 -0300, Maíra Canal wrote:
> This series introduces Runtime Power Management (PM) support for the
> Raspberry Pi V3D GPU.
> 
> Currently, the V3D clock remains enabled for the entire system uptime,
> even when the GPU is idle. With the introduction of Runtime PM, the
> clock can now be disabled during idle periods. For example, with this
> series applied to a Raspberry Pi 5, if we check `vcgencmd measure_clock
> v3d`, we get:
> 
> [...]

Applied, thanks for all reviews!

[1/3] drm/v3d: Use devm_reset_control_get_optional_exclusive()
      commit: de1e32ef1d625ee4d717bcf10c23df2722324f62
[2/3] drm/v3d: Allocate all resources before enabling the clock
      commit: ffd7371ed4179827dcf401543b37b69e5781f924
[3/3] drm/v3d: Introduce Runtime Power Management
      commit: 458f2a712ab42b7d3615208862922dc35fe90ef9

Best regards,
- Maíra

