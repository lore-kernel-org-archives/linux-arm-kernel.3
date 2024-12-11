Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57595E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 19:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92E9bzhCmKL03/VmVJmOnCqs9X5UumhCAbHWR2zzmwI=; b=l96v6MXYgc2L8m+Jt/tJZxxLav
	WHJlbx4QzpJ7KyKQjus+hw5Gn20IhubuTFKqIw1U39UbentECXTR5AhjCuTf6fclt0ql3XDOi+/r/
	mFhRS5IE3+ZLMN9/o+tzQORzapdW2KyBq/jinKskaMDmSzBOJGYNqPGXG8x1+jSJVfLTwQgCxf+5Q
	Ln7LrZdirxxYy0rr4G2hwZ5G8I2233NouLXt7sKX7J0qYt2ZRyTjw8+V6QOxPoG2R0M4uNVi/oNhR
	3hJt+2Z5d0rNssSXiaPqBiairKpImy0MO04io7iXrrw8z7L55y4DIWX6laZWwWj7M8jFKyJzH5tc/
	5lQ0wkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLSHB-0000000Fuat-1ZZl;
	Wed, 11 Dec 2024 19:21:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLSG7-0000000FuJt-2Wa4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 19:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=92E9bzhCmKL03/VmVJmOnCqs9X5UumhCAbHWR2zzmwI=; b=NsP6vC41mks5GiL8YMECKvwTRo
	BtY416WFec4jyvH6VG72CXd1AWCGDPCtroccn4swxMfPGBO0e9YOFZ8pxlz3ck4yrZKFGdmZi4isI
	CTI78+L7hKLaBBSM9MB1O7rWxNZzTRWW2WofJSwBoTNHIhOM91s2DHpD1N9Ptwq9R4MbOGSXkJmMj
	OZKKAkTU9ILwRThKR/v+HkQkcbHM3AMw9QcRFNkqpxKMJSoa6K5+z2q9EJOxhhVzgsj2d4pnLp98h
	VfImXT+5sa2sxhhduEWRQ+RZ/yqfJhuGNy8ZGoZ6dZQuGoHEWzByt28hVWRePWR7lGK/y/1qww8as
	s2AN9JSw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRSC-00000003rQQ-0A8F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 18:28:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 434391007;
	Wed, 11 Dec 2024 10:29:20 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1699D3F720;
	Wed, 11 Dec 2024 10:28:50 -0800 (PST)
Date: Wed, 11 Dec 2024 18:28:43 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: guomin_chen@sina.com
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	guomin chen <gchen.guomin@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
Message-ID: <Z1nZPmB7nW7HUdYL@pluto>
References: <20241211134505.2218386-1-guomin_chen@sina.com_quarantine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211134505.2218386-1-guomin_chen@sina.com_quarantine>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_182856_436723_86F33230 
X-CRM114-Status: GOOD (  13.27  )
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

On Wed, Dec 11, 2024 at 09:45:05PM +0800, guomin_chen@sina.com wrote:
> From: guomin chen <guomin_chen@sina.com>
> 
> Currently, scmi_bus_id is only used to set scmi_dev.id,
> which in turn sets the SCMI device name. After removing
> scmi_bus_id, it is clearer and more meaningful to directly
> use the input parameters name and protocol to set the SCMI
> device name.

Hi,

even though using progressive IDs in devices is less readable, I agree,
we need ID in the name to keep the device unique.

It is true that we can have only one protocol/name unique pair amongst
the *requested* devices BUT it is also true that the SCMI stack as it
stands can be instantiated multiple times if you define multiple DT SCMI
top-nodes: this is already used in the wild to sort of represent
multiple virtual/physical SCMI Server backend (all anyway identified by
ID-0 as from the spec...)

So if you have defind in the DT 2 SCMI instance with both a protocol@15/HWMON,
as an example, the arm_scmi/driver.c will probe twice and it will try to
create 2 instances of 'requested' devices for 15/hwmon and both of these
will be attached to the same *unique* SCMI bus...so we need the uniqe ID
to differentiate them....same for the transport devices.

Sorry but NACK for me: regarding the readability, I could agree, but you
can anyway easily understand which device is which by looking at the
drivers/ links generated in the scmi_protocol bus directory.

Thanks,
Cristian

