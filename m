Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CD4CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 00:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ay5nOcwCJCKL9kJTKSvIioIW4guYTs+JXkN6Y689XM=; b=FxG2irTRkarVEdZDfmgc+cW+X0
	CtelHraba+t1Dz1x9mFXSrmnnEx+yOkKGcI3PYelB0EMlExXzxju9inuNHT7LSjvGmnsjhCI3qnwD
	ekjxXtbM5IIj2WLIs7yoxKtguZVnvxKPxo3ouy20wFVxObF2t0ZaCnfdWxAv/oVUobpw3qH3rq6eg
	xFSRx6dLnF5X/SaGIROY1e1zTmLch2WcvjO7HSoPM6BCM5CzQHengJyhmACmg1IDmdpypRQlA1whk
	caAWTYg1gWsri1fQlmv7Urqq+MlNmml/SKnGnIAMNQHXCtaZwoGEDZ9Kb20Zwy7mai0FrLNJdtR7f
	HJPcxnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQDjY-00000009P33-1Hjz;
	Fri, 22 May 2026 00:27:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQDjV-00000009P2B-33XZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 00:27:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso49321805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779409639; x=1780014439; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ay5nOcwCJCKL9kJTKSvIioIW4guYTs+JXkN6Y689XM=;
        b=GHYhOr2it3LnK8lGChb8cpmpB6+pOPwBCTBaTh6YGFaR9VyGcTfkp1iewY35QcwvHT
         QGypqHvN0EauhxCsiU4tYCDIDxb9o4daWPCUrUROwNgNPhiOVdhUeFBwm4M9608R4VOg
         uGpitN0USI9e5AELO0s80Am6IpTJTY+p/4/mpXKYmK3GXD8Zs3Wh0TDqj3n0VKGRpS1r
         FnpwveK1dacrziEft/jpCezOFTS3MRErH32TmTi2ybpbEBKOIo/nY583Ib9mFYvT7+wN
         oY0MUy3slrL1agc5SAXJ2BjoCveahhSenCTkuqK1iAkzog/nckxLhAGpJvpiHY5bCwIW
         E+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779409639; x=1780014439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ay5nOcwCJCKL9kJTKSvIioIW4guYTs+JXkN6Y689XM=;
        b=TcWyfs4LzNHicL6wylObqsSdNV4OPFNitURHXhJZB3dcE4QpfMyUt/70K4+QgZ7g4H
         Kc4DBIgaDRdYoUlZ8RykVdqgMN8IpkjOnPdD1uNiDd6GtdMuQhKk7XC64/oaGUnGm/7t
         J8S7K/yAAKqoPLZf4NjXbH/d2RfqWvCFfyVCqfyZlVsE69BHFeGCsHV85LV56ughTU9S
         mf2U9GLZ6aBtHK6+x6ohDguuVdKYm0htubhmizxo8AVa/ff7jz6usv/IaJ5z9tgsIiIR
         vHdyxIn0LQLoA/N4yxB8d2kKmEuBnhkX2eekABsA56S8+3AiEnPCLLStdMgEDGGaKbtd
         D+iQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xYXwaTXxZ892ntUqmpO1Mbi6W0X8XVxmjVUFhhx3xUUk+EQqiMmGq7C6K3OhynmbZZVQ3iXwCapKqE6hVxqsG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1v5F41ajaSKgGVW5uANwfo9WeC4GLnbTGNCTR0lYk8Vpx+5wh
	aVv6lAZ525aydVlX2ae7Uduhu2nSEHlkepZYE5NlfD5+Q+0m7epks73D8W+yG5XtUXM=
X-Gm-Gg: Acq92OGAtFVqkrrkc1fHC3W6zdIVZb0IwCRajnvBLRki4VuIHlIt8JG0VUbXNsbyu3Q
	8ghvfrZltqovMuP2GYVvZsaaSoBAWMBtiA2epFbt+uSNFdN98AsOiWs0nv24421hjZVh9MBTwnl
	JXxi1AWsSnwkfKvJY4xBbeDWXd/+X5DSHUiaHTr4N2sAHAJlvcuPDM4NGvwX4bm5TyCa9UYQJoJ
	uA+i8zkfsw/rSSn/79JgVZDG/QaAbw/UEh2o8/3BgqCMi35luuyYAu+ECACFZ0tXzfuREfBCWbe
	gYvsoS3b2CSDrW21QaptQ/W/FUXY6ZFkKarbdfbyOE8kW3RPaoEKKl6UVdlO0XtVcnVToItRrsu
	msidkQxl54a5/lekbJYbF90MKyWQ0qD60IGaMddMOshHb84eZeOunTt+T2NOFca23Zi42dCrP01
	G6TAEpWwPSlBLCHZ+pzBUyxoE7GNz/uqgIaqeArVWncRbBENGDcnlpxWbSayHnFty2NdmyX5i+h
	HKngit5qcYjCaMnAebOjjmFsPZvDMJ/EXxMm/2PaDMh0AGsxKXTYWM/5A==
X-Received: by 2002:a05:600c:4ecc:b0:490:3c90:2cda with SMTP id 5b1f17b1804b1-490426cef73mr10709345e9.20.1779409638952;
        Thu, 21 May 2026 17:27:18 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1:0:2bb5:f164:6e6a:38d8? (2403-580d-fda1-0-2bb5-f164-6e6a-38d8.ip6.aussiebb.net. [2403:580d:fda1:0:2bb5:f164:6e6a:38d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb0f91bccsm4187125ad.36.2026.05.21.17.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 17:27:17 -0700 (PDT)
Message-ID: <cced8d26-d846-470d-b112-344e53ec1b9c@suse.com>
Date: Fri, 22 May 2026 09:57:00 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
To: Andrew Morton <akpm@linux-foundation.org>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Christoph Hellwig <hch@lst.de>, "H. Peter Anvin" <hpa@zytor.com>,
 kreijack@inwind.it, David Sterba <dsterba@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
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
References: <20260512052230.2947683-1-hch@lst.de>
 <20260512052230.2947683-2-hch@lst.de> <20260512114231.GG2558453@suse.cz>
 <20260513054742.GA1018@lst.de>
 <0a8d1ff4-f5a2-49e9-aa45-d25dbe4ded40@libero.it>
 <20260515043705.GA3855@lst.de>
 <34C16854-1065-4542-8836-DDED58EC1844@zytor.com>
 <20260518051207.GB9374@lst.de> <f46636c8-80ba-4802-a6a0-74cbc35e7bee@gmx.com>
 <20260521171730.7872482df453975cf60ce7dc@linux-foundation.org>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20260521171730.7872482df453975cf60ce7dc@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_172721_786370_53D57B2C 
X-CRM114-Status: GOOD (  18.40  )
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



在 2026/5/22 09:47, Andrew Morton 写道:
> On Wed, 20 May 2026 18:11:09 +0930 Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
> 
>>
>>
>> 在 2026/5/18 14:42, Christoph Hellwig 写道:
>>> On Fri, May 15, 2026 at 12:59:34PM -0700, H. Peter Anvin wrote:
>>>> I don't think this is a good idea. Error out; it is the btrfs maintainers' job to ensure user data isn't lost.
>>>>
>>>> The RAID-6 code has *never* supported only 3 units, and if it ever worked for *any* of the implementations it was purely by accident. Speaking as the original author I should know; this was deliberate as in some cases the degenerate case (3) would have required extra trays in the code to no user benefit.
>>>>
>>>> I would not be surprised if the kernel crashed or corrupted the page cache in that case.
>>>
>>> It does, that's why I wanted to exclude it.  Anyway, for the about to be
>>> resent version I'll drop this btrfs patch over the stated objection and
>>> will otherwise not change anything.  This means the (IMHO hypothetical)
>>> users of this configuration will get a WARN_ON_ONCE triggered, but
>>> otherwise keep working (or rather not working) as before.
>>>
>>
>> For the btrfs part, I believe I can get the current 2-disk-raid5 and
>> 3-disk-raid6 to fallback to raid1 inside btrfs.
>>
>> I hope the btrfs part can be finished and reach the next merge window,
>> but I'm not 100% sure.
>>
>> What is the planned cycle to merge this raid5/6 cleanup?
> 
> At present it's on track for the 7.2-rc1 merge window.  Does that suit?

The current btrfs fix (*) is pretty small, I believe we can get it into 
the next merge window, as long as we got enough review on it.

*: 
https://lore.kernel.org/linux-btrfs/a1d63733465229936351804f3760803d5894a962.1779274630.git.wqu@suse.com/T/#u




