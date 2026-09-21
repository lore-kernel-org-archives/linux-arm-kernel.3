Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E647C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/edLhwlXxK5WLjsufiNiRMm+DEeITmeYwM/BGG2po/Y=; b=t5i0EIn/QChoKS7Emhn4IzTyXt
	+scfXg0vqJyAvxrveMSfwGwQbUCrEPppzMSzw5E1V6CFAmRRhrno8EdDMR81kthpN0Dn9MxLmBnRu
	RkRy1r/CjKIwLWvAavXGB5RSVOsJAHiltT0NMvjIRzRUsj3FY9VKfWGl01ZV8Ln+9PIYwmBoX6bLu
	LqhL/2WSOCwvdrNviqWfrCjQa+TQriQAdez8Fkcvr9ITg8bcPxJruS6SOLvtfZnhKo+RCF9AJJIAd
	8j4sk3PbSfdOPLXhXv05iHvIi+ioDfMlpVg8TgvzSSn3SCl3Jky1+sKW6zBEkEAMXH66DlgEJ65s8
	QxkBYcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zu4-00000001Qos-3Rhh;
	Mon, 21 Sep 2026 09:01:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zu1-00000001QnX-1RkQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:01:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B97E142DB6;
	Mon, 21 Sep 2026 09:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90091F000FF;
	Mon, 21 Sep 2026 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981292;
	bh=/edLhwlXxK5WLjsufiNiRMm+DEeITmeYwM/BGG2po/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Chhjx5IPpvXRMaHsZG/SYYAZuH7PK7n2Ec/3Da0nuAZu2Bk861eWfapQfsfDdsl/7
	 rsyyZPgxGIf57xVvjWO+fVXbki6UkV55Fmn6mvwB4D9GANc4KKcR1h18C1/Uwrhg8n
	 3ZYxlX/sV4K72MH/TPfb7Rwkb2unicftgkfsccl/HFKx91WR+XbP2J0OP58zinaVnE
	 5r7eUrIN4ALdbOQBuqhLZWsfVvRBir7ZoN+3kPzIlXtrpekUxIdetWfpa+p0C1cm5W
	 /5dtahPFzZVR8zMWnY+OXQ6nYGcCJwMGjB6ZYhAqUQIkNlCmrN/UETOFx03GGlmWBz
	 MWSKb8uHoLXpw==
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
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
In-Reply-To: <arDuqtfrRcBmWRic@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-3-aneesh.kumar@kernel.org>
 <arDuqtfrRcBmWRic@arm.com>
Date: Mon, 21 Sep 2026 14:31:24 +0530
Message-ID: <yq5acxu73rmj.fsf@kernel.org>
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

> On Mon, Sep 21, 2026 at 11:08:02AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
>> standalone platform device. Now that the SMCCC core has an SMCCC bus,
>> create an arm-smccc-trng device for the discovered TRNG service and convert
>> the hwrng driver to an SMCCC driver.
>> 
>> The SMCCC id table preserves module autoloading for systems where the TRNG
>> driver is built as a module.
>> 
>> The sysfs device path changes from the old smccc_trng platform-device path
>> to an arm-smccc device path. No known userspace dependency on the old path
>> was found; a Debian Code Search lookup for the existing platform-device
>> name/path did not find any users.
>> 
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> Tested-by: Andre Przywara <andre.przywara@arm.com>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  arch/arm/include/asm/archrandom.h       |  2 +-
>>  arch/arm64/include/asm/archrandom.h     |  2 +-
>>  drivers/char/hw_random/arm_smccc_trng.c | 32 ++++++++-----
>>  drivers/firmware/smccc/smccc.c          | 62 +++++++++++++++++++++----
>>  4 files changed, 76 insertions(+), 22 deletions(-)
>
> I asked you two times already to cc the hw_random maintainers. Not
> adding them again but not merging this stuff without their ack either.
> So, up to you.
>

Sorry, I missed that. I'll repost and Cc the hw_random maintainers.

-aneesh

