Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64144C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7WfoJdrMa7iiui5bCs39L2nw3ehuuL7qs8ypQidpC4=; b=2NM36xoLXglP5oU4qTG46o3Cmh
	E+eTXEFzIKPUa4T2A3adqaVJxFSyrXpxwlMOBaQ9gldA9Y/h5N7p/DxgYqNJHUBz6iImBCGCKfTBq
	16I0VUokuB/2IscjTfrOcs5zwSV4jTlEejU8yHs8KsinuGyrP8bgzXhGbrWiLkgxLfFVUx2kVMv82
	v9EAY+fAK/RG6/132Wz/gh+unOF3Pc4W12AWIQT13SEUYjFuptBSLGPIa04/Mib3IAru4ZyTZGpEg
	8L37B9S5rvyN+h63sbTc6ChiMu0rgxSky+4b2Ahrt59pjaE/f2xAC32ZOedZrefW8vaVvOAIKY/Ob
	Dzt7BGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Rp-0000000EecM-0HcR;
	Fri, 14 Mar 2025 15:59:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Oe-0000000Edwv-0H4U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:56:29 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso15431135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741967786; x=1742572586; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I7WfoJdrMa7iiui5bCs39L2nw3ehuuL7qs8ypQidpC4=;
        b=a1hfdXXpT3mm9OKIHOTxW2FymkbpZ3da47by40wgWSAdpwz8Gg8KkfFEyYEp1Ks5Vn
         RzpvZ5L+QbkAYkn9e6HrNCsoOs+K4DbuRsyp2P2Quhrogu2+wAVrskKN8wAjcvoR0eIs
         RF/0mDgxLhCqvBMgPr7Bgye4H0aAqFRm773byXqu2YNl+IpFgIgJgaUUdTZUJJKAIIqV
         B15xBCLPUhkOOMhxxJ2g7nhtz7wCPX/wbiAtHTnpv38LpWhd8zfm2Q02i5z4SMlwU71x
         mGgNgy+VRNoE7cuEJUm4Uud0tOfjKWVlhQbpvq0nEix9p7kTokianwYhUsM7/I/3CCkj
         LZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741967786; x=1742572586;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I7WfoJdrMa7iiui5bCs39L2nw3ehuuL7qs8ypQidpC4=;
        b=LpC+8ad6r665vi+Slu0XC3leD2nBQ0TwElZw9tJm0eZUFR9nsllD3g6Se8IvaGPXD5
         WTUM0jFAKLh/J+gs/BQpfo206Whlmw4DCcE+X/HLFeiCJINDIoUK7iQ6r31Aj51NCpgD
         UqbT72OA2akQ0+YPxmG7oRcIh/Q1y9tb5+154POmkkpQDENQQhpF//W5Ugwh5VN+O9+a
         gdYW6gVuwsEwTfukBsD3bcd1l3ycJLo/9MEgzah4FZTyzYMqCLasUAQbW9KhsL/zYTeh
         X6Afvs+7MJmMMf0pAtSs9Zg+b4YvVcimq4flDDYSAx0bAyvmCegb19tDuw/4dLa36H+a
         L2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCX24BehZuU2SY6dUB2muXapgiW6S9FuIFUc4hDTBKBpilnRkIj4ELaix6ZMwjO0qqUF+o4XKeMczC72FLYUHvXE@lists.infradead.org
X-Gm-Message-State: AOJu0YxA0ln8qgHkiRgamfodJYysfN4aeUuUvwfjNIxli8hFJXZ/5yfr
	C+4AL0dayQFJ6PMhcGo/OjzmNV1AYuesfvaNZiUlTyaM1FCGDktceOo2hd5wByk=
X-Gm-Gg: ASbGncuK7dyW48Nbaa2JvrNUInf04WC/ubCa2N+qO8nl4JofHyX4GBjRT4iBTCGrDKj
	GfpplRVz0nhr7wyWjbYXbfIc44HLZTjY3U2krM+WBAyNNl1yns/x1mlFOgAAdNw5fCGPCdPnzpH
	/oskeQefbq1LGxnf/eCcb9A4EK0q4CuiuqTwWG5yN/T1+ISPCKX8qSwcmtNB+zWVU3esJ9H8YDW
	q+eGuXH+PWf2VS38zdH8e8x2q+Bwrz9khy+UM2qrmQtb3EwFByilyPWpAVQEMN4klbalNUR+OUA
	Yamp6SKiwzQsOUiNHahFPsuLdERsQj8lvjgIW3qJ9IjmIeERnh6PjEOEn40=
X-Google-Smtp-Source: AGHT+IHCF3yVkeabT3o+pvpbobh6GwFZochyn0C61kckJRZQkd4Gy9mZ0YDU7EMFdvPBpYowc1DQVw==
X-Received: by 2002:a05:600c:4f87:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43d1f235e45mr40033045e9.10.1741967785964;
        Fri, 14 Mar 2025 08:56:25 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe60b91sm21467905e9.31.2025.03.14.08.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:56:25 -0700 (PDT)
Message-ID: <8ccfdccefaf0cd651a3f085aa78227907f03a478.camel@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: ufs: add dma-coherent
 property
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart
 Van Assche	 <bvanassche@acm.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, 	stable@vger.kernel.org
Date: Fri, 14 Mar 2025 15:56:24 +0000
In-Reply-To: <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
	 <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085628_118488_4F324312 
X-CRM114-Status: UNSURE (   9.68  )
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

On Fri, 2025-03-14 at 15:38 +0000, Peter Griffin wrote:
> ufs-exynos driver configures the sysreg shareability as
> cacheable for gs101 so we need to set the dma-coherent
> property so the descriptors are also allocated cacheable.
>=20
> This fixes the UFS stability issues we have seen with
> the upstream UFS driver on gs101.
>=20
> Fixes: 4c65d7054b4c ("arm64: dts: exynos: gs101: Add ufs and ufs-phy dt n=
odes")
> Cc: stable@vger.kernel.org
> Suggested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


