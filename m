Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9ADC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DPgleNV1mcmkYCtomqFOVp2FJYHws+GGArnvOsd8h8=; b=Wt3DDwzMoUL6HQ/1X9tVUB6PRq
	Wz/ZHEUzh2fiynUehNJLdh1NdCPa48YU5ZiDDSWg/FNxTtlH+epGdqX824XGpuVBWy7CBajQhpwma
	v8vzg9JxYnF1DDDY1E0orPkIYrTZljRJ/XQ/9vAqPSr5oH+Ty1J7UkV5CkO+O18lthKWSSQ2BEALI
	gUIqKsTNT03xFl0cqOQZFAlU0dCl7A/zejrEUappGuS4GzOSM7L2zeoNjQXX2qmTbL3v2S9rKmEc5
	ooU6iAmVWd/+M1/cIgEKkiz3eAgD3rsqTScwYKIqYh35zFikmY+gQi3dxiICBrJWuZ230CJpqZFfM
	yPRAJ4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kgc-0000000EkuZ-09pV;
	Wed, 02 Sep 2026 13:07:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kga-0000000EkuI-1Lhg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 13:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8DPgleNV1mcmkYCtomqFOVp2FJYHws+GGArnvOsd8h8=; b=cKOQnU1jqH6Zhs9mwtejIhhAwx
	ytmie12nOQ81Y1Z/nlmh7VV+un4PHdh2ScYZIHY+dr5xiWAoRyfZo3Fue4yzF7YacEDRxSSp7a4zh
	TmVw/sfTLw6H4nMpx9m/cilSoUBhfohVIwAptBqcaEFQFmbQcukpDPse+0K2sSqBE1knfCFo7wG6e
	iqaT6hJggK9Zam78TfYmjuckkS11MExlYkaPSeLqqyXxuWsPXUwfKIM44haE4ScBYCAtqTG10/MyG
	Gn7WeNqQ1ubFUFYVknhVnAE16jM1Vb2hFlktNNUN2EgJDkUpng/KP2KjDc8/wcY51xpCdNcuhcFxU
	geMZp7hw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1kgW-0000000C1Cw-0dba
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:07:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81ADE165C;
	Wed,  2 Sep 2026 06:07:17 -0700 (PDT)
Received: from [10.1.34.165] (e121487-lin.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F4B63F85F;
	Wed,  2 Sep 2026 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788354441; bh=+t9sN4LSyRGw93rnNyg1v4R/ipYdpl7x/UgrrcH7gJ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pUh63RT4V/KPBB2O88F3YMOGtx1JdWvSj/QqmaJhB2Dh1R0LEM2yxJgti11F4tlKD
	 VjyoK1EM1DGgjvYFEW2m4OcN165RFcHiXm/tdxOC3doeLbPfpm9+hdC9RHqRnXJ03e
	 dVsghQvw8nk6GylnkSTuazEKzneEDBg0Swpideho=
Message-ID: <5058854b-6e68-44b2-b4f7-6e2f666c4caf@arm.com>
Date: Wed, 2 Sep 2026 14:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: hibernate: pass HVC_SET_VECTORS args to the resume
 hvc
To: Will Deacon <will@kernel.org>
Cc: Bradley Morgan <include@grrlz.net>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maz@kernel.org, james.morse@arm.com
References: <20260809213615.11646-1-include@grrlz.net>
 <anr28wUlKjci8JPn@willie-the-truck>
 <463DA5C2-C933-45EC-A200-21AAF6258418@grrlz.net>
 <anszjQ7jBeYDqesp@willie-the-truck>
 <7ca33f92-2ded-4749-ab67-2fb564919b99@arm.com>
 <aoxl1ri43eEAsxlR@willie-the-truck>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <aoxl1ri43eEAsxlR@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_140725_318794_2E8AFAF1 
X-CRM114-Status: GOOD (  28.83  )
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

Hi Will,

On 8/24/26 16:40, Will Deacon wrote:
> Hi Vladimir,
> 
> On Mon, Aug 17, 2026 at 02:06:20PM +0100, Vladimir Murzin wrote:
>> On 8/11/26 15:37, Will Deacon wrote:
>>> I think I probably need to spend some time understanding how all this is
>>> supposed to work. I can't currently tell how we end up with the stub
>>> vectors installed to start with nor why we can't do all this from C code.
> I finally got back to this...
> 
>> Here is my understanding of how things work. Assuming nVHE mode, we
>> restore the previously saved image X from the currently running kernel Y.
>> I’ll use the suffixes _X and _Y for addresses belonging to the respective
>> images.
> Nice, thanks for the walkthrough!
> 
>> On the resume path, KVM teardown sets VBAR_EL2 to __hyp_stub_vectors_Y.
>>
>> swsusp_arch_resume() then temporarily (re)sets VBAR_EL2 to trans_pgd_stub_vectors
>> while transitioning to image X:
>>
>> |        if (el2_reset_needed())
>> |                __hyp_set_vectors(el2_vectors);
>>
>>
>> Currently, swsusp_arch_suspend_exit() attempts to restore VBAR_EL2 to
>> __hyp_stub_vectors_X:
>>
>>
>> |       cbz     x24, 3f         /* Do we need to re-initialise EL2? */
>> |       hvc     #0
>>
>> where x24 is resume_hdr.__hyp_stub_vectors (in other words snapshot of
>> __hyp_stub_vectors from image X)
>>
>> However, that request is ignored, so VBAR_EL2 remains pointing to
>> trans_pgd_stub_vectors
>>
>> We re-enter the kernel X.
>>
>> During KVM initialisation, we call __hyp_reset_vectors(). This is
>> handled by trans_pgd_stub_vectors, but ignored since HVC_RESET_VECTORS
>> is not recognised. We then call __hyp_set_vectors(), which is also
>> handled by trans_pgd_stub_vectors, but this time VBAR_EL2 get set to
>> __kvm_hyp_init_X.
>>
>> From that point on, __kvm_hyp_init_X handles subsequent HVC calls,
>> including the later call that redirects VBAR_EL2 to
>> __kvm_hyp_host_vector_X during KVM setup.
>>
>> The memory containing trans_pgd_stub_vectors is freed later by
>> swsusp_free(). That perhaps explains why we do not see any crash.
> I was trying to figure out if we end up initialising VBAR_EL2 before we
> "return" from swsusp_arch_suspend() and free the reserved pages.
> However, it looks like we run _cpu_resume() instead of cpu_resume() so
> I still can't tell why this hasn't exploded. AFAICT, the active hyp
> vectors will have been freed (and possibly poisoned) long before KVM
> initialises.
> 

My apologies. I managed to confuse myself (but hopefully not you) with the
order of operations. Indeed, swsups_free() happens *before* KVM initialisation
which eventually happens later via syscore_resume().

I can now reproduce the problem with CONFIG_PAGE_POISONING=y and page_poison=on

# swapon /dev/vdb
[   55.330849] Adding 2097148k swap on /dev/vdb.  Priority:-1 extents:1 across:2097148k 
# echo test_resume > /sys/power/disk
# echo disk > /sys/power/state
[   62.534444] PM: hibernation: hibernation entry
[   62.578411] Filesystems sync: 0.021 seconds
[   62.579550] Freezing user space processes
[   62.585909] Freezing user space processes completed (elapsed 0.005 seconds)
[   62.586835] OOM killer disabled.
[   62.588332] Freezing remaining freezable tasks
[   62.591318] Freezing remaining freezable tasks completed (elapsed 0.002 seconds)
[   62.593983] PM: hibernation: Preallocating image memory
[   62.972326] PM: hibernation: Allocated 25745 pages for snapshot
[   62.973119] PM: hibernation: Allocated 102980 kbytes in 0.37 seconds (278.32 MB/s)
[   63.011607] Disabling non-boot CPUs ...
[   63.021633] virtio_blk virtio0: 1/0/0 default/read/poll queues
[   63.025486] virtio_blk virtio3: 1/0/0 default/read/poll queues
[   63.035080] hibernate: Hibernating on CPU 0 [mpidr:0x0]
[   63.039859] PM: Using 1 thread(s) for lzo compression
[   63.040459] PM: Compressing and saving image data (23314 pages)...
[   63.041558] PM: Image saving progress:   0%
[   63.247947] PM: Image saving progress:  10%
[   63.455279] PM: Image saving progress:  20%
[   63.619264] PM: Image saving progress:  30%
[   63.785097] PM: Image saving progress:  40%
[   63.924669] PM: Image saving progress:  50%
[   64.018580] PM: Image saving progress:  60%
[   64.116893] PM: Image saving progress:  70%
[   64.286410] PM: Image saving progress:  80%
[   64.490785] PM: Image saving progress:  90%
[   64.618506] PM: Image saving progress: 100%
[   64.621388] PM: hibernation: Wrote 93256 kbytes in 1.58 seconds (59.02 MB/s)
[   64.622108] PM: Image size after compression: 32298 kbytes
[   64.622702] PM: Image saving done
[   64.624592] PM: S|
[   64.777608] PM: Using 1 thread(s) for lzo decompression
[   64.778448] PM: Loading and decompressing image data (23314 pages)...
[   64.779237] hibernate: Hibernated on CPU 0 [mpidr:0x0]
[   64.877435] PM: Image loading progress:   0%
[   65.172066] PM: Image loading progress:  10%
[   65.273214] PM: Image loading progress:  20%
[   65.345142] PM: Image loading progress:  30%
[   65.454007] PM: Image loading progress:  40%
[   65.521889] PM: Image loading progress:  50%
[   65.595804] PM: Image loading progress:  60%
[   65.659942] PM: Image loading progress:  70%
[   65.720256] PM: Image loading progress:  80%
[   65.788729] PM: Image loading progress:  90%
[   65.851162] PM: Image loading progress: 100%
[   65.852057] PM: Image loading done
[   65.853050] PM: hibernation: Read 93256 kbytes in 1.07 seconds (87.15 MB/s)
[   65.900987] Disabling non-boot CPUs ...
[   63.012805] hibernate: Restored 0 MTE pages
[   63.012805] PM: hibernation: free pages cleared after restore

... hang here ...

GDB shows that we are executing code that looks like it came from the poisoned page.

Program received signal SIGINT, Interrupt.
0x000000004d158000 in ?? ()
1: x/i $pc
=> 0x4d158000:  orn     x10, x21, x10, asr #42

With the patch applied I do not see hang anymore so you can add

Tested-by: Vladimir Murzin <vladimir.murzin@arm.com>


> Speaking off-list to Mark R, he pointed me at some old rework he had for
> all of this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
> 
> one of the patches there is very similar (identical?) to this one, but
> his series gets us to a point where we _do_ resume at cpu_resume() and,
> tbh, the whole thing ends up making a lot more sense.
> 
> If somebody could dust off that two-year old (!) stack, that would be
> great.
> 
> Will
> 


