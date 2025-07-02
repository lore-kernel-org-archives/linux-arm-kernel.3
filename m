Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FFBC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7DvdjW3d/vqhTUxcEv4bfLEQEKMjOpztoQHUj03GeM=; b=GZIC3wVpjZEIUuUPJCUEebUYge
	ovYhUByZj96ZvB8v+d2DYE9eb7PC2Z4TkwRygmjTsfwGH0VirvjeE+mqSyMAszinQf/Q96Ut9PrH+
	cAAOrMOX45Mx66L56Cgarz3HUEWIOBt4SyjreTx/VcF9g5V9jJwDJnvVZ5IVNmOWVC/9YXDqylClK
	OywQJLvhebMWpFxOz0xncRAgMBAiXHp+95EOr18y0UnkKdD9jDH4GXLjS1VRx4GOpuIeSAzVoWV3S
	Qk69rqDLzztn+YxR07862bSMuhYXbPoZVx2rS1jsIprMIypQSli1yQE8sqNESEVooYN0aqUGfap73
	g2KMBP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzQ4-00000008ni4-05qO;
	Wed, 02 Jul 2025 15:30:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWydT-00000008eWq-216G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:40:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D90B22C7;
	Wed,  2 Jul 2025 07:40:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0824F3F6A8;
	Wed,  2 Jul 2025 07:40:29 -0700 (PDT)
Date: Wed, 2 Jul 2025 15:40:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/28] coresight: etm4x: Add context synchronization
 before enabling trace
Message-ID: <20250702144028.GY794930@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-6-23ebb864fcc1@arm.com>
 <aGUSZpR1QHNgLu6f@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUSZpR1QHNgLu6f@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_074031_566015_3E3865AA 
X-CRM114-Status: GOOD (  13.90  )
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

On Wed, Jul 02, 2025 at 12:05:10PM +0100, Yeoreum Yun wrote:

[...]

> > @@ -445,13 +445,37 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
> >  		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> >
> >  	etm4x_allow_trace(drvdata);
> > +
> > +	/*
> > +	 * According to software usage PKLXF in Arm ARM (ARM DDI 0487 L.a),
> > +	 * execute a Context synchronization event to guarantee the trace unit
> > +	 * will observe the new values of the System registers.
> > +	 */
> > +	if (!csa->io_mem)
> > +		isb();
> > +
> 
> But, when write to SYS_TRFCR_EL1 in etm4x_allow_trace(), it already does
> isb(). Is it redundant?

Good point. It is not sufficient. As a system register writing in
kvm_tracing_set_el1_configuration(), this is why adds a ISB here.

Thanks,
Leo

