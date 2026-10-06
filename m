Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5F0CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=st0WdGm0HQhoVPJqkSZGig8FXS+yxZLP3K54PTCRXrQ=; b=N5sv8yvxxKLWRnYyM59JthUHaD
	jJsAw6myDzX4bUv6m8BOk6YSD5tURWKBn5lc0EeLGCKDHmEk2p4KIsVOmAV41B6FW5TBt7lzNxVKe
	rCE8Lo7idusrhF6wKfcAAeXQwxhMiEYXxPE2F3AthDcShM5ECG5FVvRRMyOGh2T+cJS62er1kXAVy
	mHG1RaXhZd427H8js5IAzzEs6/VhE4eHy/HRX3Z4969s3XQtRKL4TnLb+dO68rN6UCytNpeOj0vOG
	B371A/b9EfJyGgcJV0y5lSNnW/L0yflqFj2RXsTr9iTmPCvy2ujWuPVlaJ3eJXXJKFpLQ6R+IGMz7
	AAKlYdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE31D-00000000b5L-10wW;
	Tue, 06 Oct 2026 11:07:35 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE313-00000000axq-3E5d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 11:07:28 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-91957ec418cso12190716d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 04:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791284844; cv=none;
        d=google.com; s=arc-20260327;
        b=ZBodZyh6lN72KUvFd2U844bDzQOcxBikhpZ9D/0I+X9mxeyrgJH97HXlG2YE+lxOIb
         R7Up2bfISiYxGv0zwi1/4Agfn+dFx77AECQ2+jYB3i2xEhPYBbw/pO5uVEL2FoHI2wlR
         MzVizejIMiIGbC860CWXMK/M1MaoCG0NITf2memFrw1banSAJZxqrYc8IYjZzMy3TXYM
         V9oNOmF+tmp29BW06446xCY4iaWFRbsJbGlJCoZ+5p4gSCSJAhPOIG9Z8ABxap3KwISZ
         lv7AHxboMBCtWfsilu1zOPFJ5jDR1oACW1dFLL7HFOTD0rbthWKGWiXP87xvzAZeHU5N
         jxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=st0WdGm0HQhoVPJqkSZGig8FXS+yxZLP3K54PTCRXrQ=;
        fh=SfhuybowhyQhFmeRpnYBJwfDVR85zGhsmjNYTVH5/p0=;
        b=UF/Mc1pK9Koy+gIjNC1v9txszGdm265ShQn+jLALqrj1XvHmYD2XVf3+LrHZW70Nnk
         Ocz9uFmHeSIk5KpKF2oZy1X0YJyWxGkE0YCEc6+UG82gaUXqFVj6TlTqxTs/e7bgv68m
         oX5/MiyST/Oqa6wwVR9nIviI7GxV5krOKzNPMiZHQdlHY6BdAIGDQt1bCaaQeAkY9ICj
         pcQdWR6jpc3o/DJHN9V9d4S2+RbhcAGJSqfNCH3T9YKqmJU56lmZFMOFYBEOEEkW45J3
         VP5dF5IDl0/yL5ek1hU7L/0xZ7stwXQP9uhgry6RlQmzNfPuu638NQ78qAfA8/Vr1IzO
         eeTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284844; x=1791889644; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=st0WdGm0HQhoVPJqkSZGig8FXS+yxZLP3K54PTCRXrQ=;
        b=VuxZKT5UtEBb9Oj0WJNAYbwqJ3C9T/Lm7xnw8NO2duka9jQwNMVLSTjzFEF9Y1F/yG
         AzflmsjOX2dgO37+/tMaKQGuSIQqod9QuG0tNCdQUYtILttAeikBrxO7w8qol4ApexOF
         ks+BZ77HcW9S4+DAHufex7giUX/+cAGBmgSQInRln90CwhiRxwBowofVgsaP4gMw0FsJ
         +uB1Vq6pgEYepxqNiScbSzavKCJagnTVK4Ha2E4xnQ8lP0CQu+H3mvLwNq1WW741qGEN
         jBjV0++EKqoaqaxM0f37kFCIQcWipfGXKG+hIdniD4MnGIWtTqRkc2m9Ux6U+B378g0H
         gtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284844; x=1791889644;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=st0WdGm0HQhoVPJqkSZGig8FXS+yxZLP3K54PTCRXrQ=;
        b=pgOMFIN6tqsodS08umL9ZvZtyHHxTacZVPHnGc4Nvg+xISZrxa0OOgilbB8s7Z4Ka7
         N6aaUVICh5vJvJJHnxZcjROTz2J+eZaxR9mRzoCNPtxKVLNYhpLaXurdXM4VO3kt7spQ
         ARTuhtDx4AvIORd3nnPVkb7pbpaDN+leSQSoC/HmFpEY8CiLG8me+L1iNtWbMSrS08yl
         qc3ovqIDenSpmRLJ98hHKjSI1zoogccUX72oYGqOEtCaBW0du7aTuxfsBW0hg1fZ8CSN
         2m2os0p740nvveIqdM+vZN10T3vzI0GpG0DLyKu8c7LkJuvB67/UGZHO/GlyvdeKh9IW
         qWaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0m+Pe20059ITvML1OX90N6KjxpCLVaodZz7gln/ms4skjvHFeKTRr0S4KKtla9E0Ilu3CAndiQOC6QRZ5bSDK@lists.infradead.org
X-Gm-Message-State: AFuF++kIWUglH07MbSfa2RtBbiKkt8Y9GO9Ew8Vjv+0jFIoLHzwG8d3p
	/uVL3dj6K2vnQjC2GGpQl3M7JteVmOq7ym9isyyUSoV7CCgrJ3mjutVuc82UPyTQAnhjOwawKxk
	b84iUzrxD4+hqepVyuEvpt/FnMNn1bxI=
X-Gm-Gg: AYBFou3VDZ6GLwB7jYY2KyXa1Vcf6FeBEei22c1btBadYSt0rI6ABOC/LkHna2kWaEb
	X5h5FxpDGMF4nEJQoqrCZRtO5mx4qWJtVB7y9VKSJBYc2fFToYlys32T3gKUrUX3xM80As1l8UG
	J0zw8XunzYkTRUOF1iVK3GpqeF+MPjmowmaipKM6dIvlGgb+w047UHTLoFceSOrjthA/++gcPZX
	du9VrcGhD+tZoc+4LbqzDhCKcMmyzfbnE/sJow7ES1jJPTnLdqMXJj+oLJB5xvNFxqa4i1SaL+d
	QGxRvJ1Wb18LSiI4pxJ/LS/t7bIOt/DdnJcnTlisP6TjZnE2Y8GhGHaIQBnyzGIsOz9KEo8pBOg
	5ygBowlP+
X-Received: by 2002:a05:6214:310a:b0:919:5a24:d77c with SMTP id
 6a1803df08f44-9198b7bec34mr20040386d6.31.1791284844396; Tue, 06 Oct 2026
 04:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com> <asTVqsqOLb29LY08@parshuram>
In-Reply-To: <asTVqsqOLb29LY08@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 13:07:10 +0200
X-Gm-Features: AclHuK__1dmQcUVRwrNQOlxQllKfZWHAwvmEnEZJ6X7sEUc-dLa0jeCfKreo69E
Message-ID: <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_040725_840485_E66FB6C6 
X-CRM114-Status: GOOD (  26.35  )
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

Il giorno mar 6 ott 2026 alle ore 13:04 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 06-10-26, 12:47, Christian Marangi (Ansuel) wrote:
> > Il giorno mar 6 ott 2026 alle ore 12:45 Vinod Koul <vkoul@kernel.org>
> > ha scritto:
> > >
> > > On 06-10-26, 12:29, Christian Marangi wrote:
> > > > This is a major rework of the old v2 series.
> > > >
> > > > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > > > configuration for the Serdes port. Such port can be either configured
> > > > for USB usage or for PCIe lines or HSGMII and these are configured
> > > > in the SCU space.
> > > >
> > > > The previous implementation of a dedicated SSR driver was too
> > > > complex and fragile for the simple task of configuring a register
> > > > hence it was dropped and the handling is entirely in the PHY driver.
> > > >
> > > > Everything was reducted to the dt-bindings to describe the Serdes line.
> > > >
> > > > Also the property for the PHY are renamed to a more suitable name and
> > > > everything is now mandatory to simplify the implementation.
> > > > (the PHY are always present and active on the SoC)
> > >
> > > I get build failure:
> > >
> > > drivers/phy/airoha/phy-an7581-usb.c:7:10: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
> > >     7 | #include <dt-bindings/soc/airoha,scu-ssr.h>
> > >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> >
> > This header is present in linux-next
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/soc/airoha,scu-ssr.h
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/soc/airoha,scu-ssr.h?id=11952173d8a180ac05641775f80bd6946327478f
> >
> > Introduced by a clk series.
>
> Okay so we have a cross tree dependency. I would like my tree to be
> buildable and not depend on next.
>
> I can
> a) get a signed tag for this from clk tree with the required patch,
> merge and then apply this series
> b) postpone to rc1
>
> Either works for me
>

Maybe "a" is better for other phy driver? The pcie move patch is blocking
other airoha drivers currently.

What is the procedure? In theory just the dt patch is needed, nothing else.

Thanks a lot for helping in this.

