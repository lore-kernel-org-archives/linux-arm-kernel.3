Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06759C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7LdJfX/NiQcyQWhxd6h6QFvrDjuTzax4bkOLSIcqCY=; b=K+eEH0Y8/5LBrh03eJpkCh5Gad
	haf7UITinBNcjgInitL6LpvslMiUbyxE7TBAHgdAJ81PN/Ue/OUtCrvM4xGMy0dT1vwsZM+FaI63y
	CRDd+hRDgo1bZiRizGaxZ0a6m2OuoOJoz3PJotHsoH4bkz+2DHUrh0XZPqfNWzmMpmjugHy2IKRrr
	1mDY2Asara4A/4cUBF5jTB+I7kYJS9mKGOBctGoO+V8oCrlSYtIWoftptETvgYmFrE+oTgkZdYA3i
	iRF9rZ6MSgFUBP8ef80NJ/j8lTWDbLo20qtNq9M1INWiDdXCjtRS0ShnIUzFvkPEFmQs6ONulqJVe
	xFgSMb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lI3-00000006l90-2YlY;
	Tue, 15 Apr 2025 18:45:47 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lCh-00000006kHL-2TFN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:40:17 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-ae727e87c26so4055663a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742415; x=1745347215; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r7LdJfX/NiQcyQWhxd6h6QFvrDjuTzax4bkOLSIcqCY=;
        b=UZKHPoCcsOHZ9zvx4P5/ZLZ6FgidgRKTdSl2IPtuf+1/UuHlEhglfzrAmLrxyp8cE3
         y6AQSVYM4qpHv6Y5qFOJYDdhMC1zYW89fG2ovUsIc9eABSeOG5ntj6LCUM5d/qUEPHnJ
         nyFEwVSa2LT+CbuC1Qt74nkRtKMCFPxhoy1WEIYTMVeoF7eMN0gm1CFVhPoV4PhTlY9e
         lwKGRiIGu0L1TVTmcVUgEFrTBEnerwgfCq4pne5NnnOjuKzDlLJJK5TfRyq5duAbOOH9
         rGHFOlbK26gz9JpeC++l9O3VtbdMg+a+6rZtVM2CZ8xBV8icbTIV98K777yQ98oB1qTr
         pcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742415; x=1745347215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7LdJfX/NiQcyQWhxd6h6QFvrDjuTzax4bkOLSIcqCY=;
        b=N5Zk6YCqx8nPKbPzm8vqxFqXN3rgVvrqg+4VfjhiCfxjwNFcLimUHJ01+ri5t3rCtk
         +iFOZzKditnBF9ZXlFP0t4BZ9GYgM5qUP2TNi4XoGz0LSgoXO6EsMh6ElPXGM1ORoplh
         D5nJBI9FQI+lhVr9G9g6R+9RtD6owks+5V9R7a6VOhqBoniXzFpJ7d8EjsAuijnLMFo6
         hVn5BRijlkBv5y2p1TgNFlqok6AeBw65lJCKrN3Y5e0MGAIBECyCX87FKCy1UOM4gDMk
         ch0t8/cwJuiJkM6MA5S8bxjNYqiImEPYawphLYnypEDhxfVZq5iVIT/nxSNMTQvMUKVC
         oWig==
X-Forwarded-Encrypted: i=1; AJvYcCUgWUMxB4QSJJWPidGIRD/bajawc0+p1MVh5D4PcRVbP9SQHNY7fTfKINaDitZBrdnzvgtPsXdZl4WewN6U9fWL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe2RkUbJQCNSl5TSUM/AKPg7ZiscalGH09oOAWW8qnGjGaR5KT
	78/CMPl7Pg7SeM6FUNqoLacT1Vwna6I0tsaQmcumdUfRhCvP29XX1Fa27npy
X-Gm-Gg: ASbGncsYY21XWNXLSBRJlNWYOL3muvuGoIbfo0QHGinK3QlBsTtWi7eG9Oi08PSso//
	0DeQdFnhbVFlc9KVs3nmyFK/SIL+gXYPlWsb8NzU+mMwu2LpX2KZ/EqPgFWcHLEMWPOqcVlu4u0
	bgXgrBFBQzcUBkuE6hQW4ssJ2E0PyUgULUb0920Jz2tcDmQF3whWCWzjyviAXmmxz2fMtcfQJCm
	3FsPSWZqGK8VN1eGUqzURjvI0QzrfBJ3XW3T+uX+592V2uQISHpjl7pS2rnoQRq5xXdbe8L0CdD
	iMt0gevLaDB+FIqG6Z1EzB4Xzl4c1fS82pZ48rg=
X-Google-Smtp-Source: AGHT+IH0/rViGbAh62y8CYGqkS4uAeLP96QgGfU8Xo0+eLty4NFaaNFFothcrivWo5vjv19P3qVGDw==
X-Received: by 2002:a05:6a20:2d13:b0:1fe:9537:84a0 with SMTP id adf61e73a8af0-203adfc5f55mr67704637.15.1744742414609;
        Tue, 15 Apr 2025 11:40:14 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a321f921sm11325860a12.72.2025.04.15.11.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:40:14 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:40:09 -0300
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
Message-ID: <20250415184009.2fvtn7tbe6uzwiyg@hiago-nb>
References: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
 <20250411125024.i2pib4hyeq4g6ffw@hiago-nb>
 <PAXPR04MB8459ED6CE869173D4051257088B62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250411162328.y2kchvdb4v4xi2lj@hiago-nb>
 <PAXPR04MB8459ED33238AA790252E730988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414224452.gk4ccniqtumfbjth@hiago-nb>
 <PAXPR04MB84591C4D560C0D3D64F927FC88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84591C4D560C0D3D64F927FC88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_114015_630506_F1FF6C69 
X-CRM114-Status: GOOD (  35.44  )
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

On Tue, Apr 15, 2025 at 12:11:33AM +0000, Peng Fan wrote:
> > Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X
> > when Cortex-M4 is running and it was started by U-Boot bootaux
> > 
> > Hi Peng,
> > 
> > On Mon, Apr 14, 2025 at 06:09:49AM +0000, Peng Fan wrote:
> > >
> > > In your case, m4 is in same scu partition as a53, so m4 power domain
> > > is manageable(owned) by Linux.
> > >
> > > However to m4 earlyboot(kicked by bootloader), if you not wanna
> > linux
> > > to handle m4, use scu_rm to create a separate partition in u-boot.
> > > If you wanna linux to handle m4, but not wanna linux to shutdown
> > the
> > > pd in kernel boot, imx_rproc.c needs to be built in, and need to add a
> > > clock entry or use clock optional api in imx_rproc.c .
> > >
> > > Current imx_rproc.c needs a clock entry to probe pass.
> > >
> > > I think in your case, this driver not probe pass, so the
> > > M4 pd still get powered off.
> > 
> > This was correct, indeed. I was not able to find exactly where the
> > cortex-m4 clock is defined, so I added a clk_dummy to the imx8x-cm4
> > remoteproc node and now it works, the code continues to run and I
> > can control the m4 with Linux. Thanks!
> > 
> > One thing that I noticed is I cannot make the RPMsg work with this
> > devicetree node, even tought I assigned the correct memory-regions
> > (vdev0buffer, vdev0ring0...). Also tested with the rpmsg-lite from the
> > linux-imx. Is this supposed to work with RPMsg as well?
> 
> To make rpmsg work, you need a m4 demo that could publish
> resource table, such as i.MX tty echo or pingpong demo.
> 
> There is downstream rpmsg driver under drivers/rpmsg/imx_*.c
> that could be used to talk with m4.
> 
> helloworld demo does not have any virtio devices, so no rpmsg.

Got it, I was able to make it work with the downstream pingpong driver
and the MCUXpresso demo. I can launch the firmware using the remoteproc
and exchange data between the two cores.

There is something I noticed, when I start the pingpong demo with
U-Boot, it does not work. I run the pingpong modprobe on Linux but the
name service is never annouced. It only works if I start with the
remoteproc on Linux, not U-Boot. Is this because of Linux not being able
to control the M4?

If I start the binary using U-Boot, the "state" always report as
"offline" by the remoteproc driver.

> 
> Regards,
> Peng.
> 
> > 
> > >
> > >
> > > Regards,
> > > Peng.
> > >
> > 
> > Hiago

Thanks,
Hiago.

