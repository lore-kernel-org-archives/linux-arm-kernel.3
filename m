Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3B2C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saI9rGv/S+Bdjv2TjtWTjnBCwib5vXrRGmSG6mtkl/c=; b=DIf7NBJi+sSbBY2uG/+p0CQdb1
	CnqiQrCQIwBOrvsBDJFwLz99ZOQXHHcg0gxCWkIvA2LxJ3WsagzenMRd7PkpvImYdBtEjRFuK6Hgz
	+IvYIZlnULs2qfJph2yrJjKnn+LIhdnnWEB1PoQd5pLe16VOqEKLnJqnxSFK2P5vBmp9eBVOfBFTS
	3P93OR6EdD8bicMwHgTKh2wH5vLef2xwIKc0X9ynAOs+YCNtSToLpDYh1k+NstkKb6cqrMmGXxOQJ
	QGexwbKxLzg5ceiWQPRKM+Cq+SebUgxHsW1epVUqwnphGgHoIyPeki/trXNVLwdZy/eeZqq1pMpP6
	6w+AsUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJME-00000002ZgY-1hUS;
	Mon, 27 Jul 2026 11:18:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJMB-00000002Zfj-3Q1p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:18:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47362928f65so2441896f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785151130; x=1785755930; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=saI9rGv/S+Bdjv2TjtWTjnBCwib5vXrRGmSG6mtkl/c=;
        b=uVd4hU0TDR457qLlR8xe05Aya+Z7M/4376YsTEES+nfUkQc+ncrbZlbbhR5OGIPdM1
         INvGxXYW4LWOgTK2/DROSgJB190F5u8tyKxuzHJIyJ+U2We6HXAR151j1xkXg4lhaMBt
         gKsfkDVvJWHE3Zs84EJpeHJuiSj9p/ul4PG6CR88jXzhb/vX+fP01cQs3naKidwQCWmX
         HA8DAIEBaIeEAkdgOSan1XnbhqdZXfVKFSMVojW6QBRLoHHJy/uC1ZF+X2h05bZTFLy+
         mmKRx52ZsowywUsgQ7VyERNkWYzIJg+qvoSAqM3cjdkXX/6ROGkCWQXATxRUbgHdZbA+
         Xrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151130; x=1785755930;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saI9rGv/S+Bdjv2TjtWTjnBCwib5vXrRGmSG6mtkl/c=;
        b=dePxe/7JPBitUOU/gidE84S2CWrBEuLF4oB69t1IYeuyUalSVdln53Z2IAoo4k06WG
         olpG2rlcOPDzt+vMqhX5oo8wbgplPFNhIa9H7wcRQpRNdo7mObGqyaG90uNlrihw1Sx4
         YF3wqGLokElx7ZiTUcMB6XlRNxPhRnzAOzMWTuKgEk4aXOcV5DK/VNKlkc4wEirC0exM
         DvKoxmRpkGncs9EDWDU+fuNjARFAH7KndUCB7h7Adj9wzM68rnqg+JK/Ecj//CLqpB+Z
         OOn68xh/2DC8/05V5hM1h/ertLZcWWay5hro1XgPoZNy1LVM5Rg1yVRKcu3W1gupky09
         ubdg==
X-Gm-Message-State: AOJu0YwegzAGYzpuBDpf6WaMKX740hQRZQbp0bmYo6tU0+Y8S1samtgb
	gXH4Mqs+kKO8V4hwJYjQeBfTpsmgvePXi15tdQmUWb/4sQq8IeXl1GmtHMP1HZ31fRs=
X-Gm-Gg: AR+sD11WnLv2qpRG27vOCbNySUSBhsDxz7V1rCLPJWDiC2VdFva1zeJKRGA5O4RYJZQ
	2Swvtad2wTrcT3MOE53rQlvZCyxz7+TUqcn/zVo6eKSs5/CXd3h+B/OXCIk0fKNNMbu9Gk7NAoE
	/wrK7NIstxyIFdILbPoCcqDOzaVbDza4Sq6IlXwaOx2zTkYAKdLhQSoliRh2XtdH/QmIOJ4gCPP
	6UJ/JY9z4ix1KHjI2ilYsXBkUEuEfl3Z7I3jNWFlidOLcPN6if8Xz4gMA69OxacXkkltZRz74yQ
	iXQ7B7Y6sP32PLjt2wRET/mYAm0RX252CrtgsU9sSSMQYaP83ZeqUg2nFCUJVJKkol2VamI0Y9i
	GVZx9o5e7/WgbfqHXDSZSjWUfh1hWKiseGYfqU5M6sPQqV3xwS/VYBUb176k6eO/Yz0nSbkevs5
	ahebH01w==
X-Received: by 2002:a05:6000:2506:b0:47f:8ff9:c9bc with SMTP id ffacd0b85a97d-47f9fc8f23cmr11076927f8f.14.1785151130010;
        Mon, 27 Jul 2026 04:18:50 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm49134412f8f.11.2026.07.27.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:18:49 -0700 (PDT)
Message-ID: <485cc8cbd03a3a61f7281ac81ba10b866a73f376.camel@linaro.org>
Subject: Re: [PATCH 8/8] arm64: dts: fsd: Align continued properties and add
 missing blank lines
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:19:08 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-8-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-8-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_041851_860378_7EBE5431 
X-CRM114-Status: UNSURE (   8.63  )
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

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>=20
> =C2=A0 [required-blank-lines] child node must be preceded by a blank line
> =C2=A0 [continuation-alignment] continuation should align to column 39 (u=
nder < or ")
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/tesla/fsd-evb.dts |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/tesla/fsd.dtsi=C2=A0=C2=A0=C2=A0 | 97 +++++++++=
++++++++++----------------
> =C2=A02 files changed, 55 insertions(+), 44 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

