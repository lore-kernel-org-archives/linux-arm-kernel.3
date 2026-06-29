Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C571C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5eNBCeca9FFTuFbHhVBFOemJYWYzDmHgzejZkXlIwM=; b=ufYqFuYZs1hGE/ZObkMz3NVLcr
	xFqifXkdHRE6gOAVdAnjanODcDSIKE7OIvPNfiRwMOf9RaZTxHgoIffaRdZypzOdgaNMXi0m4vcc+
	9XEsX5DrApPYlV2PAK/9Ive502FQ1RB3U2f8aIU6/cjLEcvagyRD4Bm6ua0gODBnqBtqHhvEquR/p
	/s2+27gDXlqKVf8t5bLhRxYCcoHbwS4WHgkvA9p6o16zrWuUEciTLwHrfibMyKw903zGfSsLCxTBB
	FVfJ5dfwHh2RUWZ7AACQF2gy5IIQ8Rw+YcF1QArDUKmkOUJVmJ4Zv4lMu+WrzmjJNU7zy7MTPlf2g
	017BL2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBOQ-0000000Ebu9-3l7N;
	Mon, 29 Jun 2026 12:47:18 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBOO-0000000Ebsr-1jAn;
	Mon, 29 Jun 2026 12:47:17 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 65TCYlVH219229
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 29 Jun 2026 05:34:48 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 65TCYlVH219229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1782736492;
	bh=F5eNBCeca9FFTuFbHhVBFOemJYWYzDmHgzejZkXlIwM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ItDa3yOyOnzgUJtBSZCdhS4zlYRD1XzlbHnWBCrsgDuyOKDQnLXWfugxh1RYrcnHj
	 Wo6d2ASe4aa2kENlvakDGwv3s+KtWwghI1YzuSK4mfraTOB1p7+BurPnKzbMpbQKQL
	 FArnwwcKd8vhlMO88QNlKM8z1OAEuHhiE7bWCyq/7xJ09JZm9//17j5avtQhx3ZQCW
	 62VMIArJVSZ3KSFw9+v6qyIZPgiOE1KxeelvfNkr5eljLOhZuntNE2qq7OnkyMcON6
	 lCC018LGMBA4PoGUZ03daik0PWEEF4Ej3Y7mFmcxCoVSXT9w4uUsvXWEvA5Jy73wT+
	 n9LoSC8sobApw==
Date: Mon, 29 Jun 2026 05:34:41 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Christoph Hellwig <hch@lst.de>
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
Subject: Re: cleanup the RAID6 P/Q library v3
User-Agent: K-9 Mail for Android
In-Reply-To: <20260629122152.GA21344@lst.de>
References: <20260518051804.462141-1-hch@lst.de> <20260518141205.c100f76eec5f58e78bbbf7af@linux-foundation.org> <20260519082432.GA14956@lst.de> <7d8efc7c-65e3-49f8-9381-910de7affef2@zytor.com> <20260629122152.GA21344@lst.de>
Message-ID: <8684FEC2-AD56-4BDA-874F-1D3D7170F880@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054716_458364_4332EA29 
X-CRM114-Status: GOOD (  14.85  )
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

On June 29, 2026 5:21:52 AM PDT, Christoph Hellwig <hch@lst=2Ede> wrote:
>On Fri, Jun 26, 2026 at 05:52:18PM -0700, H=2E Peter Anvin wrote:
>> On 2026-05-19 01:24, Christoph Hellwig wrote:
>> >=20
>> > raid6: rework registration of optimized algorithms
>> >=20
>> >  - avx2 instead of avx512 is probably the right thing for no
>> >    benchmarking, but if it was intentional (it wasn't), that should
>> >    be document=2E  So I'll just switch back to the previous version t=
o
>> >    keep the state of the art
>>=20
>> It is unlikely to be the right thing *going forward*, though=2E
>>=20
>> The very unfortunate performance inversion is likely model-specific=2E =
It is one
>> of those things where you largely would have to have a list of quirks :=
(
>
>Note that the default is still to benchmark the implementations=2E
>This is just about the case where the user explicitly disabled that
>benchmark-based selection=2E
>

The real issue though is that the benchmarking isn't really helpful, eithe=
r=2E=20

It has to do with power across the whole chip, so it perversely enough dep=
ends on what *else* is going on=2E=2E=2E

