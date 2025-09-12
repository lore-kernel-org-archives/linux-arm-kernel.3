Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8A2CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FZzZpXKOXHzhJ2wnkOGqaqwmyZ8ymDmUm9n/R7xppU=; b=cPiVUbXswp22uCKWRmufOAXADD
	kgf51fGzHHr7W7xKGbBIruc/AfpeFWNKR7xzfNr6tHoCuI/ZyOWqyzEy+Htf2memgtapAoMgSDAHQ
	tpNL0lQPgEVFbNE6bY8yJoOaoTJYrWXuNq6c9/MCmKBcIfM9mZWiT77qL3PCl9MLshFQ9acLk9BgP
	zBt0zCj7kRZp0+9oJv2fSrwSwDVtcr2IFV0jtR00UKGZpwbWnQBN4lBORWpei78kkhda61H3hJYpQ
	s8k3JQpfxqOLnEYSUBlSJ95gITv04BKUuHXhSRuv3LkfloFi//MeSu0ByEQqr3U82xtjuDfU7Z2cz
	ho6xym/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyTP-00000007ijH-12QC;
	Fri, 12 Sep 2025 07:45:35 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyTN-00000007iiR-0smK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:45:34 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-336dc57f3f2so14259101fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757663131; x=1758267931; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FZzZpXKOXHzhJ2wnkOGqaqwmyZ8ymDmUm9n/R7xppU=;
        b=x9ydEBtnZyUFu8qxe5T9dFJ7IcyHFJBWcZpe1xNfdO2QxD2tQeRbX/9oxQl96iM9+c
         ScLTeiJmYuoVvNj5IncEFZCZV4bBiYWotVq8fpMAu4uebjTgWzNTdmNHrLX9VzRsE3eu
         kI/L01ft8IRJr+MujYvfwexE5S4TbP+Fc+gxIM+XFQML1tzEtH87qnt2DKS7q3CTJ09J
         Ko3Kwx/7i9PDbjxALpQqaTQfAUb63xvh74HW8B07+VX8C5Bi/vHFkgap4rLlQ8pJyhRE
         9qJb7IdHGi3tSviPjRDH3mm43d7yN0cYmnOQWetMLgeo5fAjEJ++Mkax8ZpwuAcbX5lW
         wpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757663131; x=1758267931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FZzZpXKOXHzhJ2wnkOGqaqwmyZ8ymDmUm9n/R7xppU=;
        b=gjdTavsB5gI5awlZkYcOXyuHIMZ4yIvALqjl4xI9d/cjOrHjxDumNw+VUCGWmW5/5N
         P3DnAXsAuYyYMKwyk0S9nU5kNrBsTAvf6MUWbNXJZ40BOTAZb9eQ6wBrHKhrUtIoRTHr
         iLZL02O2cilcaivBz6YHTtGdNO5gCeG2f8vT1sjdreo0IXjkKgZh21c07X7JYgtsE62o
         7VjJgDy5CnWd8/SzwpqkPYMGIJepU7JK7mlkuKqhz511c/VjWnT4ueAroOvEkcwggyrN
         hH/2+io6CiX3/Et0ESiwOME26r3BexDRenyed7Bq7LqtDJbeXL328ocOmUT2T7F8J/do
         +reQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0M8Ba+Bd1G30BatFWhl4P6QgVWuV7M4Qla3hSYaDN4mR3gJCZzScPcxyAWdzZwzmr9gPBzWacexzfBVzLsonp@lists.infradead.org
X-Gm-Message-State: AOJu0YxMIRjf4jkXshNHnHrW0wxGRAZ1NaEEDPshcfo8bjMUdBRGQEYM
	NjT6nITSes5aV94f4t4w+SSF30AAdEgiotZiXMYrcliqgAplKNsXyyr/KB1kG5+qYiv2IsBb+8g
	0FZl1azz0FsQ5SKPFfmu6suupThuRCT2FXiYsUOOsWQ==
X-Gm-Gg: ASbGnctKKLN0Djt43UmaNvmU7EdpDtHBiK7zEI8T8m14O3K97/GCPnYcc1vyulEB9ts
	LVYmXd+pURJgPPtoSBcCn+ctIc1HEwcmhBYcV9Wj354au9j5STA8pt7/h67OXs5Hn5RrsMZDZTM
	RJLA/JgAHkJVIO+6Vp21mbggQIMqe7BSS37fm4G2s4hrqx7de9HE63W4wX5MAdVgFLJhwYUibw7
	TUzIqE=
X-Google-Smtp-Source: AGHT+IHlmRAHKqSdot79mnaN0SJhfcVcwXH1gxvx+jUHEDO9IZALMIrMYqfVCaNGxNsDXGYCgXZm+lDZA6bq0RfiLP8=
X-Received: by 2002:a05:651c:2359:20b0:336:c290:b321 with SMTP id
 38308e7fff4ca-3513a8f1a35mr3890011fa.13.1757663130915; Fri, 12 Sep 2025
 00:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
In-Reply-To: <20250912060650.2180691-1-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 09:45:19 +0200
X-Gm-Features: Ac12FXzUbHER-mkVUjmDr0R7CXpg398gO_vKvZUgNOQ1exRFoKJFGV6d7epl9gM
Message-ID: <CACRpkdbsJ75Th5=K65_teYXv34ECB9yx7hWeHG4QBao3wbCDvA@mail.gmail.com>
Subject: Re: [v2 0/3] Add pinctrl support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_004533_257748_D2F5ECE8 
X-CRM114-Status: GOOD (  13.86  )
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

Hi Gary,

On Fri, Sep 12, 2025 at 8:06=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> Patch 1: add Cix pinctrl driver to support pinmux and pinconfigs
> Patch 2: add Cix pinctrl nodes and header file
> Patch 3: add yaml doc
>
> Changes for v2:
> - restructure the pinctrl driver to support pinmux=3D<..>
> - redefine pinmux macros
> - move header file from dt-bindings to dts
> - fix the code-style issues

If you want help for managing the different revisions of a patch series,
you can use the "b4" tool, here is a tutorial:

https://people.kernel.org/monsieuricon/sending-a-kernel-patch-with-b4-part-=
1

[Konstantin: the doc link on the bottom of the article is wrong
and needs to be augmented to point to latest!]

It's a bit tricky to switch to v3 since you already started without it,
but it can be done with

b4 prep --force-revision 3
(see full docs https://b4.docs.kernel.org/en/latest/ )


Yours,
Linus Walleij

