Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F71CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 11:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nD7wDVDbi7/VCKnhDlu1r5sgIa89TMr3Yaj92Zqp8G0=; b=OYheZssl4PuqVyxso85aNcUicc
	+Mz3yofDznYSZ7Ne9CbOWVWpGNJjsK0pdf1WdftwNeRrtL+UyT7z/GsuwrH/4gkTrxXUTQH4HMekn
	1YXFPDDkiCc49UT7//flXG9vd/OAY7N+8PJUSmQKyepj8IDe84Qmkf3Ak/X9CnsXqkslnY9FbpM2H
	e9bzgyes3QGopNoAXVoZWNS/bDiMxQcJQGKF2OG/8de/TjUSjH9ljOgt8kLi2MGfRx25ogR6Mrdmw
	s2CAHp7/xn3mVJlxvUFCTk7yL1PcoQnVsyMlMYJMh5nQN8BeBQ7OfAtAX1O/bQZFxVeR+8DkRqeva
	zJtQ7l0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jGb-0000000HTUj-38SC;
	Mon, 06 Oct 2025 11:20:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jGY-0000000HTU1-373b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 11:20:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C6A31515;
	Mon,  6 Oct 2025 04:20:19 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE3733F66E;
	Mon,  6 Oct 2025 04:20:26 -0700 (PDT)
Date: Mon, 6 Oct 2025 12:20:25 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 25/31] coresight: Add 'in_idle' argument to path
 enable/disable functions
Message-ID: <20251006112025.GC7985@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-25-ea49e91124ec@arm.com>
 <CAJ9a7ViPxne8WXLS-QQDWw0=Nm_QAP4jw4sZCHKoOyDgTdVy2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7ViPxne8WXLS-QQDWw0=Nm_QAP4jw4sZCHKoOyDgTdVy2g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_042030_817927_56939C40 
X-CRM114-Status: GOOD (  13.77  )
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

On Fri, Oct 03, 2025 at 12:42:39PM +0100, Mike Leach wrote:

[...]

> > @@ -502,6 +503,10 @@ static void coresight_disable_path_from(struct coresight_path *path,
> >                                                 CORESIGHT_DEV_TYPE_SINK :
> >                                                 CORESIGHT_DEV_TYPE_LINK;
> >
> > +               /* To reduce latency, CPU idle does not touch the sink */
> > +               if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
> > +                       continue;
> > +
> 
> Why not - if this is the last/only active path then you absolutely
> want to disable the sink to flush trace through the system.
> If it is not, then the disable sink will simply reduce the refcount by one.

CPU idle is latency sensitive, and the CPU can enter and exit low power
states frequently.

And ETR uses a bounce buffer. If we disable the sink in the idle path,
that not only disables the sink but also copies data from the bounce
buffer to the perf AUX ring buffer, which can introduce significant
latency.  Given the latency is not constrained, this is why we don't
disable sink for CPUidle.

To be clear, we will disable sink for CPU hotplug case, in this case,
CPU hotplug itself usually has no high requirement for latency, and we
will expect CPU hotplug does not happen frequently, thus it makes
sense to disable sink (and copying trace data).

Thanks,
Leo

