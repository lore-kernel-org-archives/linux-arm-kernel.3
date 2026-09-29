Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A39CCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CtiIpsiRXfJAhu98r5ychaQNiLmkEZ5yO8R3IEUIT4=; b=bPRcgutTL7Nhgk85H+gOrxQiAZ
	Y4BckCBds9hR9XaHSu98vXfNTmUow72M9Ga/Q4syKTQzEEW0KEmjmGTJcul9mlS9GBoSKqEUph0cz
	g3TdqrhwClwTjf9xOxyDaf6+qud/uzNkcB+WmpihvZ04VjjxSLgYWWe2NpbCrwCnbjpIIS2In1qS7
	M+zmTx//wqpdIyuAsOTo1khTQoI1uuuZX6ngIJM5OVu5cKNg4/Cd7tZrWOFDu4ejI9yoz+hAnnLbH
	1EMTZV0B26Axo7TVDpScOkPpGaGwpADZuP7a2xuF3jCY6e5o9pVcBQa42RJIqHnUCeacZjw7as8Nm
	aDoP2mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZDw-00000003qbO-0Crj;
	Tue, 29 Sep 2026 14:54:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZDv-00000003qbD-0XLn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7CtiIpsiRXfJAhu98r5ychaQNiLmkEZ5yO8R3IEUIT4=; b=nTcp9YOSJtm4UCOe2X7V+L/Vvl
	afUnHBK1MIQfkLb0pfsRxSglgBhSCHW3WMJjAlkzZprbx/BpDYHWJ7ajt9GPW1/iZ9SCZ3xOrYUA7
	96JVXCosWjAT5qvwQi4YQuEaG3URmjOVN+ntOd0HIsvFpIMeL9OaIIZC/7nyw4sEFu0EJbFGF6kvi
	BydLT8QyF9fa6usexOkWicP027gquHi+2TEQSxHeYhlXgoq4gZ4mhaRg2xyg0xrzVdbgwdeu2nnwa
	dTjpTeiTCQpxrY0DZ+dcxOhbIWKWPDwgh6VhmT1LkAFl4qDsYKddZuyzsBSwwMfpEg4VZ0YYGn1oo
	j1W0AlVw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBZDr-00000002l98-0qaN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:54:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AFA61516;
	Tue, 29 Sep 2026 07:54:16 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E16CE3F86F;
	Tue, 29 Sep 2026 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790693659; bh=esoyENbZ44GNKmeZsIgGCCMJABdw5rCYrI7Eyyadykg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usQQfmYlajLnTt3wS3Cpwl1JJlsmTCBvkV00hc0gHLiKtTq9D21EFhHZpHrol63Sw
	 ezI/oqCtiJZ8fufONKeFniRYVyI4Ec4TQisPUmWTJIa8uZ0Wo5croexuMueCHlBgA8
	 inet1daapOv/NeaB2yMOTurFhSXlLm+d5NL/+PXE=
Date: Tue, 29 Sep 2026 15:54:05 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>, Fuad Tabba <tabba@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] KVM: arm64: Apply the fine-grained UNDEFs without
 FEAT_FGT
Message-ID: <lfkiqqw72uqjih442pozc3gsydxwmdj3kacgl7c2572kxzx3sf@vivqilohtwqn>
References: <20260929090031.3829185-1-fuad.tabba@linux.dev>
 <20260929090031.3829185-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929090031.3829185-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_155423_667673_95F91073 
X-CRM114-Status: GOOD (  24.78  )
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

On Tue, Sep 29, 2026 at 10:00:28AM +0100, Fuad Tabba wrote:
> triage_sysreg_trap() applies the FGU bits through the encoding's FGT
> entry in the trap xarray, and populate_nv_trap_config() only adds those
> entries on a CPU with FEAT_FGT. Without it, a hidden feature that still
> traps reaches its handler instead: a TLBI OS trapped through
> HCR_EL2.TTLBOS lands in handle_tlbi_el1(), which expects an EL1 TLBI
> only from vEL2 and WARNs before the guest gets its UNDEF. A VMM can
> trigger the WARN by hiding TLBI OS and having the guest execute one.
> 
> kvm_calculate_traps() computes the FGU bits with or without FEAT_FGT,
> and the entries map an encoding to its FGT bit whatever the CPU
> implements. Add them unconditionally, so that a hidden feature that
> traps is UNDEFINED on any CPU.

This reads a bit mechanical to me, can I suggest:

```
FGUs don't actually require hardware support, so don't gate fgt trap
config insertion on FGT. This is the only action required to allow FGUs
always, as kvm_calculate_traps() already computes the FGU bits with or
without FEAT_FGT.

This also fixes a spurious WARN when a TLBI OS is run on a guest in vEL1
without FEAT_TLBIOS on non FEAT_FGT hardware. In this configuration the
course-grained HCR_EL2.TTLBOS trap reaches the handler handle_tlbi_el1(),
which expects an EL1 TLBI only from vEL2. With FGUs enabled the UNDEF
will be injected without needing the specific handler.
```

Other than that, this is very nice! Sorry for missing this. It's way
better to have FGU regardless of FGT and handle unexposed TLBIOS with
FGU always. Thanks Oliver for suggesting this instead, and thanks Fuad
for digging in.

Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>

Thanks,
Wei-Lin Chang

> 
> Fixes: f5a5a406b4b8b ("KVM: arm64: Propagate and handle Fine-Grained UNDEF bits")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

> ---
> 
> Notes:
>     For a nested guest on a CPU without FGT, check_fgt_bit() now runs too,
>     but it forwards nothing: a guest without FEAT_FGT has its FGT registers
>     RES0.
>     
>     f5a5a406b4b8b added the FGU check to triage_sysreg_trap() behind an
>     ARM64_HAS_FGT gate that populate_nv_trap_config() already had, so the
>     check never fired without FGT.
> 
>  arch/arm64/kvm/emulate-nested.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 625604019fb32..b8529532b6e78 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2386,9 +2386,6 @@ int __init populate_nv_trap_config(void)
>  				print_nv_trap_error(fgt, "FGT bit is reserved", ret);
>  			}
>  
> -			if (!cpus_have_final_cap(ARM64_HAS_FGT))
> -				continue;
> -
>  			prev = xa_store(&sr_forward_xa, enc,
>  					xa_mk_value(tc.val), GFP_KERNEL);
>  
> -- 
> 2.39.5
> 

