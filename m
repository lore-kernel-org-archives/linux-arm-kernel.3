Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025ACD29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUzIPM8vOu4s8J0w3ekfYHrrHoU+iD7qdfawbxwCLAg=; b=rS8wn9CEuQxM4GfhHhSwxEMMgQ
	rtpBnxONe6Ia0AypE2Yqq1Wev6n3UjP2LgdIYn+xf51EGuL7hO0sMqvyCID2alxo/b4dUeyo/XCAu
	9IsXo1ccDVe2xzs68g0G9L2y3VMtwTeg85m5LsL0Pyx0qlTSDSq66SY4h7tX7xV5IEH8mooF/L8U8
	N6EcFPum8548nfGawfgoHJPUo3iFwcUHVP2tkGI7tcghI6HQo9eHxFQCqNuChpIvt/KevGah/4rUi
	pJKokHC/yDvvCPqGoIHU4YmShqb7ZtMrkGkscyivTNNHMjzmh58ApIi1hvaJazEYtIuhWsGja/w3R
	E9iGg3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr8G-00000002LlH-1EUI;
	Mon, 19 Jan 2026 15:25:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr8A-00000002Lk5-1iyk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:25:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADC7D497;
	Mon, 19 Jan 2026 07:25:18 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.32.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 265513F694;
	Mon, 19 Jan 2026 07:25:24 -0800 (PST)
Date: Mon, 19 Jan 2026 15:25:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Felix Gu <gu_0233@qq.com>, Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
Message-ID: <aW5M4SoEtLfQ4tC2@bogus>
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
 <aW0xWZ-KylipPF7M@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW0xWZ-KylipPF7M@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_072531_080056_4B41F963 
X-CRM114-Status: GOOD (  18.46  )
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

On Sun, Jan 18, 2026 at 10:15:37PM +0300, Dan Carpenter wrote:
> On Fri, Jan 16, 2026 at 08:54:39PM +0800, Felix Gu wrote:
> > When calling of_parse_phandle_with_args(), the caller is responsible
> > to call of_node_put() to release the reference of device node.
> > In scpi_dev_domain_id, it does not release the reference.
> > 
> > Fixes: 45ca7df7c345 ("firmware: arm_scpi: add support to populate OPPs and get transition latency")
> > 
> 
> nit: delete the blank line after the Fixes tag.
> 
> > Signed-off-by: Felix Gu <gu_0233@qq.com>
> 
> Did you find this issue just by reviewing the code?  I read the comments
> and then looked at a sample of four other callers and none of them
> called of_node_put().  So it's a weird thing.  If this is really the rule
> then we should have a static checker heuristic to enforce it.
> 

I agree. I see bit of inconsistency at call sites especially in SC{P,M}I
related modules I maintain. It seem to me based on the description at
of_parse_phandle_with_args() definition and various other call sites as
examples, we need to have of_node_put(). That said, I don't have any easier
way to validate these, so I am happy for any reviews and recommendations.

-- 
Regards,
Sudeep

