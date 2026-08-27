Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B643C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=; b=oEhtOVPsYxFiCPcSXF+o3yR/43
	Zo6vUlrzF4gByGgqeNbNgkiXdm34dBaR5qPliq2I3L7QMf3C4p1PVFgBF78vxmgTJFLQYblWmw1Ua
	0jCueQXBbReln2dDlmkwo6y1IvXgA+w+4MQpJTBxlltxV9HcqodRQ57zAI2oN9w6rjTszG9NIu0Az
	FzKw4UANJX9s2XEN0fNbRG2CCrturLz+TxKEQ8dEasVtghENwER8fX8T6iPJ4bzxTbLqfV8RkraCV
	aa4XEEakfLbWqEoiq1PRrMf27gODoH2qzTtwYg0ixOmW08JkXmwW48kJQj8cDYD7SXCjvyIJwJLc+
	mnNHn4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeXd-00000004ZGU-1W3m;
	Thu, 27 Aug 2026 18:09:33 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeXY-00000004ZFf-3Kni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 18:09:31 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-66d06b5f023so352675d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 11:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787854167; cv=none;
        d=google.com; s=arc-20260327;
        b=rdpDB5Q+O8S/ydyVNOzN+OdU8uoRs8GuT7eocL2J9Gp/0ZqSbsYBcFktcADD/MB72S
         BSoNQddWUYvm8+PL37S+9rbvZaMcP+80p4vEhZFjjq++RTW3tSB4uCyH37tdDeznOE9s
         lSAtDJVWBnrJ6MYnNNx9NaEcg0zbJjpLeW9XLBLkznqUSkpdNVd0VekD1MZCkdtPu4TU
         nWQsbpZepWX1ZgNbMXnoMJupySbXtq2DZOx/v5xYhy0y6rqlI6R8P+snEn7ZwjuN3eQn
         PXG9xxLA7y0AJyelwf3eSgJd8Qgf00HfAxftyZ0PFWJ+5qthizNm+yb6k85QLl/o5+CR
         +Y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
        fh=B6dn4kUAMAKu9pNj4qB4EvqnunxMZR5TDLMuWQzPoIc=;
        b=DPM4gdIMieLRQ9gpurBu1FCCX9VT0mY4PctbsXfmgJ/lfJqJGFDnan8ZH1vYhvGRV7
         d+iGKiqq/bQf2ydrhZq2GJ6RyyCiNh7sTK7MM63HkrWvMf4aBp2paM2BxIlkhC7ojF5R
         Bm2o2ra8nHIl5PQpHFtKG9XK6W6kmOR9dUy2zwijnmJeeJ3o4dAGzmX+z2J0QUKgBqUv
         zcZgFqRq+BqcozL04bNC0L28KUboV2ndJDiMYlvSnn0FhEXb9RLNYI9MwKL9QtAQwuzO
         eq78RxymZvK3jOXVvxRP6q28Aw7+7krdAY5aTuMIxSU04YIN9Pdx239pK55NiM7h91qe
         XFJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854167; x=1788458967; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
        b=OXJcowgske2MneXheCLOJXzmTj6zjBGuzH2wzp9f339LVYWEHXNbv5ltz193ndUTct
         /BK8lbVlyNry/+aQZE6zxlGXU2zGQV0BO2VBRKh+W6355WKEMxfqdimu7cJsfxQsKY44
         Qa6ON0dUzxMjEn8CnTe3eh2Y/q6CHW4uVFFmj1Frr3RgRbbNNUw0h6efZSh5Ls+7T2BM
         uU7RADvFCFrz6s3E2TSNS8FFg91XuMbWJq887Aew7/Q1uDLYHeEvjrFKBOLFzf/NuY35
         BA6pIipfl0foteJnwXdsuR4/m29iyO7xAq6+uSNgVWfgmFP39V2j3kE01eImgRv+EXVc
         vmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854167; x=1788458967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
        b=m5FFzlG3gyH8lotUSjTtt9zQY72EUpBjzrG4JSAjz26d0E68Xm4Ob+2m9meuwi6dRK
         EkPEFFOXVg9X4iNdLhx6uMgQXxEdO//kBSWz0sxgBVcvH8nrqCDdYxmOCtKrfB+X+g2h
         XZlpc41BlwRt1NFDqxfepPIsbJcGfOajIxpQ3Xor05ff7z6+UgFXqyU66GSa9xS7Jklg
         m5yUDY0PIOnijk+WxWDLseG7FFy2Dx+XbtLa1cbEVDx0i23hr1dG4/CvN32UH9tbRo3H
         TT14PFoA3AVeZWoqoUtl4l6N6n2AL8eVeH5lXQjMT84OQ5wUmveG3aIrJp8fb00ob6AR
         rfMg==
X-Forwarded-Encrypted: i=1; AHgh+RoPlfhobLuPYOR4q9arTb+RE7wGGBbo/wrLSRVOF6BeM9ej6m2bhu17n0d8L3dXsmboJXkZmhsZ7akEAp6ayUkX@lists.infradead.org
X-Gm-Message-State: AFuF++nh7dFM5ewTzO2DdD5dtEgVzVz/vxyVj5+FH3bBeXQKTmF61Zxn
	xL6ymkR1YWz9LuwfNYw9inExZrhPhkSq1WThW5mZUX2wqa9DYR2v3LJ5TGP+aTU0awrGO13fyXJ
	n4O+A1Zy9KdL9nm4rjDyvP2DSbmItu2I=
X-Gm-Gg: AR+sD125DlynvJEQpgh0uaG6+AKYErO3F+5X+K8KycIbjm8Kx3t+TIpgvk85XS/hxGM
	LL+CJ8wmQF6MV86uWoRn9X0PfKHh/afXClKw93mN24iQrW9WhDW35Q8Yi3570Du4iiOxt0+lMyq
	Mp5wItf3AsShKjd1bWezmQvMJnXLQHZ6rFAd5ePjb+J1QF9jD2tVOb6Bq0E4KaPvk17cJLqNcmD
	VvJslY7NoOdksZ7EKH9Yo5nYuvnVsf/JpcVXRartqr6VcxWEXLiGYIGgdZbmPjYT82y++zlFp96
	C6S2R+TMATGy3KlLsn1Lu/1TGyAM/NFNHwBDtgZTPfF32t4S5F51Jb0693yHgDIUJCVsX6+yasA
	gSXqbEF5ymvEw/JfzTIm5g++kIw==
X-Received: by 2002:a05:690e:2052:b0:66d:1877:121b with SMTP id
 956f58d0204a3-66e4c6d6f17mr41588d50.32.1787854167499; Thu, 27 Aug 2026
 11:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260827171937.28878-1-gvalkov@gmail.com> <20260827171937.28878-3-gvalkov@gmail.com>
 <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it> <CADOrJmae24XCgxFwtHssdoWc4rv1Q743hfgjG=kUrVPgf6urmw@mail.gmail.com>
 <A7FBAD8C-3AAD-4268-9BBC-3BDE071481E1@dolcini.it>
In-Reply-To: <A7FBAD8C-3AAD-4268-9BBC-3BDE071481E1@dolcini.it>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 21:09:13 +0300
X-Gm-Features: AcwNN1WeeO0QLErFPaTPUKzS5E98_pxOjOnXU5-Tw2FaecGW6bryCcX8wHHKvEI
Message-ID: <CADOrJmZ8u8Gj0dA=CqzUwxM32uN5ZOJ_GdaXJNi1ttYpp4FvrA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
To: Francesco Dolcini <francesco@dolcini.it>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_110930_224138_835905F8 
X-CRM114-Status: GOOD (  22.83  )
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

On Thu, 27 Aug 2026 at 21:05, Francesco Dolcini <francesco@dolcini.it> wrote:
>
>
>
> On 27 August 2026 20:02:27 CEST, George Valkov <gvalkov@gmail.com> wrote:
> >On Thu, 27 Aug 2026 at 20:40, Francesco Dolcini <francesco@dolcini.it> wrote:
> >>
> >>
> >>
> >> On 27 August 2026 19:19:37 CEST, Georgi Valkov <gvalkov@gmail.com> wrote:
> >> >WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> >> >from the mwifiex ROM, which conflicts with the platform regulatory
> >> >configuration on units sold outside the US market. For example:
> >> >- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> >> >- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> >> >- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >> >
> >> >When the system boots, it detects a conflict between the user selected
> >> >region and the radios, e.g. BG FR US, and applies extreme restrictions,
> >> >preventing phy0 from starting on any DFS channel. phy2 works.
> >> >
> >> >Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
> >> >WRT3200ACM device-tree, which signals mwifiex that its regulatory
> >> >hint from ROM conflicts with the platform and should be ignored, so the
> >> >platform regulatory domain can be used. This does not allow the user to
> >> >change the regulatory config of any radio. It only allows phy0 to start
> >> >and operate according to its certified configuration. All radios in
> >> >WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
> >> >they are certified.
> >> >
> >> >On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
> >> >partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU
> >> >
> >> >The Linux kernel sources do not have support for WRT32x. An equivalent
> >> >patch for these routers has to be sent to OpenWrt.
> >> >
> >> >[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> >> >[2] https://github.com/openwrt/openwrt/issues/9956
> >> >
> >> >Cc: stable@vger.kernel.org
> >>
> >> This whole series is not material for stable. Please drop thia tag from all the patches.
> >
> >Dropped CC: stable from all patches, and sent v9:
> >https://lore.kernel.org/linux-wireless/20260827175850.89395-1-gvalkov@gmail.com/T/#t
>
> Please, you are not supposed to send a new patch series revision every time you get a single comment and you did send the previous version just 2 hours ago.
>
> It does not work like that, you just create additional overhead.
>
> I assume this is all documented, please look into the Documentation directory.

ok, I will make sure to wait for a few days in the future. I apologise!

Georgi Valkov

