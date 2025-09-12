Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB687CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxaMEqYA6uym+Ir6zcrN22UPH27k/nnjzDJpTYQxN6I=; b=Q+2FHLdVusy5uE5vVt4lThGnnQ
	ZsIg2GBda6NSsCZJsV8sKh/Q76fH2jiwrqSfyu8FgM/B4K1dqD1OV48oxXLKEyiKTM2nQUycVzKgA
	zwcS3sRMgyNkZqs7FtgxnAvBV8/+tO9Za+Z+XPEVYhZXVmTSJgi/sTn3xkyOgT6P5O+Yx9a1w+ECK
	6XwKTzXdsHaH6FyTqq/koYJPynBq6XsWFsas5FAfp5DytnRFLOJjBX3SZp7hRMSEZ3NSgPdhiGd/w
	/Lex03Xyiil1ag+npXkQFKwn4hIMrbsqR8SvF49/a2l6N42sYH4sx4fE0sEcAalJsrBFJ1ftNhQFo
	M1vfbspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0wQ-00000008ZDd-0HHm;
	Fri, 12 Sep 2025 10:23:42 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0wN-00000008ZCc-3eVB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:23:41 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so1050752a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 03:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757672619; x=1758277419; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxaMEqYA6uym+Ir6zcrN22UPH27k/nnjzDJpTYQxN6I=;
        b=lL826LUxJZIgSl+lurNuQyfiY61icyNnlmYVySpF8ZkuUgaCGq4UD8z2pUcJ76MJTo
         LCBpOGNwoOg1rd8KzF9Y21WoraRpjYkjZDxUPywMp/nb+Frgl5yMTHSe8KvT7mhy+AyZ
         yQ19QZVAgG9prabEbdaMhE/2PKjZ/0mxy3b4tFoI0zv6MI5BnmSCtfTzz/JiT/az4sM6
         4osJbOzSySRq1NZ8z2bJ2Nm4mqHyq28rgiknnSkBFrGVbKfWIXGS0/A5cuZn7nUqZo+T
         khQVe2vOJT9g+zhr4suZdPTDyh/jQxVkNVPMWk4TY70ewzI3q0iZuccOE6pPCSmtWQwG
         S/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672619; x=1758277419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxaMEqYA6uym+Ir6zcrN22UPH27k/nnjzDJpTYQxN6I=;
        b=edqs6O3HPamUNyirht/D/apibI+d9LdlqdF6I0eKPc1WKmmb3smtkrNPjA74wL9dQq
         LJkI/AKu3rR8mMoWhgAOkmylQPxl8KRJ2PnhSL6RFEwyEy/BEhH1TJJQL8mvfEN+PuQf
         xevVqqal8iKCi8d79NWeub5IBAlwSBoosoL6EttQz9+soOBAylF9vKswGzfDS4YWxHaO
         ZhU05sL8NvbxkGhw0+/N9/zmxF6DRLVKIlMfD/F7TCy52OfXOvCTdKcP/ecaUUDlVG2w
         YckdM/NIELmivc418sGLTd+iGerygiEvkpbhb8KqwJX6soQFJTIU2eEuCHq+Gl8f+eYA
         qWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcRYhqzg/EI3PjWIjHkhc1WzV8WDpjWZtRDjJ89tu7V/0E//P7+bG/HBmZ+BrVdX34nLCQug7283jbaxq7lQrq@lists.infradead.org
X-Gm-Message-State: AOJu0YwrwjUxYMn+Qlna2CwnG2Ry60mTxjBMqYoWjzUQUKeCl6ufe0/z
	WL96mEbreLgYxu4qrmLwwAV5wUSFIMAQ0HS6fLyv7Oc2MzpDVRspwtm5DHMnT76WSXgECU6pXtu
	jT47dvCEQsaXs3G9SLhvFmfFPBCwc1SfMnsgFqG0AJw==
X-Gm-Gg: ASbGncveMsv98r7NwifCvRHcuXfSxKMNk0RVKkY7DCHoeYKyEubx82Zs+LD4jDJT+Oj
	CEyArr/uUF8cUHFVitOTPb23x29NnvS3u0kI3opjSDA5B3TWHTnJnN/57b+tR1m14WuGWSRasII
	kQug1zKUTFQWmlztltl2KFiRNvD5rIJCVP8miGiFiiUyUn8zRM+KP04aSk5MC6T76r4I82nHGLy
	jxyVeqWTAwl+af7abUdvDWE3xqJ7ihVShnkxCg4Fbfq8U+5YbuLJPSuFqqN4Kt6HKa74nCiHU9v
	zpgg+38=
X-Google-Smtp-Source: AGHT+IFnlh7Lcvev/z+g8geBZVyzuCDqftK69x/3dM4A4/rPwhVxriJu5LaQAhPmA/dUWQDP37JDEPq7LkU6t/uT414=
X-Received: by 2002:a17:903:2407:b0:240:3c51:1063 with SMTP id
 d9443c01a7336-25d2576f18bmr30549565ad.23.1757672618671; Fri, 12 Sep 2025
 03:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
 <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
In-Reply-To: <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 12 Sep 2025 15:53:26 +0530
X-Gm-Features: AS18NWBiNtyoZJdw5AR77Ehen6tmbxWoHZEhVULSIr8zN1kPljDdD8rhs__pSZI
Message-ID: <CA+G9fYvrcRNBbg15UEcaZuYgs1pHU2i7h=zvJ2yHNo5i4fZ_nA@mail.gmail.com>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error: use
 of undeclared identifier 'HWCAP_GCS'
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_032339_927089_FB964933 
X-CRM114-Status: GOOD (  19.35  )
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

Hi Thomas,

On Fri, 12 Sept 2025 at 12:00, Thomas Wei=C3=9Fschuh <linux@weissschuh.net>=
 wrote:
>
> Hi Naresh,
>
> On 2025-09-12 00:48:47+0530, Naresh Kamboju wrote:
> > The following build warnings / errors noticed on arm64 defconfig
> > with clang-20 and gcc-13 toolchains on the Linux next-20250909
> > till next-20250911 tag while building selftests/arm64.
> >
> > Regression Analysis:
> > - New regression? Yes
> > - Reproducibility? yes
> >
> > First seen on  next-20250909
> >  Good: next-20250908
> >  Bad: next-20250909 till next-20250911
> >
> > Test regression: next-20250909:
> > selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
> > identifier 'HWCAP_GCS'
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > ## Build log
> > selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
> > identifier 'HWCAP_GCS'
> >   390 |         if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
> >       |                                     ^
> > 1 error generated.
> >
> > The suspected commit pointing to,
> >   kselftest/arm64/gcs: Use nolibc's getauxval()
> >   a985fe638344492727528e52416211dda1c391d5
>
> That suspicion looks correct. I am wondering a bit how this works for
> the other selftests which use this symbol.
>
> Can you give this one a try:
>

I have applied this patch and tested and reported build regressions
got fixed.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

> diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing=
/selftests/arm64/gcs/gcs-util.h
> index c99a6b39ac14..816b497634d6 100644
> --- a/tools/testing/selftests/arm64/gcs/gcs-util.h
> +++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
> @@ -26,6 +26,10 @@ struct user_gcs {
>  };
>  #endif
>
> +#ifndef HWCAP_GCS
> +#define HWCAP_GCS (1UL << 32)
> +#endif
> +
>  /* Shadow Stack/Guarded Control Stack interface */
>  #define PR_GET_SHADOW_STACK_STATUS     74
>  #define PR_SET_SHADOW_STACK_STATUS      75

--
Linaro LKFT

