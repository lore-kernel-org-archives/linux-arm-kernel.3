Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F7FCD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77H7TnQmMiN3GvqWNTTNkz57RsqvNScZ9ZhdVrNecWs=; b=mlhlw77gTdPNh/01f7lRneM41F
	xVbni9CvsrBSLngg432SR376lLUUbQVx9VApmvy5VkVrVMTOCIitW3+4zz9wGkrTdGWtcbNpM/G2E
	fzoqSZVERRCUXRv7S3HyliOVPoJuMWfBOMsy4gyhvsfMuUKK1zXMjA9t8QTojVUH5YzOfd5qQSXrh
	jmhz79XAdCECQ1f3+YHp/OgpQrcB9pKwHoxjJKSkwKKAko4QjdGk29U8cvr8EJ+wBzOkk6vcELcZm
	g0vBuJRKF4z+JRC+AtL25HVUcJjzSUnoBYMz0jlJiBeWnrtX12ssMpwAq66W2LpQaF5pY/8s2jYXN
	0DzaZx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJMw-00000001RlH-1DAP;
	Tue, 19 May 2026 12:16:18 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJMu-00000001Rkk-1N4V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:16:17 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6948d7ccfbbso1154953eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 05:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779192975; cv=none;
        d=google.com; s=arc-20240605;
        b=QPR7O+28ky8Ggryp+M1sNYgz11LJmvC0NBdSJYBzIrlAcTIq7YfnClY+3Ek3MlYQmw
         504SCoMhequldcwwh2gVn0E4pRU3eza7amnjoxY5ypdivHFSdihZPooBfgyIz4GjbpbJ
         mMOlkKlNyJWSJqW7+nSSh+zKaXszOLjeZKDSO6x9flavD9CROhq03Y0f10ZBQwLCCAoA
         TvF0+BFN+NMJph2/Am2+Aa+/97sh9ZTrxGnHphG8Wgns6TqaJDwRS5CQHTu+6XGFFrYJ
         +gxxG61rDsCGdSjZk2qrmph6lvqFCQcrzSdWqlh/dgQy8QqlOFHJH0hiQUFWsWVrB5hj
         PcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=77H7TnQmMiN3GvqWNTTNkz57RsqvNScZ9ZhdVrNecWs=;
        fh=AgTZUr5sQCusji7Tdnc2KgzTAF+WkpNE2DDNTOSPVcY=;
        b=hcMgCOb4fDtgzEf8zOFliL6y8GHgmHGLa4thRNvXbNSl+uMMxeqUht/WTSDT5ekyPc
         9vywklrQH0vTmlBXnEWEtrsvxIKVPD9nbpZ4oJk94Z3YImXbPEmi5xqYeN6vwQwBTviU
         yItH8aQGD0p5400n08p6QXRaGZr1Vc0j+y+146tBAuVgdv2f1KQWrU9KJItx0O4mEnLV
         dI23N/CzKDExHOpaN1lWN10TczUzxLoe/U5BlZmVZ5xaj4ZU4A/UnE89kcEoC1SMXbeH
         1OQToTE/bJFi8uhpP3vc9PlUtf/PjTy95ZVKhygqQke4sGPBRPgGJnj/9C9o0Cyal/+7
         BXng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779192975; x=1779797775; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77H7TnQmMiN3GvqWNTTNkz57RsqvNScZ9ZhdVrNecWs=;
        b=ED7d/KixahI/KndZESvU+30whKgCNUOnWsy8mfM7NFBRHT8Yw3zBxhmRZYw4fVdJ5K
         7M+yzWCfsDuoD2+fX9tZQ5hWVJlQKfrmQpKJWu372yXJNNOIz4txmFt5xGYydycUzaIy
         JpGzREFlzmWdTIwqFrNmFVD4Xky5zpBqrABkzWaJhHYPcx4pn1a7Ot9IoVtbQtt52sa2
         CDfNTt3Ywhog5u64+yAquQbtkDp65Bdf3DiFy7dTktfZtoWJ6dYN9ZhUgOGd42vVkjGW
         CyNuyhN5HB8fey+p+Bfw3BRoeczlrFJwodVi5SvT6adviNLdBQ3PTlOTYeJe0dhPXN1t
         qWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779192975; x=1779797775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77H7TnQmMiN3GvqWNTTNkz57RsqvNScZ9ZhdVrNecWs=;
        b=aV59p2AKuJd7rWEsEzJ5EAx/ps2xzfho1Yrw/9wb/2G/MMhSkMOy5lQ0VogXCtndDb
         UMxCBpC3w1tk+W7iQHsV77njmHJ+NuqQiAVmvmUFeI78ncguGiWTXeDv2JhkFBivCZRv
         1gMCbJz84sGR+UnXklGXThSREHymymsWFBnGvwL3uaFZ1WhCpnsIFVBadm8XcbMx6ltw
         OMD5U7BB5slH82QeTXA7Vm6cM3tfxdh1tZ2DxwmbFPE9G600OIucneQaGUMcouuVFEfI
         sZGfe0eBtE06NQ9ZDJjaK3g9UlEwkt0KSdPHrgT6OGBxnZqTWHRHb157fzke7q+deL94
         qQFg==
X-Forwarded-Encrypted: i=1; AFNElJ9QGlaI3F1Rq9ljJLfMvulMPA/ZOeWTshOCQeWHYeUctiTzj9/ZqKozOrd49JtBagb4khRkhGogTsxaJG0YYr1y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3QLYRebPqNDYIifwwgdd5uWQ41uj3m8tfrfmXZVffuXNkUrnF
	LhhWg0dDC2HvBZj0wzG3yzd3JFRgfSPWBJG3/uRpbW9Im3mdbAiXGcFaR3Umiihp+8EQMI5Fvkb
	PybhI7fPeQDpo11gN9Ww5oM/sK1woYgo=
X-Gm-Gg: Acq92OHtTBzmE9Hs3ybYyUVZcoTM06ZrgwVaO+auu1QPM8qLQRvW99sbwp7Zrb1xifT
	kXoze9+ar9ZnF4OZ6fQND2PUqxY9y1xRFjszkP7RJWTXhPMNwJkg/rpySMNEuFPwGeROidUGAuK
	Pi8hfI2MW1YOFU8ZBTxQPLBk0UVlSpVV/eaJXS2pBwnS9Ch5n2mBA5uBUDo1rz6jMZstP8YbVsq
	ZJ8y2X9619qmYCFUWVicGcJ+wdt9QQyslFiJrvRULvFKRufYX2hMyfYD1Cvs7nKf/ux632cUSq7
	wG2vFKBY
X-Received: by 2002:a05:6820:6ae5:b0:694:96ff:d4b with SMTP id
 006d021491bc7-69c9437169fmr10976123eaf.26.1779192974696; Tue, 19 May 2026
 05:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260407081700.2658011-1-pkleequanta@gmail.com>
 <20260407081700.2658011-3-pkleequanta@gmail.com> <e5d1cbdb34dddf17b4d474446fb9cebddc0894d9.camel@codeconstruct.com.au>
In-Reply-To: <e5d1cbdb34dddf17b4d474446fb9cebddc0894d9.camel@codeconstruct.com.au>
From: "P.K. Lee" <pkleequanta@gmail.com>
Date: Tue, 19 May 2026 20:16:04 +0800
X-Gm-Features: AVHnY4L7K4x70Eyzw-ceGNz7gtwZlHIdfr8MBYBkZzbIBsM_VdfexOP6IXVvRJE
Message-ID: <CAK8yEOCQEYh4smL9bu2T3gHmtaSoPrGX6VMwO2pVk=QdAQT86w@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	joel@jms.id.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_051616_372052_5BC648A8 
X-CRM114-Status: GOOD (  14.91  )
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

> > +     model = "Facebook ventura RMC";
>
> I suggest capitalising 'Ventura'.
>
> ...
>
> > +             i2c47 = &i2c2mux0ch7;
>
> Many of the buses aliased here don't have any devices described below
> them. Can you add some commentary about why it's necessary to enable
> and alias each of these?
>
> ...
>
> > +                     // Fan Board 1 FRU
>
> I'd rather we pick one commenting style (/* */). Can you please fix
> that throughout?
>
> ...
>
> > +
> > +                             //fan 0 IL
>
> Can you please add a space between the comment marker and the comment
> itself? This needs fixing throughout.
>
> ...
>
> > +&mdio0 {
> > +     status = "okay";
> > +     /* * Intentionally left empty.
>
> The comment is a bit busted here. Can you please fix it?
>
> Andrew
>

Thank you for your suggestions. I will address them in the next
revision of the DTS patch.

P.K.

