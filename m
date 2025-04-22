Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD13C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zqq1b+/6XeRHzzRXttJKkEQgtsEyG1k8HuMNcYU8Wk=; b=x8TuJh5rBBeK/nyRKebWezg9Bc
	82oB9kaR5JCpFtg9lUGZG8ww3wlML2sV8R+wJ5QopxIXfWBurBWITfgenCPGFC2vjNEJf0WpDZ9rX
	7GNWB0mBoE7UsuFk2PO3xIEUkM/QD2AyQNOPCJvOQBIlQGuMC2u+4YXxRM6WVlHt/BVyVJC3pEtK4
	mOzwI2OFiyFc1tepWAR3k62gVLs0bEJe0d1Nnv59DiQhXLa1w/oYZORoA6AUqB1kyaDBEqkXqxlAi
	oEyiXXvg6Ror5s1IV/xKpEajtuStkHPPaRbRanbqgJtPKe9dJii7UQKoQVURktylD983WBZWKgP5N
	dPGIa+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ebl-00000007Udy-3K7d;
	Tue, 22 Apr 2025 14:28:21 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DSR-00000007Fsh-3CGu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:14:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so863174366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 06:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745327678; x=1745932478; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zqq1b+/6XeRHzzRXttJKkEQgtsEyG1k8HuMNcYU8Wk=;
        b=Iff4Tcv6+Bo2oh5b0xe3qb/ECZOWZuwpYTeeQDx+P8dTo4VUU1NXMwuUoL/j7n4dz3
         r4NCV52dIJ+Bb32E4UHW+ojdLgas4ZHgqFetp5J9wpMKYhwiWLQdENAswtiU42KaAZWM
         +ofxoaKQuod+A6un6FZd5m+rXHO14FLQoAwAh9cHRZ46Uv4aXypFP5pkabgkMj5zEbGI
         lwvzCOTSnoD161g/FSEM8KkbwVQf/JQS270kHRRoHmkdn/C10p0CP2iisG9R1N5SKuVa
         tSDYiuKdvkTYWJKb61DHGfaHFjgU68+nZJIz6LhpcwaprmInaJ+KX5XxI/jRM3otDR/L
         ip2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745327678; x=1745932478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zqq1b+/6XeRHzzRXttJKkEQgtsEyG1k8HuMNcYU8Wk=;
        b=NblMoOPyW10NlhDpbc6zlEE02C6oedTd2gOZEJK83TYnvDh1DBwGcGO7ZTpuwKFyTc
         VpDbnaME7LiwVTMB+PmzKI8aP04EOrfiy039Sr6T0SEanhYwUDUBsUx0d/mT+zhjV4xi
         v2+KnrSUPOFg2r+tBt3w/1iZcOaffOEON3YZ2eXTzXuxE2V9E6MA7MDD7W6//ulaNgFH
         VipDzBqE+Bq2XIoLEXrt9vB0oDrQRkKoudkWMNhxOunKbhnff0vqMWTRo6nDR+6q7GJo
         Ml3+BJ7aX4q6auB9FNQjx2og43TDs1uyAKd7CBrm3p9K/5rCwXn9HVUGlH9C5IFbPR1e
         mPwA==
X-Forwarded-Encrypted: i=1; AJvYcCUtpLOL8dQR2kNLH4G1D/hzirg+qSO2WZiNKMn0IbAY5f507keL3X+fy8Nrnhb0aVsfM344tzldaTWxIjiH+CG/@lists.infradead.org
X-Gm-Message-State: AOJu0YzS0q82ndQGfI08xAQCUikMizw47kp1Ee30wUkuaH33Y0O/ZRME
	8/qA3ejiZtQtTQXTa40gjizrov5Qn0GA5O9HyDfEfE8hlrl4czUcFs7Qts0oD2A=
X-Gm-Gg: ASbGncs8+7RpXozhBbr4XpfjGG2T2b6RwhVAWz2LSe0dFWVbnsygr0jQBkX2JNk/pco
	vjXduSakOTeu5nSLk0IpJox0Rr4Vw3GNnSVBNbmmz0EID0IhiStbcTaNNL4D/6D4MXvNgIKxFyd
	fcGMFU0NGMHosJFURo/sYEKbCXhCNvScmk5v/730hoFjBXkz9WCzDWbj51etPCGg0/jupXMR7Z8
	zsz7HvH4tHB5BeecSJLpWUCUl8eIYB6Xnulecrg/2qKu5Bt44Mf97lfPq4r7f5oGmHnQsWIhDEe
	eMpBg5JAIuHKGNTCt2xDaR+J9Psl4UBj/Vt7EQ==
X-Google-Smtp-Source: AGHT+IHTXXC4b0G4QfA+kk60IhLLae377q0zTFxBB+eBZqx0IkvXugcFNIxSpugNQp492BWJKEid2g==
X-Received: by 2002:a17:907:1b17:b0:acb:3f1d:ca7e with SMTP id a640c23a62f3a-acb74af0066mr1171765766b.8.1745327677594;
        Tue, 22 Apr 2025 06:14:37 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef49e40sm650708166b.139.2025.04.22.06.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:14:36 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:14:34 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 00/18] Support spread spectrum clocking for i.MX8M
 PLLs
Message-ID: <aAeWOryhXosM0Rat@linaro.org>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
 <20250314093503.GD12210@nxa18884-linux>
 <CABGWkvq2X9L6P39K5OeQW4+c2OmSYGHN03mUW-96U5okO1CK5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvq2X9L6P39K5OeQW4+c2OmSYGHN03mUW-96U5okO1CK5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_061439_830774_BB89E80E 
X-CRM114-Status: GOOD (  26.62  )
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

On 25-04-11 10:38:17, Dario Binacchi wrote:
> On Fri, Mar 14, 2025 at 9:27 AM Peng Fan <peng.fan@oss.nxp.com> wrote:
> >
> > On Thu, Mar 06, 2025 at 12:27:49PM +0100, Dario Binacchi wrote:
> > >This version keeps the version v9 patches that can be merged and
> > >removes the patches that will need to be modified in case Peng's
> > >PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> > >The idea is to speed up the merging of the patches in the series
> > >that have already been reviewed and are not dependent on the
> > >introduction of the assigned-clocks-sscs property, and postpone
> > >the patches for spread spectrum to a future series once it becomes
> > >clear what needs to be done.
> > >
> > Although I give R-b, there is an idea just come out in my mind that this
> > might break OS distribution that use firmware(e.g. U-Boot) to publish
> > device tree for Linux Kernel, such as ARM System-Ready complaint OS.
> > I overlooked this point in previous patchset reviewing.
> >
> > Since this patchset is to move anatop stuff to a new driver to reflect
> > the HW truth.  And requires new entries in CCM node, so old bootloader
> > with new kernel will not boot for OS distribution, such as Fedora/openSuse.
> >
> > Not sure how to keep backwards support as before. Leave to maintainers
> > to say if they are ok with this.
> 
> Many thanks to Peng for the review, and a gentle ping to the maintainers.
> This series has been ongoing for a few months and has reached version 10,
> thanks to the reviews from Krzysztof and Peng.
> I kindly ask you to consider it as well.

Hi Dario,

Please rebase and resend. I intend to apply the clk ones. Hope Shawn
will apply the DT ones as well.

Thanks for this effort and sorry for the delays.

Abel

> 
> Thanks and regards,
> Dario
> 
> >
> > Regards,
> > Peng
> 
> 
> 
> -- 
> 
> Dario Binacchi
> 
> Senior Embedded Linux Developer
> 
> dario.binacchi@amarulasolutions.com
> 
> __________________________________
> 
> 
> Amarula Solutions SRL
> 
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
> 
> T. +39 042 243 5310
> info@amarulasolutions.com
> 
> www.amarulasolutions.com

