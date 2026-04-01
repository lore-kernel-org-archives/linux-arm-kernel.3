Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC9510F6FBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 16:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0avH1+SOLHp/H4tdAtDn9dqoZRCCz/pmxrxGL/52XWY=; b=blesFW4Lk7aMWHP5mJ7aK1TWjQ
	pis2AZyDvQgsKvkuI5cSqlVu8NLdzghjMyVVmi3vldKiQiM6EBN6lxoQK6tiYy9IxBb3v91OpLYeU
	Yej3Vb7/OAlluGFbzrXx7pUg/YqV1qApa3no7uxQrzXRiPxkI/N8UKQZLX13d+mFogUluiQCIez9a
	/cqFVGFZYCKaMnlFsgqeCdTn0czRAVjGuOQ37SD1+8i7y6Jr8tf5EjQHaYOldnSVsaD6kfrj2zcTr
	adnYCP3xllLuBEeBc6yT/v+ffNSpnUgreOUL8FboXApJTDTleQclQF0TIRpseEW1K+DIs48Wj1ZvS
	4eZb6Veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yFa-0000000FiB6-1tLt;
	Wed, 01 Apr 2026 16:17:02 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yFY-0000000FiAV-0hAr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 16:17:01 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-64937edbc9eso8992676d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 09:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775060218; cv=none;
        d=google.com; s=arc-20240605;
        b=YPPfrhV233RiACZh5heNU8BCYmf0QbYU6tIoqnIxLCEotH9lWtgnuAoWYyVZMnNNci
         HvTBH1mBKyfCGuPnLvKpvIq5BICL71A8diI/56j/EaQg7Egsfzerc8UVx+u4H9WfFz3A
         U9ldex0H5uN5vcmD5Vxg6o5InpWCN0I7vx0LtHZEiBrrj91nMtlzrrFSEQuXvBJeoAt+
         l4HhIGUnEXKCyb1QEvzje7ObyvEoMxqBa4o/M3yq6d5+j8lVTlyousbw0uz9kBTI2igW
         iqVMeCIaSqV6kn12MTS8iTR9Um6/+k1jv9wBKniGR7cKjC1/i4ycjA6TF0xVEzamVpOe
         oQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0avH1+SOLHp/H4tdAtDn9dqoZRCCz/pmxrxGL/52XWY=;
        fh=8hBW5Yf4TIfxbj6jb1TE4nFjVyXvTSb3/3qpc44yrvU=;
        b=Xgxx8ySX3njMIwGr6urp4nUyAnh8eNCtVICGSguFB/QeKlaVxOijif0taHairS0lYV
         wFZu4ZU1rHlBHS/RE3IWk8XItGsdexa7aXiFraReNv7LIaHBIOVTA7ANuvQko3v3qZQ+
         C/FVxHaabLFy/DNLBU8oaiQ+Q7rBSFdS3isGtyD8hwVN6y2q4TPFZcv+pd5lXlIj1+AM
         vkBecBS/neG61qZrzEDFuHP0+3CwMWIySMB93uS/sTT10OQ9JwDor9w+tc059oYPViyE
         z3uVJwYexiAWvwGZQzNwpkkk9fnPL2Iev8bvFPwnSPRzycaviQBGsX5jh1TsizgV402o
         aoeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775060218; x=1775665018; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0avH1+SOLHp/H4tdAtDn9dqoZRCCz/pmxrxGL/52XWY=;
        b=EfXzAeJmUogjofZitL4+03F7CHzgxK1lcuttwXRhFN+VHcOV0iQ4asNKEdfU2l6Re5
         YLJ1gVA3H2BOHVNsaxwRIDpv/MO2K0bi/1SaBNDd51/xR2nTT8J267/aPlww7Q8c8ReS
         vDkv0RgBlBLds0FPoP441l0zFFWJwoS90ZJJBZlsgjKpYxkn+57BeBvbVU9VCtdpAM4k
         lPsiYwj/6tUXiYJ1DAwtlV4iEYdDvpymloDDqqAhCoxiN3CkCGrHWx94iimGh2S4xL/N
         1OdkLij8hpScevk18o82XK2mj+tWbPh1BbsStsa0fZFfvIasgJ4c/lbN750PKXZdJckg
         8Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060218; x=1775665018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0avH1+SOLHp/H4tdAtDn9dqoZRCCz/pmxrxGL/52XWY=;
        b=Y5NHKfSOPsXdfcbzFW6XysYAPY3fqkZd7k2XdKTRjvL83jCx7/GFZTP9OSYqVdFMMb
         V0pUonCkht51WfAnMEelLaVKtMv1SluzM0tQ4Q2vB9JkyCz1Z9x59j2fGKjIm4mWq3ZY
         zAQXS+ZiAfvJeTQ4HzIB1Je4dUq/m8qn0HgJDnX1yO/tZ61oB66gJYGR0dWsbc/b8Su5
         FUqcm7sHkX+Q2Vjf5f0wkoD+qgaA1xi1aXEjliK2dfbQ7YbHSY/3FOdSjVPZ50ISO6g+
         YXOcWk9qggjFBrrXr4w6kVhMgdU5u/3K6wXtT7jqMxyFdstsqUPMHmXJ2dyuKJKjgx/k
         1PUA==
X-Forwarded-Encrypted: i=1; AJvYcCU2RCspEYx0J6geHPhK2nPsCteS48mRoqAntfoPs3qAIcwoMSGhYLkngI5lnPCN8qPSZOi5eqn5ZgzZtIsTf+1P@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2eccdkld9vilzU8n8wy1DmzTOQNcCXMZ0XUoNTqd/YKxZRWxY
	pV+zn9HxDwlnN2G+HpeBVnuNMBU9r+ylatwn9QIH/d3MuzQyTuecXsibvalbKhuv8hLd8cTcsMW
	I6u6p5uDEjJmioYQFg7FbRKnhwNJ8Xf2DICUOmk+VuQ==
X-Gm-Gg: ATEYQzy+1+hOXNn/W8yZONcEykomm5+Kwlaf7enJ7hTNDHN9eX8PfFryWiFd4SrZSut
	Kslm6aW7ZGiJudXqKOlxEGOeNydOrOEk3e896jAEWZx757Af2MEBXT4LEbSlIHPXXpEAX7rntvf
	nf9KoWnSbSc+CYc6lGtC8rGTYQ3F5PfPWKDQUtjREyqEgxp2HS4L+pgfcKm2X3HxlcyzSnpndRH
	5aopBpbvfBX7hH6TDckpcUvsHSaf5bLURd2qcUjCAaDxmStyWGWsc+QaSh8P+DCAsHCUYSJY1m3
	ignY5BPFGXK74U5z4kVtF4wexdFqORm7IFtJ55Ocbg==
X-Received: by 2002:a53:c608:0:b0:650:1247:fe35 with SMTP id
 956f58d0204a3-6502fe7c6famr3104408d50.58.1775060218141; Wed, 01 Apr 2026
 09:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-6-c5a760a3e259@linaro.org> <f73173b4-f44a-4d01-abec-3366b6561332@kernel.org>
In-Reply-To: <f73173b4-f44a-4d01-abec-3366b6561332@kernel.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 1 Apr 2026 11:16:40 -0500
X-Gm-Features: AQROBzDBnBQJcHuyu8ZHm384f9vOKocl3AGoLecw69PFxAPUA79-AuH9D6PxvHg
Message-ID: <CAPLW+4=H_UkjwY2RJFPD9ekJh05MyuhKrymeuUYC4dX1WzF0wg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] MAINTAINERS: add exynos850-pmu.c to Exynos850 entry
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_091700_240713_B6C21A54 
X-CRM114-Status: GOOD (  18.16  )
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

Hi Krzysztof,

On Wed, Apr 1, 2026 at 9:28=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 01/04/2026 06:51, Alexey Klimov wrote:
> > Update Exynos850 entry to include new file
> > drivers/soc/samsung/exynos850-pmu.c. Add myself as M
> > there.
> >
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  MAINTAINERS | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e14e6f874e05..4b28e92b4d9b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23601,6 +23601,7 @@ F:    include/dt-bindings/clock/samsung,exynos2=
200-cmu.h
> >
> >  SAMSUNG EXYNOS850 SoC SUPPORT
> >  M:   Sam Protsenko <semen.protsenko@linaro.org>
> > +M:   Alexey Klimov <alexey.klimov@linaro.org>
>
> I am surprised to see this because I did not find many reviews from your
> side before.
>

It was me who advised Alexey to add himself on the list, as he's doing
a lot of Exynos850 related work nowadays, and we expect him to
continue doing that. If you think it's too early, let's get back to
this once there are more patches submitted under his name.

Thanks!

> Please first engage in reviewing of this platform, before assigning
> yourself as a maintainer.
>
> Best regards,
> Krzysztof

