Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2B8CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 12:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii6383Cbj9poDswX1+mFPwk6TNhBGskCpxiBvMFbpYU=; b=OvVTVQFRth9Z0gy2n6zGWXxLeE
	POeN9hJkEP+t3QxC2neK9DBm9tDavhVATqahaefWJT5HDwyFFCknMvzow8yWWLjBtG+mTRIKT3Vnn
	DoHyXG+jZOKfF91ekkUpMUEWSSHPF/SbiZCw4gdZaC8oPEcfhC/r+RHXmAyINXFt10BZZfKcm78jG
	9HS1HeyYJM6NZmn5wgEVeGU8Y2h7XD6yp43wzkF37JfVL9wLCoB28mmFee+/74KPRtNmE7bRshdYL
	UQW6DsHk27RMyp04u//nXakWstNH14XxI0thsdrXQziIDc2mVBURok7CGglA0EoEGDHCXUE4G7piE
	Ygd57xTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm0o-0000000GdnE-0noG;
	Tue, 12 May 2026 12:14:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm0m-0000000Gdmx-3Ush
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 12:14:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9BD66014B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97798C2BCFB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778588095;
	bh=TqpSTdiRV64u9z4m66enAOq8H6i13HG4Kj18qVReCWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O82jZXli4y6yyc+2+jRavCDe9PVj/LBh6mNgq+tSjyNAxowbBRei7gJbqga5ObE3q
	 Pr0Xo76tGkWV9SSwNeSW7kSY7uQZppDrz+QuNRSkKc7eNaLR1bmntOpRrd5SLBQp5Y
	 irSIHrCGgtbuITLAn+NJWlpoaGNdVE2lZbUOMOekxMdS4m2HLtF9gIZpR0LZYK/tdL
	 Nnj+dHwY8APtJVPsGaCmF/BbIXrqqRgCVWiR/F5h7UWs0B+cC9y6S8IN7RvS6oSRDM
	 PBH8EombwFF1+0jj30aedA3C9UmybLzfVYTpAqqY73d5to72VeA5wOSow3Nx/CfmbE
	 GeGu7AQl37OEA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso5540284a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 05:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Xy6fZXA05veQX+kZ1+KVL2i8Dp7nN1Yw3niXOHDGNG68CQXD65bPO3CEXEvDNJdLQwNQjK7TLJAoGUj9a+Qsz@lists.infradead.org
X-Gm-Message-State: AOJu0YwN1D4Cw2ATkzHxns2L/yu38fXaUL14goWhL0Q6lxMq3dVY5CrW
	Scd+/e7oUrGz7+7RibowMZHpi+cskLAzVnfqLtsrmRgRT9xGcRKWVKqYVjntKjghsGYwk7XSIVK
	KYXz1X4428nr9YrRufFYEwt7EU/dRpQ==
X-Received: by 2002:aa7:db47:0:b0:66e:cf8d:6970 with SMTP id
 4fb4d7f45d1cf-67d643c2b15mr10546583a12.20.1778588094154; Tue, 12 May 2026
 05:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
 <20260510120141.118057-1-pramod.nexgen@gmail.com> <20260511171554.6541042b@jic23-huawei>
 <7baf9ca5-50ff-4131-995b-70ee094ed247@baylibre.com>
In-Reply-To: <7baf9ca5-50ff-4131-995b-70ee094ed247@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 May 2026 07:14:42 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxtWLR+jxRXt7Uz6dcF-90NYmfyGWYQk9um9TYHSWbTw@mail.gmail.com>
X-Gm-Features: AVHnY4JL4E4-RpwMcuVlQFVo75JqgBEu_54ecJmda2k6xLPrFqJ4wDz1IgH567o
Message-ID: <CAL_JsqLxtWLR+jxRXt7Uz6dcF-90NYmfyGWYQk9um9TYHSWbTw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings to
 YAML schema
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Pramod Maurya <pramod.nexgen@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, May 11, 2026 at 11:24=E2=80=AFAM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 5/11/26 11:15 AM, Jonathan Cameron wrote:
> > On Sun, 10 May 2026 08:01:36 -0400
> > Pramod Maurya <pramod.nexgen@gmail.com> wrote:
> >
> >> Convert the Xilinx XADC and UltraScale System Monitor device tree bind=
ing
> >> from the legacy plain-text format to a YAML schema, enabling automated
> >> validation with dt-schema.
> >>
> >> The new binding covers the same hardware and compatible strings:
> >>   - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
> >>   - xlnx,axi-xadc-1.00.a  (AXI softmacro)
> >>   - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizar=
d)
> >>
> >> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> > Hi Pramod,
> >
> > Something went wrong with your sending of v3. I have two versions sent
> > half a day apart and no idea how they are related.
> >
> > Anyhow one of them got feedback from Rob's bot so I'll assume we are
> > getting a v4 and wait for that.
> >
> > Jonathan
>
> I think Rob will have to fix the bot to make an exception for the
> legacy bindings. This should have been called out in the commit message
> as requested in a previous revision.

The bot is not the problem. It just runs validation. The schemas will
have to either drop this check (comma's in nodenames) or exclude just
this property.


Rob

