Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D6EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JSx9yXVSMH1oIfWAZP5BAqaDyb/cZv1fzFwbXXkrDE=; b=FBDu1tngtuCAYCyAWmXG+OYS3E
	SUEVHiqCPm3dq37olaGLHkAYIX041gu2XZnjAqxhP8tLx+pt22ihbJFMSj0fVuxtwfQl9BRuRMQ4R
	Dkt9EfAJKbdoWs81Mk3L3CaWNSckk4+MafY8UVLZZikr0W2vjZU6tX1+n+p69KHLroKb7Hhia0qwZ
	UFXr2Kjjf9ttHxhBMTjjiP/oDrIsv6hCZhE8A8o6ddQ+1BNswdiJOeoDBwtE4k34us4Lcd+BJsJ3g
	TdmnaSKPdp/J/9HuGzYn2jc47gdYIdzteLnMC44AZIWxNCvdUNxt3gskF5kh+BxFzI2N8pHtf/4Sb
	kdjFUVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseH5-0000000Abho-47WB;
	Thu, 13 Mar 2025 08:50:44 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseFL-0000000Ab9f-24xD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:48:57 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30bfed67e08so7692881fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 01:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741855733; x=1742460533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JSx9yXVSMH1oIfWAZP5BAqaDyb/cZv1fzFwbXXkrDE=;
        b=L69FmL6nYgx6o22dDyPKr77gAft/ReOy2ygIu4p0Uj6LiTXPi+XnOHuzNqMsNMunpw
         cjWigW9OC7J7yRhRWp+WRszoxnRwKKHng2Vl54L9H9CGWYjywCaR1hRFwgjfF3MxEQKw
         t9wJ5pk79L6ToU0xW1SW41745YTpiSh5tBRXw6VWfCkfyQ0PC9vG0O0mOAMBS+SVPX++
         piQWtCsW4fthieKmNIZ4cC7dyxMjyJWXGGBG5oCIZv2dDSVKvR/bMdD+k+okJ4Zi+R9y
         54VwMVA6zaUxzxqBfyR97XOh1r+Cj9xw1EDMpYd7UdrFnvdbiK4sk0VEilWTdKLSyGbl
         3Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741855733; x=1742460533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JSx9yXVSMH1oIfWAZP5BAqaDyb/cZv1fzFwbXXkrDE=;
        b=d2lIJnHLOVEqgcPqyAsYnt1ztrgHQ3fGoZmlybUkFlbNc1/obuTb9t6HFR+S6mjIzj
         aBXu5dQ0K/8iy0Ll7IhipxRqCPajHxFZYH+OOw9schvq7ZTuyhpZQ7HBAh7LVP9QF+aW
         1CotyzU6gdIyOoRi4SUmkQr7GZgOhc4D+FxuBChuSxyckhwG9pd76vW2np98gJdWOE6A
         60LxJB8Tt+5FZfgOMd5Kt5ZbyzECPGvAb5MbgzmfVPQ9kffRP29GeElOMJQ2sN7Wa2YR
         n45Q82w5B4Err841JUDOSg9UL+BQC8MVlThwUnHFfp5svxKazpROeEHrRFx4IsCKZwRr
         4kfA==
X-Forwarded-Encrypted: i=1; AJvYcCXSDjvjDmDjpVrnY7YQQivVAihpbZvhjEng0nDicrw72fke5GVHMNANbG+qz6Wgs4iUq1XfCNqXST5xpyd9lBpv@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ63f5uE1rw0GaR9Fc+chGxzrVOgeqo0ey41OD7pQPacd2Y7Wl
	oBk2cHlsYWAAYCFkl+MzN5elau//3TnktPkCdSX3GjZ1xDHm6mJ4mDPDhhEZ0ebODkLogWHmXJw
	zJy8LUKQNV108pP8qFWserIwnZHstS8cKIQJIUA==
X-Gm-Gg: ASbGncsc2HzOev8hE1itAewAp/Vn6O9E3DPMDDwMJq6bzov6PHlaQRyktcc3yej5nS0
	Y3OMXwmX6quh7x9Rgu+aSxUpChoohN1hBe/Am9yxCQHJ2XZfkAluUCAWow0L3Uw3N//KSUeiKle
	fe0iROKG8lPJ/UpqLiONewt2RTaw==
X-Google-Smtp-Source: AGHT+IGI8tFaOVTeJQCqFzI9EQ42o/9graFjduSws1PVhjUTSRn9EgLXRgQWygDrvrGqu/hZbh3Ks12WRVjlfFyAipk=
X-Received: by 2002:a05:6512:ba6:b0:549:8f06:8225 with SMTP id
 2adb3069b0e04-54990ec17dfmr7466352e87.53.1741855733121; Thu, 13 Mar 2025
 01:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
 <20250311-arm-fix-vectors-with-linker-dce-v1-1-ec4c382e3bfd@kernel.org>
In-Reply-To: <20250311-arm-fix-vectors-with-linker-dce-v1-1-ec4c382e3bfd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Mar 2025 09:48:42 +0100
X-Gm-Features: AQ5f1JqmIPVBXkWKiQ4L7FkcGH2_zJJXfhNRe652n92bAmXjxmmkzkQ8l-fLCmw
Message-ID: <CACRpkdY-yxaiG89Co+C2=vyd0i6sh9pP0UGWZh1yUg4jd9jmuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: Require linker to support KEEP within OVERLAY
 for DCE
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Christian Eggers <ceggers@arri.de>, 
	Arnd Bergmann <arnd@arndb.de>, Yuntao Liu <liuyuntao12@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_014855_548015_B433BDD2 
X-CRM114-Status: GOOD (  11.36  )
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

On Tue, Mar 11, 2025 at 8:43=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> ld.lld prior to 21.0.0 does not support using the KEEP keyword within an
> overlay description, which may be needed to avoid discarding necessary
> sections within an overlay with '--gc-sections', which can be enabled
> for the kernel via CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
>
> Disallow CONFIG_LD_DEAD_CODE_DATA_ELIMINATION without support for KEEP
> within OVERLAY and introduce a macro, OVERLAY_KEEP, that can be used to
> conditionally add KEEP when it is properly supported to avoid breaking
> old versions of ld.lld.
>
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/commit/381599f1fe973afad3094e5=
5ec99b1620dba7d8c
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Very clear and easy to follow.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

