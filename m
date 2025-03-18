Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2052C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVoibi7diXnv6aW9m2YS3NTx1Gou8iy6MOJEPKNFgIw=; b=RprztZWmJSeJVqF3CiGLjCzZBA
	eh5pr8Vp+sNTCS6GR5j0IbyR0co5Rc/PQ58NcpdtbYDZtUO5uVnP+vmRieOfrhD/PkO8251ct/znY
	lCJIHQ8mEOjarxIiV2GssRL8Q5DRRJFwtqwwbhOLqv0QIAVtTAwJwugiWFjT9J94BZq4IBbjV1e+G
	Ls7iVWomju4eoxS13kqxCur3/uwWToxLoUnImTOmRx4RQOhlFUuL19E8EoJzmmdO8dDGBwr3OFJSc
	i6ui/3Bh8uYRBLD3rdcIU2P5aNN33LEOzWK37q8TbHoAi3QPYSdLcdNcVBH0QDseBLX4qsJwVbFmR
	1TjowjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuajf-00000006gYX-2k2M;
	Tue, 18 Mar 2025 17:28:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuagT-00000006fwx-0KiF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:24:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC10B113E;
	Tue, 18 Mar 2025 10:25:04 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 971943F673;
	Tue, 18 Mar 2025 10:24:52 -0700 (PDT)
Message-ID: <25bd5477-a388-405f-a976-6b1a59860ef8@arm.com>
Date: Tue, 18 Mar 2025 17:24:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta
 <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, Charan Teja Kalla <quic_charante@quicinc.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <CAMuHMdWPFnHTFeeWL2-BU8tKOL-E5K2ROOz=LLBLTJJLCK9NgA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAMuHMdWPFnHTFeeWL2-BU8tKOL-E5K2ROOz=LLBLTJJLCK9NgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_102457_210714_F9705952 
X-CRM114-Status: GOOD (  17.54  )
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

Hi Geert,

On 18/03/2025 4:37 pm, Geert Uytterhoeven wrote:
[...]
> Thanks for your patch, which is now commit bcb81ac6ae3c2ef9 ("iommu:
> Get DT/ACPI parsing into the proper probe path") in iommu/next.
> 
> This patch triggers two issues on R-Car Gen3 platforms:
> 
> 1. I am seeing a warning on Renesas Salvator-XS with R-Car M3N
> (but not on the similar board with R-Car H3), and only for SATA[1].
> Unfortunately commit 73d2f10957f517e5 ("iommu: Don't warn prematurely
> about dodgy probes") does not help:
[...]
>      Call trace:
>       __iommu_probe_device+0x208/0x38c (P)
>       iommu_probe_device+0x34/0x74
>       of_iommu_configure+0x128/0x200
>       of_dma_configure_id+0xdc/0x1d4
>       platform_dma_configure+0x48/0x6c
>       really_probe+0xf0/0x260
>       __driver_probe_device+0xec/0x104
>       driver_probe_device+0x3c/0xc0

Hurrah, this is the warning doing the correct job - something *is* off
if we're now getting here without the IOMMU configuration being done
already (for a normal device with no other funny business going on).

> 2. The IOMMU driver's iommu_ops.of_xlate() callback is called about
> three times as much as before:

That would suggest that the fwspec gets set up OK, then something later
in the __iommu_probe_device() path fails and tears it down again, so the
next attempt starts from scratch. Do you see the "Cannot attach to
IPMMU" message firing? And similarly to the Rockchip case, does the
below help?

Thanks,
Robin.

----->8-----
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 074daf1aac4e..5d416262ae5f 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -1081,6 +1081,7 @@ static int ipmmu_probe(struct platform_device *pdev)
  		}
  	}
  
+	platform_set_drvdata(pdev, mmu);
  	/*
  	 * Register the IPMMU to the IOMMU subsystem in the following cases:
  	 * - R-Car Gen2 IPMMU (all devices registered)
@@ -1103,7 +1104,6 @@ static int ipmmu_probe(struct platform_device *pdev)
  	 * ipmmu_init() after the probe function returns.
  	 */
  
-	platform_set_drvdata(pdev, mmu);
  
  	return 0;
  }

