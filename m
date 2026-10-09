Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEB1CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=; b=1Pv42N/FEGkyO+XE/bliEDy8ID
	3/4OztH5wXh87mkR4XWtI1U3Nl42nhJ+3DXbXH1zYbBEIKoOLgEqx32uuLK3awg27icoipb3muj0A
	NVBvLclqE0dd7pkTN3k1/YGeRDpDI4oVsjw4n385bo6axU/WuIVPHIyNB4v1S3eCf2coLAb7Y/C6K
	Zz/RXi9GWIK4u39Bd+XLueyaNUCRnC71NKJzH3FuqZwvXv+9EfPRhO2dnbG0VDRUD/81rVNFMXxQL
	0Vu4pfqV8l5nnszGmX9ePv10vmr/xBha+yuvBD5I1FhLOeETL6Kyx6vbyUXwIIvEIcseV3OdeREW9
	PiFEHdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzJH-00000005EWk-3pNc;
	Fri, 09 Oct 2026 01:22:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzJE-00000005EWJ-2wNv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 01:22:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so30564135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 18:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791508922; x=1792113722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=;
        b=jndbvFr5l5yrvLgEQg9VLFtHGKNZ56x6j9se/dSbE2NT0ftzhEww6V44nNbcPkgsAo
         E/PR9NUnOGZxMOVHhczwCvE3V89mOn7NIguTsAbTr1i6urcGZAzzFBgFLZ3AweRoz2nx
         jUabFVQ90aoIldGAYDdKACF9MmNkZaZseaJ7FYUIrNddHB5zVDhZsNhZbSUDjDcfNrtQ
         uVBHmh4/64xhhXxKTCujNhgKjYLLAaakgAyfnZIGDas6bxZQwK1WE7B19qj6rVXrmBCX
         bUp4hYteEenJyrsOmhVOR0ULUCgnwlKa/+QsYbGafqGkdEwKoV/lYrNDuFdjk33TtvzF
         tU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508922; x=1792113722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9buXjJGBYbtpNLdIoiv5CbTd8inVOpHvCQM0Gnu+os=;
        b=PB2xMyJoXeeKsOGIVfM9mOqYjG/jv7M0gUNp/sT1BknP3NYjhZ6ChJdlhc8kSrTJ1d
         8bWnIw/JcfdCWqmkPfNalCAWrjOTGYSYUEW1urKCdIvlhnT9Ycde2TyJ3fT4GMa2VvFs
         Wbk1bjvtaiLHeIr+qTM+21YpLVQYtiWJXiN8N/rYclTF4HijYqFemyyjLxzdipxZb2AS
         23SMaDec7baQVSNcwS/6BK79QQ0pXiXI7p+w0m7MFACrgoXaIjP2mylRnBxhEYUuylbm
         SrF/jd3siQsKkFb7trQvig3zpQDmpBJMJn0pD+nO+iAMa1jzNXWoU548uuoBnbCUkdAc
         4OQw==
X-Forwarded-Encrypted: i=1; AKwUvByFNdOFQrg6rfw+F9abGhHs5PFH96vsIs3ZNXujnD/UoOZ66vAe36WJ5hO0BYx38VYwrKJW+tEeyivXHi3I2gz3@lists.infradead.org
X-Gm-Message-State: AFuF++njmtGCbFOxDIXBalO4QKcZu3v7WKbRkL8d03y1L/JGxo6N40zV
	e5WNr9SoPMnV9sEIx85R37gvkNIrnN/ngYt/aQMIjxUqfpR/sqJepYTO
X-Gm-Gg: AYBFou0jum2RNsMUJharifXcN74W4wrYDXxDVX4lx5lJFeLTHwH8vNi23f6iouDgNrv
	ayETYY5u50C27avQkrEsGmX6IaF8p0hCm/qmLxUhP/pOVGDdF5do/andtvxU6sxGmz0MGsSmXug
	HtnQcYX84Q0aqMfUlVgEzoCsmdppPxfdlp4Ofd5oPvvGDrTRjnNf32vShCBzP5fXX5+xVT6wouF
	N+GFnYUUGIF/QFicxpUlhp41hEFfqEpTcDax3XfIUtBo/eYNp4cS3VtI5fevdeKHnec/QbCvKH4
	LG/ku5pVLtqvTKUv6BMAATqIj/tfBp9uXsWmF6JQsAd39HROvWv2spZNZeAHQ95QAq0e9dH6Tbf
	W6xRYy5s8HqMlTMSj2Sn7hGUul5Z3rDhHZR1KU1fOmDGjXhyfcNFUSmU/sUl+Ey0p/fMXki+ZQv
	5wyS8BD1PeGgWHaMJgQcW3xNJV5MGRtTy2PQZtSq8PxKIYn+kI469ayFg3H3Vfa+8JavxWameRZ
	93t49Y8U41/38RaSUpmlmM3bTS6at+MxEcj1pYe0hCbfOMj8mkmYq8ekq2lZcrgyeypCFpsAmir
	kaMJv+Iz09OeoiHM4WSYNUFcHQAlooTbwQOCxlMF0OQ7SeL08eDN6aipW/WJmRO+MtNlZP27OmJ
	vPoiY1tz0q/qsQQI4yTv50/7KmdgmCCul
X-Received: by 2002:a05:600c:3e14:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a18e49316dmr3757845e9.7.1791508922467;
        Thu, 08 Oct 2026 18:22:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm1207925e9.2.2026.10.08.18.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:22:01 -0700 (PDT)
Date: Fri, 9 Oct 2026 03:21:59 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Message-ID: <ashAuRn5eT2iiMAk@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-6-kmehltretter@gmail.com>
 <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLZC7PFV4O75.VPMF8KDNW8JY@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_182204_759726_BA9846B0 
X-CRM114-Status: GOOD (  11.88  )
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

On Thu, Oct 08, 2026 at 11:08:52AM +0100, Gary Guo wrote:
> > +=============  ================  ======================================================
> >  Architecture   Level of support  Constraints
> > -=============  ================  ==============================================
> > -``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
> > +=============  ================  ======================================================
> > +``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
> 
> Can we say "ARMv4T or above" or something similar?
> 

Plain ARMv6 (CPU_V6, ARM1136r0) and ARMv7-M stay excluded, so "or above"
alone would cover too much. It could be

  ARMv4T and above except plain ARMv6 and ARMv7-M, Little Endian only.

That is longer than the list. I can change it if there is a preference
for this form.

Thanks,
Karl

