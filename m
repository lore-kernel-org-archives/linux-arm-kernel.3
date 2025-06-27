Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D8CC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azvwuzbKvGAfHYCvGIF6OHfRvYtMlh/x6stVIyHjtPA=; b=ewUFbbO0CVXNtbeQPSMEwkqNj6
	9u/K/yB9HiMk0UfEJ/OBAKWyTR5Z2Nlj6DA1Ki6YvLXq0WvIxkwbulN2KccXo2vI+nqF6rZu7xoh9
	HA93V0n1vMPFvMBP2/3QFvzjHpu+9lRUSsdTwgnHpHxGWAJ3+DyJeovylCuRPFykNN/vij9HapvV4
	XOCs7vCCUAK6B0N9LFe0e0FdOcVavtzHCyZOPKQl+7MXcmtUqCCy/d045pApt34grc2eq3QD95lSf
	91WFlIBoK9W0jnFUqq4urDrvILXY90hHezX/g8RAu5Hv4pA0ewFBSFUuv8MYOQIcKHA7WdcJj2LpQ
	8ZHuiwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7Ak-0000000ESvt-0Prq;
	Fri, 27 Jun 2025 11:23:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6yV-0000000EQsK-2Pbt
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Jun 2025 11:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=azvwuzbKvGAfHYCvGIF6OHfRvYtMlh/x6stVIyHjtPA=; b=ngcXP+F0EXXONIE/xHVA5edIJz
	XMZMMgQLyYnKY2UKJAnB7/uojxWxCt+2lSUBMUEvJO8IlxQL+pdN7Cc4ZBbmtRkEf/8MP7F6iWeqv
	5sZm11O8vsPQjJK9c0qqfjbMchkaUMSjmt0VpuSBbY+94Xc+sJ8GmpLdS3Zgz/K2VUL5izb5mehq8
	spNuhiW1fvHypGDuRHvWvCZoXlFVSCh5jRkxn6obyWSCXwgxiZzKBWsbNXazB1cwO3V+2Mlj/cjzi
	NzSLQL1mvAQrO0E4FxRWRQ4pmzF7jiwj2MnyCClU4gAnxxTSVO7IRZ6PqrVdVp4410z0OXS01UfHt
	yS52KW0Q==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6yS-00000006K7u-1p1x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:10:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DC4DA52D68;
	Fri, 27 Jun 2025 11:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02D5C4CEE3;
	Fri, 27 Jun 2025 11:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751022625;
	bh=mGMGfBohkZ1WPzOd7l0m/Nelbywkij2anI7hHz+8Wtg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IIMwd5afvL0J/BPxLK6qEbVvjUxRT5d3rknTaZM9WrdHd8lyYqOmr4faeVqoQbv9A
	 zFLWXY6pifR+dc3jVcynzhPcSoqUw/bjuLO16NQMRL3IbMXoeQFD3wAc1unC/B2xRo
	 fXZN/irWwTW4V69YlaOZCyDJrw75cGKi3a1hUee3+MvzPxU4BbBK8iN0F5j/6AW8QM
	 Lzbli/VLSYDfFxzNXv0wsScHhUGDO7ytjshn+VJc+8XTqxPbf8rwhoyhBfSu2jT6qg
	 Xaba5+y0sfXJINzM+ZuwAghARcnWnqWFCpAsRNf2aNw0spdKADrCkN4NJ+TcUlwM+X
	 DHxNNlgHHTpHw==
Message-ID: <7dd6cb50-78bc-4d44-afc1-9e0fb99a5e49@kernel.org>
Date: Fri, 27 Jun 2025 06:10:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] dt-bindings: net: Convert socfpga-dwmac bindings to
 yaml
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Rob Herring <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Mun Yew Tham <mun.yew.tham@altera.com>
References: <20250613225844.43148-1-matthew.gerlach@altera.com>
 <20250626234816.GB1398428-robh@kernel.org>
 <fe705ffc-9a4c-462c-a1bf-e14c55cdb2cd@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <fe705ffc-9a4c-462c-a1bf-e14c55cdb2cd@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_121028_740851_562886A8 
X-CRM114-Status: GOOD (  14.95  )
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

On 6/26/25 20:40, Matthew Gerlach wrote:
> 
> 
> On 6/26/25 4:48 PM, Rob Herring wrote:
>> On Fri, Jun 13, 2025 at 03:58:44PM -0700, Matthew Gerlach wrote:
>> > Convert the bindings for socfpga-dwmac to yaml. Since the original
>> > text contained descriptions for two separate nodes, two separate
>> > yaml files were created.
>>
>> Sigh I just reviewed a conversion from Dinh:
>>
>> https://lore.kernel.org/all/20250624191549.474686-1-dinguyen@kernel.org/
>>
>> I prefer this one as it has altr,gmii-to-sgmii-2.0.yaml, but I see some
>> issues compared to Dinh's.

Apologies for the duplicate review. I was planning to convert the dwmac 
first then add on to the gmii. We should continue with Matthew's version.

> I am sorry for my part in the duplicate review. I just rechecked the 
> output of get_maintainers.pl, and Dinh was not listed, and I should have 
> known better.
> 
> I am happy to do the work to resolve the differences and resubmit with 
> Dinh as the maintainer.
> 

I'm not the maintainer of this. Maxime Chevalier is. Please don't add me.

Dinh

