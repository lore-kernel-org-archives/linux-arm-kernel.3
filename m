Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB39E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUKOALEI9aeR5s2n5lA7OidVcoOap78G2cp261c2lTU=; b=tkFwyPnos7Vvb9Q7f3v4z/U2rN
	+zQO/4rBq/Ki/TrE1c1H/TrRf8VBAXeKLhqg6TSHpQ7ljXpbB92sBRwBH4jdEPpKniY6Dng3LPSSN
	pR6wWDkYEwUTSYfflZ8ZHG78irS1b7vfTCCoXGxvIAKqhJQ1pNsAbrWixkVqjbAAyYN5viXzarmqF
	0TcYqcKcuzIljaOArU6poZ7P1u7CZ1GIgC52VROIAYF+upekCfzgNxRVzAmyIPIgSij0cUkWzCcmy
	fce64cJtDCOQtMofGcJ2Nbsr1uRCoemgQIHsPzLWmTdmkJMJvKHCtsJIEvCiU8WO1h5fzrYTW9S2f
	cngpvygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoM2-00000001cn7-4AUE;
	Mon, 06 Jan 2025 14:45:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo3e-00000001ZJ5-3loU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:26:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso103417975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173577; x=1736778377; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dUKOALEI9aeR5s2n5lA7OidVcoOap78G2cp261c2lTU=;
        b=GzPRG1AOpmHlIUrnAj7f8dudbhhtVJYd8qIVqbxuDZ20OmuA3fuWSkGQisFQpHO6BA
         1X0hdnQ1EOG6IhDD67m/nYtHHrnW39cZuAUdEhTY/zrB/TqSbVB8TeuA3F3/xMB/hmS0
         mXHdGtRwQpwy/0xOowN1pMEk4ay3/MdniAcYe+D+ZM4xOopdTO7u05gl0L8hQPhVymW1
         lQMKuviVgn/5G6ouCesBYiNuekTXVyZgKlfuQWmHbzmySLJTPu1hcuy48lVcpkDeq7G2
         FGaOJyG039q6t7wlR3xl3zqADkQ/oHzHfrejjoHcHWqYDHJCG9YNaxvrE4jHtsb0f/ik
         f9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173577; x=1736778377;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUKOALEI9aeR5s2n5lA7OidVcoOap78G2cp261c2lTU=;
        b=V/4SHgzJGULAUyJNThuLT9+WE1sOhWvvidpvfMyozt4vrNpZ7673KU9f3IphuQq6+p
         b73Q70ji/0dupUTwaP4vgv/bovMtFsmRbfoOinb6OaR7UMno1Ye0cq0bDPOU6sQ1bfI6
         1zvRufvDJy19vi0fG+fb8B9bIkHprmTUGhLyQHi0HTW0A1NU5EF6++X3YB9xCvFrqHK/
         uHDz7YRWdIXtYlS7z04l2vnwFSYMpOxC2dq6evDu2h49PeeOgzLuFY+13QDTKCWTAFD6
         Yw9KfK+pFfiStpPxZgOwa25mSdgWn6HJsvMiRctCa8kbU3cRhFt0WWvGEdHOzOt5T4Ak
         pHDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXph03L+APZ4/U/zSjZy8w5SoKdp/VUnOXcLTI0zGyzmbclgSUrjJ6mDqDWWRtBif6jroluiaoOEo36jLnGu89g@lists.infradead.org
X-Gm-Message-State: AOJu0YxF2E1jOzCngg3lWePoCWoI3/jRNA/hmgwJ4Gk3o/W93C0FjPcu
	F8SdRp0pvo55opQJf87z7QR1ZyEvWaMOI2fBy1rPjs59By7uVCQQHdEcqsbbXMo=
X-Gm-Gg: ASbGncsj3GewC92iRRoTYt3cBvSeO8YJP8KRcJn1BVEv6is+MCJp8m0OgjwSq+lUA2Y
	mzSp8e5lYi2AZMT5uIsPDNB0JtKfCz7NCu8HDsKHHcR4It/pI0kZvgixdQUbZZzTbG7xil1fPDh
	KdwaLf2q8mzpYbzOpjuhNfJI9WT8chaWryWxnsBjL/i59uLoLUQ6UmjLeW/+BfQGbipHCT+dYE7
	iIlXiAOsrfSB27D3dskUkzeokXv1rIAKXLWhYHoJ2RZY/cV0ihNUAX19773eg==
X-Google-Smtp-Source: AGHT+IHOkoMdmjm0GLPL83pp6L949p18auYRHzM3lpKZr0E0SW/vsqJg73EGdk1dd+rSaqR5yz1Q7g==
X-Received: by 2002:a05:600c:1d03:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-43668642e70mr462080235e9.8.1736173577487;
        Mon, 06 Jan 2025 06:26:17 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm576014055e9.7.2025.01.06.06.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:26:17 -0800 (PST)
Message-ID: <75e01bf815e5f7692d4b7aa261054851a943fece.camel@linaro.org>
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
Date: Mon, 06 Jan 2025 14:26:15 +0000
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062618_940838_96DE5413 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi Vinod,

On Fri, 2024-12-06 at 16:31 +0000, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> This series enables USB3 Type-C lane orientation detection and
> configuration on platforms that support this (Google gs101), and it
> also allows the DWC3 core to enter runtime suspend even when UDC is
> active.

Friendly ping on this series :-) Do you require anything else?

Cheers,
Andre'


