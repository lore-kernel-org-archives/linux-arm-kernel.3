Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CB81073C98
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYEUKQgEuAFguBXY8nq1e8tU6T29H9g5LbOUXLxjW2M=; b=JIgXZZeZ+ZEccm87RpvNpP/KCp
	XUVjBXJt1XtlTdH7J6t/lVjIWSU/l0IWfQstExoHbHFfuM0NxS4YO1Wsc8WLH2xFs3uYkckzzQlig
	PphvvcDy0jPl+/4Z1ysXX+Supptpx2emqePYhUyOy1ULeJ5MHRqOUVi/NKJOC5sjN3ysBu4WRMc+x
	7/b7CPb68DtU37svM99iQREo7+LkgJLbBfIHFQBSIemS9DtK/3IdCTk2lFhZx3UG9UsjKTRemCO3l
	gCW9N4MJQZb35ATOAEYc8L+rrR1DUK3MSiDVZ3hKObrWl3RHBftOXvxyiPpzr3JPsd/kwwYUC1uuG
	S41o8lvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQfu-00000008ilW-1exl;
	Wed, 08 Apr 2026 11:02:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQfs-00000008ikx-1Mau
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:02:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82CEB359A;
	Wed,  8 Apr 2026 04:02:13 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B803A3F632;
	Wed,  8 Apr 2026 04:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775646139; bh=7VE/oN+zNWKqLjgFETre/X5q6PBvSvRShw5YJFsm2dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLfyZa4Qj3YHaKrT2yEHn8lydBLHeGjkpwD5gRsfChAsklDel2Jb2gBmYW2r5BFKb
	 x+qJ0VHra2Z14ax/mFV17GZUzkbdwLYyINl6XLSscQPFDnAbNfm19UOVlPyPQuXS9Y
	 45xXfD7+hpqCaAox+jEfEzTsEEN8l93e6tEL58xs=
Date: Wed, 8 Apr 2026 12:02:14 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Subject: Re: [PATCH 1/2] coresight: etm4x: fix inconsistencies with sysfs
 configration
Message-ID: <adY1tm4Iax/WrAbU@e129823.arm.com>
References: <20260317181705.2456271-1-yeoreum.yun@arm.com>
 <20260317181705.2456271-2-yeoreum.yun@arm.com>
 <20260407143028.GM356832@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407143028.GM356832@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_040220_409286_357C60F3 
X-CRM114-Status: GOOD (  11.20  )
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

Hi Leo,

[...]

> As Suzuki suggested in another reply, we need to extract capabilities
> into a separate structure.  I'd also extract status related registers
> into a new structure:
>
>   struct etm4_cap {
>       int nr_ss_cmp;
>       bool pe_comparator;    // TRCSSCSRn.PC
>       bool dv_comparator;    // TRCSSCSRn.DV
>       bool da_comparator;    // TRCSSCSRn.DA
>       bool inst_comparator;  // TRCSSCSRn.INST
>
>       int ns_ex_level;
>       int nr_pe;
>       int nr_pe_cmp;
>       int nr_resource;
>       ...
>   }
>
>   struct etm4_status_reg {
>       u32 ss_status[ETM_MAX_SS_CMP];
>       u32 cntr_val[ETMv4_MAX_CNTR];
>   }

Hmm, I don't think the cntr_val doesn't need to be separated into
etm4_status_reg since they're configurable by sysfs.

BTW from etmv4_config, I think parts of capabilites are only:
  - ss_status
  - s_ex_level

I think it would be okay to include all of this information into
struct etm4_cap not dedicate etm4_status_reg structure.

BTW, Is it required to sustain TRCSSCSR<n>.PENDING in sysfs after
re-enable sysfs-session? (enable->disable->enable) while it's always
cleared in perf mode?

Thanks!

--
Sincerely,
Yeoreum Yun

