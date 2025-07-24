Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD40C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jeoj9tglqbA1NMZVkivEDbgZNBzAjFEQXNqjJ9m7z5o=; b=wIsNLucZCtrBqvX6TfKfY1sHWz
	GLP673vC6OcwEbfPiDQ73oA+HFBeHbZlRzez1kyMAgGanIZQBtY9Cdx0ErN7NdT4C/1wO2PZbCOq3
	f/Ae07/YXKHf83/7lexO/bEr2vl+xK36Sy2F+fnGOHvA0km0G7G3LDdm5ux58U1A9YqN0Xd+APPBy
	ONvyNTcw8v+FYsqZvPKzKuPMCXQmZ6adt5GFdtYbNbsGCPra0hMIH3fsMGfnt32Iyx2/Xj8ucbb3A
	Id4VvbfR3C2EGVtbx5u7xeZNtpq5hDZJQrf88UHd8SmutUiMW/omkIIzVuD3ISRAWUQ3MpDGLLmi3
	HECLCtKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesCm-0000000722w-2bqf;
	Thu, 24 Jul 2025 09:25:36 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerCM-00000006qHq-3RCI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:21:07 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55516abe02cso1026125e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753345265; x=1753950065; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jeoj9tglqbA1NMZVkivEDbgZNBzAjFEQXNqjJ9m7z5o=;
        b=rAgKqHDcvIKTEKmUYcLIaucBb00Cqi6nvfIR/7LvIIl1SrIiyPB7SuwZ214gx8rANw
         1zHIkAHRdrQDFWIHQghTqft/FAeCyTNQJGngRj/QNLuxZLCHPIhL2YYBqG/ktmrzQsKt
         qEuG3aQtEuZWqQ8yB12wx7o+dJW6B7Xli/2VobdnIsoK9Dhhj85Jnt1TxYeCneSMHJnE
         6iXp7OC93B4LSqgmeYvaRirjv6anuDWebm2fU9hsd3Fbgs/kEeLiSUk3DpN0TR/C9P5c
         bMt1lqpMhW81FSFays5Smq5glupjPNIPFCF4fQKW6zHkYBdOketj45HIM6vcDS+pPQh2
         A6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753345265; x=1753950065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jeoj9tglqbA1NMZVkivEDbgZNBzAjFEQXNqjJ9m7z5o=;
        b=lZOou9mphrNskykIzHYeAblH30RRQ9ClYYV378hMVTEOuqRuLzzEnpJM4Tm18r9K9b
         Hs/DnsNvwqbwLIj+UClegrK5TijaOjX16ZGbb2SyhUSa488cv2n6t1U61p8pGbzh7OeF
         kEgNvKZL/xRY3f7S59KxQLuxpNbMT8d3wjSufQ0Tj72G2W2oQs0yoWK6m3J7h6YOZNYJ
         ozH05AwiWpFAejGrhVZnPQ1KmPwGXHDTVVauPEmtmcRcQA910vUszgvfgbe/08M/tJTx
         3be04nm7kYI0qqVTlBxKebDVWOb5PbNZmLls9a9pGxnzkMXrU4G/Znxrx+hAsHA9/8v+
         oj9g==
X-Forwarded-Encrypted: i=1; AJvYcCWpxq4XMTQLXsb2YyU9K/U0lyWcDqgtAsJIQ/TZji6nFUqT/DKYPMb/k/SVuqBqNUw1vBdSST45BvjmQSlm9G/x@lists.infradead.org
X-Gm-Message-State: AOJu0YzN+iOZldlgefGnp0v+d9s0GWe03aC2hc+HWCWS78mNzGPcy83W
	ry4cd9feTcGVqp0MW8cs09GB8EWWx4+acInb+oDtJPt3UWO0Sw2esWG//Q1eNAyINZKg8aaGUpI
	1iOTJWOUkmsrIIFidaQthFn3TKubO9DKBCnGmHxZRrA==
X-Gm-Gg: ASbGncv1hrDADlC3XfYVaSARqjcUlhgS38BEeTLzrgYa09xq1dXRCLihLjNs+y/OiHK
	g0HEFRElchdVwBti9XpTqc6K7GyPApOMxX2uB0LdlDpuJRhBmKxWKYpXjTxNlV2h/NZUV9AlXyx
	Al8DyW+VMOhOb2eGwrWwqm/MvJwJIKEP3XqoYws+7DoTC8TPlDIz/Y7UIIjt2O+nIY4s36RSTmZ
	h7KNiuIrJ6xaKWd6g==
X-Google-Smtp-Source: AGHT+IFgj4NWeTcCOklpWerO2NLRG1ZV07PkzHyWzYdoKpwy1nHtaHQiocPmCwpZPKGCesesIznxt7/Ce26GvJafkus=
X-Received: by 2002:a05:6512:4028:b0:558:f939:4435 with SMTP id
 2adb3069b0e04-55b558b8ed8mr426827e87.13.1753345264967; Thu, 24 Jul 2025
 01:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250722071542.19030-1-brgl@bgdev.pl>
In-Reply-To: <20250722071542.19030-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Jul 2025 10:20:53 +0200
X-Gm-Features: Ac12FXwgRHrq4Y_NxH7wnxF43eHBfmddYtdiL0ONyJqVi-ngRTs-yiFQQ-zYlLw
Message-ID: <CACRpkdYzjrU3Rz08tkGOCBvmcdKe30zd1f0m+iJQUX57sjQoPw@mail.gmail.com>
Subject: Re: [PATCH] ARM: sa110/gpio: convert set_multiple() to returning an integer
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_012106_864120_E59F6438 
X-CRM114-Status: GOOD (  10.17  )
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

On Tue, Jul 22, 2025 at 9:15=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The conversion to using the new GPIO line setter callbacks missed the
> set_multiple() in this file. Convert it to using the new callback.
>
> Fixes: 9c3782118a57 ("ARM: sa1100/gpio: use new line value setter callbac=
ks")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

