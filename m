Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B2C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNK8tV2cbU33ghAfmkSW052krbMf3W9YRRoD4n/bbuo=; b=xR0b7m0rlZGaj0ELToir367OLp
	0uWM1zVOk36FAR7Tmo9IuJpw+h5Fo32sFdouZt1zTYoiuIvWwU+cxT3NnAvL6h/ey5hlOklWwk+Ud
	sryR4M3uqgHBYJAyGC0sCGXYqfeHKlcn7SMHSdGym3Cm/oOK8IFJJQeLRD9EWszRYoVJVx6C6YDrA
	iq9N2Wpy8QL46GeHQnw0MRh/NpTn9jswWSj8APag15LNvVKtztQ//iiTcPAc0b8n7xfXxGYVGpUAz
	eiuRf+6bDXhELXxSmFKukWQ82ORrPzrFWFEZ5dmn7c93HPMVfOFSLvRn+659zBFsPkB0Lw/nD8X9g
	622uzD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0X5-0000000B5kn-0jEu;
	Fri, 28 Feb 2025 13:36:03 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0VV-0000000B5OV-3EdV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 13:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FBEC61F47
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 13:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0FEC4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740749664;
	bh=oab+87tLIliozxTknTAVXwqD2vuMHHHF0MHKBcUfueI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nwx2dgbDNjRUoQKvvFLBGDGamjgLPe4+7yA+eQ5U8mX+PayApYxeWms42KQjOuqd9
	 FDXoICmaJZc2UdN+iUgoQxIcdpFpB5qMHnRQMjWSI2jnLRW+BODEQk6BSuIPSrnA8E
	 FOmxQwcOn7jNlMomeEahTCwLToTvuGoNPgHOPqAnTH+jv8nKnl6pMADXywIW1lZ/Ri
	 pWY/RLhemxaHIyg9lKojNoDiGJ4A+oZJuASV4Dg85LcoPeIG69svs9L6UsbUwiPXVP
	 ZxMRHatXfG5ulOAV+m6H4ovoD+HVyhHeaVaYU87QaL7O3/RbqfNcme6na1a8zA/2ra
	 O8ppMIoDKzpTw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abbb12bea54so394876566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 05:34:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3T7VVu9Xo8+4KnbMKwQwwlNwO2e7j40EYpgn1V0Ehzl3RBnWaI1KU+p0orqkCuwcL9FN7PjGxdokrL2Co5FYK@lists.infradead.org
X-Gm-Message-State: AOJu0YwAsnO4wSEaJW+iVCuLDz5Pd3RXu0aQ1I99DO0RGlr3RLzs4Tw/
	GErzlDfiJFwm/CLFisLkJanVFjzXF/qEhSLtB7JujE0vq3Im+TZV65u8m+bnsEo4FGzRoClZkgb
	AhmvXtIdojiLD3e2OYFZbWg5e7g==
X-Google-Smtp-Source: AGHT+IFzbMsX+VoNhIm9xw/uje5fzJ3AD+rltsa8/jPFsyEnBsdcVmViKbJ1szGBAjdp5JD7YyBOp5luGijZIUz88DI=
X-Received: by 2002:a17:907:3e0e:b0:abb:b12b:e103 with SMTP id
 a640c23a62f3a-abf26218d27mr385537466b.34.1740749663340; Fri, 28 Feb 2025
 05:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
 <20250226160945.GA2505223-robh@kernel.org> <20250227030924.GB11411@nxa18884-linux>
In-Reply-To: <20250227030924.GB11411@nxa18884-linux>
From: Rob Herring <robh@kernel.org>
Date: Fri, 28 Feb 2025 07:34:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJOqKeDRuASWxCT=EA5LJbONpCX=Re8=XxKUbPToWy2Dg@mail.gmail.com>
X-Gm-Features: AQ5f1JrC4nKVd3wt7pU4w6XghmwReKZTNhWPx4OdIapylYRsg-CDXZkR1M79oRQ
Message-ID: <CAL_JsqJOqKeDRuASWxCT=EA5LJbONpCX=Re8=XxKUbPToWy2Dg@mail.gmail.com>
Subject: Re: [RFC] dt-bindings: firmware: scmi: Introduce compatible string
To: Peng Fan <peng.fan@oss.nxp.com>, saravanak@google.com
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
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

On Wed, Feb 26, 2025 at 8:02=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Wed, Feb 26, 2025 at 10:09:45AM -0600, Rob Herring wrote:
> >On Wed, Feb 26, 2025 at 05:44:56PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >>
> >> Add compatible string for the protocols by adding new nodes
> >> The current nodename pattern is "protocol@[0-9a-f]+$", the new node
> >> name will be "scmi-[a-z\-]+$".
> >> With compatible string and new nodename, cpufreq and devfreq could be
> >> separated into two nodes. And fwdevlink could correctly link suppliers
> >> and consumers.
> >> With compatible string, and driver updated.
> >> - Differnet vendor drivers with same SCMI protocol ID could be built i=
n
> >>   without concerning vendor A's driver got probed when using vendor B'=
s
> >>   SoC
> >> - NXP scmi pinctrl and ARM scmi pinctrl could be both built in, withou=
t
> >>   concerning arm scmi platform takes nxp scmi pinctrl node as supplier=
.
> >
> >How are you going to handle DTs which aren't updated and still don't
> >have compatible strings? Seems like that would be messy if not
> >impossible.
>
> The goal is to support 'reg' based protocol node and compatible based
> protocol node both. I could not promise what the end would be, but things
> will be tried to make clean.
>
> >
> >>
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>
> >> RFC:
> >>  This may sounds like that adding compatible to resovle linux driver i=
ssue.
> >>  Yes indeed. current scmi framework limitation makes it not work well =
with
> >>  fwdevlink, wrong suppliers maybe linked to consumers.
> >>  I have tried various's method to not introduce compatible, but reject=
ed by
> >>  fwdevlink maintainer or scmi maintainer
> >>  There was a long discussion in [1][2][3].
> >>  [1] https://lore.kernel.org/arm-scmi/20240729070325.2065286-1-peng.fa=
n@oss.nxp.com/
> >>  [2] https://lore.kernel.org/arm-scmi/20241225-scmi-fwdevlink-v1-0-e9a=
3a5341362@nxp.com/T/#mdd17c4b9b11af9fae0d5b6ec2e13756c2c6f977d
> >>  [3] https://lore.kernel.org/arm-scmi/20250120-scmi-fwdevlink-v2-0-3af=
2fa37dbac@nxp.com/
> >>
> >>  The binding changes are posted out to see whether DT maintainer's vie=
w on
> >>  whether introduce compatible string is welcomed or not.
> >>  I not include driver changes, because this is just to see whether peo=
ple
> >>  are happy with this or not.
> >>
> >> Quote Sudeep's reply"
> >> I am not blocking you. What I mentioned is I don't agree that DT can b=
e used
> >> to resolve this issue, but I don't have time or alternate solution ATM=
. So
> >> if you propose DT based solution and the maintainers agree for the pro=
posed
> >> bindings I will take a look and help you to make that work. But I will=
 raise
> >> any objections I may have if the proposal has issues mainly around the
> >> compatibility and ease of maintenance.
> >> "
> >
> >This all looks to me like SCMI has failed to provide common interfaces.
>
> What kind common interfaces from your view?

"NXP scmi pinctrl and ARM scmi pinctrl "

I take it that the ARM implementation is not sufficient, so NXP had to
create their own?


> >I'm indifferent. If everyone involved thinks adding compatibles will
> >solve whatever the issues are, then it's going to be fine with me
> >(other than the issue above). It doesn't seem like you have that, so I
> >don't know that I'd keep going down this path.
>
> There is no way to build correct supplier and consumer using fw_devlink w=
ith
> current scmi reg based protocol node.
>
> To build correct fw_devlink supplier and consumer, need provide
> more nodes, not one node for multiple devices.
>
> As fw_devlink maintainer said in
> https://lore.kernel.org/arm-scmi/CAGETcx8m48cy-EzP6_uoGN7KWsQw=3DCfZWQ-hN=
Uzz_7LZ0voG8A@mail.gmail.com/:
> I also pasted at end.
>
> "
> The problem isn't so much that fw_devlink doesn't want to support
> multiple devices getting instantiated from one DT node. The problem is
> that there's no way to know which of the multiple devices is the real
> supplier just by looking at the information in devicetree/firmware
> (the fw in fw_devlink). And keep in mind that one of the main
> requirements of fw_devlink is to work before any driver is loaded and
> not depend on drivers for correctness of the dependency information
> because it needs to work on a fully modular kernel too. So, fw_devlink
> just picks the first device that's instantiated from a DT node.
>
> I really hate folks creating multiple devices from one DT node. One IP
> block can support multiple things, there's no need to instantiate
> multiple devices for it. The same driver could have just as easily
> registered with multiple frameworks. So, ideally I'd want us to fix
> this issue in the SCMI framework code. In the case where the same SCMI
> node is creating two devices, can they both probe successfully? If
> yes, why are we not using a child node or a separate node for this
> second device? If it's always one or the other, why are we creating
> two devices? Can you please point to specific upstream DT examples for
> me to get a better handle on what's going on?

I'm not clear on why you need 2 devices for 1 protocol.

This is a common thing where DT nodes and OS driver instances are not
1:1. We have to support that because h/w structure is not always going
to perfectly match what one OS's driver model prefers (which can
evolve over time). DT is not an abstraction layer for that. Creating
child nodes as suggested is NOT what I want to see.

There's 2 ways we can handle this:
- One driver registers with multiple frameworks
- The parent driver creates child devices. The child devices can
either reuse the parent DT node (i.e. set dev.of_node) or just get it
from the parent device if needed.

Unfortunately, I think we have to support both ways in general. I
don't know about SCMI specifically.

Perhaps fw_devlink needs a way for the parent driver to resolve the
dependencies. So fw_devlink finds the parent node as a dependency, and
then somehow calls its driver which can then check if the child driver
is ready. It would need to know the type of consumer though.

Rob

