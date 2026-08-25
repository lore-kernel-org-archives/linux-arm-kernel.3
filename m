Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101ACC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haTQ7CV1qHGSjY13Rrvt3+jWVz+8xy92nwC33Cx3vgg=; b=lhapkvPNU1KwqhoznrPrtXgXX9
	XKp+8weZcF4esxsYmO4DQOmuGcusn0Bql+msJ+ZmXkzw5PjBMKn+sjHusRi2HSik8voM/CUOIjxOz
	oDrmJlmI85IOfFmh+XtNwV5vy596IRkrtIOoVLcVG2Ka82OxuALPIGoPMz3bFf8z4aatR6WUwbRB8
	JPva8Q2r7+Xf1iFXd2UMf2ZKU9EpDjHaecN+S5o7BD5RucOdr4/soeLwc3NMwGNErnIq2rpTwj6oQ
	aBDdz7Uj87QdZt0skSlshP9T1RxizpmL/NcmoJtSAWnaGf5O1IOmu/rkaxW2LdhbxFKtAWLy6B7zZ
	G+JMuv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylmb-00000000J8Z-1buU;
	Tue, 25 Aug 2026 07:41:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylma-00000000J8I-1mvq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 07:41:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CF136013A;
	Tue, 25 Aug 2026 07:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC661F000E9;
	Tue, 25 Aug 2026 07:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787643679;
	bh=haTQ7CV1qHGSjY13Rrvt3+jWVz+8xy92nwC33Cx3vgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kfCxzQa7w97/BvZ6Qu5miYBJTDp3MM0rdNJbMmLljpWsfsWJdMPMrELTaz0kkLlym
	 7vDkWHEKfP2cPeoh3EnkvfloRRkN45fvEoRon0iJcQOiMLcKxdR2DygpjWgyt6/mbR
	 BS4J+zNpn1z8nAdqf+GVouigJD/98Jdetug7wxP8oZ31xQOhyC2qablF0YcWiqltqG
	 xUzhdoBcngObzzGpVKQxSM4cDYoRg35aBIL8r3ZlNLOsU70i1d7xdQq/eq3WODJ80f
	 8EkY2A2OIrCao++dkPf+j9QfmY6mfhC7T8W4rxxTL6hgt6abN/KjAerFYz3gln1+yM
	 0NoMKBE5PnQ2A==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org,
	oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	kernel-team@android.com, fuad.tabba@linux.dev,
	qperret@google.com, Vincent Donnefort <vdonnefort@google.com>
Subject: Re: [PATCH v4 06/17] KVM: arm64: Add pkvm_hyp_req infrastructure
In-Reply-To: <20260731143541.956291-7-vdonnefort@google.com>
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-7-vdonnefort@google.com>
Date: Tue, 25 Aug 2026 13:11:10 +0530
Message-ID: <yq5afr02wstl.fsf@kernel.org>
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

Vincent Donnefort <vdonnefort@google.com> writes:

> Introduce a struct pkvm_hyp_req to enable the pKVM hypervisor to request
> resources from the host.
>
> Provide serialisation helpers to transport these requests via SMCCC
> registers (starting from a2):
>
>   pkvm_hyp_req_to_smccc() to encode into the SMCCC args.
>   smccc_to_pkvm_hyp_req() to decode them.
>
> When the hypervisor raises a request, the host must handle it and retry
> the HVC. To automate this sequence, introduce the pkvm_call_hyp_req()
> macro. This intercepts pending requests, invokes the handler and retries
> the HVC.
>
> Additionally, introduce a trace event to track the handling of these
> requests.
>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>


This is very similar to the memory-transferring SRO operations described
in section B4.3, RMI operations, of https://support.arm.com/documentation/den0137/2-0bet3/

The SRO model covers more details than the pkvm_hyp_req infrastructure.
Should we look at making the two more similar?

-aneesh

