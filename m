Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B271DC982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBT//NqDVVXGbJM1T+2QSDiCmKDmjP32Ioei8Y+RF5c=; b=f383zno98pb7XZwQgWbBV/Kj8r
	/VFDpP9rT3WQNICkzENlVaK/uUSe2KfSXXvirf5sbVrW9ptPAEvWBGedzzKrHmdUlQueFn8fJ+Js5
	B24V+hEaTB/9tQYAzkvD7JBUZ5Q6yzsQ3bLxd1NHIhns1WNFlMMSikarFuX9eWCwqjipRomvuo/6K
	1K+IOpVOgG8W4g9EJOKxJI9PCIecimHW1AfNkzyfCtsxnud0GqzT/rfkjcZll24CIcmOxW7Mqx3h0
	70hwxJ/Aqw1cMPsxCUI29nRSFMIwVYQydQae++n33IvqizCF9Fy08KlHZPQDx5Sfrdq/5iji30ROd
	p5faSEuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UgZ-0000000Dubt-2khb;
	Fri, 18 Sep 2026 09:15:11 +0000
Received: from out-224.mta0.migadu.com ([2001:41d0:1004:224b::e0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UgW-0000000DubI-21Ee
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:15:10 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=D0PKzZhQRsxn3gOcYMwqRGpkhs/bU2h6lOLFmUyfZXg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789722906; v=1; x=1790327706;
 b=IT7X68xthK4cHyMcGAcZoJqVS18jbHnD2WuQORe8IWt3yZ8kvyqcGhouZoZC9od/rNTYZW+0
 jZieaJ7ZGhqqHCOi3Xm6owEGfG8F3Jiu8yNZiY/l2Z0nmcgcIvMwAW6aC8awOFq+XdSv09KbHRr
 g6yiLfJz2ULfwC1F9wwRvuiA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3613b5c1be753a2a;
	Fri, 18 Sep 2026 09:15:06 +0000
X-Mizu-Trace-ID: 3613b5c1be753a2a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso5330e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0WvwHafAJg8ZnErXEVrmEG3CCaCnlI4DQ6G9EyvSLnLoXlGzBJmE1Vlu8b+pgxxNVjVVeAJ2+fX/g+vEiyaM8@lists.infradead.org
X-Gm-Message-State: AFuF++m9ol7UKXLs/YbhAVIvjNuod208EJ/gENuS0N70YfI9tGFhyYaX
	DJerQgJnDhZJRC3taEeDlpwEXfWjTmQa46Yl6Ev21QS5tm5rs1MnDrr0c3rEl73lb9hLoMcGwzO
	wIxp3UL9k4B6Dm0SWOeDV2gZe4a58N/v+eMW0ygf9
X-Received: by 2002:a05:6512:a96:b0:5b4:9dba:7401 with SMTP id
 2adb3069b0e04-5b8c17f53eemr77720e87.11.1789722900983; Fri, 18 Sep 2026
 02:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
 <20260915160141.3543048-6-suzuki.poulose@arm.com> <CA+EHjTz65G0MM=tOrzmk=jMweBX1us6FqfrmSkQs4KSyAEoxhg@mail.gmail.com>
 <e26cbb4e-84e2-4fcc-9eb0-93bfd4aff4a7@arm.com>
In-Reply-To: <e26cbb4e-84e2-4fcc-9eb0-93bfd4aff4a7@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 18 Sep 2026 10:14:24 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw6TOSEs1GtUcUy9WACpGRJBA9yTn9Ro_+tiD=XkeHr4g@mail.gmail.com>
X-Gm-Features: AcwNN1WAyYZFMS1tYTqzPWruuztc5hWFyoH3hZA9fEYOfU0jxVOmsQMTpwP1D70
Message-ID: <CA+EHjTw6TOSEs1GtUcUy9WACpGRJBA9yTn9Ro_+tiD=XkeHr4g@mail.gmail.com>
Subject: Re: [PATCH v18 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021508_683258_308C4673 
X-CRM114-Status: GOOD (  12.92  )
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

Hi Suzuki,

On <date>, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
[...]
> +       if (WARN_ON_ONCE(!kvm))
> +               return false;
> +
> +       /* Cover both pKVM host and Realm VMs */
> +       if (!kvm_vm_hyp_is_distrusting(kvm))
> +               return true;

I'd drop the WARN_ON_ONCE. And this early return needs the `>=` from
patch 13, or non-protected pKVM VMs skip the filter.

> I resorted to is_protected_kvm_enabled() to make it faster than using
> the vm_flavor checks. I could rever those anyways.

Agreed it's the faster test. I'd just call it by name at the three
sites rather than through a macro.

> Do you mean something like :
>
>         if (kvm_vm_is_protected_pkvm(host_kvm))
>                 hyp_vm->kvm.arch.vm_flavor = VM_PROTECTED_PKVM;
>         else
>                 hyp_vm->kvm.arch.vm_flavor = VM_PKVM;

Yes, exactly that.

> Do we additionally need to WARN_ON() if we encounter a VM_REALM ?

No, the host shouldn't be able to trigger a WARN at EL2.

> Apologies, I thought this one didn't change, but later patches changes
> them, which is why I kept this.

No worries. With those two in, please keep the tag.

Cheers,
/fuad

