Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0B0CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+jwqyJhTHrkidzVwJv9jMk5PK21IsqlZqVVecUElF4=; b=lj6ZRc2kM40utvdcXVzaeZLc1G
	2rmRe2xiPdaQrFSlTJht+l0KJ5owCQjjhRxYaCrwRjtMFdkDhdGvtJimdfFEiNTr2ODrqIYx2EiO2
	81KQORlOvIcAJ7Y9Tgq4PsSfWHHG8hY5Rtoiokc3nrVKMbQ89e6i+6EAExRI18dZ9XYuzcVb3JOpO
	+B4yw8n9ltdpDPlWpwt4k39mJ1MtBD80gor9+3ucJQDQ7HZ2UMiCMSWiQfEf2GgjgnwGuLTs5wbto
	TSuz5wykW70I+Lkd7kwetWobaYA0imj/4Jw4e8r51XhBoWFWEhVHaT2j8leHT+OkPvJU/hExnFr6c
	2K3RAIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaKH-00000005kt4-1TyK;
	Thu, 28 May 2026 12:59:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaKE-00000005ksk-0zYB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 12:59:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B5F74402;
	Thu, 28 May 2026 05:58:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0C4F3F905;
	Thu, 28 May 2026 05:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779973139; bh=EtwdzFZAT5liRg+obWkCWT2dOeHihm9V0uJzgkL0RS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vbGA8w00gDgaQ0ABpSc7A31lw9iJRbykSCjeuBiGYVwz1bKE/JrhRVCZpi4D3Cy9T
	 5EH90R9mhElDSpxsFOFJq1NtE6Gyj91n3mHEktwRVp2CmSsBnlq7hrmxnnxFbm0Iss
	 l2j0fDdj+2QAQY6tpm09JODae0/e+YdZgZDsyGRc=
Date: Thu, 28 May 2026 13:58:56 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 03/13] coresight: etm4x: introduce
 ETM_MAX_SEQ_TRANSITIONS
Message-ID: <20260528125856.GC101133@e132581.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519154812.254884-4-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_055902_342647_92CFDFCA 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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

On Tue, May 19, 2026 at 04:48:02PM +0100, Yeoreum Yun wrote:
> According to IHI006H Embedded Trace Macrocell Architecture
> Specification [0], n could be 0-2 for TCRSEQEVR<n> when
> TCRIDR5.NUMSEQSTATE is 0b100.
> 
> Therefore, introduce ETM_MAX_SEQ_TRANSITIONS macro and apply this
> in TCRSEQEVR<n> relevant fields.
> 
> Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
> Suggestedby: Leo Yan <leo.yan@arm.com>

s/Suggestedby/Suggested-by

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

The change looks good to me:

Reviewed-by: Leo Yan <leo.yan@arm.com>

