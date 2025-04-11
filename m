Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0625C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 16:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5FckoYafwVaXPWK2PUB+GpDyPBlHFtc4ZPOsKk2Ipg=; b=Yp2F7X91qIGvBEguuoWuAY0mx/
	MgiYujzj0JLIixEmWecmP9TKEbkzVHnweD+UWMJr6oF6pc0T1tfJAYIWFF/yitwt+uxeU22cH6+vc
	COlXSTbx3luxnz6XW71n/9oLYgrVKoS0desqvEToX6FC38AHfbZ0oFDShW/15LlQUUlkP753aGffR
	Z39rr6ptV3Xxg/FX6INPrQY1xnzw2k4iwkpu3rOMAxbHxse6XxDZYYtrve4ZhOTTueqcdtx+IU8/8
	mILPOHdDErKMIIOHRr0YLAowBpWOTeXjXgcbUGzfoiJn39J2aXCiQ1mqG06nbApNtQqi+5xu19lpX
	Hfvvq8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HEH-0000000EMJj-2udS;
	Fri, 11 Apr 2025 16:27:45 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HAE-0000000ELhj-3WrS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 16:23:36 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-af51596da56so2124555a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 09:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744388614; x=1744993414; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T5FckoYafwVaXPWK2PUB+GpDyPBlHFtc4ZPOsKk2Ipg=;
        b=TxeRkYVZ9A6LBpYAvLUemWaTnkqIUvjh2igunSAg8pRohm2Jlagv6hqAqBiloCE2qE
         7jM9GaOtqOcWrNOPuDnFDCNeidNWJjtS/nta9F2IXVbYdoVq1vJZOdybOK7LFpDh8lNw
         YO9Wf1Rs5kTvTUVV4PoITlV+wKaZBDC6THxfICU1iS7orxaf73uvnxEZ9soVP807SXZc
         OxdbjT2nViyxYceNxo3ePR6cjHAc9nrpH0n6UrLL57F02MUoowheEX5RqTx/w5M3u9A/
         sNYRDwkSToy247ltJmX1D4oGc93AmZJR8Mid/vHkaR1H35P9XHKWlUcB/NbFDXZfM/vO
         mvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744388614; x=1744993414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5FckoYafwVaXPWK2PUB+GpDyPBlHFtc4ZPOsKk2Ipg=;
        b=VsQ9zyqe3kSxxVwDRULHQh8utSZAYE5wrqXYmUyC7Pk2FFa9EAKr1dMDBZc3Yb5irf
         /x3ecDjVwwGkXtoSEH6JB7WQUL1B7RN4CmE7wa3Z6+JCiZ250bq91yQ9qlgzF3r1l2w8
         VJ+C6XuUppvmOx4gVpvvWORi/PjynAtzkBvExiX/a+9oraAunO6Nd3xKNRh3Q1aAWcLU
         qf4wW+o/A5r2b7RpjCR9P2aA9/6pXMU4dL5B8Uaaj6p9JqQKm2lFbsWurh33JnbYJPVF
         jJ+dhwvo9juPZCxjc5WCjFMaW/TER3DvqX9i9yQOTxB0T86u/o1FaNHef6G8OAkxHF0C
         0w9A==
X-Forwarded-Encrypted: i=1; AJvYcCXKdEYtW4brxW2auwD1+hyBg4LLYesHRinlCdfgnRGvVw/R4a5/TRsVzzUfCLkHHt4E4xoAagbpQHfl+c9NyZ0F@lists.infradead.org
X-Gm-Message-State: AOJu0YzSpoEAOOD/XXK8iiQNkLyc8QYBf+AcKj78X7xra+MoeIgA/DZW
	i/RtcqtdD+gwvk+7RyMi5ZFa6sFAzBw6+PoV3FCG7UJP7xFDugfO
X-Gm-Gg: ASbGncs/xEYLI6l3ZBieL2cXV3r8NXQZ2DD2ULSofVVABmJ+oVxEURCAXtHmF5vF7uX
	R3PYBsFO+9cjYc5TKQVU1gc31C33RdirCkS/sz/axi1kss0DIfzFrhNEZdqOfg7JUd/0eVUcHKl
	9WrFGvphk5xt872ZwM3KMoE7a6AX1vidmFxxlXdgu8Tu7IzEKkNsFJ32kpofeLW/qROrAr4HEIA
	QyuyHleGCbuTl6HsIBEMUB3ikCB6lsJ9Lv+obNMttJCe+bdl+hqlLpUsNWcfZDV+EGRM06PaOEW
	eUah/PgzqpbcPj0dNMad7QOx8BwrlFv/a2mw5K4b7/5ye4eJig==
X-Google-Smtp-Source: AGHT+IFCfUV6384bNBCr+vSp/DTf6SVjkwz2rSVIWqsuCTiK8sT2R3/nhh6FK0ZbTjida+uNgTjQKg==
X-Received: by 2002:a17:90b:2647:b0:2ff:5ec1:6c6a with SMTP id 98e67ed59e1d1-30823646ae2mr5751053a91.18.1744388613682;
        Fri, 11 Apr 2025 09:23:33 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c3:a964:9277:4e8:b712:66e2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df06a14bsm5814830a91.1.2025.04.11.09.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:23:33 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:23:28 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X when
 Cortex-M4 is running and it was started by U-Boot bootaux
Message-ID: <20250411162328.y2kchvdb4v4xi2lj@hiago-nb>
References: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
 <20250411125024.i2pib4hyeq4g6ffw@hiago-nb>
 <PAXPR04MB8459ED6CE869173D4051257088B62@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459ED6CE869173D4051257088B62@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_092334_904738_69218BF1 
X-CRM114-Status: GOOD (  38.14  )
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

Hi Peng,

On Fri, Apr 11, 2025 at 01:23:32PM +0000, Peng Fan wrote:
> Hi,
> 
> Sorry for late.
> > Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X
> > when Cortex-M4 is running and it was started by U-Boot bootaux
> > 
> > On Fri, Apr 04, 2025 at 11:17:13AM -0300, Hiago De Franco wrote:
> > > #regzbot introduced: 4f6c983261
> > >
> > > Hi Peng and all,
> > >
> > > Commit 4f6c9832613b ("genpd: imx: scu-pd: initialize is_off
> > according
> > > to HW state") introduced a regression where the Kernel reboots
> > > unexpectedly (without any warnings, crashes or errors) when the
> > > Cortex-M4 was loaded and running by U-Boot, using the bootaux
> > command:
> > >
> > > # load mmc 0:2 ${loadaddr} /home/root/hello_world.bin # bootaux
> > > ${loadaddr} 0 # boot
> > >
> > > This is a simple hello world binary that prints a message into the
> > > M40.UART0 pin (demo from NXP MCUXpresso).
> 
> Which release is this image from?

This is MCUXpresso SDK 2.9.0.

> 
> > >
> > > Before this commit, everything worked as expected, Linux boots fine
> > > and the HMP core keeps running and printing messages to the UART.
> > > After the commit, the kernel reboots at the beggining of the boot
> > > process. The only relevant message is printed by U-Boot after reset:
> > >
> > > "Reset cause: SCFW fault reset"
> > >
> > > This commit was bisectabled, the same device tree, u-boot version,
> > and
> > > SCFW versions were used. Reverting this commit fixes the issues.
> > >
> > > For testing purposes, I created the following patch which also fixes
> > > the
> > > issue:
> > >
> > > diff --git a/drivers/pmdomain/imx/scu-pd.c
> > > b/drivers/pmdomain/imx/scu-pd.c index
> > 38f3cdd21042..0477b3fb4991
> > > 100644
> > > --- a/drivers/pmdomain/imx/scu-pd.c
> > > +++ b/drivers/pmdomain/imx/scu-pd.c
> > > @@ -539,6 +539,9 @@ imx_scu_add_pm_domain(struct device
> > *dev, int idx,
> > >                 return NULL;
> > >         }
> > >
> > > +       if (strstr("cm40", sc_pd->name) != NULL)
> > > +               is_off = true;
> > > +
> > >         ret = pm_genpd_init(&sc_pd->pd, NULL, is_off);
> > >         if (ret) {
> > >                 dev_warn(dev, "failed to init pd %s rsrc id %d",
> > >
> > >
> > > Test Environment:
> > > - Hardware: Colibri iMX8DX 1GB with Colbiri Evaluation Board.
> > > - U-Boot Version: 2024.04
> > > - U-Boot Build info:
> > > 	SCFW 83624b99, SECO-FW c9de51c0, IMX-MKIMAGE
> > 4622115c, ATF 7c64d4e
> > >
> > > The issue is not present on: v6.5
> > >
> > > The real root cause is still unclear to me. Anybody has any ideas? I
> > > am happy to share more details if needed.
> 
> Have you tried pd_ignore_unused? 
> 
> I think it is linux power down M4 which M4 is running, then SCFW
> reports error. So please give a try pd_ignore_unused.

For debugging purposes, I tried it and it works, kernel boots fine with
M4 running and pd_ignore_unused parameter.

> 
> If this is the case, may I know do you have m4 nodes in dts and
> with power domain included?

This is the device tree overlay I am testing:

/dts-v1/;
/plugin/;

#include <dt-bindings/clock/imx8mm-clock.h>
#include <dt-bindings/firmware/imx/rsrc.h>

/ {
	compatible = "toradex,colibri-imx8x";
};

&{/} {
	imx8x-cm4 {
		compatible = "fsl,imx8qxp-cm4";
		mbox-names = "tx", "rx", "rxdb";
		mboxes = <&lsio_mu5 0 1
			  &lsio_mu5 1 1
			  &lsio_mu5 3 1>;
		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
				<&pd IMX_SC_R_M4_0_MU_1A>;
		fsl,entry-address = <0x34fe0000>;
		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
	};

	reserved-memory {
		#address-cells = <2>;
		#size-cells = <2>;
		ranges;

		vdev0vring0: memory@90000000 {
			reg = <0 0x90000000 0 0x8000>;
			no-map;
		};

		vdev0vring1: memory@90008000 {
			reg = <0 0x90008000 0 0x8000>;
			no-map;
		};

		vdev1vring0: memory@90010000 {
			reg = <0 0x90010000 0 0x8000>;
			no-map;
		};

		vdev1vring1: memory@90018000 {
			reg = <0 0x90018000 0 0x8000>;
			no-map;
		};

		rsc_table: memory@900ff000 {
			reg = <0 0x900ff000 0 0x1000>;
			no-map;
		};

		vdevbuffer: memory@90400000 {
			compatible = "shared-dma-pool";
			reg = <0 0x90400000 0 0x100000>;
			no-map;
		};
	};
};

&lsio_mu5 {
	status = "okay";
};

This was basically copied from
arch/arm64/boot/dts/freescale/imx8qxp-mek.dts. Do you see anything
wrong? Should I also add the "clocks" property to imx8x-cm4 node?

> 
> Anyway, I will give a try on i.MX8QM EVK.

Great, thanks.

> 
> > 
> > Hello everyone, as this introduced a regression, should I send a revert
> > for 4f6c983261? 
> 
> Please wait a while, I think we need find root cause.
> 
> Thanks,
> Peng.
> 
> Or any ideas that might help fix this issue?
> > 
> > >
> > > Cheers,
> > > Hiago.
> > 
> > Cheers,
> > Hiago.

Cheers,
Hiago.

