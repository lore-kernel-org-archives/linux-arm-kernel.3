Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4A5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=; b=CE7pQzDETkafuhutMdwtDa00P7
	La4BAX+aFV8TtA9MhK4Sg8ikQ85wJooZZ7iJ0FmeGvH+kahjTPmbU8Np2YnmFOUPWpcRV57Yb/QK1
	be3uAYHMpEXNIv2mZZzVkJoWYUC2PJ2WZiOjlSsP422pZBRAr5A33YBTBXydC0Vt3sWFQVHkudKnt
	dhsy8pzbd5m7KMtLqupyaPig5P5zC9cRmrmX8Gcv8uLlrUW3q7qAmFka0KED6w69IRWicfRmnWcYK
	x4cU+UOW35rTuyl6MxFUhFMXOLZvHwSZtcsSgBYK42EbmGN22HLjRNdS5idENDMJbTvAtgvEkWshE
	9wDUo0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRnm-0000000H9O0-27ZC;
	Wed, 08 Jul 2026 12:54:58 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRnj-0000000H9NP-1u1Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:54:56 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso1280854a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783515293; x=1784120093; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
        b=lvu7nPoAnAT6gD/SV5iidZMpyHpKhD+P9NuSU/N2YSFIcTGG6otabOKBvlAjRqDF1B
         DHRX2mgx+5e7wlegcE/X0QFSSli8CJtLy8+8PYj+UYuYLTvcG0QOMjL1rjLMCyH1ToK1
         q03UFjYERPMzQx780e25IMtqxSRUGFCeYGmZLEP8ZCDZbJBOpireFGK+4MDotBgPGhRE
         XPs3Gzj7jjJ9an90tPMgxQGPHHDX46qDSrTl0GcqVwQr0DvTr/niKf4zIlN3q3AT6oyS
         iFPEQSfBII75ipLbkDvU8yXAD7RWb1VC1XCI3y/pYPkGqVDV/e77PV+KJ0l+tn2YRzGx
         05dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515293; x=1784120093;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
        b=plECHE4fn/EsLuGZpSmcsQE1eMrDJeUUAWUtpwp9YKQOAIOO+bNMp2nECmyGy978cp
         /AOW4hjfNZCiteGYSkmsIFoANIVFUcX4jtPPD9mSwctaSZgLZrXkvJskLf05lyGXF31K
         ih8TGGUbmqBajQypCaHafnchH3iN5sdEZhRvWmG3toE6Izm0nqHXCINfK1u3y2bZLpfh
         jGYgv/npseKIReslJtvN+DlDzVy1HPtixv9tbYuP9q3WttvpLsseMhzqYSu8Yrjw8bSr
         Y+/OCW/aUmZ15HiBQzC2AXbiESGfomiprEV5TEab/KwF/YjNgDVViqHtk6/xaDwrQcBL
         Vi/A==
X-Forwarded-Encrypted: i=1; AHgh+Rqqva1JBZKZslwXtZj3J+61UECbgw23XPY8D3+DFsGw7FL7bhba6AcpGAxvXP6Ugyvv6NS7qPCQGelq4h1zt6/3@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ/i2ifvSGCUfFqtfToDHM5ALLZT3kY7pr+gxocrrWR1wJLYHL
	qe69FDHvuox9X+7m2xRNVhbO1zdnBPBEzlLLi3A/ecn5wunZkbI5Lcfdg2OzjirUpeQ=
X-Gm-Gg: AfdE7ck1Qri1HruSQMXG7OLRgSPDfNAho/m4yIBlDHui1iLVQ/zhAPCxh8PWCQcIFMT
	dbYCXteUTJMQzTzIEjNdrgiuo9EpGyczz6YIiV+eswZFN1U2CzSW+Nx4jlk4WXeRsxzg5AGPa7O
	nysfqrR2ER1WF+phqs5ub7k8DsygxMm+8cwUCIkoY08LS9GmzE0u/lZsKRZJqNq/WzO5Sk6vWmZ
	R03anfClq9v96DOXOmYLgs+hkVx/U1KiAX1G/Xo4Xn9MugRv4HzvR9hELT55E0zkrYCkeliE4tq
	yVi5ZdOF+nI7WKCLfOMp3drnAbiqPM5uVcm/mcKPMubNhqiext+D5N5zAra8WSCbA8OBeVauqjV
	IUdiU9DNkGt+JxHW8Dn0JIlTeI1VgP3nu1uzu9xLQuEwMiygmFS5DVXTbme6pd4QdwDdzZ5QyHV
	L+WmH5pcgnt4R/hJf6Nug=
X-Received: by 2002:a05:6402:1906:b0:698:b60b:aac2 with SMTP id 4fb4d7f45d1cf-69ab4453d30mr1054344a12.4.1783515292855;
        Wed, 08 Jul 2026 05:54:52 -0700 (PDT)
Received: from draszik.lan ([212.129.81.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa613d4e2sm2000319a12.24.2026.07.08.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:54:52 -0700 (PDT)
Message-ID: <4a5a09fd68fe45939bdcec4a3c5a781d664eb34c.camel@linaro.org>
Subject: Re: [PATCH v2 13/23] mfd: Use named initializers for arrays of
 i2c_device_id
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Michael Hennerich
 <michael.hennerich@analog.com>,  Chen-Yu Tsai <wens@kernel.org>, Marek
 Vasut <marek.vasut+renesas@gmail.com>, James Ogletree	
 <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, Ben
 Bright <ben.bright@cirrus.com>, Support Opensource
 <support.opensource@diasemi.com>, Andy Shevchenko <andy@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald	
 <rf@opensource.cirrus.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade	 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros	 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Andreas
 Werner	 <andreas.werner@men.de>, Samuel Kayode <samkay014@gmail.com>,
 Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, 	mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-omap@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Jul 2026 13:55:06 +0100
In-Reply-To: <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
	 <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_055455_521786_C4F5322B 
X-CRM114-Status: GOOD (  11.17  )
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

On Wed, 2026-07-08 at 13:15 +0200, Uwe Kleine-K=C3=B6nig (The Capable Hub) =
wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MAX7=
7759

