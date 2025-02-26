Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18A5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sp2RArpH+SxqIvNipgdR8UTH8wCQ4VMdPZhhVAjR59Q=; b=ClztDwMZXEs0CrqP5YrremcgNY
	DudhSw7P04uUjYzPZC77eLhshBHG9ge21wpAOeOOKQwrKJ9od2//9sHS/WLXw3kNGi+UZrjYGD6so
	TE2c2W0zjU8oN94cO6XeafJjmssVRjRDOPCjWBN+StyEzDGRvL6veVh8xq+zYCgOxzPBirRMhxWE3
	mnUbIIUtxXhwZEScUFB1BI5thhWSJA7STTYmTXkbllSkVY05iwFOp/2nezr/Oe/lxwSzLMdzOq1dG
	6ouwzE4JZyH9Yk4tcI3lUJD6c7V9oyDvV3bxzD3U/uzPaydJyIVP9g8IG7xpI3xveOtWwhM8fJg0o
	QVS2/ZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJks-00000004QLs-09sU;
	Wed, 26 Feb 2025 15:55:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJjJ-00000004Pud-2s05;
	Wed, 26 Feb 2025 15:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sp2RArpH+SxqIvNipgdR8UTH8wCQ4VMdPZhhVAjR59Q=; b=tiHog+I26s/LWX4WCV9x/RGYhw
	HswqddxSRwDVM8cALeNQ12xrX03BBlHKh08VP/8QZG48SCUtBdR1//NT40ic6a73gNbgUqt1kafi0
	ph8mV6VD/8QAa5Ab59TnnaMF52mnKx9qnKanZ9gZqaG4HEW7ci5vEUf2Zz5Ej9dd/MxH98Revgk2q
	1aGgrjTcEz30XpxrQa17d+fMx6EDqvh7FbOwlyRM+kMSNGG1ZFFey8OkJUGVnVs4VByc0N6fe6pbh
	teGYkhKCPoiqCwmKOW3gvw5JEUJR/fIS7BDoMEkIxs1aa2ef4Lsfr27nZvMghozTlqN7cHZvo4jcO
	4tE/+yMw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnJjG-0001Ve-KY; Wed, 26 Feb 2025 16:53:46 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: =?UTF-8?B?T25kxZllag==?= Jirman <megi@xff.cz>,
 Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org, kishon@kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, sebastian.reichel@collabora.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 2/2] phy: rockchip: usbdp: re-init the phy on orientation-change
Date: Wed, 26 Feb 2025 16:53:45 +0100
Message-ID: <1878927.BzM5BlMlMQ@diego>
In-Reply-To: <7q5yn466xd7emebhjze4ixkswgyxjjjt5rwvyww2hwbts6bamd@i5vwvegy2os6>
References: <20250225184519.3586926-1-heiko@sntech.de>
 <20250225184519.3586926-3-heiko@sntech.de>
 <7q5yn466xd7emebhjze4ixkswgyxjjjt5rwvyww2hwbts6bamd@i5vwvegy2os6>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_075349_720399_81054AF7 
X-CRM114-Status: GOOD (  27.34  )
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

Hey Ond=C5=99ej,

Am Mittwoch, 26. Februar 2025, 15:46:11 MEZ schrieb Ond=C5=99ej Jirman:
> On Tue, Feb 25, 2025 at 07:45:19PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > Until now the usbdp in the orientation-handler set the new lane setup in
> > its internal state variables and adapted the sbu gpios as needed.
> > It never actually updated the phy itself though, but relied on the
> > controlling usb-controller to disable and re-enable the phy.
> >=20
> > And while on the vendor-kernel, I could see that on every unplug the dw=
c3
> > did go to its suspend and woke up on the next device plug-in event,
> > thus toggling the phy as needed, this does not happen in all cases and =
we
> > should not rely on that behaviour.
>=20
> On RK3399 there's a similar issue with the equivalent type-c PHY driver.
> The TRM (part 2) states that:
>=20
> 4.6.1 Some Special Settings before Initialization
>=20
> - Set USB3.0 OTG controller AXI master setting.
> - Clear USB2.0 only mode setting (bit 3 of register GRF_USB3PHY0/1_CON0 i=
n Chapter GRF)
> - USB3.0 OTG controller should be hold in reset during the initialization=
 of the corresponding
>   TypeC PHY until TypeC PHY is ready for USB operation.
> - Set PHYIF to 1 to use 16-bit UTMI+ interface (see register GUSB2PHYCFG0)
> - Clear ENBLSLPM to 0 to disable sleep and l1 suspend (see register GUSB2=
PHYCFG0)
>   ...
>=20
> The PHY for Superspeed signals is expected to be set up while the USB
> controller is held in reset, which makes sense HW wise, and it's what dow=
nstream
> kernel efectivelly does, via its RPM based hack.
>=20
> RK3588 TRM doesn't have very detailed notes on this, but I expect it will=
 be
> similar.
>=20
> So reconfiguring the phy here, while it's actively linked to the USB cont=
roller
> without the controller driver driving the process so it reliably happens =
while
> it's in reset, or at least so that USB controller reset happens afterward=
s, may
> not be correct way to approach this.

the function here, is using infrastructure from the type-c framework.

The function in question tcpm_mux_set(), which then ends up in the
usbdp_phy only gets called from tcpm_reset_port() .

Which I think will do the right already - judging by its name ;-) .
[and also by the fact that the referenced qcom phy behaves similarly
 when talking to the type-c framework]


=46or the rk3399 I would think converting the old typec-phy-driver over to
use the actual kernel type-c framework, might just magically solve the
issue you have on it.

Rockchip actually has converted the rk3399 typec-phy to use the type-c
framework in their vendor kernel.


Heiko



