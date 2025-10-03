Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A68CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfrD9pP/jab13Ti4AK6K6sVRA5oPdxYdwy7ZZYOpIUU=; b=lQ1EV8kYAy19/u2u9yVztTnD3J
	tozRYwMh8nNcW4hr2R+kQtEo4ZLILglOUh6MBt/iicwSQWp4zCr+DZ6fyuGqKHpY2LsrQjkqW8bvR
	v8njgEu1aFqcxLK+7b6IRM92QEqUo4LTFyBQ3CwE5C/53JeNMURuZmg/oMxBAjIRY77O7g1+p4QQH
	LdI3ySXjEB4yomFY3dpoyrAj3l82HM1BDy7z6r7uFtfcYHV5MycWf5HWEqed72elgZjgJ7JU9Q0fR
	RV7sH7NQUsysQx9ytn/fK/C9YfT0DWy2DE3VwoBLgF+MTqE5CkQ8+ncOqkREixsH+g5CFqn5SDSV7
	fkMxKeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gNC-0000000CVlI-0xgn;
	Fri, 03 Oct 2025 14:03:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gNA-0000000CVkv-1g59
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 14:03:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D2DF1655;
	Fri,  3 Oct 2025 07:02:51 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E7963F5A1;
	Fri,  3 Oct 2025 07:02:59 -0700 (PDT)
Date: Fri, 3 Oct 2025 15:02:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 12/31] coresight: sysfs: Validate CPU online status
 for per-CPU sources
Message-ID: <20251003140257.GZ7985@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-12-ea49e91124ec@arm.com>
 <CAJ9a7VgJV0pZVkW=z9EseMDDgAz5ippkOZZ_Pm5Z8VvTCQ7Z4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VgJV0pZVkW=z9EseMDDgAz5ippkOZZ_Pm5Z8VvTCQ7Z4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_070300_478734_87B1708C 
X-CRM114-Status: UNSURE (   8.43  )
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

On Thu, Oct 02, 2025 at 01:45:16PM +0100, Mike Leach wrote:
> V Minor issue - could this not be part of the previous patch
> introducing CPU ID to csdev?

I can squash this patch into the previous one.

Thanks,
Leo

