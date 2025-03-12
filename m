Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C7BC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 16:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDMBG7Ofhb8Xcjzw4thNxoeXHKWZ/B76fEVimy8iEtM=; b=tpYJTQ5F21h8yakZImP5JEF+7o
	5s0IuBjlJ1WoSBb7wG8PeUXRV6fI+ZDsmXDR369vfQJOoplJfRnWHpHjhkmD+r9pUQPM6yJ+dRPuy
	J+7MHaVn6J3ujGAbYY4tJdCZc1jpMvAODGGA9+HoUeG9EPRscXVWWhpV9ZLEVr7C7zD6oTaCfCex1
	ZeAsUNxkKDkpg9VwcM21CFP8eIwfz5UznZSp+5r0kyRMgGD0MN8Mh1EQAKw/YEIw/lSz86jduBvqq
	SumLq/jVRpur+X2NvYmBpbXjGL2aa8U1isfYrmtJayXhQD93KXFJOcrVy2/WK3xzzNDH3jGebbEfq
	l9D8DdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPPS-000000094i8-0I4u;
	Wed, 12 Mar 2025 16:58:22 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPNm-000000094bi-3Sim
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 16:56:40 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e5b572e45cso12783160a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741798597; x=1742403397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDMBG7Ofhb8Xcjzw4thNxoeXHKWZ/B76fEVimy8iEtM=;
        b=lKn19iaf7ramjNR+39BbQ8ioL2IEtraHqSJscFyG0uo/neLTDPwccQGaKBAtjsQgME
         6RUBAq16oKRDXwUe4FzicBS0+BdEBwjdYW6rS6u1AAqcoTXP6MTpgqkhY/AiXcECKJm1
         Up1umGrt1D+XueeEhPMWDi/vwUsa+ddwhqlfgSrHm6EO+FFKMArxAxk6rIFHQ40a3cEj
         nptmH0MAO6woaXy0cGg2j/GfFOh7OEKBayPQzsDvn0khFl3gnD970sE5HzwRloQiIZDc
         3YcSmGY+1oMZFPzPdndhDzWDowt2eFAwm2AH4rZWCxENaqs2XdJWlxWv2DZefNorxwEG
         kx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741798597; x=1742403397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDMBG7Ofhb8Xcjzw4thNxoeXHKWZ/B76fEVimy8iEtM=;
        b=TpJPD/Nu0R6cuDDR8BCvB9hxq+DBbdwd9wqHyZGpRRD0YScfX/iFsZzQtsVywW32z9
         kKXOyrJN64A+vd4DnYEuYoBm46LvrQCSntvrQgV21zZmlGrRbBouZogPyZ8BIceZDDas
         yYxJ2JOaH45URNQg0K4M6/XYPCGdSDreS2WRiUmIwbzIBxVykCIXOnc04SZaUmcyTCu/
         69lT7mDx/Vj4A07WdM8fja/Z9eJONABleWlFerDEb8Az/eFSDclbv/HdwAk0kUikbgMT
         Npb13SIMz721SCqvx7oNLk+IASNaQ/7/Y5jQqi3BFaT4FyxbIFTseF0teMtemiKgplzW
         c5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWZl1cArpf/urvaYF5iV5DYnGSsr9llqBF8lVFr3ooPigiu3+m81ELsyHzuXRdssw+2aEne3e0okILUPYNXalmd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+sTC0qQXeHZx1+aeI7T53adHiLf8NFii7Is80SA5uQHIMAf/F
	NckNueOKB7+6REF5sEiYDGWBNZzakP3+3rRT4GWK7rS0KjcZv7St
X-Gm-Gg: ASbGnctoXWDyGDHLafgFTvnv34f97RTtmjULR4pLn+JSkqJvAaym/2SoesIf5IfnH85
	rufihvbzfVYB5DPkwRxihtxqFSDtsm7wQH421bLr1IEKS631K5EXePqABXDbWZKfFtKnOByw8de
	X0ZWjKsYm/CzK1Kop5e1KTktdJcOlEqOYYFHAnc97We4Q6BBwPbKk2aMF93PVe5//wMCeV4Ev9O
	RsgK8IekCd6f1Zp970K9oRr+zLflzVbOwXc/eT6+5SQdIZDfE0UBy4VnJKztoynJKa3MRZsoxSe
	+M7jL3nqPPQh6giGDqq5vwhOW4NDvK/h8DIlW8lS4Lip2o4DLjGGrSntxbpyDyChTXEoudMvnTT
	jgaX53O2ucJ8Ul970RR+R
X-Google-Smtp-Source: AGHT+IH8y8hQv6Sg8xyZcCsQDnuxux9UAtTTC9yU686JDb3h1xpkGSNrZOvF6nGyd/4nw/gseiJziA==
X-Received: by 2002:a05:6402:d0e:b0:5e7:7262:30a5 with SMTP id 4fb4d7f45d1cf-5e7726231demr9291906a12.23.1741798596469;
        Wed, 12 Mar 2025 09:56:36 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c733f8b5sm9909588a12.12.2025.03.12.09.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 09:56:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/8] pinctrl: sunxi: support moved power configuration
 registers
Date: Wed, 12 Mar 2025 17:56:34 +0100
Message-ID: <5869984.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250306235827.4895-5-andre.przywara@arm.com>
References: <20250306235827.4895-1-andre.przywara@arm.com>
 <20250306235827.4895-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_095638_860702_27EB33E8 
X-CRM114-Status: GOOD (  10.73  )
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

Dne petek, 7. marec 2025 ob 00:58:23 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The Allwinner pincontroller IP features some registers to control the
> withstand voltage of each pin group. So far those registers were always
> located at the same offset, but the A523 SoC has moved them (probably to
> accommodate all eleven pin banks).
>=20
> Add a flag to note this feature, and use that to program the registers
> either at offset 0x340 or 0x380. So far no pincontroller driver uses
> this flag, but we need it for the upcoming A523 support.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



