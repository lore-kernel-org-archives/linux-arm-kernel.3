Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45256C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gh9znaemej2ebTYyF4AgCaUdWFG09lPGQkBE3YiACFs=; b=w1IvIbLsYX4PwOjkz48+g6hYOf
	Pzb3zUpxN816EE6rI4QTPlBw6QPonQ16eKz7Zlb8TKf2ABjGKwgA5qtfhw6rsHFrqxDEQxsbP/ErK
	OlyD2k63+NatG6bwWWl8h6qLgjI36Q2fgOC+zvy6RxckxqFZK8slKqyMULgT5gIf2Fj+W76Q9u0sn
	7pdGIYrG064WzzqjlJvUEPrja0orXQ+/0vIAEa60nGiBU5I9buvhjpAJ8SEaU31Eg5yJFjO7nkRxW
	HfHMYREePtHz6xG7Wn1aXS2IVO+vBxlarh4ofc/TjES/UPymlDm6dAaRtHFd1B5KVFtJmXyP//W3B
	Spz43GLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zvl-00000001R4n-0uhF;
	Mon, 21 Sep 2026 09:03:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zvj-00000001R4Q-2hek
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:03:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68540412E1;
	Mon, 21 Sep 2026 09:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BF81F000FF;
	Mon, 21 Sep 2026 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981399;
	bh=gh9znaemej2ebTYyF4AgCaUdWFG09lPGQkBE3YiACFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GVj+/jF3q1YjJ5WBqJ4M0vvDiXAZIK8+FRFrOp/5IQN65WVRuVWo1IlGH4pb4fAN3
	 ih9Hv8pXP31hmbOBzJMUqOPHXGxZg08bV9B6qUIzRJ3/sf3N+VUWkOgX5PvT1cbm6S
	 haX8D1l1bUPQRTf4hxDZl6OWuAF+ewkwLLot4+RGi0G/iqyXIqCEqKHP+Kn68S2VEd
	 D872xUL/MsaVq7bRdM+Tjw7SpV9KeVUDqfzsJhieQffGRyXbKTFI3K5jKlitv2xrhR
	 X9G0MddNq/ynKxBcsL8U5ny6Y0zW28tTlCIEAz28wbLEsT+y0akd4IXEp23NO3fODa
	 L18ZmeGXsMUoQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v12 1/7] firmware: smccc: Add an Arm SMCCC bus
In-Reply-To: <arDtJaSvZMgpnP1t@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-2-aneesh.kumar@kernel.org>
 <arDtJaSvZMgpnP1t@arm.com>
Date: Mon, 21 Sep 2026 14:33:09 +0530
Message-ID: <yq5aa4pb3rjm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Sep 21, 2026 at 11:08:01AM +0530, Aneesh Kumar K.V (Arm) wrote:
>>  MAINTAINERS                         |   1 +
>>  drivers/firmware/smccc/Makefile     |   2 +-
>>  drivers/firmware/smccc/bus.c        | 158 ++++++++++++++++++++++++++++
>>  include/linux/arm-smccc-bus.h       |  48 +++++++++
>>  include/linux/device-id/arm_smccc.h |  19 ++++
>>  include/linux/mod_devicetable.h     |   1 +
>>  scripts/mod/devicetable-offsets.c   |   3 +
>>  scripts/mod/file2alias.c            |   8 ++
>>  8 files changed, 239 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/firmware/smccc/bus.c
>>  create mode 100644 include/linux/arm-smccc-bus.h
>>  create mode 100644 include/linux/device-id/arm_smccc.h
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c2414447892c..42364c540f50 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -24741,6 +24741,7 @@ M:	Sudeep Holla <sudeep.holla@kernel.org>
>>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>  S:	Maintained
>>  F:	drivers/firmware/smccc/
>> +F:	include/linux/arm-smccc-bus.h
>>  F:	include/linux/arm-smccc.h
>
> There's also include/linux/device-id/arm_smccc.h introduced by this
> patch but not covered by MAINTAINERS.
>

I didn't add it because I couldn't find any other device-id files
tracked in MAINTAINERS.

-aneesh

