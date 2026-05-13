Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520B6CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzc3j2nHoRxQd9M0vkzx/uZg5Iwn8WIixU3RTEBg+i4=; b=yvmgeIQ+3EpzQd4mr6OsUz//Sw
	q3ymFuX3t7BWRytQAo27B8BtvMfmf0UHkJlfe9Vyqy1Je9F/3015KJoEw6veYS47BIInPXVQlfNGB
	cFzW6VNob9nyuSGVoW4DmJ944pX8bekGowDqiRj9v87izECs2tFThRK7S0duN3j55j0qv6KYRq49W
	AbDxGo4/SQ7JLaAPfWcSdlsq9URA8dh8swTemqtwCXd4zpdV8wUU6N8xOXBTdq3tRRSmP5SG0pAeW
	H1kW1JaIg8VNBNrwxcbbetW3GodUqFjZQXKJ81YNRIvzzqAyOqRHaUVWyd1ZtjOwd8AsU51oeBuwu
	FslG4dPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCQV-00000003Col-0oAl;
	Wed, 13 May 2026 16:27:15 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCQT-00000003CoB-1JC4;
	Wed, 13 May 2026 16:27:14 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 64DGEn1a2905667
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 13 May 2026 09:14:50 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 64DGEn1a2905667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026042601; t=1778688894;
	bh=kzc3j2nHoRxQd9M0vkzx/uZg5Iwn8WIixU3RTEBg+i4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Ahhs2ZaNxCuIyTcDd/to/S7gqU6ft6zabx6TakulFhnIjDt8bXMJ0LGzYVyEfrxzF
	 EoSq1ir5sKEz+X8RiAhKD9hHd7SJ2OozMvt9/+9wrxu0pBvVJBlgjVq84smFg5PvWl
	 ODAygtu3MetLOSzf39fcORVc45KgUJxXa0B3c1WcYV/TBfKv8I2j2JZj6Oo7LMLnaS
	 F/w+6e9Kh9WjQd20++VspvTwbnc9Zogl0CKsAiiMu7QXkJbZu0hP9l3BvRBi3h/lIE
	 60H32//SMm5Gsh1hto9j6ldrE4pFtBClA6C9ESo0hnzWXYJCYw3OlK+u43GeYa68K6
	 OTz8RC1DMTHsw==
Date: Wed, 13 May 2026 09:14:44 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
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
In-Reply-To: <20260512052230.2947683-2-hch@lst.de>
References: <20260512052230.2947683-1-hch@lst.de> <20260512052230.2947683-2-hch@lst.de>
Message-ID: <45B68AA3-36E2-4187-BD30-F4631C7F32C2@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_092713_358854_DFC029F8 
X-CRM114-Status: GOOD (  12.28  )
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

On May 11, 2026 10:20:41 PM PDT, Christoph Hellwig <hch@lst=2Ede> wrote:
>While the RAID6 algorithm could in theory support 3 devices by just
>copying the data disk to the two parity disks, this version is not only
>useless because it is a suboptimal version of 3-way mirroring, but also
>broken with various crashes and incorrect parity generation in various
>architecture-optimized implementations=2E  Disallow it similar to mdraid
>which requires at least 4 devices for RAID 6=2E
>
>Fixes: 53b381b3abeb ("Btrfs: RAID5 and RAID6")
>Signed-off-by: Christoph Hellwig <hch@lst=2Ede>
>---
> fs/btrfs/volumes=2Ec | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/fs/btrfs/volumes=2Ec b/fs/btrfs/volumes=2Ec
>index a88e68f90564=2E=2E0b54b97bdad8 100644
>--- a/fs/btrfs/volumes=2Ec
>+++ b/fs/btrfs/volumes=2Ec
>@@ -159,7 +159,7 @@ const struct btrfs_raid_attr btrfs_raid_array[BTRFS_N=
R_RAID_TYPES] =3D {
> 		=2Esub_stripes	=3D 1,
> 		=2Edev_stripes	=3D 1,
> 		=2Edevs_max	=3D 0,
>-		=2Edevs_min	=3D 3,
>+		=2Edevs_min	=3D 4,
> 		=2Etolerated_failures =3D 2,
> 		=2Edevs_increment	=3D 1,
> 		=2Encopies	=3D 1,

Yes, if anyone cares about < 4 disks for the RAID-6 case (or < 3 for the R=
AID-4/5 case), just use the RAID-1 code=2E

