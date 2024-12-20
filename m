Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3146BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fu02/Fmh4ZbtCqxR5/+0fGOTzDcq8jLPwYadQJ7QU4I=; b=OCyH8Ihi+xTBGTANSVUfvFXuWm
	OjR2y5zxxBZvrUKcjqZELbXPciiLdOPKdR8j/x7sOFZSCRjrfviRFG7Qoib80it3o/BwnMn8ogIkk
	H/l8pggGN48DdMBPFgPr8oksV4g/VY2TCdyc44w8TsVCDIExqKOOmZS1Q1CcViAqHvws3ZhjgYGtI
	CGWt3VehOC02K/Lve2PRxAyMpKsMUQDnGMqdduIKuz/z2hDKj84pxD0k9Hi/2TQjAMnG7ZFwr5YOa
	vw9XfKLsiwgJw4tIc9KWeZYjxMAsidSGLtlnNIqQMKvfuPSjC0m9S6qQGE+gpz6k37Kv2DYz4+NYk
	q4iHYuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcfy-00000004xdv-49RA;
	Fri, 20 Dec 2024 13:04:18 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcdu-00000004xNn-3ITi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:02:12 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6ef60e500d7so15643877b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 05:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734699729; x=1735304529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu02/Fmh4ZbtCqxR5/+0fGOTzDcq8jLPwYadQJ7QU4I=;
        b=lyQijDCpxWoj9gqqHw1S7kSA5GtTjwIbikidGHegylOJHD8GeO4EZj96rkUuRbXVro
         tvInV8FL//Y8K5ODVUR5gRy0nI1ysm+/eWg+OVLGjyLojk0KKsS5WXoqoyHgxy2Wh7Pc
         jGTLi2tsT4CLb12+qYGIcN50qstaSYiJFoZqDuulhzy0a/vpYahZ9b99Mz5d6qQIdH+S
         uzaoXwk30OIiTf4/CwBhpvyLXSDhLaB3GbqgTo8hNIYnvZiWt+Kj2Xe6AmTHPPPIbOcF
         06gP9WKliIwXN0pY213SN0aQkzRCekJXEIXKWLLzJzjee98P6ZgIFz3tSuqZCFW50VRw
         Oc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734699729; x=1735304529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fu02/Fmh4ZbtCqxR5/+0fGOTzDcq8jLPwYadQJ7QU4I=;
        b=g4v9XYEKIUiXDy/tvGyS8kxzMYn0frOKh5cFuULlxik6HFlYITAM/4CftuFxJl0ASV
         sPn00Gy9g8cJCJ2tLq7YLMyWscUeFZvuPbeppRdjSXx+S/z0wZYOQ/NfjntmqpSePGm1
         qlxpGxjrN9lMJ72gDSV7sprm3yUpE0GlSKmK7PROIzroAe8haqU9WBBxdLFOQe5hi/Rc
         OwD7NLLxVizX0hV48tXh2qyYOSXeXqpu4VCkwA/LXpEIA7xpkpFcsuvhCav0pvwzUuqd
         qPJJpcx8T/ceXcJzQFILte1MRGqvrey7y08z4bS+zwWhV2bb44MD6kkeRLTgEMRPicRL
         mM/w==
X-Forwarded-Encrypted: i=1; AJvYcCX+iMcLl3jakQ0gg+hh041hNxywtVn3yfx7Z/qgB8HTBWModAySLPBBRLs28UPFU2RT6nqsOqZoCv84KpYdgxwe@lists.infradead.org
X-Gm-Message-State: AOJu0YzRPPRtcdfhfiyu+6+hU3DbmIEAtVBOhc+om6OMetecyAAoNRf1
	DHD8c3k4XmJKMTaPs/iuBsNbyvjcJq8pxXSuddbMKQblX7S9iU6IArV3fCHwvNJx936s9fMZKa4
	8OYK0lHTeCgIdbA7Rt3brcs6+rbQpCUF99Zw5vA==
X-Gm-Gg: ASbGnctdePGXNFjYoHTxIc0q7IKB53XF3cqz4fWjx/lqAELXlXFFi/b161pgeKuF90Y
	lcOFR54bM5UNN0EDQMWY9Ji+ZbqmfrMfN9QjqTg==
X-Google-Smtp-Source: AGHT+IFzQLWMZQE/IRCrzQuJ49iVkiuSr8lSUXTeAQq7Q5a0dorvlXsI8IoArLc+t/qm0OgPgCykCrt4mTj6yv3UQxo=
X-Received: by 2002:a05:690c:368f:b0:6ef:60db:5e8d with SMTP id
 00721157ae682-6f3f80d626dmr17834807b3.4.1734699729509; Fri, 20 Dec 2024
 05:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com> <CACRpkdaB9kqcjmhaXd5RxpYvqdSVMZkj0wHAtEgdqDs03+wzJg@mail.gmail.com>
In-Reply-To: <CACRpkdaB9kqcjmhaXd5RxpYvqdSVMZkj0wHAtEgdqDs03+wzJg@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 13:01:51 +0000
Message-ID: <CAPY8ntBJqukSJs7VUXvUFAsiKqNWknL8VjgtQG_VAEmw576EPQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names property
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Stefan Wahren <wahrenst@gmx.net>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_050210_995364_4B34B6B4 
X-CRM114-Status: GOOD (  13.75  )
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

Hi Linus

On Fri, 20 Dec 2024 at 12:50, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Thu, Dec 12, 2024 at 7:36=E2=80=AFPM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
>
> > gpio-line-names is a generic property that can be supported by any
> > GPIO controller, so permit it through the binding.
> >
> > It is permitted to have a variable number of GPIOs per node based
> > on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> > items based on current users.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you.

> Perhaps Bartosz can just apply this one patch separately?

I believe he already has, but commented against the cover letter
rather than this patch -
https://lore.kernel.org/linux-arm-kernel/173434013318.38429.808413721248542=
013.b4-ty@linaro.org/

  Dave

> Yours,
> Linus Walleij

