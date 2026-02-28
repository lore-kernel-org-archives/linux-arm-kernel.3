Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89E8FEE4F4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 19:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCBZJM2fAnD/3wRO5BCr9InnsCPcuxyUKxMyds7Z81A=; b=XXhFf02Wwj3XN1HROfe5rjKd9X
	y9AW8Ya7ZhCOOFJEas027vMEDaiY8tZn6R3UuFhNFt1wgX8fcule3ZBGLv0yM5ZcCR5Fvfp5BHhgP
	fBMXbrNApLePdIatBzpiyA3+GCQlfvrn9PchtrscXIn7LLYkeDU3xQ/DOfnBvjwefcp23loX3Ewad
	I4y6AuEtNtDMZbGcyBMHyTQ503Aln0CRSzF7p0uKbrqegi1TKe46preaHzroQ14HUMrr4xYQZMCzR
	mfkrwWC0A62zA6EAwhWsQLcCkNUVYcAyHw1YMLBeg71wS5e670+L6IdLXqNC4AhjNPcf9dhWXYldt
	pVEqCO4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwPjV-0000000ABUQ-2AMD;
	Sat, 28 Feb 2026 19:12:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwPjS-0000000ABTh-3kjM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 19:12:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-483703e4b08so27027455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 11:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772305924; x=1772910724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCBZJM2fAnD/3wRO5BCr9InnsCPcuxyUKxMyds7Z81A=;
        b=iDPB7HIIk1jPEZXj1fIFOw79wqtWheCX/sEXjjAtwGbunBha5+yLfSogUsSam601tE
         +WixvoRfnFrOTGZBBIOx0+NuY2MxTWNIrEk7e9euy1sBZ7YtnmE7/xE2aYxMTvo/a2nB
         +VnsNrbEDyj/eFzazTSV8pBbPmzrL7xAnVumcRVciM9NpcjQSQfW+0jKVs0vSN38WIFT
         2AHqT//dPcvz+9lGjk39Q2emu+4h6YAatOB1QImTLI182372o3gl2CTqLuQij19maMSX
         L5u/BpvSc+rBnoL9T/CusKfepHNekhtVlweete7XsU9JnURW8R/cH2YS+Yd3oIumHwq1
         XbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772305924; x=1772910724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uCBZJM2fAnD/3wRO5BCr9InnsCPcuxyUKxMyds7Z81A=;
        b=KlCE+C6aV+sYA9TTM3rLaN4oKFYo0DwrkV6GK4/JXhoVoNUgf5h6n/55RQwEoSQc3H
         fMVZB3xnGSZleAL90cKR5BvAczTMzjxfVKjb5Hz44hfaNe1kw9GZ1wg+iujV2VBzNevR
         iGplsAU7nmj19r4G/a2nrSmfkXaHq3c2OZybrHjHIt29qX9h2pwPQecBdhRpA4/zJ7UO
         4FyN4m6Cj53iyFD+QMiIxN+Buvh9YWsIanI48iYuyK8PxCQKZhnnNx/E1nApQ7UUCM7C
         sCP/jOnSYzD2jxnL/D9jjBJUkihqv08vpxOgHVMTq35M7ibXm5WIJ98IjdH0wEYvE4aU
         qtNw==
X-Forwarded-Encrypted: i=1; AJvYcCVnBNNrvJ3f7wC96Rr++3B09qGooz+Btwgje6h1jcZgBez9SgtA4SttpOSgdFeshTfmLH71MPpiSY56BjTtSqoQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyDR1+JMzPTBfc6lOhNwJckoTASgDxe0PAiTendZ13aufK2o3PZ
	n2/RJVHU/Brhe3BR2EPOv0vn+OJmBUnfhNAWo47kdMR2UTBOzqxFDocN
X-Gm-Gg: ATEYQzwOJyJLmuilv5J9Gk0Lb/o8Nd+3ldljCMsixaGQO7m9tD6YKMoyJ9nCJF7l7oz
	VcEz5OXrtRNh8ZeCe7vwHqot7+eB5IXdhkqtT9x7qN/Mm05hJ7ljdfQBsEiL0IjuPyY2wQj6owA
	kpyS31KeWt/mZTQhvtnbw0OEQo4RigdBqWcEPGXEU/9/to5C4FvnXRD0sOHLDcrVXPI107cEtI3
	fiu1JTCIBBHhoA5yg0dpp3jXxu8zTKV6HDBTar/fdSprhP0s7GEe7bCD8YvIdI4uecHQZR4tA3W
	HmPui/PJ78c8HfLGOr1zY4ESZIikmD9Rn/7V33B5thZ0Br8JvshL5MmtUpOaAy9mfdxUVJB7wsJ
	jnEgQfF2fPFlFOqof7kqtYNJ5hRVzl6fGB77vm/t5u0a6Ytyrkw+VONUmm64A4l2GztGQmK4NQO
	AzrzegdzxKE8oG2+0dRhxa20c6tO0sT138Cw1RzlIu2Pgf
X-Received: by 2002:a05:600c:4e15:b0:483:29f4:26b3 with SMTP id 5b1f17b1804b1-483c9906a11mr129611565e9.1.1772305924223;
        Sat, 28 Feb 2026 11:12:04 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb85c58sm89513845e9.9.2026.02.28.11.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:12:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: sun55i-a523: Add pinmux for spi0 on PJ
 pins
Date: Sat, 28 Feb 2026 20:12:01 +0100
Message-ID: <5968992.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260227175157.2339758-3-wens@kernel.org>
References: <20260227175157.2339758-1-wens@kernel.org>
 <20260227175157.2339758-3-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_111206_960587_6F3EE922 
X-CRM114-Status: UNSURE (   9.34  )
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

Dne petek, 27. februar 2026 ob 18:51:54 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> The Avaota A1 board uses spi0 on the PJ pins to connect a SPI NAND
> chip.
>=20
> Add the full set of pins. Even though this board doesn't use CS1, other
> boards may do so in the future.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



