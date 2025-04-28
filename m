Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC953C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96dNQSGS1qwfQu0B3iYn+vJgwxb0VysqCfuHuuE82jc=; b=O1vrPXWmyTwQpIu1FngO0uSfcx
	ClE3wQiZO7cQD/jxgP8YbnrELjt1mjPzYpQL6lBnbTjJY+oF10matycP7UlLeVZ7dMik/LkhnSpx/
	aL+N6TQ5fka2mz7NppLDEKCAP9xE6TwzyU7zfMWGD8zgAYVxp4nsdBUrWOf52B1wcIzhlk6Ny0EO7
	k5UvNGEh5riE9AskUWWBQcz1wWi3JNz1PpxIMrhrrYXYUHEIBMpV+7frecUA/xI+c0bgaDvi2gIoc
	1Cw70xOESPgxUjESLjyIoziIhTqYUn1l7HPHLlKJwO+NiVhLKFix1DQPN2I7vBc3o99LswNv5FDTa
	ugRca0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Psx-00000006h81-1WlS;
	Mon, 28 Apr 2025 14:55:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Pew-00000006fG9-2KGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:40:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BF821516;
	Mon, 28 Apr 2025 07:40:29 -0700 (PDT)
Received: from [10.57.90.155] (unknown [10.57.90.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E66763F66E;
	Mon, 28 Apr 2025 07:40:31 -0700 (PDT)
Message-ID: <8d9d9d59-8fd1-47db-88fb-39bb791a4b8b@arm.com>
Date: Mon, 28 Apr 2025 15:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64/mm: Reorder tlbi in contpte_convert() under
 BBML2
Content-Language: en-GB
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 suzuki.poulose@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
 robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
 paulmck@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com,
 maz@kernel.org, james.morse@arm.com, broonie@kernel.org,
 oliver.upton@linux.dev, baohua@kernel.org, david@redhat.com,
 ioworker0@gmail.com, jgg@ziepe.ca, nicolinc@nvidia.com, mshavit@google.com,
 jsnitsel@redhat.com, smostafa@google.com, kevin.tian@intel.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20250428143352.53761-2-miko.lenczewski@arm.com>
 <20250428143352.53761-6-miko.lenczewski@arm.com>
 <20250428143922.GA348493@e133081.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250428143922.GA348493@e133081.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_074038_637068_DA6F3EED 
X-CRM114-Status: UNSURE (   7.37  )
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

On 28/04/2025 15:39, Mikołaj Lenczewski wrote:
> Embarassingly, managed to leave around a stale patch when renaming the
> commit. Please ignore this patch, the correct one is "Elide tlbi in
> contpte_convert() under BBML2". Am considering resending...
> 

I think it would be clearer to resend. Otherwise people are going to get confused.

