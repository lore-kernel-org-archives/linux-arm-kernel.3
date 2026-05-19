Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7606CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjCJbmA175x9WgA77ja315iihmEqQVPwYrcn5o6d6Ds=; b=rrQBfEHGMfa/Y3y727DwlMdlNJ
	YwVgMsBhgKyOuAiI79P78JsUkk50pdH+Yk4FetSk7BAC6nCtPYYeu84Ucu76PIX6lzQ6Imtg4JMvm
	kSDGB1LsnGsp4g63edJyWGcEm7Pqq+AakRbDLuzo+6sZQ1KonXOsQ0M1HVXFuGFygBuVTDTcVVRI7
	CnNKDJ9SyJtFbE62D676T9lfECufecvAakzz6cm+3BiwE9SaDs4BUZPRKL4QBGhajohtMmJBbkOJq
	EEZq8vVmvyW6xWnL7qW/7l+3ZdFh0Jgyz8F4Amec2hCu/yUuvJ02yvYNAEJWUyz0POA/UPdcudr3K
	0mtiuPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDQS-00000000FuL-3RB9;
	Tue, 19 May 2026 05:55:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDQR-00000000Ftz-2Pyf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 05:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C80F5601FD;
	Tue, 19 May 2026 05:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F35AC2BCB3;
	Tue, 19 May 2026 05:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779170130;
	bh=U+Hl3eDsVF7nBwtYqMoO1EpuTpi6vhdR2CjkU58X1K8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mMDO+eQso5vvPD9awxSIkdn8LkkgoJYL/gtU7cPm1cUQBkjGh1a3dnF6b2yMC4PSf
	 +uHyzMSQOXh6OnMQjNyfOdZBjp6RhlPrkBYADKdUPfLxeix9YZIJeVGNcEQGokkde7
	 HcSqTXLUztSWFiQWNNBPRftSSRINCirh4zR4Y1yRFLJqBgm0+aS2XYQSq97zVddULB
	 ju2/r5/WZ9e+TeZ0OpwkPld1/SnpjPZmf0AdasYsq98pBK454KH/7sPTpIB8iFQ46+
	 CYBxw7NHwz5NyzwXDGM23u2AqB8nwLz8nrK539TXyWgyxFqsSdqpekK5DzTehKFOZN
	 gXutkYur7OjVw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 08/44] arm64: RMI: Ensure that the RMM has GPT
 entries for memory
In-Reply-To: <20260513131757.116630-9-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-9-steven.price@arm.com>
Date: Tue, 19 May 2026 11:25:20 +0530
Message-ID: <yq5aa4twt03b.fsf@kernel.org>
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

> +
> +bool rmi_is_available(void)
> +{
> +	return arm64_rmi_is_available;
> +}
> +

Can we rename to is_rmi_available(void) ?

-aneesh

