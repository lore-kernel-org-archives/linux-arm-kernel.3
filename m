Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D286FE9A026
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzMITkEXZs34lceKZ1bkvJdV8jpP8i6Cd6H1ke9i4qg=; b=1l3AIivbuFwDeRVeWCVEiOAbL7
	FrgLYgGmMtxLImWnAi3GzphAmA7VDet2lgehkPEHeNThY8S0fPsDrDPHgLIAqlgk9yVYtGrlbCOkX
	dMt9oLL6inTkLKi0ozz5Lll7gKewELbyN7gEF9CYrhBqs1sPpV2RXeyRXdt4uv4G0qb7NI3LqueMS
	o6laBzLiMOPPE5xjqVcK8zCN3PU6lrEebfuUSXXWOqwGZA9LrfRqevgCwdL4qagg3tCjiM0DeUqL9
	7AzddWCQow4+AA8iJUigjs5cvOWovAby+QbDsvOQh4S3ypr9h0aeiVbQz9/hYt2+i9CwrIRWjmzf1
	hMlHkPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPAz-00000008fhY-2YSO;
	Tue, 17 Feb 2026 17:47:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPAv-00000008fgd-2gKV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:47:56 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso446043b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771350471; x=1771955271; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NzMITkEXZs34lceKZ1bkvJdV8jpP8i6Cd6H1ke9i4qg=;
        b=xWsf4VgWclrjIWlkz/8y6esYI+UssVaP7O/EbKxxJYYzv5egAby/K4TcU018HdYpel
         BH4EgR6nHt2ngZ85Gb1cChrMSkthUksOusUqVmlw9p+4d8nnVjmORvO3LJTMafsJrg87
         J02EdB6hMa/Ki9DUbrD1n25ws/0Jj8csas49BP3omNb4hiJXGDyAzzwpPufCc0coOnzE
         KOAJyxTpdfXowZwDA1CPghv2yzSvVrlSlWyDTfmFTQB1UtHtsDVFpc06pNfgzAxecBYl
         z1cq/L/R+aw6FPMB98kyZz0A7bB+WVbCKLJtkYftk4nizR5SBPuStlSR8osPnNgZPDgO
         8n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771350471; x=1771955271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzMITkEXZs34lceKZ1bkvJdV8jpP8i6Cd6H1ke9i4qg=;
        b=D7zXwX2JvqD6VLc0oqwJ+KwoGW3AGQtex+zJTAPXIZnF744zvNeqtrKsgiDxrDYOca
         U4yVAr2ZfdU4lnMZtglwYKFwatJLOFE81XNH3Vr7neA2fS3CFuDdcRH+3VGJqyGKK3GC
         VSNMbTzOjUd/LVqtq7T70sKi5PYadqt5jKN0I/Z46xCh6mtaSpl8fzsWcIGIpoSEGJwv
         KbcbYYWsKne7X4USqcvmny1D+0GI2m+mGXbzq2SLMFOJSLYQjhqsm9MUXcsTgy8BeanC
         wSYTNk3PQ+L5K+ybYHyYiYkzcF15wuMsw1s/WJCB76n1fDBCXEoQ+kB2oFlGFWWkivCh
         Oy4A==
X-Forwarded-Encrypted: i=1; AJvYcCUDtjbiRhByeUnSB34nVLuAXz+KUA5tDBJiPtvPvocyUgG+kq4RBgjYOILuXN/7p7PiJmHWHTWYRM0xi/1w3hNe@lists.infradead.org
X-Gm-Message-State: AOJu0Yww+LY7IHPxiMuQE2GdwxiFJ+qtv0QITIkt73syctl2NctExa40
	Idwpvy4x/REm1ZBQPoVW/FlLmG0NQ3NBTM+M3Qv78nBbZ3zA9FVM+yKsmd4t6XBPinc=
X-Gm-Gg: AZuq6aIEGQGT2LGneH3NwyBOI56P5l7cM8OtpBsSWVXlh9DTAMUG5AfyO/xWpPQbdn5
	BYn+5uQi6Q/f0VNhi5dsfhdR6fpxIgKGDqCcOv5JFlzcMh2/xac8D9r94HMBHskm+eEJe8HC8Jj
	gofDzSEc/cA3NMXl7pnEvUmurCDpT2sY+hcSILcxTCVOkE9NSMNOBc27bOPB7beEzfv06KeWCw6
	9oBjdMtR+r3ejp66Tes/bZ4kwLfzp5UraxrXgJBSmoqZFN9kCgK9QLll/WrnBgPkiySKc5F6ZGl
	DaSsqJtviqLv3rQxEX5/5MVUVDyVaNyfY+GFMSemgkuL7tesym5fD/cLn+tONDBYhUyeNxedE/a
	udtFVmklsmVLR5zFh1tP9rhsC8DSKZCfrjw2b3ARKzR+F+N8pHYAC8HlSWzNLxqYl49nc0s+BaO
	TOaxucVqPO7Fm9LBvSn1GOqAOumQ==
X-Received: by 2002:a05:6a21:4916:b0:38b:ebdd:919f with SMTP id adf61e73a8af0-394671145b5mr13583057637.1.1771350471095;
        Tue, 17 Feb 2026 09:47:51 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:970a:754:4a36:44d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5331ba14sm10310210a12.29.2026.02.17.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 09:47:50 -0800 (PST)
Date: Tue, 17 Feb 2026 10:47:46 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v12 00/46] arm64: Support for Arm CCA in KVM
Message-ID: <aZSpwlZmpjdh3Oxr@p14s>
References: <20251217101125.91098-1-steven.price@arm.com>
 <aY4Sf4lMlWd9LyTo@p14s>
 <55fc4877-666c-4d5f-a167-5692f7cfbd0b@arm.com>
 <9140efaa-dc54-4a1b-8936-3ef876ca9121@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9140efaa-dc54-4a1b-8936-3ef876ca9121@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_094754_978537_C2B13A0B 
X-CRM114-Status: GOOD (  47.24  )
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

On Mon, Feb 16, 2026 at 02:27:02PM +0000, Steven Price wrote:
> On 16/02/2026 12:33, Steven Price wrote:
> > On 12/02/2026 17:48, Mathieu Poirier wrote:
> >> Hi Steven,
> >>
> >> On Wed, Dec 17, 2025 at 10:10:37AM +0000, Steven Price wrote:
> >>> This series adds support for running protected VMs using KVM under the
> >>> Arm Confidential Compute Architecture (CCA). I've changed the uAPI
> >>> following feedback from Marc.
> >>>
> >>> The main change is that rather than providing a multiplex CAP and
> >>> expecting the VMM to drive the different stages of realm construction,
> >>> there's now just a minimal interface and KVM performs the necessary
> >>> operations when needed.
> >>>
> >>> This series is lightly tested and is meant as a demonstration of the new
> >>> uAPI. There are a number of (known) rough corners in the implementation
> >>> that I haven't dealt with properly.
> >>>
> >>> In particular please note that this series is still targetting RMM v1.0.
> >>> There is an alpha quality version of RMM v2.0 available[1]. Feedback was
> >>> that there are a number of blockers for merging with RMM v1.0 and so I
> >>> expect to rework this series to support RMM v2.0 before it is merged.
> >>> That will necessarily involve reworking the implementation.
> >>>
> >>> Specifically I'm expecting improvements in:
> >>>
> >>>  * GIC handling - passing state in registers, and allowing the host to
> >>>    fully emulate the GIC by allowing trap bits to be set.
> >>>
> >>>  * PMU handling - again providing flexibility to the host's emulation.
> >>>
> >>>  * Page size/granule size mismatch. RMM v1.0 defines the granule as 4k,
> >>>    RMM v2.0 provide the option for the host to change the granule size.
> >>>    The intention is that Linux would simply set the granule size equal
> >>>    to its page size which will significantly simplify the management of
> >>>    granules.
> >>>
> >>>  * Some performance improvement from the use of range-based map/unmap
> >>>    RMI calls.
> >>>
> >>> This series is based on v6.19-rc1. It is also available as a git
> >>> repository:
> >>>
> >>> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v12
> >>>
> >>> Work in progress changes for kvmtool are available from the git
> >>> repository below:
> >>>
> >>> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v10
> >>
> >> The first thing to note is that branch cca/v10 does not compile due to function
> >> realm_configure_parameters() not being called anywhere.  Marking the function as
> >> [[maybe_unused]] solved the problem on my side.
> > 
> > This is in the kvmtool code - and yes I agree "work in progress" is a
> > bit generous for the current state of that code, "horrid ugly hacks to
> > get things working" is probably more accurate ;)
> > 
> > The issue here is that the two things that realm_configure_parameters()
> > set up (hash algorithm and RPV) are currently unsupported with the Linux
> > changes, but will need to be reintroduced in the future. So the contents
> > of the functions which set this up (using the old uAPI) are just #if 0'd
> > out.
> > 
> > Depending on the compile flags the code will compile with a warning, but
> > using __attribute__((unused)) would at least make this clear. I'd want
> > to avoid the "[[maybe_unused]]" as it's not used elsewhere in the code
> > base and limits compatibility.
> > 
> >> Using the FVP emulator, booting a Realm that includes EDK2 in its boot stack
> >> worked.  If EDK2 is not part of the boot stack and a kernel is booted directly
> >> from lkvm, mounting the initrd fails.  Looking into this issue further, I see
> >> that from a Realm kernel's perspective, the content of the initrd is either
> >> encrypted or has been trampled on.  
> > 
> > I can reproduce that, a quick fix is to change INITRD_ALIGN:
> > 
> > #define INITRD_ALIGN	SZ_64K
> > 
> > But the code was meant to be able to deal with an unaligned initrd -
> > I'll see if I can figure out what's going wrong.
> 
> Looks like a simple bug in kvm_arm_realm_populate_ram() - it wasn't
> updating the source address when it had to align the start of the
> region. Simple fix below:
> 
> ---8<---
> diff --git a/arm/aarch64/realm.c b/arm/aarch64/realm.c
> --- a/arm/aarch64/realm.c
> +++ b/arm/aarch64/realm.c
> @@ -104,7 +104,7 @@ void kvm_arm_realm_populate_ram(struct kvm *kvm,
> unsigned long start,
> 
>         new_region->start = ALIGN_DOWN(start, SZ_64K);
>         new_region->file_end = ALIGN(start + size, SZ_64K);
> -       new_region->source = source;
> +       new_region->source = source - (start - new_region->start);

That also worked on my side.

> 
>         list_add_tail(&new_region->list, &realm_ram_regions);
>  }
> ---8<---
> 
> Thanks for the pointer, and I'll try to remember to include initrd
> testing in future.
> 

Very well.

Thanks for looking into this.

> Steve
> 

