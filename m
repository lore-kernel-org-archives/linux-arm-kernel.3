Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D613DC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 09:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mO7U4m0oTja17D3RFzqvynDUKnVhiYqxVxjxnWasqbo=; b=2V9ct9gmQueGR9EeETHp7la2VI
	pDWf6O+ne7jX0K3L9tjK+E3wywnBhCKirC6nTpKA8mjEzAxpUcJTaK1VEcR5xRMeK4GL9OwdV9zvu
	ZHJfD8KXPTwYGyXKUoAOJSHULqeJH0S1cOUXAt8q7ylOat6UgFvkojXN/0CKS9bimNkpFKOneNQvQ
	h2tFF/YfCUJh9eHl1NcM6gdPUHBqa6gKymQz+LDWSGkpSrrc5Nml6Op+yGmLEwFUE5d86A+hv2pJk
	R8qiBzoMM5YvjU66V5J3SsLfXq9ZWYqq+27lBcalGDMD0VkXixlic5WO+UXfjWWWxTSMf7rPuY6EA
	k9wUINDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNCY-000000083DU-1GMH;
	Wed, 26 Mar 2025 09:37:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNAP-000000082vB-2Ves
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 09:35:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so63290435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742981720; x=1743586520; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mO7U4m0oTja17D3RFzqvynDUKnVhiYqxVxjxnWasqbo=;
        b=orO5A2GZDez43dqTyI6+gWphaDc1VqHpqPDRUayisjysGfUs6G5t3Va2RoQU9Z9rND
         zXxOqFg7svj/OmzYy0xiXuU4rxHgNUnEDCjP8T0b7QaDZ/lE6tsui5JHaqOgAwI9jhbz
         LRNKozWNWY7CeTtkr2tBqidpnrHFeLz8/kl8DnCKK0Kf2fGB+X0tnSuKhh1AhQs3IIix
         AFtT6SfJiWHGz9+r9VPFtniU6rXuUwoW6G6RlSqWWqKlL+kIqRPbhvDjLX/YL6Ql/sWw
         W4BKAme3zyNmQk2GZx7J0kRTILZjGb7YQqq2QmurNL7/cLyYc+RF53FhV4O1W2EGaUrd
         SESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981720; x=1743586520;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mO7U4m0oTja17D3RFzqvynDUKnVhiYqxVxjxnWasqbo=;
        b=gPMLAqQ4Qyhkrd4iMqeQYeEQR4HNGIAF6xYj1o/1goCKwRWYVop0eIosCEl+9aBonL
         SUR7tqtQNAnB0ViwSvhxpBE23LSdxRf5wkheSoT5nwlBSZA3w4bIZqo95QmuMJj5vJdM
         1Arev8y3z204pPOz+nBK9sZkRrL7/hvTFsIhAQYXcB9aKrveRyBCdiWwYxJ9IDx4iIVS
         qsNfjXESlvJ9oxS3w4i1p2eCSTP4sXbNmgKbC66bGBXX8lMerNygvdq+c23v8KtNEEtg
         4hRW/YMHNSrUSqjB19b3rgXJtKmt0FZAYfjRUI4aTLukzSPfaUZJMHTKI7x0vVOQUBA9
         DHzA==
X-Forwarded-Encrypted: i=1; AJvYcCVmvvQUZQ/WH2FQ5qbLdXS6rd5ERqIOu/zgshUghwxDtmevo6UYnblRUyEJJXlHyNViBBll3dE04ORPJ6U1gRff@lists.infradead.org
X-Gm-Message-State: AOJu0YyDeOEwu8UowoBGv0+GDqGdJihsSS7yW8KTzzqS+fa06+4NGKeJ
	D6qm4BHyYW496mrlOXcq7908HgAoRhce/Yt2e23KonrvnLu7JZ6HpWzghbwLG+I=
X-Gm-Gg: ASbGncsqu5yJeCRh1RbQd8sCptmeP0r0pdeFbNa0A+2DpQ2frUu4VAru0hbwBC0vHY/
	wgEqMEeLGnYAIQk1VQB4WJCcckhRFw7TXxnFojqLJierAdJTXu1b2aNz9UIjqKwd9RFWkR3M9GZ
	H1Y2bWi4VQ2tZZGkFmc6autdYN1cjHUFjJoxxwIaXwB/VD5PXAbQX9+40ZAIkPaaJNeLfd+SuKu
	85XQdavGOUOp0F6iOxSMHYl/zEs0jwNmnTt6vAeVCoid1fK8YmXGpCAzvCyp1XIx3LDvOw/Giwu
	yQqtayEcg8+SOHLAww/VGXZskM/e4tdk0njGrjl7RGa/cQEipA==
X-Google-Smtp-Source: AGHT+IGcfQ6I4FNrJirurd36EI4HsUJuWVwi1KHS1E2yEYqjMI56gm6awQtr8PEUURenI12KJk6YUQ==
X-Received: by 2002:a05:600c:c0d:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-43d50a33d03mr152636725e9.27.1742981719714;
        Wed, 26 Mar 2025 02:35:19 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f32fcdsm232615235e9.7.2025.03.26.02.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:35:19 -0700 (PDT)
Message-ID: <40a8d82aab764669cf755adbabac80a5c0044a5e.camel@linaro.org>
Subject: Re: [PATCH 12/34] mfd: sec: add support for S2MPG10 PMIC
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Wed, 26 Mar 2025 09:35:18 +0000
In-Reply-To: <25eb9c47-96ba-4037-b320-af16e0226f4c@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-12-d08943702707@linaro.org>
	 <25eb9c47-96ba-4037-b320-af16e0226f4c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_023521_642658_367F8E2D 
X-CRM114-Status: GOOD (  17.04  )
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

On Wed, 2025-03-26 at 08:22 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > Add support for Samsung's S2MPG10 PMIC, which is a Power Management IC
> > for mobile applications with buck converters, various LDOs, power
> > meters, RTC, clock outputs, and additional GPIOs interfaces.
> >=20
> > Contrary to existing Samsung S2M series PMICs supported, communication
> > is not via I2C, but via the Samsung ACPM firmware.
> >=20
> > This commit adds the core driver.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > Checkpatch suggests to update MAINTAINERS, but the new file is covered
> > already due to using a wildcard.
> > ---
>=20
> I did a quick look and seems fine, but I suspect small rework when PMIC
> becames child of ACPM, so full review later.

Thanks Krzysztof! And yes, there'll be a small change to support that appro=
ach
instead.


Cheers,
Andre'


