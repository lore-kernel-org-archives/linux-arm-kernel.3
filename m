Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECAFC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9y4LFg6yvTjsxuVx9xI+CfaKWUbNOzH9RLH+rTwjQJw=; b=ZwaVv3Q30KFq1d7bqprVjMyLbp
	+fbRnIX+RxHVgjxnEzyepMfiNHpst1b6A/6xsdmpoJUnfoZffCl/SbO/gTV8vWtELLReP9k5ZAlYf
	yN43/ULEqDSG3F1HYRBYVpO/Ard8ChD75/NraGDRFmRoBF4hq61jjLmqVQUkez1bA6NlkiySBjOD1
	mpWJRTDhUk0TPQDZo2c64AOpJFLWgALq/4Q03owJLc4KILn+fyARipDA4jWtYdLx0QzqE+8N+74Do
	uEp3xfsOJwcDUE/G75rAIbhPyoNbkPI39LTeDYNkQSPSVHJgwPHVBPm83CxwDeYq/BmvgZCkHI3iN
	iTn7ULhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyuv-0000000691r-2xKH;
	Fri, 28 Aug 2026 15:54:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyus-0000000691L-3XEw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:54:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f633e6058so736245f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787932493; x=1788537293; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9y4LFg6yvTjsxuVx9xI+CfaKWUbNOzH9RLH+rTwjQJw=;
        b=xzNAO2mu3FhvL8JSxGuZ/Hr5Tl6iBl55stCsY51fJHHjDGFLLbWnaL1nxdfo2s07Rz
         5lR/jdyg9p5jQ4cnnsBa2628eAL/tEbLhQzOmYOxHjCFss0oGEZHxlAmYO8MUP5sxOUD
         iGkbbhZDV3OfTXHSQ5Ypuu8YShu9aIDMXxzxEUlAbFL0qpyKSg5jZcfg1QjgyBSABFzU
         hE+fdxB60lIVNG6a3a2R1pynCLacd+UUbyeXWB5admsXl0eNJYZzfy6g+S4N/YKhLJaK
         kj1KQSARnsho5TMKuqhvND4wQta4F2h6p7dKXuBiuFD0HxnjBgrJ3jMOFNkTZB9QBcLJ
         dzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932493; x=1788537293;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9y4LFg6yvTjsxuVx9xI+CfaKWUbNOzH9RLH+rTwjQJw=;
        b=Yp2ymWKSE5fYx/oBLhwXs3nb1YH9jY0zTmtORVjn1MfD2mDPluRImEK8rFWBDn78JP
         RujOTB5Xy7uN3x6Kxyu+SPWWKtRQbji/ZYkjnjwup4y/4utryzqIF+UEywLs91CQwORD
         Wzjmo7yqNwhZsXpxLVC+vHW1lW/Q4pgABa+5nR3p/oH8ulY4O2yZ61UZtfWDjGBqDPss
         F7fpi/J5LHLcXWbp9IXISBA3C0Zrad6QsxJ2lse/op7UNKcYdNuFgclfYHt4I4rQQt5o
         s5LJn5eCYd3Cbs/0Ok4sM+irogWOOAgEMW3ua1ChmhBGtvKQbz25AJCNnE4Q6swaYDnI
         Kgug==
X-Forwarded-Encrypted: i=1; AHgh+Rr1I9IIhNcyVTM//oPY1GZheqJRETG8g3CVu7rMa0vxtGHt+X9NyHmdX/PBmqrVMuZzCxu42BhH2lJVeeGPiJ13@lists.infradead.org
X-Gm-Message-State: AFuF++m5p0bzoOBPy47rStQK9DafrembUXJqzCYaO9efN/B5BUoFJDir
	b7ird+Gy5XMAQccG/OvKgZLgMozsWgxF7pT5hblTnNpPyzCmIGg761NlmUpWKwIkr48=
X-Gm-Gg: AR+sD13qZvLBfQwb3o/fyXtq+ndDwfA83dge2Um3I0TIuWoNs2J6HTAOLb3wNo79sgn
	/cJlhTEKzGdzWQ6F1SXnrcEmBMxu8AmPPuXF0WkT8J0JkFHUYlmDkBzlQY5Sp15mJRJsr2+dZtk
	UAZfmCP1sQaeFUqH09b51Xg64gWr3VgoesFSBlEJl2GzVkNJCoLYVr8T2cnA3EqpfzOr+2FJ0qI
	4tkHD1zInttF8BxWt+6gITDELTDO75zxQQQHCxGjOELynO0i1oUSdrhKMFevrmmPbW+gwsH8xTH
	Zxgt3Fud51ceNuzo8olFMfWw225usF9K4fHui9vrOs4FN7qFvvyiunCITMpl/YZ5i05Zl0F0gLi
	cZ+VCGiZYC3yZqKZXVt9kAX0LPPtGPrNqOpRudtFS9b4tuas0+zPVMYdq8ege9YU1CGjxxncWro
	vr3NQ5Hf43mrVKseoyvxc1YlVBX3vEsnUILrjRyyFSJQpN4NAx2LnMHh5rT1GQukaLTqgfFhyZt
	vRnCYFya89XSgva1Xm2W6rhIyCacI50no8fN//7qS2V4oJkJ++TCFsy15qz
X-Received: by 2002:a05:6000:2589:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-482f79e0b63mr13842837f8f.14.1787932492661;
        Fri, 28 Aug 2026 08:54:52 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7473298f8f.7.2026.08.28.08.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 08:54:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 16:54:51 +0100
Message-Id: <DL0P67CVWELH.1WDA9P8IZXKJH@linaro.org>
Cc: "Alexey Klimov" <alexey.klimov@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, <krzysztof.kozlowski@oss.qualcomm.com>,
 <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>, "Thomas Turner"
 <tturner@lineageos.org>
X-Mailer: aerc 0.21.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM> <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com> <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org> <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org> <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org> <CADrjBPrhaQHyQX-+FEHYH5rCwh9_fMUVsV5fpvRkR-RF_9Erkg@mail.gmail.com>
In-Reply-To: <CADrjBPrhaQHyQX-+FEHYH5rCwh9_fMUVsV5fpvRkR-RF_9Erkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_085454_937337_575EB7DE 
X-CRM114-Status: GOOD (  36.43  )
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

On Fri Aug 28, 2026 at 10:35 AM BST, Peter Griffin wrote:
> Hi Thomas, Alexey, Sam
>
> On Wed, 26 Aug 2026 at 20:44, Thomas Turner <tturner@lineageos.org> wrote=
:
>>
>> On 26/08/2026 20:02, Alexey Klimov wrote:
>> > On Tue Aug 25, 2026 at 10:05 PM BST, Thomas Turner wrote:
>> >> Hi Sam and Alexey,
>> >>
>> >> On 19/08/2026 20:51, Sam Protsenko wrote:
>> >>> Can you please tell us a bit about how you tested this patch, and on
>> >>> which board? As DPU is not currently enabled on Exynos850 SoC, I'm n=
ot
>> >>> sure how exactly GPU can be useful. If you have a use case or a
>> >>> testing procedure we can run on the E850-96 board, please share.
>> >>>
>> >>
>> >> Sam, Alexey could you please test GPU on the E850-96 board by followi=
ng
>> >> these instructions:
>> >>
>> >> 1) Apply this patch series locally
>> >> 2) Change status=3D"disabled"; to status=3D"okay";
>> >> 3) Make sure these configs are enabled:
>> >> CONFIG_DRM_SIMPLEDRM=3Dy
>> >> CONFIG_DRM_PANFROST=3Dy
>> >> 4) In terms of regulators we set up a basic mali regulator via our
>> >> secondary bootloader [1] and configured with this dts setup [2], NOTE
>> >> you may be able to get away with a dummy regulator so try that first.
>> >> If not I am sure you can replicate something simple with u-boot PMIC.
>> >> 5) Boot a GUI, I saw Debian was used for the bring-up, that should wo=
rk
>> >> 6) Run the following command:
>> >> $ dmesg | grep "panfrost"
>> >> 7) Compare that to the output at [3]
>> >
>> > Your email subject still seems to be null.
>> >
>> > [   15.206193] panfrost 11500000.gpu: clock rate =3D 377000000
>> > [   15.206322] panfrost 11500000.gpu: error -ENODEV: _opp_set_regulato=
rs: no regulator (mali) found
>> > [   15.206513] panfrost 11500000.gpu: supply mali not found, using dum=
my regulator
>> > [   15.206840] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 min=
or 0x0 status 0x0
>> > [   15.213137] panfrost 11500000.gpu: features: 00000000,00000df7, iss=
ues: 00000000,00000400
>> > [   15.221271] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0=
x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
>> > [   15.233080] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=
=3D0x1
>> > [   15.240488] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
>> > [   15.250497] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on mi=
nor 0
>>
>> You seemed to have missed out step (4) of my instructions, if you set-up
>> regulators correctly this error will disappear.
>>
>> > [root@e850usb ~]# uname -a
>> > Linux e850usb 7.2.0-next-20260825-00009-g647b48e80572-dirty #8 SMP PRE=
EMPT Wed Aug 26 17:05:45 BST 2026 aarch64 GNU/Linux
>> >
>> > I have different DRM_SIMPLEDRM options and related  enabled but nothin=
g
>> > pops up via HDMI (at least I tried simple xorg-server things).
>> > Is it possible that your bootloader initilises some framebuffer and in=
serts
>> > it into DTB that passed to kernel? Or you have some other pieces in
>> > kernel/dt that implement missing functionality?
>>
>> Our bootloader does intialise a framebuffer, and we have a node in our d=
evice
>> tree which makes it usable. Not sure how exactly the e850-96 device sets
>> things up but you can take a look at our fork if you want, [1].
>>
>> > Here it seems there are no outputs:
>> > [root@e850usb ~]# ls -al /dev/fb*
>> > ls: cannot access '/dev/fb*': No such file or directory
>> >
>> > and there no simle framebuffer or related logs. "DPU is not currently
>> > enabled on Exynos850 SoC" looks like the reason.
>>
>> hm, I am pretty sure our bootloader configures DPU for us so that might =
be
>> why it works for us and not for you.

Yes, exactly, and see below too please.

> @Alexey - I think the LK bootloader leaves DPU framebuffer updates off
> to ensure a seamless handover from the bootsplash to the full DRM
> driver. We have the following DPU poke in gs101 (which if I recall
> correctly we got the inspiration for this from uniloader)
> https://gitlab.com/LinaroLtd/googlelt/meta-bsp-google-gs/-/commit/4057117=
e4bc6e08fbb6ff281cbfef8782a68ec0a
>
> So for the E850 board, you likely need to do something similar, either
> in LK or like the above poke. If UniLoader is already doing this for
> the e850 SoC then hopefully you can check there to see the address of
> the register etc. That should then able you to have simple-framebuffer
> enabled.

Am not an expert in grapics but from all observations I see, that even
if bootloader (say LK) sets up DECON/DPU and ley them stream DSI,
then we are still missing support for Lonthium MIPI/DSI-to-HDMI bridge
to output anything via HDMI on Winlink E850-96 board.
There is high-speed connector though.

For smartphones with simple panels with DSI interface all that actually
could work if bootloader takes care about initial set up (exactly what is
done in referenced repos of uniLoader AFAICS).

BR,
Alexey


