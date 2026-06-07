Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A24CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 11:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvmoiqjOQVbFviJTTLxFf9UohtoI+0J4703merDW6PA=; b=2mR79sK0Txj7ak9JxakyT++xeD
	IqvKemwkynX8vDb5lKf1WY+oUW8ZoGW1jTUMCT9s3BcQpujngY+kh3ZDbn2gNTBfZaXLTZ2mt5nRe
	YDrvgMktix4ChXtf/1SaTyKmEA8YbkR8gSPMS7xpCFLz3ybHw1y1sVAfIXI4bCl2oM4s8CxBzo0SJ
	PsIJG4gOejhOE3PtPAM+IH1TxK9vKgQl3EZ9qOxPBEgCmb3xVmJEu4NQK4bq+0m9IiMUbWwITAHG9
	wNnYO3n5ZSgVJlHLIlz8W52fTGM8yAJD/BFP6OHqnvMhu/E/n1raz56AOjpVgo7+G4tVBtSSOHOZa
	IjWN+35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWBEy-00000002CsC-1knK;
	Sun, 07 Jun 2026 11:00:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWBEv-00000002Crq-1zFF;
	Sun, 07 Jun 2026 11:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=hvmoiqjOQVbFviJTTLxFf9UohtoI+0J4703merDW6PA=; b=R0UOy+QWsNdnDRzocdebEgam5X
	3zDCaOOTjDKaobICL/EDvz290uost3oEE/D4ZOv+LGlqfEGlUkw8IRpe9asIuO2K1MKExhUxv0y5e
	SX9bdTk8ChBdRM/59sFyGRRlkk/nsI3ncxv1D6nFSbzXXUD1sS0FO20E0cQZRPtf2MLc8qQ0AD84k
	vVnzhN8q2bDKhlJ7YkjQb0BtdhukpY7+8DU09U6Q4ipbiuv51jVowmwU1YQicFY1vA/XabD4l92r/
	NaGgBajU2uYy6YtYXyaHcX0XeOGOB8o/ilx44KV75XBWFKz3bbe8gsEFTrefPIuId75EYh/seF0NM
	vKdB6wNw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Diogo Silva <diogompaissilva@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Diogo Silva <diogompaissilva@gmail.com>
Subject: Re: [PATCH] drm/rockchip: dsi: Open-code drm_simple_encoder_init()
Date: Sun, 07 Jun 2026 13:00:15 +0200
Message-ID: <5449269.L4jQFfv3LO@phil>
In-Reply-To: <5277524.h16uAIiOU7@phil>
References: <20260604123224.192543-2-diogompaissilva@gmail.com> <5277524.h16uAIiOU7@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_040025_515280_9817AD24 
X-CRM114-Status: UNSURE (   5.17  )
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

Am Sonntag, 7. Juni 2026, 12:59:00 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Heiko Stuebner:
> Hi Diego,

sorry for mangling your name, Diogo.


Heiko



