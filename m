Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F65DC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuU7vghs/Roa4fUMqe76N60+pRs9TTlZ7VpQ6fcHfmM=; b=BNwfUHjZH4AOMMH1PxUPXgz3Nb
	8iDSuijQbTjBZemmIfSIJemeQfJNKpTzPNu3lzJ7HN0JjFa9JrVGPOBk8TKEDXxL88AxlxY7LWGlH
	zm0ZeRqv8exEQls0NnUgPspAPutHURQFY703d2DMflP4gIbOD0bBKtfZiLES7rpXA2m6mijnSbtjn
	LKuKijUeXbnTgIag66+dA3QbsFRFcoH9FsmufL0vfeC2rxKRgeZIeKhWEVDvboVnQVP1lR5vZ2PRd
	0ofOIDaDt9sCfjl7VSDwtoHpTy5aBirsnrj1MF8UQG171O4Zzt9SDDWtQLPFocjTc3nxUhL8EPgbC
	u+5oENPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKlX-0000000DqCZ-0Ps9;
	Wed, 28 May 2025 17:40:35 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKjN-0000000Dq2Y-0LOp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 17:38:22 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-87e0ce80ed4so1034241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 10:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748453899; x=1749058699; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuU7vghs/Roa4fUMqe76N60+pRs9TTlZ7VpQ6fcHfmM=;
        b=CYqg1SH7uRt8b9he7ZWQz4ySgp4DcZ3YKu3IjJE+3t2ms1IFuWkElWFpl5kErjqWZp
         cRc0db8xLfSLoGj2+7U+9DV6OdycjC6oJyrNnFKnZCIgUHgLSxEgv0GFS/VlsMNduF0U
         /Fgpkh45BIBy3yl1No8dc1lj4YtaUMiP4ovWeCUONGhWgM4EAK6xmmTN4+ybAcFEePSx
         WIUcgFTtGlKFII3NzUu9zaJnQKxTAW1gUTJZRRtUC2jD9t7oqg4FQHgmX4pMe3jjWnyB
         Vgr2GIPvodBGNZPyGdor/07CFx/X+vPo+qQrgBBfeigxgEoO0fRq4h+yiwucI5Qcal90
         RhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748453899; x=1749058699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuU7vghs/Roa4fUMqe76N60+pRs9TTlZ7VpQ6fcHfmM=;
        b=R9JflF2PPCION7Jdv21rJ0HL/A2im9nmzNvDuQmyOTyL0m4rjTXVwPNcOpyIK026Vg
         2e6egh6RVNM5K47hETR3DvXF2vYf2lLuR6a+LtP/ndWG9v00bnUQ92NIUh9uyiV6kNZv
         oDlbB0mWKuFgMNZNihoEuM+q9OI5/9PWdvpasxcPRDO/2Daq6lCelAvnukHdvldISOLK
         0MIjInc27S8KKkra3+Cn7zQIogwtX0O1pfFkrxyWor1AS2AKOv+exXGWCC8XCA/9QXfh
         aYAv1j4OsgUwmuiqsXIc8Tv3JU5VATdZ9H7tzfNPVD5yEX6hpYSk4V7JwGWGOHwwfg7/
         9eQw==
X-Forwarded-Encrypted: i=1; AJvYcCUrLHxg27RH9UtGRHZdIoWrVKOMmNtXrcMzuHgenjleP55XVCaXk9iT+Ze6TYmIur0eZV5FoTl6ClqfUC0AYWnu@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu2/ZA9r4m7YL5WrLAALcz+wwKSZPGrP7tyxuzaeZFoYyP45Z4
	lvydVzjtazkFFDt3kGZCdA2+/HUZhk0t5fKsdd/i3ZS8AM5RBJMNkO8s
X-Gm-Gg: ASbGncvKNXTWZ8fGvpZtw7js8MSmcquqkb52V3nj01Th+hUrp09q7QfoDNWFPrXGNit
	NEwp5RrGOa0hc5nA8CEHvfmu3DoPPBjWqZ0WJiPg+AUPolIP/pls5bevQ2ERR3TadXaOq+K712G
	/ZF5bNreMMED23yzH9+NiyUm6vV3CASOZfe/O0SAfyW5YeK1xP5MAH9FdQEynkWL2Mc19XjDvZW
	ui/KyrDtuwxo1Hg3haiaI6wxX/8HT7KoAqdl9zC2wCf0v2ecB5njqUI0ICpq1P5qrlIfzhby57m
	oE+xb9dw2W5BZVDbF74P5A5dtNylXJOCs0E5QoBThIr3/t9iSwBBjsGDjmif
X-Google-Smtp-Source: AGHT+IH0yWuJoUrC0OxGQWzTqljadyq7cuFUTOFbkQW4fn/ETHGhWue+swzwXlHVyYeAv2NimJNc6A==
X-Received: by 2002:a05:6122:4286:b0:523:dd87:fe95 with SMTP id 71dfb90a1353d-52f2c5919c0mr15157933e0c.9.1748453899161;
        Wed, 28 May 2025 10:38:19 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066973c62sm1439097e0c.44.2025.05.28.10.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:38:18 -0700 (PDT)
Date: Wed, 28 May 2025 14:38:13 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250528173813.rxqu6pzqgu4m5joo@hiago-nb>
References: <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux>
 <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
 <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
 <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
 <20250527000510.fofehmsdhifcwlys@hiago-nb>
 <20250527023921.GA14252@nxa18884-linux>
 <CAPDyKFqZkcaGfss=Oi+H9UERFU29jY2t5uTPnGVGQgSAJSeCoA@mail.gmail.com>
 <20250527134525.f7yzs4ww64xxmjmr@hiago-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527134525.f7yzs4ww64xxmjmr@hiago-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_103821_122906_6375FD29 
X-CRM114-Status: GOOD (  29.46  )
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

On Tue, May 27, 2025 at 10:45:25AM -0300, Hiago De Franco wrote:

[...]

> > 
> > Thanks for the detailed analysis!
> > 
> > This is a very similar issue as many other genpd providers are
> > suffering from - and something that I have been working on recently to
> > fix.
> > 
> > A few days ago I posted a new version of a series [1], which is based
> > upon using the fw_devlink and ->sync_state() support. In principle, we
> > need to prevent genpd from power-off a PM domain if it was powered-on
> > during boot , until all the consumer-drivers of a PM domain have been
> > probed.
> > 
> > I had a look at the DT description of how imx describes power-domain
> > providers/consumers, along with the corresponding genpd provider
> > implementation in drivers/pmdomain/imx/scu-pd.c. Unless I missed
> > something, I think [1] should do the trick for you, without any
> > further changes. Can you please give it a try and see if that solves
> > this problem?
> 
> Cool! I can give a try and provide an answer soon. Thanks!

We are making progress ;-)

With the patches you shared Ulf (I added them on top of the current
master branch), it works as expected, dev_pm_genpd_is_on() returns 0
when I boot the kernel without M4 running and it returns 1 when I boot
the kernel with M4 running with a hello-world demo.

However now I tried to, if dev_pm_genpd_is_on() returns 1, put the
DETACHED state, something as

if (dev_pm_genpd_is_on(priv->pd_list->pd_devs[0]))
	priv->rproc->state = RPROC_DETACHED;

In this case I used 0 because I understand this is the
IMX_SC_R_M4_0_PID0 defined in my device tree overlay:

		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
				<&pd IMX_SC_R_M4_0_MU_1A>;

But in this case, the kernel does not boot anymore, I see the "Starting
kernel..." and nothing else.

I am using the pm_runtime functions before rproc_add():

@@ -1146,6 +1154,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
                }
        }

+       pm_runtime_enable(dev);
+       pm_runtime_get_sync(dev);
+
        ret = rproc_add(rproc);
        if (ret) {
                dev_err(dev, "rproc_add failed\n");

and calling dev_pm_genpd_is_on() after dev_pm_domain_attach_list() has
been called.

With kernel not starting I cannot even debug it. Do you have any
suggestion on why this might be happening?

> 
> > 
> > [...]
> > 
> > Kind regards
> > Uffe
> > 
> > [1]
> > https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> 
> Best regards,
> Hiago
 
Best regards,
Hiago

