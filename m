Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B94F327C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMb8koZAihX05ov3bTIDcfO2fA4eExpXzMTWZG47PRI=; b=x3jC32uP3gg3Ni4YUuNFl4vmFi
	KfocX19I24BGQ05TO7WuRw0W7XqlPIn3XbH5Ds6yTjKNls7gX6WkJRA4309aUvDEhcGemBA1FtYyP
	MafYPZ0VtWM3T6sXipTgzkDYFSRyVAebabCak74POMMIkUXYln7DkrMiY5IUda7Ce/sAYusymDHQJ
	J/VtIZ/vfF8SRhoQAYDaS4JcCaY3CrnIp1Ljm2GeExBCf719R/P9D42R8tPfE8B7CDI7PX1Kf6NeP
	sjcy/+NMGA6tJ/g8B0ip8AVV699zZiWxozaCSOOL1tmRuxDChhVReiAq0wQkwY3CRhKtYaD+7UO5R
	HMZyCGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6oJ-00000008HAq-1LzH;
	Tue, 21 Apr 2026 08:50:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6oG-00000008HAQ-41Kd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 08:50:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3AED25E0;
	Tue, 21 Apr 2026 01:50:13 -0700 (PDT)
Received: from [10.57.17.241] (unknown [10.57.17.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D529C3F915;
	Tue, 21 Apr 2026 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776761419; bh=HMKhRQDZ6VybJ+xiqnuGn8VaE1KO7V0xQaywDs6oYsE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u4q/Fbcbwj/LshtkxLDhcmX03cPJ6K03eXdCPhBWm9u6vnpU0lYHTZ3LxURJLhL4K
	 y85M0k6grCwXX9K278d9FkdvM79PK7u2ES9U6/Mz4WKsGFqtk25P/NwMb58D5YACv3
	 hb42Rec2w3ygdHfZlseEGfKUH4uUjoO/MW3qQ7zw=
Message-ID: <fdfd353d-f198-4806-81d2-61f26b678dea@arm.com>
Date: Tue, 21 Apr 2026 09:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] coresight: etm4x: fix underflow for nrseqstate
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-3-yeoreum.yun@arm.com>
 <20260416151102.GL356832@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260416151102.GL356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_015021_041504_2860EEC6 
X-CRM114-Status: GOOD (  12.43  )
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

On 16/04/2026 16:11, Leo Yan wrote:
> On Wed, Apr 15, 2026 at 05:55:18PM +0100, Yeoreum Yun wrote:
>> TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
>> in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.
> 
> My suggestion in previous version is not quite right, thanks for
> making this correct.
> 
> [...]
> 
>> @@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
>>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>   	struct etmv4_config *config = &drvdata->config;
>>   
>> +	if (!drvdata->nrseqstate)
>> +		return -EINVAL;
> 
> For "nrseqstate = 0" case, would it return -EOPNOTSUPP instead?

Or should we make this only visible if the nrseqstore is meaningful ?

Suzuki

> 
> Otherwise, LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>


