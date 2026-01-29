Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F32D46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 02:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=; b=V7Z6HhOoRqTnYFcRsBYE8rvE56
	iY4TxIHgl9W4A0jImYOfqOKEI/8o3WiM/zUb3Zi+eTIywjeLXy9cHBOpO62m/zSzXeRPyMQEE7h4b
	kjuTzm789lPYv5lTh53R3QALAih/KDOQD4ZKlRISE5G53An/A4YbyAPlz0C9T4mJt9cTQviHdEA/j
	Z4L1aNbySn9hz4wTPxKEsJNhdffWG0L2NJ/h6UPB6FaxgcqNDjlY4WM+O3rL30vrKHRsqJiPf0qmt
	d1huhFHsZjndrPcyDuwWw3C1NLxgUA/N46WDuj7Am7YF/Xi4avFW5HkHDcv4z87XjfRFIRrVgmf8B
	aNn+4sJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHRa-0000000H6GY-3D5n;
	Thu, 29 Jan 2026 02:07:38 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHRX-0000000H6Fm-3VPB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 02:07:36 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso264288a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 18:07:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769652455; cv=none;
        d=google.com; s=arc-20240605;
        b=du5Gx7mtaNYVr4fZKqLpDZ3hLXLpjL5U0drvCGea8muGGBHhWwsIls9OnidWOjie6C
         zOl5c2krfFDrshXKo22iiaKoBde3BMpjiQTFnEOtE6BjpSrB5ylLFktfbKMNj4Fpx6V3
         OM7d4gNrn17XKJNsv+GWjJx7tPESYDPy8rF41G39tTgriSRdqFO1ikOSbokdI+y0t1XT
         WnKwiurGVrDAw6yXVfFStfbUQHoHa+eZL69D2i6fhggjJAKuLPOlP/zwUthEMM6NpE7s
         M58OQqN18vxikScOeq0XQnd2zDLXHLdT4kq6dKf0f3+zBrhqDtkx8LxYSf4iJd96nsqc
         F4mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        fh=Xm5n4Wwqd9O9PrEHkzp5LMLXthxKYyR66jcApGt7W2s=;
        b=BuxD3yZIDO1YgZfhOTnWjrgS1lEw0VfoAegQ0TfpMKfZkh1qygSd84NWMl+oUOQOhy
         t6vmaE+V27yzxAQMP/cb/Zx//xUkaZWIcwT3O2VAuro4hhtDNWKdidg3wL/gfQvAETMN
         Uiy+8VsK/r04ER4LgHtsWuDtABS+ThimDsS3kLm84plLjQMRiNtTNU+RsM4eFC+Pv7lj
         OyhBBe4JeLGjflFI70IvSno3K221C+qAJgSJTECtgKF1Aadw+miAuDlMtY7pOLmEBuWx
         zTTnnxXD5722gvO1Dg2M+O8LYU7rdeEXAjjkNBhBH6HCMM3dZJ3scSDaJ0f610KQHbZm
         LT0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769652455; x=1770257255; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        b=KQJ5Nv5AKvHNQxadx9o2/7Xz9DBZyUlzjM04+70lcqDiGI3wS8EMxyDi/j8xPlnYlD
         rGsnPRXTsCdc9MxtExrvlKbvGhbFgpE7dmdPTDea+dE0QlcRbjbB+n3YNYnPSnY91ZPp
         SIqlta4WbClGEnIruTPXiCrQI7wi3Pu5k78BhlG8RVw2GWRcIJnpZGcZd02uIIpnyElA
         MRZc68xzuthILVzUiJ64Rm75BbC8TJI/+8hHeiGezYnZ9DrWwsPugbTo1Pf3r2uRF4iI
         /ZbvGlgAoUimjhpTPcewPDHh7t9E0xk3alon9/CNp+T1JvKTUUnn0bGc6wwdK5/Ia9GN
         3ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769652455; x=1770257255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EHsl0dfhwfqP6ryiD+Uuzynxf8kJEamt13Ja96DmZA=;
        b=NZzp4ant+QUMygviuLRMgpoQCJlgkLRr1MC1DWpE8kRMNinskJIUtBH+aTecvUrQQn
         0FZzPlVsfsGwPihm2WCrT22qBXEi6z+e75i8WO4kOWLqc6e5Oo/HDuGenML8mIRfltuo
         tgLa0E0aEnG+Y9n6yNHCALcb3TROwq10TYIVdSpLRV6YPAG8Sh8oWYtHz2Ryb/kVaHR8
         LoJT2XYdhcL5GpVqlYepdMYAVNzygiq9HaD0/Pm9FakI2BErK6tDMkN8jlBoREQQOkVz
         C4Uny6TPYLY10sCOORvKbP83SrydVmF+tXoFY1jqRYMFtL8Rk3xy6CUa20Pe49OZfYw/
         EWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG6pqhNYOGF9xgYKMJ5spCQQRowMqf9zfmm96VeEp1kBJs/UwWsrco6O70R81M9ByWLS0z7CuxZnxeXSrhNE1X@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2GNQ2fVr2FI1za1L28eyhJ8ugZVxWpMlL/nncEOqLN2b7uK9h
	lcuEJEJ453rd0s7BGJvT7Aj+yRjodPRFJbEHruURyZ88GDhozsAHtFoQjD7UkYso7nmENKp5W9J
	vgdBipgRnTyhE6XoyJ/DOH6BSj6E6Lx0=
X-Gm-Gg: AZuq6aI3jZuP3CEoTeA6Txp8LaUxP2LbBe78K0SQzSz+t/h5tOUDAbiin9Ljn4WOZj8
	67UzK3AVfgbtJqEz3wps2V2nKrrNFNT6n1um0shT9Q2O2GRdDNF8efUYWuxbpvRziz3sjk74HFH
	XyJnOiBe+WVWPQ8m5weiFOAnXdzmYajklAGYoXRhNm+DkRGsfoGbljdr1Qo1B4ZGFrX1+3CCFIK
	9w31U7gGXlGSIVmuu3dCgeipyR04rnUljnGMUmfBbTJu73XFXc5NMDVj8/GK3quoEJj92U=
X-Received: by 2002:a05:6a21:9d8e:b0:38b:ec0d:51ed with SMTP id
 adf61e73a8af0-38ec658522amr7340595637.69.1769652454754; Wed, 28 Jan 2026
 18:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-2-shengjiu.wang@nxp.com> <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
In-Reply-To: <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 10:07:22 +0800
X-Gm-Features: AZwV_Qg-rrUV06PleoYM6kICczpC4hfgzfJ0lPzEIvMPV1d9IUOkAJEm-OUeTRw
Message-ID: <CAA+D8AMb-QPuqXfb4RyFo-9WTaH78WrAnCGTaS3DGXBP74DT6Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_180735_876654_42D5677B 
X-CRM114-Status: GOOD (  12.18  )
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

On Wed, Jan 28, 2026 at 7:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:51PM +0800, Shengjiu Wang wrote:
> > Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform
>
> We see this from the diff. Say something useful.
>
> Also, why power domains are not required?

Ok, I will add more info.

There is a power domain on i.MX952 for the wakeupmix system that
ASRC is in. But it is enabled by default,  ASRC device don't need to enable
it, so it is optional for i.MX952.

Best regards
Shengjiu Wang
>
>
> Best regards,
> Krzysztof
>

