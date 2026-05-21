Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEB0CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATzsR08xkxxmP0oKAz5Eu3T3oucBynDdLnl6uo8rnng=; b=sgQZZx555m1GQR4wmgemaG7BH6
	BV03NTDvFiNcVPtgwk9c1gcG1fi4mgyG2dl/F3jxamy6XgIprJE1uN8tdopWTALgMVykSa7yisNJ4
	QlMh5moyv9UZ6CMGg5WtX/Rw3x6bIqPh4b6oPvWPchgGlsh6heRFnD/ZSgC5K7fqUaQXyvpIbneTX
	gB0hXzrG0OC/BrN6jIk3LrHCjUAkpbWufxA5YaOV76JKLdS2SU5mHAHzcNE5/NLK79SKmBiM8V6sl
	sb41IudPQw5CTAs6laAjWKmINSLUdkFxkQWAC3ZhDTnkqsSAFfi8rMnA05yQubv/XH33Mdap+XME4
	WVT0OLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6E1-00000008U3P-07VP;
	Thu, 21 May 2026 16:26:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6E0-00000008U2n-11Lk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:26:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C1C860212;
	Thu, 21 May 2026 16:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7E51F000E9;
	Thu, 21 May 2026 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779380779;
	bh=ATzsR08xkxxmP0oKAz5Eu3T3oucBynDdLnl6uo8rnng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IZIOmK2xZE31Nai9izZcaqnvJxgfX5OB3BgVGn5cwr6KiVStO2gEUQNGCRpQm7k8E
	 l3Ppqjcd5N+YTn5cAqum3BSrDJxUw8fJiLYo4qPuxxUZNtirh16qiieep3BFEn1ONM
	 lO9HFuPkaPXfaEMY0B8Ye5WKDAExUnTiVgR2K8mS/2BL9HoVVLQOD1UP9h9pfIXRWi
	 qLf/9RuNWBOoa7ZOxF3Oi+hu1vlsh2eT/daKPkSNtNnW5e1Z8mtIbhTrCz8ZCwmAbL
	 RezC+Cz7+bz+H1v+a/JCQBocXaTjJ5mDaqk3HAq7RR+KGfSuCaeVn5QTEsyqT0b/Ei
	 qSxeWYZCNdN1A==
Date: Thu, 21 May 2026 17:26:15 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
Message-ID: <20260521-loutish-lurking-koel-229bd9@sudeepholla>
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
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

On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> scmi_power_name_get() does not validate the domain number passed by the
> external caller, which may lead to an out-of-bounds access.
> 
> Fix this by returning "unknown" for invalid domains, like
> scmi_reset_name_get() does.
> 
> Fixes: 76a6550990e296a7 ("firmware: arm_scmi: add initial support for power protocol")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/firmware/arm_scmi/power.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
> index 3aa84ceb6d2bab68..4a7215e02dec035d 100644
> --- a/drivers/firmware/arm_scmi/power.c
> +++ b/drivers/firmware/arm_scmi/power.c
> @@ -204,8 +204,12 @@ scmi_power_name_get(const struct scmi_protocol_handle *ph,
>  		    u32 domain)
>  {
>  	struct scmi_power_info *pi = ph->get_priv(ph);
> -	struct power_dom_info *dom = pi->dom_info + domain;
> +	struct power_dom_info *dom;
> +
> +	if (domain >= pi->num_domains)
> +		return "unknown";
>  

The only user of this function must not call it for domain >= pi->num_domains.
However, I am thinking if it is bit inconsistent within SCMI core now. I like
the way pinmux/ctl handles this as I don't like the alternative for this
(i.e. ERRPTR(-EINVAL or something)). Worst case if this ever causes issue
we can change the signature of the scmi_{power,reset}_name_get to follow
something like pinmux and update the users. Thoughts ? Happy to apply this
for now.

-- 
Regards,
Sudeep

