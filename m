Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906A3C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/gXgCuauhGKcFUWfulPTHzrfiJTz+du/PeQqhHatQk=; b=HFMrDRQmpMuXsBE1Sgu7imAh9t
	8024xgDTQvkfbHYHMR9gNJxCwxirPrnjLs4xinq+rZAIBjO4zBJn9RSuFXeCxfOvnA860R9OxPoaS
	ZvwhvsfpSGA2fsZZ4eKA1CfVBlxDej3MixVR1EPigZGCg7QJH3eb4n56kfKS3GwE5nEddMfWsG/Ca
	X8dn59ZiPIp/gsBLD8KYD1VBGp5cFymJVzfuC+mgnUM3USMjzB+X+bjWQUdLJtJtV74dgk2WMK7ek
	xy8oWgS1rue0igShj9oKHpu16ObL0EcEff5sNAQtq5yufqfSzNybRtNCz7Fly1WbmhPmkwXxA5Fyn
	kRDi7mgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmKl-00000006cTW-47kU;
	Mon, 20 Jul 2026 11:38:55 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmKj-00000006cSZ-0a4P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 11:38:54 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-497d6c2d000so6322114b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 04:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784547531; cv=none;
        d=google.com; s=arc-20260327;
        b=BRZGoVJpfiZSumeiUXk7dzg6t5GdwS0FYmwk5YyEnUgjeQXsqTLndZ+BW3oNzZuhzG
         ou1UlDJQ2v2JP4ekOZ7P2y2iCwPs727uUqc2yr1TZ4Ot4AMju3uYLrawmUakPL5pOAEh
         Z3CVTSCPXjxExl1Wz52GXBky8evqPuV4/JfmBK/cB7mDwuvwVSQHGN+WEtPOJQO8JjA1
         A4+4BNf+munnT8a14e3IUuxIY08yt6i6JTBgF0NseX8bg8CJKw0Y4FiTbCMS2eCYRjR9
         yN41soMHpxyzWfu/JnD+mYQtm+nqK5138NoJEN0CFgoxK+04N4CNJu6kFxgFNcys5nRf
         rmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f/gXgCuauhGKcFUWfulPTHzrfiJTz+du/PeQqhHatQk=;
        fh=MecwqL/DCAvm58eYyaO/WesT1X5pHUN4d+d8Cj54AY4=;
        b=g+1Q8XdHN94QBvjNe773GRGUQlkiizjqQt43+RJllRMvkOLQoBEv11ZMfPii15oUKT
         EXuvVZAcvebJVlKAgNEdqfXqAEVJxmTAW6LiCdmkr1091yxkDFEcl+7NRJrKkNAf/NED
         y4yC1JiT8z4exUidprIgxyNemnEFBuWEf//xQF9HzuG7rapA0WT6sx9UzrGKoC4BIbmH
         PmiZzcNfJiLkyl3QbdOnhuR8ya9qNd34I8djPFY/YWtbqc7DOl7MCddU6wEovLMCnDOF
         3ZZCCSq9trzgTwpaVpWdkrfzs+tAyXaGCUsewERgU3BAm/khC3SdmkSDO74G5RH09zpZ
         LNCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784547531; x=1785152331; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/gXgCuauhGKcFUWfulPTHzrfiJTz+du/PeQqhHatQk=;
        b=Y/CY/nSY5AKsrV7ZhNRhdPAGKLu6fg7A07ewRfeZoj5aJSy5dmi+1aPQpxXfDi/yE6
         6X4TmqZnjsmm6VnkRvRtgTRBkJyBaBSOm07UWc1QedZOmO01re6VOx2zhljomZuD1bFH
         XyxITk+07WK5tPVHnvnSzxSBaa3AFAGhk8OPWTGuqcz0zvDiiZ5X8l8l/ekhjDEPIK13
         BeLRTfN2udRVFPkBjuAhbdw6eZw39m4OjDqZ0a+60zauQtyB54sInsUqG1pnvxFwVjct
         T/YTBW6yGNJ1U9ATpsBAMKQL79ZPuxwG1l9VDS+Bz1GVGWtbDR0AYpqhuMRKqeVbiH+v
         CBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547531; x=1785152331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/gXgCuauhGKcFUWfulPTHzrfiJTz+du/PeQqhHatQk=;
        b=ZLI7W9VyAUwGw01D9K8RjEFSwHVPsF6GAJLI9Qxq6HG73d8jCRjjaudy4FhE0CR9eG
         hm+vqJj6rQ3l4ixxxYBkFHyN1Bj0L4AUv9pXHttpWFDFxuJ+e/X6lW5ICcLzqwRQvt96
         +lZ5TFa7pc+JchbzB5uqTVdAN1FUD6DIdHEGIYr1K79ukfuXiFxJMCpk8C6O/1mlZZ9Z
         NyuGU1AXXPYKgcF3OjfkKp53WwzRYpnuGn5Qr6bytA5qncT7hDkCCYtY8m3HQP+UZkkJ
         OgEN5pH0j3rseIS5XNl8EsCmj0GEmXYzIg14aHfWBbGnbGYYkUigVRfXXVqj69Ya/t00
         I8Vw==
X-Forwarded-Encrypted: i=1; AHgh+RppUB64aYbMQpETBTzBvb3SizmadisYGJdT+bc+FYczCvqCZvn6gyh5WQzWSLWfJi7v4ST4auVGnnabeAYv9cUX@lists.infradead.org
X-Gm-Message-State: AOJu0YxLio+3BXDy1JCLW2QC0YiRUzx8mb5YkSw/dgWyyF12YoTlBj+P
	hjUhxvousPjpw9rJT1pha+Aq2FFVXT76dx9RpWEDY1gTErgUIYEnl67tg8X7qdwEHZr5gD/u62Y
	a59jdhqsU9fgKQS5h+NdzW2T67FPnBWW+l9N5j6pl
X-Gm-Gg: AfdE7cmRxJHhB01iMgcS/D7H/0FhIXchdtsovRaZ6tbZPqtcPrsddaJff43Q9Wo8oWL
	1kljaqKBtfemBo23cT6FjLtGIOlZUjjHV0Vo6nMVnmdl/Iq/elKzt+XRsRacM2M0TDz+tDbMhAa
	rk96NpHgD+MNVT3SzhDsNRePE0rxmU6dIXbafIlfaxjZCNdN7OBUKCW6A8vVWJliybjs9e3GnFQ
	XFUZDvXs+gZ25H42BFVQG7QJDQN45HwCGOIYRl/fef+4443zKGIt/vXNb/nqa31R/B7m4NAFKvA
	hg9X/qswvEjq9NG9IA==
X-Received: by 2002:a05:6808:150b:b0:49a:3094:57bc with SMTP id
 5614622812f47-4a4d057091emr7828138b6e.43.1784547530438; Mon, 20 Jul 2026
 04:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com> <20260719-usb-ptr_err_patchset-v1-3-85f7f2e4fefb@gmail.com>
In-Reply-To: <20260719-usb-ptr_err_patchset-v1-3-85f7f2e4fefb@gmail.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 20 Jul 2026 04:38:13 -0700
X-Gm-Features: AUfX_mxW23vWV4YHSucfnpNg2RwqWb4K0lV2PtTDbAAqVY6VN7Bv5eoCWZEPBx8
Message-ID: <CAPTae5L7CaQoa+Zy7r3ezZQ_giY5nWOut82P5rC_8v6YeC-0Ag@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: typec: Use %pe to print error pointers
To: Subasri S <subasris1210@gmail.com>
Cc: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Duncan Sands <duncan.sands@free.fr>, Chas Williams <3chas3@gmail.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Hans de Goede <hansg@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_043853_187413_060DD89A 
X-CRM114-Status: GOOD (  18.48  )
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

On Sun, Jul 19, 2026 at 5:56=E2=80=AFAM Subasri S <subasris1210@gmail.com> =
wrote:
>
> Use the %pe format specifier instead of %ld with PTR_ERR() for printing
> error pointers in various typec drivers. This prints symbolic
> error names (e.g.-ENOMEM) instead of errno numbers (e.g. -12),
> making error logs more readable.
>
> This patch fixes coccinelle reported warnings:
> ./typec/tcpm/tcpm.c:4799:60-67: WARNING: Consider using %pe to print PTR_=
ERR()
> ./typec/mux/pi3usb30532.c:143:3-10: WARNING: Consider using %pe to print =
PTR_ERR()
> ./typec/mux/pi3usb30532.c:155:3-10: WARNING: Consider using %pe to print =
PTR_ERR()
> ./typec/wusb3801.c:281:5-12: WARNING: Consider using %pe to print PTR_ERR=
()
>
> Compile tested only.
>
> Signed-off-by: Subasri S <subasris1210@gmail.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/mux/pi3usb30532.c | 8 ++++----
>  drivers/usb/typec/tcpm/tcpm.c       | 2 +-
>  drivers/usb/typec/wusb3801.c        | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/=
pi3usb30532.c
> index 985683fe49e9..a2357a28ecf4 100644
> --- a/drivers/usb/typec/mux/pi3usb30532.c
> +++ b/drivers/usb/typec/mux/pi3usb30532.c
> @@ -139,8 +139,8 @@ static int pi3usb30532_probe(struct i2c_client *clien=
t)
>
>         pi->sw =3D typec_switch_register(dev, &sw_desc);
>         if (IS_ERR(pi->sw)) {
> -               dev_err(dev, "Error registering typec switch: %ld\n",
> -                       PTR_ERR(pi->sw));
> +               dev_err(dev, "Error registering typec switch: %pe\n",
> +                       pi->sw);
>                 return PTR_ERR(pi->sw);
>         }
>
> @@ -151,8 +151,8 @@ static int pi3usb30532_probe(struct i2c_client *clien=
t)
>         pi->mux =3D typec_mux_register(dev, &mux_desc);
>         if (IS_ERR(pi->mux)) {
>                 typec_switch_unregister(pi->sw);
> -               dev_err(dev, "Error registering typec mux: %ld\n",
> -                       PTR_ERR(pi->mux));
> +               dev_err(dev, "Error registering typec mux: %pe\n",
> +                       pi->mux);
>                 return PTR_ERR(pi->mux);
>         }
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 89eec20a2064..ad10470ea73b 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4796,7 +4796,7 @@ static void tcpm_typec_connect(struct tcpm_port *po=
rt)
>                         port->partner_desc.accessory =3D TYPEC_ACCESSORY_=
NONE;
>                 partner =3D typec_register_partner(port->typec_port, &por=
t->partner_desc);
>                 if (IS_ERR(partner)) {
> -                       dev_err(port->dev, "Failed to register partner (%=
ld)\n", PTR_ERR(partner));
> +                       dev_err(port->dev, "Failed to register partner (%=
pe)\n", partner);
>                         return;
>                 }
>
> diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
> index 6062875fb04a..86d13ab41670 100644
> --- a/drivers/usb/typec/wusb3801.c
> +++ b/drivers/usb/typec/wusb3801.c
> @@ -277,8 +277,8 @@ static void wusb3801_hw_update(struct wusb3801 *wusb3=
801)
>                 if (partner_type !=3D WUSB3801_STAT_PARTNER_STANDBY) {
>                         wusb3801->partner =3D typec_register_partner(port=
, &desc);
>                         if (IS_ERR(wusb3801->partner))
> -                               dev_err(dev, "Failed to register partner:=
 %ld\n",
> -                                       PTR_ERR(wusb3801->partner));
> +                               dev_err(dev, "Failed to register partner:=
 %pe\n",
> +                                       wusb3801->partner);
>                 }
>
>                 data_role =3D pwr_role =3D=3D TYPEC_SOURCE ? TYPEC_HOST :=
 TYPEC_DEVICE;
>
> --
> 2.43.0
>

