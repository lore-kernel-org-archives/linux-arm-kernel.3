Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0E3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWPeXqc7da8T6UngbvlcqLBzHtr9r2EtpP+FB5smiZM=; b=vCHpK9YhGdHq4vR1Qwqi93Wpk/
	ASnghphm03zzq6Uom0QLQ9nDGTQ/J5364R7ztKns2GfWbtJM/8kT0OBTE0Cs2XaawovXa7sM0N/r9
	vWcIRWdPda2U+Nw/58r7P9YEryvWKSQRDmeVNRrGdqw9TsMU3FbJZGB1ymjNRJKn6lxo+yosXMxlj
	ofAVG/REq+bXx0uXNdRxN6IkZXCd2FNsqbjeK3W3y+d0ObR+6Rl2FF79ojrpu7lU/eeryBsT9/UKJ
	oSFm1loxKdq5eYje4ey+oVmy2+64Wdpx+ihJ/suTOKx9VmV6sp7vCRe811Mkobc9x0XFIX/7djuLy
	A72aIqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjzK-0000000BarR-0OUW;
	Thu, 13 Mar 2025 14:56:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjxf-0000000BahJ-0g7z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 14:55:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CFD01516;
	Thu, 13 Mar 2025 07:55:12 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C8E63F694;
	Thu, 13 Mar 2025 07:55:01 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:54:56 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: lcherian@marvell.com, coresight@lists.linaro.org,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/7] coresight: Convert disclaim functions to take a
 struct cs_access
Message-ID: <20250313145456.GR9682@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-3-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211103945.967495-3-james.clark@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_075503_248278_C53B08F1 
X-CRM114-Status: UNSURE (   6.90  )
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

On Tue, Feb 11, 2025 at 10:39:38AM +0000, James Clark wrote:

[...]

>  static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
>  {
> -       return coresight_read_claim_tags(csdev) != 0;
> +       return coresight_read_claim_tags(&csdev->access) != 0;
>  }

Likewise other claim functions, can coresight_is_claimed_any() change its
argument type from struct coresight_device to struct csdev_access?

Thanks,
Leo

