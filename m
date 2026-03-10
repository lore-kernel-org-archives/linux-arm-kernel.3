Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD9AFD2D7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 13:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvafpqEGtS/OiggsxcjnYSMqpd/KvJAmp7arL+ZUBVY=; b=XGBUFoh0jP+E//GpdPGQLeJLno
	Q5354I/rcAFCE2c1s5bBR/nNsN9Txli7fxMXe57Pw4RkdSANT/4DrmMBZBlCNTL/sssH0Cg4JxApA
	MjfujfH8DreWvfIVcYqTMt2swKy1K69Ar+ZIC/AFxniIy+pyncZO6AD4k+taUIudOH3RTr8L4cBhJ
	a8GnXrG+YrzA2kFuXvS1EfWv/XHxbePmvQ9Y9bLX2vXc3P/IxuHTD6HwODqK1M0ztHcCXzh1EbzgV
	nnu1PUpHMUvW7ymxHCDDicPWgv2pcZz43niy7Dl4pwyRMc5sVmes70JBl/MaCtNMTapaGJ8qgsobD
	3hSNwOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwvM-00000009ZDl-3opL;
	Tue, 10 Mar 2026 13:15:00 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwvJ-00000009ZCt-2RBj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 13:14:59 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a12f88d839so6668808e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 06:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773148495; cv=none;
        d=google.com; s=arc-20240605;
        b=Ixldw5Ii2hVZRC0qodVSpZz41gQPY50zzoHXjdXKQ7TqSz95s/+EionWf8fNDzAU8m
         qAO00+OmhNOtm3cpClfWepc3nAA2kGcv/KtyuwhY4h2no2Nk2DxW2FmaBHq0AUfOOnha
         ndOkY2Nt+Cca0158Z4RkxG90FODGCpH60mCCCfxePTtxGZgmF2Clt8FJLJbSbAWUCcOT
         z4GC+geCvXIpPAWJ76P5rP2nYIj+1WsdErzU+yzbpegTFg8KKLws07czE3h4n1xBAeyn
         NiRl5WzhOauf8pgFFDomgjwKNeu338OLk7fZKWKzl6XdpfAoXxaSx3y7Dk4R1ZrLq32Z
         bmMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OvafpqEGtS/OiggsxcjnYSMqpd/KvJAmp7arL+ZUBVY=;
        fh=CXikR66D8iFv+AfAfb4d24EDYOgdrq74Y3pDUFCvFbw=;
        b=YbpnCrzFrS7Nmo5pxsEtBRi/0ZzNeSafMHubZ/kWlrGIoeFrOgU4wHKLcOOlMeza6C
         EZuGQym/0458I7BaO69tGNEw1qLPNy1dGyVm9I6TnLYjwYqn/74AYPQcgFfry/uHuAgI
         eAO69cQfZQiFSNPjfdQWjRye1JnuW/DRKBp5tA3xseauNakgZpQFc2q4GvFxahIa0tFy
         gy7WHvmGBfn8J5w2YGaTuTH/Nr1OTWjab5fgNlr4p/iEG31fzkcS2rbuTK4CPI1Wza4s
         lwgnzishRGE23Q/lLSUSTPl9EPqFQ+vxD9luTudOCYEpcnl5vHKxA9AkuJep5/F8yKga
         s4EQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773148495; x=1773753295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvafpqEGtS/OiggsxcjnYSMqpd/KvJAmp7arL+ZUBVY=;
        b=ff0seY8lHqlETdvjEAo7O3iMyek4vWDugMiDIdefLLWWlgCtfGJWubk0dddlpLK62z
         5qBImpQnmkwA2b5JCV/bbeQ8c6dyyCaHeWi02SFVr5Nx1DBqcn73fh50RIomQeP+Y2po
         uwtVz+tdDMML7HCd8lOBSV9NvEiTwO/CN/oN/24SCiQZv82ySAwH5rUIaYajJzytAcx2
         nj/ro8U0xEr6HZwlp5U1U5TmYSy1BS+WbfKU/R3xTkHo927cUPD+6eBGtHVb5ak+G5V4
         DUK/TOxan/I77968ockxnwEHf3HrSz4EKkAqX/FnnOchjUKdpymGZFpRM5c0oHEqR0NU
         Y/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148495; x=1773753295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OvafpqEGtS/OiggsxcjnYSMqpd/KvJAmp7arL+ZUBVY=;
        b=aQPcjCi/V5BZGWIkR7Rw1ckFn2Ak3B4DQmIqwihEXxyWQQVLJAefzC3dH6/VjZrpJu
         lR9GtzJE8a1aiil3RjMKHB7SIcf5Atz15z6uBje+kaKoSaSN10CXaJFAqOPQ5JflsPYH
         OSqizdYSQjxWF7ZB/RvSQCceM/WbhcnTgaIvIplEqywhyrKDEHon37HXekdapWK2haWn
         im4TK0TGLv1E1Zb6QxnWSsDMSKTZNDwehCwBKBlJkMeu50OMRHuxDYKpBfZ1i5UlaEEF
         mzfAPG2uTGMQmSLm0la5MR6TvBmuC5wtZUIf8EceCdCVV7mU3XTI5pLfI+ty8W6W92q1
         lhcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm6/aqNAdzyRhwZJ+LKuMpDe5Tfx1xizA3eBYksMA1Wh+EHCYPF8GgvN3atwB4w8Z7mb08ZcKj82Nufsi/WwN6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+vdLxSCH/X1kd9sm5kPisHHhpK1I3tAlRe4elSqXkCRql7heV
	qG9RBgYSGbc/2h3OHoOAyytyUeeyIgMl75eWjQNgEzYl/pIScnZ86ueHT4koZaz+K+recCSJbsE
	0UWGCz5yn27aUiguhMsk2WfwA4jRl1qQ=
X-Gm-Gg: ATEYQzxmjLady7YlsH9bMuzh13htoCFiMswGh6NW0RziD6W64P59+6EfFmjhSFofehG
	ZCrcIEStbfbNWyUvi3zfAIta1tj263/bsw7CAyBbKcmMmHakH6rv5/RHTzPSYaXp6XMjsubq2Oo
	3CjHwfRlh7SZJvhpEJ3kIxvY/2WC5FXvWZYCBW+yuFW7+f/LCpPCf8AC8C3bUA3gQJ0Db9q95CT
	kyoWbT+GtcauRrXyY/GrNeBvDVY9gTg3srwQQT08X/32Ymf3Vf97gjH3m9ysTiwsfkmxreYulnb
	/UCPohEJdOck+8ynD6C2jB9ldEGbIMar/+mdweppuVbTPVB56c9JObyIfUUBYcYS4/chJ+s=
X-Received: by 2002:a05:6512:3ba8:b0:5a1:43cc:9f97 with SMTP id
 2adb3069b0e04-5a143cca133mr3775932e87.48.1773148495109; Tue, 10 Mar 2026
 06:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124950.1345117-1-andrei.botila@oss.nxp.com>
In-Reply-To: <20260310124950.1345117-1-andrei.botila@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Mar 2026 10:14:43 -0300
X-Gm-Features: AaiRm52E00LdH2rZwxuFYXGjz-kZKy_GcD7ZYQ2nDQ3vRAIkTC8eVlnQwrS5urM
Message-ID: <CAOMZO5BVtRHW1+qtMEH9akO7ULS3LppzGXMB2_M-JJVwjbv1oQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: s32g: force S32G RTC as rtc0
To: Andrei Botila <andrei.botila@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_061457_656981_8E080A7F 
X-CRM114-Status: GOOD (  11.03  )
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

On Tue, Mar 10, 2026 at 9:50=E2=80=AFAM Andrei Botila <andrei.botila@oss.nx=
p.com> wrote:
>
> S32G RTC is probed after the RTC on RDB (PCA85073A) so the S32G RTC
> ends up on /dev/rtc1. This causes the suspend/resume or hwclock to use
> the wrong RTC since it takes by default rtc0.
> Force the S32G RTC to be assigned rtc0.

We usually prefer to use the I2C RTC as rtc0 because it is battery-backed.

What's the exact problem with using the I2C RTC as rtc0?

Is the S32G RTC battery-backed?

