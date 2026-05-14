Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D760CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 20:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeBHge+llXOwbb4JcAn9Da3zKsJCWrqg8YV6SgfLoXo=; b=ZYIv4g6lPmuBrswpAHM3i6mcei
	aZzO5i5N2wGNZrJBuaM979hbKN9pUdlkeBzoF9+3NrxpgMLISvVxOcbsJl7gKtlsphL2o7lymwHUe
	7k988WkZAfhkVA5+LqDVBKO+Mg3fxvHc6ZekHPWZrEX2JiAn64PjlSJzHtPUgGFsDju6o01D5N/mI
	WDY6x4kbGo7xfxy8Vs2W1EkMLGgpHwyijvr6Fe11BVTYthFUIPBzEIli68hB9SL2E+T6W6ub1pi2/
	oXqYCqUwpUdoFpbPHwvx2AP3VWHgIdSRkzm2S3WndylWsMvIL3J0B1NQG2KHP9MKaTBl75xk9HyEF
	E3dwYYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNcOI-00000006Utx-2AiI;
	Thu, 14 May 2026 20:10:42 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNcOF-00000006UtI-3rqA;
	Thu, 14 May 2026 20:10:41 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 64EJvxqM1443783
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 14 May 2026 12:58:00 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 64EJvxqM1443783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026042601; t=1778788682;
	bh=xeBHge+llXOwbb4JcAn9Da3zKsJCWrqg8YV6SgfLoXo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TMJRrv8qsGR2DCztL/jIBPGQO28wsQqHTK/NveRi2zk0+LzcLKFnn8Iviy502ok9i
	 5OPdaLnKd7D98poTZNiOmU0cpqecXLRAlMLlzcNAcqmYAOBC161NH9p9vqagHz1Xzp
	 BPHAozGQd8pC11kLXAzXk4hpCEC4Qm5nr3r8fLBpDaXFU6ItVDJJC6CoKBpExDsJpx
	 SBUnV+538SZRyCwQ4LxXbvqDNKSQfPPT+pqoR4zWD30U5xD3yvUXZOrx9md0+xwCLQ
	 k9df5Yhe3oajwADOBTxx2BUJt+DFl3mJhhVx9sGvHpXM1M36RT8sI9kIAAkr7iTx6O
	 TigG32CPWMUsQ==
Date: Thu, 14 May 2026 12:57:53 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: kreijack@inwind.it, Goffredo Baroncelli <kreijack@libero.it>,
        Christoph Hellwig <hch@lst.de>, David Sterba <dsterba@suse.cz>
CC: Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
        David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Song Liu <song@kernel.org>,
        Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
        Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
User-Agent: K-9 Mail for Android
In-Reply-To: <0a8d1ff4-f5a2-49e9-aa45-d25dbe4ded40@libero.it>
References: <20260512052230.2947683-1-hch@lst.de> <20260512052230.2947683-2-hch@lst.de> <20260512114231.GG2558453@suse.cz> <20260513054742.GA1018@lst.de> <0a8d1ff4-f5a2-49e9-aa45-d25dbe4ded40@libero.it>
Message-ID: <0507CCEF-0548-442F-8703-1D006B5E068B@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_131039_969685_4287929C 
X-CRM114-Status: GOOD (  14.74  )
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

On May 14, 2026 12:51:59 PM PDT, Goffredo Baroncelli <kreijack@libero=2Eit>=
 wrote:
>On 13/05/2026 07=2E47, Christoph Hellwig wrote:
>> On Tue, May 12, 2026 at 01:42:31PM +0200, David Sterba wrote:
>
>>=20
>>> The degenerate modes of
>>> raid0, 5, or 6 are explicit as a possible middle step when converting
>>> profiles=2E  We can use a fallback implementation for this case if the
>>> accelerated implementations cannot do it=2E
>>=20
>> This is not about a degenerated mode=2E  For a degenerated RAID 6, pari=
ty
>> generation uses the RAID 5 XOR routines as the second parity will be
>> missing=2E  This is about generating two parities for a single data dis=
k,
>> which must be explicitly selected=2E
>>=20
>
>I think that the David concern is : "what happens for an already
>existing btrfs raid6 3 disks filesystem when the user upgrade the kernel =
?"
>(I am thinking when a new BG needs to be allocated)=2E=2E=2E
>
>BR
>GB
>

That's what I'm saying =E2=80=93 it should invoke the RAID-1 code under th=
e cover (as with 3 disks, D =3D P =3D Q=2E)

