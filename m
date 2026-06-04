Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25688CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns6EOiv/DbO2oyNf7BQsADHvEVxuPqFiM2RPQ8DKZeY=; b=sXd2CBorS4pw0sbxIEhbhX6q7X
	KIikFb98LkGTeqJYa6e1UJTHWWQpqyPCSG1I2WiqiRctQ3DKqH3li/o8ljdxPjhb7tav/+4VGPL8f
	jwfdO4RLOfLpmbLqLsf0GERFC6kDHgau6jh7Vh7k9R4nI6IOvPbgTwQTApx9vZtlZDmMYLU0+WcWG
	Pg71fN+xLrPFJ/oBH7gHSWT0E3evMxqEpyWkkoZ2KumY0VL56X/EJGeVOkuFL1DrLgpsCa/WIC+Bz
	Ky9GwB9zfaK+H55GfgNrjysnBvrlUKwfTMLItKM/rTc9dq738c2eTyNTnjrIIIc0BcbA3H3jaXA91
	ppOrEYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7f6-0000000Gkfu-1dkT;
	Thu, 04 Jun 2026 12:59:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7f5-0000000Gkfo-1PDL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 12:59:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACCD5400B6;
	Thu,  4 Jun 2026 12:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6231F00893;
	Thu,  4 Jun 2026 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780577942;
	bh=ns6EOiv/DbO2oyNf7BQsADHvEVxuPqFiM2RPQ8DKZeY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BEbFpXybcDnZt90rF1wHgq0+lDe5SGsffyAP9HouNZYlR/6fmN9ghOtswpIcmXhlQ
	 GeTq8s/B32fY8atHayl/nczGINGnHSlBiSHTSZc0y6DjJZirhd5lJDUF4NjmSVvjPv
	 /NvOUHqxu3cPrJLAzXoyk3Gm9c/4fj+ag7FZanFRg0KWZzp6aH8wYpDno/I7efHozt
	 J/12RRLCaSuupTwxWP0eNNYFBJuaoioRwgGnZEpqtL5e4SxHL147nwFiv3qvZ2yJ1/
	 oTw0Zkk4uzvAcHeAL2N1BOnomgYVfWL4ZpcTFC/n7ZXV0zk8zS04q5wRRIY6rCt4PW
	 NnNML3iCU7Tag==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: gregkh@linuxfounation.org, linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 0/4] Switch Arm SMCCC firmware services to an SMCCC bus
In-Reply-To: <20260527100233.428018-1-aneesh.kumar@kernel.org>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
Date: Thu, 04 Jun 2026 18:28:54 +0530
Message-ID: <yq5av7byqx69.fsf@kernel.org>
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


Hi Greg,

"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:

> As discussed here:
> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
>
> The earlier CCA guest support used an arm-cca-dev platform device as a pure
> software anchor for the TSM class device. That platform device did not
> correspond to a DT/ACPI described device, MMIO range, interrupt, or other
> platform resource; it existed only to make the CCA guest driver bind and to
> place the resulting TSM device in the driver model. The same pattern also
> exists for smccc_trng. Creating separate platform devices for such
> SMCCC-discovered features is misleading, because those features are not
> independent platform devices.
>
> This series adds an Arm SMCCC bus for services discovered through the SMCCC
> firmware interface. The bus provides SMCCC device and driver registration
> helpers, name-based matching, uevent modalias generation, and a sysfs modalias
> attribute. SMCCC service drivers can use MODULE_DEVICE_TABLE(arm_smccc, ...)
> to emit arm_smccc:<name> aliases, allowing userspace to autoload service
> drivers when the SMCCC core registers matching firmware-service devices.
>
> The series then moves SMCCC TRNG and the Arm CCA guest RSI service off the
> platform bus. When the SMCCC core discovers the corresponding firmware
> service, it registers an arm-smccc device for that service. The hwrng
> arm_smccc_trng driver and the Arm CCA guest TSM provider are converted to
> SMCCC drivers that bind to those discovered devices.
>
> The old arm-cca-dev platform device has also been used by userspace as a Realm
> guest indicator. Removing it without a replacement would leave userspace
> depending on an internal driver-binding device. This series therefore adds
> /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI for
> detecting whether the kernel is running as an Arm CCA Realm guest, and then
> removes the dummy arm-cca-dev platform-device registration.
>


Gentle ping. Based on your feedback in [1], I reworked the series to use
an SMCCC bus, with smccc-trng and arm-cca-dev represented as devices on
that bus. Could you let me know whether this approach addresses your
concerns?

[1] https://lore.kernel.org/all/2026051451-comfort-museum-4d2a@gregkh/

-aneesh

