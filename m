Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DD4C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq2MSbg8uowd0cp7hGubDTrXjjRg2sj0R+N70jk1ffs=; b=Cft6VrjFZuhyPdLwnzbb/rud5r
	IvP7HRKV5CNUVMYSQoZ9QqFQfrGTVSi6w+Y5QM34Xm5P+W7svNPOhnI1B58sXxbbkW7Dn6hyOzsF4
	maysxDJxXRyRpk5rmkmx4AVjV7FWETjv3XiwWCJT5iJwiefcva7bRW6Vlt8IYBDbQpY4Oqajzjv29
	6DbBQds6vxi9lKUHq3mHciXrhFvTT/OkE3wAZfOI04/3RHN/dwZalGZhIYYLm/dVLBoO8l92qJO/P
	bfaXRxncNxQgtYKDhI7hpvmzJrh4BUzuZ02r93W3hbIJ97QifOoInas1uG4Ks/NobrLTyynSPZ/ZV
	qGdwp4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg81N-00000007QIX-3x6p;
	Thu, 06 Feb 2025 19:58:45 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg800-00000007Q4m-2P69
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 19:57:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id BEC3E43A93;
	Thu,  6 Feb 2025 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738871838;
	bh=E+lU6r2Gicb6SJrSYXFHxoENYWrJPQXqghLrsfBIZ0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NCRCOX62cpd8AaeYgG4rxET2H1BdW5ASoApszzfwGbbwxcAi8JWEtWH7VKPS0yNrU
	 KFiGoOBJTGUiBY398SaWyKoOkkxLQKgcKB++A5vdRnKurYaFamwfuqDeD4Li0V7/BD
	 ZFbnXCZIVstHri09WyTDk3rsvei3iqp3Wv88gFpTjboT5hk1QReVygK8DNbS1rAE5e
	 ZVYOfzgP+exVnyyAMksacexFZh5ai5B5OIZuRLE+1hNKKzMmVYnbjvHmFUsKLTJapX
	 sqeFezTN1APVg2wUKlFuAfP0pLwgdEGNsgDxRLidt+apRNe3K3Tef2DzbQ48tGi6XJ
	 h0XYECuYgyX9w==
Message-ID: <2f4728be-3a0d-4bc3-ab11-6b1e2e3fbc6e@asahilina.net>
Date: Fri, 7 Feb 2025 04:57:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
To: Dan Williams <dan.j.williams@intel.com>, Vivek Goyal <vgoyal@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Sergio Lopez Pascual <slp@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 alison.schofield@intel.com, zhang.lyra@gmail.com,
 gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
 jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
 linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>,
 German Maglione <gmaglione@redhat.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com>
 <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
 <A1E3C5B2-CCD8-41BA-BBC8-E8338C18D485@asahilina.net>
 <67a5111b2f805_2d2c29448@dwillia2-xfh.jf.intel.com.notmuch>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <67a5111b2f805_2d2c29448@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_115720_764856_B69F28B3 
X-CRM114-Status: GOOD (  24.10  )
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

On 2/7/25 4:44 AM, Dan Williams wrote:
> Asahi Lina wrote:
>> Hi,
>>
>> On February 6, 2025 1:10:15 AM GMT+01:00, Dan Williams <dan.j.williams@intel.com> wrote:
>>> Vivek Goyal wrote:
>>>> On Fri, Jan 10, 2025 at 05:00:29PM +1100, Alistair Popple wrote:
>>>>> FS DAX requires file systems to call into the DAX layout prior to unlinking
>>>>> inodes to ensure there is no ongoing DMA or other remote access to the
>>>>> direct mapped page. The fuse file system implements
>>>>> fuse_dax_break_layouts() to do this which includes a comment indicating
>>>>> that passing dmap_end == 0 leads to unmapping of the whole file.
>>>>>
>>>>> However this is not true - passing dmap_end == 0 will not unmap anything
>>>>> before dmap_start, and further more dax_layout_busy_page_range() will not
>>>>> scan any of the range to see if there maybe ongoing DMA access to the
>>>>> range. Fix this by passing -1 for dmap_end to fuse_dax_break_layouts()
>>>>> which will invalidate the entire file range to
>>>>> dax_layout_busy_page_range().
>>>>
>>>> Hi Alistair,
>>>>
>>>> Thanks for fixing DAX related issues for virtiofs. I am wondering how are
>>>> you testing DAX with virtiofs. AFAIK, we don't have DAX support in Rust
>>>> virtiofsd. C version of virtiofsd used to have out of the tree patches
>>>> for DAX. But C version got deprecated long time ago.
>>>>
>>>> Do you have another implementation of virtiofsd somewhere else which
>>>> supports DAX and allows for testing DAX related changes?
>>>
>>> I have personally never seen a virtiofs-dax test. It sounds like you are
>>> saying we can deprecate that support if there are no longer any users.
>>> Or, do you expect that C-virtiofsd is alive in the ecosystem?
>>
>> I accidentally replied offlist, but I wanted to mention that libkrun
>> supports DAX and we use it in muvm. It's a critical part of x11bridge
>> functionality, since it uses DAX to share X11 shm fences between X11
>> clients in the VM and the XWayland server on the host, which only
>> works if the mmaps are coherent.
> 
> Ah, good to hear. It would be lovely to integrate an muvm smoketest
> somewhere in https://github.com/pmem/ndctl/tree/main/test so that we
> have early warning on potential breakage.

I think you'll probably want a smoke test using libkrun directly, since
muvm is quite application-specific. It's really easy to write a quick C
file to call into libkrun and spin up a VM.

If it's supposed to test an arbitrary kernel though, I'm not sure what
the test setup would look like. You'd need to run it on a host (whose
kernel is mostly irrelevant) and then use libkrun to spin up a VM with a
guest, which then runs the test. libkrun normally uses a bundled kernel
though (shipped as libkrunfw), we'd need to add an API to specify an
external kernel binary I guess?

I'm happy to help with that, but I'll need to know a bit more about the
intended usage first. I *think* most of the scaffolding for running
arbitrary kernels is already planned, since there was some talk of
running the host kernel as the guest kernel, so this wouldn't add much
work on top of that.

I definitely have a few tests in mind if we do put this together, since
I know of one or two things that are definitely broken in DAX upstream
right now (which I *think* this series fixes but I never got around to
testing it...).

Cc: slp for libkrun.

~~ Lina


