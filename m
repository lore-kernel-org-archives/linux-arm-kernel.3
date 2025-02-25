Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB388C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymU4Q4V4l8CtxCLaS6y7/QU30Qeo8lyZjvxMHRi+AeI=; b=MvfAEXYCEZK57TOzF6MjwynNzY
	cEufVT1p7EgvVP4dbbUv37HXnfcv26YXgV5hh+TvcZfaWxllQGFawc/TWmp2J2mnP1GtxtYtBxuOZ
	sNfaKDxcquOvXf30N1QnNedoo0sz2e1KKknwLg9IZJkv7mTHNR7ibj/rMyvARpE/mG1L8jS+blMsx
	S8ovSAgfYjfwqXuJtX47x35rLCTZ0vPphaUIfNRTxs+iuKMfr7FRlMDE0NPYNaCY9r7as+cfVeSTi
	C1UmY/WqP1yTTejaFaPJps5YpKG1oLgys2Z/StAedr/7kOriw9lVhPMvWkZZSQnJblspiaBF2T2Oy
	S6N5MU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1l-00000000Mm2-3gFf;
	Tue, 25 Feb 2025 16:43:25 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwrg-000000004Yx-3yjf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:28:58 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5461cb12e39so5540765e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497335; x=1741102135; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymU4Q4V4l8CtxCLaS6y7/QU30Qeo8lyZjvxMHRi+AeI=;
        b=CC2hXI6Y3hLGWqK4lWOirp4sLN9PkNXWU3Jtheu1auFAt7e97kkRxVEGgdbZy7hON0
         +xVYYLqwJUsBNjoJIhCC8okNNbFls3ZoFN+aHzUVO9FroM+fNAQejUCoQ5lvIUlXm1a7
         ywaBxLkB69UdecPpTVjVyXyPSztLfWCNS2TiykxVb873cHPP/e2dDVvtzxMAasUmV1rY
         NQYSlSlr/cOCO9J74A8gonkaGWI1eCE+CPOU4yN1ZqkbqA+bZC6cTGVKv5Jlc1POTedy
         ur+a3qVS7LHIOZOG4WhH6PGDerHAPLGyGIZE8GWuPcZUVeSdXBCg2EiHw6tTi7PTK2X0
         O3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497335; x=1741102135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymU4Q4V4l8CtxCLaS6y7/QU30Qeo8lyZjvxMHRi+AeI=;
        b=iCAOm+S3SOAg6UiZS8/RbvKtJObJMue+Qkso6P1wrwgkkRfRCHZDap9QeqZZQmq5Kq
         BaM3/ZMLOUMFLQPxnBd3hSAAsy5BLa9yI1Uv75sBjUHSJu7DB6D/nTdfuPMolTSE6AR2
         wzrAgt0evmm5sJ0NmZgSoJJ1SJ0cGxKB44rpYk01LI8KUX0SdxdJ14M6wivNHqgvExyK
         VHtmXYAl6uyGn/p3yvjKPRV5h2wtu3pkyN/mLigFlSywQO+Q5WOaqnLq/kkozi5GLjzd
         eVdorPaJ6Kdqq3QcDh/rMK64rWX7j0o0lk/0yiUWwtJ00t48EdBnleyVTVGmS2cVcAKW
         OBzw==
X-Forwarded-Encrypted: i=1; AJvYcCU/ng0Ki/TEUzlw1G4X5mBs9x9CxPTDP2YSoZO8PZh0JlRl+wTF5cv0xdl0sET9oHyog6m1UDJLi1rprL/D554k@lists.infradead.org
X-Gm-Message-State: AOJu0YzTv+DtEt86lLlBqy+uRRtl/XdXULz7OE5AxqNtcnwQXNEHLjxu
	BS31GJpH00gBfB4Sfo9bUE0LiSC07rMzw9WAN4BV3BIA0DVCqNtiMTplK0dRhJsOTK6iolF7cUG
	V4Ei9OlBG9fGAsw8B94DoJ+w0O3bSgJiNvtdmaA==
X-Gm-Gg: ASbGncsP1IfW0IpoWMRKN8H+pE58NukXkdEFpT5RKRI4jQ+Rt/KEDHLGic+ueM0Sq3O
	Zh3zwwwl7RzaJLiokoN8cX7FOB+Qlnv8JtmIUmydV91rjs6RBrz21XPqw1fOhIdAcIp/YmhTGbl
	waeXyKhTg=
X-Google-Smtp-Source: AGHT+IGvQGYbThJryHx4S9X0G/hQwdXky4NGM+IG412kF+Oob4gqd5qSVYxirN603Nc55xdy612DJLqmzEaxlENgSHw=
X-Received: by 2002:a05:6512:3e0d:b0:545:25c6:d6f5 with SMTP id
 2adb3069b0e04-54838f5c9ebmr6533494e87.53.1740497335376; Tue, 25 Feb 2025
 07:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com> <20250220180427.3382482-7-vincenzo.frascino@arm.com>
In-Reply-To: <20250220180427.3382482-7-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:28:44 +0100
X-Gm-Features: AWEUYZmYCPdOL-kTocm-qdrcGGN2FaHnyCLLC1DBvOuBsbs6HM0zSb7Of9lav7c
Message-ID: <CACRpkdZorvRd26+BPXpz0U26b0AUD4Z0PQ4RyoPi0OPyR1KWGQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] perf: arm_pmuv3: Add support for ARM Rainier PMU
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_072856_995688_916EE4D2 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 20, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> Add support for the ARM Rainier CPU core PMU.
>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

