Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90714FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=; b=b2hWbPHEMQoFFOQ8EH3x+ZI6tb
	ujzjYA058GUX0D4QE34BGxitJeoU8VEBuNRZXNwom9m9VY0R6MRTUy4l1kJ9KLfOOFp4XHavI4o8Q
	hg70pLO3Ta78r43P7Qt45Gj/CKlydgqWpOPoNhN4q8ztxUNjlCZG/2/R+uyFNOabOLcc/k608/6/s
	M9kcRv7Umxz6YCoBo6osP0qO+kHeirUAoXQbrK3wUnMzssHHd+sVCc+F0pKKBa5WcIXM9sVfnF/Bx
	pJ9llIVsbETU1CanCwPexdY/iAHuzkCU3C5e6P5J1Qea1izGU5ihpRO0it9Q9cNKYnSVmFFh5R2da
	KlAnU4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKITo-0000000Gqm6-3OXP;
	Tue, 05 May 2026 16:18:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKITk-0000000Gqkv-1G2Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:18:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44e1860558fso1673497f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997914; x=1778602714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
        b=PzcEZMUkRxmpONLyW2/s3Ihfm5wbXLSOFyoA8rtVHU8KwrqqT3Cctb5qC9BpKMFxCT
         l5z0VyAw5nSLFwjY+2YmSll6stAqsyZx7+2SkGAzHjZ3yvbYvbtTrLDMKVny9rrRRnq3
         jO/EUTJ+Sm5dZ8DiLJ06mukD1PGmrpmOSCITcUPRF9J4a06raRffWlGvRbK4+i5VofPu
         Zcypf7I2pAI0iHz6htCcSRTxYZi2EetlnEzfdq568i8egOiNMwVMpoGAS5wkHlK5Ugwu
         snI9iI83hDHRKcoLcT2lMWizQ7PSNvjKyQM1MnrEpcyD7zEvr9F5MGQDXKO3Z1bqlheS
         /Tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997914; x=1778602714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
        b=BkYvl5NLgQsIbYa2ZV8aJtQhceeu+0kI5vBQ6YoLtVTTtpPJufCYOZ8LyB0Ijlx5SU
         WfPHLNoG8ap2sS4qRe1CRQ2ncAZVeZnSvGh//tao/iaB9J5XBAkorh5+aTfgFbsI5hXg
         S9TU5B1Z/TnoszkRfihW0Bjr9a8YFOAcgQszgFED/0gK2xy6f5FQKDJVCqO/qBqRl78+
         cz2Qz6W4aoabWIoSCrrMbrtmVSogmQfBSsHmfaEq/sTzmJI/+qsjHrZQRmyteiWRr4Ol
         5sqgwhRl2u5ttF3R+J9gBZhbDEGkW/WAebEDyAVdVHtxSph37gRuXDXXI2y8AlYao80q
         I2fQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IWq/z6MC5kTfx1Mvic/geMWdjxA9bu2Vj6GI2qySIqUvqBO8Qkqsx1zZ1fcesEPhZZ1bOqEiDlDsq3r31mNUw@lists.infradead.org
X-Gm-Message-State: AOJu0YwyOGcALq8Nzh/9KN0z3OPemrq906yLb+gUvFwW1355sJQm6H5M
	VImU8oSKoCuwfaQ0VqfoMbWYrqzv+VgvAIfelue5et6ZS4qxjqgEPrmr
X-Gm-Gg: AeBDieuW/pIYs00ub8X9ENkvt+t244+IX/FDCUpKG8kODVmU1DI7/+C6KnkiulonTyT
	xcjNtvA6jrjkXaeziZEprNMotJMwR2ms6QCHAMBjZ3V/PQkGbAr26Uk9hIsqHSE0qJ+Ial9U/Mx
	+xo4Arvtw7l8EHxUz07FncArkF3S0ug0OS1WgJhoatwaGF2M4imEHy3rYuHIXb+pu7ac9WTt79z
	6134JybR7krMvIv3sZnBSovGclfwVg0rjQM6OU3nGehmXw7HHY/Y3tkE3nzOACTDvic//4J530x
	kqKqiAlmKFrG/Oe4BfCud1I2rIMhKmzFdBu5pq0tYT/VPGy7mzdlurlGQzZzsJmxr/BuybDOoCg
	GCTNVzRJVlN6ojB3OPEHJUeASGEeyoDAc3YNX0hdJd3/XkK6JMVeiVvz5JLdOxyDEpMb9r4jjap
	0/DaB4fChuUiniC+0Bm6/KguN0fn4yslmuxBv5n1Chi+oBEnSKv8BNR3J5BMhVVGhsNAeyCfkq2
	0qAxFFaNdg1q0COG/ysCkxk0J2h
X-Received: by 2002:a5d:50c8:0:b0:44b:cd2f:a3c8 with SMTP id ffacd0b85a97d-44bcd2fa400mr16334421f8f.4.1777997914315;
        Tue, 05 May 2026 09:18:34 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960aa2sm5411552f8f.29.2026.05.05.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:33 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for
 video engine
Date: Tue, 05 May 2026 18:18:31 +0200
Message-ID: <0QgbHBOXTsqa8Ms4s4GfYg@gmail.com>
In-Reply-To: <20260505134812.408316-6-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-6-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_091836_342397_9A5665C8 
X-CRM114-Status: GOOD (  10.31  )
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

Dne torek, 5. maj 2026 ob 15:48:09 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The SRAM C region contains a partial alias to the VE SRAM already
> referenced by the video engine. To avoid access through this alias
> window, the region should also be claimed by the video engine.
>=20
> Add a reference to the SRAM C region to the video engine node.
>=20
> Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



