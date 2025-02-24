Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13CBC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+ItPRFFyzJNnAUMLpEPWdXEOVhjKvBADwZX/A53ObA=; b=KNgLFK1jX+PbOoRpStut4oDoM+
	oObQnAIwGX9diEunWR4Zg9Fmd0LKuHczKcqOt9prTBh4gVDLx8d69riFw9M51QW9T4gG9YzAF7Vf7
	uWUkOXsvvq8KbIVuW4jO01iiRoI9dUA1ZE4Od6Nwo012+LD3f0r+5A5v9mAeW3yil9WMHOnjsAmo8
	2qllZUiLwKbF7+pnL7pbjgj8Lkc9/HW/t1+DAS/0uY17JbF6jhIYIJjQSRi5GMYqkjKD4P4RdISx9
	+k+PZda3jhTJ+VQASbnrZ69QckM9KsBNv8XzMn6MGJ+Gn2+6rlhHe3RiO80lQmIzZObdZkWxAexka
	q/1sJ2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmT8L-0000000Cai0-14gK;
	Mon, 24 Feb 2025 07:44:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmT5l-0000000CaNc-2zYG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 07:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5437761178;
	Mon, 24 Feb 2025 07:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE82C4CED6;
	Mon, 24 Feb 2025 07:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740382888;
	bh=z0db1DqZHwFj5ZNDEVx51VsoNu+zSAQurtKCoSQL2aM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bC9f76XynJZMxxSRIRacLKFFjzO6G7gkKSz+9tKa4ks7eByxWJIV+DSvxVsmdyNd9
	 g7SpQg6+8/fwhq8MiE1g/Q0/5o8LlGJSfrWZSRjQmecErteiAuVJaN58MktOOKJvgK
	 UVihfCL3nZsUrW59ZrWf7PmH8gyuaP8hxeFiL91yd44C81QjZzGPLqauwZeUEtED47
	 n3cOsK9j1z5d43+iL0yEgXzliqmdnw3BuXhcEEQQrYFkca801SOkwzxx8ycMBIBHKQ
	 qC3RyHhH6t6VymLzE6YKtXglF3sLfTLsknzm1aSBnSxISnjgRB3oyAtla2CdrMX2IM
	 cb7XG/Ipp4GbA==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 01/14] arm64: cpufeature: Handle NV_frac as a synonym of
 NV2
In-Reply-To: <20250215173816.3767330-2-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
 <20250215173816.3767330-2-maz@kernel.org>
Date: Mon, 24 Feb 2025 13:11:18 +0530
Message-ID: <yq5a7c5fhjs1.fsf@kernel.org>
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

Marc Zyngier <maz@kernel.org> writes:

> With ARMv9.5, an implementation supporting Nested Virtualization
> is allowed to only support NV2, and to avoid supporting the old
> (and useless) ARMv8.3 variant.
>
> This is indicated by ID_AA64MMFR2_EL1.NV being 0 (as if NV wasn't
> implemented) and ID_AA64MMDR4_EL1.NV_frac being 1 (indicating that
                            ^ F
The register name is wrong there.

> NV2 is actually supported).
>

-aneesh

