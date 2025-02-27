Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CBAC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qm4XdrLEOGONyCHmoFRozccaLnXF1KMSfkq+aUJ5zWA=; b=3zW8xY8RbF79Dq9ckxIfOvwl+7
	ADIu6LlTPsZDankQlgmak/eW0pdZ5WK2wvYpQq6MjQqryQHUqtQXmv+YbHmGFlagG+9JxCf0Ua7YK
	528HE6JSwd2izrnj+9Qv0BYFROZOfFZaZFJLQHlpCaLIO7xw8Hla5hQi8Vl5dMejPG/tFa+10u/yT
	cibFW9yRI/QOLCNnO0mIFMlICmGvoFsttzKu23iHJXiU01ayTjjk1FBtVS1hN1saKShY1ZYvrmblH
	sMLixOhGIdG0To+XgQLC8PEQxXt8RJYnq8ZEVP5oriQkxe5BVfG04H0M9+UFDKsvdTOpNNkU4RSwh
	FbEeHHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnacH-00000006vQ3-3FTz;
	Thu, 27 Feb 2025 09:55:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaLf-00000006t61-2Cg2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:38:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07A005C1298;
	Thu, 27 Feb 2025 09:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49661C4CEDD;
	Thu, 27 Feb 2025 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740649110;
	bh=kuUelbCc3mh5KwVn0L2IifL5eirbW8cOf0PVGvfIwfM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OEGzQbdLP4sU0C751iv3CJOKm5AjF33WraZlCvE17HOBNTUg/0FIeocRFVJc7P69E
	 9FtPiFuEn6iF8IGyn4S97hjGVQfePe2iesSo09ewwhHRu3lHOQd+aHISiU33ch7Gh/
	 7DTJNNyLUQOtLpxL/E1dkZJvs0vA03DXU0k1exTcABBRa9VZzjAlYlceFE5FwesySH
	 CP1gM3h2+qtX0BuFpkP2ouJ/zuSxX4ijSEho720RULkXkjMClQkE1g9BClhlFnCPoT
	 r7rOki/bKHmDZs3n9gbZfNt+DKaYUmYA7c4mU36OwvBNtz2pGnEdW5102cpP+FGVEU
	 lj7IMXCnw7v/g==
From: Puranjay Mohan <puranjay@kernel.org>
To: Indu Bhagat <indu.bhagat@oracle.com>, Weinan Liu <wnliu@google.com>
Cc: irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
 mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev,
 rostedt@goodmis.org, will@kernel.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
In-Reply-To: <91fae2dc-4f52-4f38-9135-66935a421322@oracle.com>
References: <4356c17a-8dba-4da0-86dd-f65afb8145e2@oracle.com>
 <20250225235455.655634-1-wnliu@google.com>
 <da6aad99-3461-47fd-b9d8-65f8bb446ae1@oracle.com>
 <mb61ph64h9f8m.fsf@kernel.org>
 <91fae2dc-4f52-4f38-9135-66935a421322@oracle.com>
Date: Thu, 27 Feb 2025 09:38:16 +0000
Message-ID: <mb61peczjybg7.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_013831_641817_3D62EF1F 
X-CRM114-Status: GOOD (  30.02  )
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

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Indu Bhagat <indu.bhagat@oracle.com> writes:

> On 2/26/25 2:23 AM, Puranjay Mohan wrote:
>> Indu Bhagat <indu.bhagat@oracle.com> writes:
>>=20
>>> On 2/25/25 3:54 PM, Weinan Liu wrote:
>>>> On Tue, Feb 25, 2025 at 11:38=E2=80=AFAM Indu Bhagat <indu.bhagat@orac=
le.com> wrote:
>>>>>
>>>>> On Mon, Feb 10, 2025 at 12:30=E2=80=AFAM Weinan Liu <wnliu@google.com=
> wrote:
>>>>>>> I already have a WIP patch to add sframe support to the kernel modu=
le.
>>>>>>> However, it is not yet working. I had trouble unwinding frames for =
the
>>>>>>> kernel module using the current algorithm.
>>>>>>>
>>>>>>> Indu has likely identified the issue and will be addressing it from=
 the
>>>>>>> toolchain side.
>>>>>>>
>>>>>>> https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666
>>>>>>
>>>>>> I have a working in progress patch that adds sframe support for kern=
el
>>>>>> module.
>>>>>> https://github.com/heuza/linux/tree/sframe_unwinder.rfc
>>>>>>
>>>>>> According to the sframe table values I got during runtime testing, l=
ooks
>>>>>> like the offsets are not correct .
>>>>>>
>>>>>
>>>>> I hope to sanitize the fix for 32666 and post upstream soon (I had to
>>>>> address other related issues). =C2=A0Unless fixed, relocating .sframe
>>>>> sections using the .rela.sframe is expected to generate incorrect out=
put.
>>>>>
>>>>>> When unwind symbols init_module(0xffff80007b155048) from the kernel
>>>>>> module(livepatch-sample.ko), the start_address of the FDE entries in=
 the
>>>>>> sframe table of the kernel modules appear incorrect.
>>>>>
>>>>> init_module will apply the relocations on the .sframe section, isnt i=
t ?
>>>>>
>>>>>> For instance, the first FDE's start_addr is reported as -20564. Addi=
ng
>>>>>> this offset to the module's sframe section address (0xffff80007b15a0=
40)
>>>>>> yields 0xffff80007b154fec, which is not within the livepatch-sample.=
ko
>>>>>> memory region(It should be larger than 0xffff80007b155000).
>>>>>>
>>>>>
>>>>> Hmm..something seems off here. =C2=A0Having tested a potential fix fo=
r 32666
>>>>> locally, I do not expect the first FDE to show this symptom.
>>>>>
>>>>
>>=20
>> Hi,
>>=20
>> Sorry for not responding in the past few days.  I was on PTO and was
>> trying to improve my snowboarding technique, I am back now!!
>>=20
>> I think what we are seeing is expected behaviour:
>>=20
>>   | For instance, the first FDE's start_addr is reported as -20564. Addi=
ng
>>   | this offset to the module's sframe section address (0xffff80007b15a0=
40)
>>   | yields 0xffff80007b154fec, which is not within the livepatch-sample.=
ko
>>   | memory region(It should be larger than 0xffff80007b155000).
>>=20
>>=20
>> Let me explain using a __dummy__ example.
>>=20
>> Assume Memory layout before relocation:
>>=20
>>   | Address | Element                                 | Relocation
>>   |  ....   | ....                                    |
>>   |   60    | init_module (start address)             |
>>   |   72    | init_module (end address)               |
>>   |  ....   | .....                                   |
>>   |   100   | Sframe section header start address     |
>>   |   128   | First FDE's start address               | RELOC_OP_PREL ->=
 Put init_module address (60) - current address (128)
>>=20
>> So, after relocation First FDE's start address has value 60 - 128 =3D -68
>>=20
>
> For SFrame FDE function start address is :
>
> "Signed 32-bit integral field denoting the virtual memory address of the=
=20
> described function, for which the SFrame FDE applies.  The value encoded=
=20
> in the =E2=80=98sfde_func_start_address=E2=80=99 field is the offset in b=
ytes of the=20
> function=E2=80=99s start address, from the SFrame section."
>
> So, in your case, after applying the relocations, you will get:
> S + A - P =3D 60 - 128 =3D -68
>
> This is the distance of the function start address (60) from the current=
=20
> location in SFrame section (128)
>
> But what we intend to store is the distance of the function start=20
> address from the start of the SFrame section.  So we need to do an=20
> additional step for SFrame FDE:  Value +=3D r_offset

Thanks for the explaination, now it makes sense.

But I couldn't find a relocation type in AARCH64 that does this extra +=3D
r_offset along with PREL32.

The kernel's module loader is only doing the R_AARCH64_PREL32 which is
why we see this issue.

How is this working even for the kernel itself? or for that matter, any
other binary compiled with sframe?

From=20my limited undestanding, the way to fix this would be to hack the
relocator to do this additional step while relocating .sframe sections.
Or the 'addend' values in .rela.sframe should already have the +r_offset
added to it, then no change to the relocator would be needed.

> -68 + 28 =3D -40
> Where 28 is the r_offset in the RELA.
>
> So we really expect a -40 in the relocated SFrame section instead of -68=
=20
> above.  IOW, the RELAs of SFrame section will need an additional step=20
> after relocation.
>

Thanks,
Puranjay

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZ8AyiRQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2nc64AQCrImK/xT/H/sSJyKH/7xwB1DnkIwCd
H+TAPuqrhqK6YwD/S/fgUeM06UgZceakvwwGL0B6KlZyow2qyPBm9thb3wI=
=IByT
-----END PGP SIGNATURE-----
--=-=-=--

