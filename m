Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bncZdAxiyDhHVEptV1GKmJZO/emo/e4qlZdeehgb6v0=; b=P8ZCjDaxyMwrO/h9+m+ZHw6XfK
	vmuAHeTVex7wcnwMS+N55+P9LuoMBW3zM85WS1l0qE+KpZ8IWIWRGoM02iu/Y4PpkDQ5OVJFsOQmy
	A2wWR1IQu2oUa1nPMwtAaA9hLGpU/3wTxQK15IR9pplDA771/La7fOQ0xWwDCZIAsFhFkaDBqdMMM
	va3CvAb/yW1YaeV5tmbp2ge0dEQobHC4UgBN7KEiMs3V/otXl3tsYmsM1B72wSYUcGhAgxBYOyj2P
	ZVFLpQz3ywj4Keq9JYxvgOjk/GGorJUDZUL2kY2XfmopGetV7ELGM2EyF4PLSurFl14N7b+sLbKI+
	EVh/gDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvJE-00000008HCo-1nEe;
	Sat, 04 Jul 2026 08:01:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvJB-00000008HCR-3icH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 08:01:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so870491f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 01:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783152063; x=1783756863; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bncZdAxiyDhHVEptV1GKmJZO/emo/e4qlZdeehgb6v0=;
        b=tHdlHtUQP2GzfvnfvkFrQNHLU5dgy7Dr170iN7U826QEBiwD/dl3WbqtY7dmUmnVEq
         j9ldNR2YuX4mCY4GRRoBfhMsr1tBlhSXr+eBoaJZhYVpvipJbLvMvJAUQzJBDNiZiMNI
         A0UkiE1hcbeYYKnwurIM6HTxORMUVBRtctPbB6K1tXme9h7kTvuH/ghj9QfQllzNbMWb
         UejADvguRkHO6Zg6Wy1Zn/o7+02XFKOtnKtsrbytF67pscy1QOVVW2s1kC47/1LOdogJ
         xAVf8mx9QdTOGV3uwg4532deM8oo0bDtkNPTGVbvYD2/Xzd5huFY7ZwCaeIfV2dQHQna
         h8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783152063; x=1783756863;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bncZdAxiyDhHVEptV1GKmJZO/emo/e4qlZdeehgb6v0=;
        b=XL5EyMP7m+sVBG4THA9rQjBwwnQV3YNQhx0/C4kS5UXpJoZkfTiwqO93Mlxjpi6KFn
         HIFZ7T/MfMSi6N6PTwohESvNTvsa8fJQcrp6+7z08fyRwp9rD0CtsAjaadSYPaAjvcqU
         Q8YZU1M/KzQSxSGJR/dxQK2MDQ5zTJ13LluDLnY/uk0lMoXS++UMK9peh91njap9WdLt
         4fJXgPh0vRiB2qxQjrZVPPaTx9paOueUppmfDfeo9nZlLzDw0y9OdYuLRV6GIv6gQSNP
         cbP2iE98iT/5zfBoihr+9cahK6sYtkFMX/KCt3rqfpotuV7BxNqT2aqnwCWONbB/R4Af
         Htbg==
X-Forwarded-Encrypted: i=1; AHgh+RparI/m5z3HIGq7eROQeDzdnNMVWE5XgY1c0MwiFz5tGv6zYtIC8Rp2huiPx80I0xjmVHsDtfSBFkXOH9t+mqy/@lists.infradead.org
X-Gm-Message-State: AOJu0YzL+o1aRFhR0H/zdoDFBETTxWL2Tk2Jn+6gl3IVlF44zBgvtGnS
	TA4JsZkgD/AOLCeQUKcQwPwjIzfdST+5Juzwx+mVm+lHj3sWIT6BxpiZ
X-Gm-Gg: AfdE7clUhlnsgKcNHnkO1h6nhOSkG2H4HmI+yJwaDXQZNhDQ53lpwqy6w7xKAcUXYEl
	+gZXy6pCyWWpniV21i2smv7Ipaea1verM8BxMlhSr3h+0REx+7VlfeeTOiIac+SjBl4dqDGiYAP
	ZJxYfKAUOGeClcXATFOvxF0t5eSteyDgHnS1wWT68OWON092kDJRhfF55TF/IVRmX2YpRpLhUOZ
	p3q4TqlL//fyxixOVfyIYLj0LddADBBEGUQo6/RSU4/zbtDEX6PS/oLT8WQk3uYARqH925hWKUA
	pjpesDdfikgcoyAFHKQ9jTkntFk1arW5iOB3/tHPzKU6KhTX8piow6K4sWG2conMwx0hKjN7IgI
	2C50aXt69TstEGYKX9i/r7KLtyj6eICY0udHmYo8ekN3eW387HPJlflpBliEGr/rr1qEmYodnou
	4HW6GoGe5PexVe8A5Keyxwg9Et
X-Received: by 2002:a05:6000:2086:b0:472:f8b5:aaca with SMTP id ffacd0b85a97d-47aaa60d3cemr2987044f8f.15.1783152062911;
        Sat, 04 Jul 2026 01:01:02 -0700 (PDT)
Received: from strix.localnet ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm5967457f8f.20.2026.07.04.01.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:01:01 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 01/12] dt-bindings: soc: zte: Add zx297520v3 top clock and
 reset bindings
Date: Fri, 03 Jul 2026 20:20:58 +0300
Message-ID: <az-AzRTTT8qfUWysHYig6Q@gmail.com>
In-Reply-To: <387ff0d7-256e-4b18-b864-37a0ec3c9d9d@kernel.org>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
 <20260702-zx29clk-v6-1-377b704f80c4@gmail.com>
 <387ff0d7-256e-4b18-b864-37a0ec3c9d9d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartQJbA9XBiSfGFnWS6QAvhhA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_010105_979854_E041A64A 
X-CRM114-Status: GOOD (  17.00  )
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

--nextPartQJbA9XBiSfGFnWS6QAvhhA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Fri, 03 Jul 2026 20:20:58 +0300
Message-ID: <az-AzRTTT8qfUWysHYig6Q@gmail.com>
In-Reply-To: <387ff0d7-256e-4b18-b864-37a0ec3c9d9d@kernel.org>
MIME-Version: 1.0

Am Freitag, 3. Juli 2026, 09:26:43 Ostafrikanische Zeit schrieb Krzysztof 
Kozlowski:

> Also, this cannot be placed in soc. Clock and reset controllers DO NOT
> go to the soc directory. Place in it clocks.

Even when they contain other functionality like hwlock, usb phy and reboot? 
Here is the previous discussion that made me move it to soc:

https://lore.kernel.org/linux-arm-kernel/20260621-plywood-straddle-b01f0c45f27c@spud/

Likewise, what about the node name: syscon@ or clock-controller@ ? Conor 
advised me to go with syscon@

Cheers,
Stefan

--- Quoting the relevant parts from the above link:

> At what point does it make sense to move the bindings from bindings/clock to 
> bindings/mfd? The controllers are still very clock-heavy. allwinner,*-
> prcm.yaml look like clock, reset, misc controllers in mfd/ whereas 
> ingenic,cgu.yaml, sprd,sc9863a-clk.yaml and da8xx-cfgchip.txt are clock + 
misc 
> drivers in clock/.

Yeah, to bindings/mfd or bindings/soc/<vendor>. Which I think is mostly
a judgement call. Two of your devices have at least three functions,
which I think is enough to make the claim that it's not just a clock
controller.

> Likewise for the node names: syscon@ or clock-controller@?

If you have syscon in the compatible, then I think it should be syscon
in the node name as it's more general and makes it clear the device
isn't just a clock controller.

--nextPartQJbA9XBiSfGFnWS6QAvhhA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpH73obFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiNJIP/juwHA8X9RyBoj+10iQ7
1g4HaZ2WplDlaXdAXFSUIIPLnRJ1FaxeR/c67EHaFB1UhOCsxGydBunolYNm0ywm
WcWWVIwLVVEYJK1F4y7klFT+WXmxpxKy+cvUqPE8PTJVSElYKWDIeMlTEpqRsqmM
rHT8kD85FcYJOKC7LWqwsyc/SvOuG6090G8ST6Says/wbMRgOcndTSWcAOaRy7GA
hTajEqu9SWKZj9FQhh77k7y52eQO1DQroEJZHANSuy5CFX82VZdJYjIzMEBf395v
nNCDWMemXUX6Nwn6XoE8BfLcQIoqiReuwtcpqCnndeJsOnNEh7cUQ18B2h+JbBpH
Ri0Y06+3/aJxcWviyC4R1WuZxs4+8mjHRrRiXmz5oFYoO/I1ySh+ndujzDdF/lQG
63RgX+idYIgZUNq4fgVq/IpnrVC8fbWvj2XeyRA+mXUx58xWgFLeEcv2iOLux1Bi
uXgsWzLAjccxDBOKeu1589RFQAC4rnVjlZ0KTmKdhw3IkuNspUEeocm0QBHZZJD8
/R1aRtSYtfaibMbhn1Cb9lUzYmGwJoNSmrXQ0GIidNtfSjsE7CxbWm074UpAl8qG
B79r7ULixFkF5pnFr5ExarCVWt93lKOKoOTcUgtFyuBLTVduNR47qfGY2fJd1WiB
iZ8IMly+LgRwX1l76oyj/IHD
=s2ps
-----END PGP SIGNATURE-----

--nextPartQJbA9XBiSfGFnWS6QAvhhA--




