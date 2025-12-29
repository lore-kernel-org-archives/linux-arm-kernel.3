Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2148E92725
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rg8882HN0q5dZbaB2j0JJtAmaocpdTyq8yU2ZyxrdTM=; b=pXwYhKSAzs0FDBeA8irNjzfWwm
	ZNGIRXSXx9QdC3su31XvG0MS8She0EHUd8jZGnDtnu6RNHdirqQrFT2tdsycrmQHi3MTUwpIuUy9p
	p3jc+Fc3C/o1+7vAiyVKL2LtD3bYxCLDjODoZHzJHVrzC/wB6QBg7qpWTFOAv40FFa0cnTTqMy0T8
	DP0tF1c8a24A25gwTdmTEeBR4ndjxL8JEQS1XJJhq0kvfXkEcFNJoNqLpTEGRV/gQ7ndyFgwwmCtB
	h91G0o8yj3RMjZRPQ4Adj8wYcv5DuxklZ9ty5IMYvyV2Ady3fBSDBMkPUqRvL7zN73F0xpSdedNdZ
	/nIfUImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBpr-00000003dmy-2V87;
	Mon, 29 Dec 2025 11:54:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBpo-00000003dmT-30Fs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 11:54:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C9B3339;
	Mon, 29 Dec 2025 03:54:38 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2A1B3F63F;
	Mon, 29 Dec 2025 03:54:43 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org,
	tony.luck@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	Ahmed.Tiba@arm.com
Subject: Re: [PATCH 00/12] ras: share firmware-first estatus handling
Date: Mon, 29 Dec 2025 11:54:36 +0000
Message-ID: <20251229115440.2734800-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251221013534.GAaUdO5vWqMWAdbWbd@renoirsky.local>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_035448_798824_2541067F 
X-CRM114-Status: GOOD (  16.64  )
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


On Sun, Dec 21, 2025 at 02:35:34 +0100, Borislav Petkov wrote:
> On Wed, Dec 17, 2025 at 11:28:33AM +0000, Ahmed Tiba wrote:
>> Platforms that rely on firmware-first RAS today only get the full Linux
>> handling pipeline when the records arrive through ACPI/APEI GHES. This
>> series lifts the generic parts of GHES into a reusable estatus core, wires
>
> Why is this thing called "error status"?

By “error status” I’m referring to the UEFI CPER Generic Error Status block,
which is the standard firmware-produced error payload that Linux already
consumes via GHES on ACPI systems. I’m not introducing a new error model
here; the intent is to reuse the existing CPER decoding and handling once
that payload exists.

> Why is error status so significant so that you need to call it a thing,
> much less a "core"?

The reason this shows up as a separate “core” is that CPER parsing,
logging, and vendor dispatch are provider-agnostic once a Generic Error
Status block exists, independent of how it was discovered or notified.

> It looks like you basically want to dump error records from a system
> which doesn't support GHES into the common path so they get decoded?
>
> I mean, I'm only guessing because I don't get any wiser from this text.
>
> So how about you give the high-level, practical use spiel first? What's
> the use case?

The practical use case is firmware-first RAS platforms that emit CPER
records but do not use ACPI/APEI GHES for discovery or notification. Today,
those platforms either have to duplicate CPER parsing logic or miss out on
the common Linux RAS handling (standard logging, memory failure flow,
vendor notification paths). As a result, the full firmware-first RAS
pipeline effectively only works when CPER arrives through GHES.

GHES remains one transport for delivering CPER records, but this
series separates the transport from the decoding so that other firmware-
first providers can reuse the same handling without duplicating code or
depending on ACPI/APEI internals.

As far as I can tell from the scope of https://uefi.org/specifications,
the UEFI specifications don’t define a notification mechanism for
DeviceTree systems—only the ACPI/APEI path is spelled out. Right now the DT
transport is described solely by the binding in patch 9/12. If there’s a
better place to document or name this, I’d appreciate guidance
so it’s clear how firmware-first notification happens on DT outside ACPI.

Thanks,
Ahmed

