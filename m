Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A38CCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uj9b2VSK5/CCRANG5exXj8bP8o0U+jqqF1HLn1h+9iI=; b=YvHqEpODwEbGSkNu305RHGiiWP
	f7i0PXd1ENVSc4Zyx7kPT0JLwmv69a/6XlsobvVxXXSdTzPOWIlBCmRd7l7MYEQa9UEiVzmiDWCak
	JgU7LCl6XiOTmEgbXb1zFo9zekdwHR9P+UTMPyx0O/D4fCW6iAS39IVwNUhy8IZaQ80cR8KHpkNe+
	TOjebCkxz+lMG/k/EyaOjEVdTM831JJaHyorrP5jVvB6xQ13ZRXGnRw39E8CwlezIPr/1B5Zlx5xj
	vgkMiqAvdRRncQTvBt9m2prur/36gM/d0SnYuZboYyAMKDHTGzMNW5FGhg4H/WzimzI7b8aQ9dd/V
	Qc2nOpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMszy-00000000Fmv-1VCN;
	Tue, 12 May 2026 19:42:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMszx-00000000FmT-0aJS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 19:42:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 159F160123
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 19:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0DAC2BCFA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 19:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778614951;
	bh=/jUE21Fh0ZBgRkBMfVEV7iY3fmhHPWdJdPHALN9c0dE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J3hMbMMm0IjKGUPkOzhvyrdpEOnB/2QSYZ8sXskwbJizIVdDegNePibeHnrQPIcVQ
	 5J+JRfUK6RSs09qyme7L2q7XeTDX9x6/laiQ7P934MhjaaXThMOIDo/JAaK/bWIXrH
	 DzH7+UFa2AH8gJ9F8DH6RBiqO7T7SgXFT0fz0PKDn5peMQFkZZyE6YH1OFzB34XBFI
	 LR9U8LAwLNz1/iJYprqEC6rZIG2aLiDzjpVsWyhPyVnjvCINCOPWKwsUiZx/enpgL5
	 5NHjvEDciVxNOpFASCNiTkvSA5IYSWoTbCTaBj30WsFWaRTIO/UFHFb+RTvWoJRzIT
	 /F0lMpLoDxqEQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so10081281a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:42:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/KfzsHoITxCV8yitFRBZwQzC6DUngA4d+bmfOJNywX2EZmC9VhQhSA/sJunsfDUDIzjY0T2spxorqFne6h/rQa@lists.infradead.org
X-Gm-Message-State: AOJu0YyhockoP7a+ZGvfnY9gBj82GgG3jtmmyaatw2Zo0Ii7MgneSk9x
	IW+pRw54F/K5HipcBJ4hQwg+s3VIsDpwgbtKDLZrSjyELICvk92ktRBDR0TEn31YpQ8Xokj7sFr
	OSvAohZgdKBZDkFfYt+RmKwFj3SMrxw==
X-Received: by 2002:aa7:dd0f:0:b0:67c:7697:1ee8 with SMTP id
 4fb4d7f45d1cf-682557ef49amr91032a12.5.1778614950379; Tue, 12 May 2026
 12:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
 <20260510120141.118057-1-pramod.nexgen@gmail.com> <20260511171554.6541042b@jic23-huawei>
 <7baf9ca5-50ff-4131-995b-70ee094ed247@baylibre.com> <CAL_JsqLxtWLR+jxRXt7Uz6dcF-90NYmfyGWYQk9um9TYHSWbTw@mail.gmail.com>
 <a4ecfb27-5ef4-4682-b87c-24917f81b4f0@baylibre.com>
In-Reply-To: <a4ecfb27-5ef4-4682-b87c-24917f81b4f0@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 May 2026 14:42:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKP-C-rA6_19vtMzevVxQiD7bH=k5ObEZZDM3-Zmr_vtg@mail.gmail.com>
X-Gm-Features: AVHnY4LNwO7x3BIsFrr8Vj4o4zwD7AK9d1BcRjayQvl2V-UTQfrTo4IgojWNqkc
Message-ID: <CAL_JsqKP-C-rA6_19vtMzevVxQiD7bH=k5ObEZZDM3-Zmr_vtg@mail.gmail.com>
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

On Tue, May 12, 2026 at 8:58=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 5/12/26 7:14 AM, Rob Herring wrote:
> > On Mon, May 11, 2026 at 11:24=E2=80=AFAM David Lechner <dlechner@baylib=
re.com> wrote:
> >>
> >> On 5/11/26 11:15 AM, Jonathan Cameron wrote:
> >>> On Sun, 10 May 2026 08:01:36 -0400
> >>> Pramod Maurya <pramod.nexgen@gmail.com> wrote:
> >>>
> >>>> Convert the Xilinx XADC and UltraScale System Monitor device tree bi=
nding
> >>>> from the legacy plain-text format to a YAML schema, enabling automat=
ed
> >>>> validation with dt-schema.
> >>>>
> >>>> The new binding covers the same hardware and compatible strings:
> >>>>   - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
> >>>>   - xlnx,axi-xadc-1.00.a  (AXI softmacro)
> >>>>   - xlnx,system-management-wiz-1.3 (UltraScale System Management Wiz=
ard)
> >>>>
> >>>> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> >>> Hi Pramod,
> >>>
> >>> Something went wrong with your sending of v3. I have two versions sen=
t
> >>> half a day apart and no idea how they are related.
> >>>
> >>> Anyhow one of them got feedback from Rob's bot so I'll assume we are
> >>> getting a v4 and wait for that.
> >>>
> >>> Jonathan
> >>
> >> I think Rob will have to fix the bot to make an exception for the
> >> legacy bindings. This should have been called out in the commit messag=
e
> >> as requested in a previous revision.
> >
> > The bot is not the problem. It just runs validation. The schemas will
> > have to either drop this check (comma's in nodenames) or exclude just
> > this property.
> >
> >
> > Rob
>
> Even though this is an existing text-based schema that has been around
> for 12 years with this name already? Changing it could be a breaking
> change to existing users. Although there aren't any in any .dts in the
> kernel source.

I'm absolutely not suggesting changing the node name.

The common schemas globally disallow commas in nodenames. We can relax
that and allow commas in any nodename. That check is largely from
QCom's amazingly consistent use of 'qcom' prefix in nodenames. We've
finally beat that practice out of them. So maybe it's not needed
anymore.

The other approach is to exclude this nodename and any other we have
to keep. I don't like dtschema having to know about some random name,
but we already have that in a few cases and I don't expect that list
to be too long given this is the first case we've seen.

Rob

