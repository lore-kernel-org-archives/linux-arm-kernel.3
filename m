Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65CAC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HR7bWGWyVWu/ODiZ7tagviF00frocWcMhQL3y2FAhs=; b=BBz7xhGCl0HOJ5JTI/CvGbYPTm
	rFdCaGwcrPXsO6Mgx1s4aFZvAlY0rg5kq6q/acGrMS+IowzruFpQ05DnAGHfPGDLhudxZo/ibPu1V
	XS5EaI3EnM1nvIeaOnf63gLSgxeWjcytzKjjHB2qtcoSsI6PlsRlcjsE+zvGs9EP7dSAtFGzPHuyF
	pJqYpWhTi6Lyz0RX3Y3QpK1xxqW5ccLwxAiqGvGkwbOUZWCcWHNlh25E7dmBVuEU/PC1EIVU/DCqT
	4Neu9LkdlHn7rkJgukg1YjoL3Dl4g2A7+yo5sd77yQ5gOqLbDYSeo7568PEeknsSupvMBw29JV3pf
	lFT6zY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eJn-00000002H88-2buH;
	Mon, 21 Sep 2026 13:44:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eJk-00000002H7Y-29GL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 13:44:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B03E119F6;
	Mon, 21 Sep 2026 06:44:17 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.carmbridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9237E3F528;
	Mon, 21 Sep 2026 06:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789998261; bh=AAVwCMiVJoVKlC9peFBCk7pbt77cn1wSrcRJO29Wbfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dIVqJkdnCKER6lbF3AockKYEr8y6o13dxe3ni93HFkKBmb9viaum0iUGSUl5qZ4NC
	 grljiL3C5pdWpVY/ykCRsTAphP49ENzbAuCMjJ9j9ynZ3Hi6SjEXBiiP/uypr+Zdrp
	 Up9xr5o/lzjzeTq+zUPNJlwzujEsXTWSaypzDdaw=
Message-ID: <0c7a54a3-7452-41eb-b4fd-eb554ab786b5@arm.com>
Date: Mon, 21 Sep 2026 14:44:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/38] arm64: smp: Abstract SGI and LPI operations
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 maz@kernel.org, lpieralisi@kernel.org, liaochang1@huawei.com
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-31-vladimir.murzin@arm.com>
 <aa6bd598-e801-424a-b2b6-73c3a5ba0900@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <aa6bd598-e801-424a-b2b6-73c3a5ba0900@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_064424_762106_F48CFE12 
X-CRM114-Status: UNSURE (   6.77  )
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

On 9/16/26 10:01, Jinjie Ruan wrote:
> 
> 在 2026/9/14 18:20, Vladimir Murzin 写道:

[snip]

>> +static void ipi_lpi_setup(int ipi, int ncpus)
>>  {
>>  	for (int cpu = 0; cpu < ncpus; cpu++) {
>>  		int err, irq;
>> @@ -1158,6 +1188,20 @@ static void ipi_setup_lpi(int ipi, int ncpus)
>>  	}
>>  }
>>  
>> +static void ipi_lpi_send(const cpumask_t *mask, unsigned int nr) {
> Sashiko pointed out a typo in the formatting.
> 
> static void ipi_lpi_send(const cpumask_t *mask, unsigned int nr)
> {
> 

Ack.

Cheers
Vladimir


