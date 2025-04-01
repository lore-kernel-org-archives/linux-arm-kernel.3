Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEFCC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3u5KPB8g1UKvvqA8vB6epeTkayE9kNOIoRw4sBjIkk=; b=1G2SD/3g99JC9yQ7O4K/3ws4qc
	slQiUzTgbTdmp/PFxRhTTTME18kuAuo94jMK0eMrA2cVzmIrbaYMYrG5qkM93mtjEn951GfeJFHi1
	dY+73lL29JT7I3ii+Veis8JNxwKJfxPmY3Tjrx6kgz8yZZKD09ppyf52+X9kXQDFtNV7mTsTK/cKI
	qrFy3VBzffYbuxHV6Lan+Qmq18gOc9aXIFihp54W266imRWvEqVl9TPKTcMIVLacacw2d/a/rIEaG
	KUJo7HAvjh57AhhYBmE3fXQ6zCvUmZQRKKpEJhNts6oEngRku06G7xmmVwyt4Bb+ZG4RiWQKj3NN3
	URPNNkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbG4-00000003NkK-3kCV;
	Tue, 01 Apr 2025 13:02:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzb9l-00000003Mbj-3ldZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 12:55:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B52AD150C;
	Tue,  1 Apr 2025 05:55:54 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 409373F694;
	Tue,  1 Apr 2025 05:55:48 -0700 (PDT)
Date: Tue, 1 Apr 2025 13:55:45 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Quentin Perret <qperret@google.com>
Cc: Sebastian Ene <sebastianene@google.com>, catalin.marinas@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>, snehalreddy@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, will@kernel.org,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v4 3/3] KVM: arm64: Release the ownership of the hyp rx
 buffer to Trustzone
Message-ID: <20250401-innocent-outrageous-deer-0946c5@sudeepholla>
References: <20250326113901.3308804-1-sebastianene@google.com>
 <20250326113901.3308804-4-sebastianene@google.com>
 <Z-Qv4b0vgVql2yOb@google.com>
 <Z-UcW32Hk6f_cuxc@google.com>
 <Z-aKgXVjp4nNJcLd@google.com>
 <Z-avzxyyOiaIk3-C@google.com>
 <Z-vVZt6RTNX90uEw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-vVZt6RTNX90uEw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_055553_986036_65AD8F35 
X-CRM114-Status: GOOD (  18.50  )
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

On Tue, Apr 01, 2025 at 12:00:38PM +0000, Quentin Perret wrote:
> On Friday 28 Mar 2025 at 14:18:55 (+0000), Sebastian Ene wrote:
> > 
> > If we apply what I suggested earlier we won't have an issue with the
> > semantic for this call but it would make the code a mess. I don't think
> > for this particular call keeping semantics really makes a difference.
> 
> Right, if we implemented the release call properly in pKVM I'd be happy
> with this patch, but I just don't think we should only do one half. We
> either do it properly in pKVM or leave it with to the host -- the latter
> feels simpler to me, but no strong opinions.
> 

FYI:

As part of the earlier discussion with respect to clarification on this
from the FF-A spec, I found even the driver was not handling this correctly.
I have posted the fix since and plan to get it merged as fix for v6.15

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/r/20250321115700.3525197-1-sudeep.holla@arm.com

