Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568FAC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXeJpH3wHw7BU/7D32jGOtOKsJu0r75YAYsNnjjEMw0=; b=ipueC+VRpBoRhxC18pKhe6ByEE
	sMhtEi7LakT4qlTKeDmb/fMR4PLTyWra2qvEy02pKy59+dOV1tKSJJ/Hot4K8Vr6yhjaZsw/dq6AM
	ifbVMeItVJj3OZzCjBd4PeOLpVx+h9fqviNL3mr6PTf1bu4YvutvdM8w1c7ix9vQ+71Mzkc+hq00k
	K4EUGHRhEZLl7TZn2TT7HgJDIXSLatH5QlecchViIb+C0GczD1TMqQP9Lnhp13pkiwyxVqaBEf6UI
	Njb/C/8FgmY7hYOZZ4bEh5QWgx+XrUJOwZCiWzAwvCyk19XGP7RrPi8oJGFN6TaKs/i10HG4CWRPd
	LfvSSZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXkx-00000006X5F-1vyI;
	Fri, 21 Feb 2025 18:28:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXUc-00000006Tqh-1CPe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:11:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43690d4605dso15705035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 10:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740161477; x=1740766277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXeJpH3wHw7BU/7D32jGOtOKsJu0r75YAYsNnjjEMw0=;
        b=hozq1CajwvQSxhEdI6LBl/UAoJzmqan5AnzkLKSuRQ4TpF6hDrLYs5pKTZyThzwoFk
         mE95+Jj74HGLx3wPZAcCyzsCJaVUNeOfregiPLYJwDlSMdC5YeR2R6hrT4z5NA7gKYTR
         ovVpzEhu8aImTK4fZFk8FbnI102EAnv7WfRXyI/j5yrwAVJVi7I0Tjn9LDO8ktD1KgnJ
         sLIUBj0qg4IFXQPLyhP0SF/CcwT15lcGkgfKScLLxmmtO29MF0m3Cz9vYiw32NzpA/WU
         RIefZjZN5XeuDgpwmLi5TsxgFuxIQlHR26m+pCF/Ni0yCn1UNdclYXfRDFVg6x+To51T
         1JRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740161477; x=1740766277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXeJpH3wHw7BU/7D32jGOtOKsJu0r75YAYsNnjjEMw0=;
        b=mMHHoWgn4vcbX4MPIGnEx86UG6bv81QtmNaSVQv9uSzKydne/JxDFk7J2F9xiCDRON
         76+5vGSJC+w1gMxXUs927cz1iUrdYHzE02CF8gK3eKMF2QCQjGGF28pdIJIhxBa/d77B
         ysEiov+yK+L8l7SDt+cqiX7AcvZiuqY/3o0Ilrzd2HcJw3D7RdrHaW5QXr0WQfT3rhUp
         ugdDHeUDkPOSuQy3hT/5mND+qJZ7vg5HiUzadyhHIPcmjefdtTteyvLMPyYGqaEHIBAT
         /6775x2RZnzYz6NNb7c3IrZqWTOQEi8Hs1T5Caz5cS3fPhaFLPtIRSfwg6/vDzgUTLoB
         wEIw==
X-Forwarded-Encrypted: i=1; AJvYcCXhmzlLI7KVDhrqJhejQ45lsvNBt3Yas4LDkXntSlyCR2jz5X5edMd3So5ktdQMNNQMgwe6iy+TuLJntivPJG13@lists.infradead.org
X-Gm-Message-State: AOJu0YwkVEPvrPv8mORDFrq+/KkGpPdj4Fvh6uqWsZ4q5TqiqD8Ursb9
	uHjWoM8543f0+ijl+AlTKfgjpI9H5kuFsr2Cpma8UdVko8eJzefG
X-Gm-Gg: ASbGncsouIYldcpTyXIxxv2zAo06ZAXwRYZZNC98VplQJC7DbTFskCjf7dGSaa2Hy0q
	cpvMciIyifNubUx5lFKTMtb4VWNXC1Qcf4axGELzqtuNDcDzCKSjA8hVmd1x6VMyDCrVZWzAPvn
	68uCxuiLwUq/dng75eSGiu2g5yNWS4UsG04XcUquD//vF82EdJlx1GCCXx4aWtR1wOGtiWJ+Q6Z
	chVIEECwSIJS69oULpbCS1ipHqj8SBrE/Ms1/Xgr2qOSJKBFsnToXy9AADY4USnsTlyYgSabIhF
	q8DqG4nZ7mdad2rO2j7uDRJF2vs1unJNetYs42h1DNE6cIkz+drUcDooPA1x0XVo2hinxxkUccE
	eYw==
X-Google-Smtp-Source: AGHT+IHF/tsnTWTEpF4H0kg8q1A+TidSDULFwV9+aTYXkyTCuSdYjLeHagAev7Ne5ELDSe/ppYbBWg==
X-Received: by 2002:a05:600c:1ca0:b0:439:9e8b:228d with SMTP id 5b1f17b1804b1-439ae218a14mr35556225e9.19.1740161476437;
        Fri, 21 Feb 2025 10:11:16 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dcf08sm24356178f8f.36.2025.02.21.10.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:11:16 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: gpu: mali-bifrost: Add Allwinner H616 compatible
Date: Fri, 21 Feb 2025 19:11:14 +0100
Message-ID: <2356358.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20250221005802.11001-4-andre.przywara@arm.com>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_101118_319113_22359A73 
X-CRM114-Status: UNSURE (   8.30  )
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

Dne petek, 21. februar 2025 ob 01:58:00 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner H616 SoC has a Mali-G31 MP2 GPU, which is of the Mali
> Bifrost family.
> Add the SoC specific compatible string and pair it with the bifrost
> fallback compatible.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




