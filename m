Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A390EA7188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwKzTLRiHs5eANohxZZBlyVS97g8sNagXG2LtuYayk8=; b=0nsySR8yPJzq/w+8uP3Be8u9xW
	PQSrqP+cUfoQHdgIhIRoHQp2V7yvD2vOlLFSU/txL608+XeCZRap1pLKaecXTfQk52pkoSeJ6aWnL
	cVScjGYGuMSkUsSG4kURi75kJjjju95BBhnkhGELP7cY2NoYSwBw9UOzw3Ze1RLAhAg4WRFeq/PFN
	y77ap8Dh4UA8+Y1jHcR+6Xzu7FKvE4QyoYJ9eiPmSpyBvrLMiFPi5yN43dFAAooWReBngyQRfkp/a
	blJgEpsxgo7+S58Hndidg8WkWv2lomjONFyp8voQXQKHdfGPy8egtkFMXcaUEESx8Z0VS1elxPfNQ
	Tzo7lFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wENXq-00000005eLA-4AXk;
	Sun, 19 Apr 2026 08:30:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wENXm-00000005eKg-1lIw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 08:30:21 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so26523275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776587416; x=1777192216; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XwKzTLRiHs5eANohxZZBlyVS97g8sNagXG2LtuYayk8=;
        b=lvmDbbXwQQ5IpeOySnxydpUbr3zv1JIWQO9wYJPL75cXAmcuLIqoEYcaW07Levr+qc
         pmmQy7KaKfBsuYQgBWnkIthaVBzjLfOHz+o2I1/QcDpdO89NgatAQN9RUZLj4OfgADwD
         7VGLyLSKSeV1B98qoINtrAkVzmZr4fRxy70/BiJ58kpcyd7lbxEexOH8xsAzJSkvs1SG
         +xj7cBiaXZDmzME0h+01kvjbOAwDmuksKLjn+W+kx6UXLQ5uC9TEFvRt+QOw+D4vNAdd
         n63IL0TzLj+ORNvwTi4XGqYw17S3DxRo8HAYshiAO9URPaPGpY+g1CZbUjkMZBOlGhXI
         4fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776587416; x=1777192216;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwKzTLRiHs5eANohxZZBlyVS97g8sNagXG2LtuYayk8=;
        b=HI676GfEPiYlAWnaLVlBbgv4dW/D7cyzrT/60URxICaOh3l1w7fRvO29VQEgbWrGmV
         Fdeyt2fB5nZT60mN0u037rABfBnhhmYnWmKa2ZKBTBYYRvtVstK/dqGYTzfw1esCOfRg
         Cmtb/eQa+tJBFssRci4cEVgmDC3D3b6+g+WGTzl4YgkTSspY1wE4hqB2sp0XvSGU52r8
         e3T80TFGTvv+NW09wPKFstPqWlf8F56ZQ18LUOYRjdxznjbzPVMGqBFgns9jNorXfQ7y
         9W+NEFdu2/apCZMGXJMKtYYNAmYvGFWMtFlGn4xc/yfMzQD4k2PJHhE8cefD9sf7J6mZ
         g9sQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rW/K4b1el//ghKOpXbfF3w6f/Org5zq/Y8mfyoaNMg2ouftAsmEX0n8UKuxOhxftA1OJjV0kSCAvpMkHtZUya@lists.infradead.org
X-Gm-Message-State: AOJu0YxODeRHYS6TxMDpc5dvY2ueaPe28KjWLZbxK2YeUm315J3EZiz0
	xjbI05Sxi2q+iYfjROZcJK3ZNPyBhVn69fJK+ChS3FG9vVQ6Mng6ruER
X-Gm-Gg: AeBDievDqPx6E7Ct6KskzqiaSzkYjndU2RzcJESXmur8Nn0dHB2/POBgRErtf3szbyK
	u6vqzzcJcrWxiWTal85431XcgG6RQ83XLEtqSoP3j6tiY0SMFKS7PDLkor83q+ypgmi18WFSlaK
	JMHqsFJEPObww7VVaH7DMoPuDRxiuQO3tt7PyiDtaENEnN4tiCtLhCvEZCgXxB08E5ILbi+bpkk
	gYpwnkWhUDQzS61xIULZXuMNlrkOK5UPFxp1CrC7cFrJHljXalnDQ9HgFGxAfQlul+4V9YyGwlr
	XqTM684O/xZDXaSXEHz2/2N2IEgZFNSvnbxlhBbaG5cGplCh8htfltdX6M9MKVkFivO/Do63ZoU
	ubGwtb7L02CQnWTE2QSeeB5YZL+WJPB/1t7N+jLORYr4jqCCKMbpih4K4jlH94SNGvShIoEIJNS
	mLMrjTo5YN4YKlRQ8uJeTVjerBZj3BwRYt0ibUJBTbT4t8ViWmRgPvL8PIxQ==
X-Received: by 2002:a05:600c:a108:b0:488:a82f:bbb4 with SMTP id 5b1f17b1804b1-488fb78a0famr104158265e9.26.1776587415722;
        Sun, 19 Apr 2026 01:30:15 -0700 (PDT)
Received: from strix.localnet ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc11ced7sm183002605e9.0.2026.04.19.01.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 01:30:14 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Drew Fustini <fustini@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Russell King <linux@armlinux.org.uk>, soc@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 2/8] dt-bindings: arm: Add zx297520v3 board binding
Date: Sun, 19 Apr 2026 11:30:04 +0300
Message-ID: <6264667.lOV4Wx5bFT@strix>
In-Reply-To: <177646012448.2165534.5760108355183774935.robh@kernel.org>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-2-e19d02b944ec@gmail.com>
 <177646012448.2165534.5760108355183774935.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5099586.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_013018_583476_481DE966 
X-CRM114-Status: GOOD (  15.83  )
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

--nextPart5099586.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Date: Sun, 19 Apr 2026 11:30:04 +0300
Message-ID: <6264667.lOV4Wx5bFT@strix>
MIME-Version: 1.0

Hi Rob,

Am Samstag, 18. April 2026, 00:08:44 Ostafrikanische Zeit schrieben Sie:

> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:

Here is a new PEBKAC issue for your mail template: I ran dt_binding_check, it 
wrote the warning you pointed out, but I only checked the return value - which 
indicated success. Which I guess makes sense for a warning, since there seem 
to be a few preexisting ones. The warning itself was somewhere in the 
scrollback because I let dt_binding_check check all the files.

So I learned I have to actually look at the output to see if there are any 
warnings.

Cheers,
Stefan

--nextPart5099586.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmnkkowbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiU8AP/33cFyCxCEyOMxTZRv29
5Ypqo+NuvryxWrpo7I7s2VQvp5/q6NlSpNpmQXLcgkV9mGS6axv15mCZ6py1gJMc
HSIKkTqWZjzxeHoLZ2oZQCyFbMcPwvGhNK0qP/ckwWkv/4g/UFB9ujycOTFXVERG
RWQyIvROo7Lb9IN8ozKehzOvD7ga+AjD0i4RQLlaGS/TbHUcDZKWr6+WqJ8SicVV
wbiQU3cr4lAG7uCbKiAt2Jpcw1Aeuyfyci1hX4jL6KrY+MK6yG39ksq84DPUOgLI
xR+5Rxitj449eH0hPE20fkrE5UvivbYiCNzkrhyqWn42ahIj5DIBrSayWB0KUjff
lm6wYdL+yh/9760hh92rYCeNFYOz+kEQECsAHhTwqX73gCWFL5rYXJzFpNudFqXi
24Yx9+vZm7OhMi+lGJjM1Tn51ztC7MsP0ozz+PAMpuiEl6luLD3ybO3XO0eTEvhZ
oSylCbtelCVkO3KnW44cSdAspNidQ5Mr1EEXtLxUXOSSFQrmAGXmqmph3vSws7vi
X3G+z1WQ3VQkpUUfYyzV5AD1IORM+TfeZtFbKUrbr2Brk54ib7UxztFqfuizV2V4
9FuBUwZE1uXCLz3m7cB5yp+2zNX1AtkF/5STPQJh2hUC+mpbA68beyv6lefWIOKC
NohR6Eo79ZapFjltX76P8lbO
=NAGE
-----END PGP SIGNATURE-----

--nextPart5099586.31r3eYUQgx--




