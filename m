Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFE8E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IR3CBYmVz3WChMKC+3bqNlNVKDz36LomTpsP6RbwpBI=; b=Jxfmv296FIyH48VbVKyMRiLw8V
	nb1nGiPE/TrycwcO9YyPfusi1a6/KUM2PWbMcjiajjbtrP6gPQJJynXlFNRo2psfEE0pDuQ1oQkP2
	k+FCD2DGBB+G/o19hSCoGbrKBPGyp9OsV/DAtl3OJYBT6av867SP908B+I7wjhqsQkl6BL9OjQrR3
	PhPe7VKUuIvKzHrEL2yEGUo1QM6kKiJ+gb2IWSLr+GNM7yiU2Y6Ccs2iDPoXAhYELOY2O5b7dhlWM
	UoeSQFFtQn+4ct+jVc6HZL5zCSoDsNmdz2UORnjKdGLFKFvQMCivhZZsKfv0I7cf+5JsQE6sfpAW6
	HlwAE+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJas0-000000025it-3Wpj;
	Fri, 06 Dec 2024 16:07:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaqz-000000025ch-1tOt;
	Fri, 06 Dec 2024 16:06:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 056675C6946;
	Fri,  6 Dec 2024 16:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403D8C4CED1;
	Fri,  6 Dec 2024 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733501211;
	bh=gToIYM+37jkKtK/Sbu0IwPGwvwqDSaBXiHsgZA/gUAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUZhriGHwCOGUtnZPn6FC7saJhs6BKSmHqVG5AS+E0JB1T7WxDfeMpEbolQahWmV4
	 +/IvsXta9NDAgw02+PN2UCwNsn9gZ7EcEzwPrENYs2Vv191ztYUHRjTXw+lBe+c9Ic
	 odbaoVofPbb+z6qo3uRJPlLjvHkpPXpFKIIvFaH5hbkzMAoRG89g854UUjG8fG127a
	 4I04DzE5/U6OQjK/qkdEVVwAPxTAKAB2LS0I9ttpCOLbB7M9AkUDMA1KcR+1H7deLu
	 TFv1mG8eIAAlXUdkyPJgcjkxdssShLZNDvFIYmCLWfTfQ3uccoPRQtkhT+hkSm5eNH
	 lTXQ1kBPWpADw==
Date: Fri, 6 Dec 2024 16:06:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"ajye_huang@compal.corp-partner.google.com" <ajye_huang@compal.corp-partner.google.com>,
	Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
	Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"robert.foss@linaro.org" <robert.foss@linaro.org>,
	"Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Prado <nfraprado@collabora.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <6456e0b7-08ae-4515-a7c9-734f50c9130a@sirena.org.uk>
References: <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
 <Y43e+EsNCrCpZSIH@sirena.org.uk>
 <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
 <Y5ipwqzHKTK8UdlC@sirena.org.uk>
 <a699178dcef540fff5caae6291983a444886bff6.camel@mediatek.com>
 <00d5c728-3eb9-427a-bc60-5828c20fec09@sirena.org.uk>
 <b44319c9fabbea2e8c333191a0005ef5c4ec6b2c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0Q96+HlCP5jtbeOt"
Content-Disposition: inline
In-Reply-To: <b44319c9fabbea2e8c333191a0005ef5c4ec6b2c.camel@mediatek.com>
X-Cookie: Sales tax applies.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_080653_573815_9B514DA3 
X-CRM114-Status: GOOD (  15.03  )
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


--0Q96+HlCP5jtbeOt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 03:39:15PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Mon, 2024-12-02 at 13:16 +0000, Mark Brown wrote:
> > On Sun, Dec 01, 2024 at 05:15:45PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=
=E9=91=AB) wrote:

> > > So I want to ask if I can do it by just adding
> > > SOC_DAPM_PIN_SWITCH("Speakers") and SOC_DAPM_PIN_SWITCH("HDMI")?
> > > Correspondingly, dapm widget and route path need to be added. That
> > > is
> > > "SND_SOC_DAPM_SPK("Speakers", NULL)/ SND_SOC_DAPM_LINE("HDMI1",
> > > NULL)"
> > > and "{"Speakers", NULL, "Speaker"}/ {"HDMI1", NULL, "TX"}".

> > Yes, that's what I'd expect to see.

> So if I open the "HDMI Switch" amixer control, it will call
> 'hdmi_codec_startup', which in turn calls "audio_startup()"  in
> 'hdmi_codec_ops'. Conversely, if I close it, it will call
> 'hdmi_codec_shutdown', which in turn calls 'audio_shutdown' in
> 'hdmi_codec_ops'. Is this understanding correct?

The audio stream will still run, the DAPM path attached to it will get
shut down.

--0Q96+HlCP5jtbeOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdTIRQACgkQJNaLcl1U
h9AR8gf9Hfqv5O8hW1VoO/+oNPx5CkfRkyZFsfXQTS4FYXeTZ9zcxTzV8bdgREIe
WVUSi00ehS2CCupQkffrSFfZHqk88wxKrrMFNQYcoDrekq/kUtbseBayFJgB6mQY
4NUYT/0mnejbXDk+qeiHI1f0UzygswelfRVu+TZ7exCG2UI7GJO2RYdL6fpItNpQ
F7ISvK9ldljmyAmqAbZ8Ol6tg2eNfbhESwdEGsGrx58UpFAWH/0Qb6G+T4tzPxQ+
3rMJvvwahR0VMHmVglGFRUneunLknVaycWRVne7jYBilbaRlWMGQQ4FVs8XLY45q
OE7ZqGZc2+b4p2bOuAcnSLIiQPRSsg==
=/TNF
-----END PGP SIGNATURE-----

--0Q96+HlCP5jtbeOt--

