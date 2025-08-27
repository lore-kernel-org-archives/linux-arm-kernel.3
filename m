Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F396CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ace4RUFA2etxFEmV5i12PQRGagUVYTWzsorHMFlsbnk=; b=xvkWQ2RLie5rEgs5pRtnFe2xBw
	+/7/huaQgyFosrA4UGy/kqMkfg8tTeC1izQr8EZLPc5dWlq/42jj0MQGQEBhAH6BaZezSsLgRXaRD
	BnqATjGLUGkXbWFaREiMY9iLjg90Q2DsBl69yd9lx1S8CjGe/r/x0Xl+Hs3VzjFaEyOpk+qVD66yT
	kmVsfoo+2wbXKRC1AoC7Gz550ak82wxdtUfE/oveM6xULRiG8SeJGlmbT3tOimUbxUBQpIeiMhVEH
	wmW/x55N3yeRaokwWw082K7WkWWBwCs2dkUJ4Rd6yMxm19Lia2ajDDhdRPL5uAfqyGegTo5mbLdqy
	dearvIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLsN-0000000GcRA-17sq;
	Wed, 27 Aug 2025 19:32:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJkg-0000000GHt2-3ePo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 17:16:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5CDA15A1;
	Wed, 27 Aug 2025 10:15:53 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 907663F694;
	Wed, 27 Aug 2025 10:16:01 -0700 (PDT)
Message-ID: <58eae4c3-51b3-48ad-b077-aefdff969119@arm.com>
Date: Wed, 27 Aug 2025 18:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Relax num_rmids parameter advertised to
 userspace
To: Dave Martin <Dave.Martin@arm.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250820131621.54983-1-Dave.Martin@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250820131621.54983-1-Dave.Martin@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_101602_958468_B86F41F1 
X-CRM114-Status: GOOD (  12.26  )
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

Hi Dave,

On 20/08/2025 14:15, Dave Martin wrote:
> On MPAM systems, monitoring groups are identified in the hardware by a
> (PARTID, PMG) pair.  Two monitoring group identifiers are the same only
> if the PARTIDs and PMGs both match.  This means that the number of
> monitoring groups that can be created in each control group is the same
> as the number of distinct PMG values supported by the hardware.  The
> number of monitoring groups that exist in other control groups at the
> same time makes no difference to this.
> 
> Currently, the MPAM driver takes the cautious approach and always
> num_rmids = 1.
> 
> Relax this limit, by advertising the number of distinct PMG values
> supported by the hardware.
> 
> Code/Data Prioritization (CDP) makes no difference, since although this
> doubles the number of (PARTID, PMG) pairs available to a control group,
> each monitoring group now consumes two pairs instead of one.

Thanks, I've picked this up. It may get squashed into the patch that adds these lines
before going upstream...


Thanks,

James

