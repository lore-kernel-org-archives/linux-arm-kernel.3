Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06925CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 18:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lkFQwlCbhUAalW714RjzdW28pKtGTW9crfVaCzc6h8=; b=Cvp6IKZ0K/JPzzJz/C9xNM9cMz
	5CQS8uiomacJjW3ktJ6wuARRh0RTZQ0CP5s981/EtU5IjrEk8fZFQesAG2pkuIpHUe1amygCYmopV
	Jkb+7e1C+Zu3hdnr0FM+N/xeqju13KGt6K542xE0ukl/QjkkcjlpFf5ffaYl+uT+dclNaxa20p6Wa
	2AsCYUUctFnJYDfNEIF8rqZ72t5ICgghnf+u6wG0qR5W9n3jXOw/wbrde8IKZ8OJgKpHG+dBiZAMM
	Uplc5ALeVMacnfDDOneF2nDFwoO/wHPnAO8fgOspGZtGv3lHoVVthx1CQqMbXq/q3S7AQqUyoby+k
	MOt/8UhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqhz-0000000FiDd-3V75;
	Wed, 03 Jun 2026 18:52:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqhy-0000000FiDB-1tr3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 18:52:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FA716008A;
	Wed,  3 Jun 2026 18:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CFA1F00893;
	Wed,  3 Jun 2026 18:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780512773;
	bh=+lkFQwlCbhUAalW714RjzdW28pKtGTW9crfVaCzc6h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KqrhjgRaligsSCjFOKrIc9ojfq0vPNhhoEsxr7KrYV8vIKE0ekvQIRZuwhAAhAHQu
	 rV1bTbMiCezbgLR+Tf8n3WEpAQEhnASHEaTSEWqiWUonMNGBQ4h9BpuVVCKRt5Gjht
	 T6j/rcZsuYCVuxgFcjSH1wRocQizn0lJy9JmS9w6OFJ/ltkyG4SYAqAkOa5mlylUxn
	 ijpz8mERvC836pvslHqtiYUTwq13M1NGSOiHJsmCkpkd3D0tvKGoigw8NRGfvUX6F9
	 5tPCAPTkk7N+yhaNZKvIayQXnsN77LFjneIGSaZGUo3AnTAlIxyRnYaja5bl8gxfD6
	 xCEsavN8qNSyA==
Date: Wed, 3 Jun 2026 19:52:48 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 1/4] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260603-feathered-parakeet-of-forgiveness-b40db4@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-2-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527100233.428018-2-aneesh.kumar@kernel.org>
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

On Wed, May 27, 2026 at 03:32:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
> SMCCC-discovered firmware services are currently represented by separate
> platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
> represent independent DT/ACPI-described platform resources; they are
> features of the SMCCC firmware interface.
> 
> Add an Arm SMCCC bus for services discovered through the SMCCC firmware
> interface. The bus provides SMCCC device and driver registration helpers,
> name-based matching, modalias generation, and a sysfs modalias attribute so
> SMCCC service drivers can bind to discovered firmware services and autoload
> as modules.
> 
> Follow-up changes can then register SMCCC firmware services as arm-smccc
> devices instead of creating independent per-feature platform devices.
>

This looks good to me.

> Based on arm_ffa code
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/firmware/smccc/smccc.c    | 158 ++++++++++++++++++++++++++++++

I think it is better to keep it separate say bus.c ?

-- 
Regards,
Sudeep

