Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D4ECCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aYSYqxdTQx1adiba7waOFSEBjrwgCAPGP21S/4z0WQ=; b=tBCrr4bsrnZj54q1LJaD8krXRz
	TTXxWKx8p0jrKgU+RL+ccRpsu2FYqn1jhsXyTFEeo+SkN6vrFDOKujrDUcLuALq054vXzxV6xkhsZ
	91LXq4KZT2xhhtwH8lzXGATOQtxmJGA1ALj2hEUiN6G2HPfsNMNXhBWE+ZQe5OH9zo4C6au34c1ON
	dv+byq3JlA0D5O4kqU0RleCp2t7/5iibL0PESbgibCXnP17vHxKIiExY963Yx3Gq7akuCZqAr7vgc
	SzcM+qP2Tn+l6J94+B6HASZs8gNFiZ0NS4bIrb9vaoB2zdEj/PebAPSPFb5zh1vmA0slonWe1jIBG
	S0Lkz/Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRXP-0000000EVJY-0Sll;
	Mon, 27 Oct 2025 18:01:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRXM-0000000EVIq-2Wcx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 18:01:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so5172278f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761588103; x=1762192903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aYSYqxdTQx1adiba7waOFSEBjrwgCAPGP21S/4z0WQ=;
        b=PM4bUgpkoR1LxausvF16JB2sKKhBwjuNM0t6JxV/Bqa5vrlYC/pU0AuLLaoTgabqoV
         BbFTvBFb4IvOpxSxi+6+9GgFm1FFG36f7mZMRGFpOOiZ4W8ERKKkihsg5rOZlUYVAw9D
         jDkcUfmlbtBBDgtN1/XddSg0FsYSbrvMv12bJsLU39RGLwWt/RMDEhBPfL0SyZjx0FFn
         Y9xchql/3Iqk2uo3pKscVQDFu3UTiGGEtbzYI0s+/wdIg7OTNJXfhVeudMo3/34I06hz
         /sqUB7CKWi9vhprIkwQnYRedhGwAKcuNHlv8tWKmTPOSgaYqn0qN5f5ouW+rFuWq5u8W
         +y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588103; x=1762192903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aYSYqxdTQx1adiba7waOFSEBjrwgCAPGP21S/4z0WQ=;
        b=YXF1lY+R2iCDoaLWsxlh6ERni1h+jg4Z6FM+AQWUgiYtEnveC/RZUWNrx+N1Dl+kSz
         0J7xgsccCgeT91+ximApeuEpSAjMc0PAyy0xO7rPjgIHqGw2aA5Wd/siKlHsHWX2daTW
         rK6MlnKv6ZqFwNbUKzCYIE2/b0jCbKggE6qvRpfQP7tLawKWsFLIlwqN0RWJd8RieSJ5
         XZQs40+KGwIKbtiI1DeDgxmNDM36ohrN81MnKtZR0sUwkZWdeIYRmXCP6mvmk9fO3NtJ
         3zyw34iVKlyMqfkMpJLdZ+rPFTLaMZmPq1ZQcGWLV4GBWk34oCnWauxjtKIaGd1M6G5v
         wv+w==
X-Forwarded-Encrypted: i=1; AJvYcCVF4IDxjlpO0qxhVLwq+cQi6IPqZ56m+BCyr9rvHkzGqYK0guYaArT7NPHc6bd4EyeMMR3BZhvU8HqA6mQ2OVBJ@lists.infradead.org
X-Gm-Message-State: AOJu0YweGmctgk0eDS2DSHLcaJbG8KGFlqJOKp+H3erCkuYTRd3NNSm/
	9eiOs7j6BU0rh5bOC7zA3lpQvR04DlGoEStORmuXuJdvEZ2uFrrN9T7C
X-Gm-Gg: ASbGncuMTtmd+UC5LgGf4PVLfdQ0+W/eskLq+s7iMUSIPZUCFnn600d/kJpmUZo+no4
	SESighCwaBMZWNa22MAhfGjcEcj+beWYo0oDRauRTb7LiseWhHcbqsF2xXVvvu42LyPDwj2eFmg
	v0RBRxC+mO5wR3o0eZc/TMlYD26egvHS45qEjHKnI/rZJ9gDhax0J16KoH6nQ67ajFb2hVzPv4H
	3FhS4tSVH3AASMbbEUmu0ChV+ljLT61/uoMUBIGqQowncU3Y5Nnj1WC5oOuGIgPyc4jqys6Bbfw
	F59vpiF6t6JTZz2Ze/neKDNbF+cWAg6aq5Ji/q2mTcuoNg88Cq7XSozzviyCrwwFEVl0M5lXY/r
	EdkYemB2vWUoo4Yz7y85HYIKlpLbpPOpQCGrl5gK6NL/TRIxsJ+nUX+6bJlunhyprOohGc3qyYs
	Ao2jE1RDOVTnNUalDGU76KtFv2H9faOUM4jHsUdjJXsrDZiyVaFBUUBE4cNsb4EhvOrnrA
X-Google-Smtp-Source: AGHT+IEqakiIVgvkmH1mzvZg1woizmOdLx0SAbkLPTVvCw4c/LMFkRt84r69g+UhZ/bheKm0gmAdSA==
X-Received: by 2002:a05:6000:25f4:b0:429:a7f1:bdda with SMTP id ffacd0b85a97d-429a7f1bf31mr546028f8f.47.1761588102726;
        Mon, 27 Oct 2025 11:01:42 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b6fsm15648567f8f.1.2025.10.27.11.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:01:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Mon, 27 Oct 2025 19:01:40 +0100
Message-ID: <1935223.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20251026210905.GA2941518-robh@kernel.org>
References: <20251025043129.160454-1-iuncuim@gmail.com>
 <20251025043129.160454-2-iuncuim@gmail.com>
 <20251026210905.GA2941518-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_110144_679039_0A66FAFB 
X-CRM114-Status: GOOD (  20.75  )
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

Hi,

Dne nedelja, 26. oktober 2025 ob 22:09:05 Srednjeevropski standardni =C4=8D=
as je Rob Herring napisal(a):
> On Sat, Oct 25, 2025 at 12:31:24PM +0800, iuncuim wrote:
> > From: Mikhail Kalashnikov <iuncuim@gmail.com>
> >=20
> > Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
> > description of the thermal sensors in the A523 processor.
> > The controllers require activation of the additional frequency of the
> > associated gpadc controller, so a new clock property has been added.
> >=20
> > The calibration data is split into two cells that are in different areas
> > of nvmem. Both controllers require access to both memory cell, so a new
> > property nvmem-cells has been added. To maintain backward compatibility,
> > the name of the old cell remains the same and the new nvmem-cell-names =
is
> > called calibration-second-part
> >=20
> > Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> > ---
> >  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 56 ++++++++++++++++++-
> >  1 file changed, 53 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-=
a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a=
83t-ths.yaml
> > index 3e61689f6..b2f750ef2 100644
> > --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-th=
s.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-th=
s.yaml
> > @@ -24,18 +24,23 @@ properties:
> >        - allwinner,sun50i-h5-ths
> >        - allwinner,sun50i-h6-ths
> >        - allwinner,sun50i-h616-ths
> > +      - allwinner,sun55i-a523-ths0
> > +      - allwinner,sun55i-a523-ths1
> > =20
> >    clocks:
> >      minItems: 1
> >      items:
> >        - description: Bus Clock
> >        - description: Module Clock
> > +      - description: GPADC Clock
> > =20
> >    clock-names:
> >      minItems: 1
> > +    maxItems: 2
>=20
> How can the max be both 2 and...
>=20
> >      items:
> >        - const: bus
> >        - const: mod
> > +      - const: gpadc
>=20
> ...3 entries?
>=20

Because old variant uses "bus" and "mod" and new variant uses "bus" and
"gpadc" and none of them uses all 3 entries.

Although, I guess we can simplify and just use "mod" in both cases.

Best regards,
Jernej




