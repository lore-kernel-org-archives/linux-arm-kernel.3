Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B947110D14A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aE5fBq1X2SeEG/ena5ka2Z2L55xuyoJKeRtJR2hXII8=; b=k7Ckv9P5ZK7rr0iZI2QVtcNZGJ
	Gzwwfxv5XQ5WjNp+PpF7ttSpEFwtXHU2Y85n55NsKpttLOVSXoh0E7ZnIIZaJN2xiwbWkAy3DkUZZ
	t9hrhFDx4pelzlLxVREIetLzt+TV3Yf5WjpI1vzNMwzCRCLpKVVQrBIFL4hJUVB56bo50SXCk3jj8
	WXHx1Uj5NiII/ZNqkAqmEEoRD4KCtBXX+ljC1uyuLziCC3mqXHK1l8E1BmQkqfhOJHlPTKsmEiKZ7
	LQ7QOshLhL78qiuOoe69M7yj1wDN7m9hqX1RDgNKMvqF4dXk0su4KL6O3hlwc5EmWAmLafZpPw6KG
	CtTvA5eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BIH-0000000BCUC-3iNv;
	Mon, 30 Mar 2026 12:00:33 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BIE-0000000BCTK-0vAQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:00:31 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b97905516faso584627666b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774872028; x=1775476828; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aE5fBq1X2SeEG/ena5ka2Z2L55xuyoJKeRtJR2hXII8=;
        b=c+aA/BinVSLA4gOhrjL6XJ9VRTljLEO4jxK0KE934jH+l/85wCmQRBhi35q1WLUF2p
         8org6q1qQiSt8TVM9vKO3g7IVQZEnRqKsMkUmQDfJKwHpHCveA4FwAQXjB3bsPCebXUq
         NvkQ14MPK9ce28wi7w2ldqruS93XGZGD8+Yg6UE5i40KJpwdLFfqLJrZA4hF2kPtttRI
         DT2kOsUyzjHbFHJH733LaDKEp7ZL6zAbvRLw3z/JI6JWwjTlijZQO1dJ77UdosGu/rAI
         U4GpjCB3fDNtdvu5hvOSMrsjeMtyVMP+yerhVISRIBKLSgKB37IqihWYxNXpQYiLLWdw
         mm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872028; x=1775476828;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aE5fBq1X2SeEG/ena5ka2Z2L55xuyoJKeRtJR2hXII8=;
        b=Q6iVXfrQovfRX6B9fyk8iAYam3oP8n9ec+l+5UmaMPhjz2Vm6Bw/uqJ06o4YY03v2h
         ZCbLGsBeT/KpfLaWG5WPfosJ4+cAeWJL3YxzCRc388PSob8SYaoBIYlYEkhIpT6p7uro
         h7UizMGtcMMgIYvJfKVCwCsrPWCXyBPb233KOsrzoo4jHWnErdltIVT6+/MBJxarGg7m
         z9Ptf3Auu1HeTVy8nZ+Eg8rzu2Xk9Bt1OE+qn0of3FAtc1F2zeVDBzp4Dnba7evjlPlR
         EcuqpqYIIElt8ECARTIJ+gOZdlpVgyFu3EbVV/5lcHna6eFSp8bJ1V4Onv/1yuYeer0J
         lhkw==
X-Forwarded-Encrypted: i=1; AJvYcCVAq3BXdl0bqNKCkhV7ArzSYXegiTnslNy5bUSNxGRw6l63zm9nONBrGtWckl5/BJ18WNiYBMLafEfe74oUsMiy@lists.infradead.org
X-Gm-Message-State: AOJu0YzyNXXWMPnnUHoNOfCl3MmImzqoW3Pj3CaKRZcB3OtRN6NEyXWs
	wzXVbnIWyyJ++Kica2oKn8j9IPgNc5yNzGJoWTFMDjFywUrXVH2+LI49ffCXd/r46ak=
X-Gm-Gg: ATEYQzyOKq2oVGB/hTzU8+mQaWeQNlWJu4T6NavxDmIR30EpqfUS6UOULGq/7nMq5E2
	wBNCKZlk9Q/+NZdEjwtINq8rWCwOqJmclwqR91A9sgxh+t4UJUG4MS3OufryN4lMJuL57q/RtX/
	4PK21Wr+Pi4qr3z4k9wFpfOOdljdjwf8FfyAJnLV78LnZRfJy/hap+UUcXEsiLurSnrzxo/MXTp
	vZPFWBUDUt+gsNY1188vV9zRNomzyLX1ODrjEgK0RHv5m8RUnB55ybRpjl+PNntf33PsU/GXZ03
	G/hLSV9nsXeLBorCmN6uraVjJSNLEY2mVrHNjj9BXg73+g4XBubks31NmLdUEnXIwwKQBtxL5Yg
	9qhZnPPV+cH2csU9wQcai007pP/sDaU+RbT+ttn6a333yc5K8Y8ljlf0ljwdAmgbaEXBdY/8ZxF
	vtJLT7eJ5uuVhXDuypTPJhosr7gqRupTKCAANLStk=
X-Received: by 2002:a17:906:209c:b0:b98:4156:878e with SMTP id a640c23a62f3a-b9b50946c27mr682254866b.47.1774872028096;
        Mon, 30 Mar 2026 05:00:28 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e4395sm273916766b.44.2026.03.30.05.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:00:27 -0700 (PDT)
Message-ID: <dcf2c447d9bbe16e800a4dd7e74ecc26d3ade3db.camel@linaro.org>
Subject: Re: [PATCH v8 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Ulf
 Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Mon, 30 Mar 2026 13:00:22 +0100
In-Reply-To: <355b2f8f-0a3e-4209-8b1e-10600c2b3df9@kernel.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-4-241523460b10@linaro.org>
	 <355b2f8f-0a3e-4209-8b1e-10600c2b3df9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_050030_343985_9E9EFB7B 
X-CRM114-Status: GOOD (  16.58  )
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

On Sat, 2026-03-21 at 20:14 +0100, Krzysztof Kozlowski wrote:
>=20
> This causes warnings, so I dropped the patches.

I assume warnings are because I didn't make it clear enough that patch
2 is actually required?

> I really do not
> understand how this is organized. This is not a dependency for pm
> domains driver but it is included here.

The binding is being updated, and the driver follows suit.=C2=A0
I particular, the driver needs to be aware that pd is (can be) a child
of pmu.

Yes, the driver does not depend on this binding update, but it shows what
the driver must support. I believe this is what we have done in the past:
binding and driver updates in same series.

I could move patches 3 and 4 from this series together with a DTS
update patch into a separate series, if that would be deemed a better
approach?

> It is a soft dependency for DTS,
> but that is nowhere to be found.

I was waiting for review of all binding changes before posting DTS.

Cheers,
Andre'

