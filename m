Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6031AC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+lWu/Bg4y/1hXkYeBGzl87ktHtA28/BQP0FvLsbWBU=; b=f9W/SZ0328SIN2yB1Mt7XO3XbJ
	0wmVV7369JlWsGoFwzQxQJAL7DxLQ9isfsjRWWErOLSeUIduM+C+uvak423a1gyjIIb4ivVzLHnxy
	GBN0wCIrnNhr5X6TjJ3IbUiCQrMpEtP+PhAIgAZW721lO9RI7G88h/ccbLlcX42eVgGf9UVU6UuT3
	DPBbiJb7WsQQj+GGvb4N55uO61OjLRT4wPhBs4Ge7gZ/KtQamjZVQSfE8eIs9RbSrucAIPV2JguLF
	+7vsHqJDrWY54AhS5n91vo668j8pOQIjFkvSf+hD/xmlL0PovKRzilsBcSMzeIk2L0hpTY9sYSAX4
	jajQ4SDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTDr-0000000A23B-1y8n;
	Thu, 13 Feb 2025 07:01:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTCQ-0000000A1nK-3OOG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:59:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4395f81db4dso2659385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 22:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739429988; x=1740034788; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L+lWu/Bg4y/1hXkYeBGzl87ktHtA28/BQP0FvLsbWBU=;
        b=w2nkoYBkU6Gs2rbJXOSWA9zrYE2TgT/7i56HDg2L9IjSV0QgNbfIBF5j1p8UN1CZ31
         yxFV8Q9xZAGEPBW5H0LrfiWa/xHH3SUBCnQ9wCDBdEpGfXGaRuQE3/DcBVnxBcaFxiXG
         e8t0E2/q+780xE4xAgtJan8jDXBt0fQaPIb2e7x/AiKiufXvERQMj+3FpkBG8Hn1DTYf
         8xqrLSA37OsFOsvFDos7Oq5iZXfjRLEV/pMlUX02tIsfP63TR4wqUlsPJXWtGGcW2s9X
         V778ohwqb6HXAaO9jWB7KrjBuG9gNzkr+wM/98kR8KztWcpruxh7YcDGK16f++RW43Md
         BQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739429988; x=1740034788;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L+lWu/Bg4y/1hXkYeBGzl87ktHtA28/BQP0FvLsbWBU=;
        b=icMROHyGg0SwPEJphcgbSOwlBz6mp1or13Afhw+tFQMS0hFQz8eQZeALPd+8bdg7c4
         wfpiAFHeYt0+VPKdWVG9BhIZj/t9TNCCoZvVSh9aEn4a45cpat47AohlPjdcxFt8PnMD
         sKQU9rkeBdouRsEnWs3UIk/MfsdGiYCSmQg3xBrwnI6vUHeySQlUwGZTLd/frH380NF+
         ayOc1BxeadJQogZOXtteZiHnXMjw4iHmup2DrMV5diLWC3L0r1Z3J5cCdgfTET1i+mZe
         V4vFnGEQS2wCHRmyJAUUcOksYX42eAUEbJBeycvZLBXUTNHlygfHKrRsSmEbct20fGqf
         S8pw==
X-Forwarded-Encrypted: i=1; AJvYcCU68U36lBaZGz4ukQC1skljBVm7kuhRdXOqWQo0g4zyCUe63lCEgk3G+m+dsti45O5h3JawApPN/Oam0l/zR3er@lists.infradead.org
X-Gm-Message-State: AOJu0YxcRRwvg1+++wDMMcKk+AmkBzWYxMq7ZIFreJWBIH+yhG8SAVMK
	jOhn320yAq3HCAYzJx14+ojSFz9a2IwXpTNBZXzemZZ06z2xMmJmVch2IDQYlu8=
X-Gm-Gg: ASbGncu2aE4tM4js18YbEjDItg0hxGB1ZAEij2fDVz6kdIo9B7MjBYMmyHFfzsicdHM
	NENH7moDLzcS8uDgWtElKfhNPHX6RkloQynhYnPh0ky6awyi9fm61Fz3kqSKJhMigj3JT+7Enhy
	NOrZoKe1R6tfoU4c32xWvAfy7LNH/5/DLxwVM+xjLnAA5HRoYnkWmAUXBF9bwJeRFFyBABD8TDB
	zDVQ9EfUrTXWji1Dj3QSOlaJSrJteCYJqWgdbkFk3RLSbt67crgHce07r6jI8zXf6B5e00NPmww
	GMsy6OdQIBuwPybPtlo=
X-Google-Smtp-Source: AGHT+IEcIbIDDwYQdOV615CUjCJxgeMnQC+DGesANA1ClWsaF9ced93N0m+sAVSXmRf6DZmkMUCY+w==
X-Received: by 2002:a05:600c:214:b0:438:a313:cda9 with SMTP id 5b1f17b1804b1-43960c068d9mr13823075e9.10.1739429988348;
        Wed, 12 Feb 2025 22:59:48 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f85c2sm995229f8f.91.2025.02.12.22.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 22:59:47 -0800 (PST)
Message-ID: <f5f6194db4d3ab2e61ef8800531475af1b5680d9.camel@linaro.org>
Subject: Re: [PATCH v4 0/7] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 13 Feb 2025 06:59:46 +0000
In-Reply-To: <75e01bf815e5f7692d4b7aa261054851a943fece.camel@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
	 <75e01bf815e5f7692d4b7aa261054851a943fece.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_225950_853549_6FF72F2C 
X-CRM114-Status: GOOD (  11.73  )
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

Hi Vinod,

On Mon, 2025-01-06 at 14:26 +0000, Andr=C3=A9 Draszik wrote:
> Hi Vinod,
>=20
> On Fri, 2024-12-06 at 16:31 +0000, Andr=C3=A9 Draszik wrote:
> > Hi,
> >=20
> > This series enables USB3 Type-C lane orientation detection and
> > configuration on platforms that support this (Google gs101), and it
> > also allows the DWC3 core to enter runtime suspend even when UDC is
> > active.
>=20
> Friendly ping on this series :-) Do you require anything else?

Ping again :-)

Cheers,
Andre'


