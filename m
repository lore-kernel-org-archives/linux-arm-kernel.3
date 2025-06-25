Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3791CC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O7A/YC5TjvPF+nYhT2LrlK3lJoYuXaotH9sOdtaJq4=; b=dZsCFSzr0nvMat/nkPaDooAKM+
	bzohKZ9b1L9u3b8DNrLzEyToBiDJCZODlkaZ5fE77PrMEFsdRqP00sbWws8sKgY3DN7ulJJOKsLT9
	Nwt6oMAzvJFIaxOSzBbTxf4Z/0YwYGTbqiRsFWqA8D5huiu/V+vrbN98c1+el4h7KWSfQ05ri/6Nd
	7kSsQecpBn9NgH2iI1FSpDWWObQNQirjzCkovvHbmNcAZKcCVaxKgT4pPCNEMSml62MwyNxIrEGt7
	LHIV4yVJVGkKIMIDY9D0KK/AEYXDBJH+uCYBKWDZR882OSMwkhlSNxm/bywhYIp1lDzm85g7E5Rgw
	g/KIZVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXA0-00000009vKm-1ewD;
	Wed, 25 Jun 2025 20:56:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTsa-00000009SPT-47B2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 17:25:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so57377f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 10:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750872347; x=1751477147; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6O7A/YC5TjvPF+nYhT2LrlK3lJoYuXaotH9sOdtaJq4=;
        b=wVH3D3ssc5lk+T61R3nD0IZ1ebKGs0D66JP6XVVIYhpNpSwkBusS82SZrZvD2oA/eN
         ps9ElJdUB/koPbD+WWMbaglrJB1vHdpgKdoep1SAvhB9wIdJ0CZDmC/CEfAb20xzojQb
         E1yBBY5ZEHUm7641d7GzeHzLUuqrSerQcoe/IPPnLaNaLxvLmRqxXWIXRcBlr+1DqWaX
         e4dhPOU+FyVkE2Mrv6Pp5t9SkHTXbE/ObynWYp6oYwGhtS/3X2ufepOpBjHPvLf5wXtO
         y8Zt/Ns8zFjKxqOJVROOVQLO0K3N5SeysnEgqp5QdKNUOLq93IBPrc85uneT6l6G23Pu
         wzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750872347; x=1751477147;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6O7A/YC5TjvPF+nYhT2LrlK3lJoYuXaotH9sOdtaJq4=;
        b=uXqDGSIcV1Qu2cp7o6kQRBoSgt9Du+f5YpSJQnlaHeaa5fraHnm27ue8hpbYG39+95
         5HBRfVAmOPoMmV0msYDMuETJuDlPGaBiqrp1gZeApTYEkDO6+cCQzwOlE2DyQPgyUOJ5
         DE+Te9ZbIZZcyWAkjszWLpzlmPCCaozqncmofoz6NlFVsw5+1UDeWGBKgfbfL6thjb3E
         1TodgC2ZmrsEfHhiASXzhPnUyBZnt2AH3HbMu5WCfSPKTD0ENJcJhGkaaEGGJuzzv5rd
         y8f860Jrfd2iRA0IkejboogHj2tDe55ZV/E33MF+ExRI4BXQtM8OHgPX/8nWqKj9UDgr
         0s2w==
X-Forwarded-Encrypted: i=1; AJvYcCUtefWI3m9VYsVJ24L1r0ELQOdNk2uVlKQe7mn7RAvFnQYVa5JO46E8x80mMHC8lc6Jum3XvX5Rui1h/fmwITKg@lists.infradead.org
X-Gm-Message-State: AOJu0YwO+i2jDXdbcNLdM3JtgJ0+x0wX2r78YahQwlKtJ0qmd3pTZ4ay
	r+SKteeomfJtxtu/FqzesKadGvMW9R3OhzChUBXqS12qErko/tySS6ZVkL4Sv4xBEOM=
X-Gm-Gg: ASbGnctQ/xgE81PNszejbi4lgEOsN8dYmsx4S1LVw+/HffQhVLWKTuvkjDbUtEu5Msd
	918CHtKVPEcHoDyt/S6PBzTRTsLZpk9dLuWkmns1mW0o3CHX15aCcJdprMCazkweAPuYkntG+3b
	ZXIHsZK4Ww2Dxu/GrRCDfkI/ymaBYl+INKkSbe7XkrTv2W1d25q9Z32VJtwZhajyweNvQnL4Ex/
	uWOKhiMNJ4ldze5XiQLOkqX8McdtECCjnvrcCt1BPSB5TCrvCx1Qd0mLH2vvUXoOL5pMuf+eeLR
	zO0bzevuXoVMimQPh487lZODipeJkJNxVnHsDOzo7IfSPR3hr1WyX/FwfkQ+mepNxwLPo3KpEf5
	x
X-Google-Smtp-Source: AGHT+IEWqQYs8mY+5uoMYCKPajkMpm7F+LqZUiSbpYVGFaDjaB+825h/sM7EDs5jZzTatPcapcPi/g==
X-Received: by 2002:a05:6000:4186:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a6ed64bdb6mr2932119f8f.48.1750872346775;
        Wed, 25 Jun 2025 10:25:46 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b6e9esm26240185e9.28.2025.06.25.10.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:25:46 -0700 (PDT)
Message-ID: <5113e57e0475a62f2f50006a7178377c508f9403.camel@linaro.org>
Subject: Re: [PATCH v2 0/4] gs101 max77759 enablement (DT)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Date: Wed, 25 Jun 2025 18:25:45 +0100
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_102549_038619_10DE510D 
X-CRM114-Status: UNSURE (   9.70  )
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

On Sat, 2025-05-24 at 06:21 +0100, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> This series enables the recently merged Maxim max77759 driver and
> updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
> accordingly.
>=20
> This gives us some extra GPIOs, and enables NVMEM which is used to
> communicate the requested boot mode to the bootloader when doing a cold
> reset.

Friendly ping.

Cheers,
Andre'

