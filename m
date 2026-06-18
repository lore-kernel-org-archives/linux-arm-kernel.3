Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBA9CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ML15MaQcznPpWlTthGJ5ZAccE6wQ2/6XSoOTMeOi5c0=; b=hh+VZfzi6RrmKHg0Vlg3QwmvyF
	5d7MU+HWVxKVZ8vEP2cMT1l743G46XAY5ThdpaaTC4AHFhUcdHlyvNXpVIrOJIY1iK3CWsHGO4la0
	B6C9xQo9iGyDmyK6RlUnAUW3Nz+GiZrhzxiD3TshB7vwD3h/qFwQdgVKKEzhtusEa37JUTzEUbVFx
	ktk5nMDN51dDrYUXK9hqeF+eFbmx5uC79tujv6a2qMrS3wtjyO79WhAE4vnol6f13Hxqe8VPS+Bo0
	eDB0w0bMLdIj2A82vLRKzVW6MJeLWKKU4vQRo4N++5aIAx0cQrMagpY7wvLrVqX0qik0G6OQVHp6G
	Q3qcViDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waHxT-00000001iRF-2Xru;
	Thu, 18 Jun 2026 18:59:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waHxR-00000001iQf-28hx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 18:59:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490b7866869so12121785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781809159; x=1782413959; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ML15MaQcznPpWlTthGJ5ZAccE6wQ2/6XSoOTMeOi5c0=;
        b=UmhAZBkLCYq6vMt0FWwZ5qlyLJ+zogX34uM7Yitv0xu4vKmNz2jENpDUgbZl8f4p2s
         JwOaBANo7lfkfsd1Y4SMLDo1SoqiUHRXZqnOTSkS1RbTfwiYVc6yICyS8reGYgMbnkF1
         2Ukni7akm2s3frERyOiW+ZN8pUxuvV7iMTPhaGqmcCHuM3OR84/A/edKJdmu8pFTH83/
         ABfkGJJ8JDLyb7scMz8jyKHnPJoYF8kJB0WdoWNTgIKWFU686/uKznEIxIl5m5cSNjM/
         1qt3IftBcN8Lej3u8M6y+isrksf3D2ekLGnNhkDuHjFsu6gQMAcqiAARnJxCRMpXuND4
         M4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781809159; x=1782413959;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ML15MaQcznPpWlTthGJ5ZAccE6wQ2/6XSoOTMeOi5c0=;
        b=NyJRyFvp6dW/aNPTplQAY9vnT4RDOjpUaOMVBTcFt5Ee7RwcYD5yHDHztR1k86xi+h
         xXG1WZPW0oxu4iXtbtfNlWBNQAD0ygpwn6N1fAC1Gn/Kw+Yj2PPKD7vhl842iv4IFfaO
         Jdi3JSZgETKbslWsBhT/oPcuKKCUikxZcsVoDXN/+Al22KCmH/FnrfKQVn4iGQFzjbMb
         JRO1rRokuuceE4kk6dZJ5EQrC2O+6AE0oO70yusohOEi8o7CfCrjUNh4qVA23aVJuQds
         HJ15eEgP7w2DlnDy6z9ejSg5lhL+Gz2txHlIeQKf8G0PYhrU5quH+PJ7qm8wpUZxJvRy
         TypA==
X-Forwarded-Encrypted: i=1; AFNElJ+T8yvGDsu6DBwc2SQYpLT7Ej8IU7LWAP2OWoKc3rwhYU1KhPNvG5LjxQxy3c6pQ5/XV3UIdsPNoRHFqGwifB36@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0PWB6OgFipzvt8jsfAPWwFziiWiCTz/s4ifQHXTXdtWETJzm6
	AreSpX0uz1KHJg3fuB7E3JIS4YeF38sbalEmMhYnMj7fVHS4CamVnqHK
X-Gm-Gg: AfdE7clpbnZma3dSV9PljJhoxhrXq6DPRpZNfta5mVkCWnYH79/Y1QtLuFuruoLtDT4
	VI2HNpa6ottSjYMoAzZ/F6y4aIIhzRh/Eg1PHZqwBKYa0m5IskpRixyxgrKVPr/9c0AFFVGxqhf
	O1i6/ZundvYKgFQbstO/8ZUnrXGWIOfSDsmI9UyCX3x7AlApLB29mBGAGMQJ9bes6xzEcRgXe+g
	hV9k/ks2f99ffyLyDUZmNKpo4606J7BdMwqBN+h00Nrk3vcQZMZRk8YhXNkuTP/r8V5vq5VOOJV
	mF/ztJbCb6D7axP466ZMuJyKu6rv4r0wd9/MvzWza5SdVBq0Doga9t5ukTKKJaqT/l76t2T9K8+
	0uArYje/RjOHkK+dLmCxmrIB0fLzYG6juW+TbxJlwVZjjAJ1N9PbWvk0RrMb0c9ilqUvIGCd6o1
	NUOkgwMxbOS2MzF4lwI+uB0w==
X-Received: by 2002:a05:600c:1552:b0:490:cdb2:fb5e with SMTP id 5b1f17b1804b1-4923f5a2c9dmr13330905e9.22.1781809159062;
        Thu, 18 Jun 2026 11:59:19 -0700 (PDT)
Received: from strix.localnet ([197.250.96.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcfee57sm7910205e9.7.2026.06.18.11.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:59:18 -0700 (PDT)
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
Date: Thu, 18 Jun 2026 21:59:00 +0300
Message-ID: <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
In-Reply-To: <20260617-deed-snap-4649ffae0e27@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <-l2OM6P0RNSYRQfOSObOyw@gmail.com> <20260617-deed-snap-4649ffae0e27@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParthL3pgqDQSWeNUtue9c8aVA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_115921_572666_EE87A563 
X-CRM114-Status: GOOD (  15.24  )
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

--nextParthL3pgqDQSWeNUtue9c8aVA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Date: Thu, 18 Jun 2026 21:59:00 +0300
Message-ID: <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
In-Reply-To: <20260617-deed-snap-4649ffae0e27@spud>
MIME-Version: 1.0

Am Donnerstag, 18. Juni 2026, 00:23:56 Ostafrikanische Zeit schrieben Sie:

> Do you actually need an aux bus here though? Since you have to add
> simple-mfd for your the syscon-reboot and simple-mfd is a real bus, can you
> set the reset controller up with an mfd_cell + devm_mfd_add_devices()
> instead?

I'll have to read up on devm_mfd_add_devices; The aux bus was the suggestion 
of Philipp Zabel. At first sight it sounds to me like they do fairly similar 
things. I don't see any precedence for [devm_]mfd_add_devices in drivers/clk/.

Whatever way I go I'd like to use the same for all 3 clock/reset controllers. 
So far I only made topclk a simple-mfd. I recently stumbled upon spinlock 
registers in matrixclk, so I guess I can justify a simple-mfd there too. For 
lspclk all I can see is clocks and resets and I ran out of unknown registers 
in there.
--nextParthL3pgqDQSWeNUtue9c8aVA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo0P/QbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi5REQAIpu/GpQwqP141DKI5xB
0EX5THPKx0mZqlnsa5AmllX6jbbRJcefVucQDGcsxnml1o9AqqACwyzLbIzgV3CU
FiVw0dgZWFXvbMDJd86ag1NtaL98vcw9PgHX36TyILPVYGH040BrZWuyQsqmCxcV
BCJ+yUzmZOxADojGR3teu73O58q/y9xKsCmYM/jTZ0NWqNZNOpJ0jIbGmUUiXwtY
XToDOH4k6LQWdvAJzoLQ5pnmczX0RLYh2BLgNIGnJTzwF/XgTOXyi1Bvllmy7aii
kkqyQuWuB8QtL3dEmaCgKCpUZqA960h+lk+79kX/sg9fjSszclPVfvk7WbaSD4+f
cwB6tdnagJdbK9OmFR0xixHnuSb3XU/H7uAy83vobGGHd+SK+ciBTF7U6Evo/ehF
nB/6A1RUjcnereGiUykzsVoWEVvnw2yAGfCQ7KUJ+yqgxuYTNEFLNhIAGoG8t2Hf
DryFswSWkeUZXxKqscW5QxanDRIMFYX0CblVyHxIp0CMGkccSuT5yVCvGUB07ueT
gH2c+RQTNf2ZXD6wD1Y38T6w0yqIrIZSeBu6ts59Q65/CjWQWjp2LsRrnVfRm2Ei
PwyZhtTSoLH/p+5FYioCjjUhpTfB2bLT9suvALpaSo6ePJALSyRMQNwG/YVEoxp4
4pCAFEovLsxAtKS+bcDZW2ce
=ut2t
-----END PGP SIGNATURE-----

--nextParthL3pgqDQSWeNUtue9c8aVA--




