Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75738C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fyc1yaw37X9Hy+KPrdEbRh/UJTHUV0AcPCsCJ/7TTWI=; b=mBoXAnr6cE/0sm9fWEl+zyhV5t
	j02edGyR3tu2KjyODTUX33HZOVSDAjlpLY01CDXBLeT5nCj9FU1yN8BZd31Ek7MqxFtkByjQbW88T
	MoRZn84E0+S1MPdJbG0o+scFpAZ7j1VRf+PEA4SSE09jrbx25BzJ0CHJWOO2+jTW+APCLXj6jtj7D
	Cum2gZgblODQJtPXuEceQJPsYxdKI4qcqmL9hB/GNkBDNpyONxCcGtT/dPtWbJ/RRELW+eiqTQ9fq
	YqULWHCGFJsZpjc4sKR+mkvFQOm1SlIp/QBPJVGxsLTrqdYpSjWenlbntqQ7PmtmLm632dgq6u8ny
	pPRDcRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUO0-0000000AF1g-2Jha;
	Thu, 13 Feb 2025 08:15:52 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUCR-0000000ACpD-1XzZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:03:56 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54506b54268so513518e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 00:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739433833; x=1740038633; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fyc1yaw37X9Hy+KPrdEbRh/UJTHUV0AcPCsCJ/7TTWI=;
        b=32ayQWiaML6aNMeo3J89yDEQjj17r2aMCbun6Q4wLIECi+wp1UscoljmWVG0cDNoHu
         em+0t2L8V3D4Do9g4Qn5YV3ohxEwAv/FHpcC+oKEtZB+eb54kiYoQGZdUX6Ls7NoKLoe
         KNALxmIept4ViMpKTiiGmTbo0UMYEzdgwkfTyI1WZTHYwNXqkVHysdqTFlnqchI9lnLO
         ILZ7cWej1ZoZUM695SOCwRJ4dJg0Zm/fMBivyQv0tmpwQD0iNk2xkFQZyndyZJhRIHkR
         QrjlodBvQB16L7jltOtK9nCS/n+LEQ0UEhxd3/lTtwU28clcJjfchyiHYVIjz49aeq8d
         tOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739433833; x=1740038633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyc1yaw37X9Hy+KPrdEbRh/UJTHUV0AcPCsCJ/7TTWI=;
        b=QFtOChj4bTqstBnRsWQVA3U68AJ3ZrO0Dlcx5QmQU5sjv7nO1kK0dWhM/+z1iCCmx7
         zARuT56VTPL0RtBnIdVgdBVsQPKyzJBfmbiYUraet0CKCqdNdMKRgw3e7efWXxviNGDT
         sWr+z1RCzYUhMnO/ErYPXDv/X0rG5r9F33l11vWsWQw3w22k4h1VDyPmAUXHlKgCYeWj
         dlX2XanD3bTnoMPRDAFD1R0lZjtJglDJ2t4PeafC2majKLj3EKoKE46Cw1X/3YnnYsFD
         e3gGk3KNOcCRFqpYjXxLW7G4BRdse7Ijjx76Pi5bzvTGLkx/gncXahP401yfYzpQvoSM
         UszA==
X-Forwarded-Encrypted: i=1; AJvYcCUcneJOjR0cLLvJm2Fd/rygFNi8qWktDj0hY3/28l86fQRTWHTnTZFzCUjC6HW4czJGqcnR/OLTJxV7qsPu1YFn@lists.infradead.org
X-Gm-Message-State: AOJu0YweXLBBUVMB/NWR62MIPUPjIWbNnrbple3ZCK2qXzX85Yc/PvUU
	meEmNbWpPdN+X/8qrDL6r9NBQKtcWmT1Zhx6SLNHUfUUNdXWszU3Ux+kGlOdw8S1k0PI7z/Rvoi
	nzXQ+M3S/GFF3wU7nHA4sfAt+uUdHIo6V/qIG
X-Gm-Gg: ASbGncse0TkvxAix0lZ90LjSiP5gkkHotPcemeVa9G6x5g7cQNIoJegFdV35RmxbZrm
	uvsxhsLdctot2xPDDxlj+CzsMKNewOCO9wDBEo1K/+srcmZnI6/JiFEbMJgwBX6aHiKaTI5o=
X-Google-Smtp-Source: AGHT+IFWyIrhkyKlq1DLb3nMjYFpG5D1inOQfYzABRURIba5WYtufrGTgdJdkB8ZyACpw4GjQScdFhUnuN3eyI7vuSU=
X-Received: by 2002:a05:6512:b29:b0:545:c9d:ef26 with SMTP id
 2adb3069b0e04-5451dde812cmr595357e87.46.1739433832285; Thu, 13 Feb 2025
 00:03:52 -0800 (PST)
MIME-Version: 1.0
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com> <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain> <Z6x8cNyDt8rJ73_B@bogus>
In-Reply-To: <Z6x8cNyDt8rJ73_B@bogus>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:03:15 -0800
X-Gm-Features: AWEUYZlo14W5CDbxko4W2HItMT0EmqxiYqRbj09Nfq6VGtFk976X-V52R5aJvug
Message-ID: <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_000355_416107_E47A3E67 
X-CRM114-Status: GOOD (  36.12  )
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

On Wed, Feb 12, 2025 at 2:48=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com>=
 wrote:
>
> On Wed, Feb 12, 2025 at 03:01:20PM +0800, Peng Fan wrote:
> > On Tue, Feb 11, 2025 at 05:13:21PM +0000, Sudeep Holla wrote:
> > >On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> > >> From: Peng Fan <peng.fan@nxp.com>
> > >>
> > >> Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
> > >> SCMI_PROTCOL_PERF protocol, but with different name, so two scmi dev=
ices
> > >> will be created. But the fwnode->dev could only point to one device.
> > >>
> > >> If scmi cpufreq device created earlier, the fwnode->dev will point t=
o
> > >> the scmi cpufreq device. Then the fw_devlink will link performance
> > >> domain user device(consumer) to the scmi cpufreq device(supplier).
> > >> But actually the performance domain user device, such as GPU, should=
 use
> > >> the scmi perf device as supplier. Also if 'cpufreq.off=3D1' in boota=
rgs,
> > >> the GPU driver will defer probe always, because of the scmi cpufreq
> > >> device not ready.
> > >>
> > >> Because for cpufreq, no need use fw_devlink. So bypass setting fwnod=
e
> > >> for scmi cpufreq device.
> > >>
> > >
> > >Not 100% sure if above is correct. See:
> > >
> > >Commit 8410e7f3b31e ("cpufreq: scmi: Fix OPP addition failure with a d=
ummy clock provider")
> > >
> > >Am I missing something ?
> >
> > Could we update juno-scmi.dtsi to use ?
> >
> >  &A53_0 {
> > -       clocks =3D <&scmi_dvfs 1>;
> > +       power-domains =3D <&scmi_perf x>;
> > +       power-domain-names =3D "perf";
> >  };
> >
>
> We can, but I retained it so that the clocks property support can be stil=
l
> validated until it is removed. I think there are few downstream users of
> it. It is not just the DTS files you need to look at when dealing with
> such things. It is the bindings that matter. Until bindings are not
> deprecated and made obsolete, support must exist even if you modify the
> only user in the upstream DT.

Sorry, been caught up on other stuff and trying to get to some long
pending emails.

Sudeep,

Do you know why commit dd461cd9183f ("opp: Allow
dev_pm_opp_get_opp_table() to return -EPROBE_DEFER") was needed? I'd
think fw_devlink would have caught those issues.
I'd recommended reverting that/fixing it differently instead of
creating commit 8410e7f3b31e ("cpufreq: scmi: Fix OPP addition failure
with a dummy clock provider")

Peng, Sudeep,

If you make fwnode ignore the cpufreq device, then it'll also not
enforce ordering between cpufreq and it's suppliers like clocks and
power domains. Not sure if that's a real possibility for scmi (I'm
guessing no?). Make sure that's not going to be a problem.

Cristian,

Thanks for taking the time to give a detailed description here[1]. I
seem to have missed that email.
[1] - https://lore.kernel.org/arm-scmi/ZryUgTOVr_haiHuh@pluto/

Peng/Cristian,

Yes, we can have the driver core ignore this device for fw_devlink by
looking at some flag on the device (and not on the fwnode). But that
is just kicking the can down the road. We could easily end up with two
SCMI devices needing a separate set of consumers. For example,
something like below can have two SCMI devices A and B created where
only A needs the mboxes and only B needs shmem and power-domains. This
will get messy even for drivers if the driver for A optionally needs
power-domains on some machines, but not this one.

        firmware {
                scmi {
                        compatible =3D "arm,scmi";
                        scmi_dvfs: protocol@13 {
                                reg =3D <0x13>;
                                #clock-cells =3D <1>;
                                mbox-names =3D "tx", "rx";
                                mboxes =3D <&mailbox 1 0 &mailbox 1 1>;
                                shmem =3D <&cpu_scp_hpri0 &cpu_scp_hpri1>;
                                power-domains =3D <&blah>;
                        };

Wait a sec, looking around at the SCMI code, I just realized that you
don't even really care about the node name to get the protocol number
and you just look at "reg" for protocol number. Why not just have
peng's device have two protocol@13 DT nodes?

cpufreq@13 {
    reg =3D <0x13>;
}
whateverelse@13 {
    reg =3D <0x13>;
}

You can also probably throw in a compatible field if you need to help
the drivers pick the right node (where they currently pick the same
node). Or you can do whatever else would help make sure the cpufreq
device is attached to the cpufreq node and the whateverelse device is
attached to the whateverelse node.

Looks like that'll first help clean up the "two devices for one node"
issue. And then the rest should just work? Cristian, am I missing
anything?

Thanks,
Saravana

