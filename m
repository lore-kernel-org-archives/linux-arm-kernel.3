Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929C6CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 10:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFZ44yopGrsYMfdLKOB5nzNR8YL97RtHy31e0eAGVGk=; b=ETt14snxf6935OMYlkejm/UXW2
	9J3caqZAy63SfldodOy8YOPXIgZzqRYhbjeJZL0QwC5tPj0x4s6lVUjtxNv1nPGGCLdHPaAXBKiWf
	PI5lRXIM1oHKoWa7bXURsA+9d31N82lDI9RfTSgR9iNmcO6YL/7C27KASmWo6gRLnsh55YNNuXwho
	j9MF+MAMT+/tWZIlyDSdJrHyj6bNQ1Vy3NQXDUFK8/pdGSZJtyI5Ns3swWoEtFTrYjJxIhcW65ajD
	oGFZI/wevV9g5EVOoQ/+A/vIvx9EB+RWdF8MDeclgbjcvnIkuGDdgEByBKn8OT6DQCe1/uEHlQfQk
	VRH4Se7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTkx-000000015LF-1ZHC;
	Fri, 05 Sep 2025 10:33:23 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuS2i-00000000SEg-0LvL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:43:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6188b5b113eso3187496a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757061814; x=1757666614; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KFZ44yopGrsYMfdLKOB5nzNR8YL97RtHy31e0eAGVGk=;
        b=HMpwhHy+rEh6N0Duurt1mFiBF96XwTFMmi/uqll9Rzt1KF/+Xrrt99RPAcxBimYUAi
         HUJgwQiMHmM+dLUdRAkyeNWg/t6KFvndevwsfIE8cRCRzS3XxqASFeFTy9iC053muxQQ
         Pbf4WB9XimWV79OgRbgIFkj2s4rKsw4Bm9eKe1XdOnHboxSxjEpKc/e9C74nl3amGYU2
         5iKR3Itn2uZT9kBqw/MyQrsL9q1RUHXezojcByOqF6g+cPZ7SRXQBpdhGqP8JFizitMY
         RkHgVcDJ1QFr3OcwMglfs2IjyB1VFMB7QaL6ZGJvGKIGwMYogiast1lb1pWbSLsX74m8
         2nBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757061814; x=1757666614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFZ44yopGrsYMfdLKOB5nzNR8YL97RtHy31e0eAGVGk=;
        b=jEvAb+HAEnXec4iKOR4cUw6Qb0RdqLjQoiQA75tNmTCEXbATtTRBuBQ4iIdb17P5UF
         zY07BY4xcKKIloKWUbZVddaAKlKTKHYT0vlmag8rMfwijdcu0Ike4DdQoQZ6ikbljrRR
         HNB/ld8R0WCgwxWwsUSzMJ4HdexP2qAGygX+3DEPpN7pgCg90S96aabqkNBRoQ/+Hasf
         92vlK9R0ZObPhRyRA6c0x0vdMQH39AiLFjQmN2/+ZIIZb3Cqva600aZe0jEo9W7YWoK7
         c6fxEbbMaQMjlL/wVoCXZKMJkO/R+fqEmpO8F1Zw0q1ApaQIy4zD7IJEI8E/SdXTPad5
         U0Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVr50mqI+lMJcu5pcxBycq70Ot8hI/uiOj4JgZErZic3QePQHTqP4+NA1RyUib3tfaMX2+06o3kzQBkVwhF9rjR@lists.infradead.org
X-Gm-Message-State: AOJu0YxDJkMw4VXOWtQjf1CRxADu7Huqa5rj7zrAZpj4qauNzzQtjXUF
	s3bFWJQNz5I3H4FPZnPeykna9RWvlQ8EBTO7kksoQqwI3N5KdeSOXCUqHmNKSDDAog0=
X-Gm-Gg: ASbGncuk4FkAHs90fuJamGjG+mH2VojcVlAnqNB8lMwjuG75xpW+pbaZiNmhmJVrqyJ
	6tF+P0V+aOKaoFm+O2zIIeGSLu6K1vf7ERr5cLZvJOViUeib9wDw4830umFwpQkpfHohgaZLv0+
	EoshPYOX7tvXNEAXbfeOdYUubglr0rAsSKEys7E52d7sXN+9VcR1j4JM92Nx+nk78NeW60ADy4J
	96//nNSS37qZrQdQRO/sMdB0a667y5R33+bz4Qmp10h5cINoltciSUWSgTY92a6tmDUdrL1Pq0D
	2vJMVc4pA5v3cuUdYr7G5B7GvPT+qWqPgGGPygraIg4YGGSkp3VtTEWg6Xr3EPedK3kTgadIyZx
	nzrnIOCNZ22DKICMenSGfuN22v6Nummwduo37zC3Fvc9zyu5dDIN/u9WLgzhh3wM6T9BoSMP+Wy
	jnSwTfLSND1/JTMrH/2A5ctD+ZrsIdYaJM
X-Google-Smtp-Source: AGHT+IHSoczlmQQsMcIcDoA2nphrjHJmH+vwTBiXM5+w1FrleTBzhZMYXlRT74k2g1gKnwedKzI9pA==
X-Received: by 2002:a17:906:f5a2:b0:b04:3955:10e2 with SMTP id a640c23a62f3a-b0439551a93mr1777660366b.25.1757061814481;
        Fri, 05 Sep 2025 01:43:34 -0700 (PDT)
Received: from localhost (host-79-31-194-29.retail.telecomitalia.it. [79.31.194.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04148f95b5sm1353763866b.92.2025.09.05.01.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 01:43:34 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 5 Sep 2025 10:45:31 +0200
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iivanov@suse.de, mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: rp1: Add USB nodes
Message-ID: <aLqjK0FYSkXtBvv5@apocalypse>
References: <4e026a66001da7b4924d75bd7bee158cbb978eed.1756387905.git.andrea.porta@suse.com>
 <50b59b27-cdf9-4af8-b31d-d5ccc68c73fd@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50b59b27-cdf9-4af8-b31d-d5ccc68c73fd@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_014336_131065_6743BC69 
X-CRM114-Status: GOOD (  18.93  )
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

Hi Stanimir,

On 13:46 Thu 04 Sep     , Stanimir Varbanov wrote:
> Hi Andrea,
> 
> Thank you for the patch!
> 
> On 8/28/25 4:50 PM, Andrea della Porta wrote:
> > The RaspberryPi 5 has RP1 chipset containing two USB host controller,
> > while presenting two USB 2.0 and two USB 3.0 ports to the outside.
> > 
> > Add the relevant USB nodes to the devicetree.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 28 ++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> > index 5002a375eb0b..116617fcb1eb 100644
> > --- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> > @@ -39,4 +39,32 @@ rp1_gpio: pinctrl@400d0000 {
> >  			     <1 IRQ_TYPE_LEVEL_HIGH>,
> >  			     <2 IRQ_TYPE_LEVEL_HIGH>;
> >  	};
> > +
> > +	rp1_usb0: usb@40200000 {
> > +		reg = <0x00 0x40200000  0x0 0x100000>;
> > +		compatible = "snps,dwc3";
> > +		dr_mode = "host";
> > +		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
> > +		usb3-lpm-capable;
> > +		snps,dis_rxdet_inp3_quirk;
> > +		snps,parkmode-disable-ss-quirk;
> > +		snps,parkmode-disable-hs-quirk;
> > +		snps,tx-max-burst = /bits/ 8 <8>;
> > +		snps,tx-thr-num-pkt = /bits/ 8 <2>;
> > +		status = "disabled";
> > +	};
> > +
> 
> I'd order the generic properties first and then vendor specific.
> Something like this:
> 
> rp1_usb0: usb@40200000 {
> 	compatible = "snps,dwc3";
> 	reg = <0x00 0x40200000 0x0 0x100000>;
> 	interrupts = <31 IRQ_TYPE_EDGE_RISING>;
> 	dr_mode = "host";
>         ....
> }

Ack.

Many thanks,
Andrea

> 
> > +	rp1_usb1: usb@40300000 {
> > +		reg = <0x00 0x40300000  0x0 0x100000>;
> > +		compatible = "snps,dwc3";
> > +		dr_mode = "host";
> > +		interrupts = <36 IRQ_TYPE_EDGE_RISING>;
> > +		usb3-lpm-capable;
> > +		snps,dis_rxdet_inp3_quirk;
> > +		snps,parkmode-disable-ss-quirk;
> > +		snps,parkmode-disable-hs-quirk;
> > +		snps,tx-max-burst = /bits/ 8 <8>;
> > +		snps,tx-thr-num-pkt = /bits/ 8 <2>;
> > +		status = "disabled";
> > +	};
> >  };
> 

