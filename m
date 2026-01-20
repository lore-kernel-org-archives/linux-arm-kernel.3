Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71A3D26284
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thnE7Lerq2YAOWgwctI0eLWWpc+gSu6vXOqPs3mAkT8=; b=rkHzJNlEplEXzZ6miKUwaEfd5S
	+cwGwAmzeRozJBSyb7Dlbq/W/CRUJz0fX5yp4leoyxXlmx2egEsZXtok6rBufqho5V0iR2V1CpNfa
	idWOdrrZ0CiRDpKr3aOHA15MJvSguscieSvj80ln2gY2NHarons2yMaznYL9MUArklrjUufAZmN5h
	4grKYAfA/fAKK4LAscKB9J1Ho2tFk3h1AbMc4M5zKkTnFsKxmSTFaMUF1XE6dwKFdvjmIdyhw1R0B
	2SK14xWc062bC5MR24j0vaZ95kQ1fLX2l0bYaY4F9cAuZauquQyGpbLG1KyLYIOevTobSuH/KsARp
	zRN76oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGje-00000004Jl7-0V4d;
	Tue, 20 Jan 2026 18:45:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGja-00000004JkN-1Z9o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 18:45:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4358fb60802so65966f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 10:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768934743; x=1769539543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thnE7Lerq2YAOWgwctI0eLWWpc+gSu6vXOqPs3mAkT8=;
        b=AnFKBR8gJ92rj+YIF9GqyjAK7IbSKIjkNmzcG2kexro5HChJinYZKEoyFTWwUc+NPI
         8GCtbGGzVloWB7PP/mmuhhhW75P8uUZdT/q3qZOYOUEneaZFa3zm8hWlop+MxPAyyEZE
         nfBsc/od2oP2QmldPkytFi50KZCHfC2OeEx4CGEpkk/BGQfQPQNmwF52mdlOSH8Ztv51
         mX9RejGOi+55q//Sdnmb0T9euLirnj3E5zQ4tMkq97LZSoNl1QqNzVFxjjx6H+b53oRr
         ak97Y08WD/0BgLO9Mh8YcK+NqystWPxS8Az32fZX/4XdyO40XFKwikpFcCWfPSTeUr1T
         dhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768934743; x=1769539543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thnE7Lerq2YAOWgwctI0eLWWpc+gSu6vXOqPs3mAkT8=;
        b=AD4FgUnp+P+P8kVq4DYGSdNkWWm6F6TFtEqT51rMgreNA4AtWybIbjD1OvUpgBYmVv
         9c27e5KkA/Bgd9EtRy2A47m7uL9UG9SqWBk5i1lEF6KNt2bKhKSx1x/zsHXmMD8xEdlm
         op6KfvIVAinsLwt4kjQUDz12JaMLHWpMkcdv+nGVgIU0v4qUPwE61PtXmsutOpZPA7t3
         JrLlYY2IrTuoS6yJu45nWtNflTePPmOSCRTmlxQawoKM/zWXsmzWxHRI8WNE55tZLWB4
         C/mG6vS9/ROLTCDZzkTzZqbrdWuWEBgheXk76G/y8P2Rudu6dK1OZcJllPosXkY5oiyw
         0xBA==
X-Forwarded-Encrypted: i=1; AJvYcCXRuCT0HrGUL85NHX1oek4uBuaA8yqALYACxdETTF0tU9np1uASACmaqr2ijR8BT6k0FIK9mr1LLBxRcuIDVo7D@lists.infradead.org
X-Gm-Message-State: AOJu0YyM8mX7F42PWE1N6Pxq+y+Xf34uI6MjnSX3+6KOk/2RxpzzEgsM
	bx7swKrRWfMBOGtX6CI/jqL6M2q4hJrBEGS0AUYmk4cFppYP4HzGxi+t
X-Gm-Gg: AZuq6aKmV9NhfdKwY8n1sTGQefdFgD5+KSDTJ1z4kEKZNoI1d78ALTV6Fpa08wC7jjG
	qndGvUYumpSsf1rFHOk52GqF8sg8uY64dwlcNgbzA8CgSGR4Jk+XoRDxvxcXyXOIekQTbp67BSR
	bHE0CByMbUfXft90PuMrvER+fYkp6C/bZdcDnsV9ECu2Zbj54zdUFLuwv3cGvBEaijR4m5FzGJZ
	hP0sMvyBVxtHyepusysRfidbdGZ4rzUl3gZ7wNqrN6KUS+78q4wgMLk7jbtEYfnxCa7VmuwET+U
	IwW+dpZgfgJrmj9X0R1DqJBtD+ZcLOW0L2zPSpP88Btk6BxcGULopvnf8gALDgAVBLHCIo/mUnv
	zCXXXlW+QIj25bXF9nV+1b13rkjoQRhwGx+/9ysydyc3d0xvJAAWuESculOQwbpb7PlSeYnQn5+
	cMsL1rwkva6djm7VdY9KbLRzVtMgp43nUhGbEs1Ym5xzY/CKuc1Obx
X-Received: by 2002:a05:6000:2484:b0:430:fcbc:dc4a with SMTP id ffacd0b85a97d-434d75c16c1mr25592154f8f.19.1768934743113;
        Tue, 20 Jan 2026 10:45:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb1fsm30869735f8f.35.2026.01.20.10.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:45:42 -0800 (PST)
Date: Tue, 20 Jan 2026 18:45:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark
 Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Fix bugs and performance of kstack offset
 randomisation
Message-ID: <20260120184541.0a463cd1@pumpkin>
In-Reply-To: <a8ca3483-d61a-41bd-9b1b-17a8f3ac03eb@intel.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
	<20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
	<C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
	<785a7d90-babe-43af-93a6-c220c1877bcf@arm.com>
	<a8ca3483-d61a-41bd-9b1b-17a8f3ac03eb@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_104546_422621_83EA335F 
X-CRM114-Status: GOOD (  21.71  )
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

On Tue, 20 Jan 2026 08:37:43 -0800
Dave Hansen <dave.hansen@intel.com> wrote:

> On 1/20/26 08:32, Ryan Roberts wrote:
> > I don't think this question was really addressed to me, but I'll give m=
y opinion
> > anyway; I agree it's pretty binary - it will either work or it will exp=
lode.
> > I've tested on arm64 and x86_64 so I have high confidence that it works=
. If you
> > get it into -next ASAP it has 3 weeks to soak before the merge window o=
pens
> > right? (Linus said he would do an -rc8 this cycle). That feels like eno=
ugh time
> > to me. But it's your tree =F0=9F=98=89 =20
>=20
> First of all, thank you for testing it on x86! Having that one data
> point where it helped performance is super valuable.
>=20
> I'm more worried that it's going to regress performance somewhere and
> then it's going to be a pain to back out. I'm not super worried about
> functional regressions.

Unlikely, on x86 the 'rdtsc' is ~20 clocks on Intel cpu and even slower
on amd (according to Agner).
(That is serialised against another rdtsc rather than other instructions.)
Whereas the four TAUSWORTHE() are independent so can execute in parallel.
IIRC each is a memory read and 5 ALU instructions - not much at all.
The slow bit will be the cache miss on the per-cpu data.
You lose a clock at the end because gcc will compile the a | b | c | d
as (((a | b) | c) | d) not ((a | b) | (c | d)).

I think someone reported the 'new' version being faster on x86,
that might be why.

	David

