Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EC6C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=; b=nljdg1yiqsy3OObeBFhU6FBJ5f
	rbeSBDScycKxvid9yi2DNlABv9HNc83kbx+ly9ES2VPEBMhOe4umreL79bb3TuQOWaZAjXiUgOlEw
	9KqwVOwa+FxbXCWtVASN0PPAa3oUm1MzMODtbT2mbRo+D5pB09EL5kLASl+Ig++e5UX8IlxmSVEAX
	T1j1i1vQncS45yraPknTDteONof7kdQPgmRa0FGsydZmEKeVPio65F6Ealn0GXoP/q6yVQMw6qmmI
	WgV6IUhPREQ5aCR/MoO7Jo5680FwZdDIIymx6mpRWDofVXNjoreSkVG9tg0YNm88QEDKl9dfjGizm
	LSBhNvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90WI-00000005VwX-3W90;
	Tue, 22 Sep 2026 13:26:50 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90WC-00000005Vug-0UeE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:26:45 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4aa8e6bbso1929895d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790083603; cv=none;
        d=google.com; s=arc-20260327;
        b=ZzS4rb0r6KFFkAUhfFYfa3lUL4EaXEToxSJFxdxLgtQIWAww187d4QHcqkdV7fVA8f
         MDrSVmm6YmDARFpbnIThiHmKqCByF3Ry0u575mXjzYZJxnmYKAz5DYVIQGwjP5sPPYsv
         fgFYdJWG2g1IJC/nRq/WvL65I4JLvrDUCiuRxphOpVFgasbsw5zlsH8orNbKmepbf7UT
         cnWvAm7hyafThZ9XiLqlBfixMSxUkIZjhOiVxEhiJb55Tmiea6KjlKT5pDQgTEmSIrHT
         7/cMQFh30mRM+KKPkX66LJ1WII7Jq+Oo5pAiXCIJDCvv1N6LvPyyW2EAqPZDR7BfGUdo
         rOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
        fh=S5O/qb8pkTo1eucHaaUIreOcyGIoyVtMeWGa/qXqZS4=;
        b=JPSW/UhM8bVwvaYUAWwTwFMinWizj3DEZ1IdUCZN6svMmJfUef0N44gWJdJHGKgeEd
         esXZEf3rmYBJdaeYyYjbmoDl6b1LyvXyC0ToEbibonjTK5OGZ2gdqt0aFFYD1djzLLkP
         reng4Aj4LKWRxAuYM2IA8EPyQNeXF1KFRRenkqBEMSW8Gd6/zbZXh6BItpTuTKYGjIC7
         w4Qk5uHL7fF/MBQ4fAgOi0r3A87HhmAIGpZ9b3fGpOdl8FP4ulVze+1FoBS4f5K5DoUZ
         N4+wMEO0B8VUs1igX8S/V4ufFjHkXU+CyFaNNnkKdSuP0ivQ+69N92D6GgEXJc0yzSkt
         tZFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083603; x=1790688403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
        b=EFOMQU5ROZM858Wo/fz+H2Fh5XAdVLMP+le/9KDwqVvDJxvcDLTdThkwZgOQrJemqc
         HpX7ao+rj8WyxyGuxDMFq2fICns3v5NlyXOMALHPoajj5AkhVFF8zVXb5EiaEPODO3f9
         huJM6Z1qO8lD0qgeIkV23hfjpM5Fw01vc1CmW7TsFIcvePB8gW4Giqdj6ZSfHzEY2WHe
         xTNObs4Is56Yn9mOfuEK/nUul4VVJO7h1xb4qpJQv69dmjSeYNGdEfp6z3qaLNHcClgH
         bQ4fbRCtE5zrdN6Dlm1jSZx2/KOnF3intXT9Qjf3fpwr965m3VfyYweYEar/cMU73pQm
         KF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083603; x=1790688403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
        b=R2xp55rw/yfFvuqe/4Rhya7sJR2H/ZsDoKjx+id1GX3EAHaPxC9wi7NoFo67dL1/rj
         A1BqF9Blh5awsDWOHqiBkO/5hQMfN+9Q8HPIx2zvMbn74XkpP4CdCH5W2pmH9lGHS8N2
         GsnAal0ue1im903wBDURVr7wkaMKIpd4QAxsafAjfkEbrvzVNiwkg7M4JUWv0Z/vZoxN
         /bsRYf/NQKY+6SXESOA7IkJlhA8gLocWdkAIX2dZxG1pOdx/yuRz8XMuke+a6C369LkE
         LB8AOYQfLEBUwFoklF1vqezvFgz9W+4Yhza66VLbd6xFqXa4AwlfNieK4WWfxylL1w9c
         WPMw==
X-Forwarded-Encrypted: i=1; AKwUvBzPG3BmVuHAtfrM3GBt/SMf4cEENGrI/bRYmIj5EqUQkIeJiVjNS3G5gWJ1yqGwkD/Xo+J0n1yxU6ibzOKYcBr+@lists.infradead.org
X-Gm-Message-State: AFuF++nz1gkWfa0lyL9DU6Rg7QlOfA1JzE7213w21V2n9gnEGlRoZNsG
	fqufAC1dYEYPeMIu73V2ECuGy9jhJbA/stY0WiwT+yadhPMwCgGgYKHf46JEQfE9TmIFeiK9uOa
	cgeoQmeEGVWfoL95o5FexXwmdVYcc2Pg=
X-Gm-Gg: AYBFou3qrkKUciDuYJiEzSP4Y+RhWxwo1tP60DjbDSU5zFf/P+gamjC5Kr5nbI7ANj3
	9mdRa2KrJh4CiB5KpTp38HSp1SA0O6snNn6ejswbsUjWIDKudFWoUeg9nstyza/WScLBURA3tlN
	uGA0bkoG8YIr3bk7A1nz4TU+8NPTRmYMk3qUWSry73f8kmtAUHGYn4vIxgfQQnecsYP4LS4HXNr
	LrCojzosDL2DNP00W+wkMNDtCo2X2UawLkAHfiya6fMB4K2wvWVk8dBW21PGTj+t58FyraX3b9L
	u1l1e9NBGs8ZC5WycMFdk6o8xdvnVAhI9yf0dNzN33ITGecz4sdIxVd5q0bq7VBVXd2e+Q==
X-Received: by 2002:a05:690e:144e:b0:671:4e37:a832 with SMTP id
 956f58d0204a3-672c2a1492amr1424683d50.22.1790083602711; Tue, 22 Sep 2026
 06:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com> <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
In-Reply-To: <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 22 Sep 2026 18:56:31 +0530
X-Gm-Features: AcwNN1XaRXA3PPjiOAu8sy9beqIj3WvHMknSJQK0T_ZOITGdCWmSpx7UdDH1Lq4
Message-ID: <CAMFFDGjJcmpaQYHe=F+jpstbdk9-uXPKkBxLkJqAJRiyyTkBvg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC support
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, andrew@lunn.ch, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_062644_173585_17DF7B24 
X-CRM114-Status: GOOD (  18.15  )
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

Hi Tan,

Thank you for catching these issues.

You're correct about the defconfig. I used `aspeed_g5_defconfig` for
the DTB build and incorrectly reported it as validation for the
AST2600. I'll rebuild using the appropriate AST2600 configuration and
correct the statement in the next revision.

I'll also carry forward Andrew's Reviewed-by trailer for the unchanged
MAC0 and MDIO nodes, preserving the scope of his review.

Thanks,
Prasanth

On Tue, Sep 22, 2026 at 6:51=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> On 9/22/26 2:34 PM, Prasanth Kumar Padarthi wrote:
> > Add support for the ASRock Rack B650D4U BMC, based on the ASPEED AST260=
0 SoC.
> >
> > The series adds the board compatible string and describes the BMC memor=
y, SPI NOR flash layout, UART console, GPIO line names, graphics reserved m=
emory, I2C EEPROM, and MAC0 connected to an RTL8211F Ethernet PHY.
> >
> > MAC0 obtains its MAC address from the EEPROM on I2C7 and uses RGMII-ID =
mode.
> >
> > Changes in v7:
> >
> > * Correct the GPIOP bank line names for the reset, power and NMI button=
/control signals according to the confirmed board mapping.
> > * Remove the obsolete GPIOF5 reset-button line name.
> > * Leave the binding patch unchanged.
> >
> > The B650D4U DTB builds successfully using aspeed_g5_defconfig.
>
> What? The B650D4U has an AST2600, so using `aspeed_g5_defconfig` means
> you're using a config set for the AST2*5*00...
>
> Also, please preserve the trailers from previous serieses (i.e. Andrew's
> Reviewed-by trailer) if you don't change anything significantly for the
> parts that got reviewed.
>
> Tan

