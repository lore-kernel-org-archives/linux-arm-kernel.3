Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDB4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2Nhmjf1P25H7Nc2LjCEV+3VIdZwevh4O2RWWuW3P00=; b=EiqGxWpXyyDRfJ4cSEr893+ZCW
	2vKBcV82BbmKHbkjYt7xPJ7fvN1xWOruTUJOXmajfwc9USDDHaAvAScNLFZ+/ujZhk50cFQ9CMzzV
	/lDXx4w01Xbarcv/D4iTfHqVbuYndtM0TLUA2fvySDllwXwddVQAaFBZB9htWfZnLe7p7CEhGpKxM
	qwoU/OgBwZCLHnPcQBQnhK38IE/sGR0EmUH3Y0f/S2QDV7sLDBgVHUTQExQbcN/EpoU5BNU2u5mSh
	dxWhQevky5NaAajXDq49ck9M45GBmGmtkizN0LmFelbwt7G4G+0lAeNcn9WCIwZ+yXW8yM35DFS8P
	srAOmDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMeK-0000000AK34-3Rkb;
	Mon, 13 Jul 2026 19:49:08 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMeI-0000000AK2h-0Zb5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:49:07 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-664d78637f8so6246916d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783972145; x=1784576945; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n2Nhmjf1P25H7Nc2LjCEV+3VIdZwevh4O2RWWuW3P00=;
        b=C+KzyteMcWWNk149W3h3bfGdPXFV/rAjWRonGxbM6ue4EVhQhCjxJhCYkdnRKkGfJQ
         1BSggr0BSB/Io1MR7l+7J7JKbNL8F/mZqTOY5GN/HLdS6Q1+kiA0r1sEddPc5gF5IPgH
         +sjaFpGVsi1hBDpVyz7TjoBllUCyFqoEwPsw9XmKIC+SXolzVLNkf5dFkJZO/POiE1Gu
         mFeo+z+gcUgFSfyIs43EMZp3q3Ovv36KgOWtNb5VJaprKPvVnELuplZgRXRqrgq0G6xs
         gmoRI6HKMtDgVgVVZnrDGrtAz9au6t3W2JYIFFPfoXelLi7gziVQSa47FCCgJ+8bATav
         AjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783972145; x=1784576945;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2Nhmjf1P25H7Nc2LjCEV+3VIdZwevh4O2RWWuW3P00=;
        b=DIoAVp5scvS/XgIENZI09Dplt9VJa0VnhtqvQvoXwkeREqhOAORLSlTsovYh2QAuBW
         Oty2oaaS0WPG0DRskYzSg8RUZ7lonidyX4Pm0y3K6ybfJyBVt3zZ//kWK4ZvU5BtQFBp
         rxB62hVm6NZwT69tLd2YRLbRCvoTsdVi/Jxak5eV+rPIUdl4oIHoVyZLS06qUGM8ATlG
         nUXUknIHAqqT5Hm8Kc4dVokwGToHhCeskefjk/Sz2T/28IFmEYd7mOZNRY+xAGMkVXpS
         WuHA8HLEzZIltPSXpSYkPKkgItMrAe+odRp6KO4LuOOCG3glh/1kR5Igc0DIliS6YKPR
         eZMA==
X-Forwarded-Encrypted: i=1; AHgh+RrOwodANPqAA7TzI9qQWwMbAxZe5lja3zesmWLKVN12bE7z6/jt+9LlEhBWD22pZbw6dYTpbN3L3brkeXi9ao1a@lists.infradead.org
X-Gm-Message-State: AOJu0Yz33pKCnpUEw4BkkNcjpDFQ7/29zlryxVAvqlFSpV86F64HZM3r
	LE2QhwP46fD8vREvI3WHfkb7JWntWwyoHyZuZkxVDhCeFFn2zvVHX6Bu
X-Gm-Gg: AfdE7ckZsG7ezgBLUnl6WM9SMVn7PBYLkdtNf09D8nh88NvwUgBfM8q4KpzXlGDXly3
	nGAIByyS4k/c85Q8eXIRTvUmuhCZZm5U/qj8xB0v9Y4tvzVLrktLzd/TnrQW3SE2XLhTlENxAyS
	Gi6L34vRr8KMvvbysYqdKjEURlu+1BiGQC+X3iMLdd/4csxU3cas9yrbfn6ywdiWU7djYlqM02T
	2WBjwmf5iwpLJkUUWGoYry0nXjKx+39NRB7VBHoUP2MdIl+ad4DxyLY7E98HsxifNicdaigMEWl
	/218V3awgqWl/HuLq/1+isLCSuPS1g5EWS/8a5hMt0RxOLXllwF1J4XcWxi1xdn/Qnli+TYARcv
	bjkQrfqsCNqilLuFC4nAmnUFRFP9qr8vz8Knd6pOp88U1qIE3iGqtxkU5N0MdnA36ScKJ3cl0h8
	KQp9Ru/wWZ+nG7Ow1/neteVP6IZoRAz5N0iTS+
X-Received: by 2002:a05:690e:1246:b0:667:ff9c:21dc with SMTP id 956f58d0204a3-667ff9c2a33mr1497202d50.93.1783972144782;
        Mon, 13 Jul 2026 12:49:04 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-667879d8818sm14496185d50.13.2026.07.13.12.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 12:49:03 -0700 (PDT)
Message-ID: <dcf16dac-e26d-42b0-a0e7-32990446f7bf@gmail.com>
Date: Mon, 13 Jul 2026 15:49:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, stable@vger.kernel.org
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <2026071312-uncover-refining-8cac@gregkh> <20260713130745.GA2254@quark>
 <bd5821b9-7459-4db4-86ef-bd67fb645753@gmail.com>
 <2026071320-encode-modify-6193@gregkh>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <2026071320-encode-modify-6193@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vgImv900avlh0tVHitrPh5xj"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_124906_201158_0CFC9D74 
X-CRM114-Status: GOOD (  24.92  )
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
--------------vgImv900avlh0tVHitrPh5xj
Content-Type: multipart/mixed; boundary="------------ETtg58S8PChwJVaC0HzUiT8C";
 protected-headers="v1"; hp="clear"
Message-ID: <dcf16dac-e26d-42b0-a0e7-32990446f7bf@gmail.com>
Date: Mon, 13 Jul 2026 15:49:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, stable@vger.kernel.org
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <2026071312-uncover-refining-8cac@gregkh> <20260713130745.GA2254@quark>
 <bd5821b9-7459-4db4-86ef-bd67fb645753@gmail.com>
 <2026071320-encode-modify-6193@gregkh>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <2026071320-encode-modify-6193@gregkh>

--------------ETtg58S8PChwJVaC0HzUiT8C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/13/26 11:31, Greg KH wrote:
> On Mon, Jul 13, 2026 at 10:42:04AM -0400, Demi Marie Obenour wrote:
>> On 7/13/26 09:07, Eric Biggers wrote:
>>> On Mon, Jul 13, 2026 at 06:47:07AM +0200, Greg KH wrote:
>>>> On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4 =
Relay wrote:
>>>>> From: Demi Marie Obenour <demiobenour@gmail.com>
>>>>>
>>>>> This driver is harmful:
>>>>>
>>>>> - It is much slower than the CPU [1] [2].
>>>>> - It Has a history of bugs [2] [3].
>>>>> - It does not have exclusive access to the hardware [4], causing ra=
ces
>>>>>   with the secure world.
>>>>> - It register its implementations with too low a cra_priority for t=
hem
>>>>>   to be actually used [5].
>>>>>
>>>>> Therefore, disable it to ensure that nobody builds it into kernels =
they
>>>>> intend to ship.
>>>>>
>>>>> In the future, the driver will be used for processing restricted me=
dia
>>>>> content.  However, the kernel does not currently support this.  Sin=
ce
>>>>> the driver will have future uses, allow building it if COMPILE_TEST=
 is
>>>>> enabled.
>>>>
>>>> Why not just delete it now, and then bring it back when it is needed=
 in
>>>> the future?  Otherwise this will just trip up the static code checke=
rs
>>>> who will attempt to "fix" things in it.
>>>
>>> That makes sense to me, but Qualcomm pushed back on deletion:
>>> https://lore.kernel.org/linux-crypto/20260602-qcom-qce-broken-v1-1-a4=
ef756089e0@oss.qualcomm.com/
>>>
>>> But I've still not seen any evidence that this driver is useful for
>>> anything or has any users.  Even Qualcomm seems to be unwilling to ma=
ke
>>> such claims; they only claim that the IP is used (i.e., not in Linux)=

>>> and that new features are planned.
>>>
>>> - Eric
>>
>> Here is my reading of Qualcomm's statements:
>>
>> QCE is currently used by the Arm secure world.  In the future, QCE
>> will be used by the kernel as part of restricted content playback.
>> Qualcomm wants to add the needed features to the existing driver.
>> This will not use the crypto API.
>=20
> Why is a crypto driver not going to use the crypto API?

I suspect that the restricted content playback use-case involves
QCE decrypting data stored in kernel memory, using keys inaccessible
to the kernel, to memory inaccessible to the kernel.  The crypto API
can't express this.

>> I would be fine with the driver being removed, but not if it means
>> another out-of-tree Android driver.
>=20
> It's not another out-of-tree Android driver if nothing in Android
> actually uses it :)

Nothing uses it *yet*.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------ETtg58S8PChwJVaC0HzUiT8C--

--------------vgImv900avlh0tVHitrPh5xj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmpVQSwACgkQszaHOrMp
8lOTZg/+J7VZdIiJw1B68LNMjCivUN153yqTLpN9zrY5X2j10DRj3fsnS/8S0DU2
mCSIjkUljEp6N6NI5bmALO5CXYnIsL7PPjq2/2qhzuLUrxEMf255RRLFg+Yei3OG
OVEp9tXyvrRCBuvrSKXyxMkUKAzKhJEaBEv0NVAuMsYuytTqvuAc6A6+sUvESRco
CFpnGzsfwRXpu/+M30+HTWGTOElO8ReeYR9vTWyrcP8fUQXeGCV9gBcyZrkzH5Rk
ICqvs7N0mQXtSd/v9EpxjiDOd49GF+Gg2PKk5XyyEy/m8p4zDey5KI5fEcsBCzlR
JMLyCwuI/yMQHlGYeCCNLrgM3HTm80hJo+6fVIl4Fd29QZelhaIfh65SdF1/9rXn
z3XcBKgjG6INHmGrmY3FGzYtlJODu99ojT8PHbEz3Wd4t87aRaJxZD0ICfTrJPEt
iJ+9cRKn6TSk9pj3IjOzYRDQ8a8zMQcESxmr/TNTSv63SLlRsLnibkKIgR9wwPyh
1LlpafCxmeyhmYB8Kr+p36zlYXoln3GSDl+5MDzlv3FqI95RA0UJqIzBwtOlsbRK
BUO8ECuHNejjLydzZnsKOlYpKJrQQ8Lx307tPTboG74oO3kWI5Ep3XEWT1/EJyyp
ZfrjHfL9CQmwDsCwBcmT9eFi3zT4OGdm0/El15HCB2fuTQlp8bU=
=oS9l
-----END PGP SIGNATURE-----

--------------vgImv900avlh0tVHitrPh5xj--

