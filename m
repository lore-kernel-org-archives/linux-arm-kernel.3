Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DF4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 07:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYtiTl2/vcB5JjeNMht3FQUGQbOf7Sw/0g0qYc0qYCs=; b=srdYzOXdue9/XAD5/x29stlwqh
	2e4b/NkFvHOAe8tNSbFwBa8PBj9SWT6/xvEmMYTy5ExWDrcL2Dylhh9sn7UWQ17gehTG8hJwFqcyi
	nlLenTHKE0vWDiZzq1HJJeBjYI8cNzcPrFtHuras594es53I97ogs4XbsQtu89S1QpWa9oIkKkRN3
	Oq2rRb6KZPNyfG5M3cDnRsEe6BDRqNducroLjqYGfJbeXPy13Tt8oDWrcmbNiHc5lzwvRE4OpErDL
	IphoWAhsf0c7trcSA0H7erZ6MwrKNIBERNmUkHcZOaloNgYo8dX0rNwBYm7hh87DwC4z78o0wv4Uj
	5EJx8BCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqCI-00000006gAp-2W3U;
	Thu, 24 Jul 2025 07:16:58 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueq9m-00000006ftu-3drQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 07:14:24 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e8db917573dso506871276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 00:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753341262; x=1753946062; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYtiTl2/vcB5JjeNMht3FQUGQbOf7Sw/0g0qYc0qYCs=;
        b=JS5JYaMSWFvQw7Twg1HDAEOP0cbxIuHx6IIq8PBafgalXcpqSb9PU/2/RqxjficWPr
         wbaR5HYdD+K28WjO7/wKtyX8t4I/3t/t+tfOxGiMkK0CHDZ3UpotdofCJj3liMb4xMkf
         JYm/2QBUGz0OBmXPDstHxyN/tY2HF0uYPwuaWsOEZRzOI2IYaCwjBr64vgRelJt8kaA8
         Jj2qB59aaowfDPZoO9chEBy1fl5qtKh0kALQXbkeqc9SGYMwYnDJ3F0SGzqhMTLIOZAC
         cUde0QPzLJzSau8r9UxPdDGdI4i/xRvaaOD38v32aIjzWRXmi07aaiVt5gVcmdRf+l7l
         I9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753341262; x=1753946062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYtiTl2/vcB5JjeNMht3FQUGQbOf7Sw/0g0qYc0qYCs=;
        b=HGndMkCJ29VFYfSUkiuLrvRLRh1BcltDLQlB2ELt1VrmKYxlPUtiMUklSelSU6iXGy
         iRUByJDIOyk4yNp309UIV2A7S3lWh+I251YLduePEoZUzcTxRki5oCZEOdNNfocLrGR5
         82y9r9FPkP1CiWO0i57CCsrfpeC2NXc7c7n8BRwwtESYiXDy25INUh4S3jc3lCHikT45
         40kGaJ/zse2v3zHZNjz5TSEa2eufhQxAZhoJ1vEhrB0XUd///7NlJCloImWORC3PKMV+
         DYYsyTKFV7wZM7m/3/mLWscHaIqwWpb8Prdt5+nJGZHKmk+hpu95lSv9LNsxM5yaoY51
         H12w==
X-Forwarded-Encrypted: i=1; AJvYcCU11UrlO4YswwvRdeejXu4gSABSkaE/vEuOevINQ+a/5SgH6t46ARxCtfZFFCHaOrQAna36skPBeUDpRjKPV8KW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywswt9oIr9jJvU0WHekDcOHAuM0fd15pOw77ZpRA1uwaGHM5+dL
	1GFWaPf12SqzKf3RS0OPuMmkwkMrnNBZlEb2tPVI7rudT1YUF9JVN3SscGbIvq4DggNrwQCXZit
	lpw1A5P2NLjfRCL20zK0X8T1hgwbSBwduGFxZfygv8A==
X-Gm-Gg: ASbGncut9JCNoscHfcF7UedJnObt1Q76BeCD9OqeFPzk2QsObpsAWQH6woNF3JsX0kT
	OqF9NlfB8yEWY393zGfGaFD3dovubbb96VxjY51UePmiY2D4kT2H1JoapkdRWbGQbS0OnrNERGQ
	TGyvyJ2ici6Otje+ng7KrIoqU3nx7SagW5CLxMcZWtoVD5Cxn/C7liz3tm9j/ImhITERpezmoTv
	/PL+uQ=
X-Google-Smtp-Source: AGHT+IFmnBw44RVqEQy61JKuL0iFrYaWpRDyxUhMmlPDwRzFw5AwUBOybBBoOUdWV5mpQDmcfwgotc7Tx/G30sPFLxE=
X-Received: by 2002:a05:6902:4a0c:b0:e8b:d37b:86fa with SMTP id
 3f1490d57ef6-e8dc5a86969mr7074336276.37.1753341261694; Thu, 24 Jul 2025
 00:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9@epcas2p1.samsung.com>
 <20250714055440.3138135-1-sw617.shin@samsung.com> <20250714055440.3138135-2-sw617.shin@samsung.com>
In-Reply-To: <20250714055440.3138135-2-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 24 Jul 2025 02:14:10 -0500
X-Gm-Features: Ac12FXyeh_teX33m6-oCCNN--bnf0arq8tqlpYQ5bLEOmvlZqoOtQ8w9OKWGEX4
Message-ID: <CAPLW+4=Gsd9VNv6T_e2QMWkPNbjp4c2GQEYpD9icU3r+0QuPww@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 1/5] watchdog: s3c2410_wdt: Replace hardcoded
 values with macro definitions
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_001422_911743_61AE6DD4 
X-CRM114-Status: GOOD (  16.18  )
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

On Mon, Jul 14, 2025 at 12:59=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.=
com> wrote:
>
> Modify the code to utilize macro-defined values instead of hardcoded
> values. The value 0x100 in the s3c2410wdt_set_heartbeat function represen=
ts
> S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
> difficult to understand and reducing code readability.
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 40901bdac426..95f7207e390a 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -587,7 +587,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>         if (count >=3D 0x10000) {
>                 divisor =3D DIV_ROUND_UP(count, 0xffff);
>
> -               if (divisor > 0x100) {
> +               if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
>                         dev_err(wdt->dev, "timeout %d too big\n", timeout=
);
>                         return -EINVAL;
>                 }
> --
> 2.25.1
>
>

