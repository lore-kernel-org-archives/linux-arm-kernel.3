Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7856FFED3E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 18:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fKE6uWynXvOQK+WQLf5kO4iqhFOCsKdnL+aW04mVOs=; b=Cp+S+F28d67Egaixv9amR3gcqj
	l/oXQ5Dn93hfHB3gftl3xumDU1W6xb1PfZhbxGEdWLStrxUlc/awe48bZcj3LZABav17c6YTZrzjb
	H/u4hU3taWaGd2QmvHGCtT9r6qhuVnkp6rdd4ZvnY5L+aetMA1CPRDlQ+hBY6Ju6OZiLvhbIPUO1v
	EBstu8wbA4ZYSb26S5obhvccdaVVleLh5UeTiQcgP5ilOrjcSwc5ngOzS+zbMq+7v3dpVr3u3G00J
	taMSuecSWVHDQf6/ULNSYIhcXCrWHspwlVLR8zJPXZeTvA/JYNrnkZwLEkaHHjBZlHHh2bUjwk7zM
	gutYY+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLFR-0000000De5t-1p6A;
	Fri, 24 Apr 2026 18:27:29 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLFO-0000000De57-2SVQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 18:27:27 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-12dbd0f8063so1373316c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 11:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777055246; cv=none;
        d=google.com; s=arc-20240605;
        b=OB7Nhrvpttv1kZDuaVjH2Y2Mq0lieafoEt1h32AdeG+s88kaOqGCnpEF6sTT5lu1Wu
         RYx3rbVAl3XIGNm+/ac2Gw3kwd9pPIeqcRt6xld8YENuZEcal2xQHMh6rVso5PNtlCHf
         Ksc8gRM4p8NiZxb5RXRSH0vccFAdVfsauw/m9TbVIXzbIf4VWun+gUjftG1FBlz95yMX
         EClbvEfI3JTBA2WVYIE7chpnSlko0JjL5JY3KsbAuWDg/tM5uI5mCwhmEbu1xMdQ3aoS
         SeILYt/hgX1VsdOCZAi0ec8B/lyKaF8J/T5+YvUNyvv4gYaBq1ZAcV/15ztCmg2jS2C8
         GX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8fKE6uWynXvOQK+WQLf5kO4iqhFOCsKdnL+aW04mVOs=;
        fh=BjudYkJOYGDw/xTAmuZ9f4j/hvZM7oLnC9bmWnDDt2c=;
        b=Fz92V48xTNrdc2/wmG6sbxPmM2AgLEcdfTf7EFBw25Fv9HA5Asx6K1rcXRMMHd6Jg6
         fS1g24kSF8IrHXG41oyc90SM/iezNUgM5DBLiqdEoPp4Mayp6/CYJA8zRMnvsBB9+a9h
         3+Cn0WmE1kwOy2IlYc/j7Witye+pBXTLy09n1e7zw1xx1DrA6BnQxsH2Vgbje8zktvPl
         zV47BA0s95GoKLSpTEqVohhrKRzMlJQp0UICxAIlMKusTv4PZvZwqdplrt1C6v2BARdz
         4rOkgx97eBA5QPidugDEChTMOxFkIlv/g6E775e7jDOYVzAYSXSOs5Sz8zJvkKEaLMcM
         wo1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777055246; x=1777660046; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fKE6uWynXvOQK+WQLf5kO4iqhFOCsKdnL+aW04mVOs=;
        b=rSz1jEYtQ823uxP9tIo9bQL2HxvBNNTtf0Wn2ICEKNmQza7QJdlI7SC5875Q50YOcB
         QI7zqvsWKS4sF+PkeJFaeyRGBaji2q/Ihg3GUJaQyLyOalVaixC3jJBlyJydn/en1awj
         dvFUpNnD8N7WYSTfaUUaFmrJ0VmF6svfTRFLxZdMJvDev1kdKMPumjxeiK+tS32/hsn4
         0kGRrOLXuyLE20Nh0xCtj+wd0gBgOis8B87FNQGkbl9M52G9+Yb8pgVQeX3QlbGaI6Vd
         90G1mtdUtFpo2C9ljcu/EGvxj0Mxzh+bClN1T3oAtzp6asnsEDAGymVlCteiX4WfLaeL
         1rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777055246; x=1777660046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8fKE6uWynXvOQK+WQLf5kO4iqhFOCsKdnL+aW04mVOs=;
        b=Mw1TPI5drN9O+ApIVniYRO4dvwiXCd+nZULD6h2snBMxOzn7IAWIMzOWDjIu8KM8sk
         TONWUfVwOxuS8i5s+6EVoe6HcAa5Px8veuGN+Ic/C1pyjLR5ZoeDQ60TuU3OE1xIjG/8
         c+jhoEF5LY+wfPf7yrvOTYTyTDqDqZgNQOD1J0e/la6Sn+JUrWDWNMVUk06cXMqRhznP
         GYqNn2p8Woa8MPeO+vmPTGCIsMEIuN6J4lpw1xAa5xKpurY33hoTCLYb+9opFEsAQFrh
         8aPtFfq4tnmRAiWYsjKbizDlA77MD6uFH5JJ6ZXp8lJFOcdeYGWO0THg6iLlX34gasFu
         8aCg==
X-Forwarded-Encrypted: i=1; AFNElJ9MO8XbyQQzLkOmifuZmB94p+64BCJUA9MSk10IKkDVMjM1+wfohsXCHLa7wAwli4ktA4rFk5EfFkwhan9OkMpU@lists.infradead.org
X-Gm-Message-State: AOJu0YxvnpU7TcYK7qaT7u29kvtC0M4zYUb/A1iMX/m9++L4UaMgcLlv
	LcnZ4zu2FxdZyu/MV0eMC/5V5Tjso6VBLHNi1PorcIOpfKn2uWjYLsBJa1ZuukfHGc7PGIezpIq
	4/9YKQs2bj1vKXOmQvgQ4sWMoWcS1mtA=
X-Gm-Gg: AeBDiesclxRulidUQwLdWowXNqM6I7dMMRDF7HXt2JAMXj5xHctdMvBogBi4ubzvJ2S
	M6g7HT4lh17zfMOtDOh0FhjyiF72ZeHmXfOS1/a1l7JRgPCCEw2SrpnNXOK53gafg/KapZ1FU7Z
	Br3s1S+JNg/iSVUO6VjjkoqdeXFeQ6Qx7RQxhz+fRd1NRdJvPdKdB2zawCBMj7OYs+zml53TpNV
	j1DR2P9TavubRPJyOM7ECN24dccU6p0bcu1Q9FGUpQ0TYgXKQQ3ySFAlyshNaakOQJ75KyUVfb4
	HbbGMFtdJz7cNUaM3m0uFyCeA9sE/geRf4YjvZDKyzHhBDSAw1z7YNnhUCnF0AVHL15lVX/HO9n
	XB92Zv6S6S91MgOE6n6YrqS9yS4+FTtmvUua7ew==
X-Received: by 2002:a05:7022:383:b0:12a:6fb7:87e3 with SMTP id
 a92af1059eb24-12c73fac0cbmr19164773c88.31.1777055245496; Fri, 24 Apr 2026
 11:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-15-f628543dfd14@ideasonboard.com>
 <CAOCHtYjJgqomKreDxLUiVbUtpeh36f0bL-jA6P-6rsoJrweshQ@mail.gmail.com> <cb19eafe-6c25-4a2a-bd31-9fb280837623@ideasonboard.com>
In-Reply-To: <cb19eafe-6c25-4a2a-bd31-9fb280837623@ideasonboard.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 24 Apr 2026 13:26:57 -0500
X-Gm-Features: AQROBzDdYR96fKz8FXyueV-T0huFl-SkTA_xyoSbvkzAGH098Vzr3EpRVRVzohg
Message-ID: <CAOCHtYgQ=71GtnUFkwhoVTkWma9rrbjp3xyKYUGVv1dG63m0Dw@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: dts: ti: beagley-ai: Enable HDMI display and audio
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrei Aldea <andrei@ti.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Davis <afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_112726_629338_576B2C2E 
X-CRM114-Status: GOOD (  15.32  )
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

On Fri, Apr 24, 2026 at 12:04=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 24/04/2026 19:16, Robert Nelson wrote:
> > On Mon, Apr 20, 2026 at 8:04=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> From: Andrew Davis <afd@ti.com>
> >>
> >> Enable HDMI support for BeagleY-AI platform. The display controller us=
ed is
> >> TIDSS and the HDMI bridge used is IT66122.
> >>
> >> Based on DT by: Robert Nelson <robertcnelson@gmail.com>
> >> Signed-off-by: Andrew Davis <afd@ti.com>
> >> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> >> [tomi.valkeinen: cosmetic fixes]
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >
> > Tested-by: Robert Nelson <robertcnelson@gmail.com>
> >
> > Thank you for getting the display back end working on j722s family!
> What displays did you test? I don't have OLDI panel...

I was buggin @Andrei Aldea to get you one. I also don't have the
'special' Lincoln tech display or the TI cloned panel that works on
OLDI..  Right now just HDMI as i decided to tackle cc33xx wifi again
today on mainline..


Regards,

--
Robert Nelson
https://rcn-ee.com/

