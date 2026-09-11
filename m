Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A86EC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qx8sOrSNiRpwWj+wYfNgXp2QREdlhzBDEHsErPLaQrs=; b=JDX+LKnAuyHUjOwkplA/7sfm1z
	XoUlB3J9dfXRA416yxggfy9zNuJ+UeujFCHJmdSIIaR9TLEi2ik07XGapDC36wxBIXJbGyML90SK2
	SPzAB0R7Z2l2Gw3BWPgmV5CAbqDMUD3MnhOAEQdNYX95qA+0bTkBB+GiCkdjFoLxHUggz3agy6Sw0
	iosQH6uuDuA3XEyheyIEMbz+2w0f/LFqO01EC2T4vuR5SS4oxBnhFx8bsQhu49RJOsSZf0Jw/Pabo
	H0cKPG3J1JW8KlhXMRMu5HE6qZZTMAveDL3qpUJejvbKUjt7mXKXzICYwRKwH8xuge/MfPAk8kAaE
	XzuNfQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50yS-0000000GiHE-2Fth;
	Fri, 11 Sep 2026 13:07:24 +0000
Received: from out-221.mta0.migadu.com ([2001:41d0:1004:224b::dd] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50yQ-0000000GiGk-1MmF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:07:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8pvJVApeDyZ7aiv6BhbctxA5gKGIAQr+fiE6OB4oxLk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789132039; v=1; x=1789736839;
 b=s5Ew8JLFNWqNsHkNoN+ttR2dZaCNFweBiYfXVEFrBxOlT0knocVNDyj25iuuV+iJ25xNeTS5
 gYjcKJGtPJ8RmCp92ddDZPZpcAqfK1rrk9gezktYuzQg1c2tRwoFxQ6RjvYYwpJzqDmSZzIm1l+
 67VTonrIciON977gHhX9IOqE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5392d6de4bacd9f9;
	Fri, 11 Sep 2026 13:07:19 +0000
X-Mizu-Trace-ID: 5392d6de4bacd9f9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so4826e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxa/eaqebeYCaphTld8284mlK142XAcqSGajueXucU4cKwTLBrUHiSaBuv13xqe5b18XnL6XbvGiN0gztehLhG3@lists.infradead.org
X-Gm-Message-State: AFuF++npuoTWMlnFpSG5qs2kV9bIcAxG5o1KYOkSx/2p0M4KaHWTcrpr
	1gHscqZtZpBHSGtREiLDh2aSyiinYkAu5kAht6VOcg17K+t9aN/3V4JqEC0R3fj3+bN0rCog6qE
	vbEHbYolmXBuTsKWwjAt/4zrJzKgNrcwj8zRjSA/S
X-Received: by 2002:a05:6512:2352:b0:5a4:ec:53d9 with SMTP id
 2adb3069b0e04-5b8a0e9870dmr120141e87.1.1789132033997; Fri, 11 Sep 2026
 06:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-6-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-6-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 11 Sep 2026 14:06:37 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxjF3bFyGPdZTjG2eaSGDn8qgkMn6mnpvR4DpNdmTo2hA@mail.gmail.com>
X-Gm-Features: AcwNN1VrR2kYv2q8ZGCNc3rU7zWSpDHiv9N7fjGK0s-HcxCvjzx3fnURhDkVi2o
Message-ID: <CA+EHjTxjF3bFyGPdZTjG2eaSGDn8qgkMn6mnpvR4DpNdmTo2hA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] KVM: Parse the device tree and register the ITS
 region with pKVM
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	smostafa@google.com, tglx@kernel.org, vdonnefort@google.com, 
	vladimir.murzin@arm.com, yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_060722_501527_EC896126 
X-CRM114-Status: GOOD (  21.16  )
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

Hi Seb,

On Fri, 7 Aug 2026 at 17:43, Sebastian Ene <sebastianene@google.com> wrote:
...
> +static int __init register_its_emulated_region(void)
> +{
> +       struct device_node *np;
> +       struct resource res;
> +       int i = 0;
> +       int ret;
> +
> +       for_each_compatible_node(np, NULL, "arm,gic-v3-its") {
> +               ret = of_address_to_resource(np, 0, &res);
> +               if (ret)
> +                       goto out_fail;

its_of_probe() also requires of_device_is_available() and
msi-controller, and its_init() goes to its_acpi_probe() when the
fwnode isn't an OF node.

So a disabled node has its region taken from the host here, and on
ACPI nothing matches at all: num_protected_reg stays 0, this returns
0, and pKVM finalises with the ITS unmediated. The two DT checks are
plain property queries, so they work this early. What's the intent for
ACPI?

> +
> +               if (i >= PKVM_PROTECTED_REGS_NUM) {
> +                       kvm_err("Out of protected region slots\n");
> +                       ret = -ENOSPC;
> +                       goto out_fail;
> +               }

Tested after of_address_to_resource(), so a bad resource on the ninth
node comes back as that error rather than -ENOSPC. Could the bound
come first?

> +               /*
> +                * Note: don't unmap the entire animal from the host because devices need
> +                * to be able to access GITS_TRANSLATER to raise MSIs. If the
> +                * page where GITS_TRANSLATER is given to HYP, devices won't be
> +                * able to map it in their IOMMU when the IOMMU is managed by
> +                * pKVM.
> +                */
> +               kvm_nvhe_sym(pkvm_protected_regs)[i].pfn = PHYS_PFN(res.start);
> +               kvm_nvhe_sym(pkvm_protected_regs)[i].cb =
> +                       lm_alias(&kvm_nvhe_sym(its_emulate_forward_req));
> +               kvm_nvhe_sym(pkvm_protected_regs)[i].nr_pages =
> +                       PFN_DOWN(min_t(u64, resource_size(&res), PAGE_ALIGN_DOWN(GITS_TRANSLATER)));

I don't think the ITS likes to be called an animal :P, and the next
sentence is missing a word after "If the page where GITS_TRANSLATER
is".

nr_pages is 0 for a resource smaller than a page. Could that be rejected?

> +
> +               i++;
> +       }
> +
> +       kvm_nvhe_sym(num_protected_reg) = i;
> +       return 0;
> +out_fail:

num_protected_reg is set on the success path only, so out_fail leaves
it disagreeing with the entries already written. Inert today, but
could the failure path zero it?

Cheers,
/fuad

> +       of_node_put(np);
> +       return ret;
> +}
> +
>  void __init kvm_hyp_reserve(void)
>  {
>         u64 hyp_mem_pages = 0;
> @@ -57,6 +103,12 @@ void __init kvm_hyp_reserve(void)
>                 return;
>         }
>
> +       ret = register_its_emulated_region();
> +       if (ret) {
> +               kvm_err("Failed to register ITS region %d\n", ret);
> +               return;
> +       }
> +
>         hyp_mem_pages += hyp_s1_pgtable_pages();
>         hyp_mem_pages += host_s2_pgtable_pages();
>         hyp_mem_pages += hyp_vm_table_pages();
> --
> 2.55.0.654.g21b8a5bc05-goog
>

