Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19409E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oma1+LSya7hp4zSO/CMAb0hws/KBh+YecBZkftjPBmE=; b=IwddBSRqtUnLXZMPH1p+/hUEbT
	zEef3SXv/N4cOj6ov2PWulruLWTpj0IrHCFFo0BJNpb8jpB1aJ9RSldbszDFaRy2BULSc4Ie1G7Ee
	zG2bCem1CPUEJpOqHZJFm+bfZyB1I+KLOd1pSZjkgk3PmsGWZycryHVNnWjGpHvK8cQxrEqcInanU
	5PS5+8K6wqvBJ/TcDJ31hbJNyecolnuXcSwRBh5eQU9K4C8jRdn0BX5HyrkN5vb5zEWq5THfSAIc6
	ZhSQoXFs0Wvns+oVGLX22RZelbUIErUczvyGiJSGEJ8mcvNetx/NOwikUqduaOg2x3RBOIWjxVIJs
	icMpPOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDkH-0000000FCp3-3yUj;
	Fri, 10 Jan 2025 12:04:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDj3-0000000FCgx-2sGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 12:02:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3696A5C5C80;
	Fri, 10 Jan 2025 12:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DDBCC4CED6;
	Fri, 10 Jan 2025 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736510572;
	bh=KRLoAbKS0jXsbg60i2JNi1ViMRnPQJoNJ1ZdkHnXhv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DzGKnVSbVD8HlXHejGcPt07VIeUuIRlD33qcVleNWRLAt/9nwKQUTi7tkyrOUeKSF
	 qUlJIqlSh8cpg78nSwehhykakWVO4jWFwVwj+LjbpzGGrGRLapCEqDoBXJM0kUuJcU
	 pnzTfLMQ686Zyu0Ec8FXW26tddl8c/Wx2s7UTZBGfLtxABzfOuMP97XTWjojDKZSGj
	 y6CU8jgm9lMjhtSaC28Oqcsve5e+Y9/5e9knhsafXytzQaXqEa+6mZlJNxN6Dfbs+0
	 G1OCb8G8LRDBSR+1nNpy77vq1IeCCr/9KPnWzEPR8d7zy/BwhAmKKqClzCAypNyKls
	 ee+Xfycr+fF5w==
Message-ID: <cfecaa65-f6bc-48c1-9295-9bfe18f13db3@kernel.org>
Date: Fri, 10 Jan 2025 21:02:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ahci: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
To: Niklas Cassel <cassel@kernel.org>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250109175427.64384-1-rgallaispou@gmail.com>
 <07a7177d-7705-4eb5-a11e-02a9429ffac2@kernel.org>
 <Z4EDKUb+hO0ovV2i@x1-carbon>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <Z4EDKUb+hO0ovV2i@x1-carbon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_040253_768076_6EC5EEED 
X-CRM114-Status: GOOD (  14.08  )
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

On 1/10/25 20:23, Niklas Cassel wrote:
>>> -#ifdef CONFIG_PM_SLEEP
>>>  static int st_ahci_suspend(struct device *dev)
>>>  {
>>>  	struct ata_host *host = dev_get_drvdata(dev);
>>> @@ -221,9 +220,8 @@ static int st_ahci_resume(struct device *dev)
>>>  
>>>  	return ahci_platform_resume_host(dev);
>>>  }
>>> -#endif
>>
>> I do not think you can remove the ifdef here. Otherwise, there is going to be a
>> compilation warning when CONFIG_PM_SLEEP is not enabled. No ?
> 
> Look at the pm_sleep_ptr macro:
> include/linux/pm.h:#define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
> 
> I would expect the function should be optimized out by the compiler
> using dead code elimination.

Indeed. Just tried and no warning. I was expecting a "defined but not used"
warning, but none showed up. So all good.

> Raphael, perhaps you could show the before and after output
> using ./scripts/bloat-o-meter ?
> (When the config is not enabled: before and after your patch.)

No need to do that I guess. But there are 17 other ata driver that set .pm
operations. What about these ? Don't they need the same treatment as ahci_st ?
15 of these also use SIMPLE_DEV_PM_OPS() which can be replaced with
DEFINE_SIMPLE_DEV_PM_OPS() also, no ?

Do you want us to do that cleanup ? (fine with me).

-- 
Damien Le Moal
Western Digital Research

