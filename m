Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A88C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Aug 2025 04:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYp4mXKhOVGUhhKWIugNhHcZ1ORze3B3p0bRipFlplY=; b=L1JOR8H1IgphO9cENIUxre/yQI
	it8MxyClrTaqBAP8nLBrc4e54ftpgDpDHxosd7eCkOrH7vllT8LzXZN8NsrAjhQbGHo04PlSp1+4W
	Nv9hLriwrE6wo0NHRvyLgJEYf1nJKf0a0UBms8fQd0sioPZrdhobC4TKdMXD8xpqMqO9DMsdUK024
	Civm7aD5prDjHV7uG4qgHPanops72ck7c+42Vqjy5PS3p5uj+gHxdZl4ZHtUNbGLWMZ+OaqMYlh0d
	nPcNGrhstkvUjQoBOjuXXnIUBUNwv3XGADlcWIMjcIpR7W00A2O0+jq8u7kDcOu38nmCbQ3umw9xF
	6bejCUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui3dm-00000007A22-2Prp;
	Sat, 02 Aug 2025 04:14:38 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui3bA-000000079pw-1Lst
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Aug 2025 04:11:58 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-719f5a141a3so22925707b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 21:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754107915; x=1754712715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYp4mXKhOVGUhhKWIugNhHcZ1ORze3B3p0bRipFlplY=;
        b=GxeuOK79FXvrSvslDZvhhkjEuDtWqCGscUz6m/zNPhHmZn0vKDya9f0mvwPUf5ZXmq
         q5FAASRedNuw/7syOrK5NVGI9HqcWUlnPU50xqozzqOWSbkcfMTuRqk6rhlTbsNgGuCa
         6iy70V9O2eIyUhLi8CCwI1/v+eR6zULWyFXPKVlPGSWdy4zEphZ6/tv8Fbe3kD+a7Um2
         muuZBfVaqKVxcCAcCKIRRFDG9F/uNVFuuXpDbP1IALwvMJANLr8hFbThJcS7LayVqDuE
         6nV2LSKuJbAAJdgIDMR1AGxtkw5eHwYf9df6J4fSkprwkaTwmu9ryp0pL0h6HfoE7WlR
         x+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754107915; x=1754712715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYp4mXKhOVGUhhKWIugNhHcZ1ORze3B3p0bRipFlplY=;
        b=L+2mdbYBLVDr0z6qfo5hQDX3/dIEy1DDzFJj1zZyPV1gGbLGcWDj37F6zh2BtNj9Ox
         nxiBQECiPnvuXnGLKACkl/ELdhrJ8eBKwI4tKH6nI8pPxit4KYd44IHJ59iqE0K9nvw6
         HwgGkpILwLHglF5OuG65LmIYupE69QglKFyln31qTY2KvWIAtHgooLAl5DlbnpBPOT3/
         htVK1za9iyBdEo4vDmOjSa8VvnVb3+pQAuL3qiEWPR6FhB3InyYgSxVmhsCD3bjJ2JMl
         5LrVYS7lzd1o87cfBF8E8jAYjCmka/YOW1BcWbKz8W4gcZgM4qaqN0wWYKQx82mdZAet
         KBwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVunwJYF/ETJ/UYOanqI26qxp3A2PBSHyLankTcgwJNs4e5+VPljPTuwbkKMHLfY1SjN9oxwL9UyxjfBUAywCLA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa+0+Lyph2tepJ53OoiGLQ+Sd1O1DYja81ZPV5exTmG4cL0Z6A
	g37+mCG11K91iXSfZGe74pnO7+u3c/UjKUiC4Tynrbh3PwZYKMPTDRZoPl73cqqnbFFDYD6HzqT
	wgXU5uhOPYOuZfP80Lp0evr9f1neuUDWPZuzXMmUYuQ==
X-Gm-Gg: ASbGnctuh4m+p5ucOMkZt7aRlMbqVxbwlpjdE62FcIG9kVbP26Xl54Vmj7ODGuip67X
	YHJuNnOw8SUIj9HHFBLv8RyT4eXX77zvATInLQ4F2YlcMH9wr4FL4keEtHPXcu/0nbefkhojbQw
	8pJXCmae5/39Se4EgQkoYzEiaATkILeK2wIL2nJauMoQnLqiMVMor+WDCS8as9mu0rYf7oxNJoP
	lyklg==
X-Google-Smtp-Source: AGHT+IF9ctIxKBr9nfRXs2qCE2fyDGDHNm3LJDq8aN0iByZsWyGIn7LQZuF9bXAq3rhtwRAuKAX7NxEh1CJ8dlCDFPo=
X-Received: by 2002:a05:690c:55c8:10b0:71a:20aa:2265 with SMTP id
 00721157ae682-71b5a71c1e8mr83900667b3.6.1754107915222; Fri, 01 Aug 2025
 21:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-3-sw617.shin@samsung.com>
In-Reply-To: <20250724080854.3866566-3-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 23:11:44 -0500
X-Gm-Features: Ac12FXy2WLL3xRYhDsxothu9WYIfOUZEaNDjOS1ze6he7jduUVYVbSmd09OsrAk
Message-ID: <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_211157_178757_0C63F2A5 
X-CRM114-Status: GOOD (  20.31  )
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

On Thu, Jul 24, 2025 at 3:13=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.c=
om> wrote:
>
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the remaind=
er
> is discarded during the calculation process. This leads to a larger
> calculated value for max_timeout compared to the actual settable value.
> A ceiling operation is applied in the calculation process to resolve this=
.
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 95f7207e390a..31f7e1ec779e 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -411,8 +411,8 @@ static inline unsigned int s3c2410wdt_max_timeout(str=
uct s3c2410_wdt *wdt)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>
> -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX=
 + 1)
> -                                      / S3C2410_WTCON_MAXDIV);
> +       return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
> +               (S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
>  }
>

How about something like this instead?

8<--------------------------------------------------------------------->8
static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq)
{
    const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
                S3C2410_WTCON_MAXDIV; /* 32768 */
    const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
    u64 t_max =3D n_max / freq;

    if (t_max > UINT_MAX)
        t_max =3D UINT_MAX;

    return (unsigned int)t_max;
}
8<--------------------------------------------------------------------->8

This implementation's result:
  - is never greater than real timeout, as it loses the decimal part
after integer division in t_max
  - much closer to the real timeout value, as it benefits from very
big n_max in the numerator (this is the main trick here)
  - prepared for using 32-bit max counter value in your next patch, as
it uses u64 type for calculations

For example, at the clock frequency of 33 kHz:
  - real timeout is: 65074.269 sec
  - old function returns: 65535 sec
  - your function returns: 32767 sec
  - the suggested function returns: 65074 sec

I've prepared the test program you can run on your machine to play
with all implementations: [1].

Thanks!

[1] https://gist.github.com/joe-skb7/c2b2290bb0b0572a4018d81fc4ba1f3e

>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool ma=
sk)
> --
> 2.25.1
>

