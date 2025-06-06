Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EA4C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TI7ReOvGJ5COYUvWwmvMKGhAbeu9wc8Mh/hspXlCgh8=; b=qO6U2/sOSmKeWNOsMgHNCXGLgJ
	JAX0uVWoZwQOvuK0JdIRSXIrRdC16SZw1Z+QvaRPo0+n0/lYJ0+2PnOmjHR7YVfXCiImlpyXZFI3T
	LNAdVQWXtU0zTepCuv7I0Aff7Ammqe6BJZnIxLkYeYLxf0sGxEKmqVYYJ0doJYYfbHBXQiTcc0NEz
	MRV9IUG6qdkKmOPEYPA1x9FM9iVPpY7MQ5WoEd7+lMVXrMp9FT2QCLH+ET1GUmkvpb1Ki/XF1HAlQ
	aI3H8JcIOifZxs46BQ5t3qfYcgc5C8SdHixTMZ3hDxFFPFBAGnP8MDODePp6FCgNvCFKC7kx66PCl
	OBx6/Vaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTWb-0000000HY3f-132s;
	Fri, 06 Jun 2025 09:38:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTGZ-0000000HWBz-3i6x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 09:21:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2C94153B;
	Fri,  6 Jun 2025 02:21:16 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A85D33F59E;
	Fri,  6 Jun 2025 02:21:32 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:21:29 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
Message-ID: <20250606-charming-aloof-adder-8acc6d@sudeepholla>
References: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_022135_961290_5292C715 
X-CRM114-Status: UNSURE (   9.57  )
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

On Fri, Jun 06, 2025 at 11:08:02AM +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> There is no need to introduce the boolean power_on to select the constant
> value for state. Simply pass the value for state as argument. Just remove
> this code clutter.
> 
> No functional change.
> 

Nice cleanup. Thanks for doing this.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Ulf,

I assume you will pick this up when you start collecting patches for
next merge window.

-- 
Regards,
Sudeep

