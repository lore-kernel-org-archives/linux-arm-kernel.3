Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9467D5B16D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 12:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6FVs1lq7FCYiXGgCHToT2WUTH1AKvFmKeDMOd7AaH8=; b=T1jzLyeH/1E6PNFRWvX7FJUxwV
	oHWcMBwqSjeNNl3g1ltLP+go0OMb5baJcKgQhghRdT3tSrxF4oMjZCmn6YkDUxm0wfhHjCmbnYiev
	2WmprfCNZhWSghWOgSt63a2GQcErYqrF8ZAmQSXDMBd04a9Wlh51cKtRtKEKuoYNsXby07Y1KKeIH
	FjEmx8tLszlL0dvTJ8g4hctTppyQby9QUaoj8BxzNsU5mv7/iHn3WsNYJ4GI+hP8b3E7RsjF11SHy
	M/wRnar1/C2KSUyRpp47vJbU3uLCUQiYmbL3IYY97m64Gy/BCmjshLRikIC3lPOKIh+bOdvS+BF90
	lB4XPAnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUkqP-00000002RHD-0iDf;
	Sun, 14 Dec 2025 12:04:57 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUkqM-00000002RGT-2QBI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 12:04:55 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-37a3d86b773so23199101fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765713892; x=1766318692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6FVs1lq7FCYiXGgCHToT2WUTH1AKvFmKeDMOd7AaH8=;
        b=LWy2NisnQ5ql7twIPW+AapOSdl0mxlbaQd8zc/FvbyzpTFYGygXqzoHdc/Oc9Z7D9x
         FJSEfUjQWWvrPTfCdJ55njSJ7KcrEivSfO9obCB+7JpgXlGIHe0T6K//IiyftUo5K+pQ
         36dN6aYtZyNGfGYXZw15m0TtuunuOkBUwCyrzOxBnunH+fEM4a67EIAu1SdK3gJ5aH5S
         G9UsBpjin9U0x9342sEKJSPok9CjK8DE5RT1yYdmQNpRSpsfVRtWPpv3Bh4NEXxDDOfw
         O82K/4P3HkZqMumhS4neuEFYqgvNJTu2HyUarbcF9+TlkbllNhdBCNQWz5J0tTLeOKY9
         ZZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765713892; x=1766318692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h6FVs1lq7FCYiXGgCHToT2WUTH1AKvFmKeDMOd7AaH8=;
        b=vQohZXfpqbv/pPAZelMmOfE6W+yL0Q9E41RKlkI3pW8xzBlQHlvKbeddenzIqrNMBm
         LzELa3fhPtlQRWSjIg5/StdXsj6wzb7VTb4Mpio5pbWd7038bYQWKpsftoHJw08hwi8v
         CtAToboLcifmGw1fKZCcguW1j58VGbWlrmuZOyTuB+2eiu9oje/E+BsehVE4fVxeYpTw
         1Fj7JaEEEoClxIwjWi17ciHc/fSmY7OqoN/vS+p/VvHuseag4eNceNMC6rhaMmv+YUoL
         fFo+E/MlTEqLgjpBUmBfP8WMGh111NX5/uqY7Bh59ODSjL8iuk2561mSox6YtkMWKcfM
         eFMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzZHHJODVj7Rw1iF36SA9FazLyLk7hTd43HSVopJWqEDn8Yk3D0eBZb0tVAZhdH1v73JZORYSRtV1ytdkwQ9Bm@lists.infradead.org
X-Gm-Message-State: AOJu0YxnzIuwOGVQO7QLgW6xtlmNbfkg0NCGy5sx3GqFl6gJSEkFRFN8
	ta94OxIyudeABRJ7dWCBdCbR75Mm4VWJCsLy+4dXOZ18AUL/PeoLo4OQSk2S6chL4IhZkkWy7js
	wE54gmFAJDxr9EgUrU4V9gzWws5U4qWI=
X-Gm-Gg: AY/fxX6K4Qe1zUrfVRIRHdoWC4RJ4ORq+ZbMoRunIm/v7cOcqeAHgn0/yXCgtQv1f3+
	uIMtwsLQGxkV8G8r6KAtUj014CYnQ61wI2BFIaUj2Z8UpuU3OrP6Lu3Qd34Azzc9yDN1CqzSbrW
	QLLeSRndKHwbf4fc+o2YU4NU8H1m9dsYTpVBKwp6siV/IZZhUAjL5GHpX4j+DWFtkrs8daXbp+o
	3UiKKSS4p0fQ1z9hJzahhH8e5A7tXwPkoAgfWLZFApkp00QE/8bDYIMhbxR2+ZP4tscmf2DlF83
	M69UZvuh2varCryRYCanVgF5BsY=
X-Google-Smtp-Source: AGHT+IFEHj5vW/XmkFcEYVjxG+F3Nz7WaZtq+0llUfoVvXBqTv4i3OwZA6sGVcQV5jtiS+U2ieRUXKmtZhWxjytV7T4=
X-Received: by 2002:a05:651c:220b:b0:37f:a216:e455 with SMTP id
 38308e7fff4ca-37fd07ad69amr22302051fa.18.1765713891487; Sun, 14 Dec 2025
 04:04:51 -0800 (PST)
MIME-Version: 1.0
References: <20251214110531.9475-1-stefano.r@variscite.com> <20251214110531.9475-7-stefano.r@variscite.com>
In-Reply-To: <20251214110531.9475-7-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 14 Dec 2025 09:04:38 -0300
X-Gm-Features: AQt7F2p36DBHCZVA3WlHXwUgn4u6_L0tGkOCn88lhySCWth0zVlBdA_shlhyg2g
Message-ID: <CAOMZO5AzuZVkD3rTLEDGFpCx0ovtKfzjZtNgGG0uLDXbPkiqRg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp-var-som: Add support for
 ADS7846 touchscreen
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_040454_682198_212B4BC9 
X-CRM114-Status: UNSURE (   8.55  )
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

Hi Stefano,

On Sun, Dec 14, 2025 at 8:05=E2=80=AFAM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       /* Resistive touch controller */
> +       ads7846: touchscreen@0 {
> +               compatible =3D "ti,ads7846";

The public datasheet states that the touchscreen is a TSC2046:

https://variscite.com/wp-content/uploads/2024/05/VAR-SOM-MX8M-PLUS_V2_Datas=
heet.pdf

I understand they are both from the same family of touchscreen
controllers, but shouldn't you use the ti,tsc2046 compatible string
instead?

