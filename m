Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BEAC36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KDnfg5hX+YYaANAOn/uAzZWRQgGlSnJfV+a1tUMyGc=; b=4nCjYp6hFFm+CXQTNJnT875Of+
	MmDOZFxJjFASyB2EfvoXONNDURmjH69ADc7ayQ6hx/0JWVyL7JyCsqt41I6kkuevqr+lDGHrNjmvO
	4gChQFQjNgDCU+3STSc+pCPjjazp2JyfqNDy+GWk1PKcY+OZP7zPEttBKCJ0do5QF88olGKEaDLrt
	c9r5dQXHArdHfhU+Z+CqLJ2yqauLUux2W5Hs4tsNZ2uDjfQTtNYCWG8mUK61yHITrKiX+HNUoeDib
	ogNEHb+ovZzqgJCkKyY8Giy889ww79uG6/44FsF4ASXBPpONIrdoOkGGoSbQC+xt80MAiUZHJXlCr
	/QwjmkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvqq-00000005rPp-3a6p;
	Wed, 02 Apr 2025 11:01:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvp3-00000005r6w-0GG8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 10:59:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F943106F;
	Wed,  2 Apr 2025 03:59:54 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2C6C3F694;
	Wed,  2 Apr 2025 03:59:49 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:59:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402104254.149998-1-dev.mbstr@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_035953_162380_D2DE6DCE 
X-CRM114-Status: GOOD (  10.52  )
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

On Wed, Apr 02, 2025 at 01:42:54PM +0300, Matthew Bystrin wrote:
> Add timeout argument to do_xfer_with_response() with subsequent changes
> in corresponding drivers. To maintain backward compatibility use
> previous hardcoded timeout value.
> 
> According to SCMI specification [1] there is no defined timeout for
> delayed messages in the interface. While hardcoded 2 seconds timeout
> might be good enough for existing protocol drivers, moving it to the
> function argument may be useful for vendor-specific protocols with
> different timing needs.
> 

Please post this patch along with the vendor specific protocols mentioned
above and with the reasoning as why 2s is not sufficient.

Also instead of churning up existing users/usage, we can explore to had
one with this timeout as alternative if you present and convince the
validity of your use-case and the associated timing requirement.

-- 
Regards,
Sudeep

