Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E804D729E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6aq0+YEsHGkgmUSZzzVz7k8Q+OO2efr1KuDOccak9k=; b=BH/Nh6+vzOaqtDxo0pk90YOGOY
	MaG7N2U/oBpd50BcEhpOfBEREfknoj1jZwy6Dk71EccaKEAZxS689xiTKfpL+qC2UWD1QIOvTt1Bb
	JwEchMT6sGXJTksim8E5RE0JYoUOqeKUgsa+C/38n6wic0+Xs/9gdR9fcCmAaJ2ENLzi2NaeAgUdU
	RMsy1dB09/ORghJE0S0nTbkEHiv1nj1bCKTEFk23lZ7sf0/QdcX2M6E54NEByfLKZ9DRypwzxNtYu
	gn+X3juLrNyB0VTirNr+u6M5otGDJCeKZapyYt5l3i7hgR5l3tRZegFlQa8EN5qFy9LPUNa9a9eYz
	EIRYyiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH4MK-00000000f44-0Rjj;
	Fri, 29 Nov 2024 17:00:48 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH4LK-00000000evT-25A5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 16:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=D6aq0+YEsHGkgmUSZzzVz7k8Q+OO2efr1KuDOccak9k=;
  b=fG64fQyeJKeJb5Pl5zLDAOaykqwo/5H5qxU5XbIwQ9qkpfF34tSIqSHW
   ecYGTvcT3gAkMjgl5Rn+uR1wVyu8vuoLATFb07gNueMLUAl9rqK8/2Ij2
   sofxdx9JVAbWVIMg0a/U7SPI7LfXE23KPINsyAYvSgonFhVbplaSVITQ2
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,196,1728943200"; 
   d="scan'208";a="103026726"
Received: from dt-aponte.paris.inria.fr (HELO [128.93.67.66]) ([128.93.67.66])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 17:59:41 +0100
Message-ID: <d8152993-081e-4d0f-b318-bbec645f2cbb@inria.fr>
Date: Fri, 29 Nov 2024 17:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm/arm64: vgic-its: Add error handling in
 vgic_its_cache_translation
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
References: <20241128134534.361144-1-keisuke.nishimura@inria.fr>
 <Z0iujBMl1ypdwfBu@linux.dev> <a62e682d-c2e8-424d-84c5-4e64468124a9@inria.fr>
 <Z0lrWynd3O8a1pG_@linux.dev> <e85e92f9-8387-4021-885e-a379a2898c9c@inria.fr>
 <Z0nsvvRNzjWTLI7A@linux.dev>
Content-Language: en-US
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
In-Reply-To: <Z0nsvvRNzjWTLI7A@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_085946_930104_F172770F 
X-CRM114-Status: GOOD (  13.85  )
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



On 29/11/2024 17:33, Oliver Upton wrote:
> On Fri, Nov 29, 2024 at 12:30:52PM +0100, Keisuke Nishimura wrote:
>> On 29/11/2024 08:20, Oliver Upton wrote:
>>>    - Store fails because of a failed memory allocation / error in xarray
>>>      library.
>>>
>>> We don't handle #3, and the correct thing to do in this case is to put
>>> @irq since it was never made visible in the translation cache.
>>>
>>> So I think we'd want to do something similar to the following.
>>>
>>
>> Hello,
>>
>> Thanks for the comment. xa_reserve() can allocate the memory in advance and
>> ensure the success of the subsequent xa_store().
> 
> Yes, but xa_store() can fail for other reasons than a failed memory
> allocation. Which is why I recommended adding an explicit error handling
> path to cover *all* failures to store in the xarray.
> 


Okay. Then, in the next version, I will send the change you suggested in the 
previous mail:)

thanks,
Keisuke

