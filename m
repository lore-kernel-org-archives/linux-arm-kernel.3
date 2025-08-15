Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CB5CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGJhJQc6FwYGEhY0RLSGVMOBhQEywfsf5GcAeMtkOBc=; b=EpZYfsvV88RGM/2nkc1zVkduLF
	ySiWADhS5tQfdQwl6PIjq/2BxOqdso8iEJ6C8VcXGsYvtOIJB7ZwxeKT4/FSnLyENIMUbaHc2hJgd
	+Yuu4jDntFTT10MR8w8/H3LMhEGupKLlBSeYiYMU6JHA2FomhRzRdlQUqjzpry9z/3xXd9C5cS9G9
	4daGfiuuOfPCUU3nj2WYmN1WZZL4O+bxdatukp25gQzcJ2pQyk45y4QKOBq9zaBKmNUYqhjTr9OuB
	lnP94N9/Odb3awU5YAApUna0+6EC/B01bwHALTI1zAJtDOfS+5mAEibEfm4aNzajHdRGb0irQOxT4
	deFqHYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtf4-00000002Tbl-1Idg;
	Fri, 15 Aug 2025 12:35:58 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRJ-00000001zyp-45wZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:35 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-333f8db5aedso12365201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755248972; x=1755853772; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGJhJQc6FwYGEhY0RLSGVMOBhQEywfsf5GcAeMtkOBc=;
        b=E1P99ixijFvf6Bz2maPuSahru9l/P2ONsX/eTsxbhTxXqaEwoVJDm8/KqyaJb4neyo
         ED/d+o059roRzA3AvMTPQpJnZRNq8JsdcU/H9uKEKDS3EvvU/5CFK/4e3tp79hFNLyFc
         sniTBnXpuWBPffE3jg6+7aA761QDKQYchvDAnEiji0wl6tSsZZR9J2pOn2HEnpoV/NaY
         iufDOW58qgDZ7nKi8bMdAEISChRgmfS9+EQ8acTQAw6b3hs5fkFU0wK8bUBIN2ItmQZ4
         pvRjEUj3F3rCj3cNpFRWeGkcmUGfEYm7nep6OerNRXjGQp9DOwMmx6spGjtHWrB97c8d
         NjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248972; x=1755853772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGJhJQc6FwYGEhY0RLSGVMOBhQEywfsf5GcAeMtkOBc=;
        b=SsaEn8lYGOAXPX7LrzbquCduGC216yz3xP73ZYXLrS26qP87R2AJZorj1f5olptCdE
         TgdDb/72XoQSKFxeCYxTh6niIvEDTQ8T32JMERrCEqR3cWP0B0Z/RFZSDHXIU7Z9Ojcn
         C5KlAqa7ZvtptoCjQt5nMsId3bYRRmoo95G1RevxwHax2fBN9Deka/wasZnlctTxaya7
         YKIz/d7mV4GOc0IQD0Do3f3QrkTWJHw/owHvm/luyEQc/Bjg2hQmulDqvcS0gQY/JVsh
         5Dp3M1OQIOIqtWdR5+yt0mqC0P+gN9DsPz/Jf48wWc0FfAl70uGEMMqBNVhgD1L++RMh
         fQEg==
X-Forwarded-Encrypted: i=1; AJvYcCXTkZnUNXSowcETChgH++Jzde8ROuJx9EHOa96QRxxt/pQKA9YwpPAuF70S5mO+2CwK/L7jzTmnn/BbNS3OXGv3@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg3d61EFm1oE6YQZ4f/mSdtPWGEFOFUsQOAc+G2I8FmOyf/RjQ
	x8fG51LCC9hzgbBpzPgKQjxLA0wvlYV1iasvrox3VpqxNlWttPC45D27t4K4Sd0l3UEslU3Kffc
	v3lW+JxJqfwUdJHhD4S27WXxL/cguXo403Mzb5y5cZA==
X-Gm-Gg: ASbGnctxMQY/9oT09J4rtWVFqk724Lj6PZLXzOhHDVBdfFRN3oPRBESiWs6eQlvIWwj
	HMFAPawq/27Q3MFSSLRAR8JsyqIqI94DTkYrOZDAQO4OeT8o0fDNDqlhol53GJxVmnVlvQHaPKE
	dzTAkuS5T/CvxnlEOVw7GETez/NQ7jT38+YQ1xCyJGI4c82k075pz84U4R5JBG17PdUR9OXtgkx
	BUTRgLIPDog
X-Google-Smtp-Source: AGHT+IH+k14bfZQAC1KVgtSKkgagSBtIxwMlEW1GNm9qBzYXcs+SImACCXvKbAOcHL0E6nXXVuPokyIcUWjwXHTd+18=
X-Received: by 2002:a2e:bc05:0:b0:332:197e:f746 with SMTP id
 38308e7fff4ca-334097dc5ecmr3598311fa.6.1755248971706; Fri, 15 Aug 2025
 02:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
 <20250814-ixp4xx-mi424wr-dts-v1-3-b7c10f3c4193@linaro.org> <f8529fab-d455-470e-b05b-9b5069091dc2@broadcom.com>
In-Reply-To: <f8529fab-d455-470e-b05b-9b5069091dc2@broadcom.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 15 Aug 2025 11:09:20 +0200
X-Gm-Features: Ac12FXy0B2p02EnH59JnC8rlf6TrQUcwEMck9pCiYQKxMABEtNQZh6UTI0EhI1w
Message-ID: <CACRpkdbmEz7_0_XTJh_Zf2=Fi4Bx3AWY5Vm8-uAAd8pPi-ARDQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add ixp4xx Actiontec MI424WR device trees
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020934_032463_3DAC6980 
X-CRM114-Status: GOOD (  18.06  )
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

On Thu, Aug 14, 2025 at 11:13=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 8/14/25 09:40, Linus Walleij wrote:
> > The Actiontex MI424WR is a pretty widespread home router, made
> > in many different revisions.
> >
> > Revisions A, C and D are based on IXP42x. We add a device tree
> > for the A/C variant and one for the D variant as these differ in
> > the location of the WAN PHY on the MDIO bus, and the ethernet
> > interfaces for the WAN PHY and the DSA switch are switched around.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
>
> [snip]
>
> > +                     gpio1: gpio@1,0 {
> > +                             /* MMIO GPIO at CS1 */
> > +                             compatible =3D "brcm,bcm6345-gpio";
>
> Is that really the compatible string we want to use here?

Yes as a matter of fact ... I got slapped for not just using compatible str=
ings
that are ... compatible and piling up new ones :/

Maybe I should try adding a new one, I suppose just "basic-mmio"
would not be an acceptable cover-all compatible string?

I guess you're right, I should poke the DT binding people as to what
to do about this.

Yours,
Linus Walleij

