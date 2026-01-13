Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2685FD2F349
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArN+gzNluv41ve7tNs9bCuLTGUt8HRF4hQp5onhOiSg=; b=fjebRdpVd1/WY3NVxF/6lsX5Lh
	Mj6a8R0GuSXwH85atFbSqzDykPwRIroJcWeU3oBbOFYdtnltQTN+ReJIQSF1n/Unhy43/7K0TLuf1
	NLvUBJ5zj6eSU8e0LShH1/OdgrQz6GhppT3gUYRlKF8hav9X9tLw64KxFFALrdGo2OSanUdXEjCw9
	BpGZ6ilV3C95qtcAcSueHZb4bbW8hvWKJieBnNrhUt+RW9qalL6nC/bEgJehFCEvmsyYEcokj3Nly
	VoPVkBI0OAo12Tfs4Mbp6sMSH4Hd5NSrC9A6DF1c045+H+Cm/l3dZOogbNF/ZMxKuPxUgJuBzU0Ut
	D4wUyPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiEi-00000007WwP-1QWH;
	Tue, 13 Jan 2026 17:31:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiEf-00000007Wv5-1zjl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 17:31:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8EF031A2839;
	Tue, 13 Jan 2026 17:31:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43C8360701;
	Tue, 13 Jan 2026 17:31:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 089C0103C81D3;
	Tue, 13 Jan 2026 18:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768325470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ArN+gzNluv41ve7tNs9bCuLTGUt8HRF4hQp5onhOiSg=;
	b=SbsgZNDgkfZHCx/r34yGumijNEEAujBA1Asley4Zy9v924+EMnfgnRIOcSjOdM5mvGqWPR
	lWsq+4rbWv1be42TFPaquIJOTEqiazGpexh6KgVqdj/vsp21Futc53PdAYnOxHNcXKfXWM
	UPMA6t4YXAPOUmX4w/xDnACUO3E4LMeMErPwCMH1EWAjKXwOnIsQ28a7Nib3ZS84y0pFQm
	0r3v24ZarNzuyfppzipCFobDWeOQLNpJc0/4gSmi7B9gJ2tirl0htm/b1q7gv8HVWCGTPs
	rlMphTDPohwx9XlNXbinFpmLjBit+nuMZZCTpdBFpyRuhJNgeuQUSxvN+fm7cQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 18:30:58 +0100
Message-Id: <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
X-Mailer: aerc 0.20.1
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com> <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com> <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
In-Reply-To: <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_093117_639854_234F556E 
X-CRM114-Status: GOOD (  18.84  )
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

Hello Martin,

On Mon Jan 12, 2026 at 11:21 PM CET, Martin Blumenstingl wrote:
> Hi Luca,
>
> On Fri, Jan 9, 2026 at 11:03=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>>
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
>> avoid potential use-after-free ensure the irq is freed before putting th=
e
>> dw_hdmi->bridge reference.
>>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> [...]
>> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev=
, struct device *master,
>>                                    void *data)
>>  {
>>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
>> +       struct platform_device *pdev =3D to_platform_device(dev);
>> +       int irq =3D platform_get_irq(pdev, 0);
>>
>> +       devm_free_irq(dev, irq, meson_dw_hdmi);
> I have one question (so I can understand things better):
> is there a particular reason why you went with free'ing the IRQ
> instead of "just" masking it (so the hardware won't fire anymore of
> those IRQs)?

One reason is symmetry: _bind requests the irq, so _unbind does the
reverse.

Another is I don't have the hardware, so I wanted my changes to be as small
and clear as possible.

In principle one could request/free the irq in probe/remove and then
enable/disable it in bind/unbind. Whether it would be a good or bad idea I
don't know, but surely it would be more complex and I wouldn't want to do
it without any chance to test it on hardware.

Also, that would only optimize the case of multiple bind/unbind cycles,
which are not quite realistic without bridge hotplug. And brigde hotplug
does not exist yet in mainline, and when it will arrive it will be used
only for a few use cases.

I hope this answers your question.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

