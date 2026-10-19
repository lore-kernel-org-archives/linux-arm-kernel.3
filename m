Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788EB606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 23:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oxnjT12n;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bteBHr/k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TA+hrkPDDb8JZWxcPTsZ5GEG+PXQrcHlypH5xP8lCg=; b=oxnjT12n84V++7fRWsaXbY2GY9
	qzoekxLoJSy8ltrFV001yK/a5atbVEksKeKtY6ElMzP69X6VcL+q8JWK9V8c4Zy1n9i51xNWd9QlC
	jrOH0iPVrWbC/g98R9a9dB8g6Iq250y93c+jrfsdRglwLZBe4FTCVLhoXmf/AfsK/0Y9d1tANnBxA
	oq8vRv4K0oEWSeV61B+TazCyj2EnC58nHt53fFh0rtRv87MRLVRCwe9Rom+kfK/H9K7j2mOicoVA7
	YBSI8PHf4RSC93blkXMW/LxmozQzyc4+O7Fq2o7bY+4QlRhe1I+ATo+J+Da3Rg2L29AxTsi0zEy5w
	oR7F3dMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIwpO-00000008XVb-3YLg;
	Mon, 19 Oct 2026 23:31:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIwpK-00000008XUp-3jGH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 23:31:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DD70152B;
	Mon, 19 Oct 2026 16:31:28 -0700 (PDT)
Received: from [192.168.20.17] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C539D3F7B4;
	Mon, 19 Oct 2026 16:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792452691; bh=9CUwL2WVEd9WXW4yxmN0gNoDtRPpE6I8GkVOyVYsn34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bteBHr/kfSx/g9ZxGmYRvZkndSzSxUx//TzCZtREdgkrfzkw5eI+dW3ryNaQu2u1s
	 KVSuPUEVfnHEe5Edm/1yHaiZ024N/60uIO4IKydxleXtH0Y1EqB2BnfPVFZmmEJwNd
	 jEeBGh/97oF4u+/6r02BOD0ounY7kHowd68inuko=
Message-ID: <6f0d3ab6-52ab-458a-b44d-0bce36320e94@arm.com>
Date: Mon, 19 Oct 2026 18:31:07 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_spe: Support heterogeneous ACPI systems
To: Johnny Fan <johnny.fan@cixtech.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 will@kernel.org, mark.rutland@arm.com, james.clark@linaro.org,
 leo.yan@arm.com, cix-kernel-upstream@cixtech.com, bob.zhang@cixtech.com,
 jie.fu@cixtech.com, fugang.duan@cixtech.com
References: <20261015062908.3565761-1-johnny.fan@cixtech.com>
 <86mrsf1bnv.wl-maz@kernel.org> <atC+lsWALy6ueGAB@JohnnyFan>
 <14d16970-915b-4c86-afeb-bfc3058564df@arm.com> <atGl/ZTg49t/VfVj@JohnnyFan>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <atGl/ZTg49t/VfVj@JohnnyFan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_163135_065356_727C8357 
X-CRM114-Status: GOOD (  14.80  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 10/15/26 11:20 PM, Johnny Fan wrote:
> On Thu, Oct 15, 2026 at 10:58:10AM -0500, Jeremy Linton wrote:
>> I don't think the GICC is sufficient, you have to consider actual
>> heterogeneous machines that have differing SPE implementations with the
>> same PMSVer, which mean you have to keep the PPTT hetid check, and set
>> the mask based on both it and the GSIV. Then, like DT create multiple
>> platform devices. Which is true with the current patch as well, the
>> hetid still needs to be there even if you have differing PPI's because
>> it could have more than two differing implementations.
> 
> Following that direction, the question on ACPI is how each registered
> SPE device gets its supported_cpus: the platform devices are created
> without an fwnode, so platform_get_irq_affinity() falls back to
> cpu_possible_mask today, regardless of which CPUs actually implement
> SPE. That's the plumbing question I asked Marc about -- would be good
> to know if you have a preference here too.


I may not be fully understanding what your asking, but you could just 
attach a cpumask via platform_device_add_data(), or similar method, then 
retrieve it in the driver(s) and use it to set the affinity.



