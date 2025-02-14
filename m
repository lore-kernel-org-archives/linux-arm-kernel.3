Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFD9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEmjeJJTOC7QfeGz/l1e5CAhsK/j60DY8H03y2S0Hl8=; b=SnRsEDYeNvNnbY9JJ4sqcozHQ7
	TCRr/JRhkOSmXW5D3Ng445Yb9bRQkUfcnkZbWlQzg5BFMaCZOOeNoxRmdO5JZwoCg4OsT7YkZEsUi
	FKjoQ2AXkeh6bittJRA1u3tUsOu+GS6CQQG1Q4B5b1+1kX30MoovoGJ2+twcOWLAWeEi7rWa9sD+a
	xl7WtbgnrodImoDSNAEXKpOYlUZVfgjivKgTBQfurg1fAQXrhMkZWNWzX4ICTPnnRYbcWvPQgTWmd
	sss9Qme/Bg0WjZ9O1DHv8x0h5RdqYArzS0pOtg7CsMU+pbz1NlD6xDbQF4qy8Gj8sCOTypVrHdgKM
	gRBfOeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqkG-0000000E3bs-1bm6;
	Fri, 14 Feb 2025 08:08:20 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqgu-0000000E36t-0MnG;
	Fri, 14 Feb 2025 08:04:53 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5203bbb969cso509415e0c.3;
        Fri, 14 Feb 2025 00:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739520288; x=1740125088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEmjeJJTOC7QfeGz/l1e5CAhsK/j60DY8H03y2S0Hl8=;
        b=sLu1Mbmk2ZteJV6rDh9+5LchUelYBNqS7mmQscgw6C9yak8Nkqp5n6cTeWXLhVN6iX
         MtWm4LUUe5qJMn2IKX1szRGDm5XsPl9rW+mpIJ5gOYxJ8qAyiTxF0xcNXgwU3wgtcCtk
         YhVvc4crD9Ff16j74ePsuq1XLy2uPIMYdiKcabnE3gp8xV2FG8bB4FsUdC1/sKLY/hAY
         zpRTUGn7iLl+rS6jv1MSBzzfYYTE/DBbVgMsNHjrACMyKREpkjgF9a/kfQ+7aIwp3UwP
         cptGdmxookx5JSSI/TN0hPwQuwWWzc2d4VSfaBpn/aBDuuWJrQ8nIpwB58aSyPPpdjNS
         u8AA==
X-Forwarded-Encrypted: i=1; AJvYcCW2OwbxbFKYIjGXq8HFExLH0vPiO57p0KXyDBKB/+MKQpbX019AFo7UELsrkokpIQ+I5LykMKL7lY+OTiLdfxQ/@lists.infradead.org, AJvYcCWet5HOCrQOHE8XdLQ6X2VKnWA1rs5KSZD0peRo96d2K+t3vDctUxJskF6B5SqpY/RlFsEHF/Yf7DTpmRF7q84=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCpp45Vgy8ah5JFYviNJcfYS+VExjJSliNtORgMdDER/vUfmJs
	dgTctH/aOctNl520a3BLu8l9tIQJ3GePe5MV5Tr8+ZVepwPqRftiB4ZxgzDaU/A=
X-Gm-Gg: ASbGncvCCfeQa7JsVGts+aV7HE1xIhNGrhbi5ryWbcZ8fUVNtyVGcG89xyWtlEYCv4f
	D9o621jOjjYDtL19dyTdcu5ZjNo7IELp7GGRbYfIWzyvY8bbt/OO6QkJA6EfmPXiPVrhb8CczLS
	15R+YdsDIYOrwNJCYKU2zkmPFOL8kCG1Kd8IFMnkyd05gjxG88UV7wbIASkEzNt6PUJC7qWuwZO
	nl/dUaCf+1Kda36VvSQ9lr6WYuiHZqy5DmO12c8mYCaZ0pm010LZE/eMWWo7JL9ZoP0iDaOAOJb
	AHTswilptqzUGplBWBA4BU30wpFSKhs4a21vfuSkO02iyh6xjdVEdg==
X-Google-Smtp-Source: AGHT+IH8d9/j2SQhmmOEHrsYJUNgoUos8VpH/s1daewYwejIHi4uRjZXNJFupIXOC4BEQW56MWWDTg==
X-Received: by 2002:a05:6122:1683:b0:520:61ee:c805 with SMTP id 71dfb90a1353d-52067c2e4f3mr9223360e0c.3.1739520287908;
        Fri, 14 Feb 2025 00:04:47 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5209437e711sm55672e0c.37.2025.02.14.00.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 00:04:46 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4bbefec9362so507676137.1;
        Fri, 14 Feb 2025 00:04:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUN/cuGAmlN0szJEJ1g6d89yF5RfP7mcoirxow+RWH3RQ2uijv3aEfjLKoOXsUXvITvAi+TnoJn2+6rut+tV7A=@lists.infradead.org, AJvYcCVxZ0T4e0CJnsBcSgpBNSHBAJ7kxp0VUna16ozSq+uu1WOp9XYDK5weeSceWZOcug8rcKn7STcH49gzLpbQ9drG@lists.infradead.org
X-Received: by 2002:a05:6102:1611:b0:4bb:9b46:3f87 with SMTP id
 ada2fe7eead31-4bbf21b4b54mr9074741137.6.1739520286475; Fri, 14 Feb 2025
 00:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com> <65f5eiy6kh6nhdjgpylrdjpw35jbae4s454u7qeqamh5hny7ms@ip4btvgxlaq4>
In-Reply-To: <65f5eiy6kh6nhdjgpylrdjpw35jbae4s454u7qeqamh5hny7ms@ip4btvgxlaq4>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Feb 2025 09:04:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfj=kmaQ6OgUwyhNq+ZK2ZbpSfD2BS0B96VHoKAMonVQ@mail.gmail.com>
X-Gm-Features: AWEUYZlKBGDrp8GUpmIDR1fGcTzBqQ1-W6-xx6LlSCcVReodURXv16fRWTmPbuY
Message-ID: <CAMuHMdXfj=kmaQ6OgUwyhNq+ZK2ZbpSfD2BS0B96VHoKAMonVQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_000452_123700_4D4B7BC5 
X-CRM114-Status: GOOD (  20.49  )
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

Hi Andi,

On Thu, 13 Feb 2025 at 23:41, Andi Shyti <andi.shyti@kernel.org> wrote:
> > > @@ -952,6 +952,16 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
> > >         return (msg->addr << 1) | (msg->flags & I2C_M_RD);
> > >  }
> > >
> > > +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> >
> > Having never used 10-bit addressing myself, or even looked into it,
> > it took me a while to understand what this helper really does...
> > So this returns the high byte of the artificial 16-bit address that
> > must be used to address a target that uses 10-bit addressing?
> > Hence I think this should be renamed, to better match its purpose.
>
> It's coherent with i2c_8bit_addr_from_msg(), right?

Is it? Unlike i2c_8bit_addr_from_msg(), it does not return the full
address,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

