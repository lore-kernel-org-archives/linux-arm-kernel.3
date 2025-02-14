Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7202C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTmDi5P0C1znqK+53OM1b7sxi9s/bRcAbh2CRPFU3rg=; b=kSrgniQR8RoCrI78z43GklpTMg
	mlm5CAspzPcEu7Ei9vSxsd+sh8ejxDd06U55wmZhaF2KbqsYGmHPXUZT53k/iHh+OBtNvtEQDM/LC
	CWboQ/lBOuyGRXZgc6Z/pvqJPnrs+sUTbz8axPCy6Phqw0Cqm0Nxse+3C8yA2FKXVq4TYW+JF45ND
	JxYwmw4hLMwtGByjCA3JR69gLf7VTQO9auIToItzWkM+pLont2NDsK+i83ZGeI6VnQd6QBQ+lfX46
	9LY2etqFErM4+9soRizkqH4s8jS0IMrDy7nahWZ5xUYr9RxdlO02l7KrT7w3ewzDXn+cG2/D59emw
	GAH9HtQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj19T-0000000G05z-49te;
	Fri, 14 Feb 2025 19:15:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0tH-0000000Fxg2-3c1W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBB295C49E2;
	Fri, 14 Feb 2025 18:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD3AC4CED1;
	Fri, 14 Feb 2025 18:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739559498;
	bh=KiNLZ0/NyKmC3pse1b0vCYYtm1OSY6/gLEADVFCZv1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cPm/N9DgK4l+mNeuzub/9tQnk6u1Ey6um4ONJjfmApoywQDxFWFQfTjJIWHwIfkur
	 A0xn6GtvJ/vyHEZ5gYFXRqPEULYyaXTM8ZPoePdUJtsSXRvEXmD+sCPsc2vsyyUoED
	 u1RCF7tx2kum8O65iZS0pOOPzsG2rkmX8BjENHD/Z57dUqrexIzdtt5FwWlg2WNH4K
	 dST+NQuNZcNdftJyxAi/87YVWsu+CRWqH2eJ7PZLnqTRgPjh1zcAqeOHzh5Wnj+Ixa
	 RXy06raG6equu/JHaulyGversBI8X97GsgOVTSz/HbyEyQSBpZ4yPMZrFjhYPflIdZ
	 PK6WPBxFeOwrA==
From: Puranjay Mohan <puranjay@kernel.org>
To: Indu Bhagat <indu.bhagat@oracle.com>, Song Liu <song@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>
Cc: Weinan Liu <wnliu@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, roman.gushchin@linux.dev, Will Deacon
 <will@kernel.org>, Ian Rogers <irogers@google.com>,
 linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, joe.lawrence@redhat.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
In-Reply-To: <d91eba9a-dbd1-488f-8e1b-bc5121c30cd1@oracle.com>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
 <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe>
 <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <3069bb9c-6245-4754-a187-ac8253103d32@oracle.com>
 <mb61pa5apc610.fsf@kernel.org>
 <f8d93a1b-3ad0-4e19-846f-c08d9cb19f48@oracle.com>
 <d91eba9a-dbd1-488f-8e1b-bc5121c30cd1@oracle.com>
Date: Fri, 14 Feb 2025 18:58:01 +0000
Message-ID: <mb61p1pw0qrpi.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_105819_990580_04FCA8CC 
X-CRM114-Status: GOOD (  21.38  )
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

> On 2/14/25 9:39 AM, Indu Bhagat wrote:
>> On 2/13/25 11:57 PM, Puranjay Mohan wrote:
>>> Indu Bhagat <indu.bhagat@oracle.com> writes:
>>>
>>>> On 2/12/25 11:25 PM, Song Liu wrote:
>>>>> On Wed, Feb 12, 2025 at 6:45=E2=80=AFPM Josh Poimboeuf <jpoimboe@kern=
el.org>=20
>>>>> wrote:
>>>>>>
>>>>>> On Wed, Feb 12, 2025 at 06:36:04PM -0800, Song Liu wrote:
>>>>>>>>> [=C2=A0=C2=A0 81.261748]=C2=A0 copy_process+0xfdc/0xfd58=20
>>>>>>>>> [livepatch_special_static]
>>>>>>>>
>>>>>>>> Does that copy_process+0xfdc/0xfd58 resolve to this line in
>>>>>>>> copy_process()?
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 refcount_inc(&current->signal->sigcnt);
>>>>>>>>
>>>>>>>> Maybe the klp rela reference to 'current' is bogus, or resolving=20
>>>>>>>> to the
>>>>>>>> wrong address somehow?
>>>>>>>
>>>>>>> It resolves the following line.
>>>>>>>
>>>>>>> p->signal->tty =3D tty_kref_get(current->signal->tty);
>>>>>>>
>>>>>>> I am not quite sure how 'current' should be resolved.
>>>>>>
>>>>>> Hm, on arm64 it looks like the value of 'current' is stored in the
>>>>>> SP_EL0 register.=C2=A0 So I guess that shouldn't need any relocation=
s.
>>>>>>
>>>>>>> The size of copy_process (0xfd58) is wrong. It is only about
>>>>>>> 5.5kB in size. Also, the copy_process function in the .ko file
>>>>>>> looks very broken. I will try a few more things.
>>>>>
>>>>> When I try each step of kpatch-build, the copy_process function
>>>>> looks reasonable (according to gdb-disassemble) in fork.o and
>>>>> output.o. However, copy_process looks weird in livepatch-special-=20
>>>>> static.o,
>>>>> which is generated by ld:
>>>>>
>>>>> ld -EL=C2=A0 -maarch64linux -z norelro -z noexecstack
>>>>> --no-warn-rwx-segments -T ././kpatch.lds=C2=A0 -r -o
>>>>> livepatch-special-static.o ./patch-hook.o ./output.o
>>>>>
>>>>> I have attached these files to the email. I am not sure whether
>>>>> the email server will let them through.
>>>>>
>>>>> Indu, does this look like an issue with ld?
>>>>>
>>>>
>>>> Sorry for the delay.
>>>>
>>>> Looks like there has been progress since and issue may be elsewhere,=20
>>>> but:
>>>>
>>>> FWIW, I looked at the .sframe and .rela.sframe sections here, the data
>>>> does look OK.=C2=A0 I noted that there is no .sframe for copy_process =
() in
>>>> output.o... I will take a look into it.
>>>
>>> Hi Indu,
>>>
>>> I saw another issue in my kernel build with sframes enabled (-Wa,--=20
>>> gsframe):
>>>
>>> ld: warning: orphan section `.init.sframe' from `arch/arm64/kernel/pi/=
=20
>>> lib-fdt.pi.o' being placed in section `.init.sframe'
>>> [... Many more similar warnings (.init.sframe) ...]
>>>
>>> So, this orphan sections is generated in the build process.
>>>
>>> I am using GNU ld version 2.41-50 and gcc (GCC) 11.4.1
>>>
>>> Is this section needed for sframes to work? or can we discard
>>=20
>> No this should not be discarded.=C2=A0 This looks like a wrongly-named b=
ut=20
>> valid SFrame section.
>>=20
>
> Not wrongly named. --prefix-alloc-sections=3D.init is expected to do that=
=20
> as .sframe is an allocated section.
>

So, these .init.sframe sections are then moved into .sframe by the
linker? (see linker script line below)

Here are some outputs from the build, do they look correct?

One of the objects that were emitting the warning
[ec2-user@ip-172-31-32-86 linux-upstream]$ readelf -SW arch/arm64/kernel/pi=
/lib-fdt.pi.o | grep sframe
  [47] .init.sframe      PROGBITS        0000000000000000 003c90 000226 00 =
  A  0   0  8
  [48] .rela.init.sframe RELA            0000000000000000 008f08 000180 18 =
  I 51  47  8

Final vmlinux ELF
[ec2-user@ip-172-31-32-86 linux-upstream]$ readelf -SW vmlinux | grep sframe
  [ 5] .init.sframe      PROGBITS        ffff80008118c298 119c298 002a88 00=
   A  0   0  8
  [ 6] .sframe           PROGBITS        ffff80008118ed20 119ed20 247c45 00=
   A  0   0  8

[ec2-user@ip-172-31-32-86 linux-upstream]$ readelf --sframe=3D.sframe vmlin=
ux | head
Contents of the SFrame section .sframe:
  Header :

    Version: SFRAME_VERSION_2
    Flags: SFRAME_F_FDE_SORTED
    Num FDEs: 51842
    Num FREs: 321245

  Function Index :

Does this also look correct?
[ec2-user@ip-172-31-32-86 linux-upstream]$ readelf --sframe=3D.init.sframe =
vmlinux | head
Contents of the SFrame section .init.sframe:
  Header :

    Version: SFRAME_VERSION_2
    Flags: NONE
    Num FDEs: 16
    Num FREs: 50

  Function Index :


and the linker script has this line:

.sframe : AT(ADDR(.sframe) - 0) { __start_sframe_header =3D .; KEEP(*(.sfra=
me)) __stop_sframe_header =3D .; }

So, do can you suggest the best way to fix these warnings?

Thanks,
Puranjay


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZ6+SOhQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2nfr0AP0bp9YTRByCVNWjOoiV4FEddb39rTPF
OpnPA05CjdoRowEAuAAqackKFEwlltHwUC4G/yuyJLOxy2EzZEFwU9r07Q0=
=0cv2
-----END PGP SIGNATURE-----
--=-=-=--

