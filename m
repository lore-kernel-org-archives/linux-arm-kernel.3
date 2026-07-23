Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90D8C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrPrN9cV2PmibleLWI7XuTVzlsJZ0VJtDkclEP6rqXQ=; b=r8s4BlbQa72KDoQWUMRxGh1N4O
	y6mnbKrCkdl4ZS9+T7Iz7JpLkVy6cDEl5NM7JzSYNLEa/SxRDg2QGKP1ef/1/i2k9mG689cMjOHK3
	E6PmB+V1ED6qdr5IgS9qN0arM9BTIEZPNqCvo0N3SMuoSkqbjZ0qg0tnwZ9OkijARz0p+fkEgNRRq
	JowhPeHdzjbtfagveyp2yqbElnLTisAGqAuvxeaYjqsoTy1TBBODhK+Q+DAz6vj/+adSwqN/pujJz
	6aHnJJaC2AqEBKxuaXugX/qCh8/Rzzhv2OUHocaRsPtCz5a+HB1iRdiScXUxb85nCHAVAGoFytTYT
	FJgFPKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoHk-0000000DgNP-2LS2;
	Thu, 23 Jul 2026 07:56:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoHj-0000000DgNH-23CQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:56:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D700E41706;
	Thu, 23 Jul 2026 07:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784001F000E9;
	Thu, 23 Jul 2026 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784793362;
	bh=WrPrN9cV2PmibleLWI7XuTVzlsJZ0VJtDkclEP6rqXQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lEqG26STPwmO5CnbjQJ8E9MYTEoMF6Q0RlYzHX4Nl7lhQbyIPIujiRUHYQjir+d/r
	 B1mUvrIxbGAUNBfgR6NfnqRt4926ESZt3Qv/4JTDflifujpN+scI9OwAjAny/fumqq
	 j4EEZ/LU+loG0nI4gTL97ef1bUmhzwM5iK6p16Uj/Nf+/MIXuEIVh1TJSf02475CsX
	 IiKhOaANjC7IAD35rAXrpftJ6WMj661dSOdnuvU9fMhnFw8I+jsx76AZuguSSb/jjo
	 nrXiLZs8d9TUWYRfr5Vdy1XoEL/lxAM4RS4nzIwNdYLgMkE7uNtEuR8/Ekab8knrKy
	 7jSLQNu+2Z2xA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v8 0/6] Switch Arm SMCCC firmware services to an SMCCC bus
In-Reply-To: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
Date: Thu, 23 Jul 2026 13:25:52 +0530
Message-ID: <yq5aik666sxj.fsf@kernel.org>
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


Hi Will and Catalin,

Gentle ping. Can this be picked up for the next merge window?

-aneesh

