Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C5CD690F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+6oOaM0s6Tu6ZxZFSf1VxM7YfIeZpwsBu0bRCHSjm4=; b=ffaEoBdebgS0csB8ZaScjJyEnf
	LcJoFwIz6Dug/eh4kYNzSuSTSmUBYBRbKRgPLQ8UnrB5fcP6WX4oTygRO0zJuZ6N89IBpfHIsgTQw
	Dl/lQ6Q0/lq1Th9MIP+PbdIHoyOieyCQvnDqYh9mlnpSwZT/I3dMaPQLzKR5yNKsb94brBC7nZpQ/
	G6TEHt9GaPcVZx+w1vk/NY5LclqyG7E3rU3kNpEuZ+GUOEyERF2IRUsSM4fNcU4M1hNWbOzFnajtE
	ZA6WWepbkxTK2giSCNu8RV233qan0YoCPQrVjBIFJwdAXSZHxZIXp5bZfoISn91bAJ7qRfRKK97zX
	Mwl6NAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGc6o-0000000FIYb-2W0q;
	Thu, 28 Nov 2024 10:50:54 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGc5p-0000000FITH-0BjE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 10:49:54 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-296c237a121so444635fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 02:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790991; x=1733395791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+6oOaM0s6Tu6ZxZFSf1VxM7YfIeZpwsBu0bRCHSjm4=;
        b=QfdKhMagrcpzWQ7RJbFYCphv1iEwpg93F0tmLRFKiICkk2P7kOiRUsaEiHsnkvjD1k
         EAlvz5GTGT9RhiNX3faINyWWLVjSSTau0KaeR69NKNfba1KjicSV9TAsqkp0sx1kKk8m
         LTBXdUdi4qrgJ+AeSqNEhercP8FhWbVqvSlJSougdAcnHlPjcgtXyb3gPyILSwPkbMtg
         W7Dx0isW5RwYuDISjaJjT+SFtrtDBf+g/6pg80v6MoSGFgeEUZRaCohBc9jQFdtcAER0
         sCyR+1q1n6qJU1zw5sPKbtis05vHsuxlchDhFwydk1xKbFYPc2dQW8GWh1cDFHlRvhed
         nCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790991; x=1733395791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+6oOaM0s6Tu6ZxZFSf1VxM7YfIeZpwsBu0bRCHSjm4=;
        b=Fdkc4cq2de8RzkB++gMyg9UjjnOuGMjyI+aplp+NHn24KKSd5xkhWj6QabfzO7pSiN
         6HxyNrUjW6y7FLZehjY7ex32RMB8MCHU74YGX/wJfw9KZd/Tlk+pNbwAlbEVOOhNa+bG
         lh9Qw8Yw1wAQfsFKOiiQpIZpLmTohS0uZH9e+GpXNzR5au33gSHQbKLzwjvNVIm8XRjA
         0gHHFYkU/MmSY0a56UPaXH/+ZxWcEFe3lb61b4r/8DwGEKJRBJG2CglbU6o8V4KPXMRW
         hCbKun7JQ/HGNhPhYTQKBfcg4vyuybxraXDppr+DlCqr3g9xuvu+LIlc31MV1lPeq7Qb
         DFhA==
X-Forwarded-Encrypted: i=1; AJvYcCVxDFkZSPApkGGxplQZJKsR59yo31vcejDjlSTqnYlx1PyqePnBV8AbcgOi9ycNo7PKn0Znwe19O+szeNLiDS/u@lists.infradead.org
X-Gm-Message-State: AOJu0YyF0w++IKPEtcR6Z6oL0Mowki/r+rpqZqeUNRQgOFkwcTlfkKvI
	w47Ml0ll1LlERC+qLl45fqIRdbkPsMrT/Dob8A9uRBNWbPmmHjqH9YMCdP40cPPj4flvNzGuqWb
	8hm2O44mqD/81LU31RQjAR8OYh1TfuGwU2OcDhQ==
X-Gm-Gg: ASbGncsDuH6g2OBuECCqtjHei3S6AfEoj8a2UHQLrZjhdah2A1BFukqOHcvm9Y84A5y
	vDb+reOtFAgHyqHn2NzvaLXHBDieA301V
X-Google-Smtp-Source: AGHT+IHSW4AauQXzPQcYvXTGYQGOqaCzi/aJx5YRC8Z2JJs3/8I5KClVLNxBsZmq2QaZI74lTF4hFwtZQD27MqcFr60=
X-Received: by 2002:a05:6871:e7c4:b0:29d:c8fd:cccd with SMTP id
 586e51a60fabf-29dc8fdf378mr5912643fac.2.1732790990078; Thu, 28 Nov 2024
 02:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
 <20241127-gs101-phy-lanes-orientation-dts-v1-1-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-1-5222d8508b71@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Nov 2024 10:49:38 +0000
Message-ID: <CADrjBPq3vJmHh9bnS0u=d_aTeaRH8Z00JqgBfkqjQQ_Fv14xxw@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: defconfig: enable Maxim TCPCI driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagan Sridharan <badhri@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_024953_079519_DD02D982 
X-CRM114-Status: UNSURE (   7.96  )
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

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 11:01, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Enable the Maxim max33359 as this is used by the gs101-oriole (Google
> Pixel 6) board.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

