Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE63C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=; b=C/q32BWx8wxXrWUKXCbAtmtPbS
	oaGpee15SBHcg2v+W2GCIJvrVsZsRpoZK1WxMcouZpizMyO9y0gtpTzLYLtZFYDlBk6/Pj8xamwkA
	peQU3E5Ouh/WTNSHxKTvilIXtFi1V97sa/hCBG7BE1dTGVCnl1rcAi5fnDJsViGqw6PjW2qtTAErh
	zclPfWiqvmfUZgczC9jqN35Xwjot6Z3GBpiVR7G2xjjOyiTxsao09XUx3WEeIjdl27O9pTm3SgJhe
	LE/CAcy6/1TLS0eltPDRW9azIQF8bmp1f+h0Dr7vJ/1i4oDJ1Eg19LY7uUWQFUbZo3+ViY5twDpDv
	bqZPqhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TwS-0000000DoHR-02D9;
	Fri, 18 Sep 2026 08:27:32 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TwP-0000000DoGi-0S8n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:27:30 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f55efebso67596366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720047; x=1790324847; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
        b=sT7E1FZQ+j/FdpaIsvl1O2nVG882UzEUE1FFmIO4N30drFRq1tClaOOkq2U7VrI+R+
         NiZyN1KoBmAwXDrLk5ylCEPsGEviuHgEJzaLHFsO+7/K7/Qmx8Psb9ZmoxR2tyZLwGJi
         eDtlENRUQ7l9w7uunWQmVZAy0jLyJncQjFcMgSXq+o2EK/Ser3F7IZNQH3reLhdQctsB
         qa/Z5r9NZQ+jbgw9Gav6wWzU51eMXBfNpTu/N5Hdh9P3sJY8E1hqjqJteijUgXudiGny
         3ZtnvUaGPcqzEh/JUFeLhQavqgali+f80lQjogzByG/mh3JZxZ2yKafpQGwCRli8G+96
         1wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720047; x=1790324847;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
        b=fRuFpccW/ZBvKRzD0isNO/pg+nzZU6IkqJDWGIDB6QAl9wAx3aepesnQmB+KDRx4ES
         tqLBASdh5bFRtp6Sj+td5Rtx6DsCIgHNYmg3WYVBY3hU0izamjMssRdPfnXdsvCjFmky
         1275r40JUWO3H6q6frNPFIdOpiXXtmTcdPlh5HyTQDjJLDa1nDPe7y9hMHiJOSMz+UhG
         wTK7+A18FrOfSzodg+oCfDhLXkF6LRXd+ofteeQOMcG0uNZbGQ6wvLeLUlLGh0zGx1vs
         weJnHAc0XDxon/CfW94XmoDATj6CB9l150lH4hLIQp3S3AyJpcJwwPdCmUje7RhrerxS
         IdtQ==
X-Gm-Message-State: AFuF++kLXWtUJ+VCj16VN2bswUInn+pxqo72GGfSFPmMHt/kgvuksojk
	H67OXkbJe2VjTpVqX77nJ32h3j+S4h7vQprslluIdxCcAt6BZbTAIMtMdThBRJONTF4=
X-Gm-Gg: AYBFou37q0vSzIPBuppza6Dw5jpWlegLUasUi/gIE4zibP+3TVIZbwXdz5BTBqEVxIl
	LoGaOE9ZrDKm6atbVcgFgj5S629KWuGrZxo+Rw1SlX0XYdXGyUAXiuj93FOkJowBoAe19cxZt+L
	wtU47iiKHKDPrhmQWtHhuU5lnE9epyQPF+nDjfgesjH3tuZt8X7xRv5HYbsgv1nC+E925uDZFYm
	Ma7oRTQjPwDAzBW1q0UTQZDNCPgz3uf4W9cpijPwPnqfZ9a/cv7oPpNIKg1O3eXAE7ZAa5sR0Sr
	8AZ8UP1PQgx2xCPZXF6XC19L6+hUihXhpFHdC7wL68GDfBcLXNbJUwiN5BNDngMIr43S22DSjza
	pNFZMiy3w2s3oKuG3X+ms1OEdMFbe6vMhfnIrV13WTWD3uw07ZSBybYNvquBmo/MundfANFZBAn
	4plwMFUyEOff1/1J/gpSMGN+M2jUGNV0ZiHIQy4DNYQXdBDQ/Q6QGz1QbsSi/ZkolxP4AWOHXhr
	8E=
X-Received: by 2002:a17:907:d01:b0:c26:1691:b364 with SMTP id a640c23a62f3a-c2a157c2f4cmr178472466b.29.1789720047299;
        Fri, 18 Sep 2026 01:27:27 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb87e5dsm32871766b.36.2026.09.18.01.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:27:26 -0700 (PDT)
Message-ID: <6c762160b22cc801d26de2f2186717e41f7e640a.camel@linaro.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: exynos: Few strict dt-style-check
 cleanups
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jesper
 Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>,
 Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 18 Sep 2026 09:28:49 +0100
In-Reply-To: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
References: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_012729_170303_431B124B 
X-CRM114-Status: GOOD (  11.84  )
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

On Wed, 2026-09-16 at 19:06 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Do not reorder CPUs because cpu@4 must be the first one/boot.
> - Remove applied patches.
> - Link to v1: https://patch.msgid.link/20260911-b4-dts-samsung-cleanup-st=
rict-continued-v1-0-9aa55051c42b@oss.qualcomm.com
>=20
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
>=20
> Best regards,
> Krzysztof
>=20
> ---
> Krzysztof Kozlowski (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos5433: Re-order nodes to =
match coding style
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos5433: Re-order propertie=
s to match coding style
>=20
> =C2=A0.../boot/dts/exynos/exynos5433-tm2-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 93 +++++++++---------
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 108 ++++++++++-----------
> =C2=A02 files changed, 102 insertions(+), 99 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

