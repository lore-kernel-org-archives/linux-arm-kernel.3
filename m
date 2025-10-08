Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316D0CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 07:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY6/uGBggjr7DPOeg8CZY+oS1HkBeSOBG2tcETPEWsE=; b=fQdzt7tlfzEwNMnfGJw02uadZV
	TW0saCCj63z4IcoBXTyKEO3by4kudY9Uvgr1+oO0le1KlB9rfWh59QpLmF3/4a1K62vOvcJsCEmdi
	8hf/Ff+VOtLoWFmur4r0ulzGuXE25LCPJ/YzB0W9cvJ5a5e0OqFPD4hsX1npv5GLH+YlX7nr38lUh
	FOsE2vRnLCnx1Qvmt09NsLCdNcj1B+QGLmT76Oi7SlcpUay/w1QPTf0q6W0Wcw8TEeZXq8KGDKa+Q
	ttkTnCZy3kFKtQlqO21sh0D1Xy2Fpzb8A43521lH4PHiPw0tIk49C4eBWhYQVh70HW6kDedMjcJ5/
	KuEML+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6P2K-00000003OlG-2OSD;
	Wed, 08 Oct 2025 07:56:36 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6P2G-00000003Okq-2Pyn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 07:56:34 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b4f323cf89bso366798466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 00:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759910191; x=1760514991; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yY6/uGBggjr7DPOeg8CZY+oS1HkBeSOBG2tcETPEWsE=;
        b=d1tmhtSF12TvDxKzcYRWHe5TCIKltKlZYt+tZgCpW57hHhgyqOtjpFRhAHzdAOKWHC
         BCpZ++nRfUdn6YvkOy1tw/FKKWX2bBXFk6eBWLkwZeO0yZsIQIhor3dmwfXKWucDIS/h
         b/3xnGxBXjpKi15AI0MwFgU418huXVFPRqnEzw7kCpx9RnET0JIKnyZMNnZ4Sa4x3h7G
         F+zHpuG40rDATOlksd50mG+/Vr8iGGyYSm8mLvMxHZcPHjteSzedbqehujbYsJ3ebSO2
         cFtfovHJbWH5PuNwo7cHje6Jaz4PZ9JCFRNuUFRerr9NYxbIjoA1N/ePSMb9flrYeHhg
         87Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759910191; x=1760514991;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yY6/uGBggjr7DPOeg8CZY+oS1HkBeSOBG2tcETPEWsE=;
        b=YOT4IO3YRnTnF8N54RnlXs8VvQvoDsIn+oZCXR25Ls7hpZon6I0burKnMBGscJPotL
         DVfOlXaLH6fKGpTU7iIrfusU5VRdPDW93j9i7TpXORBqkOR7zyRu+wr6W6ry120WAX4f
         7ibNpZUTgmfZfq+nAZYrRZrhwhxrkoYm8GUH3BQY4m2+ZuHiLSBGDV3/zNThB0iqCHdb
         z+eDGvZUmddIUX/Kbrc0x5HFm6FSL88HblMtVwtraXbPkTxLGmqK6Awjbt/bfTaUVob3
         j/gdFgGujdvjbxtdqHLyobu0NaOwhw4qKZE+blvG3bmqjD4h8+kLdzy2QUUchxqsBHHY
         6h/w==
X-Forwarded-Encrypted: i=1; AJvYcCXTeXJbGLtzEePLVM+tlZJp3AM7vSGDAdhKQZvLWeM92rpayn8jMI+fVgH5Fw12MPlg8nnn+4NvRJUYB7rbjDGw@lists.infradead.org
X-Gm-Message-State: AOJu0YwaRPtJRkTiMRhNwXfQXVtZIi+mWH1KCjdfHYMZGbQomgLHtzZ0
	d5OzAOHBY1K9Caf97hJce1bfz119YSIeD9jJJ6z5Ig73BGXhZeJQTyBH7iUgHo2QyhQ=
X-Gm-Gg: ASbGncvXJNdf+CaS6x7ifFMTXmsWoXp3Oymuu+h7LynOP72d1j2UUNwvXEpNtcX4MAP
	eAciORYJXs5314Yc0DdYys65RvGZm7WP2HA1QlWVJukFyMDJ3z8N2+n8unVoi6PJVa3kYbbhGGZ
	Npz+VWLX4aMu0BnCW81IGk7LoWPKwlKpgadz33GaQ4eWJVRT0cFLiU8OSbzk0uYEtRi4VA6bz8O
	QOPa4LFiWv4p517U3+EbleTyjZ5DueGjjPbW2CXFXEkK3qXZrkYLST2PDXy7zXHttP5vZWKDr+F
	w7bgPNLSdn6OWHe2pYr4D+HVRDb36E2bZ4Xu6dp4jkEV+cUmP1UkZD0Hzpda923w9azWt5yg8Cc
	Tzj22pwfrHsanRwY9++EKKLHlBmU17SfjHcZYaiG/FwYmo8FZMttDzA==
X-Google-Smtp-Source: AGHT+IFp07FRs5tCn/Ul46jxxqRkTyRGCpgeXeTG3+gc53OiL7gYrGNYmAqkEff6f/cTzyfRxNMOiQ==
X-Received: by 2002:a17:907:72d3:b0:b4f:4940:6a23 with SMTP id a640c23a62f3a-b50aa899e80mr258485166b.24.1759910190618;
        Wed, 08 Oct 2025 00:56:30 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4d9f5sm1618847766b.66.2025.10.08.00.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:56:30 -0700 (PDT)
Message-ID: <ff3a0b96980669f326ed02ed81b97d34c104b09d.camel@linaro.org>
Subject: Re: [PATCH] scsi: ufs: dt-bindings: exynos: add power-domains
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 'Avri Altman'
 <avri.altman@wdc.com>,  'Bart Van Assche'	 <bvanassche@acm.org>, 'Rob
 Herring' <robh@kernel.org>, 'Krzysztof Kozlowski'	 <krzk+dt@kernel.org>,
 'Conor Dooley' <conor+dt@kernel.org>
Cc: 'Peter Griffin' <peter.griffin@linaro.org>, 'Tudor Ambarus'	
 <tudor.ambarus@linaro.org>, 'Will McVicker' <willmcvicker@google.com>, 
	kernel-team@android.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Wed, 08 Oct 2025 08:56:29 +0100
In-Reply-To: <001501dc3815$601ec450$205c4cf0$@samsung.com>
References: <CGME20251007155631epcas5p2cbf4c7b52bd217128c156bf6f5f1ea82@epcas5p2.samsung.com>
		<20251007-power-domains-scsi-ufs-dt-bindings-exynos-v1-1-1acfa81a887a@linaro.org>
	 <001501dc3815$601ec450$205c4cf0$@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_005632_787454_2381D1F7 
X-CRM114-Status: GOOD (  14.09  )
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

On Wed, 2025-10-08 at 11:05 +0530, Alim Akhtar wrote:
>=20
>=20
> > -----Original Message-----
> > From: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > Sent: Tuesday, October 7, 2025 9:26 PM
> > To: Alim Akhtar <alim.akhtar@samsung.com>; Avri Altman
> > <avri.altman@wdc.com>; Bart Van Assche <bvanassche@acm.org>; Rob
> > Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Conor Dooley <conor+dt@kernel.org>
> > Cc: Peter Griffin <peter.griffin@linaro.org>; Tudor Ambarus
> > <tudor.ambarus@linaro.org>; Will McVicker <willmcvicker@google.com>;
> > kernel-team@android.com; linux-scsi@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux=
-
> > samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; Andr=C3=A9 D=
raszik
> > <andre.draszik@linaro.org>
> > Subject: [PATCH] scsi: ufs: dt-bindings: exynos: add power-domains
> >=20
> > The UFS controller can be part of a power domain, so we need to allow t=
he
> > relevant property 'power-domains'.
> >=20
> In Exynos, power domains has a boundary at _block_ level. I assume in thi=
s
> case it is BLK_HSI, which contains, multiple IPs within block, including =
UFS
> controller.

On gs101, there are three hsi power domains:
* hsi0 (USB)
* hsi1 (PCIe)
* hsi2 (UFS)

I have not looked at hsi1 so far.

From what I can gather, hsi2-pd affects:
* cmu_hsi2
* sysreg hsi2
* pinctrl (gpio) hsi2
* ufs
* ufs-phy
(not sure if there is more)

hsi0-pd is similar, except that there is no pinctrl (gpio) hsi0.

They're all modelled as individual nodes in DT, so we need to add the
power-domains =3D <>
to each of them.

> I hope you will be sending the corresponding DTS changes as well.=20

Yes, of course :-)

> Feel free to add=20
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Thanks :-)

Cheers,
Andre'

