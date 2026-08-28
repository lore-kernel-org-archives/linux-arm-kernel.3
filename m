Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EBEC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4mRPyxUwh4SLKG3nAkInA2mLQaoHKjEcd3Lko4Y3NE=; b=UaLb5QZO5S1AimFvuI7J8SMoS6
	3tu5YrIWh8WQ2Hd8vr81co3JuuZoURGqsSrajhSgbOtmq7WwZdToooJKt/oYb99BmwO0OZfO7VdUV
	Z2bHEpgev9i78fEhoZvbPIVSB0p4+YThmwfhGDprtaNE1cHI0jLc+5FSTJrFfHWIXdbiNNrqRYUMx
	jDhWofM/Oar8fuzXjdQa/8PxZlVpe4I97d5R7JE72sFBVrJysl+1XYAVlXBFjFzW5OtMUdoVA2BD/
	kXmVCdt02dXWkliv+ahxSzvLXa2S76TuxCM+rWo30nhDYPj/aU1W8MFJhUkUwno/zP32NWV8cqDuY
	cHYyYjmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzt05-00000005ULw-41M8;
	Fri, 28 Aug 2026 09:35:53 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzt03-00000005UKe-0LIH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:35:52 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso936568a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 02:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787909748; cv=none;
        d=google.com; s=arc-20260327;
        b=VzZa2dIzY+SoNOBSZDeCqSCeGSOmKZm6w+yn+06xAGgAKS0n13KA6AF2vf+x0nyGrx
         flvF76bTNOObjexF/suRgRgXFqqjl7OkLkq0+xPDSQSEj0PzdUsVD08AdS1XNBLydfoH
         /qKhLQUM0Wx/ZhZZYRuW5S9O35xNL1SxQityRalJCgCcfgn2nSIRiiamIQmS/ULoBljS
         CHZbl5+uT82z010Wr06Ng2NWhJVw+WEYhRsTAjLV18P8Tvo9VCxDZ9zzY8RbvPzc3Fjj
         b6HV2vbhDUXv8VnuVCx4z+p6t+a9n4j9O/iqIhY+QgLGaNW7SD+Yx2TnJmkRI6CY4RZp
         6XkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M4mRPyxUwh4SLKG3nAkInA2mLQaoHKjEcd3Lko4Y3NE=;
        fh=V7HxlEJMf0L8DTFsDFgmx8TyD5SBQgbhe5n9otqirwk=;
        b=KE0dFdOxO7XOBpnf64SPI5jyxUi1JFYr3jtZ2B6llm5/B7vlKzf7B685Pl1yVThUWX
         fQSQRVabWQAWvApCDqul47hnQh6A3GtbDvj6dLybn/Y0cFU/wBckWngOBjxvPJ7ZWnPX
         Rb9Zv15AhkPrkALXQQliRmZdiKTY8TIotOm5YIM06eVXOJvufv3XchgLbRHhij+U3rkN
         ONPSEKGJSGrQGPoTtnU3AfiI1Y/uasmfjMLQr1ee1NLTQtCpOG5+7f1SVWgLanFV85YQ
         UpI5O5NOGe8k+ravbZw/rbTW0vjNu7pjAG8p8OP1KF1jWIaH5ouB5QhauKjMmmbc/jYQ
         hFWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787909748; x=1788514548; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4mRPyxUwh4SLKG3nAkInA2mLQaoHKjEcd3Lko4Y3NE=;
        b=DOaoZZFbzA/thQwFB8X5u3XzOttL2TeGnzJfixLlXWzqNhWhHcaQ+9m8SDVWDhcC5K
         kQ9bBjG2uD9G+elgS+KBAxM8rPUkkzgJxmqT1tDXBML7sE4OINyjeOuRe9FOzae6RBgv
         MFqFOr42f9jIM+wJJtNaRpQijI9u3PHCdd/GcUxLZ3iHh4x7EARZFmxCqLTVQ84TuiBh
         WyrZrm+T1LxVS55RBCjDI60Jh39+lUapSy496psvzARwN9MGjx62OZ2Q4mW/2Y5bS0bk
         7RJPuNRximtx387ASepuRDpr95eE2I4wLsVly+K6khxYibh36hL1MAdfDyx121YJmF94
         BrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787909748; x=1788514548;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M4mRPyxUwh4SLKG3nAkInA2mLQaoHKjEcd3Lko4Y3NE=;
        b=q2p36o7jky+sq4DrDBSPrr0hyeW//MSLnSsm3liB4Y7pYSPV7evEMYjUZPBUImMiyb
         l2Pzyrbvi4ORRPndU75WAlLRBHzrK2n22NyyB9wNrOgCLQkIH6R73M1CAWYvcgqZkruI
         Qhdu9JRRVQLpR4PYywKKoNAVYazGq+zL8DJsF4eZeUs2Qp6QbN7kj6+1A3CeZ4axG1Ew
         R4G1NNwFpVPFhM1tn649iTvpyqeC3u9PdxY7PDyzB79xim1lamSkgAKbRWIUUFC/MfKW
         /Cx6/lbNPNaoFnVspswEr/dzMLiv326pG9dS4NaGP/4JrLDlBSWsNAEYoTyPSV9xe8Fh
         3U+A==
X-Forwarded-Encrypted: i=1; AHgh+RqYnYJyQLEjbirRiTEz/uUVIa2XAkMEMhtIuCrwXvP5mCJ1s17jmL7TMbVpiB0ZGcLLvRrn/rlyQJ5jSAkwdSSa@lists.infradead.org
X-Gm-Message-State: AFuF++kLbJ+dWKBwhPBtFcrJrkX3Xp8JLIXkJrS9yL3za3v7Q6uOjfQy
	3B11MzJGtK3Z+2KTiltdi9A6bGs3vjcNOiXjViGKG7wUe+LN3kpykMtX3JDS5tfwbiffj0AmgEM
	2PT+9RI2c5iWKhkvp1Cma61PBAkZ2OBMB+ythdadLkA==
X-Gm-Gg: AR+sD10xcj0gm4cRGskDSSEj1cWd2/hCK8PAer1Brd7Sx/e3H0cByWB22eolWOGyPhh
	VuxD107kAOur1+l84RkJpn5/m6JPzDRa0aBWjUWQ5Qhkro4aX9h3ZlsiRW9Ik01yHH0aZV5XIGZ
	ExoP42HBKDC/7Jy3T1hmvKiG+CgKDvz/WHTVIHUI9+4vaaAOAuUhlB416D2wh2YBokWn8XSsZ5Y
	NxRRrjx6bHYcoVjho+u9VIsSmBY7Wf1A7hNPjEADpX4uq7AhrqSMyJvFtOoF/0CKI8JblL2lkin
	b+jJa4bt8d/DpcUNdv3VZf/ZPHY7XbLTruziGApAA0Vpvr0Pfwu5YizijazPBOvHqfJGz3p4ed8
	eBU8=
X-Received: by 2002:a05:6402:3807:b0:6a5:f528:ff48 with SMTP id
 4fb4d7f45d1cf-6a60d35736cmr3469549a12.5.1787909747586; Fri, 28 Aug 2026
 02:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com>
 <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org> <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org>
 <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org>
In-Reply-To: <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 28 Aug 2026 10:35:36 +0100
X-Gm-Features: AcwNN1WeoYWQnW4gSKiWJkUeMJcl_oJic8RHhz9v0tzgpLotvnyYe_l98Rtu_To
Message-ID: <CADrjBPrhaQHyQX-+FEHYH5rCwh9_fMUVsV5fpvRkR-RF_9Erkg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Thomas Turner <tturner@lineageos.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, krzysztof.kozlowski@oss.qualcomm.com, 
	alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_023551_171382_6EE6AF20 
X-CRM114-Status: GOOD (  39.69  )
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

Hi Thomas, Alexey, Sam

On Wed, 26 Aug 2026 at 20:44, Thomas Turner <tturner@lineageos.org> wrote:
>
> On 26/08/2026 20:02, Alexey Klimov wrote:
> > On Tue Aug 25, 2026 at 10:05 PM BST, Thomas Turner wrote:
> >> Hi Sam and Alexey,
> >>
> >> On 19/08/2026 20:51, Sam Protsenko wrote:
> >>> Can you please tell us a bit about how you tested this patch, and on
> >>> which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
> >>> sure how exactly GPU can be useful. If you have a use case or a
> >>> testing procedure we can run on the E850-96 board, please share.
> >>>
> >>
> >> Sam, Alexey could you please test GPU on the E850-96 board by following
> >> these instructions:
> >>
> >> 1) Apply this patch series locally
> >> 2) Change status="disabled"; to status="okay";
> >> 3) Make sure these configs are enabled:
> >> CONFIG_DRM_SIMPLEDRM=y
> >> CONFIG_DRM_PANFROST=y
> >> 4) In terms of regulators we set up a basic mali regulator via our
> >> secondary bootloader [1] and configured with this dts setup [2], NOTE
> >> you may be able to get away with a dummy regulator so try that first.
> >> If not I am sure you can replicate something simple with u-boot PMIC.
> >> 5) Boot a GUI, I saw Debian was used for the bring-up, that should work
> >> 6) Run the following command:
> >> $ dmesg | grep "panfrost"
> >> 7) Compare that to the output at [3]
> >
> > Your email subject still seems to be null.
> >
> > [   15.206193] panfrost 11500000.gpu: clock rate = 377000000
> > [   15.206322] panfrost 11500000.gpu: error -ENODEV: _opp_set_regulators: no regulator (mali) found
> > [   15.206513] panfrost 11500000.gpu: supply mali not found, using dummy regulator
> > [   15.206840] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> > [   15.213137] panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,00000400
> > [   15.221271] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> > [   15.233080] panfrost 11500000.gpu: shader_present=0x1 l2_present=0x1
> > [   15.240488] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> > [   15.250497] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0
>
> You seemed to have missed out step (4) of my instructions, if you set-up
> regulators correctly this error will disappear.
>
> > [root@e850usb ~]# uname -a
> > Linux e850usb 7.2.0-next-20260825-00009-g647b48e80572-dirty #8 SMP PREEMPT Wed Aug 26 17:05:45 BST 2026 aarch64 GNU/Linux
> >
> > I have different DRM_SIMPLEDRM options and related  enabled but nothing
> > pops up via HDMI (at least I tried simple xorg-server things).
> > Is it possible that your bootloader initilises some framebuffer and inserts
> > it into DTB that passed to kernel? Or you have some other pieces in
> > kernel/dt that implement missing functionality?
>
> Our bootloader does intialise a framebuffer, and we have a node in our device
> tree which makes it usable. Not sure how exactly the e850-96 device sets
> things up but you can take a look at our fork if you want, [1].
>
> > Here it seems there are no outputs:
> > [root@e850usb ~]# ls -al /dev/fb*
> > ls: cannot access '/dev/fb*': No such file or directory
> >
> > and there no simle framebuffer or related logs. "DPU is not currently
> > enabled on Exynos850 SoC" looks like the reason.
>
> hm, I am pretty sure our bootloader configures DPU for us so that might be
> why it works for us and not for you.

@Alexey - I think the LK bootloader leaves DPU framebuffer updates off
to ensure a seamless handover from the bootsplash to the full DRM
driver. We have the following DPU poke in gs101 (which if I recall
correctly we got the inspiration for this from uniloader)
https://gitlab.com/LinaroLtd/googlelt/meta-bsp-google-gs/-/commit/4057117e4bc6e08fbb6ff281cbfef8782a68ec0a

So for the E850 board, you likely need to do something similar, either
in LK or like the above poke. If UniLoader is already doing this for
the e850 SoC then hopefully you can check there to see the address of
the register etc. That should then able you to have simple-framebuffer
enabled.

>
> > Panfrost itself seems to be alive though:
> >
> > [root@e850usb ~]# eglinfo -B
> > GBM platform:
> > EGL API version: 1.5
> > EGL vendor string: Mesa Project
> > EGL version string: 1.5
> > EGL client APIs: OpenGL OpenGL_ES
> > OpenGL core profile vendor: Mesa
> > OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
> > OpenGL core profile version: 3.1 Mesa 26.2.1-arch1.1
> > OpenGL core profile shading language version: 1.40
> > OpenGL compatibility profile vendor: Mesa
> > OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
> > OpenGL compatibility profile version: 3.1 Mesa 26.2.1-arch1.1
> > OpenGL compatibility profile shading language version: 1.40
> > OpenGL ES profile vendor: Mesa
> > OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
> > OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.2.1-arch1.1
> > OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

That's really cool!

Peter.

