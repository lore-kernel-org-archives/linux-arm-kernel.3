Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BE2C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OB03u212i8lOlZ/c8ffsUOGIm8EQW+edq75o0mXrNSY=; b=49vKgTMJbwZMJn5Ix3Kjus+zVS
	Ut82JGTXbMXew3XkLfFKhJojv6YrxeWi0CT9YIiqKXnDhpenFxutaRuLxU3811gY9WujjzHchskhE
	l6mrbtuZXxxSpzWxs6zEIpOWN9Xe4/5tix3Gi2W1HDOjNG8lyJt9+z7PAbptGwA7/6EFy9IgvstJb
	fPutSfSv2l7E1srKTlbOVpxGvrquKS9DI7zkkVvLwSJZ3Wv7nj+RO+MmszKH+I/52G93WyHr9GzpJ
	NEtlyPZLYGNMFqxFE0/tcRp7f6qnOAhOxRZbM2KhTslGhlfz8ATjjBfvai6wlN3m0rHPYPJcNR+bQ
	EFRVpiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZ6A-0000000A4ca-02xu;
	Wed, 22 Jan 2025 11:40:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZ4p-0000000A4Uf-08l9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 11:39:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BC921007;
	Wed, 22 Jan 2025 03:39:44 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EDFB3F66E;
	Wed, 22 Jan 2025 03:39:14 -0800 (PST)
Date: Wed, 22 Jan 2025 11:39:11 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Partition info can returns self
 as well
Message-ID: <Z5DY3xC5nhH1Grbn@bogus>
References: <0bc7e1754db0547c6c041ed178cf24ca326af2d1.1737522729.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bc7e1754db0547c6c041ed178cf24ca326af2d1.1737522729.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_033919_115876_A23297F6 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jan 22, 2025 at 10:53:42AM +0530, Viresh Kumar wrote:
> Partition info may return self partition as well (specially with newer
> versions of FFA spec), skip adding it twice.
>

I have a patch[1] in my branch that I was planning to post after the merge
window. It does this in little different way so that the host partition
gets registered and appears in the sysfs though there might be no driver
bound to it.

-- 
Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/c/27cce7b926f8d8b8020a089fcc55b5061093a9f2

