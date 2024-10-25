Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097BBD0C61B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBh2d6qet56TwbF5mC+ikuMqe+u6e/cPYafZyhR2YAI=; b=egj2xND/mZRC7UDxzvUBreXHhv
	RWTSIQntqy2ZXQS5+JrvEdWBgiWRFbmhKuZvPndVAriwF4pIucA/1GGqLWz1gZ4n7TKhSp/4J3Syf
	v/VtxNH3bqBWZOsi2XrrIOrA7WZItK8go0sxaQMOgp3ISccxuV7YFWikB6Hw/W8wGNcPQyTIIR5Kp
	rZU9db4ZK7i75bzmPwEyzA4kR20VHUPiRHya8QxenCsN4CNun7Mlvd98PHMeNrDGHKwOuOVEarW1z
	0im4frC8q6y0RlIWu/z3mfe4rWTpGEa5bhPkhxW4wbJofsYYS7F8a0K2zVTqaM/OTGyCx3nu3pzV8
	SJbcCLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LNy-000000042GM-079s;
	Fri, 25 Oct 2024 14:33:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KtJ-00000003v6Y-0TkW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:02:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3960A42FBD;
	Fri, 25 Oct 2024 14:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69293C4CEC3;
	Fri, 25 Oct 2024 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729864931;
	bh=uOUytvJeyy3SqYRpdRsBWf13Adk6SJC8Eee84d3Etug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRBx6RbxR5nuw+gDjyclmxQ45SMY1Z/wdsODDoBv6EDDt+cfCE0A8C09z77A44GsG
	 Fl3YD9mvL1lKw75XRpaHg4GDOFkWuf0rDOOA25f/rDWFltcJup7FlMmxYPb1fe1l36
	 9pKZsLZAeWLDgbjbtmwylseIT/ExTOBC6HhCqjcHtxPdZtRxeRzK7tIY9veBhxdNrz
	 J3KfUdiFeCmCbu+Jzx+XX8M5fGkJ/hlWtA7Py7Hv6ozszRWqhEpSBRNSl3ahtscPrX
	 CUGmopX0JoU2qGKy31gd2JdOD+mQapW8KxNxUfdoP/9XSVC+rwwhSm/v+d0/Oo3SFO
	 qF2//B8TjtyLw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t4Kta-000000005yi-0WFi;
	Fri, 25 Oct 2024 16:02:30 +0200
Date: Fri, 25 Oct 2024 16:02:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, ulf.hansson@linaro.org,
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org
Subject: Re: [PATCH V4 0/4] firmware: arm_scmi: Misc Fixes
Message-ID: <Zxuk9jlibn8ffEVZ@hovoldconsulting.com>
References: <20241023102148.1698910-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023102148.1698910-1-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_070213_240327_4F4BED19 
X-CRM114-Status: GOOD (  12.11  )
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

On Wed, Oct 23, 2024 at 03:51:44PM +0530, Sibi Sankar wrote:
> The series addresses the kernel warnings reported by Johan at [1] and are
> are required to X1E cpufreq device tree changes [2] to land.
> 
> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> [2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/
> 
> The following warnings remain unadressed:
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> 
> They indicate that duplicate opps are reported by the SCP firmware and
> they are seen during probe. They will get addressed by firmware updates. 
> 
> Duplicate levels:
> arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
> 
> ^^ exist because SCP reports duplicate values for the highest sustainable
> freq for perf domains 1 and 2. These are the only freqs that appear as
> duplicates and will be fixed with a firmware update. FWIW the warnings
> that we are addressing in this series will also get fixed by a firmware
> update but they still have to land for devices already out in the wild.

Thanks for sorting this out, Sibi!

I guess the above description is clear enough too as to why the
opps_by_lvl warnings should stay (in some form).

Johan

