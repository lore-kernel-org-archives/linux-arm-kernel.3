Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DABC83F1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVSinIxBeazkKEKfcVYcVjaoUaV4wjv1lfQNu+0RDdc=; b=EIIgyz1ay4ajSOwdRw5T3DqpCV
	FiP1odcyWSOEO4Say+vMhuRUFcCXOW23FXUzkugsV6EHsz5Zo2zejVB0p9T8Xxxfi7dMB0Rjy10Rg
	67GrpUgxdl4jQmcHAc8xQPDudSOTxtydlkHG3kvmcf6in6XxxJTN7QZUnG4pXyt46PUBqW86CzisI
	qS9JxZ6nVd2+lHockMyhQagj6f9bEqNBESeZtqLJaB/LzoYvDm2n4xRkvAfISgfktshFRFKApVRV+
	HRFD3Z4fpyQ1SE+oDcWD6ETotaIn7TWJCU3dmfvnB00ubxuwUVrm485/nhfDPjnqTL/CZ93UJ15Io
	a44QRJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnAc-0000000BGxZ-2HNY;
	Thu, 10 Jul 2025 09:02:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZltA-0000000B2i3-0N2O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:40:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-451d54214adso4112135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 00:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752133214; x=1752738014; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVSinIxBeazkKEKfcVYcVjaoUaV4wjv1lfQNu+0RDdc=;
        b=pcQtOkrPNtM5nype2E7I8bMgAHvbsMxySx5qiY8PphDqwhtEg2oqyY0cYjGA6Ay/oa
         B4OuTKyWUXPKF2Mfs+3wPtX9YGa20XH101TAKFAWn+pS2h8KYnBYdKUXySVUJSeWB4mH
         /1AooN4mYA6JaABAYEo8oeRBc67PF3jwDRbcSdnDrXTwMc4IiN6mO9b22pF3I15lkism
         6r8bbXsQ3mWB8EGEi8rIcDVIgqmXpUnvdbAFrMC46Y9xdLeS6NLsIe1Pq8LACEWlLB1w
         TaIIP7cRKAUPUfD9S0qXKLKVe/Plx/V7c8Xeq52dz+bS5k3Y8WZOoSfcsL1vEV2q3MJi
         LxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752133214; x=1752738014;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bVSinIxBeazkKEKfcVYcVjaoUaV4wjv1lfQNu+0RDdc=;
        b=eAT/V2U1CzNsndq4guBH0XoG+TaBIhoVFzu9TdpQzIyA5VHxWdssy2MKQi6jlgJBhu
         FIJ+tVjhpELl6g6Aem4BEaSCgSCcAt6Pv9bPjZPCHGmGj8y4BrUxW2nkjCPOMVxk39cn
         H+qieK2qaiQUP384pOHBzrT7mPnxl/KY8ts7203ibZWjK9ZMZZBHyuknDtM+KFmvs1eZ
         c3y4g2yNt7lW1WzMMGZPdtRCjrU9qTetuYnY5YBeDnoCKbnCu+GByBCulwvakzKykguk
         l90nINuHEGJJu7NtMOD2J2FwvUSC9VGhX1Uje5F+0quHamsy7y9MJqzefEevtUoFcsoh
         ODNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGAxnyVAnyM8xns4w7PfAWzeF8Ox7Huy38n4zCCQTqANUSiv44yagGU0vE/2agSBw6H/64LtIeqqqHT1zOR6jb@lists.infradead.org
X-Gm-Message-State: AOJu0YzoN1KUMlO7JDC8I3IqTYQjzxu/bxMCgH+JprwA+mtrmv6mqGc0
	82Qwp2FsdKCZXDNW/fucs8EzuvubrbWDkRygltak0XoyTfIqaQUEMS9SO/y5FyLCO0o=
X-Gm-Gg: ASbGnctO5gp/x28m18ZCp4ZLc+Pjb6aPF7Nj2FtsskKtSZbq6MTSw4PaufxfASF1Y9X
	C5bSxl5BhdDxgSMLn+3P1vwqCl0b73jcbRqcZ39FWZYdMCECeoIDBd6wVvIytisamV1qz0UTg4q
	frS/LWO8R1akx5WiRZIrAdT0l4HpEnktu4KH5YwAtKqGTQ7MlFfzFPHI7Y6kuoxwk/O4aJVKRQu
	oymlzPgIyzhuJJTgxNhjuO+KUWRg1tdT01bU/8sG3/tqbHq5UsKGcr5kqKgtAejijrRLGr2UHiK
	+/0yFtwiGxRAsPXcD80u1hzrP9NCviKSj2FIFKhtr2iOTRmhWyFFbwOmi4Xi4l5LhA==
X-Google-Smtp-Source: AGHT+IEw2BMJU0viDmTOvkyx/B/l0UKxFSMsiQvTqQWjzJquhhrpepUjy0pyReFZsMn1allOYgvtiw==
X-Received: by 2002:a05:600c:b85:b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-454d53a7430mr48773265e9.20.1752133214419;
        Thu, 10 Jul 2025 00:40:14 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd43915dsm11113575e9.7.2025.07.10.00.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:40:13 -0700 (PDT)
Message-ID: <965df42623d1a1c2bac49bd9420cfb5fad672048.camel@linaro.org>
Subject: Re: [PATCH 1/2] arm64: tesla/google: MAINTAINERS: Reference "SoC
 clean" maintainer profile
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 10 Jul 2025 08:40:12 +0100
In-Reply-To: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_004016_125951_545214E2 
X-CRM114-Status: UNSURE (   8.84  )
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

On Thu, 2025-07-10 at 09:34 +0200, Krzysztof Kozlowski wrote:
> Effectively all Tesla FSD and Google GS101 DTS patches go via Samsung
> SoC maintainer, who applies the same rules as for Samsung SoC: DTS must
> be fully DT bindings compliant (`dtbs_check W=3D1`).=C2=A0 Existing sourc=
es
> already are compliant, so just document that implicit rule by mentioning
> respective maintainer profile in their entries.
>=20
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0MAINTAINERS | 2 ++
> =C2=A01 file changed, 2 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

