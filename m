Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A04C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=; b=2oHAP7/SRkhFLFteGwE+4y5ACN
	OlEOrdJSUJnCQXi6mN00VE6BkerD/uQKrLZ3BGfN9b64R+1bPwJbsoYVff6I4BKG/taSFSiaF3/MU
	cJDinI8xr9s6uwQySUPLujACWVyPrNK6dXN3Ha6BlX0zZboOyCXEdB9nhDF9pcd9LjoCygH4jMzOq
	DMKbE4tLq3i/EEulcy69TSivGgHj9x8iI3M4mhDCVhAA8gdEWLtr3qdtTdOowhIZC5zIvkwdRuO0M
	aYOkUrxJhMwRzNgXqz3zlF+U4KAUTMruE5OU26qzkeHkOlEIh3K8LjNaQf0Jn5d5ESQGeFae4Sxun
	1uVbHvEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBD0-00000006sX1-3gRA;
	Tue, 24 Jun 2025 21:29:38 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU91r-00000006a6k-0T4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:10:00 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-32b435ef653so6404051fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792197; x=1751396997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
        b=Xd2B+NgR8Fb5v/3mX1LvUEyiOPMlECmz1mXozn0nYDy62Xec4alFBva/1HUZE1Aj/H
         K5YlTrJtkSXkU+XlnLjYZNufGDkWe4VtXpv3OsAZM5QBawYmtWmC6l4iPIvxAHIMN/Mi
         qZ1Zo9qevZq+eAEdrZRJpRyWJBUhDUW3hAaNQ8tYvrAvU0+GDixUs8c0pz3OYXLaMZnP
         XErq0vcKo8Hnc+nj2y8q7SkviL8X3asx1vcqN1e8zy+7ULaQBFWjieKq8vOWnGKTAAp5
         PbUwMZqFBFqSwS1CbfAMZqpljfxNgiBYapC186+QRoudWSTC9j7B5S/sXN9z+p+EbdkA
         oP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792197; x=1751396997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
        b=FX/w2+spewxEF1E2VV9sAwP2cPT5W7Gtv//Q/A01jxUusOF/FTxyQ8s/hNqrTol1//
         JtNH7O80OAiLdy2/vOtnHC9EGjpLsT6o1fylSBKVLuHYW5fb7icv6UX3uB0jlz0Attrx
         RMYqOuH2HPHUNHHUWmzgF8L/A5tNO5DaVwU/XBM6kY/cAuU0zXSuPEgn4gJC3QuILzSO
         i6Qin6WnnLo43H2mNEhE3Z/5Zziv1fui1ildS/JsHYCGDQ44cvMk6SavyBC+cVz6uCz7
         t37+kC4s+gLBi2GYR7J2SfJKxP2azibffOu5VUeWMqDUnLf9T8tAl1y5317Z1akox3QO
         GeGg==
X-Forwarded-Encrypted: i=1; AJvYcCWy5x6FhSFNv3qdVivc/4mmcPux5yjIrAHDm7KdDpcd9Q6cnRkUnAdJ+kjJTiQ1VQNnrhPgCuZnONTs7tOR9L7Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxnNWg8xUMD1dGaSPajc6yTtJsZmoYi7nnLMxtp07MLjS5WOoJr
	+gB3gCFHUzDQPyh3nOakYxctsBPeKg0ZfpHFJYCT+563eb2G48eS6ltJh6pv9M6iRm4z/1hTtrb
	293uTfVrKX91TKPQuSs0koq3lmewBd7sGizWSJRSRnQ==
X-Gm-Gg: ASbGncvMmeJ4LZRldywXZBD5QUy10S+tHNsBOMqsskLoDMTFbU7pmVnfYuESiTvOpux
	r/actEg6dQkswPtTy+5qr7I8WUc+4fv6+EFrY7xASD9fyuLIoPxzEor2bh1RuouTa+/hEdQC2Q4
	mKyo5CbB9pL6/uMVF/zVHoltE+3o1YrOO1SPDJWzD9zjs=
X-Google-Smtp-Source: AGHT+IFYV5tWfAirZ3xGznpIUaLpWBixuh3VvEydLIyjUMUfbNZ+cH8IGpZnstfzUOBltBpSOosISbHrdrVWXJsPv9I=
X-Received: by 2002:a05:651c:4181:b0:32b:8e4a:5710 with SMTP id
 38308e7fff4ca-32b9906d535mr47675041fa.34.1750792197208; Tue, 24 Jun 2025
 12:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:09:46 +0200
X-Gm-Features: AX0GCFugxTy5C8vSywb43SRY5CIYHYmTk1VMWuSas72eq14vY73ndiufDbScINw
Message-ID: <CACRpkdac0sg82LFV-Ub1Wnbpq2jTWgAVXZzCdTqLakV_4GkFbQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for programming gs101 EINT_WAKEUP_MASK registers
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_120959_151702_62042866 
X-CRM114-Status: GOOD (  10.35  )
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

On Thu, Jun 19, 2025 at 1:18=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> The following series adds support for programming the gs101
> EINT_WAKEUP_MASK registers for the 67 external wakeup interrupts on gpa0 =
to
> gpa11 (alive and far_alive). gs101 differs to previous SoCs in that it ha=
s
> 3 EINT_WAKEUP_MASK registers

Looks all right to me, I expect Krzysztof to review and queue this and
send to me as a pull request.

Yours,
Linus Walleij

