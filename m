Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE358E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 22:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bQHiNZ2m2WhrSw8sdxwTUuPMItd18DX+vXFIh54PpI=; b=B6I6pQJ0kA5YaKPjWVzHOd8Dfn
	I8wgQ2/iq35AcB8ZHlLlRowlj7QI7DMHW8C+K6SKODU9s3gFwGbWafbw4u0f9geCcY+aXzsLVLm5/
	LqoUVD+GWkVUFN6oLY8ZUtufGMBqB9si4zfejJI8PX630HHeup6HO8E2AyeFKvRQmy/fojGFxSW+b
	nyxknfQFWC6VIeiiLDHek4O+JaGQh13l9zhwiXaat5ljtmyQDWNduqZscorKdDJEPeD+FlY5XUmXB
	dsM/grpOEXeLbTXbOrHOSUj1xQKe/y2K7cxo29O4dRj/BRjQDohBK573z4DLw55FXOaEKjUy7VLfk
	8Joo+zQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK2yu-00000004ULF-20Hb;
	Sat, 07 Dec 2024 22:08:56 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK2xs-00000004UEZ-1c9D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 22:07:53 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so1976222fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 14:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733609271; x=1734214071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bQHiNZ2m2WhrSw8sdxwTUuPMItd18DX+vXFIh54PpI=;
        b=e3tMdLKqugIFHROTEtTK6wQNngI61HNS+weILLYy4g9VjZ0lcj6TyqDBfbfBYUKxhK
         W6a2LXJNvAybR+MWQt2CQnDoQ5Eu6dJn1S3ZxCZ+x7A/WbIjQbNDqFs+LoLvYJVf4CY8
         vkunubQgZ9DUgBs8uf101Bor2X/1fz4tPZEkzsT5yBYhEZPA36LzLAd0u64DPPh2Azb2
         n+nRZGXAKGlmRsBbgBC1+R+uwZ25Uew/ozyBD8e0QwL6FGY9VbuLrZeT8h4WLNzyl9kZ
         BzSolUVMtm/uK2qts2NjGGWUj8GxqT96RJsOthSRAcfdHWm3SsBC4xeYJPmb4DL9oMlH
         23JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733609271; x=1734214071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bQHiNZ2m2WhrSw8sdxwTUuPMItd18DX+vXFIh54PpI=;
        b=rPFaIvmyWKdc/1qTaUqktJiRFVMK2WyQeccvvUe6FOwb01g5RElNjeYVrf96iynPAU
         HrNNvm/atn45iV05/mLDHMAF4v6g9iw89xzH9DEqLKFGsZVTaIxrL0RcRjOyHApq9ccO
         L7iFfsYkkKusqESJbnyiDGACzHu+Wg/myI05k+eg67poYaImqAFPqtlOMd7QmiZU8Qrc
         eCOrexaBKXALWYO4dhLpI/Ff0suJr3wNYUOsQQRn0JvFzSIrFDvu4rcwc/YQHAz2EDhP
         hyhoZLF+nxp6nJrAeOnzbngKTzaMx/zYsNr+Km7aMaKzqzUIDZGgN4IlbzC3PspKZWpc
         PbKA==
X-Forwarded-Encrypted: i=1; AJvYcCWXQdRfJ3ET0mQooZwqxR1ODyDgTnEGEBkjvNy9BtQ7Q6JDBiioqRnF9m9vVCzy44E/FTBuiBrzDDrYy+8Mdwq2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg+CvYZoPizZKyS6w6DfIu7FZZOhQvve9bVDHywtfvxbZbX6bg
	seGCREeu7vCq0VJNYt5tfE/XPyEX8gOu4tEBGad/5XcUeB8XlFZLyEDXysHjfYLFSbNHpEOO5rP
	bHe2V0K7KIo9Bi3x65qbDAzgAOTA4k97G5917jg==
X-Gm-Gg: ASbGncuFkmAWJO9Pu3EGfMSUapCZq9qT+KPBZU1loRamNbGoO10JALlbXegxnJdzdVP
	bvxO7wBFXg3Uob71gtDatjuzpIiQfx1o=
X-Google-Smtp-Source: AGHT+IEDdkAGz2pPoVWiLs3MzVT2xuohkvNwg2NzDEclu/+M3ZXg3PNHTWshr/hQKka4Uc30sPUpjOwYgYxK7wfFjvo=
X-Received: by 2002:a05:6870:a546:b0:29e:3c90:148b with SMTP id
 586e51a60fabf-29f734e7640mr7389656fac.26.1733609271371; Sat, 07 Dec 2024
 14:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
 <20241203-gs101-phy-lanes-orientation-dts-v2-2-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-2-1412783a6b01@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 7 Dec 2024 22:07:40 +0000
Message-ID: <CADrjBPrzB6H5GCN_NWcqcGhB0D31xF07bRMmoKyeZji4M2CXqA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: exynos: gs101: phy region for
 exynos5-usbdrd is larger
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_140752_437623_A0811F7F 
X-CRM114-Status: UNSURE (   8.39  )
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

On Tue, 3 Dec 2024 at 12:40, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Turns out there are some additional registers in the phy region, update
> the DT accordingly.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

