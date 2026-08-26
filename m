Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A23FC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 19:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2Ai0YOriuHS1IQ7CT4b8R/035xHTVcwVEKbUv9HN3g=; b=Sl5cWmFWjIr0P/8JDT1bpdb6Ai
	zbpTHIKF3EbWBK5TTX9niYvDxrIWAJwwz/Da+a/KdpIh8WttXstz84G4GuRvZ6u31jYE3kUMURN/n
	haEsZg0PhrPJ83zpvIB0aYAVA5KI0fwB/yRzTdlPRnMi6ERcy5t1ahYlZYQo8t+OKDg4lpAq/pjjL
	vV6UiRYsROhxAA2WTaQfcWpEgKENc6puRki5ruOJvYHMJo0wc71/92aFH1S/IG8o8ew31lez2ddUq
	6UfsEkrtg/sx4vqW1ZBL2I3rZOSuctRCSOpmEbR0IxTMLEKtAMYvvPLb5r5/+2iYtgXAhEsjOLSFA
	2bTuk9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzItw-00000002ua2-1LbZ;
	Wed, 26 Aug 2026 19:03:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzItt-00000002uZG-356y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 19:03:06 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4798bea72f9so657759f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787770983; x=1788375783; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T2Ai0YOriuHS1IQ7CT4b8R/035xHTVcwVEKbUv9HN3g=;
        b=r7VwGFSSAVWyG+v8NLQDj75ncz6hCv3Ol1quKhwiYfKLnjpUo2dd0q1JnpOL61kHt9
         Kk2GmCJQ/tnajhWxI7S6LPtuWFUEbt0G5fUnTicdWL5f0jPkiiXUvYccA4F+pibnOhyF
         NPh7o2AqVqtTae68AufW99zeXU2j8DuA8kKKIeYax1a7PARbD/nhcy6eIjZ42ZzHDXUe
         4UvaWDboBSp2MRP/I0fT30lzl7lTwEps67kXkguJOJKp9czuUS+z6c+zVsIyTjhvvc9l
         A0ofSXuNDr4nnuib+2FhbT5xndIw348LbJOUvSQK+xifCOuzVMMKgDuB+GAGmCjDrluo
         fv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770983; x=1788375783;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Ai0YOriuHS1IQ7CT4b8R/035xHTVcwVEKbUv9HN3g=;
        b=KFZVJRwwjPaMbu6v/Glpac5/6PerkaidVrGLrToS9SDNgFVwcNTq77IQixYaOCizHc
         q6CPUT2lA3Zn+0mYtC6LaZifwPOkUFiXPHVf08lRV6rxeRv/rUUrPfATvJ/w7bmSLTJ1
         iSWrpThvhbMogteklJ8bQG6tt7bcsqSqr2xI30BpIbT+RPme5MVp2cL9A/vKrk80IgoY
         0W0BoKj8qe4sDwDsmezrnG4q1cDp2jmwrwuNZgqpCOtUKP6z4YSrb4IBgF3wk7ZKzh8c
         nEnxwQiLvFAoTsiZ1VCagCLnNA8D/6msx2OoPV/TPkaDp+k+zaQ5NlLiW/4D/qWht2mL
         KMiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbZnxcYy7jm2fVcm86anw7Kb7SXz0AuHqejmLvCOM1SEf8eFHYarPDhEEzRL9qX2y5fFfZAQElMwPLmheCHA0T@lists.infradead.org
X-Gm-Message-State: AFuF++nAW7L32qpi6O53xYu3hFgd5FLjLcWxRlC/6Jkf+qSQD2TWSujv
	+gOm2Gwpq31wwpQpuX5vj13KasYpVB55PIuFkC0M0KJiRFTO1D5B+ZPt55RLGhcEJg0=
X-Gm-Gg: AR+sD10GExZzPcOsJyCYGZPvo1Fz77mdj0e0imDPr4Od7Lm/BRuqjl9+ugWVcvUwu9C
	HEceE7DTAFJEpTQvuqxpKtpjc/o1PmTfVOCL6R+Wu8aggrOpBQvuPcAxgzbrCA5xVUqYFw0t53u
	7sod0CsAnZUZjbV9c2ttSMPa7znDmW8nGrikU/hehUihjzjQmYr7Z6FM4YRVieWPtygpw5VxOR1
	W73SMzg8LQFibayCeY737W1ErrBSIM2q1ouFL1HRUZC/rAG5n7XCc2Nr7YX3F+Epdi2ZQMtaBrF
	2OdnQCAjVLv+uGewM2QoTFtdai80X2duw0QtnIcMRCRMfO2Y5R5iYS9z82MS9NxyDjxWtrmA8dz
	r9lhB152uYe3ZiulN9yiPgKRYS+MIX8Ib+sudTCXC+DPu8DRsSfHvsk2rjAL3Q/xNNjgqwSqAMp
	ifgqP9woAZDd+tqAuBmfHP+EdIVVeNDAow2qVXSxZ7ux2ub0nej3EjClu6NGZZBlWW9zXLIGDwC
	y1dnr/UfPXZ2N/r8BrefayfcRKlulP9+mT94SZpXSe9poREc51CtRIQkNoE
X-Received: by 2002:a05:600c:190e:b0:499:a277:e8c8 with SMTP id 5b1f17b1804b1-499dc725b50mr82901585e9.13.1787770983326;
        Wed, 26 Aug 2026 12:03:03 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab4dasm3669437f8f.15.2026.08.26.12.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 12:03:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 20:02:59 +0100
Message-Id: <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Thomas Turner" <tturner@lineageos.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 <krzysztof.kozlowski@oss.qualcomm.com>, <peter.griffin@linaro.org>,
 <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: 
X-Mailer: aerc 0.21.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM> <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com> <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org>
In-Reply-To: <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_120305_851969_F7D0E30F 
X-CRM114-Status: GOOD (  21.25  )
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

On Tue Aug 25, 2026 at 10:05 PM BST, Thomas Turner wrote:
> Hi Sam and Alexey,
>
> On 19/08/2026 20:51, Sam Protsenko wrote:
>> Can you please tell us a bit about how you tested this patch, and on
>> which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
>> sure how exactly GPU can be useful. If you have a use case or a
>> testing procedure we can run on the E850-96 board, please share.
>>=20
>
> Sam, Alexey could you please test GPU on the E850-96 board by following
> these instructions:
>
> 1) Apply this patch series locally
> 2) Change status=3D"disabled"; to status=3D"okay";
> 3) Make sure these configs are enabled:
> CONFIG_DRM_SIMPLEDRM=3Dy
> CONFIG_DRM_PANFROST=3Dy
> 4) In terms of regulators we set up a basic mali regulator via our
> secondary bootloader [1] and configured with this dts setup [2], NOTE
> you may be able to get away with a dummy regulator so try that first.
> If not I am sure you can replicate something simple with u-boot PMIC.
> 5) Boot a GUI, I saw Debian was used for the bring-up, that should work
> 6) Run the following command:
> $ dmesg | grep "panfrost"
> 7) Compare that to the output at [3]

Your email subject still seems to be null.

[   15.206193] panfrost 11500000.gpu: clock rate =3D 377000000
[   15.206322] panfrost 11500000.gpu: error -ENODEV: _opp_set_regulators: n=
o regulator (mali) found
[   15.206513] panfrost 11500000.gpu: supply mali not found, using dummy re=
gulator
[   15.206840] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x=
0 status 0x0
[   15.213137] panfrost 11500000.gpu: features: 00000000,00000df7, issues: =
00000000,00000400
[   15.221271] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x0000=
0000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[   15.233080] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
[   15.240488] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
[   15.250497] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0

[root@e850usb ~]# uname -a
Linux e850usb 7.2.0-next-20260825-00009-g647b48e80572-dirty #8 SMP PREEMPT =
Wed Aug 26 17:05:45 BST 2026 aarch64 GNU/Linux

I have different DRM_SIMPLEDRM options and related  enabled but nothing
pops up via HDMI (at least I tried simple xorg-server things).
Is it possible that your bootloader initilises some framebuffer and inserts
it into DTB that passed to kernel? Or you have some other pieces in
kernel/dt that implement missing functionality?

Here it seems there are no outputs:
[root@e850usb ~]# ls -al /dev/fb*
ls: cannot access '/dev/fb*': No such file or directory

and there no simle framebuffer or related logs. "DPU is not currently
enabled on Exynos850 SoC" looks like the reason.

Panfrost itself seems to be alive though:

[root@e850usb ~]# eglinfo -B
GBM platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES
OpenGL core profile vendor: Mesa
OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL core profile version: 3.1 Mesa 26.2.1-arch1.1
OpenGL core profile shading language version: 1.40
OpenGL compatibility profile vendor: Mesa
OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL compatibility profile version: 3.1 Mesa 26.2.1-arch1.1
OpenGL compatibility profile shading language version: 1.40
OpenGL ES profile vendor: Mesa
OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.2.1-arch1.1
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10

Best regards,
Alexey

