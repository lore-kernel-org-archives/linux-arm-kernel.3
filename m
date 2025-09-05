Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B038CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsR7Y+QJKJLeuXBToom1xS30gpERtLqMK0ZtsqmDR9g=; b=Ti6cEZ56JIqffK
	8cimSACFeXniC7okjYICxsKvK+Niey/EBzZ5OhCO0g9HDkMQo8UeUNsBDA4ETNby1tCHEGkgrFYqp
	Ps7G5fgu+Vls0J7iuamzXdJh/AYF55wO+tlPlSeIib+41CY7/oGXcPh/8/jD2ccOtn+st/PjnZFxp
	51fn7dlhShf1aCnWShgTW3CvByPkozmgL9x8qNYnWF7+YrQ7c0CaDUOwjdYKGyHeZkdj0JFtluPBF
	JByy7+OAw4PrIDLMbotOV5yp36TIXbx9Kksi20I89vquCQuOCrDGhdORyfDtpQxIGdWQycr3QPhBw
	6rF9EQSD4nwXckK23ULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubD2-00000003nrr-0kGP;
	Fri, 05 Sep 2025 18:30:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXSe-00000002Il9-2frg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 14:30:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80D56152B;
	Fri,  5 Sep 2025 07:30:33 -0700 (PDT)
Received: from [10.57.57.155] (unknown [10.57.57.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A3823F63F;
	Fri,  5 Sep 2025 07:30:39 -0700 (PDT)
Message-ID: <cc9b8e02-e287-40c8-ad9c-34efd5e5e3f6@arm.com>
Date: Fri, 5 Sep 2025 15:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] arm64: KASAN + KASLR may cause reserved page to be released
 during module loading
To: =?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <6065525d47bf338646d53182b9bbc4a25ccfda82.camel@mediatek.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <6065525d47bf338646d53182b9bbc4a25ccfda82.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_073044_767566_1537E5BF 
X-CRM114-Status: GOOD (  23.55  )
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
Cc: =?UTF-8?B?QW5kcmV3IFlhbmcgKOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>, =?UTF-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>, "andreyknvl@google.com" <andreyknvl@google.com>, =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= <chinwen.chang@mediatek.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>, "dvyukov@google.com" <dvyukov@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 04/08/2025 15:03, Qun-wei Lin (林群崴) wrote:
> Hi,
>   
> We have encountered a kernel panic on arm64 when loading modules with
> both KASAN and KASLR enabled.
>   
> Kernel version:
> 6.12
> (also reproducible on 6.6-based Android common kernel)
>   
> Config:
> CONFIG_KASAN=y
> CONFIG_KASAN_GENERIC=y
> CONFIG_KASAN_VMALLOC=y
> CONFIG_RANDOMIZE_BASE=y
> # CONFIG_RANDOMIZE_MODULE_REGION_FULL is not set
>   
> Reproducible:
> ~50% of the time, when loading any module with Generic KASAN + KASLR
> enabled.
>   
> The kernel panic log is as follows:
> [...]
> Comm:kworker/4:1 Tainted: G          OE      6.12.23-android16-5-
> g1e57f0e5996f-4k #1 eee834a579887c0f97d696d30c786233f4fbfcdf
> [...]
>
> If I disable KASLR, the issue does not occur.
With the context provided I was not able to reproduce the issue
when testing defconfig + generic KASAN on the following kernels :
- v6.17-rc4
- v6.12.23 Upstream
- v6.12.23 Android[0]
- v6.12.23 Upstream, compiled with LLVM
- v6.12.23 Android[0], compiled with LLVM

(I tried to match the version that appears in your trace)

I tested on both QEMU/KVM and hardware (AMD Seattle), by loading
and unloading an out-of-tree kernel module repeatedly (an APFS driver[1]),
with no issues on either for all tested kernels.
>   
> We are not certain which specific patch introduced this issue, but we
> have confirmed that it does not occur on the Android common kernel 6.1
> The problem was first observed after upgrading to 6.6-based kernels.
>   
> Any suggestions or guidance would be appreciated.
> Thank you.
There's not much information to go off of here, my questions would be :
- Are you able to reproduce on an upstream kernel ?
   (Be it from kernel.org or a "base" Android kernel, like [0])
- Are you able to reproduce under publicly available emulators ?
- Are you able to reproduce with specific, public modules ?
   (Something available in Debian[2] for example)
- Which compiler and version are you using ?

It is a bit of work, I'm aware, but given I didn't manage to reproduce
the issue, it would be useful to have as much info on the context
so either we might be able to reproduce, or you might be able to
pinpoint the source on your side a bit better !

I have not seen any other reports since yours, nor did I see any patch/fix
that seemed relevant, so I don't have much more to suggest sadly ;
others might.
> Best Regards,
>   
>   
> 林群崴 (Qun-wei Lin)
> Qun-wei.Lin@mediatek.com
Thanks in advance,
Best regards
Ada


[0]: 
https://android.googlesource.com/kernel/common/+/refs/tags/android16-6.12-2025-06_r5
[1]: https://github.com/linux-apfs/linux-apfs-rw/
[2]: 
https://packages.debian.org/search?keywords=-dkms&searchon=names&suite=trixie&section=all


