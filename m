Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5EFF53D7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydX2yBMgXeiuiIgRUGOL1Rfe/PnnSg43GJrVeEIFsGo=; b=H0ggLeHlkuiNpojM6QKs9hmhuj
	zN8IJUlTkkfQub8PS47xm9+jMUxzPvUI8idVduE2nXxsEo/xoOrE52hqfWV9NfrMheWqvZCff188e
	rKtB/ngQX34BmJjF/+HYs9f9JEWrF2xmiHr+BLbu4hph9XXI4HeX+m9LTSOXzsxtfTjnx/hUBIn5k
	i1X5zCdnyFgglIMTXHt2Yl7YJszRV9OJpc3IN2pneZHJgRzu22cgjKGCJh4NTtyiMV7fWsXi/S5MG
	IVFT+t1zLLVKvEOYhD95pOedtGW+1zejuowkTQIRmvSEeqYlwuGG+FLSI0X3wEy/DPvppYYR4ZHbl
	kgjnQmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bwi-00000004bDs-3KjN;
	Mon, 16 Mar 2026 17:41:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bwf-00000004bD9-1BSh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:41:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 367FE1476;
	Mon, 16 Mar 2026 10:41:27 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F15993F73B;
	Mon, 16 Mar 2026 10:41:32 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:41:31 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 02/19] coresight: Set per-CPU source pointer
Message-ID: <20260316174131.GG8048@e132581.arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-2-eff765d211a9@arm.com>
 <e2131c5c-d55c-4569-b877-811be6b95576@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2131c5c-d55c-4569-b877-811be6b95576@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_104137_361248_C538A37B 
X-CRM114-Status: UNSURE (   9.32  )
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

On Fri, Mar 13, 2026 at 11:22:32AM +0000, Suzuki K Poulose wrote:

[...]

> > @@ -82,6 +83,56 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
> >   }
> >   EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
> > +static void coresight_set_percpu_source_local(void *csdev)
> > +{
> > +	this_cpu_write(csdev_source, csdev);
> > +}
> 
> 
> > +
> > +static void _coresight_set_percpu_source(int cpu, struct coresight_device *csdev)
> > +{
> 
> While at it, why not add a coresight_get_percpu_source() and hide the
> implementation for the subsequent patches ?

Good point!  Will do.

