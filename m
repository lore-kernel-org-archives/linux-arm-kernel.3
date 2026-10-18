Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DB0CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=; b=afpQL5xcUxMVMklXfn8nz/zhtw
	1NgUzTk/6GSnA5C6y70DW4x4jyDktvqh4XtyDgHMn2MHMLWoLtV5PCvoRDpJgOkFvJyaCrtG829tr
	0AaEKBGeHW961vEXnp1hKHTIxctY0TfUxSEuyVFSShgWMVw00o5+buENNmDGTFwLul3tvuyo8eD2X
	fDg7AaW3MKZz00MsKXca7i1MfC1MUQ+IV+sy/ggW4cxo+Zn6/+AHT51/vxVP/tfK9u7lms5MvIOoH
	LQX5di4BX8fyv9S947yBjzwNa1izS/cf7/YHdGXTebUEMPkIWwoeN+cRF2IzCE6qR2GC4UI5k4UPJ
	9VaONErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJjn-00000005Z2q-25z8;
	Sun, 18 Oct 2026 05:47:15 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJjk-00000005Z24-2DBO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:47:14 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso879653a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302431; x=1792907231; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=E85lFPyKbu51jypYcsQe+POoxpMM6nLTVoMUFdUh763qxwmGzqskK+qnLFEGFsl94n
         1Q+RkZGcf4vEbLdyzWHtY/h4UvWNwY3bkc8DgzGlGgtyAdv0PrNYAnUMrk8qOW0Ywc5o
         89XMjYc9PHHxU9AVaDXNkz8tSWGJKLTtoPyJVal73rcOpjR90jITZBebx3HMgLUq8Ql9
         lbg/tUFutvdQfsU8OHP4Cx4JWCWLt0fQSpRiH7zMMEehnP/HMyEkB+6ZuruwdZnFU+Mj
         IrQfjSOM9NmuHA0ko1m7mVaKeCIKYyN1NGztJl6gVJx+g77amc8RkVwfQapJkPZ5wRBU
         D2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302431; x=1792907231;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=KYFkIxQ265oxL1++Ej2n+EvtGshcDHS9MOytEG7jIR4dyaBjxXhZKmHvs5O34S2hmv
         1K7bSr4kNOMUwJjaEKNIBvmw2qc2stekxQ5FcRKahdDLLdIMNydvxDJfVIC36woYmlqR
         jBkMjNHU9rav3HJPj1niqBe40Qwc6Df4GYCRlx26+pkINWrTZlMh9zSciUC3dN+RRZU7
         eKv6GcOpuPJ9YJczTqScvodXg7Lig7rE9md2kvNFr15Rfpt9rs1vY1suuwRJVFppusxy
         M+oU+8MW6f+GiypSykOA+bcuW4nMmidUQDI7cLe6o4+ybIxxjGvKa2376BFRau+LKxA3
         i7tQ==
X-Forwarded-Encrypted: i=1; AKwUvByMkZxAJznEzY1U1dNGNeJfC2BxaP+ecKNc+J118pYm8T8IFdT1D3WyhVtwMlx/mmvG0xaKDtc73P901o10E6kD@lists.infradead.org
X-Gm-Message-State: AFq9FYJK2ay5Ig9qVWIQ27MrUxHbnfZV2wxqAoCyY0IsaZPkh4fqbHUA
	8vVinCpUrWgBFO1E8Nj8sPLjPuAVpZiCfHng/bt8hJaXExZPxzcpDU2W
X-Gm-Gg: AYBFou3pWGm9qLqVzv61Du+yuB7+RMpXXDFMKVlm2nYfp6RbQOcwl8E86aom+a9ZGLJ
	IuT6W6S2qYsdnVQvd7ZCTnp/kueVy4qd0XXp3XgAcPf3ZBQ0TGSc1My4fSOT2dDE8DtLhDurlDK
	g2/zIp3SnWIPbwT80FpCkWZLRSUX/PGPAclu2Q0luogelBrxxsNAS6170ea8PsAz5HTD0i8FI+y
	uPHGbsA+zGkUG7PmHKQn6KaNXnQwxUUhINOLbY/GgYPUr30lkkKnVjJYOLQLHQSMNvpzkoBJXQr
	XU6+vJwiB/avdWdvOMbI2dz7vGZJbZXbCckVYfkSYnGX10TUvvMgkBMVU/DjtcKEQHDdXGvUzx/
	tS2rsxiRmHTISoSfyqY2jpFPJjONUEip1VbiiOeKWCKrRQfalBKfaneLy+IIiA4oK/7F2tQzHI2
	7Hud/A/9q1Gvfkgmp94C5HMdyH2Wr5Bkq99CSZcXzjw3Wow6haOgkyeiW8vGZK5nux/DnA5rIpK
	r7kOFe8ydl4CEH6AWBVqi3ReWDAurmmx/bWOmG3iJRNM3eIqsWbF7ogXWptGUZYCuOr0nxvhJyp
	J2Ph3mooIPgZ1Al5jcDgecb79q8JfO56QGG/zAqQLEmflXhaLNk=
X-Received: by 2002:a17:90b:4c49:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3aceeb95f82mr3942070a91.10.1792302431271;
        Sat, 17 Oct 2026 22:47:11 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm5442358a91.1.2026.10.17.22.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:47:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
Date: Sun, 18 Oct 2026 15:46:54 +1000
Message-ID: <hMEBpV6QSOSLxRVSn92CIQ@gmail.com>
In-Reply-To: <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
 <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_224712_572382_03239698 
X-CRM114-Status: GOOD (  13.51  )
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

On Thursday, 8 October 2026 12:23:42=E2=80=AFam Australian Eastern Standard=
 Time=20
Charles Keepax wrote:
> On Sun, Oct 04, 2026 at 04:03:35PM +1000, James Calligeros wrote:
> > From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > Let the 'fixup_controls' card method return error values which will roll
> > back the half-done binding of the card.
> >=20
> > Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/sound/soc-card.h                 |  2 +-
> >  include/sound/soc.h                      |  2 +-
> >  .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
> >  sound/soc/soc-card.c                     | 12 +++++++++---
> >  sound/soc/soc-core.c                     |  5 ++++-
>=20
> Fixup is missing here for sound/soc/sdca/sdca_class_function.c

Unless I'm missing something, that one calls the .fixup_controls on
snd_soc_component_driver, which is not the snd_soc_card callback
modified by this commit. That callback already expected an int,
and class_function_component_fixup_controls already returns one
per b8f71f16134f ("ASoC: SDCA: Switch to fixup_controls callback
for IRQ registration").

Regards,
James



