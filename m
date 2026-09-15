Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B02C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2HKRhrJ55digPYq7AePVt7WyLHVMk/+bC4x2ZeUNm4=; b=Aes8JmgmGbs5klHQiPsZgeq3ua
	cplyX2xy0vdGB3UoO3SjAtuDFBK53P6ehDPMB7Ic9yYvThrwwDWMFm0zApW0KEEOKJoYcb5gEN21v
	tTNw88rndKV1ilGsv8Cb3vsJ0RxkJI25KM2c4VIcVmxB+7GI9Lf1zpR0TOoU4DDNopmcYFsJk3fS+
	SX1fWaOmDEctRG4nVQfxr/ERMtazTZdT+duAAJ1LuXJTVX8wzrGxp6Dza/6qGf8JSgQFy4mPldLyl
	Iv38Ig/T6urQ8i8SKvMVgqm790IeI0hQNI2Oyi0zNuyRnKYLZpLqmC+NPnadswVr9BwfwPzGL7bnP
	nqPjRixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RCx-000000065kH-2GPg;
	Tue, 15 Sep 2026 11:20:15 +0000
Received: from out-76.mta0.migadu.com ([2001:41d0:1004:224b::4c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RCu-000000065jc-1bkD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:20:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=JtD89L1dx4UJ/DydTrhuEnA2LjRpfNnvhSqmPT7Ris0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789471208; v=1; x=1790076008;
 b=aO0TnelfvJmfwdS8NEX99j5f40QySXBFjGtNEoGmsEnhtKri/eQgBvIhW8vwKeCVwZqO8Hej
 ocwHZ2FMt3GxwarJ6H/Dpo5B5dLtlOIpGkeP5y4mCHu9V/16L6VvZQEe8t4QCe1ERLAIfuWZyuW
 PXLUse5CMr+D683Y/WN+TyK0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d4581301ddd93c10;
	Tue, 15 Sep 2026 11:20:08 +0000
X-Mizu-Trace-ID: d4581301ddd93c10
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so4656e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:20:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwprFqkZ2DF7qJWp1EEbnuOyFHK97YFJYX75WpB2/P6v94Gt9DuN9Rv+zl5l8t4yPcWQ0x3mBkDtui6n7yg1Jm1@lists.infradead.org
X-Gm-Message-State: AFuF++me9RseE3o8A5e4Cdx3Y7HMUnXFfIbqp/aNQtK3v+ifMCl51qoE
	5T8wcjrE5LjDLENcH79O9eD63XYDMKMSEnbKRVWBZ1CzPTufKC5uP/TG74nUTwAuN2KUgi1/i/R
	kYr1ksSqw8yHH86gh6TlctBV8dOBE716hUp5aNR0l
X-Received: by 2002:a05:6512:3f01:b0:5b4:9dba:4ecd with SMTP id
 2adb3069b0e04-5b8b320b1e7mr115483e87.11.1789471202368; Tue, 15 Sep 2026
 04:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-13-fuad.tabba@linux.dev>
 <8633vc6jag.wl-maz@kernel.org> <CA+EHjTy6F9tG=eRLMuykc12P-Oc2pjMoQqAz34iGR+Q5GzV2jQ@mail.gmail.com>
 <86y0d26ale.wl-maz@kernel.org>
In-Reply-To: <86y0d26ale.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 12:19:26 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzJzL420JOcFCnnPQAM1oFJ0dTKHxjBDr45CZasAxzhHw@mail.gmail.com>
X-Gm-Features: AcwNN1W6ZAFjFHfA3IpEcZtftsyHh3ZzGb-8lmwznnDmxio05774SB6E7nfAk7E
Message-ID: <CA+EHjTzJzL420JOcFCnnPQAM1oFJ0dTKHxjBDr45CZasAxzhHw@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] KVM: arm64: Prevent host PC adjustments for
 protected vCPUs
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_042013_347317_39BA9BCE 
X-CRM114-Status: GOOD (  16.13  )
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

On Tue, 15 Sept 2026 at 12:02, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 14 Sep 2026 15:43:16 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > > > +   hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> > > > +   if (!hyp_vcpu || hyp_vcpu->host_vcpu != vcpu)
> > >
> > > Under which circumstances do we get hyp_vcpu->host_vcpu != vcpu?
> >
> > When EL2 calls __kvm_adjust_pc() on the hyp vCPU itself:
> > __kvm_vcpu_run() at guest entry and inject_sync64() in nvhe/sys_regs.c
> > both pass &hyp_vcpu->vcpu. There the vCPU passed is the one to adjust,
> > so it's returned as is.
>
> If this is the sole case, why not check for '&hyp_cpu->vcpu == vcpu'
> instead of this odd inequality?

That's the only case. The inequality is the same test as in
__get_host_hyp_vcpus(), but &hyp_vcpu->vcpu == vcpu is clearer here.
I'll change it if there's a v4, or feel free to fold it in if you're
applying v3 as is.

Cheers,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

