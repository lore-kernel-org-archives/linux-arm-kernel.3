Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B75C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=; b=Hff8ttKq1S8/H+VYJms+MCRBrA
	QfoS94uofoC+RDWMexX+EwKcbWFIcHE2PHxycdpbr23o3KOk7z76ON0ZSwKho8dPMCtDTGQOCg7gn
	O1ueBvs8fph7GLSAf0rWJaeCA1pfbwDkbpaRpmNR5WkBole0MaiQgWZk3CoQsrnfk83RJAlOsw9YZ
	jQbNvkdZSvXjy97DM9nAOicz85FgNHtCm3KQMeY7ToY3qRO4cKTBHI2MRbL5VfY806SAG+OndRZ6d
	476GgFTeIQq6XtSh2tXYY0fBXaNN8BaGGMfD68JCTATZlc65uquVXMumzH52mTNeDrhAK3PQ3EGW5
	dEXQXEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0Qp-0000000BOJI-3MI5;
	Thu, 20 Aug 2026 10:55:35 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0Qn-0000000BOI7-3e7i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 10:55:35 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c197eaaab00so382344666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 03:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787223332; cv=none;
        d=google.com; s=arc-20260327;
        b=R4XQ4B0z631Gjik/fuVMe7zRUCz+lsSfAat/SjGpz3+gUt6KcvJPsll01mo+tJi3XN
         Mg/197MWCqiyNGuj8wt1pgPrJrGK5rFZ2+8V+vniyrKrs9hHcyjDJJQka9x+/tmk6DSm
         Bw6UQellUmodFMgv3jLhhjvDh58EDxpFrVX+t4R0HzMKaf6OdB63dlq1Q2EPBrO2W7Q/
         Rx5YPSVhKqEacFMpQe/5iCgc8+uRpAWLihmHGMl3LCnxeW1jE4y2yR2OcwE/CBAf//gY
         4OH0SglBjA4QemIhUg5PQE8YJdAfbjI7RfgaxNIxESD7cTLv0sYJ5sICt0xTizxUqNbF
         ex1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=;
        fh=LkXbnsGznFYpTv6EygurZYyNQMhnrBViEKshBcy3dxs=;
        b=BdRXSme60LpdkLPeOW0Uu1v2xQ5goO6aPvhajsMF/+2XSo005rzMdxNLmsFIYMkrYT
         fIVosuIMylffIDiz9hyl71miRF40c8hM6drNE+VjTbfbF16NjNCSoUHA7XjWF0T9FLIV
         Xte5GmD8vzLOxhLI6ZegglE+LQCOoTbt4zkaNh+7eO3yorUcju81N4TILLPsr/MdVGA/
         Jh3bAcJt1/2Z09iSBH192Ojc9LvqeDNPIY7Ktfpnrbz011Ybo4TAFhJp509OkB9FTSEY
         8Tf0MC1KHlM62kH/fGLZxz+sBqXVUq5MyY6LY0iJ9/Rgy4sAMA6t5h8iPv3eqK87u9n6
         M1SQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223332; x=1787828132; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=;
        b=SROYfvxg3zfpubSposkfDZtalk2HP0yLoCPwR6d0eCVwOJdU7aAmD2Q/1uCt4kJRd+
         zcgks6rWtBmg853aOKtUI7lQVNdbzVJSakRanKdtJwtS/tXKluwP2sHYUbiE3IZ/BrQ2
         oDTjBceUUYA7GJW2JVn3oHpntoj06nnaafUE3x0M1vBe5pcFfSZuDxn1+9h2mbn04qzY
         DiW4nZpkzq8wnUvLoluhlGR1GDl9pvhsL4KF1njbmIBUdQNJ4fc/FUD2AdeoRj9+Hb+k
         0pAcZSETtRdKxCN1ni64cz2rxkn/XamFXoLWVdsXY7eNFGwNxgJNPvJ/VpT+0/omokFj
         d8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223332; x=1787828132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=;
        b=PYPcckYtoYaqCp2GNg08sy1uh8Xzb9P2SjVs+/QOdMPwsOFt1PwPHCm9GSYR75xyaI
         KkrrIjxll8KU8ZIHGiXJdVQCed9ZlE6T17kpsR+6qVI/Yjqf63xc6CSgZf2cbC2dDqvy
         WB7crKiw1Fv9HZdkb+4FYtaWWgAE+tA13EEfu2p5TUPNGAh/50LiPvtuvtY+66dlaX4P
         aU/xZtJ6y1/E3IZ3ZT8hKICJteRuwH/bUOBOc/HLSjCJZT1QP/TwF18bE+nDRVLIKkal
         IM8e9G69Yxiz8cfr6K0f9GFKGhXAYC7xVuiBnd6KRqsnKS1bE8BpFbj5/T1p0nRwD5J4
         wusA==
X-Forwarded-Encrypted: i=1; AHgh+RpdJA32/k6DEuMuh+BkncyWsptFbJBPksMvaaFU/nhYh/F6qjQFmlFIiKMBmzNCNSjaldUEpIXIcaARk6rJP0wT@lists.infradead.org
X-Gm-Message-State: AOJu0YzZHJlT7SToQlU5pTDKnh/RuB4yAooG+Rm3EdgJBEQJhIxrNo6b
	Fhb6lLg0unx43wfInnPEVVglQDkjhELpCuwennPUrwFWqcCyRiLpwiOHHt53w8ogRRQ9y/Ji4jf
	eo4TwueCnjeQh+jb2RfrAn1yKCvqhq8T4wPHJ508=
X-Gm-Gg: AR+sD10HvRu7DbQY5qEGmD/SS7syuvRSSbwakCdp+V3+/eNXuMBS0SCKNWB+Ock8Kyg
	215KLCWiKUNYY0AsvnhjGXo/x0onIyyoyuE43k6OzyD0XdSPkOnwmPmJ0aGPJ22m6fiIUBsUcoi
	7+D7J0/yxpoOue6p1WONg/q/fncDYs+r3AIkBkm0e7q6mxqnvbRYZ4ODPTFOfOvrwx1SCSydqaL
	ksLTWmOISLyrOOvyxdbDuvcZwgTXhrJDg5BgECQ5PNHMlQoBtfotmUen01sA9ezHuFnCM0xleuT
	iPeceTocJeKpdrYOWTIChiS7G6IcsDgbRLFD/IJGVbQ=
X-Received: by 2002:a17:907:1c99:b0:c1c:2173:d412 with SMTP id
 a640c23a62f3a-c23f93178a1mr798064166b.1.1787223331499; Thu, 20 Aug 2026
 03:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260819101853.44681-1-l.scorcia@gmail.com> <xqnpukvhtezpqhwjnxbqeddiaqlro4m5yjukpplv5mjfxodlfp@ijaf2trst7p4>
In-Reply-To: <xqnpukvhtezpqhwjnxbqeddiaqlro4m5yjukpplv5mjfxodlfp@ijaf2trst7p4>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 12:55:19 +0200
X-Gm-Features: AcwNN1UZv97CCo3bWTxILn7aTXSi7ZUKBM5jaDSq07HQRpTQTLXr653YW63gQJQ
Message-ID: <CAORyz2Kp-LzLdUp=qWfF2xC4kCuUufj0seBKPcKEaebrXnhhYQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Properly describe mt6589 and mt8167 toprgu resets
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_035533_970337_89903395 
X-CRM114-Status: GOOD (  24.57  )
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

Hi Akari,
thank you for the detailed report!

> This is somewhat outside the scope of this series, but adding TOPRGU
> reset support for MT6589 exposes a pre-existing problem with the
> mtk-wdt binding that I think should not go unnoticed.
>
> Until now, using `mediatek,mt6589-wdt` as a fallback compatible for
> other SoCs was mostly harmless, since the driver did not expose the
> TOPRGU reset controller.
> This series changes that by adding reset controller support for MT6589.

This is the exact reason that led me to touching the MT6589 code. I
have been working on improving upstream support for MT8167 and its
TOPRGU reset is required for audio support, but the current fallback
on MT6589 does not allow resets. If I changed MT8167 only, a reviewer
might have thought that the new MT8167 resets should have been applied
to MT6589 instead.
This series should cause no regressions as the addition of
#reset-cells itself only registers the reset controller for
mt6589-derived boards and it does not trigger any reset on its own.

I agree that fixing MT6589 should be an initial step and that upstream
would greatly benefit from the cleanup you described. From a
high-level standpoint it seems like all of MediaTek's WDTs include a
sw reset controller, it's just that the reset table is different for
each SoC. If I'm not mistaken, fixing it shouldn't have particular
repercussions on existing ABI since the existing fallback could be
deprecated and their compatibles relisted as independent devices, i.e.
basically what I'm doing with MT8167.

> ## MT8516
>
> According to the downstream kernel, its reset layout appears to be
> compatible with MT6589:
> [...]
> Note that a downstream kernel claiming compatibility does not necessarily
> mean that the SoCs are actually compatible. In my experience, MediaTek's
> downstream kernels contain substantial amounts of copied code between
> different SoCs, so I would not consider such compatibility claims
> sufficient evidence on their own.

Kudos for finding MT8516 sources, I have been looking for them for
ages! They actually reinforce what you say above.
MT8167 hardware is currently described upstream as MT8516 + display
blocks, but the MT8167 resets as described in the data sheet are quite
different from MT6589. That said, I've also noticed that sometimes
parts of MediaTek's data sheets are copied from other SoCs too, and
sometimes contain mistakes of their own... unless it's possible to
test on an actual device, some kind of guessing is probably
inevitable.

> I also noticed that the v3 link is missing from the cover letter:
> [3] https://lore.kernel.org/linux-arm-kernel/20260809160643.33991-1-l.scorcia@gmail.com/

Thank you for spotting this, I will list it in the next iteration!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

