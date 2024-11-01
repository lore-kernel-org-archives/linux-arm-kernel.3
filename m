Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F4AE6F060
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO0SpygwDcdt8eXvVZE+vgizsCApdc1rx4X8+B4BuiQ=; b=4nhWGzqVVrdVyB3rE8bhuApLZj
	HIXGjCTKSF7EtICFHY4CfSHMjGHuODGJo/s464b5fEfLl+yzkKKNlJ6WflrMjrmeuv3UoJ5O468k4
	TpdpdRYm4RaqhAg7rhVGtSSItcuz+GkagX5UguEhx7FHCea9EcqIfPCOdPClDJAkA+qS8hocym1RT
	lu+0K7vFRB+ffYmx0vyuQK9asj1Ie+YKpeYrd7fySMIprWFqo894VOa9PxfPHDQIhqb0gP+sHqB5g
	YhwEc+tEqFxeTHkTmCNUcZmOrCl+jl0QvZYR2FU2JkhG2M4lKSlBrX1UlR+tm5hKLu6CnU7RglEht
	VjSc+jLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sdP-00000007L1u-07pb;
	Fri, 01 Nov 2024 14:28:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sKp-00000007HUh-115p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:09:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BB015C0560;
	Fri,  1 Nov 2024 14:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E050DC4CECD;
	Fri,  1 Nov 2024 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730470146;
	bh=V1lHT+M0hVf8y3QEJQ9Y5vnOyPZcmjeWG3D2SQpniHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVhaYgZse3lMJvuJEkmIOrlzosfBzD3lhMSHwGYeeZFK4qL9cuJ7bAxDJIV38WzpX
	 ml0u+DWHbWIML5Qs5h7G7clpJQN4xzOBOF//wa3XwUiM6G6d7pPzhKzL608g8+n9DW
	 vhrw84lpWizMsRMQkdw8w7iPjpe/2eFSxpU/N4empIL6yVXUhDh3H+KCgbabmQeigB
	 G7TmWJWrqT3hbGy4QoVAT02nf95JHTmGbsxRWomK8DuWVRvM1/2jkwMVCYwcF6J3G4
	 i8ad4X6AUL2iEiMG9cNfF+4qD2wD/boI0rJzM1eQvtsl22qYHbbkyv92ilMF5IaI16
	 pgEYnAflSDjDw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t6sKm-000000005cY-06Fr;
	Fri, 01 Nov 2024 15:09:04 +0100
Date: Fri, 1 Nov 2024 15:09:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, ulf.hansson@linaro.org,
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH V5 3/6] firmware: arm_scmi: Report duplicate opps as
 firmware bugs
Message-ID: <ZyThAFbOHKaBIgLg@hovoldconsulting.com>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <20241030125512.2884761-4-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030125512.2884761-4-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_070907_349200_D821C705 
X-CRM114-Status: GOOD (  18.11  )
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

On Wed, Oct 30, 2024 at 06:25:09PM +0530, Sibi Sankar wrote:
> Duplicate opps reported by buggy SCP firmware currently show up
> as warnings even though the only functional impact is that the
> level/index remain inaccessible. Make it less scary for the end
> user by using dev_info instead, along with FW_BUG tag.
> 
> Suggested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/firmware/arm_scmi/perf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index 32f9a9acd3e9..c7e5a34b254b 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -387,7 +387,7 @@ process_response_opp(struct device *dev, struct perf_dom_info *dom,
>  
>  	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
>  	if (ret) {
> -		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
> +		dev_info(dev, FW_BUG "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
>  			 opp->perf, dom->info.name, ret);

I was hoping you could make the error message a bit more informative as
well, for example, by saying that a duplicate opp level was ignored:

	arm-scmi arm-scmi.0.auto: [Firmware Bug]: Ignoring duplicate OPP 3417600 for NCC

or similar (e.g. as the current message looks like an error, with errno
and all, that indeed warrants warning level).

Perhaps with such a message you could even keep the warning level to
make it stand out more (if that's desirable) without the risk of scaring
users.

Johan

