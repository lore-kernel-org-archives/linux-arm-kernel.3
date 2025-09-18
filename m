Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DC9CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxqmW3n9Sw4jw325VsVgJ6XHMVW6nHnWRwX1gianPwM=; b=Jl/pC7MtK0A5jQfZfhOk3XDbrY
	3vti+CloRc4Ht+Z8htC3t4lyGN6q5H7G/8zkwv0xjBDgKiYJPoquEMctLzEpVu8KDfrEHlz4xWi4P
	+qM7X5Hd67nydYRhEoWB2xKskA0UCcZU+k5C2d8LJs7I3GyWrGTcEUgYyspl9wkWMmX6GPOSDTofJ
	mf7t8ElrbqcNI611WfASM1qpp4SjncKnZU00ijqgKp94bJkyp5IFQHc7p3c2TjdkTpjzTCKlEHF1I
	EOxF6vNx+maXZ3wrwmpfT2CK8kHx7nAPFs7Baqa2XK32IfdyHNh7c5TfG7TR0UDfSOyK9reR9LIHd
	LYf2dxtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGMo-00000000KDp-0otd;
	Thu, 18 Sep 2025 15:16:14 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGMl-00000000KCm-1zes
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:16:12 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-739b67d0423so4145487b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208570; x=1758813370; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxqmW3n9Sw4jw325VsVgJ6XHMVW6nHnWRwX1gianPwM=;
        b=HcUJ6BN/F+SH9QJ05GUzPjLg+UeRZ5kU79g953RI7sa7+kuYQ21EMIOQHl7FmQK4bW
         wKOr6HRWnEBn2Y11Gjj1kdE09Qx4hp2jE4kwD1jz7THSSqH+u2rwd2hhsTK5qyjN7wsA
         FFzOmBWqKICYaPnZDwm1fGyQZCcNac3ky0owEJiwXQkofiv3GD/C+zneLZsjjoPm4413
         TUsQKek3/ycsYU6J/YRjqu37jVTcj9ahQYAypqQd5uyDa4mVYbxdvWURqP9QXUhmJdjO
         bdQHF1ehEOd6jeB/p0DvHJ00hQrnVo2P4FmXp5VTF27lS3dFrWL+6kYaSDNuvmXRAzug
         Pg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208570; x=1758813370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxqmW3n9Sw4jw325VsVgJ6XHMVW6nHnWRwX1gianPwM=;
        b=eUyic4/3+yOn9BQOUtuxZS9ddsRXnlJV4jv9SfH1diTWWntMCbAs8vlen7kDri4hWH
         ysCuqY64r1I9Cw5BIPTLwoVwyx0ly3M1zChmHfBSbGjKN+kMq3BOMT3cFBz0nFNPA3Cs
         TxFy7xC1P4KUEpNqupNhGHWsXNPCL9iNBMERmNpoXf8SmxiiErAH3LMojlyjYIpadmK2
         TQLA4EKTC7/ewbXILCF+0+plQga9sNgToP/8Ll4JATLddttC6DKLAUdpgZIYmQKniy4X
         bw2xEkEVN7lEPEIYRynFv33XSrEQiQluNPW0hfJ8+sd4r08gRtwgMdyEVWCI7socMV7k
         Lo3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWThNapGc5U5PyXAVjN9Y2hn2lPYE11yWX4/jOuh7UHPZ9UdeqdPklnAhF/GqaZFPlTtIiaAf6UukQYw+yKTns5@lists.infradead.org
X-Gm-Message-State: AOJu0YwiDJVzBFZH6FzNnrzMhlJdh5/rrzCJz0iuAbdu7G4WDbBObAzT
	LOATqmY/WpHQpzEnNJdbl6GDp3C1ylsIh1CE9BHl6HNZrwRLAXK14lgv6eKU1GJhZSffphNS/4O
	0C/iBXPp9tcQ9mbj5TMPDY8MkEt8sA5Us8eljjganTA==
X-Gm-Gg: ASbGncvy/FRc8LcyAkPsA5QdmrbXmrHph1dN6UWdJu4sOJkzsqix6+Kr+4fuZIwhRgR
	DArm0xnD6AudP5tmpCC//yk44emsu7rv474g5ZOUO1bGybz3rxjT+RZdq51jOWsu8stT/bPF9qj
	61QcrGugtPCzauz2TZl1vciJgANgsRx4uTl3ucXWAdd7pcnZlxFa1TbZTqTaoGQbKjSHrv9A5RJ
	80b8Il9ysVl41iprSXvl9c=
X-Google-Smtp-Source: AGHT+IGhhJ7Bv3R+nZnqBzlYOnhgsyWlmTzS9C8s6bR8WkgRrUao/WcQHEslpUiS5E5xsVP21eeJhMPtVBvj4DhTSeo=
X-Received: by 2002:a05:690c:7108:b0:720:d27:5d0 with SMTP id
 00721157ae682-7388e0ff14fmr49402547b3.0.1758208569760; Thu, 18 Sep 2025
 08:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-4-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-4-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:15:32 +0200
X-Gm-Features: AS18NWCz7mrWAc40Ox1MHdxef1Mp2CL_HkIidm9lOboNSf8e8s0UW_BDcKfNYeU
Message-ID: <CAPDyKFrMPz8X23WAoj_8A3-SsdpbZZ5Ss9MbLK0yy6FLRytTVA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_081611_520248_D2AA332C 
X-CRM114-Status: GOOD (  18.06  )
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

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> i.MX95 DWC3 inside HSIOMIX could still wakeup Linux, even if HSIOMIX
> power domain(Digital logic) is off. There is still always on logic
> have the wakeup capability which is out band wakeup capbility.
>
> So use device_set_out_band_wakeup for i.MX95 to make sure DWC3 could
> wakeup system even if HSIOMIX power domain is in off state.
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index bce6af82f54c24423c1e1fcc46913c8456b6f035..fde158d1f6e3d89d261ed3689a17d703878c7e37 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -248,6 +248,10 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>         }
>
>         device_set_wakeup_capable(dev, true);
> +
> +       if (device_is_compatible(dev, "fsl,imx95-dwc3"))
> +               device_set_out_band_wakeup(dev, true);
> +

Similar comment as for patch3, please set this from system suspend
callback instead.

>         pm_runtime_put(dev);
>
>         return 0;
>
> --
> 2.37.1
>

Kind regards
Uffe

