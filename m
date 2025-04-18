Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F4FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNA/SBMGz5nzByA9wBccTGH5/3WLOHOzBct3Skuv3xA=; b=a7+Xg6yvxhssycMRQfuIreC7O4
	JhXw4cKFUfdZWrHDfoViJ/pq55HhULcmiRYsshy/rsVQsCj7JuWf+3WSou97cvUJNcosyH0dvqP0p
	QxoEIP6zD1qQdz9kdEktFw49yZ1ix0S0uAcfjA1CxDP3p8sRKN8XpuHJZXAX89Dydsc4rnTB60BJQ
	oQWS0JeX4YgTAzYCkFDM2ICctInvcJLWt5mL1zd1svJF+a2wtrDzqmO8STH8fIbsbOM33yd6BIGRY
	EgC60mZeA/rxoA26yVbmevMM9y/agVbfkaO+Wgr2M0xlW8Xfd6Weu1lQCHgiHzJ/fY6g0/660sIgK
	SldK2Ejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qSC-0000000HS7F-1zpF;
	Fri, 18 Apr 2025 18:28:44 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5pG0-0000000HATg-12m4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 17:12:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-223f4c06e9fso19899335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744996323; x=1745601123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nNA/SBMGz5nzByA9wBccTGH5/3WLOHOzBct3Skuv3xA=;
        b=aJySE0Rg3N6LVzETYpRph63PvWfX0fnZ5fQzuq6zPnMkbdKZk7hIsMcNQPS4xl+UFO
         dbGXAypIgdbPRA+1hKXkvd79MvNszcfU2BaBvszs0RjYxy50QAom9okJBFfofV1RQXnl
         dtbNVISPSleEk5+bp9udHfGMrbBwvqo6FqjgyCvBOGGCckUIDsM62Fw7+QdqUNrZe8LW
         Dxf3bNu6SwatLbc2+sugWE3vRCxm6jfo1+fgna4/y18O0Ai6E+9VbydTg1I068/TgleP
         lq7X43looB/jdVlbrg1WKZhhrNuizRNosoJZAGjUqt9/j9VSzmyKXvE9l1qRiNDyohqG
         0bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996323; x=1745601123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNA/SBMGz5nzByA9wBccTGH5/3WLOHOzBct3Skuv3xA=;
        b=CT5UeU/JvfJqqX1gEe/Fnj2ylSaGPrgDaZQmtqYGUY/olwJtLC1jQ+Y3ZCBtW9mD6Z
         peKdGahAgKYpLnYgmjC4z35J/fA9utGyDUJgCCI9p66ZAOq4wdc/YC04yP5p93o9h2VL
         t866BI/meWVtki8WUJfvFkXp/XLAdps69pHW3boi5HjC6NmKYMAwLjcRBDVVc+ypDdn9
         mjwIi51ok2yi/SjCzfyBxlFTqZVi4BFSN239k9kPWyXbEShnNr6kWnhpnImDKoZc2JcA
         JF4df+KP3OjIM5yCLFluerx1kLdC13QKJKA4ovXn9WS498J56092OtaeEBhfJ+X4glKl
         nJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi8e56DesX88HFFJusI4F+3eB4s3MLlEbipNkAATuJtco5HCbEWfVzrPJmwu+legUqc8hMdkhRCD0JCSXZJxtI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq2+riMIXBDLELOAiB3w4hNh7ssCU4VXZUg6Ec8zDW47y9EAJc
	ywzkANJJB7/QelcxAaNbzPJi069LluCip/z595rHJ7zGMrEGljkA
X-Gm-Gg: ASbGncvAQYdqY3cKIcs8p0sOMd3BiBulQ/2i6EQFEGTUzkJmOVHC2YjJHvedQg36aXN
	2cfFYLFlKc/gVUVC769gqetHPzhpsznpdI4kh13LOWumhZ1N6XHWC/K8LRC1FKB9FVKC44snT6y
	S5wvkyWw+rKvqWsvwQDsBf73sA6i6eJK4YivDZzmY5k+/66R6HidnUcjYCS3p/WV2ZQNzQv3jtD
	YIKrF+V2mOJHu+w5rs7Dqi1pzY4DUL51UJTURkdxHdJmpc7QJiBz/S4j8bhKWEgb08ehIyqhwo1
	5xoHXWAHfXUwplrO7XBGSzN4JjGpfnK5OZKYhbiV76q9gdj4fQM=
X-Google-Smtp-Source: AGHT+IHds0YrApaxned7HLyI6jwzPBZIRFd/Zv4gqZcmfhjoAsoH/dxR0Rpg18h6eruL1zhjn94uCQ==
X-Received: by 2002:a17:902:f648:b0:223:5187:a886 with SMTP id d9443c01a7336-22c53f1056amr52473725ad.22.1744996323197;
        Fri, 18 Apr 2025 10:12:03 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4925sm19191665ad.117.2025.04.18.10.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:12:02 -0700 (PDT)
Date: Fri, 18 Apr 2025 13:11:59 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, andrew@lunn.ch, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 1/6] bitfield: Add FIELD_MODIFY() helper
Message-ID: <aAKH37xa1brIAXfs@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <20250417-field_modify-v3-1-6f7992aafcb7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-field_modify-v3-1-6f7992aafcb7@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_101204_288945_CEF45AAC 
X-CRM114-Status: GOOD (  25.35  )
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

On Thu, Apr 17, 2025 at 06:47:08PM +0800, Luo Jie wrote:
> Add a helper for replacing the contents of bitfield in memory
> with the specified value.
> 
> Even though a helper xxx_replace_bits() is available, it is not
> well documented, and only reports errors at the run time, which
> will not be helpful to catch possible overflow errors due to
> incorrect parameter types used.
> 
> Add the helper FIELD_MODIFY() to the FIELD_XXX family of bitfield
> macros. It is functionally similar as xxx_replace_bits(), and in
> addition adds the compile time type checking.

This paragraph duplicates the above. I'll drop it and take this
patch to bitmap-for-next. Regarding the rest of the series - it's up
to ARM64 and Cocci maintainers if they want them or not.

Thanks for the work!

Thanks,
Yury
 
> FIELD_MODIFY(REG_FIELD_C, &reg, c) is the wrapper of the code below.
> reg &= ~REG_FIELD_C;
> reg |= FIELD_PREP(REG_FIELD_C, c);
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  include/linux/bitfield.h | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f173223..2eaefa76f759 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -8,6 +8,7 @@
>  #define _LINUX_BITFIELD_H
>  
>  #include <linux/build_bug.h>
> +#include <linux/typecheck.h>
>  #include <asm/byteorder.h>
>  
>  /*
> @@ -38,8 +39,7 @@
>   *	  FIELD_PREP(REG_FIELD_D, 0x40);
>   *
>   * Modify:
> - *  reg &= ~REG_FIELD_C;
> - *  reg |= FIELD_PREP(REG_FIELD_C, c);
> + *  FIELD_MODIFY(REG_FIELD_C, &reg, c);
>   */
>  
>  #define __bf_shf(x) (__builtin_ffsll(x) - 1)
> @@ -156,6 +156,23 @@
>  		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
>  	})
>  
> +/**
> + * FIELD_MODIFY() - modify a bitfield element
> + * @_mask: shifted mask defining the field's length and position
> + * @_reg_p: pointer to the memory that should be updated
> + * @_val: value to store in the bitfield
> + *
> + * FIELD_MODIFY() modifies the set of bits in @_reg_p specified by @_mask,
> + * by replacing them with the bitfield value passed in as @_val.
> + */
> +#define FIELD_MODIFY(_mask, _reg_p, _val)				\
> +	({								\
> +		typecheck_pointer(_reg_p);				\
> +		__BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");		\
> +		*(_reg_p) &= ~(_mask);							\
> +		*(_reg_p) |= (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask));	\
> +	})
> +
>  extern void __compiletime_error("value doesn't fit into mask")
>  __field_overflow(void);
>  extern void __compiletime_error("bad bitfield mask")
> 
> -- 
> 2.34.1

