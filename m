Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34474C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 08:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGrXaIbgqcXvPlsk5RcEQzAK2EXxWBrDSW05srTtxgU=; b=T2qN7PAhtdcgZZofERe9L/FPXM
	IkZPwjNy+b2TVRJao/S/nGc/L8JLAwx7FBf8jX0d4zxstpWcn5+daHhjkwymddbXBThBQoL9FWrkr
	ro87GNM4PoAbUSaat4UoJFRqfzVpmp/naA0Scga032eOXmgX1K7CzHUbAft3q78DfAGONlSYxTMw/
	rA80B0lrf/62XJhTumGV2QPUQ+QIUQTaEnUTnLk/8jP18Rm4gPqqUHHoJL4uWHXkxoy41sLLWg63u
	+3Xj/5p2PqAZxiDY8m2vnJuNctjFPFTRU/zdZD7R/Jp7f0mu+/vcgUh4uJmsjaz3ZAO3QFsTg2SAF
	okH3Nl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FmR-00000008ErT-1X8j;
	Thu, 03 Apr 2025 08:18:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Fj9-00000008EJx-3MUc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:15:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0723BA46660;
	Thu,  3 Apr 2025 08:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B46C4CEE3;
	Thu,  3 Apr 2025 08:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743668106;
	bh=d60uPl3O2WNH5zTqvohDJrR3czaNKY19sBaIVAZLdEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFNiwOUsMEPYtNg5Bx6D9qMpJC7DlLB4iItNbA4oWNdMZ1GvKPtq2zq5VLKCdHSGj
	 EVzfidldRIQpWsLv6FhFTspFjE541FQSpDquAwIUk2JXUrNIQ/Qw1zif6wDi0/4BkG
	 7Qz697KSheeDzgcWYUJAwXb+kCnhw9eornzE3S+Hqr8o2siesRjz95sx8RzqCGhhYd
	 0rA46zwyb9d7h5BEejUNDhJsdRLhS1f38bZ2ahnWmjZICj1iT33Lel/9PfsGZCX+wz
	 vo+94QV8+2XIMg/6nu0zkMGvO7rHi9CoEzIl0j1oJWpzn8p2dqNyVd1Z6jQWt73fcB
	 trbAPoHObZ/aw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u0FjC-000000006t4-3pw4;
	Thu, 03 Apr 2025 10:15:10 +0200
Date: Thu, 3 Apr 2025 10:15:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org, stable@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [RFC PATCH 1/3] firmware: arm_scmi: Ensure that the message-id
 supports fastchannel
Message-ID: <Z-5Dji5dbDsKXZE_@hovoldconsulting.com>
References: <20250401122545.1941755-1-cristian.marussi@arm.com>
 <20250401122545.1941755-2-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401122545.1941755-2-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_011507_902266_A5DB511E 
X-CRM114-Status: GOOD (  13.51  )
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

On Tue, Apr 01, 2025 at 01:25:43PM +0100, Cristian Marussi wrote:
> From: Sibi Sankar <quic_sibis@quicinc.com>
> 
> Currently the perf and powercap protocol relies on the protocol domain
> attributes, which just ensures that one fastchannel per domain, before
> instantiating fastchannels for all possible message-ids. Fix this by
> ensuring that each message-id supports fastchannel before initialization.
> 
> Logs:
> scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
> scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
> scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
> 
> CC: stable@vger.kernel.org
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Closes: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> Fixes: 6f9ea4dabd2d ("firmware: arm_scmi: Generalize the fast channel support")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> [Cristian: Modified the condition checked to establish support or not]
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Since PROTOCOL_MESSAGE_ATTRIBUTES, used to check if message_id is supported,
> is a mandatory command, it cannot fail so we must bail-out NOT only if FC was
> not supported for that command but also if the query fails as a whole; so the
> condition checked for bailing out is modified to:
> 
> 	if (ret || !MSG_SUPPORTS_FASTCHANNEL(attributes)) {
> 
> Removed also Tested-by and Reviewed-by tags since I modified the logic.

This still works as intended:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

