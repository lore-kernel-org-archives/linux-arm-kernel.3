Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99939CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ9yVqMigV8ao9bApgQU8UTSNcOodrgqixNO+p0JS2Y=; b=bPnwTDp0ye7WTjCndm8MjN8LYo
	l65S9rigg80RMjDY0P06J80TCaM9LZHAaDFQQqzV3t4de1jnZDqm7i6IJHytTlZLVwbH9WWejVclE
	zj2je84dASTBBTghYnxcVTLUIEx5G6AoVJX44M1HrXBPq/B1NAeKY7pnBiHBlgZ5Xbs8THiDrJrmK
	cLlvluEoPgYnKyrWZXZru9BB7j0+CRmVwqVu5EzNyx7lGNjB9FUsmzUU7UtC5oYeE3JS1ENiLY7on
	s8E2YgPY6g94ZpSKj0bYrjs9T48X8/ZLVaqqGhRtUbm9in/IzuYPGvJgUuA8GhccSujWWbB8Hgh1s
	w3/8uWtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g17-0000000CRkg-2Ghs;
	Fri, 03 Oct 2025 13:40:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0n-0000000CRHO-3yHk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98EC11655;
	Fri,  3 Oct 2025 06:39:44 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DB213F66E;
	Fri,  3 Oct 2025 06:39:52 -0700 (PDT)
Date: Fri, 3 Oct 2025 14:39:50 +0100
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
Subject: Re: [PATCH v3 16/31] coresight: Add callback to determine if context
 save/restore is needed
Message-ID: <20251003133950.GX7985@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-16-ea49e91124ec@arm.com>
 <CAJ9a7Vh-PwgiYVRe3DAP9L0gC20=A3tnFk2hEzugVuqyFTShLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vh-PwgiYVRe3DAP9L0gC20=A3tnFk2hEzugVuqyFTShLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_063954_161240_19D0E01B 
X-CRM114-Status: GOOD (  13.04  )
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

On Wed, Oct 01, 2025 at 11:36:07AM +0100, Mike Leach wrote:

[...]

> > +static bool coresight_need_save_restore_source(struct coresight_device *csdev)
> > +{
> > +       if (!csdev)
> > +               return false;
> > +
> > +       if (source_ops(csdev)->need_context_save_restore)
> 
> check the actual save and restore ops here too?

Will do.

> 
> > +               return source_ops(csdev)->need_context_save_restore(csdev);
> > +
> > +       if (coresight_get_mode(csdev))
> > +               return true;
> > +
> 
> Not needed - should decide only on the previous
> need_context_save_restore() test.
> Components such as STM, ETR, ETB all use the mode status, but may not
> support / need save and restore.

Checking mode here is for ETMv3, which no need_context_save_restore()
callback.

Note, STM is a system wise component (unlike ETM is CPU-wise component),
thus it is irrelevant to CPU power management.

[...]

> >  static const struct coresight_ops_source etm4_source_ops = {
> > -       .cpu_id         = etm4_cpu_id,
> > -       .enable         = etm4_enable,
> > -       .disable        = etm4_disable,
> > -       .resume_perf    = etm4_resume_perf,
> > -       .pause_perf     = etm4_pause_perf,
> > -       .save           = etm4_cpu_save,
> > -       .restore        = etm4_cpu_restore,
> > +       .cpu_id                    = etm4_cpu_id,
> > +       .enable                    = etm4_enable,
> > +       .disable                   = etm4_disable,
> > +       .resume_perf               = etm4_resume_perf,
> > +       .pause_perf                = etm4_pause_perf,
> > +       .save                      = etm4_cpu_save,
> > +       .restore                   = etm4_cpu_restore,
> 
> Above are just white space change noise as far as I can see.

Will drop in next spin.

Thanks,
Leo

