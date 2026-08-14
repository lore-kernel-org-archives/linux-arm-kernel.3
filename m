Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489BEC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 05:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iImNcxG8fLabmPC1MwSt+Jl02Q/TG6TAosyGy3jBnk4=; b=Q0FZUadcUo0+hMGugegT/tGPDR
	WJIfMF3fAG0zWc6YYBl5lnRKH5f5lOjChoC07jGDQaIxxe755jgmin+Bb9Y6ZKKONp38+CQw+QSpw
	KnFTM4ERYxsu63bRa7vQew6Eq1rZE9L33NETOeXLPjfDDHuo6y5aIqQH7P84fEve+jFjJNojir6sh
	ni3vyn6A6y6UHwPgtXzIFkppVVbLVUydw0rBCMyAkUHig6AL+pgIJsSrvyLxG6+o72ZOMvvvw4Lie
	Q7KEnauQspeRlDiJe0s3nYrvNihnswdUme6PyzPTLx/i8BcBpLc2rKkSFnw7B1+o5+lEzL2evoNbh
	MtxB3BAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wukUB-00000001yg5-46mU;
	Fri, 14 Aug 2026 05:29:43 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wukU9-00000001yfj-1fd6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 05:29:42 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-669944f60b3so824682d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 22:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786685380; x=1787290180; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iImNcxG8fLabmPC1MwSt+Jl02Q/TG6TAosyGy3jBnk4=;
        b=B5yvHBQWiY0JhL4k5bzvqDx7Y6AvDykf5Kzk8vAHUISMxSVvXjJuB5wugtq3lpMjML
         n13cInTnugrUu1Fg6luUylDgRQRx7rL6QRhKGbfq1H8ohnfUI5XX6/ZNW2Q8Q9YA1hWp
         bsKw1CgMIc4tAT4Csh9nSYFXZgUDs2GySGy/Y9XcQqmghg2qSbcnuAIZnVVyoz8dY9i4
         wWiDDjZDhgbgL2Ne5us5CR0dpDaUBnrGK0sPJWmtAv9ht+4no1jMLtppztZIEt40egJ7
         m51qiFvXF0+QMKCFJRZV6w6pu16L6zGVHDf0atYO4VeBQ30+MS2BBfDIk0tbW6n64LEV
         VC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786685380; x=1787290180;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iImNcxG8fLabmPC1MwSt+Jl02Q/TG6TAosyGy3jBnk4=;
        b=MdjBpdrMwslsZdJGBMnih+zOnTMIN7c1quQjQb++stMRe16+ofZ4/pq83wOEReQyqd
         QM69PmQh8o47WIQ67WQFTgPYkeVN40Nv9l063fK0K3R6ZTIIinQgH7yK04XTY0cBDQ8A
         TAitSmRM8VEez7MS0t9pZL3glwYpO00DS6UzZGjINcVkmcCyNQ/MNT5UqTYLU0fA9tv/
         XX+JANH4ul665U4rlDgCdud2Dw16/ApBtBwMhTcAbgQBFUNJUOi8TFrvi5EVHumA6D0Y
         tLe1e3PbY2Er+bbesXQwBwTfCS0Q4wXuRvv8GZFT3uWjZvAW3J/nY/qIcwOhkEaFQhuZ
         hZhQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8eQbgbiOpsc+1fPrs6sgU0pgr751f62+s2fiI6LCgX+3BDadh10mglueEUFl3N661YTWtiDs4ZhR90InCTaGL@lists.infradead.org
X-Gm-Message-State: AOJu0YyR8HpGI+AG00AH4RG2qBr28/vzCfD2MFH2zahx4b9CvmElI6ZQ
	IBXK6CLkElWhtRfOLNGuw5Dq+nh3p3CtICNzkrsl1Ba26FUrvF9NeqYtOD676iY1
X-Gm-Gg: AR+sD10EDaTeqzQUblL2PgimAJ32yjA7mDbNdZOvNlxm05JbaVP3cFfidK6cV2k7pMM
	LINxeyZ6skcR/nIl5iS5A/pkbKsjnCWh8wHCACYj1Xsl6RYTzJ5pwqLYkazu4+Nu3LxGlvLJ6Og
	dklEtqehQV0zLg1BEbGt4kTiiHm1o1jnbmvpVGrvzD5RFm5wakDSp+JVerUUvAD6nH4qSZT0S83
	EwPIwZQdUW3830H+yEWYCNYJJzi3PehLymJR4iNOKhjloh/LrNIU01uwqfUKkBIiAA9ejVjiUao
	ZWI6R7qaV5FlYATgR9GszXUm1CwkOBWBWFQOYzsPjcy3ls1z8b0KZB34kiVmn0/HSD6oMhXPa6l
	xKkka6xDuEbVRDPostinKKmyMZAoU0u9ovaJLZSEckGaxc/xhHDLNU1bseidYljUyhSrkM6kK4j
	boaDKAsEpO0gdOYDkTOgStRgoLIPcLuvJ/+jS8RQ067MB604uPe9JQ83gT+1HsLwE=
X-Received: by 2002:a05:690e:dc1:b0:668:15aa:4f79 with SMTP id 956f58d0204a3-66c72b20bdcmr1534551d50.2.1786685379829;
        Thu, 13 Aug 2026 22:29:39 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c79390ae7sm382697d50.20.2026.08.13.22.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 22:29:37 -0700 (PDT)
Message-ID: <df2a9e02-0ebe-401a-84b5-b0f404711521@gmail.com>
Date: Fri, 14 Aug 2026 01:29:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <e7aeec9b-11aa-4635-bde9-fb8c7ca38260@kernel.org>
 <20260801171242.GA3567@quark>
 <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
 <20260811224110.GC1905@sol>
 <CAMRc=MfVqphaVsfcmUXjGmu6m+F6nJYXgAPuTVjZBwFnd48BkA@mail.gmail.com>
 <bc95e0b0-2cc5-4ad6-a319-ae4e159b92fe@gmail.com>
 <CAMRc=Mcno_F2UuLXZ3ruaVSbYhssVK90m3KM=+dwskLMSp8TXg@mail.gmail.com>
 <0d2706c6-79fa-40fc-a24a-6d5ffbf02330@gmail.com>
 <20260813201019.GA987015@google.com>
 <b7e697ee-ce3b-4c81-afb8-00205c2997f3@gmail.com>
 <20260813213448.GB987015@google.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260813213448.GB987015@google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nXzoSzcLz1089Ey4q1hbHcJh"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_222941_500988_E5A60F7C 
X-CRM114-Status: GOOD (  24.99  )
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
--------------nXzoSzcLz1089Ey4q1hbHcJh
Content-Type: multipart/mixed; boundary="------------b2lmVs5wJKpQS07vcN45h9uV";
 protected-headers="v1"; hp="clear"
Message-ID: <df2a9e02-0ebe-401a-84b5-b0f404711521@gmail.com>
Date: Fri, 14 Aug 2026 01:29:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <e7aeec9b-11aa-4635-bde9-fb8c7ca38260@kernel.org>
 <20260801171242.GA3567@quark>
 <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
 <20260811224110.GC1905@sol>
 <CAMRc=MfVqphaVsfcmUXjGmu6m+F6nJYXgAPuTVjZBwFnd48BkA@mail.gmail.com>
 <bc95e0b0-2cc5-4ad6-a319-ae4e159b92fe@gmail.com>
 <CAMRc=Mcno_F2UuLXZ3ruaVSbYhssVK90m3KM=+dwskLMSp8TXg@mail.gmail.com>
 <0d2706c6-79fa-40fc-a24a-6d5ffbf02330@gmail.com>
 <20260813201019.GA987015@google.com>
 <b7e697ee-ce3b-4c81-afb8-00205c2997f3@gmail.com>
 <20260813213448.GB987015@google.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260813213448.GB987015@google.com>

--------------b2lmVs5wJKpQS07vcN45h9uV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8/13/26 17:34, Eric Biggers wrote:
> On Thu, Aug 13, 2026 at 05:00:28PM -0400, Demi Marie Obenour wrote:
>> On 8/13/26 16:10, Eric Biggers wrote:
>>> On Thu, Aug 13, 2026 at 03:09:36PM -0400, Demi Marie Obenour wrote:
>>>>> SM8650 with the QCE is FIPS 140-2 certified and apparently this mak=
es
>>>>> a difference. Don't ask me if that makes sense, I don't claim to un=
derstand
>>>>> the legal aspects of it.
>>>>
>>>> That sounds like the kind of thing that would cause someone to use
>>>> a worse implementation of cryptographic algorithms =F0=9F=99=82.
>>>>
>>>> For what it is worth, many common uses of kernel cryptography can't
>>>> use the QCE.  This notably applies to the CSPRNG (/dev/urandom etc),=

>>>> storage encryption, and AF_ALG.  Therefore, I expect that anyone who=

>>>> needs FIPS 140 compliance with Linux needs to ensure that the softwa=
re
>>>> crypto is certified, as that's what actually gets used in most cases=
=2E
>>>
>>> Well there's that, and also the Inline Crypto Engine (which is actual=
ly
>>> being used and is unrelated to QCE) has its own FIPS certification.
>>>
>>> Which upstream kernel feature, if any, is QCE being used with?  I hav=
e
>>> asked this multiple times and still not gotten an answer.
>> Historically AF_ALG has been used to access FIPS-certified crypto
>> from userspace, but that no longer can be used with QCE.  Most kernel
>> features reject CRYPTO_ALG_ASYNC, CRYPTO_ALG_ALLOCATES_MEMORY, or both=
=2E
>> If I exclude tests and fallback paths of other drivers, that leaves
>> crypto/asymmetric_keys/public_key.c (hashing), BPF, MACsec, OpenVPN
>> data channel offload, ecryptfs, Ceph, SMB, IPsec, mac802154, TIPC, TLS=
,
>> and crypto/kpp.c.  AF_ALG only allows offload drivers for cbc(paes),
>> which QCE doesn't implement.  QCE is broken with IPsec and probably
>> some other networking protocols, as it would wind up taking a mutex
>> in softirq context.
>=20
> It's a far more narrow list than even that.  asymmetric_keys uses the
> shash API, so it cannot use QCE.  BPF crypto uses the lskcipher API, so=

> it cannot use QCE.  MACsec uses AES-GCM which QCE driver doesn't have.
> OpenVPN uses AES-GCM or ChaCha20Poly1305, neither of which the QCE
> driver has.  The non-legacy Ceph protocol uses AES-GCM, which again the=

> QCE driver doesn't have.  IPsec does decryption in softirq context,
> which the QCE driver doesn't support.  QCE driver does not implement kp=
p
> algorithms.  SMB, TIPC, TLS, all usually use AES-GCM as well.  Until
> just a couple months ago ksmbd crashed if passed an async algorithm,
> which proves it was never used with QCE.  There is really not much left=
,
> maybe ecryptfs AES-CBC file contents encryption?  But even for that the=

> cra_priority makes it not actually used.
>=20
> But we are going into the weeds here with trying to theorize some way
> the code could theoretically be reached.  It seems it's really just not=
=2E
> Or at least if there is a use it is not upstream and/or is not actually=

> the appropriate code to be using.
At this point I think it is quite clear that the following algorithms
provided by QCE are unusable no matter what userspace does:

- SHA256
- HMAC-SHA256
- AES-XTS
- authenc(hmac(sha256),cbc(aes))

Those should all be deleted as unreachable or unused code.  There are
also a lot of algorithms in other drivers that can also be removed.

If the driver was actually used, I _suspect_ it was by requesting it
explicitly via AF_ALG.  AF_ALG won't let you do that anymore, though.
The other possibilities I can think of are messing with priorities via
NETLINK_CRYPTO or somehow not building any software implementations
with a higher cra_priority than QCE.

Splitting the driver up would be much better than the current status
quo, though.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------b2lmVs5wJKpQS07vcN45h9uV--

--------------nXzoSzcLz1089Ey4q1hbHcJh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmp+p7kACgkQszaHOrMp
8lO4Ng/+Oat+SL0D3pc+KRTBhovFWMYo6JusJNlUNDqAl2X6LlQuI0BtFeOQ2R0B
Ei4KHe0R3Nv2ucbV52uzM+DaP/CpDPJVCcPZlkjegIQ6om1L1UvBWdJNrN5hdBzk
pmHyWBlZjO+1risApvLyvsfbAJu4UP5iKJ/A2GQ8/86ILNoNuf4XjkftTer156VV
WLRWkLo70FC+y5aqXZis3ca+dRHdwMp9oea45eBe0AAPt69KF5EH/CcoOyjQYYr7
CuhyY03LixxHB/Tp6FiZJpUH/OQhIoZQJSueH4Hp7/sbW5OSZRFKywggi5+IrCOP
HHngA4qycTGcOb/2RIWiDud2ssUWfzCLWoz2fkxkBhzFOTtUAfjBhp7lKRevRFJ2
gNgyuYhrC2Vv0j6d+d0ZRNRKNsLavVw0R2GJtHh10Bn3OMwMOvDexjvT+jrK4y3y
Xgof6cBhyhLCdPU2/jmWhzmITCdo3QzAGisJok1TgcgblmpiVmnWz9w3f1eAPGDS
eS4CjEb2I9XLs+7vj6Avj7c26QiWXYMICNwJA7SfWhRi3PrFQXizN5ZfeVH4HcDW
ym7OdWDBbNeiRdrv4VHpsCYb9ELq5jBkHaBf3G1kbWdM++rlSPI7yFtzmCckwAZR
GIRPq8iTu4vMSfSvs0mt8yMxLJxfebIO+c+Oles0wKwfNt/IyCw=
=69KI
-----END PGP SIGNATURE-----

--------------nXzoSzcLz1089Ey4q1hbHcJh--

