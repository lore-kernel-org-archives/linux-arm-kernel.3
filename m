Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C447CF58DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 20:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpm3Sc+vEKGSwdzJ2+Uswh2Yc2rS/v0VLt+r4g++xXc=; b=OeS5L+EiJ4WRbeWWk7lR2YwhHF
	UsGMBnrAyWSIVbKFT7IgzjZVobkn0yuKwL79oiUmJrJznQwMGmDvSAqeW5p8pnbBoh5fCY1AxgTB+
	rV84UN9TP+In/VenDbXFXE9jnSbAl3kZG989EApG7gdJ16FZd5RWYT9r+iHj3UQ06XtwKmo/+ykHb
	9Ovjm8F4p/pc8t4GIj7hLMmM7shxh0PjHYpIE12eeCD8KvfIZ7Raof0XQlxrR65T/wQx9JNnVvyv/
	q8sJB4JXucGpQBoAB6vap8HBCuTmW1E0XzJQEM2v+Nvs7QkjRSjIjPmGuooxiXeVPplPpGp+s/7Cg
	FGJ9xWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoUn-00000005LoP-0iZl;
	Wed, 19 Nov 2025 20:09:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoUj-00000005Lme-3BUn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 20:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDEE441925;
	Wed, 19 Nov 2025 20:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E56FC4CEF5;
	Wed, 19 Nov 2025 20:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763582976;
	bh=csXQ3jv13Hi+tC+RGEzfEY46Xaln+wONRM6RuW7E20A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTBWEzXTmeFGO55QIT6oupbvwDwUpgggVtpGnikSt82tZ2nUOKHkuqA3ISmqF8QcX
	 vYisBqwiuz0WEfjy6s/svnZWZTOzUOmXS5I53X6xI7LfO3Kd5OwCqa5lBFWPqDHE/3
	 cF/gdhvxAGXV04Xp4R5s4p8BFc0hkg6PrfY0NOqRrVOJ7jkPyorf0T4Bo36Ku4IxYD
	 Q4zVn5oBCcEYEA/Wld0ndgUyD0t2MTMR+uHwpKH58o0qxCE2jxoA0aIjzZUpluHPa9
	 yU23imw726vr3wqMMhrFFNOH3BlGeY+jDGVij9zix9bukjQ3LzjPpdgd1wVSBSvZlO
	 cdoSbAlY/iZ0A==
Date: Wed, 19 Nov 2025 12:09:34 -0800
From: Drew Fustini <fustini@kernel.org>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com,
	amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com, catalin.marinas@arm.com,
	dakr@kernel.org, dave.martin@arm.com, david@redhat.com,
	dfustini@baylibre.com, fenghuay@nvidia.com,
	gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
	jeremy.linton@arm.com, kobak@nvidia.com, lcherian@marvell.com,
	lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org, peternewman@google.com,
	quic_jiles@quicinc.com, rafael@kernel.org, robh@kernel.org,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
Subject: Re: [PATCH 00/33] arm_mpam: Add basic mpam driver
Message-ID: <aR4j/pbRLQYdeA+K@x1>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <aRoG+UptQg9mix+7@x1>
 <753f4d26-efa9-4ffd-a820-7c2a53c0bc5f@arm.com>
 <aRz5S/gnT9mhqN+7@x1>
 <20251119100051.000018a0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119100051.000018a0@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_120938_105849_742959AE 
X-CRM114-Status: GOOD (  29.53  )
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

On Wed, Nov 19, 2025 at 10:00:51AM +0000, Jonathan Cameron wrote:
> On Tue, 18 Nov 2025 14:55:07 -0800
> Drew Fustini <fustini@kernel.org> wrote:
> 
> > On Tue, Nov 18, 2025 at 02:11:31PM +0000, Ben Horgan wrote:
> > > Hi Drew,
> > > 
> > > On 11/16/25 17:16, Drew Fustini wrote:  
> > > > On Fri, Nov 07, 2025 at 12:34:17PM +0000, Ben Horgan wrote:  
> > > >> Hi all,  
> > > > [snip]  
> > > >> The rest of the driver can be found here: (no updated version - based on v3)
> > > >> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc1  
> > > > 
> > > > Does anyone know of a hosting platform that offers ARM machines that
> > > > have MPAM?  
> > > 
> > > As far as I know there aren't any.
> > > 
> > > There is some MPAM support in the Orion Radxa board which is likely the
> > > cheapest option. The MPAM acpi table isn't in the firmware though so
> > > you'd need to load a custom table. James has this working.  
> > 
> > Thank you, I didn't realize that there was a dev board that supports
> > MPAM. I didn't want to the expense or noise of a rackable server :)
> > 
> > Drew
> > 
> Hi Drew,
> 
> Obvious not functional as such, but I did spin qemu emulation with a bunch
> of introspection so you could see what was configured.  Aim was to poke
> corner cases more easily than with real hardware. Did it's job at the time
> and shook out some bugs.
> 
> I haven't rebased it recently though.
> https://lore.kernel.org/qemu-devel/20230808115713.2613-1-Jonathan.Cameron@huawei.com/
> 
> https://gitlab.com/jic23/qemu/-/commits/mpam-2023-sept-01
> Has what looks to be a slightly more recent rebase.
> 
> No monitor support though.
> 
> I might bring this back to poke the rest of this series as it moves forwards
> (or if anyone else wants to they are welcome to do so)
> 
> FWIW we could in theory hook this up to the cache plugins to get some 'plausible'
> numbers, but I never bothered as we have hardware (as seen by tested-by's on this
> series).
> 
> Jonathan

Thanks for pointing out your series and the branch from James. Qemu is
the cheapest way for me to try MPAM :)

Drew

