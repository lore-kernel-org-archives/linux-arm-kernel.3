Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE22CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H948Ks4FyotvIgoJWFnIQzusTpF3IW3EYA8On9YnJSE=; b=g5usn5ygSYAaDD8fbaOR5A0H9Z
	EUdzOjt8RNngzKbSuHfoA/48TEwCy3tNjuyOHZ2m2tOQbpDGuEhJWCgase4gAWhDyL+gKa380ZydC
	0rzfVVYp1UXVQjla31bYeFnwo2wJdf6nb60/b86NZV6JZOg71YhdfR6BcBsIJUg1hKv+KIWUes7ep
	pTnjZ4ukpMnEDK68TB8JM3+zcFEj3GTPNDUzpehiV6jGIYX3di80YRmIcTrM298GhcztjKNlL24N1
	aCWhsLuBu7s4r5zz+1FZERlHhjQUtMPCmkNmXumHyNEE1u3ogf8jungmaEP/LxBdw7EmOWJwd7kGR
	czOaRJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AEF-00000001ylK-1nqb;
	Mon, 29 Sep 2025 09:31:31 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AEC-00000001yjG-18tR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 09:31:29 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-74435335177so75115377b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 02:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759138287; x=1759743087; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H948Ks4FyotvIgoJWFnIQzusTpF3IW3EYA8On9YnJSE=;
        b=vxzPy2q1vp0m/GCF83VCKE2MB2G5b/Ra+F3IfziF+2uiNoME1rvvgKNaJ6OT3FzpF5
         y2CMTMTfQpOwB3zVF38bRe/yuo3sb2EJeZEtB2VEvFsJz66YEsUzGKrlTkiOvhX+cJ7x
         WmcaQ7XEGWHZQmj8LcK/9lopqzcu7tMm7eKvaydN4MIVSGqd1Wrg8D/f0bbOtg8i6lHj
         RKm4pHOZkAvmOdafz4EviFZZ6UKWSSHLVGiFj6qXj1xWJ42tH1ouXpEmybmvam8sQ+RH
         P1jSP/DVBQlTTkuR2HolLNeLpd894RDrHPNP1+xlokuAosMdBLpRMdbVVqYc3x5Im9q1
         1Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138287; x=1759743087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H948Ks4FyotvIgoJWFnIQzusTpF3IW3EYA8On9YnJSE=;
        b=s1QMSTNsw7AZXUeJPn337hlIehbEMuyZLxozZF/7m9/VOsT+yTH7/woyl9GCltRf8s
         3AzVidK5eAbeIEn5ANfDmAW6JL9BtltFzVGerq6qZzSZgImfCeATzgexA+9Z1zgEC73o
         BPSO25xan6RpJpkz041wpYedjXmcU/Zz9XsOFMc4yVYhyvmYzumXYHeJ1uKxSTSV31u+
         GWzyYFrgXezjjaaKflRb4bRy2yVMOZu+nrwC7iQ2ahzPMdXTXVSYWQ++8cQHhECnBpae
         gliIzkWLbF/ijPbyzKtlGHt3lmkOfLw5lqp9Z2per1xCDmRa6wcGpP9V1NSm4fFoUltA
         4q6g==
X-Forwarded-Encrypted: i=1; AJvYcCWObolywEcNNT+agXQE02XbtN7okM4txoAT/3ErlOcsvueMU5DLPL8TXR7KWro2wbpjdNXFatCqgvTJnf2Ommfa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx2Kfi8CTskl+aV4MKVLQt3bmRTxDJfENHd8JvoYFv5Y4KYlGb
	UNo4t618hSiiqhK2fz/BPgu9TQLDw/e8nne7JUmZ1xKMj01WqrOG6O88UpEk3ag2Q1ln/ypyoKg
	Ta62BhKjKAFe/n6Ea4xDQi5+Bv65AjgFVOOoCU3t5IQ==
X-Gm-Gg: ASbGncuDrcLb7OWT/pKFigQb4Bl0BFhXveG7B4PkPhdtJx3LV6hqUGEgud1kvdGTn/n
	iN/wnnEGhKsqcYKTJ5aDRNPOSvoHFwXWyoLvBbvLx02smDEASBCuDbq62RVHM6m4RX79ZpJyiiz
	mLUtOYES6rTOerTYwdiweX8HBezFp8f8WPPFPOPAFv7WVCmdR5iducwQoatpSmXWbHz8/9d2yzR
	CM/vtau
X-Google-Smtp-Source: AGHT+IFXTh55gLh86/vkdYVr+heB/S126ORlkozE21AFNkj/jMs7BoGlJ6IMgFlkmd0UlQRqUYqeDkRaveHfjIEl1aA=
X-Received: by 2002:a53:c345:0:b0:5f3:317e:40af with SMTP id
 956f58d0204a3-636dddd2c3fmr6803730d50.19.1759138286766; Mon, 29 Sep 2025
 02:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com> <CAPDyKFqQgS9j4uGkTL_taPTL96su1tqpyoek1cpZgTiaaBMpCA@mail.gmail.com>
 <20250929034048.GD29690@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250929034048.GD29690@nxa18884-linux.ap.freescale.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Sep 2025 11:30:50 +0200
X-Gm-Features: AS18NWDsIyPq6WyP-cYDKXj4NowCxNtd4ELMHIi6ak8TqMmTMVVwpzVIqFM3mSo
Message-ID: <CAPDyKFp1NrdA6nZMQFrgrpc5Ub4osgYTiSJ=Gf1m1q4X8RYCmA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] pmdomain: core: Introduce device_set_out_band_wakeup
 and use it in usb
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Peng Fan <peng.fan@nxp.com>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_023128_310794_417F6536 
X-CRM114-Status: GOOD (  15.97  )
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

On Mon, 29 Sept 2025 at 04:28, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> Hi Ulf,
>
> On Tue, Sep 23, 2025 at 12:07:02PM +0200, Ulf Hansson wrote:
> >On Mon, 22 Sept 2025 at 04:21, Peng Fan <peng.fan@nxp.com> wrote:
> >>
> ...
> >> ---
> >> Peng Fan (4):
> >>       PM: wakeup: Add out-of-band system wakeup support for devices
> >>       PM: domains: Allow power-off for out-of-band wakeup-capable devices
> >>       usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
> >>       usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
> >>
> >> Xu Yang (1):
> >>       usb: chipidea: core: detach power domain for ci_hdrc platform device
> ...
> >
> >Rafael, I intend to pick up this series via my pmdomain tree shortly,
> >unless you have some objections, of course.
>
> Sorry for an early ping. I see v6.17 is released. Just want to know whether
> you would pick this up for 6.18.

If we have had another week, then v6.18 should have worked. That said,
I plan to queue this for v6.19 as soon as we have v6.18-rc1.

Kind regards
Uffe

