Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CDBC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6p8iO7qIlNYB17dWb1L+k0vK5mOVvV+F7rBw/fgo8OU=; b=RK+TRg/ZBHcXuK0zIJyZN85OBm
	5bfZQ9WdhZs1eBhMHyrAunOnBonvK+DjVxqhrEgAFSZISW5nDZQ+Lu8Z+7frPMIl/HryGLmwoktNg
	yyWstT+QLBp/k/xa6jO1hnR6DlnQNl2gXXp8bibcE8I9+K3xKGi2HAgrhPkjgqv96UFA8W8+71a3M
	QTifyCHMbGgZiI7YJT93YmCYhimu16AZ/pMkkuWLczwBItlps/sJafH9OBQMGbt7PRdPNoz6Ncbsz
	kBzc3OovvuCcDUws0x/MeDjxmVzI2oB27O91bU3LaBQPvJ6FY5W3DonrYKd+TkM8TuJUOmOvmFGxc
	S7DClmmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidQ7-0000000C5nH-3VPv;
	Thu, 13 Feb 2025 17:54:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ticcW-0000000Bvwp-2Lbh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:03:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 429B3113E;
	Thu, 13 Feb 2025 09:03:42 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C4D83F6A8;
	Thu, 13 Feb 2025 09:03:21 -0800 (PST)
Date: Thu, 13 Feb 2025 17:03:16 +0000
From: Leo Yan <leo.yan@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v19 10/11] KVM: arm64: nvhe: Disable branch generation in
 nVHE guests
Message-ID: <20250213170316.GG235556@e132581.arm.com>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-10-1c1300802385@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-arm-brbe-v19-v19-10-1c1300802385@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_090324_653390_F18ABA17 
X-CRM114-Status: GOOD (  12.44  )
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

On Sun, Feb 02, 2025 at 06:43:04PM -0600, Rob Herring (Arm) wrote:

[...]

> +static void __debug_save_brbe(u64 *brbcr_el1)
> +{
> +       *brbcr_el1 = 0;
> +
> +       /* Check if the BRBE is enabled */
> +       if (!(read_sysreg_el1(SYS_BRBCR) & (BRBCR_ELx_E0BRE | BRBCR_ELx_ExBRE)))
> +               return;
> +
> +       /*
> +        * Prohibit branch record generation while we are in guest.
> +        * Since access to BRBCR_EL1 is trapped, the guest can't
> +        * modify the filtering set by the host.
> +        */
> +       *brbcr_el1 = read_sysreg_el1(SYS_BRBCR);
> +       write_sysreg_el1(0, SYS_BRBCR);
> +}

Should flush branch record and use isb() before exit host kernel?

I see inconsistence between the function above and BRBE's disable
function. Here it clears E0BRE / ExBRE bits for disabling BRBE, but the
BRBE driver sets the PAUSED bit in BRBFCR_EL1 for disabling BRBE.

Thanks,
Leo

