Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954E6E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 05:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ah2u6ax8PORuBllC8TqXoQ2XAVIu/ny+FamCgVRLoc=; b=p+Z8x+Ivq3xE6dZrHRhb1/7YOD
	0bL9ggJK58SOKTWCwTMtvdNQgEwOD4Vo9KbiVDQGNzPd+lQPfBBbfwVfVsUBKVlc6i79SW6jtPCEB
	OSjli7ZM4lNVoMFz711y0C/cUKdRJ+gT3C8NsQ59Ne8KOmKEKK62JX8+PCtPodUOzgeyRUp9y7Gxi
	r51uNkW37gURzKEQpaXWg5/4mJ/MldcxtTj/Klsz+KUYBgRZlbAM77qCGFrmCNTQWvU1xjH12zOnJ
	q1H+FiCQHUitSVGF+sN6AZLDHe3qAFFXNAwjeIDpL3xKiZTaLGvHTf0i6L1qhKEXkmrzBEk8h36ZX
	ugM968Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO9M6-00000000tkO-1PFm;
	Thu, 19 Dec 2024 05:45:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO9Kg-00000000tNr-1jRx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 05:44:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 173A5A41BE4;
	Thu, 19 Dec 2024 05:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB43C4CECE;
	Thu, 19 Dec 2024 05:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734587061;
	bh=m7ocr98t3oyh92KXRsmsznyxYlJ215FpJvwh6l7erm8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BjVfWvvvHa+/pGTdjhx/7ve8T3J8fdMlct7OCGrv3VjwPDZo882AEfCsyyn9KLT5F
	 VwUE0TB2yFK/xZ7IYv0ccsYQyvejLAYSTPimBgiU3SuPJeoijUmEofqwcOsturJ1xj
	 lY88i7BWB4zlhL1kZ+ITFJO6D0Ch4O/8AmyoFDtLhVDwUuUlvypQybmHvDHNAsR3C6
	 xz+WjeZ8pTeo3rGMvX6MaB17Z3dgkQma5OI58hRmyBjYPLPAzOEC73U7E/j8DRNIYg
	 0PPAAIcy/qD2IeGlowkWjY6i9hdeG627xLVCyU/GfGSWtUqmxIliYQIL3Sot/eicie
	 coNTBnvDIBDSA==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>
Subject: Re: [PATCH v6 06/43] arm64: RME: Check for RME support at KVM init
In-Reply-To: <20241212155610.76522-7-steven.price@arm.com>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-7-steven.price@arm.com>
Date: Thu, 19 Dec 2024 11:14:09 +0530
Message-ID: <yq5amsgsrzva.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_214422_512666_702F7EC1 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Steven Price <steven.price@arm.com> writes:

> +static int rmi_check_version(void)
> +{
> +	struct arm_smccc_res res;
> +	int version_major, version_minor;
> +	unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
> +						     RMI_ABI_MINOR_VERSION);
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_VERSION, host_version, &res);
> +
> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
> +		return -ENXIO;
> +
> +	version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
> +	version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
> +
> +	if (res.a0 != RMI_SUCCESS) {
> +		kvm_err("Unsupported RMI ABI (v%d.%d) we want v%d.%d\n",
> +			version_major, version_minor,
> +			RMI_ABI_MAJOR_VERSION,
> +			RMI_ABI_MINOR_VERSION);
> +		return -ENXIO;
> +	}
> +
> +	kvm_info("RMI ABI version %d.%d\n", version_major, version_minor);
> +
> +	return 0;
> +}
> +

Should we include both high and low version numbers in the kvm_err
message on error? ie,

	high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
	high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);

-aneesh

