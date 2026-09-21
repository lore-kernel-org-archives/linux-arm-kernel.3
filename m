Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE27C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EItOfPviNwoTdexp7cShV7ZvtjGqWZiqmfqJrXtn0RI=; b=TWuJ1nC8ypL/qRtn035KG6L9WK
	AGYVyf6Tzhu6DpFzgGyZbYLTZtlNsT/P+gIFKeWIEMVw1aYAaxZrp+uyWk0ypX4S6EQfdKIJ0Yw5j
	5mIjBYNIJfmgZHCdsNHmIJCdLZh5rcOIJHkcyVffFfv1+f30uPgj7w6tswuTAER6fF5OOP8/fZ3iJ
	4JExV5lsHrnePX4NnS4mMCjpqmqgo1MVPYvZu5IAvZ08V72zx5Iy0qGKzBwapswf7qYKYvjUWt8vm
	UA9HyXvDk3wX7Pa97u+TMHQZWmU6QZfhP10hbrY2pXO6f9rFmAzDQBrx+gDyeg9FISW7gQFm8d2Rk
	XU2FWs8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZYR-00000001N5V-0nzv;
	Mon, 21 Sep 2026 08:39:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZYN-00000001N2T-0yNj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:39:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D833F175A;
	Mon, 21 Sep 2026 01:39:03 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6E403F86C;
	Mon, 21 Sep 2026 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789979947; bh=GvzSXGOfWBYszOeMAcCGr5j7yP5kLMd+6elkwQKdA0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efjYDGOzAkbD7o9EOG0YIDSQRNlf0X871uMPY1tnZLNoJCZf/qvsYURtrwJ9TBWTb
	 teOTny1QW77hZZiN+obpSsQoG81tjC/RnEU/OL12TVF821L6JDQKsDhbPZPlBT6dhX
	 2G51pdU6TiTyLuH94XzqMuzi5zhs5hjfqCxsFJ/Y=
Date: Mon, 21 Sep 2026 09:39:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v12 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <arDtJaSvZMgpnP1t@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-2-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921053807.354802-2-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_013911_318289_BA140FF3 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, Sep 21, 2026 at 11:08:01AM +0530, Aneesh Kumar K.V (Arm) wrote:
>  MAINTAINERS                         |   1 +
>  drivers/firmware/smccc/Makefile     |   2 +-
>  drivers/firmware/smccc/bus.c        | 158 ++++++++++++++++++++++++++++
>  include/linux/arm-smccc-bus.h       |  48 +++++++++
>  include/linux/device-id/arm_smccc.h |  19 ++++
>  include/linux/mod_devicetable.h     |   1 +
>  scripts/mod/devicetable-offsets.c   |   3 +
>  scripts/mod/file2alias.c            |   8 ++
>  8 files changed, 239 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/firmware/smccc/bus.c
>  create mode 100644 include/linux/arm-smccc-bus.h
>  create mode 100644 include/linux/device-id/arm_smccc.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2414447892c..42364c540f50 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24741,6 +24741,7 @@ M:	Sudeep Holla <sudeep.holla@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	drivers/firmware/smccc/
> +F:	include/linux/arm-smccc-bus.h
>  F:	include/linux/arm-smccc.h

There's also include/linux/device-id/arm_smccc.h introduced by this
patch but not covered by MAINTAINERS.

-- 
Catalin

