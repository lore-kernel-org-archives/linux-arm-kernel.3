Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF379C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+DcHVzO50mtkCMyVvHEUPPqgiYR6razHjnBQNDI87Y=; b=XNfhJWAfOSiM1U3kE7bZtRoIxl
	p+SLcTbnZSQgfvolnGSMzYNFNj00Rb2srRwHODLSGtQnRNIQ5DMlVFCZgkDB3QtrWw64K906FBXCM
	PirQRPqQI7pNggPfllYm3oE686in32rRukkacpRqYhbV3pYoJwJ6tieHA3F6VVwdQq7QTzdSRe/R9
	8H9IVD9q0wYzUKZ42WkI+GauuJ75uLN9pVG+ibRKeVBGha3Lj6SssJ7mCnCwAH/kgWvBCeffwGfRf
	KOCvVgazcVNUQPb/M1TCsBhRr0RyCdeLLIVMQRuvwJTphoh3N1TmDpXkruDoeCIsNiDqKfCSpXBGS
	3aGyzomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ9S-0000000CEbY-0D9F;
	Wed, 22 Jul 2026 15:46:30 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ9N-0000000CEXu-3PgD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:46:27 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-66899fe9077so649394d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784735184; x=1785339984; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h+DcHVzO50mtkCMyVvHEUPPqgiYR6razHjnBQNDI87Y=;
        b=q1b6Y5hKT7XojheGzXZCdhW+Ty1APK3In+1KlefRYCPOIj1R9XjWGZKithXEAfy7gV
         vqGp7VCkqZgOsA09YSvrtfV1WafsIl8RArerPnIEwe6EXsI7vje8l/8g34mC9sdLb916
         dOXS5Num2HNxHgM/tUX/GIYet7xgQGoCiQnQHvFzZTsviDYVTi3tIPSkmdSjIVRLRiNA
         o1TX8XoBuNoX/NhhC4HaJbYis1R+FiIMvhTDlRtNpCIQ56WaIGbDoBSFRjik2z4vySZ+
         KSP4CChWwVL+r9TF14UPWiVXzaq86yzoCf+ENrjULruPTtWhQif2FZLDS4KgEhJedrdJ
         3kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784735184; x=1785339984;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+DcHVzO50mtkCMyVvHEUPPqgiYR6razHjnBQNDI87Y=;
        b=AYgqTDTRqL5sm3sQY7cNE75e+K96PkFSJ+UjyBatixU/ZwA1lC8iZ7u/FKUgC5nt2+
         BDNqBrJ/HXyUJCVpQJ2SS66Y+cTdSktf16BT/GbezHLo4Xq+r6K+y06a4gjJFkOEJAfg
         8Og716zB00hP+xyHscc7MA2r1eDE2m4PQrHxvVixXCxj+jtVb3kkJdLUER6f0Orudjvk
         i/rnj6NBSOwqvnn9ryAvTmkEx1VZybV2HQBe4Tr5bvcBUPqyc3ADvqewKdX2MxpatMpJ
         ghoK63Mj/rPkvZgYZYXuuw/v45Hab7Fss/sQdsbhrPu6xLQ6VxkgnaGdnLp1iuZuRskR
         S4+g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/7VIjxARKZSm0fOyYex+7uSAWkm+7JeAm25lRK2M+tHr2G54+n3GZILuHqSsWVF+38mrLIgkDe1Vt9gBV4pYo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo62SAueTQkFo3tVbf/qfcNDDf+gR48L0nVyEpTw0eA3RnY0Xm
	NX616xyzsitLvs4xvFrg7/z1qkz8Ja89DLXPC3Y6tMuYIlnIYpexrDwj
X-Gm-Gg: AR+sD12wiyMbSmeFE3raOxNg3L11E4SjEPEw+smhkRQgnWffnTqyMlgxeTGHJ5+2qy+
	7kLryEDP+kyzj6hgNRXBq+tKHhBJjTlNbWqKBo0aAlDGfJAp4tpplDy0kpvgJ/G2sdsKNpCwNXQ
	hmfsnMTc/HMkWKKjs84YupUbArzm1pl37laYlKOE9i4EP37SGgFdBlYgOnLUN7iinYNSMT4yd0y
	QKZEiTA84KHhrJ1wKgrQUKZZUItdx1Oms9DcXxhGfB3TUg5kQ+bm2mAlab/f0D7aYnvZK8kiCeD
	oFSk2NOO7GZ7vBg/j5hbSFb1U2vqu/ScWTjnvkwp1aDljuOb8Ega4buRa0KjQlCjYy6NDSbjb4O
	M24USYhKAywgsIAH1GivohAKKiUzNXqhGHVYv2axWwsETQjJ9WjJDHDUYixJaI8S/MQtgCKii/0
	xZYgyt
X-Received: by 2002:a53:a7cd:0:b0:664:c81c:d1 with SMTP id 956f58d0204a3-6683bbef5d0mr5048088d50.45.1784735184185;
        Wed, 22 Jul 2026 08:46:24 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66890775512sm1566688d50.19.2026.07.22.08.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 08:46:23 -0700 (PDT)
Message-ID: <8e9101ce-e9ec-4111-a1a6-7a9a07788818@gmail.com>
Date: Wed, 22 Jul 2026 11:46:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 stable@vger.kernel.org
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <alnlaCXmoLRAlr96@gondor.apana.org.au>
 <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
 <c826b73d-6307-4237-a065-b7a8487350ce@gmail.com>
 <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TQU0bcIC0Lu6CqgUekKUIeTq"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_084625_972343_F53E55BF 
X-CRM114-Status: GOOD (  26.93  )
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
--------------TQU0bcIC0Lu6CqgUekKUIeTq
Content-Type: multipart/mixed; boundary="------------uwrMxsbcaUPR63gc8Mct0hz9";
 protected-headers="v1"; hp="clear"
Message-ID: <8e9101ce-e9ec-4111-a1a6-7a9a07788818@gmail.com>
Date: Wed, 22 Jul 2026 11:46:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 stable@vger.kernel.org
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <alnlaCXmoLRAlr96@gondor.apana.org.au>
 <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
 <c826b73d-6307-4237-a065-b7a8487350ce@gmail.com>
 <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>

--------------uwrMxsbcaUPR63gc8Mct0hz9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/22/26 04:33, Bartosz Golaszewski wrote:
> On Tue, 21 Jul 2026 20:29:39 +0200, Demi Marie Obenour
> <demiobenour@gmail.com> said:
>> On 7/21/26 04:24, Bartosz Golaszewski wrote:
>>> On Fri, Jul 17, 2026 at 06:18:48PM +1000, Herbert Xu wrote:
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
>>>>>
>>>>> [1]: https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kern=
el.org/
>>>>> [2]: https://lore.kernel.org/r/20250615031807.GA81869@sol/
>>>>> [3]: https://lore.kernel.org/r/20260706-qce-fix-self-tests-v5-0-86f=
461ff1829@oss.qualcomm.com/
>>>>> [4]: https://lore.kernel.org/r/20260629-qcom-qce-cmd-descr-v20-0-56=
f67da84c05@oss.qualcomm.com/
>>>>> [5]: https://lore.kernel.org/r/20260524204537.GB110177@quark/
>>>>>
>>>>> Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")=

>>>>> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Add Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine dr=
iver")
>>>>> - Add Cc: stable@vger.kernel.org
>>>>> - Link to v1: https://lore.kernel.org/r/20260712-qce-broken-v1-1-85=
e2bff17871@gmail.com
>>>>> ---
>>>>>  arch/arm/configs/multi_v7_defconfig | 1 -
>>>>>  arch/arm64/configs/defconfig        | 1 -
>>>>>  drivers/crypto/Kconfig              | 6 +++++-
>>>>>  3 files changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> Patch applied.  Thanks.
>>>
>>> Hi Herbert,
>>>
>>> I'd like to ask you to back this patch out. Admittedly I should have =
NAKed this
>>> under the v1 thread but I thought the discussion we had under the Shi=
kra series
>>> and the subsequent patch making myself the maintainer of this driver =
(note: Demi
>>> did not Cc me on this nor the Qcom mailing list at linux-arm-msm) as =
well as the
>>> pending series[1] fixing the QCE issues was enough to imply we should=
 not mark
>>> it as broken. Please consider applying [1] if the fixes in v6 are cor=
rect.
>>>
>>> Bartosz
>>>
>>> [1] https://lore.kernel.org/all/20260717-qce-fix-self-tests-v6-0-4557=
75fe5f6c@oss.qualcomm.com/
>>
>> Is the BAM locking patchset also needed?  My understanding is that
>> without it, the QCE driver can still produce wrong results due to race=
s
>> with the TrustZone firmware.  Until it is merged and the self-tests
>> are fixed, the driver definitely needs to be marked BROKEN.
>>
>=20
> No, we currently don't ship TZ firmware that could cause such interacti=
ons.
> The only driver that currently suffers from such races is the NAND driv=
er
> which races with the modem firmware and it too will use the BAM locking=

> feature once it's upstream. However we do plan to support DRM using thi=
s IP
> and this is when it'll need to account for possible races. IOW: BAM loc=
king
> is not strictly required to fix the QCE.

Thanks for the correction.

Will updated firmware alone cause races, or does the kernel need to
opt-in to firmware features that can cause them?  I want to make sure
that a firmware update will not cause the driver to start racing with
the secure world.

(Nit: DRM usually stands for "Direct Rendering Manager" in Linux.)

>> Also, what can the current driver do that cannot be done better using
>> software crypto?  I understand that you have future plans to add more
>> features to the driver, but those are not relevant to this discussion.=

>>
>=20
> We can offload crypto operations to the QCE saving CPU cycles but more
> importantly, the QCE provides HW based isolation which some vendors car=
e
> about.

Would you mind explaining what you mean by "HW based isolation"?
While some crypto engines support keys that Linux doesn't have access
to, Linux only supports this on IBM mainframes.  Linux does support
using hardware-wrapped keys for inline storage encryption, but those
do not use this driver.
>> Finally, I very much appreciate the work you have done.  I don't
>> expect that the QCE driver will stay BROKEN forever.  This patch is
>> purely a reflection of the current state of the driver, the speed of
>> CPU-accelerated crypto, and the small message sizes used by the kernel=
=2E
>>
>=20
> That may have been true when you sent the v1 but with a set of proposed=
 fixes
> it'll no longer be the case.

I trust (and have always trusted) that you can fix the driver.
I apologize for not CCing you on the patch submission.

>> That said, is drivers/crypto really the right place for a restricted
>> content driver?  A driver that uses dmabufs might be a better
>> alternative, and would be easier to integrate with the Direct Renderin=
g
>> Manager (DRM) and Video for Linux 2 (V4L2) subsystems.
>> --
>=20
> These are future plans, yes. But right now we do have active users of t=
his
> IP and now also a maintainer - yours truly - who stepped up and is acti=
vely
> working on this module. With the fixes applied, the driver will again p=
ass
> crypto self-tests and should not be BROKEN.

With your patch, does the driver also pass stress tests, such as
multiple threads using it in parallel with varying algorithms and
message sizes?

If so, then I agree that the driver should no longer depend on
BROKEN, but I still question whether it is useful in its current form.
That's not specific to QCE, though.  I would say the same about many
other drivers.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------uwrMxsbcaUPR63gc8Mct0hz9--

--------------TQU0bcIC0Lu6CqgUekKUIeTq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmpg5ckACgkQszaHOrMp
8lO+Fg//U+kk24Rg8dMnY3eAHTPzBun+SQCvZSwgGg0OvhxkDdrNmbnNkyqEAOW/
zyX4cLq3yO/GdoSMtQRGJ+FmsF44sZeML+hrR5412/3qwg4JFMXICOJ2jGc6DZ4p
bkDHr5mteg3gT6WQN8qPKn9LCrtkNP05XKzsH1o2MCXJEjlmVbsUL8uJzqDXGtUL
AMOsdMWvJyKj513aL2oLMlb/LVrIFOGPmfj2gi5MX2/NAf5uFZaCGqUVeCo7ld/6
ARmabreDLIoCZUt7hWf1ucNPL/0ORAr3af74tEGg5YV07x9iBCDmSQO5aeFWuWcZ
62mTdJQ0Fukbp/Tjoj15pTsEISWAnBVBTQ4oLiZSpJoxXQquf6e/33x5pi9YRKzp
E9C58PDV9fR7S0nCjP4kqLTUgthFrooxaBmctiJjyn99kKeVvWaTwGNokjMzbGec
ifq3rbML4ywEVzA3vsDU42PZqJY36PpdxATJ/t5pDb4g72+x7HbMKfMw1hMjDBOb
jfsmxyXARS1RSvLsy23pdlqzPtIU24J/mv/YzTKoLZXtP/oTYGKvkQa9jqlw9FM1
4VjxeN1h8hu1Pap8SnVFnRBMKBLIg3K7APwM1sKbsxqueYU75LEIV7sVfsBMi1px
iJtuXU8ATVhm4jfIEzHqrQTp+9nPAkdcJ5miWn13ddT5ECQaTxk=
=NKLC
-----END PGP SIGNATURE-----

--------------TQU0bcIC0Lu6CqgUekKUIeTq--

