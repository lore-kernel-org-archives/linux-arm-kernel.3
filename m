Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78CAC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZAjOCZeERnDxqoxvymPb74cZQfg00xBwkvDxoBOCYY=; b=rFeei0+02hURrnH4I7qmhHvVaS
	Q0aS3eCnwPr565BVfxG0/WZEyRxxqazhvyH3qAEyqtPBWG2YER1UnKCR+CfQZx5Cc0mXFgCrPnpKC
	ZechNnoqaGDtrfRJk2H+qJqh99QJu4WcO3shlV3aysVFFV2hKy5K2TXkqmHmnzoLEn/D8pBiBEtMc
	VA3eQoh9gw774nPzznNUKKSHzMxekeDwKZAFQ7PuxCONWmesi0gXgHjnTecIQ8uGs9z19ZJJ3RByq
	0EhHFoZQdjBsNNH+kb7StXUS/WbE3+NEDoS0nGORGjsQo7bZxe/NiJFhPpVXJQcjGkd+TZjShGIy6
	fYROj0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqso-00000009zXB-2uHV;
	Mon, 04 Aug 2025 08:49:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqSl-00000009vrn-2Q6L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 08:22:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EE8E1C25;
	Mon,  4 Aug 2025 01:22:20 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46FE73F738;
	Mon,  4 Aug 2025 01:22:28 -0700 (PDT)
Date: Mon, 4 Aug 2025 09:22:26 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Levi Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/28] coresight: Change device mode to atomic type
Message-ID: <20250804082226.GH143191@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-1-23ebb864fcc1@arm.com>
 <cd8cba00-b495-4aab-b63c-699bb2c12d48@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd8cba00-b495-4aab-b63c-699bb2c12d48@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_012231_654939_C3AA6E2D 
X-CRM114-Status: GOOD (  12.69  )
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

On Tue, Jul 15, 2025 at 12:23:22PM +0530, Anshuman Khandual wrote:
> On 01/07/25 8:23 PM, Leo Yan wrote:
> > The device mode is defined as local type. This type cannot promise
> > SMP-safe access.
> > 
> > Change to atomic type and impose relax ordering, which ensures the
> > SMP-safe synchronisation and the ordering between the mode setting and
> > relevant operations.
> 
> 
> But have we really faced such problems on real systems due to local_t
> or this is just an improvement ?

This is an improvement based on reading code. The reason is the
variable is accessed by mutliple CPUs but not per-CPU access.

Thanks,
Leo

