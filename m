Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1305FCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=; b=f/SsVnb9muuVFLAjg1EplC2NoI
	UNC1VRtaWk9aMnOretmwIFcMxvQtUcGh75Nxgt6Mj/M2jNWoQ9I6yijxAIZwh2WbF16KVPtWQ4nbc
	h3G/1bjvJ0NqblWHXzBwFkn9cGJXat2Fo2z3l6FxoqX5JpuJzRzB9JDYn1LKfEvw8fYXMTdCJFu/d
	kCMsU4ZATlKS2BeayWs/ZBPoZwJAAHz1alDICjr9upS0li6P9WtGFtvfmLJR8vopezfdFnl3je2MS
	mYrLw8C471cIUX/QmS9UcU3sHXEAM5UjqzAYxhTTsTS72hftpimJumcRx5+0CE/3qSerfYcUA+yTc
	kyD7+WLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuAS-0000000EZCt-40QU;
	Mon, 20 Oct 2025 17:59:36 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuAP-0000000EZB6-3z25
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:59:35 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42701aa714aso2862924f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983172; x=1761587972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
        b=cJloZ6xIVOjGd8nO4qEJ2XkNOjUG+V+5w5+LatV+zMtss7xhlXzKt5aA3EKnfHluQE
         Ekacm1bRJ8KHy6w0lp0KTme80vTtU+FPnLazFw+1WF00Au3dmTApJsZL1PF02HE845rj
         S4W2QhWBpHVe9SaekhNLTl3bccfUKgPlUqOp9qlKuMlbIFFV3JbPHLYNee0740zgmvlt
         A9zl2r4Wc0tcFOFgZ21RZHvZKLkbU7dhPt8Q4kFvWIMlPQmi2zMBNirefmRt6ejCmq36
         YODktvHIIZnzug2cbbunNQhwdXu7Ar6dTKPuI3kyLkS+dFdInh8ooCZdXzifmU0EeLLk
         9F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983172; x=1761587972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUreeKtpN2WmnEqKckespxLIC5wGlm6WN8+84n04a2c=;
        b=pbZfma7TV8HO5iVIze1tXjfkc+pCzKNRhIYrElenzCQSb2mF4gnImTu2ncyHIjsD7z
         K2MfsmK+M37Kz/zo1RjAlRaLcz7oLFAYmCZSsLLMrgU2uBUrWbB+1xuqJgUBI+zt20iU
         4H/CQTh4E7ji0sH1NLDAGuMNVTBFOiIJd1aIoORmcw21HFDdeuETRjCtMG12wvSLOhb/
         gJPvgui5d/tz9tF9jFob+uGuENLH4J2rrXZ6S6gt4y6L0palw+qapjP8U1Gztl+uZL64
         JDdLGrYE9Fcfo33cTNRANFbgtqweRkbIKuaFonNFKkTcrCZtLOhtUZTrPQhrpNpvHAQ7
         Ytpw==
X-Forwarded-Encrypted: i=1; AJvYcCV63WGSa+QMM7X4V46Z0KjL0UVwKiJxJmmFNgk15aLm/RjHS8VhmlNGL459mIsZfk6IImne6lHyk6nEcROzUy4K@lists.infradead.org
X-Gm-Message-State: AOJu0YxcPhxG/AmNoGRhBwmLKuBb+0xlMnAjQh2mzxoo0h3v6J4RlMVm
	5eX317BT/vas+a4s1Ui0STG04KFxpNJQMdUjGdE+0j//tNZoNF8/Nj4x
X-Gm-Gg: ASbGnctstVtb9lZFeB+kkveUHPH/y6zflPUUeBvq1YFhwMCEaWo5jNIT9R3czZdPknl
	G/wamlq90M9pnYw6jf1uuKYDQNSSCzA/zsIytbTI7ooMFiBXmfabnwuH+phFRPOngPbr0dB9c0S
	9o3MI2LQeHpzR6KKUT3KWGqBOoSbYnBFnBAA9qp9n/1C+Kq6w4BLhfrNmVBSSupZorlAfEKExb2
	+/AFfzSIauvsKK7VmPfVS+SsgfCA1vDB7v909VPpnyW+y8Dxreoqikdm9Hl3y7pB8+WHnDAI6x8
	Pk5vRhKWjT/5C13ng59ZxnCTdJNjzI2FHVZ4nfsXdG83mYlGeaFb3xUBtkpJJgazpEjCG1NKTsn
	7duVhSEC4VXDac/FQ5SDW9fJ4rCt2ImpnGyGeKq1nSvd0Ur1mgySFC4rXlBRlzs9jTvQJGf3d6H
	ren30ib/eetkYxZmiR+jZbXrwDO1pzRYplZuJLdwgNF0DBMftzu3H7VUICEw9szX25XLU=
X-Google-Smtp-Source: AGHT+IHtpDIuvy4/yF6LdQ4qVWSEOm8AetCbAHS/ajv9TB9bfuiRLOt0expo+wltP4XyjrMHK3544A==
X-Received: by 2002:a5d:64e4:0:b0:413:473f:5515 with SMTP id ffacd0b85a97d-42704da2b6bmr9352936f8f.48.1760983171751;
        Mon, 20 Oct 2025 10:59:31 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm16822163f8f.28.2025.10.20.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:59:31 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] arm64: dts: allwinner: a523: Add device nodes for I2S
 controllers
Date: Mon, 20 Oct 2025 19:59:30 +0200
Message-ID: <3906069.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20251020171059.2786070-10-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-10-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_105933_988746_B987C06C 
X-CRM114-Status: UNSURE (   8.36  )
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

Dne ponedeljek, 20. oktober 2025 ob 19:10:55 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The A523 family of SoCs have four I2S controllers capable of both
> playback and capture. The user manual also implies that I2S2 also
> outputs to the eDP interface controller.
>=20
> Add device nodes for all of them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



