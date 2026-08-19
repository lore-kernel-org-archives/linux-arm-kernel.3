Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15418C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnDyA5lNhxEr2hExHBcFf8Od/f09CgPhkMAEhgddduM=; b=wsYh5zEO9JpiFfAUIXgFFtzoGp
	TzG4Tvxy/j2fIscVzlIRVPaUndUKESnGYZKtrio1VXoO2TCGxLLxb3i43IZKP3IRYfEXQW0zZqdgB
	04p+pjGF3X4jVV2TYos41ybttmyvM/02L+TKd3+PBFbT083AUp8Egh00QAvVFuif1M1UYoBWqQ0Ew
	khIfMa0HdUH1LzxC3OIsQ6UZ5NeSdhSVBWS82EU23uIIa3ag3EcXbuKMOjUlskTiZhp2CJipqJG5W
	RPo/HaP4hFqke4TZ55bCMQq3D1VvLrNtOWYG185qGZnGqpF0nR0D1ZUI05cfUJnG6BChdZzyc249M
	aDGj6Bbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgXr-00000009tE1-3XBv;
	Wed, 19 Aug 2026 13:41:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgXp-00000009tDY-3Nuj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 13:41:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A702814BF;
	Wed, 19 Aug 2026 06:41:22 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67AB33F763;
	Wed, 19 Aug 2026 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787146886; bh=5zZhTKxCzKM4mOTcYyTygUsinMLtPISXJYiMB3dpemQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pm1ISSmUxwi6hQfB/vEfIpFGQITFK4bY2I5SUuTQlrnb/Mel5xpsYmWxDrYT67diI
	 IFg3h56TnXcrXw7IB5PrUI1pntS0CNdmpyGB9NkPAvB15n4H4CohGyldFleAyz9OhJ
	 B85n3+AOP/8vRpt74YuK/EqoLpjcd3yoFBJVykno=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 01/14] arm64/gcs: Ensure FGTs for EL1 GCS instructions are disabled
Date: Wed, 19 Aug 2026 14:41:13 +0100
Message-ID: <aoWyeTx8lYGfiwYc@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812-arm64-gcs-v19-1-9105afd828ac@kernel.org>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org> <20260812-arm64-gcs-v19-1-9105afd828ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_064129_893983_84DA3A52 
X-CRM114-Status: GOOD (  19.63  )
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

Hi Mark, 

I will try my best to review this series, but I am new to this subject and 
have just finished reading the Arm ARM chapter about this, so please be 
patient with questions that may sound dumb or things that I got wrong.

On Wed, Aug 12, 2026 at 08:12:00PM +0100, Mark Brown wrote:
> The initial EL2 setup for GCS did not include disabling of EL1 usage of
> GCS instructions, also disable these traps.
> 
> Fixes: ff5181d8a2a8 ("arm64/gcs: Provide basic EL2 setup to allow GCS usage at EL0 and EL1")
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
> +

In the Arm ARM M.c, D24.2.70, we have that by setting the above bits we 
will _not_ trap the following instructions to EL2:
- GCSPUSHX, 
- GCSPOPCX, 
- GCSPUSHM, 
- GCSSTR, 
- GCSSTTR (when PSTATE.UAO=1 or HCSR_EL2.{NV,NV1} = {1,1}.)

Which I understand to be the way of us saying that EL2 will not interfere 
on nor manage those instructions that let software change the entries of 
GCS. Is that correct?

As for the asm routine, x2 at this point have nBRBIALL and nBRBINJ already 
set, and will be loaded to SYS_HFGITR_EL2 in the next block of 
instructions.

Did I get it right? Is there any missing detail here?

Thanks!
Leo



