Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00ECC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrclR5eHcm2TU/EaTNY4/1l3SIRZxOp+S/9coQYeH6E=; b=Yr3e20KLQzPw+xfpWV4SMapH76
	cxsxAhvU9UXKLYhKC9vHMLCSQ687h85sjfATakr6j9UUyBmL1mQ9/1Os/kNos2QNzPV7aZAsUPdyd
	FRTA0kMeH/rop5oqW2gbdj4THt3PG25drgPOQ1uIxC8tdQc9e6xqQW5/EeR8UnuTVMRomR7lZZIQz
	RpqixxkmwlDCNFIskvpTo6kMnV+R1SUVFIzojSGkFkRDd2QnjESIgZtIKK8CiRl6kTdQNxnUDR8g5
	Mb98KrRofBscwAYwC8argbVXaGoaHnFcjpVo3AQBMR8ugVHIehMcSPz0ehaMrPVS2N/mMPIMeXiKM
	yJo+J2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoxb-000000033FE-186j;
	Mon, 07 Jul 2025 16:44:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoNt-00000002yeM-1Why
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:08:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78937168F;
	Mon,  7 Jul 2025 09:07:47 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3ADCC3F694;
	Mon,  7 Jul 2025 09:07:56 -0700 (PDT)
Date: Mon, 7 Jul 2025 17:07:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 02/22] arm64: Generate sign macro for sysreg Enums
Message-ID: <aGvw2YojY0vVX_QT@J2N7QTR9R3>
References: <20250626200459.1153955-1-coltonlewis@google.com>
 <20250626200459.1153955-3-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626200459.1153955-3-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090801_445572_51E56E33 
X-CRM114-Status: GOOD (  15.93  )
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

On Thu, Jun 26, 2025 at 08:04:38PM +0000, Colton Lewis wrote:
> There's no reason Enums shouldn't be equivalent to UnsignedEnums and
> explicitly specify they are unsigned. This will avoid the annoyance I
> had with HPMN0.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

I realise you've already agreed to drop this, so the below is mostly for
the sake of the archive.

We deliberately kept Enum separate from SignedEnum and UnsignedEnum as
there are enumerated ID fields which have no ordering, and are neither
signed nor unsigned (e.g. CTR_EL0.L1Ip).

That was discussed previously at:

  https://lore.kernel.org/all/Y5MrVC3d8MPhvshE@FVFF77S0Q05N/

We could consider adding a comment to that effect in gen-sysreg.awk, but
that needn't be part of this series.

Mark.

> ---
>  arch/arm64/tools/gen-sysreg.awk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index f2a1732cb1f6..fa21a632d9b7 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -308,6 +308,7 @@ $1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields
>  	parse_bitdef(reg, field, $2)
>  
>  	define_field(reg, field, msb, lsb)
> +	define_field_sign(reg, field, "false")
>  
>  	next
>  }
> -- 
> 2.50.0.727.gbf7dc18ff4-goog
> 

