Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150D8C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8ni1mTjcmqpvOY7RCC+MUPFEJ2xM3IZ63qC+OEFKHE=; b=0INedkFeIQqywToJeCfNhmtAX0
	oze8I7F6h1a7POv/JcXAVYMwWAjLNSSR8sya3l7mEfiaRwBIBR061EsBGfDAdCd6p9fLmN/Cr19KX
	g/lzEvaBMPFG/D3s3zqxGpWMskF/axZf2a83F8Jx+C0+r/ajfUoJ2wHVYbuV8BQbsv2io7OnZcxeY
	rGhSqB76ecCsYEiAywsSjzNLHqFAAVP4U3f1LDP0l7vPWinEeN0ZZ8KFyKfNQk7FZmj2cwEMJi3dQ
	+0xzDSSuL9D1Q7Dwqs7q7XoZ3vStqeVv3yz6EuzrXL6QUrJMzM2fdQy6/lmxc4wLNt6ppEpOH3I04
	NPAtAnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6U5T-00000006vNi-2Dk6;
	Tue, 15 Sep 2026 14:24:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6U5S-00000006vNX-1DUl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:24:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A49360142;
	Tue, 15 Sep 2026 14:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101B41F00893;
	Tue, 15 Sep 2026 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482281;
	bh=r8ni1mTjcmqpvOY7RCC+MUPFEJ2xM3IZ63qC+OEFKHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xnxod4DOMtCyHNYu4mfTEoMlhoPIanminlnmb1fiFjHYTeZ7ThdTSps80279avO1u
	 b4N0EufvOv7WmY3kZpA4RPVwyS+4rekY7GCqjndmdbmFEFgdmbdJ1iEqo/iaHaNrGl
	 CnWXR0ZTfoOfJvSbVtPUnMbojU3MhLURDZixs0PBlXOfdXEiRUZ8vZtQugkhlowATt
	 PYhEwHvu0fUwEQwu4O660jheTPSwyrWjwfKzm45z6nuKpbGt81eR9sjjX4ilYnooFE
	 aCi+tNsYY43VYQiiUcwfY6l97aw1tH+Tjc3YhmWxOhRayq0n4NSCwKi6PmgBhHaznZ
	 Yl840I+Pvty5g==
Date: Tue, 15 Sep 2026 15:24:37 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] firmware: arm_scmi: fix module auto-loading
Message-ID: <20260915-origami-ibis-of-love-adaac1@sudeepholla>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
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

On Fri, Sep 11, 2026 at 05:23:25PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v6 of the patch series fixing arm_scmi module autoloading this
> combines:
> 
> 1. Patch 1/4 from Bjorn to add support for scmi bus modaliases to modpost:
> https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/
> 
> 2. 2 SCMI bus code bug-fixes.
> 

I had a bunch of SCMI bus/core driver fixes merged into v7.3, please
rebase these changes on v7.3-rc2 or above and post.

I am interested in getting it tested by few people who were asking for
this feature. I haven't looked at 1/4 or 4/4 but they look not to
complicated or controversial.

-- 
Regards,
Sudeep

