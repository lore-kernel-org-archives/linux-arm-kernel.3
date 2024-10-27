Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A490D10C1B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 11:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU0MCV0TeQuQC16GsgNJVVDz80GIbnmau4vhLNXnG6c=; b=11R7VoGeIOJkAG7j98V/TlUGO+
	pAjgzIbGeJPf+qOxvOQBMrEmpTuNRLyjV/Bn2TkILtf9h6n4tBvy6GTVX3Nxc3JY5feDTv3YSwp6P
	Pgvcihh/OZ5nLxm0zNQp+s0c2jMYUj7uk1L7cwuEOT7JlLymB3PfJ6T7vMn8sQKo4VO3d14luKeHn
	T0rA3BjribaSCqzb+dk8xygawUDvRBHiijxphgpzbM4s9YkLrrcytWqMgUfy+NzziiF921poYzZv9
	ThO4USehV2rlD1/k8hMGJFnMuqWcJIgh+2XMmOunhxMUYRTBMMoC2avpmjqRCb6LyCxO3GqNIRVhi
	pmnOa2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t51Y7-000000088iG-2MLA;
	Sun, 27 Oct 2024 11:35:11 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t51VV-000000088DP-0dSB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 11:32:31 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9acafdb745so622950666b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730028747; x=1730633547; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kU0MCV0TeQuQC16GsgNJVVDz80GIbnmau4vhLNXnG6c=;
        b=b9ncNKRvvk9MQ/oc4zIRirKGeVbYtkFuz2fxkl97pvGbA8rz+6dCZdUZtTkaZf4FHL
         BB2CrvRELoMJinu21Et//c1Ts2QlxZnNnAadKeqPqv91ZGYKortA06shC19PNZWBZUqF
         6xVWJubepa7xPTktroZgU3zLPIosJ7GtfQ6Lr08I8c4QBR4RCycjpz/Q7Pgur8B1lEFA
         wZBDsMN/ORUsrBpKLWJyGUpwIlxOnNDYvv3A0yxaVD4tVR2sGJVApaEYkoFXHdkdPhsI
         OPUSWficz2aR5YFeq4aNHQ1vgq6xASKI2fYxsQ/Qx5O3MBsC1dkXAKI1GN1tYL8XQRIu
         cQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730028747; x=1730633547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kU0MCV0TeQuQC16GsgNJVVDz80GIbnmau4vhLNXnG6c=;
        b=mJ0o3wVtPYBEtJS+ThTFFtwBDGQ7c/Flj/Hdcgb/o0A7njlnwuO1p6KfdNGNmgrM+R
         X4Y22atLNamDJMjG4xA76fs6QnV6XA0BNuzwF7pYQnx3wwHVfNfv60DRF71MT2TiI45j
         kpBYLzGAQRhQs3TKkh8ESrm7Mc6pjPM1dDBVYUrz90DelOOeguBldgf6Dwd74QUFjavN
         NY/3WAgo4kuWhVdmHCx7zbqzMd+g7Xu0WYdWUZb59dieUVko4/eoZ9jX66rd0pmz3qXh
         xGJrbthnf0rTZD3RbrMkG1AxbJTclB4VUE5tuRAGxpYeR4daBxPpn7nUwEer0g/uQ1A1
         YnZA==
X-Forwarded-Encrypted: i=1; AJvYcCWHh1v2y36J9jcx676U73ehuks5KQh2ULTpbqd5KaEasjcSfuRHJ+OWAKdVSUewMIvNMPp41xTN2yB1EiIHH52c@lists.infradead.org
X-Gm-Message-State: AOJu0YxFnq3W5ODt3AiyeSSuJWtmdGzsA8Cz1TU5OxRNSKHMjZUweqn8
	4blNq3FDvgFhBjTSRFt6o+57zx/LiHwaafMtztG3ru7o+rnyDPDOs0jeEo845GU=
X-Google-Smtp-Source: AGHT+IGFhxYKhcZGmct80kmOogS47m5N8se2XFqf8zdUkxnrd0dqlLKBimSbOYXFuOLdT6TQJTi2mw==
X-Received: by 2002:a17:906:f592:b0:a9a:babb:b916 with SMTP id a640c23a62f3a-a9de3612eccmr487030466b.15.1730028747291;
        Sun, 27 Oct 2024 04:32:27 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f0292c2sm269235466b.69.2024.10.27.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 04:32:26 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sun, 27 Oct 2024 12:32:50 +0100
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 09/14] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <Zx4k4giM86vW7g0c@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <199a4994312b120c73c95fa368954ad5a2a8aee6.1728300190.git.andrea.porta@suse.com>
 <CACRpkdb1muovPmKoUw=Q5sNXj3bsCt84LcKVDSLY09_5_1rXZQ@mail.gmail.com>
 <a1b72875-6224-47b9-bc68-bcc66343bf46@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1b72875-6224-47b9-bc68-bcc66343bf46@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_043229_214272_14080699 
X-CRM114-Status: GOOD (  23.05  )
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

Hi Stefan,

On 12:08 Fri 11 Oct     , Stefan Wahren wrote:
> Am 11.10.24 um 11:03 schrieb Linus Walleij:
> > On Mon, Oct 7, 2024 at 2:39 PM Andrea della Porta <andrea.porta@suse.com> wrote:
> > 
> > > The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> > > Add minimum support for the gpio only portion. The driver is in
> > > pinctrl folder since upcoming patches will add the pinmux/pinctrl
> > > support where the gpio part can be seen as an addition.
> > > 
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > This is a nice driver and I find no issues with it, what causes
> > an issue is gpiochip_set_names() as pointed out by Bartosz.
> > If you can live without the names you can remove that part for
> > now and we can merge the driver, then you can add the names
> > later when we sorted out how to share that function.
> I raised the concerns about missing gpio line names in the first version
> of patch, without knowing the real efforts.
> 
> So I'm fine with Linus' suggestion, because I don't want to delay the
> upstreaming effort unnecessarily.

Perfect, thanks.

Regards,
Andrea

> 
> Regards
> > 
> > Yours,
> > Linus Walleij
> 

