Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246A1C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1+eJUeoIxDPpvm5aRAfOrIFfS0MB5kksd6upW7Lnwg=; b=3drfzEOUNP41LIQpvkYa32qXc/
	JktUnn9b9peci56En9uefLEzWCuskzin+mqBcXzmQ/wJUYmGW9Hy6Tkpi177SkLMnBqtnRku9f+6+
	K74RI474+JpUPcRGm+E+QrIMVn8ZuWRBkdXzn7hmSp2dnUz/t8srqzzKXudgX89Gi6fBnFrl+Idqw
	klKz9NaJbFWD/U0kcHPelbLGp8Sbh+s8myjz8JhtII7vxovpIvYptMJT6zJtcHUbbhcEfLjj5FzPR
	qVif3uaK1b6W8qdVsJXE1MeMRCGujlQwl/acSGjXjmP9yx7kTpEp/GMt6fPAMqoyM7xkc10hWBszJ
	LRtC4eTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfif-0000000C2o6-03mt;
	Mon, 06 Jul 2026 09:34:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfid-0000000C2my-2N5R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:34:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2EE7415F3;
	Mon,  6 Jul 2026 09:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EB51F000E9;
	Mon,  6 Jul 2026 09:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783330466;
	bh=y1+eJUeoIxDPpvm5aRAfOrIFfS0MB5kksd6upW7Lnwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KLNDOB9chj6s2n14hcCWonOb6t5b4Iuvm7R0yXt2Ew3rcCVqkNqibjzQl+aw4M8Dq
	 MJ7Y87yTYjqWdoAQpsEMk4oAksUlKqMkh3ZxMCsnYjWZEHx4GWMPUbDcez1+MNTfFT
	 0hS0tz1mApA9M2ecQPKoozLb6C0Ry+HRb2bwWx1c2nbk5UL7XijiAackl3nTgRSRIK
	 aQNiX/9GIVEMb11duvTdic1GazY5KRNBzzVq+kvm0BHvd76WgO/he60BrCLv1nXl7N
	 Ji++SGYUCNlElJhrNN9P58s7+iDZpjNlhiShpwkHybjOKMc10OVSJV3lqCrMEgkViY
	 E6raygxWWoa2w==
Date: Mon, 6 Jul 2026 10:34:23 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: arm: scmi: Check pm_genpd_init() in probe
Message-ID: <20260706-dashing-dazzling-sambar-453a4d@sudeepholla>
References: <20260705103256.284467-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705103256.284467-1-lgs201920130244@gmail.com>
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

On Sun, Jul 05, 2026 at 06:32:56PM +0800, Guangshuo Li wrote:
> scmi_pm_domain_probe() stores each domain in the onecell domains array
> after calling pm_genpd_init(), but it ignores the return value from
> pm_genpd_init().
> 
> If pm_genpd_init() fails, the genpd has not been added to the global
> genpd list. The probe code nevertheless stores the genpd pointer in the
> domains array. A later provider registration failure then unwinds the
> array with pm_genpd_remove(), which can try to remove a genpd that was
> never registered.
> 
> Check the return value from pm_genpd_init() and only store successfully
> initialized domains in the onecell array. On failure, unwind the domains
> that were already initialized.
> 

It was done that way intentionally IIRC. We don't want to remove all the
power domains if some not so important power domains fail to initialise.
You can log the error if that helps but removing all the domains that
have initialised seems bit of extreme.

Are you facing any issues on a real platform or is this just by code
inspection.

-- 
Regards,
Sudeep

