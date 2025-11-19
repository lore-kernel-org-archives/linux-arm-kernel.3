Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49FBCF2590
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IO0DNZhiENG8w/XHNdOtB6qefAmL2Exx733Q4ukPAMg=; b=BUpHRwrpX3ZCstSdwP3nKZwSvn
	wk5s6NJ31Py6poUzDJakKI53QnZycaPCJQQx8xxB7Q7mbdN/uhju3afwKUL2MHtmOPyOExHHH+mWo
	JqdpIhcGRafCVnu+oJrB/MpGd7p83M01Pgbq0aq6tU8VqeafhDiGMWHITEIhv5/cuJSGkCxxugKDF
	U1xGV0GS1RzTCdp5sDuO5OX1vhR9bZeXNsk8cckNseJPlronCERv1b+iAQTpTL61haEt+PtiMwzZu
	LsC3871nYuMra5txhIyeNM26sqgQuOYspPf0pmkhatQKuWeu5YwAmEsxfmLDpNfo/e68+LyGSlN1H
	L2SL9hUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcgI-00000002iEh-42cj;
	Wed, 19 Nov 2025 07:32:46 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcgG-00000002iCr-2YTb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 07:32:45 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-37a5ab1e81fso53878431fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 23:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763537562; x=1764142362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO0DNZhiENG8w/XHNdOtB6qefAmL2Exx733Q4ukPAMg=;
        b=BI6a1TR6NsHfGJ1+PSCG16MoIrnHkobZa62Dk1BNsvQilwfIjbZERVkNnlSg1aAPC4
         3JjRrl7S8bxYgXKZsgYJ8LKy47NBLdu42aB9Ea+cL4Xqx7tCdoIDFKsaH3deM7Z2O8qr
         ZO4OMtlMOUoBjqRNlmepXSagiHMBFJT6SkuC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537562; x=1764142362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IO0DNZhiENG8w/XHNdOtB6qefAmL2Exx733Q4ukPAMg=;
        b=ISTLXgkMJRrT9KGa26gwwVjPE+FT2OQXHO9gkWlaaeP8X3xLxnK1jbJt24c23YPr4m
         qO8yFkaXdkUMULJBD9j4BrGEfaPnrcpyStbJa7W3LMIRFRU3oJfl/m9t5xdvP2ioTNpi
         7+bfuTHjDB/jniZBd4x1Lm6kBs/8gYSXS3r2iCDcaELBUrlJCSQmCL9wtf81GlJOvpI9
         znAC2KhzSaxYoTr9uJjc3eePYTZ84frkUA3sc5PSUa3zmtinrXJEmR6Nv7trKXWpECam
         Xirm34N5dQkiTeVbMKall97oSzEFxTY1bn41hxFzLuAVGUs3SZDCPeDqFdDlCoI+9BwS
         iWfA==
X-Forwarded-Encrypted: i=1; AJvYcCXrBvxmtK0DTOEk/f/kR7q0V0Dkj3ggzHqGGZn/16AUSt4b0v/oA6OdTtG6DkZvtLwfkUX4FrXLfAVT4n2MVbD0@lists.infradead.org
X-Gm-Message-State: AOJu0YwZH0ODIXy2Sx147xbLxvbhJTGPrAwna4BuKmLi/iBxjScWT225
	Kr0ToJkD8ikzJKssBOdbZYc7tViF1SssIZHr+nHK3XBgk9DOWTaZ0JcjQxMUgBpgoC+v0Acl+iQ
	NyvsMW5i0mDi9eeKaO4U+jzWYFiWWhN4rUfEDBpl9d1IFu/ui6P4=
X-Gm-Gg: ASbGncvjz/I30aUvmXAfaRY1QE/ZGpj/Qi5ROdAzLa90ixO2Hu/v6ZGRSpZ7GuYSGns
	WNNP+1NQvOI5mtk+fCPZZpgEAAcTLAkYm0cV8Taw102Nnxt+ZwdYQIzYqAJSp5NUHo00eO54G8d
	X0VENrLotJZu8rCt7c6p65xBjs7n6L9bzXRyLpPzCUGuyZXARLmO2FWRgs32MoeuXk35ybCJUqE
	bDd9Dy+CJVXsavvx3WpZizy83iFOdI9LFdrVkj2PN767Om/71nIK5nhG1xnIF8YzlEi10SFVJSx
	JCt+EaouVUu+nKSPoNgJGJq6DQ==
X-Google-Smtp-Source: AGHT+IHJrAu1K7jWQMAE6p11RyXzPNk9G1nAtzaQ+Z3fQ98mNJH85oUoeMLP1XXO3FI/y3LlEG4mixCcvEMB8DZHxuc=
X-Received: by 2002:a2e:a1c7:0:b0:37a:432f:8ecc with SMTP id
 38308e7fff4ca-37babd71d49mr48399931fa.33.1763537562422; Tue, 18 Nov 2025
 23:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20251119071126.1719405-1-wenst@chromium.org> <18342493-54f9-4e5c-be05-568a3026663e@kernel.org>
In-Reply-To: <18342493-54f9-4e5c-be05-568a3026663e@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Nov 2025 15:32:31 +0800
X-Gm-Features: AWmQ_bkw083HXAHlfoTHPiQeY1k_8hzN3vGBWotGu575ZiGZHcE5k6oSmz34_IY
Message-ID: <CAGXv+5EnfwRA1SMvt=3n7gj1gS3BndXKNVfmfkC=y6n2A3VsdA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Document optional device
 specific properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_233244_679636_47F096C9 
X-CRM114-Status: GOOD (  13.73  )
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

On Wed, Nov 19, 2025 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/11/2025 08:11, Chen-Yu Tsai wrote:
> > Coreboot, or the ChromeOS second stage bootloader, depthcharge, will
> > insert device specific properties into the coreboot firmware node when
> > there are valid values.
> >
> > Document these properties in the binding.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/firmware/coreboot.txt | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
>
> TXT files cannot receive new properties. You need to first convert to DT
> schema.

OK. Let me look into this.

