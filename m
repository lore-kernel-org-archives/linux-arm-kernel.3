Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF3AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om1A/qUPAE+RvRc9QOCiGXLsDeJqGK2rZLRnc+C2LPU=; b=n2FhUU0TSLycUxGM4TMantsrgr
	+de6x3ZBiPVmSscvJkR/Uvgxvag0aFfvlp5zcSbVPPfHht7HrMWccKfut2y1Lf+D7qDdBEeXk3JD/
	cWfrZN2NaUUhNDBEn9aoktXM+y/vbFX9r23SxG+Vp+SXxigctO5W0J2/kD5Sg5wsCsTUAU0SVkI6f
	hBiA8HPCZsMasy23zsvnGbaPkiAO19j6k19u1PKB5cNpafVfo4sjNfb8vFMJcPhEMlUndukmv7fDf
	5MIDhjFntaebI1spUo0Tdn7M+jAiX4Ht0DW0ww1BSg6VSajmIhTGl/Co/el1Z7pfwrED9X2vHDZJE
	gMx3JvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJs6-00000004u3x-1fuz;
	Thu, 02 Jul 2026 16:02:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJs2-00000004u2s-3fWP;
	Thu, 02 Jul 2026 16:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Om1A/qUPAE+RvRc9QOCiGXLsDeJqGK2rZLRnc+C2LPU=; b=PRBdzR5FrpwlcK69ZWsZm+uEdL
	nHKCecM0P3uNqXRCLMZ4e5saOl2fHva7y6aB+iizLxJ5rSNgl5cLsYRc0MP0jZAYG+N+CjwDIgtxL
	USbLfTdmx6Go5xHgm3Ipn5r7o5/8WqscetSYzfLsvbrSPKvFHmkkKDVmWzlG9b6RaTXch9YGUM1Q3
	Ur2Z4NKK4n23iEY5JG53LPPskGXXTH1TmsI9rZHpC69Dlef40qlEKq2in+xLCMAfe13uQdC9ZkdSu
	/l1MX/nAJ99AAxxsxM3aUZKNdzDMiY8kZ94gMFC+yP6rx8IQJFfjZdKMaozCb4Y1ML/fMYOQgbeWa
	yQ4zqj/Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-can <linux-can@vger.kernel.org>, 1579567540@qq.com
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel <kernel@pengutronix.de>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Eric Biggers <ebiggers@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Karl Mehltretter <kmehltretter@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Cunhao Lu <1579567540@qq.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 2/4] can: rockchip: add RK3588 CAN support
Date: Thu, 02 Jul 2026 18:02:25 +0200
Message-ID: <3527453.usfYGdeWWP@diego>
In-Reply-To: <tencent_F077D309CDB6CC4802CC086D8009E29BDF06@qq.com>
References: <20260702140654.2961561-1-1579567540@qq.com>
 <tencent_F077D309CDB6CC4802CC086D8009E29BDF06@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_090234_910667_CA4D36AF 
X-CRM114-Status: GOOD (  15.88  )
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

Am Donnerstag, 2. Juli 2026, 16:06:52 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb 1579567540@qq.com:
> From: Cunhao Lu <1579567540@qq.com>
>=20
> Add support for the RK3588 CAN controller by introducing a dedicated
> model ID and OF match entry.
>=20
> The block is closely related to the existing RK3568 variants, but it
> cannot reuse their match data unchanged. In particular, RK3588
> encodes RX_FIFO_CNT in bits 7:5 instead of 6:4, so the RX path needs
> SoC-specific handling.
>=20
> The RX FIFO count bitfield difference was found by comparing Rockchip's
> vendor kernel 6.1 CAN support for RK3568 and RK3588. Runtime testing on
> RK3588 also confirms that bits 7:5 are needed.
>=20
> Enable the existing erratum 5 empty-FIFO workaround for RK3588.
> Heiko reproduced erratum 6 on RK3588, so enable that workaround as
> well.
>=20
> Keep RKCANFD_QUIRK_CANFD_BROKEN enabled for RK3588, so CAN-FD stays
> disabled for now. Local testing did not reproduce the two known CAN-FD
> trigger frames that cause Error Interrupts on RK3568 variants. Instead,
> RK3588 shows a different CAN-FD failure mode: CAN-FD frames without BRS
> work in this setup, but BRS with a data bitrate different from the
> nominal bitrate immediately drives the controller bus-off.
>=20
> Reported-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> Link: https://lore.kernel.org/lkml/20260630164336.3444550-4-heiko@sntech.=
de/

I think you might want to drop that above. If anything a Co-developed-by
would be applicable, but from the (small) size of the change, that also
isn't really necessary for me :-)


> Signed-off-by: Cunhao Lu <1579567540@qq.com>

Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>





