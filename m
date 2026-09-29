Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6072BCA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6kGHt+rjMSbZ2WQycq15hKyUq5QbTI2t6Ebniifuo8=; b=ojRyqr9etO93INvULovWLMLr3p
	hO+1+gYDSvCmsSqTW6vJXdg2bXTBIg/f9/pZGWSUGPXLAz1zkhsEZ7WaPkl7xHuORxGeFCh1PyR1O
	HdlJSy9YEWQ5K40ZXtAGUWUyI0gtyWkoLKWknwgOHu76X6r2lD7H/lMrpG0pvQa+CvjxJ/lQwCxkk
	KM8e1Qqco5YomKOTf3OJjAQc2tLmTMiXgfbLJIQWT/mNb7VJft/SlVmvirLhUrbzxmkSnlDSqnxUJ
	b+LGnJQRVmQfwoN5Hg/YmasjDb3e2agzAbH7ZkaSc8bJ57g2vGJEyw5Blai/vkqRm6Le6P67xE9ru
	fsUtQRvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaLM-000000040eo-2Nrl;
	Tue, 29 Sep 2026 16:06:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaLJ-000000040eF-3wu0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:06:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43111516;
	Tue, 29 Sep 2026 09:06:03 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DE0C3F85F;
	Tue, 29 Sep 2026 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790697967; bh=KqR996YT3lGlgif4zL+59hQfQW1sI1ucMoPzwCnhQbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCUKssRQD3SNhMXewWGC7g/l/UBx4ZbOS96rk2Y7SqhScQQmZ/CocIylzMLBjS5LI
	 ftUKijR81omCwPfFRk5FNqmsIZ34IYz9SUzzn7W8n8hNCu5lNMzPRGTxuSpBCWvQVk
	 myZ0/VFE4FAA0JUkQp6c02f8bqePWNT/VLgcSVfI=
Date: Tue, 29 Sep 2026 17:06:02 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Sami Mujawar <Sami.Mujawar@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Dan Williams <djbw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	Steven Price <Steven.Price@arm.com>,
	"gshan@redhat.com" <gshan@redhat.com>,
	Yeoreum Yun <YeoReum.Yun@arm.com>,
	"cedric.xing@intel.com" <cedric.xing@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <arvh6uGzue9yat9n@e129823.arm.com>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
 <20260414133525.GA2577880@ziepe.ca>
 <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>
 <20260422124041.GJ3611611@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422124041.GJ3611611@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_090610_118492_C6AD8CEE 
X-CRM114-Status: GOOD (  19.66  )
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

Hi Jason,

> On Wed, Apr 22, 2026 at 08:57:00AM +0000, Sami Mujawar wrote:
> 
> > > So this is tying it to the same FW event log that TPM uses.
> > > 
> > > I think that strengthens my point this should all be uninform. TPM
> > > drivers are directly exposing the event log today, but I guess that
> > > needs generalization if non-TPM drivers are going to present it as
> > > well.
> > > 
> > > How do you imagine getting and manipulating the EFI event log to use
> > > with this?
> >
> > The event logs from UEFI will be handed off to the OS using CCEL
> > ACPI table. The CCEL table spec update can be seen at
> > https://github.com/tianocore/edk2/issues/11384
> 
> I ment from linux userspace. event log is well establihsed in the aCPI
> side for TPM and in Linux today it is only exposed to userspace
> through TPM.
> 
> This is not TPM, so how do you intend to give the event log to
> userspace?

The event log would be exported via /sys/firmware/acpi/tables/data/CCEL
with binary format just as TPM event log is also exported with binary
format via binary_bios_measurements.

Instead of Sami, I'll post v2 which rebased on for-next/smccc-bus in
arm64 tree.

Thanks.

-- 
Sincerely,
Yeoreum Yun

