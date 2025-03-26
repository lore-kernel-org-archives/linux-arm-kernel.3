Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76096C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oK9w0PHHeYSQoiTSBw6ii01fBfUomipWqhc0pGmOdEs=; b=Dub9It5ENOyn6Tzc4lxCOiNXCn
	C+p46qXFPplGcpjZP4YxuZT0df0myVZx6HZ1UUn9jJcPqjCqtqKnRmzzBM7VVnEVyKbIvok7tf823
	VC/4EAvgGFqiVULPwSQztM5MriRv0O2fHcMu7lrJDYfx4GB1mW6NkNDFthMfzue4F6HIhxvc4hkcv
	fZ8+0nI4ZjebWNmxQGl8c9Oek9ZeTD1QmQOGJJUZaR9G0Ft+P641TMg5IxBA8IpLuhVddBN2zdJy1
	nYI7jUeWqj1QRFplWFAVDePPWp3PY3C56Jt8JewEYeb6Ilu477m3XiYWBbvP+wJdrPmDSrqC08gri
	XeWEZ/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNJS-0000000843D-2QQJ;
	Wed, 26 Mar 2025 09:44:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNHc-000000083oA-3M8X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 09:42:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39727fe912cso2364137f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742982167; x=1743586967; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oK9w0PHHeYSQoiTSBw6ii01fBfUomipWqhc0pGmOdEs=;
        b=Vs7aNnGeUwaOOf1hPXJESTX9B5zd1jh406LGHcVNiR2Iq7aLQoMCz9EmaWOv3ska4e
         QrI9SN0fnCodkvwxQGGt4KiKuwDBpEfmZ5heuQRjxvK/YM3E3yRKI3w2klClCgKQTp3m
         09vDbs63dFxHClPxyHxByqNoB79p/Em6QnK7Vyxgr3+zz0ZjglD3f+bVXmOp3SEZFvjd
         8MbYC+TSmnO7L/FO0RvwZnh8j6fV7x5qw8N2L2UqvPyrNlIhSZy9oVSIrL0PYfdAA/M9
         qkvr2gKLleHPKW7FmjzO4x+ghgthLFeipUFpnCpQoqZHLvLNfJbJ24EzwtkPFJ7ZFQ+i
         vYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982167; x=1743586967;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oK9w0PHHeYSQoiTSBw6ii01fBfUomipWqhc0pGmOdEs=;
        b=u97rUULNK173y0efqkzkGQB8V+zGHReqouwLTdSiNT1pahRqa2VOmjSHQwOrGKMKUR
         dilL3b9oN3FzA3O3fR/9aCYyGi1A1KMYcpP/CwIQENg7jywR930BeSbjTFIzoSvtycx8
         sROssQUbm3GZ+1qnib5uxbscPJ6raQq5IwZZoGu7CW2/NK0qpet2n/nsiw0ceZnoICMC
         N+xAVGBFrJJJmbLq9pHsdyuygKiW0tVm4w0ubuJyAVRr/q6fZUnzQQ58FESyXsQSlzK9
         CrcRJCStu0yCKaW9E3bUY9J2+Jd3NjX9wtV3LrpaCmbR8dnXY4OBnz6WdNPkyZE3y5hc
         M88Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIP0ON7QdV83UyiWidW1CcN81m935UpYXoZQYP7jupq/aoPOWF1e6oKa17eNMEWuhfnbraU6QQyC0UxC8uR1KT@lists.infradead.org
X-Gm-Message-State: AOJu0YxoAzCWxgQrud2nYUu3J5PhUa6IYBaxfOjpUB4wptI95dp9Kyd3
	p7LWSScA6Frl8xfZtCXjGyfjRYmchu+0JcPpN1Q1buayheRR1XPG2NYqHv/hhAA=
X-Gm-Gg: ASbGncs7IU7ZjQH1iWl+jwTlMzChMAXWsoe2MIVRy7FGeHgdDRLQuj7+61/9H2zmCA6
	qdKiASMPc4p+zwvKIqOrjUY0epHp2irzzWw8XH72TcgODWs3Es1YJMYAEweY+REXpxYFK8KMho3
	sI2NYBApjr7IEm31LGlU/Qih+jILhwiiAOSOEudeogJMt2jwLkCr25Xb3tUSA9ejdcTFNe/CosD
	nuOhvRfFOgZwwkWc20etn5ibReIWdXCXTvMAXF2JFUV+kojH0SqA7fUemTaHUHbaU8xpkrPFwHO
	zlKF/cf+ZtEZJBC6iZfAnGcc0m4epS7aPrnMBSrVLWdsp2KAcw==
X-Google-Smtp-Source: AGHT+IFPYFB/K6M208ce6TYKpgzYD2gbxBVrga6S1jcpfDNM/sLdTcLlHMBJoMx/mLpGmNEqFLCYBQ==
X-Received: by 2002:a5d:64a2:0:b0:391:2c0c:1270 with SMTP id ffacd0b85a97d-3997f8ed9d4mr17888571f8f.1.1742982166969;
        Wed, 26 Mar 2025 02:42:46 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995778sm16406564f8f.11.2025.03.26.02.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:42:45 -0700 (PDT)
Message-ID: <53e7fd763da3748dbc7a5205b4f93cdf9476aded.camel@linaro.org>
Subject: Re: [PATCH 15/34] mfd: sec: use dev_err_probe() where appropriate
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
Date: Wed, 26 Mar 2025 09:42:44 +0000
In-Reply-To: <e3dee29a-dcee-40b5-8bf4-22a6a8a7993a@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-15-d08943702707@linaro.org>
	 <e3dee29a-dcee-40b5-8bf4-22a6a8a7993a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_024248_841386_E2C64E45 
X-CRM114-Status: GOOD (  11.81  )
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

On Wed, 2025-03-26 at 08:24 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > dev_err_probe() exists to simplify code and harmonise error messages,
> > there's no reason not to use it here.
> >=20
> > While at it, harmonise some error messages.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Maybe such cleanups should be before you start moving the code and
> splitting modules into i2c/core/acpm.

Sure, I can re-order them. I didn't want the new PMIC to depend on
all that cleanup, as I believe that had been previous feedback (but
maybe I misremember :-), and also to avoid the new PMIC being blocked
on potentially contentious earlier cleanup patches, if any.


> Anyway:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!
Andre'


