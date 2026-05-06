Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C049FCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 05:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwSmyMibPpckv2HK2SNJzhT8JDQqQqNhy40Vtm5GpMI=; b=Xnz9+LGmrX9nJTSY7B1LFFW6/Z
	F/0zej4bNxj+XrPL83cFq4vzzjrOl/CyefCpMw46PmtVjS0nNVbMW3YjkPTcw4kv59Qnxq8Yycr2K
	gbRo/N3rq7efGGtYU15MmsrwjtQyysFflg1gXlds9Wg3c70+eL7gwh9YjJpssMZKCCIs+1lXHPMOW
	n4mAq1AHj0/zoPOv5jphERiZXZyveGUB9FoGrsB1zO6GflRYH2quUiHJXJvUfXgDvYDR5kwPgeWsY
	Au+Guzuawyl9A880SpSwAummt4D1QoK8e4ZuAz8eq8TsndKysr/kR5kyeamxzjVHB0l36sFcbMkJC
	3Cx9f66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKVDZ-00000000prs-2Mzp;
	Wed, 06 May 2026 05:54:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKVDW-00000000prN-087k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 05:54:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A28319F6;
	Tue,  5 May 2026 22:54:34 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7374B3F7B4;
	Tue,  5 May 2026 22:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778046880; bh=n19EvKj9ct8WooqEGIU96Ez3cJ1oH3gc14hD5umAenU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W+4eIhwbn7rw9HtfloGyopJGPMzUByUeKixAFz193Mkz0xdeDphTN4xqLf04XWs8O
	 aWhpj6LNS6pMGe8aY82wj8s1kG/NGvejLFdkoFCHmnhilJR7EFC+e87JStoIqu7GTX
	 Hftc6y/Jcm6wqu70VK1DoNZmB6V+3c4g8pmNicO0=
Date: Wed, 6 May 2026 06:54:33 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: David Safford <david.safford@gmail.com>,
	Jonathan McDowell <noodles@earth.li>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com
Subject: Re: [PATCH] ima: debugging late_initcall_sync measurements
Message-ID: <afrXmRiq7XvSe6yN@e129823.arm.com>
References: <cover.1777036497.git.noodles@meta.com>
 <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
 <afMlgstqahnZg68h@e129823.arm.com>
 <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
 <CAGWfHUW+AX0Hpuw5Vr5iTSaJKQJ+O_4nWWmU1UR8Z_3XFctHZg@mail.gmail.com>
 <202f90682fe47bb5fb9b08f8678ae00981b5290b.camel@linux.ibm.com>
 <201b9172ac47c6766443c1f2343cab3548f33c29.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201b9172ac47c6766443c1f2343cab3548f33c29.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_225442_257992_4BEF6128 
X-CRM114-Status: GOOD (  25.58  )
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

Hi Mimi,

> On Sun, 2026-05-03 at 07:36 -0400, Mimi Zohar wrote:
> > On Fri, 2026-05-01 at 12:52 -0400, David Safford wrote:
> > > On Thu, Apr 30, 2026 at 5:43 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
> > > > 
> > > > On Thu, 2026-04-30 at 10:48 +0100, Yeoreum Yun wrote:
> > > > > With above change I confirmed there is no meaurement log
> > > > > between boot_aggregate and boot_aggregate_late except "kernel_version"
> > > > > But this is ignorable since this UTS measurement is done in
> > > > > "ima_init_core() (old: ima_init())" and it is part of ima initialisation.
> > > > > 
> > > > > 1. ima_policy=tcb
> > > > > 
> > > > >   # cat /sys/kernel/security/ima/ascii_runtime_measurements
> > > > >   10 0adefe762c149c7cec19da62f0da1297fcfbffff ima-ng sha256:0000000000000000000000000000000000000000000000000000000000000000 boot_aggregate
> > > > >   10 4e5d73ebadfd8f850cb93ce4de755ba148a9a7d5 ima-ng sha256:0000000000000000000000000000000000000000000000000000000000000000 boot_aggregate_late
> > > > >   10 7c23cc970eceec906f7a41bc2fbde770d7092209 ima-ng sha256:72ade6ae3d35cfe5ede7a77b1c0ed1d1782a899445fdcb219c0e994a084a70d5 /bin/busybox
> > > snip
> > > > > 
> > > > > 2. ima_policy=critical_data
> > > > > 
> > > > >   # cat /sys/kernel/security/ima/ascii_runtime_measurements
> > > > >   10 0adefe762c149c7cec19da62f0da1297fcfbffff ima-ng sha256:0000000000000000000000000000000000000000000000000000000000000000 boot_aggregate
> > > > >   10 49ab61dd97ea2f759edcb6c6a3387ac67f0aa576 ima-buf sha256:0c907aab3261194f16b0c2a422a82f145bc9b9ecb8fdb633fa43e3e5379f0af2 kernel_version 372e312e302d7263312b // Ignorable since it's generated by ima_init(_core)().
> > > > >   10 4e5d73ebadfd8f850cb93ce4de755ba148a9a7d5 ima-ng sha256:0000000000000000000000000000000000000000000000000000000000000000 boot_aggregate_late
> > > > > 
> > > > > Therefore, init_ima() could move into late_initcall_sync like v1 did:
> > > > >   - https://lore.kernel.org/all/20260417175759.3191279-2-yeoreum.yun@arm.com/
> > > > 
> > > > Thanks, Yeoreum.  It's a bit premature to claim it's "safe" to move the
> > > > initcall.  Hopefully others will respond.
> > > > 
> > > > Mimi
> > > 
> > > I have also run with this patch on a number of bare metal and virtual machines,
> > > running everything from default Fedora 44 to a version with everything turned on
> > > (uefi secure boot, UKI with sdboot stub measurements, IMA measurement
> > > and appraisal enabled,
> > > all systemd measurements on, and systemd using the TPM for root
> > > partition decryption.)
> > > I too see only the kernel_version event between the normal and late
> > > calls, if ima_policy=critical_data.
> > 
> > Thanks, Dave!  Were all the systems you tested x86_64?  The next step would be
> > to test on different arch's (e.g. Z, Power).
> 
> On both Z and PowerVM, there are ~30 measurements between boot_aggregate and
> boot_aggregate_late.  For example, on PowerVM:
> 
> # grep -n boot_aggregate
> /sys/kernel/security/integrity/ima/ascii_runtime_measurements
> 
> 1:10 f60a05d7354fb34aabc02965216abd3428ea52bb ima-sig
> sha256:9887dd089ee19a6517bca10580b02c1bb9aa6cd86c157b6ead8a1c0403f348d5
> boot_aggregate 
> 31:10 e2592b0d61da6300d3db447b143897a9792231ea ima-sig
> sha256:9887dd089ee19a6517bca10580b02c1bb9aa6cd86c157b6ead8a1c0403f348d5
> boot_aggregate_late
> 
> It would be interesting to the results from a Raspberry Pi 5 as well,
> with/without a TPM.

Honestly, I find this result hard to accept.

This effectively means that there is code invoking IMA measurement during late_initcall().
It also implies that if, in the future, a late_initcall is added that performs
an IMA measurement before IMA initialization has occurred accoding to order by linker,
that measurement could be missed.

Could you please check how the index (1, 31) was added to either
ima_template_entry or ima_queue_entry to produce this result?

-- 
Sincerely,
Yeoreum Yun

