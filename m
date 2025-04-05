Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B53EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=; b=bEO2KzyNgOeQLLM4q44qBQZ8N/
	Mwfu0QiKDxpLDbNR2Q2eHpEmF/b7Isau1q13mAB0TKzBkbs+6C+3dc7t++/WltwfNSYdcQb9z6DAt
	iPlv98sW9BALowxw2apgXVao2ggdYy49gVCJQQG7fxmAsxPFMto+miEz7LL/kjdNBWhzc9aqq5fBL
	eb7nBVHJHueoFyWOTeUw+wZVv4eUHt915ymbe9wT+vVtrmDP3sdEnOjUu3B6HeLxbXujqiXFh5zaz
	isQSkO6Wjd3ShXDDkK4uxm2XywPTDkaA4T0GZbeia+aYUfF5NQdXiLAACVQr3O3OjFM+LkJBdZNNY
	7lBAbCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u14Xy-0000000E4BK-3Ktc;
	Sat, 05 Apr 2025 14:30:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u14WE-0000000E3ye-22w3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 14:29:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39bf44be22fso2031738f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743863349; x=1744468149; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
        b=kyvCqO4pq01kvKBVnSvOdCcJL5v2XXKEh8ef/ZMhLawVngH5ZM4mwKyeyF0Vihk0Kv
         a6JH1FLWrBLySquqh528fh9AbWyYCB4C+khxlzG6aFB0Jpbuhj/ptRHloaV+UulvO9ZZ
         rWatDdzTyvluexal2/CVJYdj19ENVWzlYRE2uIf9YUeArUPi2fKG397xQC7lHotjyYgO
         Pj73avqdHoQ7Ifpa0x5gLL+KUi0rV3OtAoN9wW7ZLfzHyjbDc2h+KM9NqIwlMSn3equZ
         dv6Pb/sD39Q8h+QfRx6jk91eXmDo+oVwSfXGECthB0Q2CJyhDtkqyaFX75fYMoMNaaY7
         CdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863349; x=1744468149;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
        b=l5bc2rKzee2XKKTzJfqALG0qzDwWHroSj64uBqP4vE/6mO44IeLfjhIdcG3sLN8OsS
         60WD9dTuAhtXCA9D+O63j0e8ELPnzBtg/Kqyxzp+EepO8Vm2rbAPWJ1DRtRKuWNtiJ0X
         Vfo1QbFOt85VaxKtj3UPT8eYbwMS4k/Xw3YtwlYu8LjZ+o69C+paweSlpapjx3xXWkpj
         0DJKdrnNjBknUD0j26hs8jbDKrERArQsPvFWqtzBITXIDiojR+1ft+nGpUSSdzcYW/rd
         MHAIE0JQRAoaakVxtnBwX5pMo63aH6TALKQ8U5Pkbn0RS14vQrUn1YW83ol2N+NILiAf
         e1OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDkYmeNi2UOfCEM/z0oYoKsKpc2djkRvICZWmUkK01XFztSBQJNnRkNpWsZ1J7HeiMo4tMQRMBtBuESnGJvh4/@lists.infradead.org
X-Gm-Message-State: AOJu0YxND9DoMcrmZC/uchrhWmet+gqulclKuCntocOkMdAWCjovpPZ6
	hhkSFU2CYQa5b+IwjGDN4qBjjsgj5tXG+ZGaVXb3vfSJRyvaPqIAsPHNL29h0AQ=
X-Gm-Gg: ASbGncs3YYRTBv7s/wjoNqDe3nFVGy3xKRGpWbhdePi4MEcTPPRNxHzu4CHNmjfD6U2
	KGgp0PMZQxNrY/BsrA8OPzxU0FXwIBMT8Gj/e5aiVmouhACLheZmdkwHDx6X9zn1rN5F9k3NYZR
	+v9pDrI5Gt0ffPuZIzAosJEgWqhb9L4ZopE2E5xTs/fbPLuqse17gpPj1cUD0WuODp/7KiN++l7
	UbFKAEyz7RI0tnVFeCaydzhDmpkyun4ime9YFBcrG82254MKAcFcI455yQAvbF7DQcCUpKTy4BV
	jjp5p+lgBKk49OqCS16l656tRa5FQ3wd+JXdeHKXdV58CDIu
X-Google-Smtp-Source: AGHT+IG+Z0ir3xm5RCrAq1SN4ZDlwjVRgFNS1Hr6WM6JjZY4zAku9AfXOB4reUpFaHMAVqmVf3D7Rw==
X-Received: by 2002:a5d:6d8a:0:b0:39a:cc34:2f9b with SMTP id ffacd0b85a97d-39d6fc291b3mr2358345f8f.16.1743863348783;
        Sat, 05 Apr 2025 07:29:08 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d63csm7230344f8f.69.2025.04.05.07.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:29:08 -0700 (PDT)
Message-ID: <73d99b656c405a19f75633796b696cc1aae71b90.camel@linaro.org>
Subject: Re: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 05 Apr 2025 15:29:06 +0100
In-Reply-To: <20250404093035.GD43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250404093035.GD43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_072910_526256_D1DEB3E8 
X-CRM114-Status: GOOD (  13.71  )
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

On Fri, 2025-04-04 at 10:30 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > This series adds initial support for the Samsung S2MPG10 PMIC using the
> > MFD framework. This is a PMIC for mobile applications and is used on
> > the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> When you resubmit these, please note that MFD subjects take the form:
>=20
> =C2=A0 mfd: <file>: Succinct change description starting with an uppercas=
e char

I've followed your suggestion regarding the prefix when patches touch just =
one
file, but for patches that touch multiple files, I've kept the 'mfd: sec:'
prefix, e.g. in patch 18.

Hope that's OK.


Cheers,
Andre'


