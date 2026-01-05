Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E32C79FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fonikX7z7K1ohHQZl6vZ41UkDK6dK2RBIq07hZiimXM=; b=w0FbtSKHjGmc/FvDs23P8lYvMK
	zCBCpBUQZ1RE6tMks85+ne81IqXyMPGRHn11OvrO1Csr21C8pYTAHbtfjXvqtS8yY1K4BdgBKazkp
	7Xf5p511/6Y7TU60VhjPzuu95JBPDt4BVBUXCa6HCQpy+A1ak2wui1n0KVkvUScQBZvib1V+Ocux7
	4eGnfb6hoVRVJc4YADV1n9rLSG/R49BQHeyUmV2tp1pOUruie7WCLvAyycVcSKpdr63jMxaH67FKb
	iSVtrYb4HMNlxUks1FFmBimRDsY5CZ3+WWGnMmVMG8RMv2EndVMVEo9rj4kVfQ+RLzEKzGjVbKPP7
	nnWz//UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnXV-0000000Bjez-1yRB;
	Mon, 05 Jan 2026 16:34:41 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnXS-0000000Bjee-0SkE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:34:40 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b7ce5d6627dso27905166b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 08:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767630876; x=1768235676; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fonikX7z7K1ohHQZl6vZ41UkDK6dK2RBIq07hZiimXM=;
        b=Mg1LO3HpZVmLvyiOB/br7Kl/06YdLFMwwla22512OMWt/r5P5LOrbkz1dUwWvmbG2t
         PdgPVF7Q8myhx2/Dub1TOiqfA4F7WZldG6/vB28W8Pw+cOLeCppJw309LfpOIn5uXLju
         s2MHGSdiPYvYH4iXtE9C4HswQtDXLwvSyedX60WFhWB/C73TjeDAS/KHT/qhfSgKh8Uc
         kSkLOYELVRaRAvOj1p6VbZ8KXPlwNCyT1pJP6fJQnbDrsMt60vJDAokaGP2kCzrfBajN
         xDqId4Lj6AJpvV7wqQbQq908zWSK2ikINInwHIg3CHf7QWvFIhXx/C5rSLgq8VtZY48u
         cM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767630876; x=1768235676;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fonikX7z7K1ohHQZl6vZ41UkDK6dK2RBIq07hZiimXM=;
        b=xBptCzafGBKJbQDN4eY90NcOB40Bl+VsgmwvwbL1oQCJ1LB64GlP/vSk5aFgqcW6kP
         Ba2yY8/GBMkKK1Bd7RWuZRT5elJOPJk+5VxkcOvK3jxnJ84rkLcLTzKP0jSpD+/Iv5is
         mWS5cG2oQ6X0UlNVnl7M1gRe+Hrh65UuupGqL9n2UnfgxV/fOofceMvrb1Z6i941ha4n
         DvqbLpf3TOAa3fLgbOffW8FW+hbcMApo7OwXOZAAAwyn1pcmRK1pDdbO8vvNvEQsXsaN
         4weUpGjWDrYMuwooN8LX66x9H0A6kR8ut/DpMVo1hmjLKWm08M7srkK7BNT2PDa+2Cga
         sY5g==
X-Forwarded-Encrypted: i=1; AJvYcCWYkHA3Tmy2nIzlGoFPlaV70w7ylgLtVANG90PpGJ0/nF5yFrecaVSj+4JWEJoC3gLk4zJHux1FXT5nfX/x7++V@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9aGRiOlGxmDrK2iTZT7T63s9NwwBljFbTvalo5G0pdLXcUHHW
	ESPicBMBvRxwdVZE2O8qfzPQOh4tlA5F57Mav9mI0tv7sas7v1Y7pr1EjCx5ujvA45U=
X-Gm-Gg: AY/fxX62MxAF0V9iDyhnZqqIwgy3gK34S9jOqOwrg3+XBtgJU3C7oyZCMWu2I45SfDA
	RYQqk2/+fvF38a9ribWT1mZhhFb9i04eXHnsBn4JLzqnnJZdRJwDs6aUTenOOZYA0iQDmjnzIUb
	hYkemQBnTjce73UnBHh0atG8eDqM5vNlZ46PrDTacWARxNjR92ySTHpDSQ+1/BDua9+gPFEeFdK
	F4VJ6F6QOSye2zojTXIdTfoWQGTxviz98pHIGBqMhU7eQuE1mvrQEKb/Isgb1CHlvd7U86C8hGG
	no9rbSjNEdTvODIpW8ro9JoTo/H2jPgEmzeqvM7uzPGm81gyFm22Gg6NGZgq/8YcYXD6lYen7k9
	mVR17rW26RyF2sLZwMruxUMlBG4tD12uQi0No3211IUTJ/3EXJwYNeSEaLeE88XSSxtW5DYdD/0
	amXoA6wbte32Ni0Gw97A==
X-Google-Smtp-Source: AGHT+IHIyW6EL5Qeds3ppqsne/ep5l8vVI6WL/+6EbkwC3Ri0haHzlrCKUwNVD3J8FuYeN4YtG8RdA==
X-Received: by 2002:a17:907:a43:b0:b76:74b6:dbf8 with SMTP id a640c23a62f3a-b8426a67855mr36978666b.14.1767630875838;
        Mon, 05 Jan 2026 08:34:35 -0800 (PST)
Received: from draszik.lan ([212.129.74.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84265ac3ecsm40253166b.11.2026.01.05.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:34:35 -0800 (PST)
Message-ID: <6eb57ad14908ae894f090ce83c756e4cbc834aba.camel@linaro.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: mfd: maxim,max77759: reference
 power-supply schema and add regulator property
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Mon, 05 Jan 2026 16:35:09 +0000
In-Reply-To: <20251227-max77759-charger-v3-1-54e664f5ca92@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
	 <20251227-max77759-charger-v3-1-54e664f5ca92@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_083438_977290_5211D86A 
X-CRM114-Status: UNSURE (   8.37  )
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

On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Extend the max77759 binding to reference power-supply schema, so that
> PMIC node can reference its supplier. Also, add regulator property to
> control CHGIN (OTG) voltage.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0.../devicetree/bindings/mfd/maxim,max77759.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++++++++++++++-
> =C2=A01 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

