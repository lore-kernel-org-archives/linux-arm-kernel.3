Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79943C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcNwI59TruOWtVEft+HbQnaZ29UkgKC9vGGUwXv/TdU=; b=rJSHv6dL+gmuZzRnySMQ23BFol
	i8hRrmLdNcDdsjMbKRNegRLxbgYCcDZjrINCyGbBEx5v2ez2BNq/8OJMrAI+rtXpfNtdPxYEqjbah
	+6N0gvumje96gZSn6SaxubwRuUPh0JDjJt5AzP4YAodAKS8zmi67jKi00q047GfhodF/YxMDjwWm1
	mVEJks019koyh7+dOQTxHKkL8BcT0HjvC9L3bksq4fBk1ZCDTYXKGmmB7XQ07/kcSVteRyRc/K3EI
	d/cMXUuNc5MPytHFrslcDVHZBJVDC0ZNQlhMO1lhFsYLalKAnGsQB3QFJhgPyIaNcuw4s1o3uoA3i
	olKYkpGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzDZ-00000000bqX-1w0U;
	Fri, 30 May 2025 12:52:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKz9n-00000000b1C-1bBS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 12:48:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E62F16F2;
	Fri, 30 May 2025 05:48:02 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B243F3F673;
	Fri, 30 May 2025 05:48:17 -0700 (PDT)
Date: Fri, 30 May 2025 13:48:15 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/7] firmware: arm_scmi: move boiler plate code into the
 get info functions
Message-ID: <aDmpD9qz-4RUXvFq@pluto>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
 <8bee4505bdc1d74e62533ed9975dc4500b2cfe53.1746443762.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bee4505bdc1d74e62533ed9975dc4500b2cfe53.1746443762.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_054819_462656_EE5FBA69 
X-CRM114-Status: GOOD (  14.57  )
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

On Mon, May 05, 2025 at 02:37:22PM +0300, Dan Carpenter wrote:
> This code to check whether the selector is valid and if the item has
> already been recorded in the array can be moved to the
> scmi_pinctrl_get_function_info() type functions.  That way it's in
> one place instead of duplicated in each of the callers.

Hi Dan,

thanks for this.

> 
> I removed the check for if "pi->nr_groups == 0" because if that were the
> case then "selector >= pi->nr_groups" would already be true.  It already
> was not checked for pins so this makes things a bit more uniform.
> 
> I also removed the check for if (!pin) since pin is an offset into the
> middle of an array and can't be NULL.
>

A much needed and appreciated cleanup. LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
 
Thanks,
Cristian

