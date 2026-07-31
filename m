Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75A8C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pgvz5gAD7Hw+MqfudMvXhhl6EBpJRyIn40riGMqdVs=; b=PkVv4hlbwDYr1aRBYljKEoLvjm
	d79CRVUTol20VeJ7GqjvIBAZiOa40jcCfCXY6XG3IY0Fpvx5voOO5cNaY7OtgC+bTIviDJrrpIP2F
	pI/bA96UWNEHLwdMqZgHwED1rHxsL4V0y4ipIsPUtGvNIsiip8AWwx8wOg40THXaa6ZKk+5VqNSD0
	Vy5YhR6al45VtxPkykihgeRab3XwLUf7W3JXp/t65QXAigR3mCO/8gNh8UCNxqiVtOYKRxCbhOvOl
	t/j2XAGj2OGcun9otiJgBre+TLaP12Kas1fgn4AsTDG5whbwDmMlCx+NRjS5jWL7vHL2d1GA4gY0t
	MDmPzeUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wps1e-0000000DNUe-1Lj3;
	Fri, 31 Jul 2026 18:32:06 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wps1b-0000000DNTu-2st0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:32:05 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-66892c81725so1537676d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785522722; x=1786127522; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1pgvz5gAD7Hw+MqfudMvXhhl6EBpJRyIn40riGMqdVs=;
        b=QyaCvZOEUHUeTlOsHcySlXxFVx+RjCbms5MqoXevCPjr6n6JkgUJOntGBELyY9cdhY
         8ld6+fhdfuzDxgdM67+KHL3Dd0DeyOqFoCWRTukV8hZV+iEj4BzQUMrEVQrxEQTKd6I1
         zIrNDInimAtJmkC3bcBrm/8qF7CRFIBmABU/Jm458Q+NFDWiMDfbIqqzkCYLpb0fGmC0
         AD7ddSaZJpX0YSk7UqP9oRK51G1I+xlERc5B/8Ijs5+Ig00CKaMwGMpkuigO2bg+zci/
         O26hazPVrsjWCT2O6g/I7bG+saSuwj5r2WQigjUJEyNAvAaxPThZCaeYASGGt/jU0B6M
         9TkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522722; x=1786127522;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pgvz5gAD7Hw+MqfudMvXhhl6EBpJRyIn40riGMqdVs=;
        b=kmowPfNbx8BS+ByUI6d1/1235fwA3BMIfSr2b3532yxTUfZK2V49d1cT9l4QJSyiKa
         WpNDwtvTkdAOKK/0PELIeQvTxTyOjXruhwyEGBjSlS4USpzNBV7NMakZfOpkQO7CLtuO
         Fm8ye8LMXpZhWhZY15szT+nrHRwbTW8mCLpxkqoe7k8dcZLmJdPj0O0aSnOSVKsjMODY
         CVVtdOMhSg4V72q2tmqWPHK9eIxIEfl3AujeQRg9CZ+cBkOPnOhQFcY01OiaJdLWkbds
         qFEdMuoOvPpRdXQqZH7nBjUDaqP8diE6FImUEw7pIUlpt1m9YeXEJUBthtRUJ29qHb45
         XeJA==
X-Forwarded-Encrypted: i=1; AHgh+RrdCcHCJ+fnwHr8S+mWfVokFrYh5iX9VYapax15DrQLDKX4Ak1x8G/MqogMxulABwuz5zaVMARv2WqOoBe45N4W@lists.infradead.org
X-Gm-Message-State: AOJu0YwJyeB2CUBLFF8FGHMt8CuLvoC4NRpR67VZCSE4562ekPf77fQc
	B8KuR7gDvz0FWz0n+eBRoF8TiUHO1p6u1MPs+EW8hNVD1xgW4AqiVglA
X-Gm-Gg: AR+sD121VHt1yZv9Pp5i9rqFWjLS2yxXBavvdh1n7qZDUkU7CiMMqC/uZoIKa3UWtbK
	05Y6Egs84kN5r78lbhraZad0pOzEUDyVu/XEweS9IUg/UvkpeOdpD2SR9fXUzjalUGn3FfJNEJU
	Kku/o9orGKqAiSqNPjNaGKFif5FVs3SHeDDPqemMPt+hcvBRv4t5Cz+M9b++rgTsXlaJxBA34Vj
	sX5CBD8VzPwyUddAWF3hcFIBHqepB/M6IJ2RvI9E9u25G8gkIW4VOL+F6z9i5tQfUgb8Le1vQjg
	oYaaGh5dxonOSHSkILRxpiUqCcKMb7aVpC+Ib5EDiRVyc7pKihUlvtjNIOo5buQFcCJYN1bdfzy
	gMFgMrpIpXQHG0cs0x3kyldy7rqtSyRnlAAoDqnncV3jiMuoCssvLiwktXrtxb7vDNu/GEB/r55
	lfGd7DzRR2cMRJ49ssbJa6hWqY6uZtqsp10EE41BLygJ0GULxXss8mMBq0xm0JG7A=
X-Received: by 2002:a05:690e:4811:b0:652:5567:b3ec with SMTP id 956f58d0204a3-6694f1baaeamr929342d50.37.1785522721944;
        Fri, 31 Jul 2026 11:32:01 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948cff660sm1073441d50.3.2026.07.31.11.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 11:32:00 -0700 (PDT)
Message-ID: <3ba57269-3305-4d80-b3f2-aa82fa59b59d@gmail.com>
Date: Fri, 31 Jul 2026 14:31:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers
 <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260731050838.158825-1-ebiggers@kernel.org>
 <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HdbkbXaosHtNrC3ZM5XYZQZq"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_113203_751921_ACE6FC62 
X-CRM114-Status: GOOD (  26.97  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HdbkbXaosHtNrC3ZM5XYZQZq
Content-Type: multipart/mixed; boundary="------------xNPkSkf7BAKQGc6JdueYE4T0";
 protected-headers="v1"; hp="clear"
Message-ID: <3ba57269-3305-4d80-b3f2-aa82fa59b59d@gmail.com>
Date: Fri, 31 Jul 2026 14:31:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers
 <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260731050838.158825-1-ebiggers@kernel.org>
 <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>

--------------xNPkSkf7BAKQGc6JdueYE4T0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/31/26 05:06, Krzysztof Kozlowski wrote:
> On 31/07/2026 07:08, Eric Biggers wrote:
>> None of the algorithms the QCE driver registers with the crypto API ar=
e
>> even close to being useful.  They're massively outperformed by the
>=20
> The amount of patches you send towards removal of QCE is really
> stunning. Or rather worrying. This is like third approach or so.
>=20
> Your previous approaches received valid feedback, including even fixes
> and committment of new maintainer.
>=20
> But you even complained that it does receive fixes! [1]
>=20
> We removed the driver temporarily from typical configurations, so no on=
e
> will be affected, by whatever is found now and not yet fixed. Still not=

> enough! For you this was reason to remove the driver (AGAIN!) [2]

A stub driver needs to be added for power management reasons.  It turns
out that if there is no driver, power consumption is very high.

> This is beyond comprehension and very unpleasant, because you actively
> work against the community with this approach.

I trust that Bartosz can fix the driver with enough work.  However,
even if the QCE driver had never had a single bug, it would still not
be worth using.  Its performance is so poor that one should always
use CPU-based crypto instead.  In the default configuration, that is
in fact what happens.

The QCE's algorithm implementations only provide a way people can
misconfigure their systems and ruin their performance.  There are
debug options that also severely harm performance, but they have
legitimate uses during development.  The current QCE driver doesn't.

I have no problem with a driver for the QCE that does something actually
useful.  While there are disagreements about whether restricted media
processing is a feature or an anti-feature, my view is that it is
better for it to be implemented upstream than in an out-of-tree driver.
However, the driver as it currently exists does not implement this.

I expect that such a driver would not use the crypto API at all.
Instead, I suspect it would use dmabufs for source and destination
buffers and integrate with the secure world firmware in some way.
That means that the driver doesn't belong under drivers/crypto.

These are the reasons I submitted a patch to mark the driver as BROKEN,
which Herbert Xu has since accepted.

> NAK
>=20
> Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20
>=20
> [1] https://lore.kernel.org/all/20260728152241.GA4281@quark/
> [2] https://lore.kernel.org/all/20260724050645.223799-1-ebiggers@kernel=
=2Eorg/
>=20
>> CPU-based crypto (even actually using far more CPU cycles than the
>> CPU-based crypto, due to the massive driver overhead), don't provide a=
ny
>> security benefits over the CPU-based crypto, and have various other
>> issues.  They're also unrelated to the Inline Crypto Engine which work=
s
>> far better and is what is actually being used these days.
>>
>> Due to the major performance problems people experienced when
>> accidentally using this driver, the algorithms were already demoted to=

>> below the priority of ARMv8 CE in the crypto API several years ago.
>> Regardless of priority, these algorithms also aren't compatible with t=
he
>> most common uses of in-kernel crypto; for example, they don't support
>> dm-crypt because they allocate memory, and they don't support IPsec
>> since they take a mutex which isn't compatible with softirq context.
>>
>> It's time to move on and just drop this obsolete functionality entirel=
y.
>=20
> Best regards,
> Krzysztof


--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------xNPkSkf7BAKQGc6JdueYE4T0--

--------------HdbkbXaosHtNrC3ZM5XYZQZq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmps6hsACgkQszaHOrMp
8lNwUBAAptSx+21WOpvepRQf2mxAoPgmKhOGw1fC0yyfvoukdVfEZyHnJIDWgy5V
S7pRzbRzJo4rCQh5G8pkdCQFWm3HAT2O9rG3t4KT1NF8Rag3s8G38TsTVzaaOzae
V5HYh8JxgImWPMP2pS087NR97KbQR+WfyYEjCXIERuMc9dW3ksM6fXj0Des36KpW
6hfqwmZWNThhThoAJqr5j/8nPNk/FCPyhMi6vuZlzFuMlsv2kgWxKhZjEpHYnYak
oopcGAQMPuqX2/lKblSeKEbW1fSa9faTcmDeH152e7p/fw/WRq5XSsK+DIhiP3ie
wyWSNTBbGhLgH84rdIfBhNsSA6NchJFMYfMe0hfLIhFmv2mjtlOX/YW53nHzqZ0+
8K847CDDhrz79DhYxhyYhGjmUhTxteaAei+gO1vzY49Ysf/9+6Vccc8YIDMdcoAS
22PMQkYJkTjzIfHLcYToxu38LoDJPQy3neM9XUvsLSYp2uQTb/TJSoy+HoPYXy6+
kS8zb3jTMJ3iCCOdM9CabOUplA5Rgxa92Gy87OEBZwPcRWf9w1LYI4Cob4XHEuub
41dku0PWGWuas8MKLH2NTRctKrvLvC9BClbC165SiQRm6QsgnJja+L9IvZzRqtfw
V55UjORv9Il8pY96/wo+0lg2UamEkcInsTMULyFdlelhPQe/02g=
=D3dI
-----END PGP SIGNATURE-----

--------------HdbkbXaosHtNrC3ZM5XYZQZq--

