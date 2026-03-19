Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D569C108E1F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yC6Ijh7vCR3XdkIrIV9yo00I9p5DCq5XZe85XCd2G6Q=; b=LnbCAl0cMDbibLmAXho8vMzg8c
	lqAgAwDpde8Rqb7XJO9LzQJA87KC5C7VIxNLqbniggBc8EhboEKaINariUXnZrM87DqMRpnzcZycs
	t+a4iB1ctAcyitHqfRADUyGCkvq2RfEplbLBuCxYmP5mo/dUD+eZw0LuUqJPMa2T/wNti6x9G4D4B
	t4B7MUtXXrv6yMkQFUW62jql9gLjZ8yTG9aUgsMxg1tPdsLiljcrQq6nVqOgRaedKzAKXeHKEKxyG
	X/NYaJTk/RVuIQlLc7s/vowxWmSM96L7W53FR+P2tdGm5+etglL/qqAEO/ItcPaauPA4rUnE2DNt9
	xObDbcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3C0g-0000000AZpz-3DAO;
	Thu, 19 Mar 2026 11:57:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3C0e-0000000AZpP-1EaZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:57:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4856cd3f1ffso8866835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 04:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773921470; x=1774526270; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yC6Ijh7vCR3XdkIrIV9yo00I9p5DCq5XZe85XCd2G6Q=;
        b=l0jits1Ghfov9TLTjCCqRpu5n9vyoEZTQYIxMDkJDxuT5Ep1FNTpDbryPnOnXd00Mw
         x2V+GqFgNMWmOtHnpf+x5wKFN0NKPAMS2hXhXV4BADBTpQEMSHCk0CF27r6hyGOxwBR1
         V3hpvAJStXjGZwudUd6zMOb+xANiY8lIDx+pL91YmRbyV+aEsiT3DoKG+t4KuFarqJD9
         X8/UY1ENSEW9ekyhuG7X8UXfOuuaOO2PHhVSlWYe3t9U6AgpYAtRYN1G7J3XROT++RSw
         WjsJBcBRinLKhmmdSeaXBq86E7S94zZN1jsK/7rofzMiwhVqwePVyh4i4kFlRYPIEaOh
         uDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921470; x=1774526270;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yC6Ijh7vCR3XdkIrIV9yo00I9p5DCq5XZe85XCd2G6Q=;
        b=VxDtlJ489TfXwMqn+b55Hr/u6FrwsP/CoVy6FGr2Rlenrd5sUQM1Z8wx6QV6qY0gA/
         6TuM33LeKMkTkZYISmsLaWFhhlBaXPtgHANrpnoSvbq9CtHv0MW8vZAf6oC6ZWUjD/S3
         oNYq7KHbyxkUtW2vV3CXoKLFmV4u59PTye6wvD6pQjdjBDNu0CHyzUfMDl+kqVo3LH77
         kLOGJ1zNb+xx6gL+dO9GEYG8PvN9o4NrW3fcR7hG6ShfEmPTuWhtkVSexkIH0O48ZeqA
         GyJpRRN/aSKstZ2gPVEjiKZEcXojd2cMhh13B+mExCz4oGOJIXgXLwFf16lrcUePs5mX
         s+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCX3j6sw1Q/0Gh9dz7NFydV1R+uAksquxn73aAtKHiMsPvEEFMpk6sy00yUKknMY8b5c500BpoAhxo52L+NtoAuT@lists.infradead.org
X-Gm-Message-State: AOJu0YypZf4EwhTbe4UOsKsa8LtMMblQSqr87TjKrZVClsNNyzmH5wOH
	ePIzEhPD77r5OELAwpzD2BvRAYtWtVdoWNpynF+y5ISMQ1no6T67aaARVhYU0V2wLv8=
X-Gm-Gg: ATEYQzzy4Ty+LptsyQ83Jwx5ohwaATdVlEA+/+tgw4p0wvjKQAb3NV/EiOs2BPj3qIs
	j+iRH20d6AghhM/ECXjV19uTJ0PZvrKdKkxyAJDb83GE1yLspNsxWuRX4+GAh4dmbKnHF+eWzpD
	fcsrNDV2OephG3QKvtMDfvDfV+zu0NrzkpqVH9IbpydoCBqGUlK2/Pln0mDGTs5EMwm9Ib1XIsI
	cOb7wVgX1GIz2atoMQYw+HibxCpZZ3Ub7mgylOlzGigW1p33aJj9jbajZ/ejU8MFSM4b3V4HDfY
	W/V/XGYNVH1dEkeSwgR+5ragnkEEoaj5HH67LsM4lAS3+NC73fR4Cgx8B5UJYuTp4BX59PHj3ag
	rOCgCd2MfrlWopvmYBVJZsbav2Bso563kpLEFHhSP5UrVwr5EpRhkSRTPGA4/kX5WsqYUwPP4Wi
	mC8mT1fJ89JXQ7qgryu6PwhhTy2vg=
X-Received: by 2002:a05:600c:1992:b0:486:fad0:b166 with SMTP id 5b1f17b1804b1-486fad0b2c8mr30813105e9.17.1773921470276;
        Thu, 19 Mar 2026 04:57:50 -0700 (PDT)
Received: from draszik.lan ([212.129.73.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8bd5f7csm65030485e9.0.2026.03.19.04.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:57:49 -0700 (PDT)
Message-ID: <ae31c62c940e99077d44e1935465dce7db0e4c06.camel@linaro.org>
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Ulf Hansson
	 <ulf.hansson@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Thu, 19 Mar 2026 11:58:45 +0000
In-Reply-To: <c5ba58fb-50f1-4067-a099-97169ea81f68@samsung.com>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
		<20260318-gs101-pd-v8-5-241523460b10@linaro.org>
		<CGME20260319101424eucas1p2d5dca06240e8760046fb40507ffb3bba@eucas1p2.samsung.com>
		<CAPDyKFrprMSLOBMB_BHbi=j6UXV4dXBn-H8M1BsqDWNSCJwvuA@mail.gmail.com>
	 <c5ba58fb-50f1-4067-a099-97169ea81f68@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_045752_380792_5797D6E3 
X-CRM114-Status: GOOD (  12.67  )
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

Hi Marek,

On Thu, 2026-03-19 at 11:29 +0100, Marek Szyprowski wrote:
> On 19.03.2026 11:13, Ulf Hansson wrote:
> > As a follow-up patch on top, please consider converting the open-coded
> > polling loop above into a readx_poll_timeout_atomic().
>=20
> This has been tried and it doesn't work in all cases required for power=
=20
> domain driver:
>=20
> https://lore.kernel.org/all/5c19e4ef-c4fd-4bf5-88b3-46c86751b14e@samsung.=
com/
>=20
> Probably a comment about that could be added directly to this code to=20
> avoid such conversion and breakage in the future.

I am planning to revisit this in the future and am hoping that we can
figure out what goes wrong when using regmap_read_poll_timeout().

Hopefully such a comment would only be short-lived, so maybe not really
worth it? I can add it, though, if you prefer.

Cheers,
Andre'

