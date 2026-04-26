Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB745FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sy8YQRlXFMqq09CaaFPTGPZaqT5UhwghzbyWM8yjEtQ=; b=1vuIYg5zSdmFAa0ZIiNpwXSV99
	HPnYKUwieS5EOlHppLA/+XR9Rf3B2MvKQqRPgau50B/4r8KsMlzIo5kWj67UqQuA9MHE+lgQLY7Y5
	A8zvLtJi7liNIOYnOJ4Q28yfjEyr1GGd/AeKKk8fa7zmT4XIxtVr9kMNwZGZMNe9DO0r8o4UWK9S0
	FSMvu0JJUKJSBfR0Thnow0E023uIl3GP4m8CUwfvHownf1XAuger2f9QwuLyibrIE1jjcY2qShOsD
	1R8T8VUrZFSoXXP5/gINCJxdvpDM56C8m5m4HckXlZd+Du1OtXumO42HxkkxL0F8Nx7nTazdwUGSy
	mp/3ORJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH2A6-0000000FhPh-3qan;
	Sun, 26 Apr 2026 16:16:50 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH2A4-0000000FhOw-0JRz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 16:16:49 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-651b17f1bcdso1122804d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777220207; cv=none;
        d=google.com; s=arc-20240605;
        b=cUxNe7E820eA1l2/Ne9JwOMnu0EzK+jVCpceUUF2b+0rUpGigGvRdDL1g/pEhOXqIB
         pdvgTlIHgcyCKpsk2Sut0gApEb8uDmyKjCdHEq5ytm5uh5K1LM4GxjIHXuIinDjJYTlM
         tCGeTs5MDl9V/Mq7UF1yCGYVoRffu4pQLmT4z2BrBD1POC9RFYms2JBnonMjo29L9rZR
         ielE4UwUtKfgKuWfip5TGuKJ+jHM6RgWsgQn2MefiS9NaI5PAeDZr23YwU6s2sKfH2aC
         TZdQLCCLpEjTUG9dgt+adQr7NzCEoesxEl30bMEPwD69TXEpcXQt2SPG31SaFXDzYu7g
         I//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sy8YQRlXFMqq09CaaFPTGPZaqT5UhwghzbyWM8yjEtQ=;
        fh=O+zvtmNDYX+/Wao7g4TbhgmNhDkxg4pu8zqzQ3l/FDI=;
        b=OFN4Vu+WnDpmOgJQnZPQdhTfLOmmNBOMeNJFHjnEv8+boGHovo1jRtaTXnJuHE5MjH
         CGsYTmjgXd/5/sQAxPZwnvnoFYTu0ZU90MNZu/UOqMi6HgnJd1s5ZQPOlCk7ElmD9LVe
         suAK9YoIFtVvvfDff4ab1iuxU9Qxda+rs9LHt3OMUOXo/btdB03AoqOjdlRCQtdUQGS2
         ZUYIUxiKKrH5mGEyOigt7uvV02/OfmuCG5kHrL8FAoU+b7Q8z7LexXSbRloKA6zdCAgI
         zMgpjeU3USBchb1WPtIWIDSX5pQNKwgL2MNTcuMeN28BrUbR0QCEO/3wtHUXDQuvrEJu
         IJaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777220207; x=1777825007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy8YQRlXFMqq09CaaFPTGPZaqT5UhwghzbyWM8yjEtQ=;
        b=lYjDKmAs4JLrlasF6NDKxRW/EbJ4W8/q96HWQajTI2/B34XAS5v7v+/ZFsX6rtnwm+
         dktSARmFNDdpxkLo85dBBA7VR921h7F1+qoQ7o5/xzhIYD7cXa6nhZsdlMqcevxQ7cLE
         RimFKI0D3+wJzbwDu20/L+qD1sn6aRwLhsrHOJWRKZ/KIBmqm4T+jQQu/Tzom3W98qLd
         XKe6OO2+fiiynALjsimHSUyz0MSBTy420YZFYd9NWqy+1PF31jm3YNxDh6kE7EKM2pA2
         MoWffKWnPoYerMBbDtLabEB9DL2Vf9Vg84u9u2TQLWDXQ3eWm6PdXwfQkQyRu7UzXF9s
         T4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777220207; x=1777825007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sy8YQRlXFMqq09CaaFPTGPZaqT5UhwghzbyWM8yjEtQ=;
        b=F5GsXHNNuybzk58QGdH/RgE8zq0L14CCncneZTLyI5KHuQP9zyTixjdCdJ+ppqW6W+
         1Rg4tPecQ2OOmT68ILlqherZ0c8yHtMVSh8956DAVeQJsXQU5zifAz8fm3cxyscXjgCA
         prETKItFhBI/7n/CF1Bc/34yVR129CZeScJr5BNcxdxQCNBzvZH9n6RuOd1k3fBEMJrz
         VrFrcUpwrAPiTOaxvOEaefBtOIrSd33mW/m0BFOR/PQ+cKBN09W2snv4a0Xq+R6czoau
         rYsC6+XJr3XV8shlWk7mhAYOMmem548OAhmDTIcJdAqohHp771x8NvgJcDEvE0yNbCIZ
         zHXw==
X-Forwarded-Encrypted: i=1; AFNElJ+AjVSaTuIuNOjFkUvjW8OAlOAgrgYkvIudwgivcJtcQT/y2BpDyKecZmW5KL7/ymCfbala7oJGQT3Up/THpWh3@lists.infradead.org
X-Gm-Message-State: AOJu0YzEWRpD5/bpp7RgGtPhbdsqHmIbvcfkApIATc9l+KqRPuxAyzKT
	kizmpUVll/MBL0eYw9OaonDvC69f0fWR/cKQgJ0nnF1iHKB3t+T4V7X4F6XpQ4g7x5h6PMP6nMr
	W4rNyeBszdzFE0Dvhpz2Qe+Usci7mCU8=
X-Gm-Gg: AeBDieu20cgiCMMtrctby0OZTeTYehrL707/3XOM3U4QrTEi03KvPXiH5xAje61QfMu
	RO7eNSeNVKc9f7MX2GTK53fvOFasG2A8bZq7scR/TVmunCemM0X5EwZMPGzkM/+bRfmDmq3uHpI
	Of1oI6lq6qMNkNENmbaJVyAlXmmqlmeP5HHA4fbbQRi8OTboobyhCqoggmI+/ji8QtIGW7brE+L
	Bzlne4KMxG5qzJDn2COeCpFhcjMfnx0uFqk8K2KUdHbBVZ2BzM4dLdl7VVQ5xZYmAuVDt8FJgwi
	mOjCsjME83/RneGzwC1I4/cDyA==
X-Received: by 2002:a53:d04a:0:20b0:653:729:d3ab with SMTP id
 956f58d0204a3-65310a14db4mr18143727d50.3.1777220206629; Sun, 26 Apr 2026
 09:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260422210936.20095-1-l.rubusch@gmail.com> <20260422210936.20095-2-l.rubusch@gmail.com>
 <ae4UD-JGUarmSMiK@linux.dev>
In-Reply-To: <ae4UD-JGUarmSMiK@linux.dev>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Sun, 26 Apr 2026 18:16:09 +0200
X-Gm-Features: AQROBzAdobJWO6tfhp5JyVRYwJsSwcINrh7XtzsayxG_8kLpGQyyKxDyXpGwq9g
Message-ID: <CAFXKEHYMxZ2AP+LHyjB1dWAqx+N+bEZ=xn2HDYpmS3axd7f9wg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] crypto: atmel-sha204a - fix memory leak at
 non-blocking RNG work_data
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, ardb@kernel.org, linusw@kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_091648_722022_207B4540 
X-CRM114-Status: GOOD (  18.64  )
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

Hi Thorsten and Ard & ML,

This is just two general questions on some details of this driver.
Perhaps you could
give me some insights here.

On Sun, Apr 26, 2026 at 3:33=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> On Wed, Apr 22, 2026 at 09:09:34PM +0000, Lothar Rubusch wrote:
> > The driver allocated memory for work_data in the non-blocking read
> > path but never free'd it again.
>
> Yes, 'work_data' is allocated once on the first nonblocking RNG request
> and reused for subsequent requests, but the memory is eventually freed
> on device removal in atmel_sha204a_remove().
>
> The memory might be retained unnecessarily after use when the device is
> idle (probably negligible), but it's not a memory leak.
>
> Best,
> Thorsten

1. Actually, having `work_data` allocated once/rarely and usually re-used.
Stupid question: could it be allocated also with managed device memory? I
usually use devm_ allocs rather in probe for related general instances,
here I'm a bit in doubt. Could it be used here as well, or why not?

2. In `atmel_sha204a_rng_read()` there is the function variable
`struct atmel_i2c_cmd cmd;`.
AFAIR allocation on the heap is preferable to stack variables, particularly
for structs and any non-primitive types. So, wouldn't it be better to have
`*cmd` as a pointer, dynamically allocate memory at the beginning of this
function and free it at the end of this function again?

Best,
L

