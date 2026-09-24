Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF49C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQQt5zTm31incgpPNU6yRG9PMJPNleN1QlXN71hH4eE=; b=boOqhB7k08TOVsYA1UQoirdUKC
	xUs/bkKP6LtX1a2ET3b7Qp2EUPpeFOjjwmNyPnCW0jheA3sELQz6idO4YeycMkRHkuHbjVbWw60JI
	wpPANnXDiCjHLtlrS0LIhPJ2p9LcC/WDfj4XsT8H9pZf22I9BhCRqn0kDUZqoeTP7HuYpZTv958Hm
	hvgSEx64a6kG4ew4k1sTXL0XhIec2h4uTi86I9aLI541boDYkyaxNfLo4ABn/BYlnXIA1nPQmO039
	Gm3EhtjR8IiTxpSY8RpHfa6+UMI5eihAoRwP/GWSFhEVFya8oSZG2srtt/fQPhYyoSbiCB5xMQKDG
	x6ButpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lyq-0000000BXqm-2VTn;
	Thu, 24 Sep 2026 16:07:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lyX-0000000BXhH-0Gcg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:07:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71F604149E;
	Thu, 24 Sep 2026 16:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACD91F000FF;
	Thu, 24 Sep 2026 16:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790266028;
	bh=UQQt5zTm31incgpPNU6yRG9PMJPNleN1QlXN71hH4eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dgRoCIE2qmrh6A7OlazIDECGB6B7PK1iK+ZENbVSoaqbUZm64tkS/cgNcy2HldiGU
	 Nopce9obSu7P5dapJP88xrCJoNrgFBUYBjgREOdnULW6qKvGc6a0eYBr+j/XnzMGFz
	 oDo2HA6WXhDInySGdkm3aalp0O3cA020pqJ9JbP87ZP1xsN+jdsVt1DU6/OVDT36JF
	 eFnZDOOWDXQw+wpKWC0wECZmtysonFz4wV/mINcvDpi7a8iwg+OIlN7MnvGHWCxQio
	 R8hhQJF4oroUcqF7dzqNVT7ORKFhtOqSvkSxxX/+lA242rRy9UXlKKQoI/hcIxCu+6
	 P+7NkWUxEOZlQ==
Date: Thu, 24 Sep 2026 17:07:04 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Dat Mach <dmach@nvidia.com>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ACPI: arm64: FFH Operation Region support for
 FF-A (offset 2)
Message-ID: <20260924-private-bobcat-from-wonderland-0db8f6@sudeepholla>
References: <20260901192906.133670-1-jamien@nvidia.com>
 <20260922-purring-fennec-of-exercise-bbce5e@sudeepholla>
 <20260922155211.676134-1-jamien@nvidia.com>
 <20260922-exuberant-earwig-of-opportunity-4fecff@sudeepholla>
 <20260923124050.3270801-1-jamien@nvidia.com>
 <20260923-lurking-pony-of-fascination-ac6c49@sudeepholla>
 <20260923173240.3710620-1-jamien@nvidia.com>
 <20260924-tall-oryx-of-attraction-23ada5@sudeepholla>
 <20260924152321.3864148-1-jamien@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924152321.3864148-1-jamien@nvidia.com>
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

On Thu, Sep 24, 2026 at 08:23:21AM -0700, Jamie Nguyen wrote:
> On Thu, Sep 24, 2026 at 10:39:24AM +0100, Sudeep Holla wrote:
> > Which version of FF-A is being deployed on your platforms?
> 
> We have platforms with FF-A firmware versions 1.1, 1.2 and 1.3. The
> platform I have been using to test offset 2 reports FF-A 1.3.
> 

Thanks, will think a bit on this and see what is the best way to progress.

-- 
Regards,
Sudeep

