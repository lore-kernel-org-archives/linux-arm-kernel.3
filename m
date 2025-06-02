Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE19BC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 20:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU63ySDIkl618RCkVJvCdpB1ntaX6bwZnYArDPbZsgY=; b=LuGGwOvNn9FGIbO9XgBjlH4aYq
	GZcLit0Wbf4BaXchCdQxBScHtfGOWAVY9a9mJ+DIpL1g6Jd5BkagC3TE9tiBYKy3QYcwAsc3g43G3
	1XdA2wklWCFoPYDp4fgcLhZdZNQj8uD3+YwoC61NaBKf8vmvSgBfuZjsOI5Bmp4dh1HOemZvtwjQ5
	wQaif+L6WNaepls0k//iCEoBdwB5+CZ6XG58DDuJTnlI46kf9El6k77Smqw8KhVMc4UM/Rg3Q5IxN
	sCi7xkPbIumP2yaviaEeX16ynDkvDwkiwaVLvibwGBg9CloCs+nLpe/RzIYN3W12hb/+/BoY72AcI
	BKe+NcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBY8-00000008hnT-0Efq;
	Mon, 02 Jun 2025 20:14:24 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBMW-00000008f13-0pRo;
	Mon, 02 Jun 2025 20:02:25 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso3680740b3a.2;
        Mon, 02 Jun 2025 13:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748894542; x=1749499342; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jU63ySDIkl618RCkVJvCdpB1ntaX6bwZnYArDPbZsgY=;
        b=V7Mh4kCyFHFaJci2CYB4xQ+T24WbMD/Vz2lO7xvnIG99vvRIDKRpKdIZEeIeWojG4r
         EqbKyysE/XTsOXCK1j7P07QnMCPTo13yaVS9h7QoXZYleqqrCJFoZqq0EyCXQ04WG2h8
         utlswl+5tmZiNtsP5ckOt0tyRrFVdH04GAVRl3/cT3vNZli5NAPjY/Wmrgan7dcGHYhO
         eLPbitTyxhNZz5puJ6X6IREPjxEVPTwYWjh/Mc5VOS5IRHdj5bYMTHBSR7cuSswXUCSm
         +EJcAideRWwesMF9+amgnJmW3L12NpZ5qpFedyNyUr3HFKMWIuPowSirwNvB3GcbOEj5
         OLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748894542; x=1749499342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU63ySDIkl618RCkVJvCdpB1ntaX6bwZnYArDPbZsgY=;
        b=jWAGWLF5p7ANjCUGTy5KhZcHlwsOa2JjJOjvr5IbeCX4J1ll9k2zbYsC6PLTVZQIMY
         e+xbCY0ybX4+Q8wDSrzqXQf7SwL18n+Mqk1mEdl/XHaZW9eqqke5r5zrzpsYKyiIcJoI
         aT5iL8vbir38g3BGF5qtfbhZHEMNPXtbMkgVls/rrGCpUhwtnY2y3gn7S2i46x5MU7de
         uAzR6Xn+R2EV2kdS19mKu7ReUsncm12xyyOAlKDTII0Xnv85pbGXhl53JT1DQBPMA6YQ
         pgx+X9DMHOKTubELj2a+q/58jjdI8Pv95CRUc1HmpBiJGDYvxuNwCOJ1kyuycHCVqAid
         LcLg==
X-Forwarded-Encrypted: i=1; AJvYcCU15/XJ3IZXui7PLAU0OrVU3Bo3EfQci0Admbi8j+X9G/f5beEAge5hWV0pAoPlPybsAeyaNYHYaTf8CrkncoOC@lists.infradead.org, AJvYcCVDWavyRUML9LXacRg2ABeNvczev/jr9mqTVXNMkNwb+6I9qZePoy0je/Wd8PqCZbqntqUTtwpltu3FAtimy9A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrP87uD9gTkCc1i+30CoAdv21WyW+bRHRqVtLgmmlxNWLOS8hH
	nBHYLZJQhv4d9MMlTVdxqEaHSh6gUSGfDT1GnAICzsg3ayM12yUPRpBm
X-Gm-Gg: ASbGncsyapTTr0hoZfJbirZH7GDjrMrXHQ8aWeDkOmY9iN6ORZmi6kZuZlGCzHzulAd
	qjvrhGD/hxCrFuM+93gN/hG7GF/tvulvNAdI0yUPT3WjIQ9AD8AAf67kG/Mq+JvAtTBOPCGiHND
	Oma1A1Hv7g5l5wDEsi8sYHCbWCnvA3q38beyOBBe5465PY0pILIH8rMJRZiYr4yu3jkTk0rf1TS
	k5lZ/G2ez2kILoyQ4t365QIcJPI2UxqfvpwzD08xPLb2iuHoQ5sKqSJ4jQRkJUVBYxlyqk3dPvP
	84T2gGHFjYqY94St5eRMPyNa+eCs1xosntKyEfgk0c+2tlavf0HSlE8IjKjHOw==
X-Google-Smtp-Source: AGHT+IHiKEZikH+lsGl+d9vzWR5H5Ojhm2iixpRZnhUz2v7NVH3lkWkzU4DjA/Dyx6fG350q0SLnpA==
X-Received: by 2002:a05:6300:189:b0:1f5:7710:fd18 with SMTP id adf61e73a8af0-21adff7da26mr17104549637.17.1748894542390;
        Mon, 02 Jun 2025 13:02:22 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafaebsm8042682b3a.87.2025.06.02.13.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 13:02:21 -0700 (PDT)
Date: Mon, 2 Jun 2025 16:02:19 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
	kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH v2 3/7] bitfield: introduce HI16_WE bitfield prep macros
Message-ID: <aD4DSz3vs41yMQSv@yury>
References: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com>
 <20250602-rk3576-pwm-v2-3-a6434b0ce60c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-rk3576-pwm-v2-3-a6434b0ce60c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_130224_242947_77E14F80 
X-CRM114-Status: GOOD (  37.41  )
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

On Mon, Jun 02, 2025 at 06:19:14PM +0200, Nicolas Frattaroli wrote:
> Hardware of various vendors, but very notably Rockchip, often uses
> 32-bit registers where the upper 16-bit half of the register is a
> write-enable mask for the lower half.

Can you list them all explicitly please? I grepped myself for the
'HIGHWORD_UPDATE' and 'FIELD_PREP_HIGWORD', and found just 4 or 5 in
addition to the rockchip.
 
> This type of hardware setup allows for more granular concurrent register
> write access.
> 
> Over the years, many drivers have hand-rolled their own version of this
> macro, usually without any checks, often called something like
> HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
> semantics between them.
> 
> Clearly there is a demand for such a macro, and thus the demand should
> be satisfied in a common header file.

I agree. Nice catch.

> Add two macros: FIELD_PREP_HI16_WE, and FIELD_PREP_HI16_WE_CONST. The
> latter is a version that can be used in initializers, like
> FIELD_PREP_CONST.

I'm not sure that the name you've chosen reflects the intention. If
you just give me the name without any background, I'd bet it updates
the HI16 part of presumably 32-bit field. The 'WE' part here is most
likely excessive because at this level of abstraction you can't
guarantee that 'write-enable mask' is the only purpose for the macro.

> The macro names are chosen to explicitly reference the
> assumed half-register width, and its function, while not clashing with
> any potential other macros that drivers may already have implemented
> themselves.
>
> Future drivers should use these macros instead of handrolling their own,
> and old drivers can be ported to the new macros as time and opportunity
> allows.

This is a wrong way to go. Once you introduce a macro that replaces
functionality of few other arch or driver macros, you should consolidate
them all in the same series. Otherwise, it will be just another flavor
of the same, but now living in a core header. 

Can you please prepare a series that introduces the new macro and
wires all arch duplications to it?
 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  include/linux/bitfield.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 6d9a53db54b66c0833973c880444bd289d9667b1..2b3e7cb90ccb5d48f510104f61443b06748bb7eb 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -8,6 +8,7 @@
>  #define _LINUX_BITFIELD_H
>  
>  #include <linux/build_bug.h>
> +#include <linux/limits.h>
>  #include <linux/typecheck.h>
>  #include <asm/byteorder.h>
>  
> @@ -142,6 +143,52 @@
>  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
>  	)
>  
> +/**
> + * FIELD_PREP_HI16_WE() - prepare a bitfield element with a write-enable mask
> + * @_mask: shifted mask defining the field's length and position
> + * @_val:  value to put in the field
> + *
> + * FIELD_PREP_HI16_WE() masks and shifts up the value, as well as bitwise ORs
> + * the result with the mask shifted up by 16.
> + *
> + * This is useful for a common design of hardware registers where the upper
> + * 16-bit half of a 32-bit register is used as a write-enable mask. In such a
> + * register, a bit in the lower half is only updated if the corresponding bit
> + * in the upper half is high.
> + */
> +#define FIELD_PREP_HI16_WE(_mask, _val)					\
> +	({								\
> +		__BF_FIELD_CHECK(_mask, ((u16) 0U), _val,		\
> +				 "FIELD_PREP_HI16_WE: ");		\
> +		((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask) |	\
> +		((_mask) << 16);					\
> +	})

This pretty much is a duplication of the FIELD_PREP(), isn't? Why don't
you borrow the approach from drivers/clk/clk-sp7021.c:

	/* HIWORD_MASK FIELD_PREP */
	#define HWM_FIELD_PREP(mask, value)             \
	({                                              \
	        u64 _m = mask;                          \
	        (_m << 16) | FIELD_PREP(_m, value);     \
	})

If you do so, the existing FIELD_PREP() will do all the work without
copy-pasting. The only questionI have  to the above macro is why '_m'
is u64? Seemingly, it should be u32?

Regarding the name... I can't invent a good one as well, so the best
thing I can suggest is not to invent something that can mislead. The
HWM_FIELD_PREP() is not bad because it tells almost nothing and
encourages one to refer to the documentation. If you want something
self-explaining, maybe MASK_HI_FIELD_LO_PREP_U16(), or something? 

Thanks,
Yury

> +
> +/**
> + * FIELD_PREP_HI16_WE_CONST() - prepare a constant bitfield element with a
> + *                              write-enable mask
> + * @_mask: shifted mask defining the field's length and position
> + * @_val:  value to put in the field
> + *
> + * FIELD_PREP_HI16_WE_CONST() masks and shifts up the value, as well as bitwise
> + * ORs the result with the mask shifted up by 16.
> + *
> + * This is useful for a common design of hardware registers where the upper
> + * 16-bit half of a 32-bit register is used as a write-enable mask. In such a
> + * register, a bit in the lower half is only updated if the corresponding bit
> + * in the upper half is high.
> + *
> + * Unlike FIELD_PREP_HI16_WE(), this is a constant expression and can therefore
> + * be used in initializers. Error checking is less comfortable for this
> + * version, and non-constant masks cannot be used.
> + */
> +#define FIELD_PREP_HI16_WE_CONST(_mask, _val)				 \
> +	(								 \
> +		FIELD_PREP_CONST(_mask, _val) |				 \
> +		(BUILD_BUG_ON_ZERO(const_true((u64) (_mask) > U16_MAX)) + \
> +		 ((_mask) << 16))					 \
> +	)
> +
>  /**
>   * FIELD_GET() - extract a bitfield element
>   * @_mask: shifted mask defining the field's length and position
> 
> -- 
> 2.49.0

