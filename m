Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84605F34C49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JnCx6HhOINoPWX+2cEjuRhzL5gOmNZQ9ID98zwzjh0=; b=dKofqeN1rzY9jS/QbBfpIpA9PC
	ecsfUHPlkRvOm21scrhwxMRXV9h1kvHbxEGNaBOrS5+lSchUZ3nfck5C5dqTo3h0mkkr/ssIw2dof
	Pr0bD4ky0vhHWSbNiYntPXf0CNG6jNJiJkQeRghdyHkc574998mmMzYQ5w1Fw57Au9a9j8++WQXj7
	UwA5J3Xgf9+PowMGq+1h0SLZ3nRsfdlWJmzwmFHv2MTYDAjFSvmw4wTdKMAHcF6+wypBTaBXsn4HW
	cgXg955AV/oWCnbtHyapsI4qgXrPunwV8nL9NG0ps+vbO76vzOwHTqRYx6Uh8rOW/Di3pxg9rpiSk
	It+MhYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHcY-0000000Fm5G-1cHK;
	Mon, 13 Apr 2026 13:46:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHcV-0000000Fm4K-3Q4Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 13:46:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wCHcB-0001bv-VY; Mon, 13 Apr 2026 15:46:11 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wCHcA-005BIh-2P;
	Mon, 13 Apr 2026 15:46:10 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wCHcA-00000000DAF-2j4e;
	Mon, 13 Apr 2026 15:46:10 +0200
Message-ID: <99fdddde59e1b0fe13d5014182b1c97de4fbec86.camel@pengutronix.de>
Subject: Re: [PATCH] drm: mxsfb: lcdif: enforce 64-byte pitch alignment for
 scanout
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Advait Dhamorikar <advaitd@mechasystems.com>, marex@denx.de
Cc: simona@ffwll.ch, imx@lists.linux.dev, festevam@gmail.com, 
	kernel@pengutronix.de, dri-devel@lists.freedesktop.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, 
	linux-kernel@vger.kernel.org, mripard@kernel.org, stefan@agner.ch, 
	tzimmermann@suse.de, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Date: Mon, 13 Apr 2026 15:46:10 +0200
In-Reply-To: <20260413114456.173485-1-advaitd@mechasystems.com>
References: <20260413114456.173485-1-advaitd@mechasystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_064631_853976_8AF41450 
X-CRM114-Status: UNSURE (   9.60  )
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

On Mo, 2026-04-13 at 17:14 +0530, Advait Dhamorikar wrote:
> The LCDIF controller expects framebuffer pitch to be aligned to a
> 64 byte boundary for reliable scanout.
>
> While byte-granular pitches are
> supported by the interface, the i.MX8MP reference manual
> recommends 64-byte alignment for optimal operation.
>
> Corrupted output was observed with XR24 framebuffers where a pitch of
> 4320 bytes caused visible corruption and choppy display, while an aligned
> pitch of 4352 bytes worked correctly.

This happens to be divisible by 256, which is is the burst size
currently set in the undocumented CTRLDESCL0_3 register fields,
according to the comment in lcdif_set_mode().

I wonder if setting 4320 bytes stride works if you reduce the burst
size, for example by reverting commit 2215cb3be5c2 ("drm: lcdif: change
burst size to 256B") to test.

If that is the case, it might be better to allow unaligned pitches but
configure the burst size depending on pitch alignment.

regards
Philipp

