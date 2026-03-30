Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308B5FB3D18
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5woF1eWbMjDMgPbRVd/1NQgvOU5JJzJHfAd3EH1oqE=; b=lUNhj5rCJ1whlWtRya3J8+390a
	jJKQ88L1xAIYomx8cOTyADf+IWTwYFKJJ5Ju9K4rTs91xUJuP2War3povxaa3NpYBHof6cBA4EMn2
	fv9pSLXirFrSvW8wUnzX3EUSjfg9iUJHoK//2GqABduRo8l854ZPSfSWx3FgHfe325GsT8BSICRrY
	t8vC5F9VNIGsuzpjuGe5vEZYfLto44CX/Aqdf4KOr6Hmhh+ffFj4QRZ0E00B0PO7Xd36AJKCBAbDo
	rcOdiz/p7oq7SIV30eOh1jvojizRa8VZWK1Uv6w7NzLpo9SR4Nb2RIxaWpSaJMRbqTMab5xiNem1O
	i1GE0L9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ACO-0000000B6Ij-2zQJ;
	Mon, 30 Mar 2026 10:50:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ACM-0000000B6IM-302c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:50:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43A281C01;
	Mon, 30 Mar 2026 03:50:15 -0700 (PDT)
Received: from [10.57.13.56] (unknown [10.57.13.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3B523F915;
	Mon, 30 Mar 2026 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774867821; bh=JI+Xuu/ybqlMVDvJDayiXhKnKGzuD+x/x059NYtE0K4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AtqvQXHGQ0cYw7a5kMc3gYXiQ0LRluMyI1zMzz1VOPAemVVgba0xZpdkOtfYPk4iH
	 prrXMbY/8EYtsiMt0NdvPSWOnmxQnebEgquF8UBiwF/Tsfm8h9EkfK+bbB4WPHk6oQ
	 tJGR6wIJ7Q8j8U4rrOJD7SFu/IaVCGLONdrjYcms=
Message-ID: <37360a1f-4cc6-4a7b-967e-41ef9707cae4@arm.com>
Date: Mon, 30 Mar 2026 11:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 31/48] KVM: arm64: WARN on injected undef exceptions
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-32-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260318155413.793430-32-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_035022_823601_7DB8327C 
X-CRM114-Status: GOOD (  12.15  )
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

On 18/03/2026 15:53, Steven Price wrote:
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
> Changes since v6:
>   * if (x) WARN(1, ...) makes no sense, just WARN(x, ...)!
> ---
>   arch/arm64/kvm/inject_fault.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index 6492397b73d7..613f223bc7a3 100644
> --- a/arch/arm64/kvm/inject_fault.c
> +++ b/arch/arm64/kvm/inject_fault.c
> @@ -327,6 +327,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
>    */
>   void kvm_inject_undefined(struct kvm_vcpu *vcpu)
>   {
> +	WARN(vcpu_is_rec(vcpu), "Unexpected undefined exception injection to REC");
>   	if (vcpu_el1_is_32bit(vcpu))
>   		inject_undef32(vcpu);
>   	else


