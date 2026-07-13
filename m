Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F0CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q68YkVUsAq88sLtazB65v1PXfjC68MwiD7btmXhogW0=; b=jMbCUN+tOPE/egPLUzpyGmV3cJ
	81RLg9c0sAZ9P1tYIAyWNpFGMYe1OLWxoVF6sSkGMNEFxlSo7rgslsewZINAlc6Ed5RyH9xiHtSqi
	1DZ4V2iZm2mjWhZZKGsosUua4LvcSbHhE8u+Zj88Z+3FdQF+CpFzgNRbjmKgZxZx0agN5Xm1jP13x
	1T1Jkb8sty9jzJCnwHX0fGJYo4ZGszrASJ4q9cWmAIDMql6I70s2R/osEgBHnFYdCrp8Edzylo8c8
	aB+IvygwlUZYlvfEB7CP/BbOXvjPk2tGEXud+Lqxeuq2FRlh9/2iYNc2VjmMzUQvHWvHEV8/+ucLU
	5Y5TX7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMlI-0000000AKZJ-0Z1A;
	Mon, 13 Jul 2026 19:56:20 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMlF-0000000AKYp-0gn6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:56:18 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-81ea0b7d137so18700597b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783972576; x=1784577376; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:content-language:references:cc
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q68YkVUsAq88sLtazB65v1PXfjC68MwiD7btmXhogW0=;
        b=npqJ3qFFgtHFy/fz1P/q8zZ+JG7cT82cIrETgxBAMLPdyuAHTUszRtKM6mpDuuWGbY
         VsgxYphZItDf1NZph5k9U/C6ozO7JTyDC3/Pa/AY6ntxXcu36rDqdWXQ3Nv5DEPsSBo/
         yRv1DZ3EdFEjGg31EvmvUFsY0Cj1WaaXuvTg3M9E3pClumqC3ZDiv5M5EzpuakZpJKO5
         w+1Fuw7a38bFTOweb9RTmDxZr104/0V8y62LQs1U49yA+mMRWr4jMi9bcNm5xYi87b4P
         qUgxu5WgDxofVm7C4QN0xsZGzkEX5kUH9VqreE0zcFEhunT8a2C7vTIWGWc7O0sjCu6Q
         rmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783972576; x=1784577376;
        h=content-type:in-reply-to:autocrypt:content-language:references:cc
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q68YkVUsAq88sLtazB65v1PXfjC68MwiD7btmXhogW0=;
        b=eo1GLSBn7Z37zWoW2sYVxw50xnRXBWBoHH9qY5Ra8sfuzOWcuhogQ44zxN7F6RR4D+
         GXwl3OIs3u0HFOlNxSfOXhu3+oe33981kK/1M1gaegg3Q2nwTSpKD1HndVTqR+NcSN0H
         SxCx/FwZjH2rPW8QSc1UDVY1PzqIRDUeYjlD2q0l9w7SfT86/ROjw7CpxzcHqJORzImh
         BYBLL2FGqf3lIMxcE/+d564XYLKBJD2ksH511XMO0sPpaMeIFG4ss8wrvtsdphqugjiJ
         dDM79vCYrrg8Hv4lDQlYb11taXh9zTIyzS2rTGxEwZuChKdW/9PKYXEVvqJ4NXSdR+y2
         r8eQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr52m2r6b8DOsYuCAxODc8TawPP3eoQBm+dr6KZNZnsMAASSUhelA+M4+hjbKta8agE3ViIl/Z5iuMqDOnfmicc@lists.infradead.org
X-Gm-Message-State: AOJu0Yymuvc7Vux21XdxWAzgTQ7TWqhCuyeiodQ9S23U86Vpa9LACxE2
	R2DombTFLKeiajcPXAL7zEd8ViZRlUv0bRYzWmlH4tMiNer0dzqlOSJPkWRg2qI+
X-Gm-Gg: AfdE7ck6qdFrSlIYfjGcnq398pqkK7ayT8FauJ2ltC/eD+mF7oFU/nDlTE+kjBdbPIR
	eytHW7odkpa0XPreWxmbQgzlm+HPnquU5dOlrZGJQapgJZejbjQOBokn6p/zGKmYbZ69HkI3DKx
	Ee2GmcMbg3bTTQVjtS8AEQlPMoi5XlcsEO5A2dI2JZVEPFPAFE1ZQF8JgpqkGfkp/SV63ZUmMkT
	RiTb0A6766ZxUCQArsnJREP9yvunEAzO11TYyeNFPR7cbQ3jxQDfCACR6zbO9g28D37pESpuCVk
	gt6QwGAv/a99y+q6oAaTr2CnAis1FIS9Ux5EcuuDyisajt2ZmRVY5IDNeIYw7U39DyGTG0vU4qO
	TPEiJGE1yVw1aId2k6FhoizaFthgSI+u7LP2I8FH1QTWjKpux+qlCB7Hkgij/xK1HvR+Nfmm1A3
	7ydLZSuU768IPnj8U=
X-Received: by 2002:a05:690c:480b:b0:81d:6af3:b9cd with SMTP id 00721157ae682-81e9015af55mr73668997b3.40.1783972575423;
        Mon, 13 Jul 2026 12:56:15 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1a32e2sm123459527b3.30.2026.07.13.12.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 12:56:13 -0700 (PDT)
Message-ID: <b5f56cbe-38ab-4772-a828-f77eb513a4ee@gmail.com>
Date: Mon, 13 Jul 2026 15:56:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
From: Demi Marie Obenour <demiobenour@gmail.com>
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
 <dcf16dac-e26d-42b0-a0e7-32990446f7bf@gmail.com>
Content-Language: en-US
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <dcf16dac-e26d-42b0-a0e7-32990446f7bf@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C8yGlXu1E0DNNa0TaKUJFVNn"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_125617_232810_AE2725FA 
X-CRM114-Status: GOOD (  25.37  )
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
--------------C8yGlXu1E0DNNa0TaKUJFVNn
Content-Type: multipart/mixed; boundary="------------g4KQxFs8CLpWmawHNDGnmSMO";
 protected-headers="v1"; hp="clear"
Message-ID: <b5f56cbe-38ab-4772-a828-f77eb513a4ee@gmail.com>
Date: Mon, 13 Jul 2026 15:56:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
From: Demi Marie Obenour <demiobenour@gmail.com>
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
 <dcf16dac-e26d-42b0-a0e7-32990446f7bf@gmail.com>
Content-Language: en-US
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <dcf16dac-e26d-42b0-a0e7-32990446f7bf@gmail.com>

--------------g4KQxFs8CLpWmawHNDGnmSMO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/13/26 15:49, Demi Marie Obenour wrote:
> On 7/13/26 11:31, Greg KH wrote:
>> On Mon, Jul 13, 2026 at 10:42:04AM -0400, Demi Marie Obenour wrote:
>>> On 7/13/26 09:07, Eric Biggers wrote:
>>>> On Mon, Jul 13, 2026 at 06:47:07AM +0200, Greg KH wrote:
>>>>> On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4=
 Relay wrote:
>>>>>> From: Demi Marie Obenour <demiobenour@gmail.com>
>>>>>>
>>>>>> This driver is harmful:
>>>>>>
>>>>>> - It is much slower than the CPU [1] [2].
>>>>>> - It Has a history of bugs [2] [3].
>>>>>> - It does not have exclusive access to the hardware [4], causing r=
aces
>>>>>>   with the secure world.
>>>>>> - It register its implementations with too low a cra_priority for =
them
>>>>>>   to be actually used [5].
>>>>>>
>>>>>> Therefore, disable it to ensure that nobody builds it into kernels=
 they
>>>>>> intend to ship.
>>>>>>
>>>>>> In the future, the driver will be used for processing restricted m=
edia
>>>>>> content.  However, the kernel does not currently support this.  Si=
nce
>>>>>> the driver will have future uses, allow building it if COMPILE_TES=
T is
>>>>>> enabled.
>>>>>
>>>>> Why not just delete it now, and then bring it back when it is neede=
d in
>>>>> the future?  Otherwise this will just trip up the static code check=
ers
>>>>> who will attempt to "fix" things in it.
>>>>
>>>> That makes sense to me, but Qualcomm pushed back on deletion:
>>>> https://lore.kernel.org/linux-crypto/20260602-qcom-qce-broken-v1-1-a=
4ef756089e0@oss.qualcomm.com/
>>>>
>>>> But I've still not seen any evidence that this driver is useful for
>>>> anything or has any users.  Even Qualcomm seems to be unwilling to m=
ake
>>>> such claims; they only claim that the IP is used (i.e., not in Linux=
)
>>>> and that new features are planned.
>>>>
>>>> - Eric
>>>
>>> Here is my reading of Qualcomm's statements:
>>>
>>> QCE is currently used by the Arm secure world.  In the future, QCE
>>> will be used by the kernel as part of restricted content playback.
>>> Qualcomm wants to add the needed features to the existing driver.
>>> This will not use the crypto API.
>>
>> Why is a crypto driver not going to use the crypto API?
>=20
> I suspect that the restricted content playback use-case involves
> QCE decrypting data stored in kernel memory, using keys inaccessible
> to the kernel, to memory inaccessible to the kernel.  The crypto API
> can't express this.
>=20
>>> I would be fine with the driver being removed, but not if it means
>>> another out-of-tree Android driver.
>>
>> It's not another out-of-tree Android driver if nothing in Android
>> actually uses it :)
>=20
> Nothing uses it *yet*.

That said, deleting the driver is also an option.  I don't have a
problem with that myself, but Qualcomm does.  I figured that
marking the driver BROKEN would be less objectionable.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------g4KQxFs8CLpWmawHNDGnmSMO--

--------------C8yGlXu1E0DNNa0TaKUJFVNn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmpVQtoACgkQszaHOrMp
8lMiWw//WlbyclsseubZEFwpF3D7kF/tsmijPxTxd3+XD5FohrzBTMAA7RbPwETV
S71upvd2zrIbVDUwy/eYWdFd7YvSYAenqtihZKHHYZDydYKI6C47qIxOHgPV/wJK
K1W941NRAXX0PaK8BoyciEiEmy2Jztz9/A6pCxUCnl1vDkj7sk9p7mb6538dxqbK
Nm6qpfoPkd0gx5YsmDJDb/UnHlxPG6k3+xUgk03wB5uDzockJ4bkCx9H5G21uckh
AljsQc8kFUa0eQOgYXHTV8zOGx/Qz9F+9AIq9DoUC3bQqVpkw3b/eQxrvtykIry+
sJERfMRQa+oQjrkhYFIXJHVJWLRnA3AgY8kNOki2u4EpBORwfZcaauVjPi5e43aR
se8BNILtUW7ODV26LuyfMDONeEn5zyApO6wLVY39+koPR1J9g7QBzphNecwKYt7V
oplp/ZImB67NXkYAgwm7lFQyFrHl7IlLPnPEhELUMRbZcM7ilcAQbStR70wC+6vO
F02SHWhEr0sznkq0Y1YvTFF6IOM2J7rm+jQ8sjc1+g+9NwuNYJIyZnxAeHUwLYPx
WUXO6TIUQSIfRUmch4hfjq3R3b76fzjVyNmxZ1aHk5MtEzjTgmb+qEcYEOgJRQ2K
c2iWRd7o+KaJmwiZnHglgqw1lHPsVd2EGEeqg/zJGusjsQfgPxE=
=JMJV
-----END PGP SIGNATURE-----

--------------C8yGlXu1E0DNNa0TaKUJFVNn--

