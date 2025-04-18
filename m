Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38ECC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 00:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJ4jcbq81h56GyVF6csHHKq2T3Y8+ueSpb7gECKDLyk=; b=rD5D+IhsTVtu55stkPRzwiRXSU
	546hL0mhCmU2Mg+RZBPQYDi/ASuuP+UkJ4gEASfshqdYJ0SI0OcyfSqZFvT7fK6vke1UFyXGUNt+I
	pcx8Y2boGGkiR1DSdNjdSJGaeCPmZcj1MPO0c6VnTVqFVGksHTCG4MpNAj0dsdj3i8as/q1D9HT5M
	da06F03UahdumBvHQH8qyePLTxa9N+1zZktGm3ABV+x859s5f8TiaxADjQk9AlJym1QFOp1pzqeXp
	qBwKem1fgj0U96/6lNWi8hcQ1jR44kjeuSK0e24nFYkAEms6wlnowWGJdEM4y6P3VsvqiUQ00MjmN
	z3iMCbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Za7-0000000Eg8j-4BUg;
	Fri, 18 Apr 2025 00:27:48 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ZYH-0000000Eg2U-1Tp2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 00:25:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7394945d37eso1193387b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 17:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744935952; x=1745540752; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ4jcbq81h56GyVF6csHHKq2T3Y8+ueSpb7gECKDLyk=;
        b=V70TeNws4cwE14PcjnVetCfKYZEw2RprHq+FMluna/yoX9UQUphXd5e3ZHk2l/KUPr
         4q7x+uIGz+D0FaEP5Ka36qM3gOYY8kkFjkjJJmtBx6q85vMReMMA1p/QCDXFiFJMAwNt
         LtEup+YrIvE8MgCSxdJLiw7awhHO/KSV5TKUYXBTZk8DItkYFOSVHZQbmsp1NcOBre1l
         lEnLUGGJJvrYRMUMYGIQH8wYsV8NbIpEpaBhRtZNRnE/2k1p2fBnvTGd+hzLvTYrbTBl
         uPngDZS3i7WHoZ9sPs9NcIIxaX75PXfWMbrz6cPTCLUeKz8TofJjT2OaoG5ZyZhCJZz8
         Qf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744935952; x=1745540752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ4jcbq81h56GyVF6csHHKq2T3Y8+ueSpb7gECKDLyk=;
        b=Xu/uf+uraycjEPju+m/NQXYqDrksHt3Zz21OiTSVUhaLo7b19WmJfnYgNVd9nh2+5x
         murwznhP7oOwJKCQwoAPxL2qCyAkRSsrmHSIMButdao/iYF2ipagm1YV7I7moApFFf6f
         gniEkSUrNsnx1s3zHJjw33+KowgLZRxeHKpz/N2Pvac3Vn8XtTouloMmtx4MyYSJ7lOu
         uUIV3wsZTcnvHXL8Ew4rBIsOOITYbIBAy1UQik7RCogzbz+xCb3ei56DuGQc404a/liM
         oOjU8rSRWLBgTWHaulJU4nfOW5RiQDYKNNotZ5DPB0dQ0uMJXSAmq+m0FG0ZSPofpGFL
         EqKw==
X-Forwarded-Encrypted: i=1; AJvYcCVGSNRwhZ6z1D3USTNTXgKfHVNtKr48XroRQSZsoM9SUFGchAScgnlPGC1+CQOv8/SDsqBJ/9/EDf1OrQlAweAr@lists.infradead.org
X-Gm-Message-State: AOJu0YzqbCqkgM+shsgS12J3UVSK+Wm3CrBYqJN3+JFWWKPh8y0gG0eg
	E6qZppehjxn9itk+tbjQGxr5rQso6+uMSq0cqWlXvoqeQ7iIyzFl
X-Gm-Gg: ASbGncu2QgItiy9W1Gwg5Q6FlnJTQ2zUyTNrr9tSTaMzEnWRQjZeaFlKIMNJL9SdfF7
	nenmoRkC6d4XT4T7/QBZh86M/e0BWRUGATM26Hj+52YHg8t4fzmaJiXsEjTSVdCxUSWHmYvROrr
	7Q6zM85d/uODJnkwBgj1j8flO7Vevhe4UIjndNV9QlFrhKyvUDzJfZBBpK12ohbkvglP9EgjHDl
	W3nWd1CRNajsXg5VKkFaGC02Im3o2rIpm9r64vPKON5KTcSpFFQfP0mkiLbOrCdmxVTqCYr2R/R
	QkQUAia8hLktQi8ymQ0zW/7vOG07tN3XA2e81ZZe
X-Google-Smtp-Source: AGHT+IF457L/xS2LzcclamN9a4c8rRGh3s9KFJiJf6ANJjnjPyle4Gdaennd13gdRi6cAZltMYOXtA==
X-Received: by 2002:a05:6a20:d485:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-203cbd4513fmr1734877637.36.1744935951850;
        Thu, 17 Apr 2025 17:25:51 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13cd491sm451435a12.46.2025.04.17.17.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 17:25:50 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C1D224209E46; Fri, 18 Apr 2025 07:25:47 +0700 (WIB)
Date: Fri, 18 Apr 2025 07:25:47 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] documentation: Add nodebugmon for arm64 platforms
Message-ID: <aAGcC2aKnoBmJSzf@archie.me>
References: <20250416062706.2735563-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="06WTJrvb1msiWFYT"
Content-Disposition: inline
In-Reply-To: <20250416062706.2735563-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_172553_394178_A9CABE6D 
X-CRM114-Status: GOOD (  11.54  )
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


--06WTJrvb1msiWFYT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 11:57:06AM +0530, Anshuman Khandual wrote:
> +	nodebugmon
> +			[HW,ARM64] Disable debug monitor
> +			Disables the debug monitor exception handling on the platform
> +			regardless whether breakpoints and watchpoints are programmed
> +			or not. This prevents debug exceptions from being enabled via
> +			MDSCR_EL1 register.

The wording looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--06WTJrvb1msiWFYT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaAGcBwAKCRD2uYlJVVFO
o+yMAPkB2tMzZI6yUPnbdQHMmL28aSDRE05XrotDef+vGPPIDQEA7f+GBQOHjK2y
myWpk48qlaeUUSbrp9IdgQcu8E02Wwc=
=I9oe
-----END PGP SIGNATURE-----

--06WTJrvb1msiWFYT--

