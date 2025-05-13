Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64672C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twMFRJTKXRFBljK7BAdqD+Wqm66eVS8qvsxadlyE9g0=; b=r4kAql/b+vwnpMOezK7m9Cu5uR
	XWnGlxOw3N3rr+DcriGMaI/Dv4Jl9kKEkrFNdw7YRYjhq2ZFwdcFpt+MX13vIkHerDlIqpgBUP+6R
	Vx1LOA78cgVZmLIY7CRdMUDSZ48Hu0eNdC9dCZezBWajhdGHUDzCFJBOHlhoNL7z9nX49dK0mpDlb
	LAm6m8sohPt0Dgrr1nnzwH+aQS2P+RnXPu40Kr1rWlkBkDMESawsLG8894Xv95T2ZxjJ9NDe+9oNc
	9Fw9DmqlFN3AngHvrSrjYFizt3uxgOcEmBue6tOEmFvNCb+OduPdLaDuutKAwNIS5GnFpOk2Z/lFa
	sBR/rmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErwb-0000000CqrJ-1keG;
	Tue, 13 May 2025 15:53:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErrS-0000000Cpuf-2Cj2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:48:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a1fb17bb8cso3562853f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747151285; x=1747756085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twMFRJTKXRFBljK7BAdqD+Wqm66eVS8qvsxadlyE9g0=;
        b=NpCBw3KOYRXWGqliPi35fjTYVujJVMxZrc+K5Krx6+YdCYmQLB0NnYCGxEh7ZPvKCB
         tKG9MEqN0/YJsyKZFQGx7vakaeiKi/dc7KkhrQdpAjgg7HU8dH0Ns/rqrcd3t6a+dfIB
         IfV6A06udHqPATrcxn4lJmJS9IW/90USpbw1jAhEKYjikS+OoQmfgPIMYSaTV7xAQ5vj
         I617TtvOIE76/KU5nB+dXia4kW4Cz5sua1LmuI5+pvHTAIMzMvKHL+WdXn5QlvyObWOm
         6IzHFeC5aA4BJUUvW3OfQjK45i2XSxYw/Eb8FhDvLOW//kkkhrP6krqRKSJ8jHiWYXfr
         gH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151285; x=1747756085;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twMFRJTKXRFBljK7BAdqD+Wqm66eVS8qvsxadlyE9g0=;
        b=dtSmUkYVHDmACXFpTFDYdqgAMqryUmcrcnSiFe90fptBHgmtTlV/t0UVUZ70ft3The
         PDZtHmDMLYhB4RBjClOAm3lLgBup7k3/4Kw46QmjaHNc7Z7j17aCoOLk5xggB3Fg/rTq
         Ff9ovoqGfUf14t9FFHp1SZvr5GZdE5dcVQ3VJ4FmcGyOzEB2CWIQxWSO9mX2o4NpJqkT
         jN56IGKVkZ0PfjjQapZ6k4CIgDZ3LoJCOrDmw0hUPxY/OqYu83uuy99EYdK6VIkERyFR
         N42S1qnnv+OOVGLmnrNUsJTchHwdDTiwcfMxy16Z8WTU26EtmhDZ49vMrSGnFsXc54P/
         MnUw==
X-Forwarded-Encrypted: i=1; AJvYcCV2Sz86LTaIO6HO9bMeBTufRWHQWi8S59b4V+Kk9hpxPc909kTM3GHXkPl5ghmjEQrFoEU6PjD47QaCqfwcmdoZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyelLbKhvzojVth2kEc8fTRCnk60xQ+fdX3xc+CynCwfryCmPv6
	gJAeLJj3WdqyI8AoZ5FSztqW/PHlOQbyPw0IJ7UNLC39MzCdTSKCGrv6jRnom04=
X-Gm-Gg: ASbGncvF7RqfX44LVgIJnLZGlif1T68QT9K0kdxePuUdWzdviPhaoci9azHQmEJl6pg
	+OuNxanQpD8VjfLWdxWMTYYwAGZmAuELwJpAV/sDmgpzUTLt+uNFtkoylXrWJmI2VraYTbffzTN
	Qmv/rcCjk/6vAXEOOt1qHR25Z8JB/bUdyOAokEqckZgFf2RJOAD2AMC1RZXVFde7xeC/JgqYhtQ
	kFQaHUs06t8V6S2O7L3Yw4FHCvAzaCPELB5KqZK1onXdPLFIQEAzecbIXsjnuKPcSr7hMnAQDtb
	EDjUykyBC4CDNBaDrav1sEeWBzI53Tk87Ok7iVXYvcy1JWcQPlk=
X-Google-Smtp-Source: AGHT+IGwvBiWlgqbXuP8q12INpK112AxGYeN5PxjFrpvlMGtcULzZODQsT3BNuhxlCXGSL0e+o8cKg==
X-Received: by 2002:a05:6000:1884:b0:3a2:2d6:4205 with SMTP id ffacd0b85a97d-3a202d6427cmr9422854f8f.47.1747151284596;
        Tue, 13 May 2025 08:48:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:26f2:6152:bc18:9105])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58f2fc4sm16882155f8f.56.2025.05.13.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:48:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  khilman@baylibre.com,
  martin.blumenstingl@googlemail.com,  sboyd@kernel.org,  daniels
 <daniels@collabora.com>,  Daniel Stone <daniel@fooishbar.org>,
  lumag@kernel.org,  robdclark <robdclark@gmail.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: amlogic: Synchronous Abort with v6.15-rc6
In-Reply-To: <714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com> (Vignesh
	Raman's message of "Tue, 13 May 2025 19:56:29 +0530")
References: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
	<b090cef6-5b9e-4149-872d-0316666f9e90@linaro.org>
	<714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 13 May 2025 17:48:03 +0200
Message-ID: <1j5xi4zf4c.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_084806_568234_8FD20710 
X-CRM114-Status: GOOD (  18.54  )
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

On Tue 13 May 2025 at 19:56, Vignesh Raman <vignesh.raman@collabora.com> wr=
ote:

> Hi Neil,
>
> On 13/05/25 15:25, neil.armstrong@linaro.org wrote:
>> Hi,
>> On 13/05/2025 11:41, Vignesh Raman wrote:
>>> Hi,
>>>
>>> The Amlogic Meson G12B (A311D) SoC board (meson-g12b-a311d-khadas- vim3)
>>> fails to boot with the following logs,
>>>
>>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76210200
>>>
>>> 02:58:27.819: Starting kernel ...
>>> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
>>> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
>>> 02:58:27.819: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
>>> 02:58:27.819: elr: 00000000f2f26a48 lr : 00000000f2f26c88
>>> 02:58:27.819: x0 : 00000000050fffc0 x1 : 0000000001004383
>>> 02:58:27.819: x2 : 00000000f2f6a358 x3 : 000000000000003f
>>> 02:58:27.819: x4 : 00000000f4fefffc x5 : 0000000000000010
>>> 02:58:27.819: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
>>> 02:58:27.819: x8 : 0000000000000008 x9 : 0000000000000001
>>> 02:58:27.820: x10: 0000000000000010 x11: 0000000000000004
>>> 02:58:27.820: x12: 00000000f4fefc00 x13: 0000000000000000
>>> 02:58:27.820: x14: 00000000f4fefc00 x15: 0000000000000000
>>> 02:58:27.820: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
>>> 02:58:27.820: x18: 00000000f0f21d90 x19: 00000000050fffc0
>>> 02:58:27.820: x20: 0000000000000000 x21: 000000007ffe9000
>>> 02:58:27.820: x22: 0000000000001710 x23: 00000000f0f0e8c0
>>> 02:58:27.820: x24: 0000000000000000 x25: 0000000000000000
>>> 02:58:27.820: x26: 0000000000000000 x27: 0000000000000000
>>> 02:58:27.820: x28: 00000000f0f4f790 x29: 00000000050fff60
>>> 02:58:27.820: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
>>> 02:58:27.820: Resetting CPU ...
>>>
>> Could you boot with earlycon enabled to at least have a clue of what's
>> happening ?
>
> There is a synchronous abort right after 'Starting kernel...'. Maybe this
> prevents any early console logs from appearing.
>
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76243455

I've just tried to boot v6.15-rc1 on a vim3 (A311D). Booted fine.

>
> 13:54:02.013: =3D> setenv bootargs 'console=3DttyAML0,115200n8 root=3D/de=
v/nfs rw
> nfsroot=3D192.168.201.1:/var/lib/lava/dispatcher/tmp/18641665/extract-nfs=
rootfs-h2fjsmdc,tcp,hard,v3
> init=3D/init rootwait usbcore.quirks=3D0bda:8153:k earlycon=3Dmeson,0xff8=
03000
> keep_bootcon  ip=3Ddhcp'
> 13:54:02.014: $ booti 0x1080000 - 0x1000000
> 13:54:02.014: =3D> booti 0x1080000 - 0x1000000
> 13:54:02.014: Moving Image from 0x1080000 to 0x1200000, end=3D5160000
> 13:54:02.014: ## Flattened Device Tree blob at 01000000
> 13:54:02.014:    Booting using the fdt blob at 0x1000000
> 13:54:02.014: Working FDT set to 1000000
> 13:54:02.014: ERROR: reserving fdt memory region failed (addr=3D5000000
> size=3D300000 flags=3D4)
> 13:54:02.014:    Loading Device Tree to 000000007ffe9000, end
> 000000007ffff57c ... OK
> 13:54:02.014: Working FDT set to 7ffe9000
> 13:54:02.014: Starting kernel ...
> 13:54:02.014: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
> 13:54:02.014: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
> 13:54:02.014: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
> 13:54:02.014: elr: 00000000f2f26a48 lr : 00000000f2f26c88
> 13:54:02.014: x0 : 00000000050fffc0 x1 : 0000000001004383
> 13:54:02.014: x2 : 00000000f2f6a358 x3 : 000000000000003f
> 13:54:02.014: x4 : 00000000f4fefffc x5 : 0000000000000010
> 13:54:02.014: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
> 13:54:02.014: x8 : 0000000000000008 x9 : 0000000000000001
> 13:54:02.014: x10: 0000000000000010 x11: 0000000000000004
> 13:54:02.014: x12: 00000000f4fefc00 x13: 0000000000000000
> 13:54:02.014: x14: 00000000f4fefc00 x15: 0000000000000000
> 13:54:02.014: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
> 13:54:02.014: x18: 00000000f0f21d90 x19: 00000000050fffc0
> 13:54:02.014: x20: 0000000000000000 x21: 000000007ffe9000
> 13:54:02.014: x22: 0000000000001710 x23: 00000000f0f0e8c0
> 13:54:02.014: x24: 0000000000000000 x25: 0000000000000000
> 13:54:02.014: x26: 0000000000000000 x27: 0000000000000000
> 13:54:02.014: x28: 00000000f0f566a0 x29: 00000000050fff60
> 13:54:02.014: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
> 13:54:02.014: Resetting CPU ...
>
> Successful logs with v6.14-rc7,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76248143
>
>> BPI-M2S (A311D) is booting fine on v6.15-rc, see https://gitlab.com/
>> amlogic-foss/abcd-linux-test/-/jobs/10004997032
>> But perhaps something specific to the VIM3 is breaking, do you change the
>> kernel config for the DRM ?
>
> Yes, we change the config. Please see the config used to build the kernel,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76243439/artifac=
ts/file/artifacts/testing:arm64_config
>
> Regards,
> Vignesh
>
>> Neil
>>=20
>>> The board boots successfully in v6.14-rc7, but the issue appears
>>> starting from v6.15-rc1. These tests were run in drm-ci.
>>>
>>> On bisecting the kernel, the first bad commit identified by git biscet
>>> is,
>>>
>>> 59c35416f4246aee66b5f5523fdc950b83325d82 is the first bad commit
>>> commit 59c35416f4246aee66b5f5523fdc950b83325d82
>>> Merge: 472863ab2aca e988adcb5dee
>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>> Date:=C2=A0=C2=A0 Sat Mar 29 17:23:34 2025 -0700
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Merge tag 'clk-for-linus' of git://git.kernel.=
org/pub/scm/linux/
>>> kernel/git/clk/linux

It is odd the first bad commit is a merge :/

>>>
>>> Please could you look into this issue. Thank you.

Assuming it is not something in CCF itself, 2 commits for this platform
in the PR mentionned above:

0079e77c08de clk: amlogic: g12a: fix mmc A peripheral clock
8995f8f108c3 clk: amlogic: g12b: fix cluster A parent data

Checking the clock tree, those appears to work as intended, including
the VIM3 platform.

Maybe try reverting one or the other, see if that changes anything.

>>>
>>> Regards,
>>> Vignesh
>>=20

--=20
Jerome

