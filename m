Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E125AFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dsDSEuj+DGwxycmlh1Nhr7NjAQQI2Nv12AhgVH0Yjk=; b=ik9nvJGkwjF37ZWPUECFxjiQqb
	59P2xDgdaAizFasSg7lz5+80d11aM8MnLYpoCyhNJEh4mD2kTYm9Q+dtlp0hCctwCrYsvgu/9BVE1
	EMtOl+kwAdKkD0LVfpBRaIfF24Rj6oHI209YPGuR6+AOn14cWgqx1Mm9VxEkS1oxVLuJzE6Xy6aci
	WG7nWgfr82dqHl57xfq/mXqRqsl5vyRXBFaGLGMv7JKzOAyaGJVG+T6GjJKIiHCdhyf3ac2O06UYZ
	JlAlhv8VG1N8w6BAotxaTAmpXAtLHQVowHlH1LdXd1qsDM0/glh/NtspYAOIV11yMR940W2U8PrvB
	K2nMH3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMro-000000051I9-1cW7;
	Thu, 30 Apr 2026 08:35:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMrl-000000051Hd-1bHc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 08:35:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2EE84324E;
	Thu, 30 Apr 2026 08:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C2DC2BCB3;
	Thu, 30 Apr 2026 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538124;
	bh=B1L4jrLvkgWyY4sva0PycJP8nG8fvfd2BFEdcx4wZeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZNECNYkAKYJRFmTJ8tAqAZ1lNS2lLXqCCwQ+muWoxIcLZArzRyyn8ZlLA27GCaC8
	 hCreoKB9vwo54z+8fnFXnoTbiC8jeVvJe+EE/COTGIc1LcXf7PKCf4Ah0+2IgwDjtZ
	 tPuMkp0QTZMIVhE9I/QQ73XaKpNY829XvKwPqV4ULW1kiOXaefKLOSuLSZsE8FFYD1
	 1sQ1lnMbk2e2jluAhnaGvU+oeGCyJFoCb+K24SR06S0vZ0zcqg94Jf1lhxWWXkc45C
	 kP9Mq0WUC95uR8ZJgcUqf1LQQuzAEeAvtUmr7kiJSBpsWjfqPePTuUpUC/vwqleIen
	 i8GQXcnR9hfaQ==
Date: Thu, 30 Apr 2026 09:35:19 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm_mpam: detect and enable MPAM-Fb PCC support
Message-ID: <20260430-brave-hoatzin-of-fascination-e7d4ad@sudeepholla>
References: <20260429141339.3171205-1-andre.przywara@arm.com>
 <20260429141339.3171205-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260429141339.3171205-6-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_013525_443823_9719C31F 
X-CRM114-Status: GOOD (  20.40  )
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

On Wed, Apr 29, 2026 at 04:13:39PM +0200, Andre Przywara wrote:
> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> registers through a firmware interface. This requires a shared memory
> region to hold the message, and a mailbox to trigger the access.
> For ACPI this is wrapped as a PCC channel, described using existing
> ACPI abstractions.
> 
> Add code to parse those PCC table descriptions associated with an MSC,
> and store the parsed information in the MSC struct.
> This will be used by the MPAM-Fb access wrapper code.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/acpi/arm64/mpam.c      |  2 ++
>  drivers/resctrl/mpam_devices.c | 46 +++++++++++++++++++++++++++++++---
>  2 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
> index 99c2bdbb3314..edb4d10e8dc3 100644
> --- a/drivers/acpi/arm64/mpam.c
> +++ b/drivers/acpi/arm64/mpam.c
> @@ -341,6 +341,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
>  	} else if (iface == MPAM_IFACE_PCC) {
>  		props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
>  							tbl_msc->base_address);
> +		props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
> +							tbl_msc->identifier);

I may be looking at the wrong documents, but neither DEN0065 nor DEN0144 carry
any definitions of pcc-channel and msc-id for the device with HID
"“ARMHAA5C". Since "pcc-channel" is already merged, I think I am looking at
wrong documents, please point me to the right one.

-- 
Regards,
Sudeep

