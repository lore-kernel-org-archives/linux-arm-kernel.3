Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8761C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDyfHcLlbx+e9qx56Iqitzf1HzZQlnjvuoO9KrtMdgg=; b=dTZfTBNA4RrYk/qya44DxFY7ti
	gUesOBOSfDDXBlBMvjLIdfV3EQQ/JqXRbsy9CPLj60KqRNj//oyp4TF/R8ID9xwMYD9R/gv/H9AFz
	yQd09MOQLbU1cL7clnL3JPfPn5z7CsMWw6U74b57zaeD1efsYztVcXfmE2I8zdHSOxdFB7fPd+nCu
	fity5ZgtlkvN5eyw1yaUW8RZ/pf6RorKiYuEVOxHU7wqpd1ufApA3zAy7R7MD+zwXkIzubbN4R8/j
	cVsZeitZF1etppzmE2BZIHyGxCc1PALjDQ3eT4RPkmdhuiOv1f1ZI3xP+QsynaQnFKhNUqcLgbeZZ
	G4ZMAVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2cv-0000000C7QH-2BVV;
	Wed, 30 Apr 2025 08:17:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2Gi-0000000C3bX-2Dbl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:54:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 593631063;
	Wed, 30 Apr 2025 00:54:03 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 865F23F66E;
	Wed, 30 Apr 2025 00:54:08 -0700 (PDT)
Date: Wed, 30 Apr 2025 08:54:06 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org, johan@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/3] firmware: arm_scmi: Add Quirks framework
Message-ID: <aBHXHnXA95TwJths@pluto>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
 <20250429141108.406045-3-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429141108.406045-3-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_005412_613081_3B4AA980 
X-CRM114-Status: GOOD (  10.67  )
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

On Tue, Apr 29, 2025 at 03:11:07PM +0100, Cristian Marussi wrote:
> Add a common framework to describe SCMI quirks and associate them with a
> specific platform or a specific set of SCMI firmware versions.
> 
> All the matching SCMI quirks will be enabled when the SCMI core stack
> probes and after all the needed SCMI firmware versioning information was
> retrieved using Base protocol.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi

just a quick remarks that a bot spotted the usage of __VA_OPT__ which is
only available since GCC >= 8.0 :< ... so I will probably revert to use the
previous, less clean, mechanism to build the NULL terminated array in
which the compats array WILL HAVE to be explicitly NULL terminated when
provided (even the empty ones...)

Thanks,
Cristian

