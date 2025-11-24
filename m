Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAE7CFD31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvXHuoRgH+XIUx292dJAYC+bXU3Y0ChyF2IbAzcMS/Q=; b=Z5v6Hqb5kWtFkvNGbxG8fm/6wl
	CxF4+XhD/6nTLMVBrmTF7vf+0fVcSIJcELQ7LWQdp5p/fkp+rafhLv0ucYChEd25Xz8kYOgDtqjy5
	kOkDzjp+qff6wywsx+nvQC3Zh0ZESvAK+VP1GSR4hFkLUBdHC5o8l6bMBRLvoZ7LmhjMHWA7W0eWC
	4hJ2rSBgpwl90GXLwq+A492w0+toya8EnvIwluliRO/H2uqHbSU9SC4hwLd/ARDgZcJu5PBVFdW82
	5aQx2XTTDl38FtagG03MKvq8e+ilxgwM7aTyaPurNNldfxbbs61JAW+XhOceBUgDWEY1igE3f2vVq
	vgNzO38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSZd-0000000BJS2-3tFe;
	Mon, 24 Nov 2025 09:09:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSZb-0000000BJRF-0M8o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:09:28 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso2458128f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 01:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763975365; x=1764580165; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OvXHuoRgH+XIUx292dJAYC+bXU3Y0ChyF2IbAzcMS/Q=;
        b=LfDTzSQn4MtMVTGOYpDHhLmfkHUNNSl1oCH6+DFMzJe9OUsM4omzMNIJ9J80ohRgiR
         +572+0XzPx4R9E4jDh8KO0/kNirR2zOE+Z6uohJcgzsY+fgd/p+gNHFFZ9HnVc7BWlQf
         aOQf/XMilClAZzAfbv5VQEx2vuullourg+txHH/rxhHDplxYJ7yH2oXeySJvPPqNwYoB
         r3e2PCAnztvysPRHbnN3nLfCBiLk7rhjG5kuMEKpjlHjOeMKBaLP9v1Ph2NBvyO+TgRb
         THQfJneDuM9vXW70//qyb/UA2+cVBqYidTR+5OoECe5vnYMyz5u4M6ZsmYxV69JqJ5TD
         S2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763975365; x=1764580165;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvXHuoRgH+XIUx292dJAYC+bXU3Y0ChyF2IbAzcMS/Q=;
        b=BDWwZirhuiYu4C1y2wIt5izKTRFNYwf81CKoaNRyNDsUdB/ZkeB+it33GCoehCnBgM
         NhaPRAl+eicgKo12DsFXV/dpxkzar8c6vGdSWZdSTVcQoR6/tz8ZsrpZgB0iT2pNOXQn
         6I9lqWSo3kbY1xNUE8JKt3pWubG9qZh/+wjxSvXpRADQr4eqgn3OT/IP0J3O/l4xpBBS
         fa3GIkMs5wFtEC0naYRwWFLa12C50fWSs4W4Za4eldEkUHen678CpU0ksKktsiocKhLK
         ySBsbAH/AfE4TZFI/cZ64EHaodamTNOntbECn079vUQnNBCYvZfyxek6SwT6erWhkNt6
         /GVg==
X-Forwarded-Encrypted: i=1; AJvYcCUY04L2hIwihBo/Yz+dH26rsx7q+SLllOShJXoGJRDqtH/l7byhmqYTOQN2fJciPqXpo30qwPLTH9IloSg6kRiA@lists.infradead.org
X-Gm-Message-State: AOJu0YzC+/HQ+DpYzlJbo5nelt5edKib2Yb1e4oD7jKawUrLfbqf5rSY
	ifzoOg82hVKUSpCiwM9nCFLG8gR2G3LUT/hN/yQeXdrJmMbaGwVFsTFygXPHSLPsbD8=
X-Gm-Gg: ASbGnctyGQD6frQfEcZxjgsb3Q2bPLNfewaNZRc/gOTd8hgd76Gkwh0Q6Xq3I/WyCfN
	QrAjauyXYBuNs3i/MhwHJnv/eCX0C5M1UoevzhLks9oImV4hlesp2LIVnU9+Vt3mhZbP5qa0LJc
	G54mLhgIPIjA1yx3cIALyzd8OQ3Cbl9W3PmI5qm5fRgZIV2aLdt0zo9GtfqJIUlTc5iGCEWl4rk
	pmNvEHOeDnvzM18YybA7DgNKrBUBvonzlt0G6i6UwJu6WU9vAwYBmEcujoE440J7dJ1FQ/kgXTs
	/WLCZCrIivFgpm37z9RBzC36SKlRkj+2CbTOsvk7NAxqKlTk43E8wjBtjjOjzH+T69BDa667Kz3
	hhiZDv3zJqGUUmnHUqxwcfJru89NFKJfAPlB5VFAz0p6awBk1DrMYGY3339QkdsCHByxLfJ3QfY
	ofWV5TQegQT8muiIIL3Q==
X-Google-Smtp-Source: AGHT+IGb2anSnU9yUNqdmZbv+SeaRHh1StnydsjMu/nMg2MY1ixTXj9wwNITrqgGCjoJ7tz/T/jZVA==
X-Received: by 2002:a5d:5f44:0:b0:42b:41dc:1b58 with SMTP id ffacd0b85a97d-42cc1d19957mr11009024f8f.45.1763975365182;
        Mon, 24 Nov 2025 01:09:25 -0800 (PST)
Received: from draszik.lan ([212.129.72.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm27162766f8f.33.2025.11.24.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:09:24 -0800 (PST)
Message-ID: <9cad7b42dbfea351fb3b708736bf6f6715bcf694.camel@linaro.org>
Subject: Re: [PATCH 6/6] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Mon, 24 Nov 2025 09:09:37 +0000
In-Reply-To: <20251123-max77759-charger-v1-6-6b2e4b8f7f54@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-6-6b2e4b8f7f54@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_010927_185717_2E9077D8 
X-CRM114-Status: GOOD (  22.95  )
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

Hi Amit,

On Sun, 2025-11-23 at 08:35 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> TCPCI maxim driver directly writes to the charger's register space to
> set charger mode depending on the power role. As MAX77759 chg driver
> exists, this WAR is not required.
>=20
> Instead, use a regulator interface to set OTG Boost mode.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 +
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim_core.c | 48 ++++++++++++++++++++=
+----------
> =C2=A02 files changed, 34 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcp=
m/tcpci_maxim.h
> index b33540a42a95..6c82a61efe46 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.h
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
> @@ -60,6 +60,7 @@ struct max_tcpci_chip {
> =C2=A0	struct tcpm_port *port;
> =C2=A0	enum contamiant_state contaminant_state;
> =C2=A0	bool veto_vconn_swap;
> +	struct regulator *otg_reg;
> =C2=A0};
> =C2=A0
> =C2=A0static inline int max_tcpci_read16(struct max_tcpci_chip *chip, uns=
igned int reg, u16 *val)
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/type=
c/tcpm/tcpci_maxim_core.c
> index 19f638650796..6d819a762fa1 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/kernel.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> =C2=A0#include <linux/usb/pd.h>
> =C2=A0#include <linux/usb/tcpci.h>
> =C2=A0#include <linux/usb/tcpm.h>
> @@ -202,32 +203,49 @@ static void process_rx(struct max_tcpci_chip *chip,=
 u16 status)
> =C2=A0	tcpm_pd_receive(chip->port, &msg, rx_type);
> =C2=A0}
> =C2=A0
> +static int get_otg_regulator_handle(struct max_tcpci_chip *chip)
> +{
> +	if (IS_ERR_OR_NULL(chip->otg_reg)) {
> +		chip->otg_reg =3D devm_regulator_get_exclusive(chip->dev,
> +							=C2=A0=C2=A0=C2=A0=C2=A0 "otg-vbus");
> +		if (IS_ERR_OR_NULL(chip->otg_reg)) {
> +			dev_err(chip->dev,
> +				"Failed to get otg regulator handle");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int max_tcpci_set_vbus(struct tcpci *tcpci, struct tcpci_dat=
a *tdata, bool source, bool sink)
> =C2=A0{
> =C2=A0	struct max_tcpci_chip *chip =3D tdata_to_max_tcpci(tdata);
> -	u8 buffer_source[2] =3D {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SOURCE};
> -	u8 buffer_sink[2] =3D {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SINK};
> -	u8 buffer_none[2] =3D {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_OFF};

You should also remove the corresponding #defines at the top of this file.

> -	struct i2c_client *i2c =3D chip->client;
> =C2=A0	int ret;
> =C2=A0
> -	struct i2c_msg msgs[] =3D {
> -		{
> -			.addr =3D MAX_BUCK_BOOST_SID,
> -			.flags =3D i2c->flags & I2C_M_TEN,
> -			.len =3D 2,
> -			.buf =3D source ? buffer_source : sink ? buffer_sink : buffer_none,
> -		},
> -	};
> -
> =C2=A0	if (source && sink) {
> =C2=A0		dev_err(chip->dev, "Both source and sink set\n");
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	ret =3D i2c_transfer(i2c->adapter, msgs, 1);
> +	ret =3D get_otg_regulator_handle(chip);
> +	if (ret) {
> +		/*
> +		 * Regulator is not necessary for sink only applications. Return
> +		 * success in cases where sink mode is being modified.
> +		 */
> +		return source ? ret : 1;
> +	}
> +
> +	if (source) {
> +		if (!regulator_is_enabled(chip->otg_reg))
> +			ret =3D regulator_enable(chip->otg_reg);
> +	} else {
> +		if (regulator_is_enabled(chip->otg_reg))
> +			ret =3D regulator_disable(chip->otg_reg);
> +	}

Given otg_reg is the fake regulator created by a previous patch in this
series, this means that the regulator API is really used to configure two
out of 16 possible charger modes here. That doesn't look right.

Cheers,
Andre'

