Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484B3FB3D19
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TXj5dE4mqvc1ssxoqFjKHWoirafJM76VbqarPKJr48=; b=iTtGHf5/rQnDE5NxV3/kOFDuhj
	hpcmTOyhFMpibKXqJJ1E2LY4pm2ED12TdI5kj7HnZv3mF8u8MwYBfadhGAcdRzN6N4plwBzwfGukq
	dZnGah0xBkbD6Nipg7ezGcTL5y8y7LnXTXnoYNbHJKv1qNXwbKvDqIhM2u6ej857xwcqwmM3L6PqH
	v+reJCCnAOrY40dT4ZCCt+37m4zWs5YQlwKJhUkKi+Dueinlzoj0jm6X4X2CDfrmzVoFuTKfoGAm1
	KeMeL674yypnvtpdYuRcfm8B05MhrxuEQGtVwDNKxS5bhDSMLsYkyecq9E/709WCQjOSwSwudzPGo
	bKMx6N/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AL2-0000000B7Wu-1Dp4;
	Mon, 30 Mar 2026 10:59:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AKz-0000000B7WL-1x2t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:59:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43cfb723698so761937f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774868355; x=1775473155; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/TXj5dE4mqvc1ssxoqFjKHWoirafJM76VbqarPKJr48=;
        b=YWIQd6kcfEX3/T9R+V1ouT0KPqR5dEr57xv+6LJQuxNTsgyhNCmWoud9+MvQkMOhLb
         my6s5ox2atPGY7hkjPh7Yqr8/LqFXD+12fPlCzUhZUagA1p6g3CDl0w+ymyivdl/sDWd
         p2nS679g0XoW+x0b5iUkgAVviGhWaY3U7TlOmbnPqwjspGYQYQVy18ZPrFXV8FlwiRGM
         wDzQ8o2+qgeAZqcFctEZ2n352/YVjfxgbt8fK6KW4tOO+2s0XZ1JTDqobX+UJsQCk1F1
         PiBvAPx4E2oggIhAChAOkAxZRzeimeKHGnfXstC0sx+ozvepRbatepEenFXnPCxabFV1
         D8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868355; x=1775473155;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TXj5dE4mqvc1ssxoqFjKHWoirafJM76VbqarPKJr48=;
        b=muFhqi8RPQAUKPZ8rZfv+cfzy1nueljgk4NLVpjOm1YZnrFyC9v0uC1lzg8VrtkVDc
         7nyhTLlzhiViXVSRFXvJR/eT31aW6eutc1p8zl5nKYjgP1pBLKgNCL08UheNDIgeLwvg
         BYzQ5d0VOm6K3O/kljgeDh+viWcwAIappOxlHJa5Ycn10Ype8P00yFssLt92gszgNNnX
         LsdZadbVeZqIHjJGY4mXBnnT3ki2ABUCUczZppgF6tVOhcuOhuh6w91YdWNokU/i2Ifw
         f5j7QklmnVAI9TAzczHQN//LoLvKNnvuY8orbFYOnIRp0NtkqUAGNBBy8fqSqo0xFVex
         bXpw==
X-Forwarded-Encrypted: i=1; AJvYcCVnNt98yTOiBJh7g0Qlhx/ZeALIzF6c9TgIPeSziRtaPEOldCrQKYMB813JQJrYHUt5Kp+VxSTs6EKpXDm1fFJA@lists.infradead.org
X-Gm-Message-State: AOJu0YxawkfUitR/3RjF1HbmHlTYm+IO/CB0nnEBDGb+RQeC4SrF1wiu
	HaeBJkNbYVrROSpWTSOzYvx+OfCb3rpl99aoVzPkDwE2b/Tbw94DUs1iisxZ+iLpL08=
X-Gm-Gg: ATEYQzwuGiA3CrRAUzTmcUIAdsJC0P3CGKZr685RdKhFZ6KgO9XLj7uMRLg+nnEULAb
	oza60IWRvcfY1VK9/MbkqHsQMw/FwsrOYhTxVrikU1uKYe3boILqkSCdHS32kQ75Um9D+k+HocM
	8kOvBr4DfAAnniOMBpccOQEEnBowjS+dLqhkACsZAvO2T88XcYYjzWMS1Gyit/CvyRfCn3cdt75
	eBf7GGJObcdRB1cd9SdfDAgWhKMubAXU+2xAaDmp2MOjJFnVQ84Hp8zoRcz7F4iN7TSb1aHv6MM
	ePBvEY7O2xPxiHywsV0wqfkRPeQGa73wAXdfuKqnkZqQj0ckzHzhYvDjxSB3TqGe/g2nffgnwyp
	RkLFQ/JLF0z3TFpcyQytL76/7zjSvLJoxlsA1wUJrZeKVIlfgYkHRKvSrG+23Au0i19vxcYk+fd
	VjSEG58TZPRJDEckW8LWPmebEI2ruD
X-Received: by 2002:a05:6000:4010:b0:43c:fe7a:4917 with SMTP id ffacd0b85a97d-43cfe7a4bf8mr5625551f8f.2.1774868355539;
        Mon, 30 Mar 2026 03:59:15 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm18943009f8f.30.2026.03.30.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:59:15 -0700 (PDT)
Message-ID: <abeff7983dc08c3aeee8b504f34b71b1a2fcdb78.camel@linaro.org>
Subject: Re: [PATCH v8 02/10] dt-bindings: power: samsung: add
 google,gs101-pd
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, Will McVicker	 <willmcvicker@google.com>,
 kernel-team@android.com, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org
Date: Mon, 30 Mar 2026 11:59:14 +0100
In-Reply-To: <b66d7230-a495-40a4-ac75-378d0727afed@kernel.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-2-241523460b10@linaro.org>
	 <177409897339.266364.69715997034739052.b4-review@b4>
	 <6f0be0a71c74e7a7959e9ad02e93aff1cb8ef712.camel@linaro.org>
	 <b66d7230-a495-40a4-ac75-378d0727afed@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_035917_508381_077D1433 
X-CRM114-Status: GOOD (  12.10  )
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

On Mon, 2026-03-30 at 12:55 +0200, Krzysztof Kozlowski wrote:
> On 30/03/2026 12:52, Andr=C3=A9 Draszik wrote:
> > > Your patchset is organized in odd way - first patch for me, then not =
for
> > > me, then again two patches for me. Please keep it consistent. Or bett=
er,
> > > decouple since there are no dependencies according to cover letter.
> >=20
> > I'll update the cover letter to describe the dependencies. 4 depends on=
 2,
>=20
>=20
> How 4 (soc) patch depends on 2 (pm domains)? What is exactly the dependen=
cy?

4 updates the soc-level pmu binding of gs101 to have gs101-power-domain
child-nodes, which are introduced in 2

A.

