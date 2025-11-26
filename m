Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F02D10F55
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6TXj88pT79Ji4c9P5GR/lSVInBo3iyb9JfIKcbSTcg=; b=fu94LF9lW+QdvZ0mwLpHn08wu8
	Syuhj032DBs+WPfuGRVU1ZLcq9Eewu7ofeteo/W5GE9jcZwobUn1y9a0yGaWYomz2OsXrdepCbiyS
	fValL2y6Ov9NQa2W2OY7LFZdJ4478Ny5Kmnr7M67xnjnyS7u4FV47HfvNGRCJrVEBR6L2Wekpkeki
	NMbE+QGluezigcnJTxQ3W648VPQyKFt3bk06dEUaoJZ3Tmm9G0t71zb1WbY4XCqsyqfpuTcNqaU1W
	kvPJ/+ME7+mSETPNUTUnOQFQr956ahSBwQsQlq9dZC2lGOzKC0vCKDBAMYs56GQE15IOHXVTEHZVB
	Vqen/FJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOG4b-0000000F4Iq-1ZiO;
	Wed, 26 Nov 2025 14:00:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOG4Z-0000000F4IQ-0Y7O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 14:00:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFBAA168F;
	Wed, 26 Nov 2025 06:00:33 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B07783F73B;
	Wed, 26 Nov 2025 06:00:40 -0800 (PST)
Date: Wed, 26 Nov 2025 14:00:38 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Message-ID: <20251126140038.GJ724103@e132581.arm.com>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_060043_230450_5F54ED2D 
X-CRM114-Status: GOOD (  17.54  )
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

On Wed, Nov 26, 2025 at 10:54:29AM +0000, James Clark wrote:
> Do some cleanups then expand the timestamp format attribute from 1 bit
> to 4 bits for ETMv4 in Perf mode. The current interval is too high for
> most use cases, and particularly on the FVP the number of timestamps
> generated is excessive. This change not only still allows disabling or
> enabling timestamps, but also allows the interval to be configured.
> 
> The old bit is kept deprecated and undocumented for now. There are known
> broken versions of Perf that don't read the format attribute positions
> from sysfs and instead hard code the timestamp bit. We can leave the old
> bit in the driver until we need the bit for another feature or enough
> time has passed that these old Perfs are unlikely to be used.
> 
> The interval option is added as an event format attribute, rather than a
> Coresight config because it's something that the driver is already
> configuring automatically in Perf mode using any unused counter, so it's
> not possible to modify this with a config.
> 
> Applies to coresight/next
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Tested on Juno-r2 board (though all timestamps are zeros but it still
can record timestamp packets):

# perf record -e cs_etm/timestamp=15/ -- ls
# perf script -D | grep I_TIMESTAMP | wc
   1324   11916   84561

# perf record -e cs_etm/timestamp=14/ -- ls
# perf script -D | grep I_TIMESTAMP | wc
   2415   21735  154205

# perf record -e cs_etm/timestamp=1/ -- ls
# perf script -D | grep I_TIMESTAMP | wc
   130743 1176687 8359898

# perf record -e cs_etm/timestamp=0/ -- ls
# perf script -D | grep I_TIMESTAMP | wc
      0       0       0

Tested-by: Leo Yan <leo.yan@arm.com>

