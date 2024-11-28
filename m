Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99897D690EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJydo/N0RCxorz7FjsZl8RX10xfc5cfOBgBZq7KiwDw=; b=k85eFmzMQ66h3buz1iyjRVyMaN
	Wg3ru4iT7ZQPvIseeP8GJTu8mhlXWmlK7VR0PKMU70LR8lTNkr4Yn8ITPIibP1Yi+PZRJKCZ3b4F9
	EWML38OIolitzvAjCgQmNGEUCG0xtw/HHUqFZ+p/SlvgzBGbXs/M8jtFsnJsLL9/2Lz4OcOf7ZEuD
	7hgt+NCA/f+mmDyW279x0N0yal23bJcsqwInSjIr9M9bXK+C16xLnMi75RSnGHSvhA41GKBa9NHCY
	YH6E5fPP5SDaD+vBARNBLJKXYJP1FDTCNK5YiS/titG2G+0fs+3Umx7c5BjDcNMgT4HCudQbi8w5C
	AcBrhFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZzf-0000000F1Lg-0WdD;
	Thu, 28 Nov 2024 08:35:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZyh-0000000F1C0-0lNH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Nov 2024 08:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BJydo/N0RCxorz7FjsZl8RX10xfc5cfOBgBZq7KiwDw=; b=iMcLbwHCV91ZP9Zf5CHyc0kdNb
	5FyZZqH13gHh5WPI36XBepNf3xAtukLhH5JREGP4pGuMOdXJj7YwpNkxHJxqSjcCA9Fdqu3xEzout
	T2U8fgpn1KqigdxtCGALy9Y7XT0oNAWjClHcXXItZFnNx75Ci2ognPNLIS5sblD97thCPR5A3lECT
	OrasEcxuHweri2Gf1E6Wq0UZJ5j3OPTZ+eTymp6G2tq8ZPe3BO9UpdWCIG65hKXiGdDEGr8ksa6+W
	uRT8OueG4bzDxgf4c0DxT+IIRQLXYfAKKUkXskWvKP8rNhm5ac+KG2qv7pHoAgVoKbk8mtSVJXRHu
	b/O/gSNw==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZye-00000001Ypj-0ROZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 08:34:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434a45f05feso5824975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 00:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732782858; x=1733387658; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BJydo/N0RCxorz7FjsZl8RX10xfc5cfOBgBZq7KiwDw=;
        b=VRJ68b/BJYaPnr+8AcD6Sr/Wrb0vWcZxw6nnl30CBxnI6G/o4N1G326NDwxs/n3yXJ
         nZ3tE9O+GxZlaIf3A5DG3+IeAR7u2m+HLnY0guepmjrEeN56ZS2l8AMWwE/rslT16aev
         ImJsTsa+3TekqwoP24Ird16QACtKj6Ytf+EU7tgqR3+fUD7cv2PxelU8tP/Q6uZ6ydFD
         +WJTSfnRI2SYAYNs3peR8SDCu+qFuiMc9Jtb9sBPZ2qfUDdsvQtS57Y5/kn5MJTX8RE2
         yWT6q/6PwtKVDsTCUy87QkCn5Oad26+VvmGnCnIMjuBjddOXZBFI2soEarEBryQShorl
         TbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732782858; x=1733387658;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJydo/N0RCxorz7FjsZl8RX10xfc5cfOBgBZq7KiwDw=;
        b=iNqIPiFuG888YMarrS17JQ1EKJj1Ly6y7IpgYdMdmckhpD1pUgAlRpddguSPVbSMCd
         4Wr60LOWDO8AA7ExIbVic/oiNzdPZz827T5DwrqgRgiJ3H2nY9dQddG9Ev547HddxiIx
         QPVfc/XB37/1znY/d2dJz6bGneNrBvp4XOYot9FKfKE6QTzsRN0xfacXaZxR68Gmc8+S
         IawCnBDkUDInJ/usLNTnaKAkdNZ88ypbAs0rFIJJ1h/XBGZuvBT4oPvZkVAlaSi+WPfp
         MxNxz12RB5b6Q1BW1dkONBRrPSythaU/7XhcZblFwGIFRos6dQ344d8JyhEf7qdITGaE
         KYSg==
X-Forwarded-Encrypted: i=1; AJvYcCXtRuGVY6FYAihLN7NbMQJBQCQ7ppOtPmibSJXu46uTxMe7RCncdv3EHy4I8a2nzPSaSRc8Ao/SkxB7FbG2WbrY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8XSpYt9hqs1nRAptYNVE3oy0M8DRJQvekxDMlXz0lBbpWTzJ0
	5v7I6b3dIamqaSxgqO6IXBKZ4B334+ELj6aE2SOoVabQMbwP/7QTVYM4YkvfWwI=
X-Gm-Gg: ASbGncsqfEWY55AiByO83REVc4d2wd1lotbttJVRhxArVuqP+8xUrHmZu/mdKXdpm7I
	DWIW+5GaipgSNoDlsNN8ARArfsyj6OrzlCBPLdNwqjo+rM+glDBDVMpjimY6znnlPPyBAXPjpsZ
	s3BGdMS+t2PvpEEhyeAcF0iT7XfNpd1SA8f4UNa5BexpnYMxf8hmvaIWCiGBI5PsqcFUTRS7cpK
	CS666lwOEXST7fNMeykIwjTipQ4Q/PvdOm5w+/YsbC7ie73n3c8+rA=
X-Google-Smtp-Source: AGHT+IEWNg3QdUei30keeYiiUfx5K39BlVHw7PFW62/wVTw22KyFYt43OlFY45o054oh1iBQoTX/4g==
X-Received: by 2002:a05:6000:1865:b0:382:46ea:113f with SMTP id ffacd0b85a97d-385c6ccaeebmr4797397f8f.10.1732782857620;
        Thu, 28 Nov 2024 00:34:17 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bc11sm14705755e9.4.2024.11.28.00.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:34:17 -0800 (PST)
Message-ID: <4a5c27922a9852c06e1832dcc63b4a448e8955e5.camel@linaro.org>
Subject: Re: [PATCH 6/6] arm64: dts: exynos: gs101-oriole: add pd-disable
 and typec-power-opmode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>,  Alim Akhtar
 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-samsung-soc@vger.kernel.org
Date: Thu, 28 Nov 2024 08:34:16 +0000
In-Reply-To: <7c013e0f-bb8a-45db-a5b5-71afc0ddefda@kernel.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-dts-v1-6-5222d8508b71@linaro.org>
	 <7c013e0f-bb8a-45db-a5b5-71afc0ddefda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_083420_459857_94B4AD95 
X-CRM114-Status: GOOD (  18.19  )
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

On Thu, 2024-11-28 at 09:21 +0100, Krzysztof Kozlowski wrote:
> On 27/11/2024 12:01, Andr=C3=A9 Draszik wrote:
> > When the serial console is enabled, we need to disable power delivery
> > since serial uses the SBU1/2 pins and appears to confuse the TCPCI,
> > resulting in endless interrupts.
> >=20
> > For now, change the DT such that the serial console continues working.
> >=20
> > Note1: We can not have both typec-power-opmode and
> > new-source-frs-typec-current active at the same time, as otherwise DT
> > binding checks complain.
> >=20
> > Note2: When using a downstream DT, the Pixel boot-loader will modify
> > the DT accordingly before boot, but for this upstream DT it doesn't
> > know where to find the TCPCI node. The intention is for this commit to
> > be reverted once an updated Pixel boot-loader becomes available.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> This should be squashed to the previous patch, including also combining
> commit messages.

I contemplated that, but I didn't in the end so that it's easy to just
revert this specific patch once the boot loader is updated.

I would prefer to keep them as separate patches for that reason, but will
squash if you still think that's better.

Cheers,
Andre'


