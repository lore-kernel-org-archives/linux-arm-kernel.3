Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF5ACD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kt/R47ljFtXKjvDnaRU6NP+f6fE38A3zOWjh39B6kR0=; b=b4+Wlor84Od+RkolRrRuMvbma9
	GxhyqovLVQZfxtgl5WaCbW8btC7SZT67Aijto3GJwSNm/A18F/Fh4Clf5ccxy8kQ4dUVoJwWQZ/XG
	JL49HIpqBFB8GfROE3uY+RQrMxhoe9q+VP+bomKjy7keBMnDFzm+TVpBQeOgNg3IKjk0DixNLQw8L
	14fgHgI8MnzJ/0LGgGi8NSJVw3EV4U3a9HKMByHsJGk2hzpar7iiUJLdXiKqqyNt3zZnav8209Qbi
	rqWmALq5TypaAChoyq87cLXfUTM5ctZ10YULRlPXFFv41ntz3WYgNfGykwhNYwPVI3b9rxzTjtrvQ
	xeRJAGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOkJ-000000075km-3ApK;
	Fri, 08 May 2026 17:12:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOkH-000000075jm-2ZKT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:12:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 342B8152B;
	Fri,  8 May 2026 10:12:07 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB5373F836;
	Fri,  8 May 2026 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778260332; bh=EsTFf7qnfgE+DcO+/SX3IscCKG+dFx0MhM0eybb1Br0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBWwwRz6a7nQ+hxFzW7BK5GC6EHeiTMOdrBs3x9Zf5HTznIGt5K+jW1zVvoJHdbDf
	 GHGt2GY6xACd/0ZcKFbLVIVzwtYMQBc8CCkJF4lqxpcJadMZQzJeBdhVyTKl0C0v8I
	 0fUH7k+0aNuGeZVlRsbF/WzGoxbSJyITngBWIpRk=
Date: Fri, 8 May 2026 18:12:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601
 2025-06
Message-ID: <af4ZYVFsbYlEfdOu@J2N7QTR9R3>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-1-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-1-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_101213_747650_0792FA8B 
X-CRM114-Status: GOOD (  15.95  )
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

On Fri, Mar 06, 2026 at 05:00:53PM +0000, Mark Brown wrote:
> Update the definition of SMIDR_EL1 in the sysreg definition to reflect the
> information in DD0601 2025-06. This includes somewhat more generic ways of
> describing the sharing of SMCUs, more information on supported priorities
> and provides additional resolution for describing affinity groups.

FWIW, these are all in ARM DDI 0487 M.b:

  https://developer.arm.com/documentation/ddi0487/mb/

Is anything later in the series going to depend on these fields, or
would everything behave correctly with the existing RES0 field
definitions?

> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/tools/sysreg | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 9d1c21108057..b6586accf344 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3655,11 +3655,15 @@ Field	3:0	BS
>  EndSysreg
>  
>  Sysreg	SMIDR_EL1	3	1	0	0	6
> -Res0	63:32
> +Res0	63:60
> +Field	59:56	NSMC
> +Field	55:52	HIP

Reading the ARM ARM, HIP is arguably a backwards-incompatible change.

Do we expect to expose that to VMs, or just hide priorities entirely? I
suspect we probably want to require that the guest sees
SMIDR_EL1.SMPS==0, and not care about any of that.

Mark.

> +Field	51:32	AFFINITY2
>  Field	31:24	IMPLEMENTER
>  Field	23:16	REVISION
>  Field	15	SMPS
> -Res0	14:12
> +Field	14:13	SH
> +Res0	12
>  Field	11:0	AFFINITY
>  EndSysreg
>  
> 
> -- 
> 2.47.3
> 

