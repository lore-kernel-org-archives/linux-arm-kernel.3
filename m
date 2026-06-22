Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F98CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2iDIuaF1VKCPijPKmXFMyUN8rIqLYAfStTAg8/YV8I=; b=DLafuT11EhiAVqYqudXUVn5YM9
	CV3XglsmXjwiXSGFkHM9XdqPpC+td73hNW1SBtQmqVX6IQiqPrPFlWKgZxFOOmIRA3VK9ubISi4iA
	tF7j7V2EwvA72hHI4blo8cBdpCVgOOZzTqunsrMEa7XRiepCKhTHC6VRBQSQg2Zw4YOjBkmuOnYuC
	sVcdUbEmrqKiBCrvH90qmEm00PZsdUUkARrdxK8yXQq3f3R9RMgDwLnmXj89SgWAJKOgKowADf6iX
	H3zSajrtLSayD3SI8KjS3yXf7fIOCnYOi0surjfnaHTGbK4hYOxqVgfbqemw9rr1f0/KuxRYFWtQH
	qJbjLHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeCc-00000004zKy-2eqZ;
	Mon, 22 Jun 2026 12:56:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeCb-00000004zKr-0Jw5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 12:56:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35A69601F0;
	Mon, 22 Jun 2026 12:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C321F000E9;
	Mon, 22 Jun 2026 12:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782132995;
	bh=l2iDIuaF1VKCPijPKmXFMyUN8rIqLYAfStTAg8/YV8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dhTXUQv3s+G3948VNEUzwG8LXH8B99YNS4TcI8bDdEjy3NoNMQW8qC1bUUBSBq0Gl
	 9CS1dv+dU1cEQKaafkSSnUFEbNMHMoE6bXWDLVN7hboEaUaa0dWkHmM3ceKJRehheI
	 62XYgsevyO2fp8MahzfXuYboKooKO40EB5EXQNxnRy3bIhPev9AIkS9Bp6dEnSFUlM
	 AjZ2wghBrD6limeBOmkB7AGjF4ZSY0kPfNw6svzcq0JIoX8gZWxztnmnWbaGHMOIDY
	 oHJqQ4QcmtGnNGHxzYYAGiy5TkFXhUSIZiiK6+1TAFqEmqIuNPWL3IkLCH3FgkliFd
	 sxlx9gq6SF69w==
Message-ID: <4ab3bf02-70b9-4748-a12e-2bd564fec53d@kernel.org>
Date: Mon, 22 Jun 2026 21:56:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org> <ajU-b32dmwS7XOg4@arm.com>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <ajU-b32dmwS7XOg4@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------upsrUBOQYnFEnSXIs0AYK6aO"
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
--------------upsrUBOQYnFEnSXIs0AYK6aO
Content-Type: multipart/mixed; boundary="------------Ps3zmfE9YngvIs8RaS9wbP7c";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org
Message-ID: <4ab3bf02-70b9-4748-a12e-2bd564fec53d@kernel.org>
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org> <ajU-b32dmwS7XOg4@arm.com>
In-Reply-To: <ajU-b32dmwS7XOg4@arm.com>

--------------Ps3zmfE9YngvIs8RaS9wbP7c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 6/19/26 10:04 PM, Catalin Marinas wrote:
> On Thu, Jun 18, 2026 at 11:05:43PM +0900, Harry Yoo wrote:
>> On 6/18/26 10:35 PM, Harry Yoo wrote:
>>> On 6/12/26 1:44 PM, Dev Jain wrote:
>>>> Introduce a boot option to tag only at allocation time of the object=
s. This
>>>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>>>> catching bugs.
>>>
>>> I think most of overhead when enabling MTE comes from loading and
>>> validing tags for every memory access (either in SYNC or ASYNC mode),=

>>> rather than from storing tags.
>>
>> Is there any reason not to use STGM instead of STG + DC GVA when
>> setting/clearing tags for large sizes when we know they are properly
>> aligned?
>=20
> STGM is intended for copying tags when paired with LDGM. Have you seen
> hardware where STGM is faster than STG or DC GVA?

No, I haven't. It was a question I had after learning that there are
multiple ways to store tags ;)

> For properly aligned
> buffers, I'd expect DC GVA to behave at least on par with STGM.

Thanks for answering!

--=20
Cheers,
Harry / Hyeonggon

--------------Ps3zmfE9YngvIs8RaS9wbP7c--

--------------upsrUBOQYnFEnSXIs0AYK6aO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCajkw+AAKCRCGXBN6rc5S
1qvyAPsF0DurImeEtMtFke9YXQWImsgXI+xfZ4SEz1mY+wbGswEA158qtw/Yf70R
7SKOnegedFGVqJzsq5p+vAkSpPMfJQw=
=RsAK
-----END PGP SIGNATURE-----

--------------upsrUBOQYnFEnSXIs0AYK6aO--

