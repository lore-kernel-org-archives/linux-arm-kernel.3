Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9A2C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBXLV/aReRggToYPyghrVtwl5A0a39umqxSD8Pkwnbo=; b=jmpC4fYA8t4ylAnTy1uV7co7LD
	uUszrhkbGRCGf1BM7vVev4dVsH+xAOAgZisMssIuWVpSfkVw1h5dCnkcBwyk/Obd3Ob39AzBNzliO
	xv+WWe51ob08tYAO+LiWCa5hAKz3tW3CwlRJFBqWEwq96nfdl/Yb1KTV16R87yyEwM/RjvBAGKFAN
	7AIKDAcmCtnZQ9p/yHhGBbxVxyBHAFH2GOJ+BYFZysazihAsqB+FE4Y8eNqjyij8c00RH8YBsCCGe
	bpqsWi0yRRNSaNgrjK+xnPKcta2LegMK0VTxy5lpzHBXd6vHJuhdO/x+IDFJNz48xukBWzC7RrLlu
	Mpi4GsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2A1a-000000007vk-0uv0;
	Thu, 03 Sep 2026 16:10:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2A1Y-000000007vS-2KiJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:10:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8744560546;
	Thu,  3 Sep 2026 16:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F6E1F000E9;
	Thu,  3 Sep 2026 16:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788451847;
	bh=pBXLV/aReRggToYPyghrVtwl5A0a39umqxSD8Pkwnbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=La7gvet+3cgiB6ZHetPHOHJ/G5wn1zMPvJrFbrd1xKIBS1PvlfH2NKKWCxPKJKLTu
	 naHfridSE8ebRQpg3ZSoCaKPKQ+An6rV489cLxgBFuFKQuDclp1WSuGsx9ksS0gNzX
	 7LYGI++Oc5fp/g/htz2fhSsR/mWNMjIKCaC8lJAIJemJZ8ueF1IN4VxSCvtGZmk9XP
	 W2wykO/AkuGaCivJ0M6NpGiF3GgMDoLSZKtM8bFiXa5Tq5+PPAf8d8/pyRQ5nJfzmW
	 duFUjAY4dZm6V5YX+0kRFo72uUE6alj2NFxBMns5RskQBas+udohXUSmCpJ6PlxLTO
	 O3wsJZ1TK7saw==
Date: Thu, 3 Sep 2026 17:10:39 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 01/14] arm64/gcs: Ensure FGTs for EL1 GCS
 instructions are disabled
Message-ID: <apmXlJ3ScZ3-qlKV@gremlin>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-1-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-gcs-v20-1-f31750bdfadb@kernel.org>
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

On Tue, Sep 01, 2026 at 10:46:59PM +0100, Mark Brown wrote:
> The initial EL2 setup for GCS did not include disabling of EL1 usage of
> GCS instructions, also disable these traps.
>
> Fixes: ff5181d8a2a8 ("arm64/gcs: Provide basic EL2 setup to allow GCS usage at EL0 and EL1")
> Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/el2_setup.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index aa8ec9df8024..d308c6e6757d 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -393,6 +393,11 @@
>  	orr	x0, x0, #HFGRTR_EL2_nGCS_EL1_MASK
>  	orr	x0, x0, #HFGRTR_EL2_nGCS_EL0_MASK
>
> +	/* Disable traps of GCS instructions at EL1 */
> +	orr	x2, x2, #HFGITR_EL2_nGCSEPP_MASK
> +	orr	x2, x2, #HFGITR_EL2_nGCSSTR_EL1_MASK
> +	orr	x2, x2, #HFGITR_EL2_nGCSPUSHM_EL1_MASK

(Forgive me being verbose here I'm thinking my way through things :)

So this is effectively:

Set bits from these masks:

	HFGITR_EL2_nGCSEPP_MASK |
	HFGITR_EL2_nGCSSTR_EL1_MASK |
	HFGITR_EL2_nGCSPUSHM_EL1_MASK

Then (later instruction):

msr_s	SYS_HFGITR_EL2, x2

I.e. set the hypervisor fine-grained instruction register ([0]).

And I can see from that document that for each bit:

0b1
Execution of the specified instructions is not trapped by this mechanism.

So this correctly disables these instructions:

GCSPUSHX
GCSPOPCX
GCSSTR
GCSSTTR when PSTATE.UAO is 1
GCSSTTR when the Effective value of HCR_EL2.{NV, NV1} is {1, 1}
GCSPUSHM

And these are the only listed GCS sets of instructions there.

On that basis LGTM :)

So:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

[0]: https://support.arm.com/documentation/111107/2026-06/AArch64-Registers/HFGITR-EL2--Hypervisor-Fine-Grained-Instruction-Trap-Register


> +
>  .Lskip_gce_fgt_\@:
>
>  .Lset_fgt_\@:
>
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

