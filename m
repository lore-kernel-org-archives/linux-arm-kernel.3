Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDB5CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=; b=dRuJJDx73rKZHFf0cbf0KZhN/0
	VgC8NpdWHG+cxtSUQsPAAYDLcqYJ1nPNNOmZSh8/OePzbzITK4DY9NCi3/ZR/WOgxJWoVOLcWLC9x
	JsYVEqFAMO0VLLeWs128lHR+wGBoznpZOFoOmR94b+bc5LZOvnhAy4Il3AACM6wswyAsYEsxCq6JD
	R2CWgrmtI631WDI06ZlTR2VD3rx0kkgrWv0ohoNWSBquJNomnakKJw8M7Tx1f+4gr/dCAZjQpPIeh
	X9iteqKwrF2aRfRqLgos1YbZQD4TA8LrLgWvf6l1HxhMwtGsi1+DuuhLNm7jdXmc/F2saeuZYkq6f
	LLbP/bWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJkf-00000005Z9z-0ImM;
	Sun, 18 Oct 2026 05:48:09 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJka-00000005Z8o-0eHs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:48:06 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8a064dcfcfdso21725b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302483; x=1792907283; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=eTDxHS/IsQI8ik0DlAq43UF7i2CxOIEPQ/Orw/3hsrzBdU8Usw72p3JB85+hRwfVQt
         lC7rvFMrFUQKy38Hwh4oaRHfSBQQRe4kF/emAqvUic65g2niRhD2IPha9SXow1zkGABZ
         8bw/2GZ7v47kdT+oBRbMKHcveKO/2XDPho7GF8SBolFUgAkpegUCAiWOOasNqnvF6U+o
         4JccNbKYMODkNDienJl7aZdmxux5dnSC1cK/ojelk+wc1HzEYRwpP7gnX8s5e+B33gsD
         FxDQ/ek/etgbMfQlPbBeJcDcv48Cj+8CkOSGsgmYcsVHhdFlFOHQxLb9x07S+vPMJJkG
         qGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302483; x=1792907283;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=u34CIY0Mq3yU7c8NMgfYx9awPETiQmBLbvYM5+ZttSskH7owt6phRcmXoQoCfZtjFR
         Lnp8rEbjWgYprufz3f4S+jR5Lz4o92qs/Nl1MaLUDnsSEt+n+3wLLnn1R6mrcUm6HevU
         0y3znMaquq3T2g57u7cYJWaJuhLfx5HKcF3spJqHnsZXX+xXVqEdDnPJ5kovoC7/rAS/
         PmTdaMfDbGr8VeuMRdYqs5t7uYhmFWrqSAwhUdNmiynuyinBJKQOr8Z+lfQAjq3rLqF3
         Y9YjLIaLOdhgudnaQiHjmeEtT1hdgzCO1Ef6KmUDbk4zTKrbh60Wy/TvXGWzufD9OJvR
         hySA==
X-Forwarded-Encrypted: i=1; AKwUvBxZMbI2YB5f0nK/16uSa1m5+gh0Q4uLqA8GEBwVZjhB9iTfRXVhkySWyhNLTmPq40JyPYTcMQPbx77daNIQuYCW@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5sSTyOpwqtmKXX6dY0YVCHtKkW6thmGJ8yNt3Y+GALIyNhuvw
	cmUgKTm9sq8hgs/JAOWCOVQrRsQH1E9cJBiE/u/h6u9InQsn8sOkaqbx
X-Gm-Gg: AYBFou3CKZ0lGrtAhULf/ouOgxCHIUeY4O/mkoFE3gxZgYFpXwSGqtAFhjkEnaxP0kQ
	YdQYstKjuzJ8GDelFF5Okdp7wkMf++GZMRXfkMk28L+SvnDfGFVQoFJT1sROEtGmbQrJD6RNYfo
	ogQ34lEiFerW96rU7YH0+41fCKgaltpEch2ksefmudkgJxCdLzYSKAzUcqHi4LufbuVHRBaJ4HZ
	04/TFZ5gUixlQQpfQIhQbkD8VeGe9ULFXRKqg2MAWXHy78sTUeDd7AQboYPlPpS/lc+OT7kwRLp
	9Mf20xi4RspJLCQrG46Bvx8IidsD3iLBlYxKe3vaJPtcnSzJuQEzYdRVkE5/LFpnBM/hlfPd23C
	L0+T+/9JSGjxSvAU7tChz0iZxOfNVMycnn4ZK0nbjjb9THtL5C1KTxWJ8fxCOdpvp5M3yf7E+Nb
	p8nVXwZ/eP/P8+b6ZtFF1QIZOxgwkzyGCwmKmUgzCOS9tYPmmOi2X3Wsfa6+TYTefSwaVzuGdvk
	s2sqMqyWfBIr4rpbZsmmUwgdM67IrwwH+10TVDU8eIQh0ccOxh5UdMRLUE23hnl3DOw6CnEyuq/
	Jy5/N0WS8+aIpw4wBMnrmN1PcCDnG5JGUQvPJgepufBGhYfhx0A=
X-Received: by 2002:a05:6a20:c5aa:b0:3e1:efce:1d35 with SMTP id adf61e73a8af0-3e225f2b40emr3593769637.14.1792302483139;
        Sat, 17 Oct 2026 22:48:03 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm2648102b3a.29.2026.10.17.22.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:48:02 -0700 (PDT)
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
Date: Sun, 18 Oct 2026 15:47:54 +1000
Message-ID: <sd9fj8SNRAmGisFuRJU7rg@gmail.com>
In-Reply-To: <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
 <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_224804_188045_38F44618 
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



