Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84032C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9FrfG9Gw4/z5mtWnR84x/YK0xjKM0uXdEh4ByObXig=; b=rzw5tD/Fot+kyz4XvxQtwg8zTs
	axlYHKwimrua6uzgFcl0iV3nFR/w4j2xukwef+wqyOYBg6+FwUUyCg1OnWULmQeluwGg5PLW+zGLq
	Bry3xCPCg5K7ezwCbrXBwp01Uerrz3JiT/A099v7wvPOdBGo31mUgBLbliyIlW8GCXSOvgXBfgDGQ
	Ocxmn7+iRHYJazuA5z7tXC3P5UqFtg4YPJgnbDw2MwP/+6ik6AHEuNDsMo/AmFo48JH2XJGxfMHFc
	Q2IrGIDvxWNLexgp/jOt0Cu/qdVN0OD6J2/ALy0KS94YcjgQCHh2888M84c3FB9NsuoQEz+CJZWjo
	2Dv7GJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWiX-0000000B3ln-3YHR;
	Tue, 14 Jul 2026 06:34:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWiV-0000000B3l9-0eQe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:34:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso1631406f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784010844; cv=none;
        d=google.com; s=arc-20260327;
        b=nRCLg4BCZK9D99QS4ItiirPp/hwv4piJ7ggLBgoUCtDR66uQta5OMOeu3oH/xnd5VN
         QuVuD5T+VVCdlu6iIwE5j7RJiCcttYl6HKCRXcSthsT83DleC0bgDU9thE1ax1yyWhE0
         CSDLnlq/vreVWOt4tcJpcmpLFEz/A3pfPrPVS59sRv/favRN+9kMCfjAUePR+c71C7Gk
         P4/pOhtmubd5hn8TJzo18JoWuhp1zGhN5qmqgINm2zfSPOZd8jJ98qR8nxLf6IawnJaP
         FIk8PX+e5kB7h5bXwsMq7ubu1umGE7iXQThzT2DZHAtkrK45z6DOgOabN1S0I1zwsSDL
         l7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W9FrfG9Gw4/z5mtWnR84x/YK0xjKM0uXdEh4ByObXig=;
        fh=WFTLDGdovJdsaJiYjx9xBXXLcecDwh+hM+gv0WXkawM=;
        b=IPgwpUx0m8LREo0kPAtrQ2DnS6hqenDBkQ2z9Vf3ZITDtF0Q/Bb0U1pzwJ+N7lgB0X
         OWSy8dRdLQB8IO/fjCmwq7mw26FGxOHr7EYhzNejt3yvZXOOOfhyJ9oyfo7Evs/eVPqo
         xUUNC4toLeqdM/9sfldv920Qd+dt4CjI9kW6nrGe56Q3Nu89H4q6/q7tMV0tDZNRHu14
         /jaE6z52R+PCtV3CsS44mWgnkZRWKgVZnrFl9YhxDgxsW8W+Qyn3oE24ILeF1lL78XJ7
         Gs1eW9Pm/oyBaFf0hJ+HfGetL1ZaCwqUH6viZhcL28rx91QBpsqmflr+nueEF7b6JYKC
         Aw+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784010844; x=1784615644; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9FrfG9Gw4/z5mtWnR84x/YK0xjKM0uXdEh4ByObXig=;
        b=Igutxyswb7wE3RFJDcV8gZir4+zxutP0o0YabMYZWnt8Z6lzzCnv6mSPb+UBaIYTMK
         9LvJU+DIYpgL5uiw0xMr3zEl+2BCYxBK7bVbnKYX2yQbYT4Ic0ie+WdBXICKsUcCEoeu
         p2ZMrwxoqSXQTV3LFCUtH8gM+2tE6vwAchWmBK2SEdbUOkbK1ZaPzMrkGnz5T7jTaaXg
         XzQisP9lqLVlL247aGHsafOGYyo3dVyeqROG4Y6OoWjXtteNk4CwZQLe1RqRnQT8EjFQ
         ceVxBgvabtdNxPl6qjNMb66fk50bZiyRa2lf8ENfdK6gj7JqjNMhJhQ34FfEy0BDmFKU
         /TUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010844; x=1784615644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9FrfG9Gw4/z5mtWnR84x/YK0xjKM0uXdEh4ByObXig=;
        b=NPYFrwyN6DE4YFIyqRQyjg9eys184wpUVIl52OLr1Euqdu3Kou8w6VLo1oItCN2x62
         aKiApNqs7+ZZYgxdg9u5z/epooI4cd/yuOaB93Nz/OwkzgCH8Jonno2l0AJL3n5TTKu5
         NSoNlwG+4sBWRwju5Z+oul/HTnJBg8FqTJh3GKKSvNsNDt/Rh9/yNUXY+7tsbemvLPM6
         Yeceln1ABZHARyOFIsQcUcreNJ3cy2hKpseYEeCDzVZMCK7Qf7Qjwb33sEXL0hAQlSRX
         DIiJz6HJrE4TiQK0M08FdY+OPKnPHp909jP07lB1u181Dogr3gpOH6FdoNSiZLCombP/
         lfmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEV1FKSwux777uMKKMMIL9FNuPDIyTODzpYkWM3WHF/PLjN4IKbzoUYIwu+46sm9TO4YXID7+CDLsJYvpKs8Py@lists.infradead.org
X-Gm-Message-State: AOJu0YwmHKbgNTK7kqmONtKgt9sxe9zoRPuhCMzIlSnzoI9L+APsYnXR
	u1d5AikP1nK/qhNKs+2l9zXpYwz5H7YmDijICVo/2v2MlP5iLuNU3jbKl3QNUvN0Lhv07OOGRgd
	U7D6UqeENYZGXQC91Ck7NhjN0mWuEkqVknf/XLXtp2g==
X-Gm-Gg: AfdE7clzDrae4RIkhDNgFKC8X9FCg+hQb/PArc1/LRDf6gSzOYzGTpEEauKnq99WCzG
	RMkgCjfcrh5DQ9eb28NVcfSI8jAo7QIP1+v7KVIZ5op+kLMVoaRp91AvurVdYYBsOKZiUZaNxQK
	/9FYqYALxXpk+fY2Q+TL8W5Pbsfmrq4A1GHY7+gw1wZjWIDVVfoAB5Q1H6+0QdKOsb0NR7/zzsI
	nR83uxn2GAPQR+UnKBQ5Y/QK1ZCcsRxCLpwgjuC8a09W1y32oV7hzGF2jZz7TrY0xysejFrUQYU
	zTxb0JT3I0Xo9rbkEdMp9+jjkq5EY4cz+J6M/IIDtxGOL3I7X9fmYiC7XQ==
X-Received: by 2002:a05:6000:40ca:b0:43b:498f:dceb with SMTP id
 ffacd0b85a97d-47f488488a5mr1165528f8f.9.1784010844468; Mon, 13 Jul 2026
 23:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
 <1af9eb75-fcab-4541-8ba7-ec620546f031@kernel.org>
In-Reply-To: <1af9eb75-fcab-4541-8ba7-ec620546f031@kernel.org>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 08:33:53 +0200
X-Gm-Features: AUfX_mwqF2s0XWJlIYVM5Zbx0O-qqVqJE0SWnGYK8fsSsk4VE3pkV1cTIOFg11A
Message-ID: <CAFi2wKZRVbmCwprkxGZoxib8BrFd9kDS3H2cDmykEorB5S7Xrw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] serial: 8250_aspeed_vuart: add VUART over PCI
To: Jiri Slaby <jirislaby@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_233407_309137_05A0BCDB 
X-CRM114-Status: GOOD (  13.93  )
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

Hi Jiri,

On Thu, 9 Jul 2026 at 07:17, Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 08. 07. 26, 17:35, Gr=C3=A9goire Layet wrote:
> ...
> > --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > @@ -32,6 +32,26 @@
> >   #define ASPEED_VUART_DEFAULT_SIRQ   4
> >   #define ASPEED_VUART_DEFAULT_SIRQ_POLARITY  IRQ_TYPE_LEVEL_LOW
> >
> > +#define ASPEED_SCU_SILICON_REVISION_ID                       0x04
> > +#define AST2600A3_REVISION_ID                                0x0503030=
3
> > +
> > +#define ASPEED_SCUC24                        0xC24
> > +#define  ASPEED_SCUC24_MSI_ROUTING_MASK                      GENMASK(1=
1, 10)
> > +#define  ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1          (0x2 << 1=
0)
>
> So is this
> FIELD_PREP(ASPEED_SCUC24_MSI_ROUTING_MASK, 2)
> ?

Yes, replaced

>
> > +#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN          BIT(18)
> > +#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN                    B=
IT(17)
>
> Perhaps switch the two (to be in asc order)? And define 14 as _RESERVED
> as well?

Acknowledged. I have also removed the comment afterwards.

> > +#define ASPEED_SCU_PCIE_CONF_CTRL    0xC20
>
> Hmm, should these go before 0xC24?

Yes

Thanks for the feedback, I have made the changes for the next revision.

Regards,
Gr=C3=A9goire

