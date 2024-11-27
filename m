Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC9ED6ACE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 14:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spaZDggYYtywRJ4kgtwhMtxKbrnoYAiIWhbsdMeY0e4=; b=XYkf/WVgFLSOUwHLbNppJ0H+FT
	dQp8SM+YaHFF04yAp7BOVNCwUJQ3JpFnNGKLratZjOQIkkiuLPcuYUm9iMb8JT7f3KZy6ql4uIwAF
	oA8B3C1Y+Ysf4LDdwRQJ31saeUOJbYi4RsNa5E8xXrvMB/6DNp+oVnLD2W9xVWe++VnbnyzrJ6Oo4
	NmiT2BhD8yQVha+bbtgViz8Mz5eTIuB4sJKL2GydlGXc0b7CYmwp/IE4WVZf0UkI/ClMtlu368+3G
	DhbxRlXSGpI9u2aLAc8kDKOj72MymnX67TyINRdzalkbIbTdM9Za+LFHPC0/H1qjTN8rJmfqoUTV/
	teZzhn7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJB2-0000000DNpL-1Wkq;
	Wed, 27 Nov 2024 14:38:00 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJA3-0000000DNeH-37zh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 14:37:00 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ffbea0acc2so41881761fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732718218; x=1733323018; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spaZDggYYtywRJ4kgtwhMtxKbrnoYAiIWhbsdMeY0e4=;
        b=GHtm0SbWcMzFTMwY1z16CyoVzz02/n1cfOdL3b9xwwMjqEovLhFXVlLuDzPzMDvkRG
         8JwR4Z/fhLwAJ7AXCWGo4E4KogJE4+mscBQJ7MOSkhPSC29cVAx+iFJd7o4SVSRbheOv
         F7JgXkN4KnYZKxhZKKsL7hwfNzu5cyv6jdrYnD5u1vlWf2bPBru54gnDdy03fWINnqwd
         DExLcnbtSn/08IffHcSyipDyCdikHK8xonTBU5WkKGwF1EdI06OegqesIKjjAJC43zDE
         SXwdgRcSfXcNid7ajob1UAeZdP6OHV+/uAosfjl2zHN3vXS+gR7rEB2aavKMjP85X65y
         ZMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732718218; x=1733323018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spaZDggYYtywRJ4kgtwhMtxKbrnoYAiIWhbsdMeY0e4=;
        b=lm0Zi76gg8/VSudJU/yys9H/gZTWL1kNSfDT8Igp8NLSbh6O1ZekrCeSOc7MUcD5Sd
         QUrzAxkvmDm9YvHb/t11Tdh+xLJztnQWqGpdMg1PJpq2+5F3PZhFMVtW5trWYE3bo2os
         LAziDQ/7hzQkAQZnc/tMXsaYRNIWOqtV/dUfeLYm+fe/oXSwY9hLsIMdPd8gqs3L+zdR
         izLCMkyCuRRqHq2oMv15z5OOH881s4TrkwhjGNQcxCUsreHXcA+oF8x7y9Gn2+OSnwdr
         KxTX+YXl0/QUx1/jyELUh7SsEmuRK7oBTAMwXiAlBiHXlQdluV2hET/qDMzINRQqznSc
         minA==
X-Forwarded-Encrypted: i=1; AJvYcCXUG4OCpC79StIKTvDcFxZ+iP/gpZp/9iC4RvTqjaZwpmbk/omzGFORJktpKKFCYFHpFdZ81EhsTEJvgTH3Vfx9@lists.infradead.org
X-Gm-Message-State: AOJu0YxsM0bsNp8FS/N5P/nmAsQ8eMfZYePRfiALc7lS33gT9ZknTsoY
	Q0t96lCtO39gpmLZytEnBU1pFGZsFAMppetB2qfjK5fqKbAd46JIjquHd7EvKCd+hBDu17T/a2R
	84CiTGMqQk/VW1v3E7F2vpY46P0A=
X-Gm-Gg: ASbGncvU/aY5hTSKJ3jtv/dM3K7lwjTeUuLJzL6vEHxNqHeDIsZO1drXzFC/UwCHzrz
	wVx8E9vOJQjMB+QMZG4TixvLKZwN50wmdBuTl9bj+zH3XyJJ98wtkqtjzp/sfRw==
X-Google-Smtp-Source: AGHT+IE2Y1pwt9tFpc2i5mwaMDyiDpAZKOHFBSgRH1+njHEYwg26v01EbLgq7h2hGHIiXKKBL6YXf0n/tChU6h7R74Y=
X-Received: by 2002:a2e:be0d:0:b0:2ff:d2fd:fc94 with SMTP id
 38308e7fff4ca-2ffd6142a7cmr18766941fa.32.1732718217502; Wed, 27 Nov 2024
 06:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net> <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net> <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
 <87ttbthwdu.fsf@prevas.dk> <5881df5a-9495-49b9-9956-0538055bba60@app.fastmail.com>
 <87ldx5htm3.fsf@prevas.dk> <45ba6632-43f0-4142-85f8-9dc3f9d1e698@app.fastmail.com>
In-Reply-To: <45ba6632-43f0-4142-85f8-9dc3f9d1e698@app.fastmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Nov 2024 11:36:46 -0300
Message-ID: <CAOMZO5BY56N9Sfm1_qprQm7jeM+5bLgR0CPeu3kXK9rgmJN87Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rasmus Villemoes <ravi@prevas.dk>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Esben Haabendal <esben@geanix.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_063659_785247_C8ED75EF 
X-CRM114-Status: GOOD (  11.67  )
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

On Wed, Nov 27, 2024 at 8:30=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:

> Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards.

The suggestion to make Layerscape independent of i.MX makes sense, but
I don't know if it can be safely applied in 6.13-rc.

This proposed change also has the risk of causing regressions.

What if we revert the patch in Subject for now and then someone (maybe
Esben) tries again for a proper fix targeting 6.14?

