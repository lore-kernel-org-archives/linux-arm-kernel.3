Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CDFCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 17:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/6fDvnIguDHo3k7rp3ZTnWwimeNwTtivMzdauHwuVo=; b=VjI0VfFEr6XX2DrNcDPZzVno97
	9xZthnWWWl0pfZ7VAi1FyuSuEd7aa1lHe1iAPvlxHVLDOos+6FxydUMx1qFLK8TubRzWVdAMjSswm
	caN2VgpuEYG+ry9rtmpAK5acaXtVfGUAx154ZuigiXfx1BFjCGaFjhccEszbwv28laRGlqd5g+RBi
	lLVmz7tWcalWFfMNkiUkrjTsSg3/Op+CHJCSR/+ZUOjzjR8TZ/+9ncAoU7uC3T7p79vya3P/TTjO0
	6DkbYI+uuyd1+AlxTKmhjSsIhCLU0lTks8Ol5+5wOU5Cwx8ltzGqO2vPtjpb9S5GxWHCxnWRLT2u7
	hwRnMNfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wazUS-00000003Tva-2R9m;
	Sat, 20 Jun 2026 17:28:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wazUP-00000003TvF-3vQT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 17:28:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-46255b269c2so2294505f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781976495; x=1782581295; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/6fDvnIguDHo3k7rp3ZTnWwimeNwTtivMzdauHwuVo=;
        b=XIPl4cklMtdM3Lh5CoGmd9cqaBaub7c19/S+Skqly8Pew40bTHBjwUllcE5OSxbVoU
         1g7YqLobPfuwnCIDJ+C5qepUWAPGNYNm/qCuQA11keEpoGd8bBSL+GaZPYXA2JnX5Xjk
         VfUX89lFKNvMnn5f8aXIab4iWLlHADsLyMK1w4g8tNUKR9gE/WEGYpDrM8mRA67yeaaf
         EMLGU/ckkptLgWu2WdAzptq8MmrkEMU8KtCo7ExRfnueNgKO3Z5gdwu64iZaCqOAH/lt
         cf2XdGWJI9MZ7oickEGGBWwaD0uTlXqXbIRWaCF1XpqXFNqjWhAoXJ0fNS/rujaYpmA3
         MBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781976495; x=1782581295;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/6fDvnIguDHo3k7rp3ZTnWwimeNwTtivMzdauHwuVo=;
        b=W+GT++wNnEVoNkDDQw1EidylUdoAnU/Z914vJR2YqMcT5qbLY9+LnEHti2T2NYD9Fd
         JNWbFK1phKQ3p1hxzxSvHVeXHUgf6GA4+k447OaJAECbH6CFwL9JHv7otsj+fO80bMQ9
         X4TN7gRRGRmdV/1+3rxdTICAdfXKv9Fp3cMKCVVk2qq2HkuK/BB4m7YfzAV1VEAl4j4G
         MjT6evOOoG1gg0o+75i/DHHSXtegpf7nsGjqnRK0MJj72uia+KHE4EWBD0sPPIydwGP3
         ydOerjZg17Q5jL3TNUiqk6ahIYh3fHyTAoFExD48W4cCDkFJibJqltxwb0yGq4fOJJMg
         lnAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AUKDUxihUh3DtNKmKdts+OYcTRwS6KV05KcB0C2A8VF0wkoE0VWcWTzsWXg/qNhMzzfdN3GXxycQtN33P/rl5@lists.infradead.org
X-Gm-Message-State: AOJu0YyED4jkScuvqKkUkhGRB8tw8K78aZ2X6XqKB35UYO1MGKRwUDRm
	OM8Vo4/bl5zavekRL602/j6yzE5TkS3z10gGhTbtth369jB3Ut+bfOJH
X-Gm-Gg: AfdE7cm1rIfCGFWWsbYo3Z1mVl3v6MQhQqAkxeLS4rt4gpd4FYvXZglDlmyHJhftyu5
	nj13GbTdY+v+hoCswyBvHjYnhBPiO8UC2T9KUU7CSbAF92xGWnU3V97DsrsWVNN0CBTYxeHgBor
	mi8o+I58q7fI28oGK+FGRc8wRhiTc/dcoCatowGQefph1vmmB5BtJiewWZ0NEqkCJ2Bcy3UOrIx
	RcMZ6NvQK44PyqvCeCcbYz2xzugKj/en39BCxe8sWb0tZAbOKI73P+ohryOmbf1B0MB9qx1GqHv
	xK8yfefBREXnI7O3PLiBMlH8GM5Oa4LQb2O1VY2PpI9FDccvKU0H6092q9MPSVjUlaLjB/R8HDO
	x6oV7C0SiSNKdEflvKwREJCum+A5X6aXEDrm4JWjsS4DqA1lxPd1sOwJ53RMZ48Lrqqzhb2hmnf
	5zjjJNL1S0hiZerRMFYtGl9zI4CQ==
X-Received: by 2002:a05:6000:41ea:b0:464:5df5:332a with SMTP id ffacd0b85a97d-465026e230fmr13924863f8f.34.1781976495283;
        Sat, 20 Jun 2026 10:28:15 -0700 (PDT)
Received: from strix.localnet ([197.250.226.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4fd2sm9661404f8f.14.2026.06.20.10.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:28:14 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock and
 reset bindings
Date: Sat, 20 Jun 2026 20:28:03 +0300
Message-ID: <vYm1twErR8mp-Fjgbvf-MQ@gmail.com>
In-Reply-To: <20260618-fantasy-estimate-6c52edbc6890@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
 <20260618-fantasy-estimate-6c52edbc6890@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartj8KIpuwSTluwcOdB0G_0rg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_102818_011265_CD150970 
X-CRM114-Status: GOOD (  24.09  )
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

--nextPartj8KIpuwSTluwcOdB0G_0rg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Date: Sat, 20 Jun 2026 20:28:03 +0300
Message-ID: <vYm1twErR8mp-Fjgbvf-MQ@gmail.com>
In-Reply-To: <20260618-fantasy-estimate-6c52edbc6890@spud>
MIME-Version: 1.0

Hi Conor,
Am Donnerstag, 18. Juni 2026, 22:54:53 Ostafrikanische Zeit schrieb Conor 
Dooley:

I think I get the gist of your suggestions. I have a few follow-up questions 
to make sure I understand things right:

> I think aux bus makes perfect sense when you have a clock/reset
> controller, but once you start expanding past that and you have reboot
> or hwmon or hwspinlock then mfd starts to make sense.

At what point does it make sense to move the bindings from bindings/clock to 
bindings/mfd? The controllers are still very clock-heavy. allwinner,*-
prcm.yaml look like clock, reset, misc controllers in mfd/ whereas 
ingenic,cgu.yaml, sprd,sc9863a-clk.yaml and da8xx-cfgchip.txt are clock + misc 
drivers in clock/.

Likewise for the node names: syscon@ or clock-controller@?

> You'd then have topclock that is a syscon + simple-mfd, matrixclk that is
> a syscon and lsp that's using the aux bus. The topclock and matrixclock
> would have dedicated and trivial drivers somewhere that have the mfd_cells
> and call mfd_add_devices().

Do I even need simple-mfd? It seems I can add the syscon-reboot node via 
mfd_cells too by setting .of_compatible. It seems once it has a driver (even a 
very short one) simple-mfd is misplaced.

What about syscon? Topclk needs it for syscon-reboot and the watchdog 
controls. For the other two I only want a regmap. Afaiu device_node_to_regmap 
works without a "syscon" compatible. There's also regmap_init_mmio, but afaics 
I only want this when my driver is the only one using the regmap.

> Probably the compatibles you've chosen start to make less sense at this
> point though, but probably "topclk" and "matrixclk" are not what the
> documentation for this device calls these register regions?

Yeah I'll rename them top topcrm / matrixcrm / lspcrm. I just stuck to the old 
names for this email.

> I think the priority is having something that reflects the hardware
> accurately, I wouldn't compromise on that just to have the same design
> for all three drivers.

As far as I can see the primary difference between mfd_add_devices and simple-
mfd + child nodes is that the latter makes the MFD composition visible in the 
device tree and the former keeps it a driver implementation detail. My sense 
is that the latter is preferred unless a subcomponent of the MFD might be 
reused in other components - e.g. an ADC is used in PMIC-abc and PMIC-xyz and 
thus the driver can be reused as well.

--nextPartj8KIpuwSTluwcOdB0G_0rg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo2zaMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiA8sP/iDCZo9JCPTXlknep41Z
EiXNNHm4yYRiVaWnovL3ahmlVRNEQnKpkhizLzvFtmvkwpJPPWe+PQuZGKh1xfHX
j4l43lj0EiP9ZkpSFoJgHzskpiLVoCzt8IzYLzY5/miAhJCRVkVhudLZXb9AWTAN
5Kg2jCv4/s6gp4viQkwA58GEomii5C43k2D+j8/UBf4rz9mWrMuMRaezj7F0YqCG
Nik4IrBIHuDGWJyThgQ2mTluCQcBroaA3V/+jhDMTPg12FmhY4A5M1fpW33iN3B6
fo65LBzVwmhdjICendnz9go3I3ZEjqnlERFhlEqywbZBjNxFxhV0Jg7XAuVN9YOw
EFYuyNbzZy+u7KYvgzW8pswUYhOjAUupEU2EOY3+kKzmpkB+0hXeP10rTawXot4d
GKJFdt9emZh4/xFtEyeVovXR2bq6Kk40uZsgwDEf1KS+QtANtA3vstQn9rEhIPFZ
vVopjQLE45hhxKiWjXqUZaA0iJg+bmmy5HeI03X9b6jXgfaEhJBBAH0bRW9smBoK
OJ0wIe1JnGd0RnGM/1DjWedhXVq2RMfVgXCozzyFiETgXhYr++4Y57h/NgHzoNm0
nIN2gqG3q7T+OOkziGJmmcMyvONlYqcyy2F9bnJ1AgtGwdYhMWC159JK54VhAd6S
sFQ9rZwU2zMAjJ7YPlocj67G
=JozV
-----END PGP SIGNATURE-----

--nextPartj8KIpuwSTluwcOdB0G_0rg--




