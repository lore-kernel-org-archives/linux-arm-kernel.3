Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60741D15DA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEpiawEoU+waNaBtNB5z6DW6hGOKsnuWYuq20gG8yyA=; b=1vJHS4wBOICUAi9VhsWqYbBfWd
	ZIzF8eGqoeGtJHBaQWrPdXJOKxZt1B3FvDcRwHLuBW2ehaYTnh9dQrauht9gYU+Ta2DMNVzIXVFoi
	QyAFMsDJLofS2XNQc+Noy0fNtGUIPoY1nOm24vNGcr8OMPOzDGs5QQjiim1YpyapCZYXc3KQvgeuT
	Z7dougyR0SWLIKGxE0Pj/+2lGQ6/ODTz85RHMp6SQNI1RVOVAdksSJvAKjDcIkcHJlUa/LBp+8Xtv
	JxIxO4zeMgsv+H+xJ2o2TbLUxMdH/DyRtBUCrUr9akUp6wrubR9MD9Rf2k45l19Fpwl/GGClwoCuL
	n9Zxbv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQp9A-00000006iok-08yJ;
	Wed, 03 Dec 2025 15:52:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQp97-00000006inu-3JZt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 15:52:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62862339;
	Wed,  3 Dec 2025 07:51:53 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70CF63F66E;
	Wed,  3 Dec 2025 07:51:59 -0800 (PST)
Date: Wed, 3 Dec 2025 15:51:56 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ally Heev <allyheev@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] arm: fix uninitialized pointers with free attr
Message-ID: <20251203-angelic-enlightened-coyote-cde8ae@sudeepholla>
References: <20251203-aheev-uninitialized-free-attr-arm-v2-1-db52b2655ddf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-aheev-uninitialized-free-attr-arm-v2-1-db52b2655ddf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_075201_871747_33DA7224 
X-CRM114-Status: GOOD (  13.47  )
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

On Wed, Dec 03, 2025 at 08:52:34PM +0530, Ally Heev wrote:
> Uninitialized pointers with `__free` attribute can cause undefined
> behaviour as the memory assigned(randomly) to the pointer is freed
> automatically when the pointer goes out of scope
> 
> arm doesn't have any bugs related to this as of now, but
> it is better to initialize and assign pointers with `__free` attr
> in one statement to ensure proper scope-based cleanup
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
> Signed-off-by: Ally Heev <allyheev@gmail.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Changes in v2:
> - added Reviewed-by trailer

Ideally, there is no need to repost the same patch with just trailers added.
Sorry for no response, I plan to queue this at -rc1 as fix, so please give
me some time to officially apply at -rc1. I have put this a branch, so I won't
miss this but may need to rebase and hence silence.

-- 
Regards,
Sudeep

