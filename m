Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F0BEC0461
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ieqeIgWXtsJGqN9iYbh1K+fW5zi5u0kpmcIzoP8Jzk=; b=Y4dbFK7B8KdrXNR5+Q8bLKID5v
	9LtVPjNYobrYWYE0ta3klpJz+Y4FRStqskZoH0f2O8T6w8kR21RRkQAlXb7cZDxDQgFwO4uosFNTg
	/KX2c12GCLqrgSH04S1lc0NNccabYwoatzNBWURafFcPPiS7LrIq1KDoi0Q5JkS0Z6U2cgCg6JhwR
	aDSo0tQsnEmL8C+cfeyg2d3xZoJ7G0GTedenLpacugGIv1deJILP78td9kUOTNnVZfuKGPoQ4vGnd
	mQ/zxAFlddlVbUl/tEE1N/Pfr67e0DhdeA+FeaYevVmepbYr0UQy+SP/VlsbBitSU+vD6EncWXdnr
	HqqfAwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLmR-0000000EqGR-0xM0;
	Tue, 03 Mar 2026 09:11:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLmP-0000000EqFu-0Ge3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:11:02 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-827390e8a3cso3512797b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 01:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529059; x=1773133859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ieqeIgWXtsJGqN9iYbh1K+fW5zi5u0kpmcIzoP8Jzk=;
        b=UB7rZKd0nrgVA1/jrHkiysGRIHUybEPQvNMcs8bcOESHI7ys0PSmHH8w6G81TjTI5V
         Mm7a4APIvSncbrsDi530AI3gHmUYv/0mMUYBNgE6wSiPfXrmmgUYtdT7V4QKwbFJCxFn
         jCF9RoB89Uz8t35ycfDaXpGtn5dMglee8j/8GLrQ6z1w1uH2Rer8OUMLv1c+Wndncr2D
         LGBHNNt4UnFOWJThU/+WvmMXZ543kp6MRzt69h+2hdH+voC+4piLsMpCkNITy9/o/G7g
         XLlmHvUtqHv+ys0qLmFVtycG+pBan0UzcRcRoJOCRGZkAJCTXlYw2mgTSM3mrw2uiBBI
         uWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529059; x=1773133859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ieqeIgWXtsJGqN9iYbh1K+fW5zi5u0kpmcIzoP8Jzk=;
        b=VLrMFn3vuriSfMZNifj15cOkQdfyx6tGVOwEcQYD2y8EVLWHkJ+KfWrJfLp925T8hU
         GVQX/OTEUQWhcJX9R+GvLIpRe/lmgHMlDkW9AwnQjR2//JxtypQCQU8/dyASUgtSeAom
         xm09Xq8mjXD2UUEwH624Tzo4ikH0u6IiSYeMAqlDh4sHuPQS0EikuK55vgVwGhLz/Zjq
         kZRfQMnDzjkmZeXXsPauLkHv78thNt5cdTSSpIhSx2WV93eZkVQGVcYlZqUpfQE2qEV3
         GpydDugZJzt+1zRsVqMPlxKvxPZmMX6Qn/teJHzDjExRRZSKKLl49kNSEub+KxANQBlC
         O40g==
X-Forwarded-Encrypted: i=1; AJvYcCWypQdLvWOChah+4HgSIKo4eZqwXuEp129ibcH/MMS/j0Yk2BSSWelPghm4YPRagmDNsXSbSVjeE+yvAsDAN7NS@lists.infradead.org
X-Gm-Message-State: AOJu0YyhMrRiN1PDfbHYe2kNsTox1vUtrn3eRO2HV3fTaz2P7IZ7D3RC
	t1zZBohox8lfZWCofragpSpgBmqdMcMnAw/8npZud1bGCHyHUq3olLY/OPQmLexx
X-Gm-Gg: ATEYQzznBoX2+wuXUy/MSmlqsWDt2QgsZOvOcr84nbfj1Prq30K3balmBQyh2zXfGAB
	6buvSVSVTVhhsl2VTmA9wGADJyjxFk/yAkWThxgriCU7aAvKgfugBuxmRE25ueC78fbcWgh5poj
	OdKTdQrjaYmESlLlWJG8WGI0etoLCoffQFGV8q+9pLfp0qoOm2mWT4fDE4m7cKxlGuqZJ2ccbIG
	tyEekWpzqmaFqo90/Mx/lwPWAc7lcGpCs2v1qcugw7ccXJd5FNlUml8BnZvZwVyAqSV4ihKbNw0
	LJvjNBPBwsvrN6IvlZo5z36Pn+lBCox+9i459kr28daiRFGiad3D5oUP3MgXTg8rQMmCpwM8O7L
	XYnBlV8hiaziGgF0BJnUHn17QWUtj4yNkSCylQiVkBbzBwpElr7vzvEZNz4KXyb0RNVJMTwy/kL
	KhgbRtPjMGpboBXTGviAuyh8g6yGbTMyREkJE4U4JvxIYrRbIk8ogkQvzK0mwYFb2WRUp6E3q8v
	dO0LqEnTkynzLyyVCRbMpNSTSYHNkud5XxQhvqW3NxkUL2T1bfpSDH8bY6lHQpM8wiitkpXjU21
	E+o=
X-Received: by 2002:a05:6a00:1ad4:b0:825:2927:3aa6 with SMTP id d2e1a72fcca58-8295d82a9abmr1551612b3a.14.1772529059400;
        Tue, 03 Mar 2026 01:10:59 -0800 (PST)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739db4955sm16000114b3a.29.2026.03.03.01.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:10:59 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Frank Li <Frank.Li@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject: Re: [PATCH v3 5/7] ASoC: soc-dai: add common operation to set TDM idle mode
Date: Tue, 03 Mar 2026 19:10:49 +1000
Message-ID: <4716405.LvFx2qVVIh@setsuna>
In-Reply-To: <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
 <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_011101_111589_DD49F5B3 
X-CRM114-Status: GOOD (  18.55  )
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

Hi Kuniori,

On Tuesday, 3 March 2026 12:11:50=E2=80=AFpm Australian Eastern Standard Ti=
me Kuninori=20
Morimoto wrote:
> > +int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
> > +			     unsigned int tx_mask, unsigned int rx_mask,
> > +			     int tx_mode, int rx_mode);
>=20
> Do we need "rx_mode" ?
> Only "tx_mode" is enough if my understanding was correct.

=46or our (Asahi) purposes yes, we only require TX. However, TAS2770 also
has a bus keeper on SDIN, and I suspect other hardware may too. Rather than
break the API later on should the need to configure this arise,
I decided to add the capability now. I am happy to get rid of it if
we think it is superfluous at this time though.

> This patch-set adds new snd_soc_dai_set_tdm_idle(), but no one is calling
> it. Who use it ??

Currently no one in tree consumes this API, and it is likely that no one wi=
ll
until we submit our platform driver. See the linked resources in the cover
letter for more details.

In the interests of transparency, I don't expect to have the
platform driver ready for submission any time soon; it is a bit of a mess
and given that I did not write most of it I still need to wrap my head
around why certain decisions were made during its design. However, we
are 100% committed to getting it merged at some point.

If you would prefer I can resubmit this series along with the driver
once it is ready, so that there is an example consumer for the API.

Regards,

James Calligeros



