Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667F0C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 03:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=birDuTsGMjsgq9cdpgCTGwmLoeIqjYlRdh0XhTKAUvc=; b=NsmdS7qBewdnhnPb1q4r2Z9N1E
	cYEjUWfgSpc5UspqV0Qk+LTfFJ8e9gRbs6m8Rwi15XzEWibGXDkBex6LZ3XVlsb73FGd8zqAigTl4
	3rO5g8N3LsmfyRxl4nTfS2aPl4fPiiLSdniyqsnCDkDjL9E+0BcFnXL6VcK72KQh9llkBsFqBSz2X
	6T+ek08ZqueVL8DxHYTgB+ODtTT08XZK0NF5jjNLIat39jpdZCXqtOFRdNIqATzxfjrwRf77zuN8c
	JmKAOG+JLM/61ftcOb42f9Lu+x6XT7OgrVsFQslfWPOAHgyKZ7o8qPniy8b7NL2RZFAkKOHA8QHdr
	eX5jOUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dI3-0000000GH5a-1Asv;
	Mon, 07 Apr 2025 03:36:51 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dF0-0000000GGfM-0Was
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 03:33:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZWFBB5DwFz1R7g7;
	Mon,  7 Apr 2025 11:31:46 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 3F2091A0188;
	Mon,  7 Apr 2025 11:33:39 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 7 Apr 2025 11:33:38 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<maz@kernel.org>, <corbet@lwn.net>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <tangchengchang@huawei.com>
Subject: Re: [PATCH v2 5/6] arm64: Add ESR.DFSC definition of unsupported
 exclusive or atomic access
To: Oliver Upton <oliver.upton@linux.dev>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-6-yangyicong@huawei.com> <Z-wRGyMrz0Tqh0CO@linux.dev>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <9bb31e71-aa2b-329d-0d76-112824eb69c9@huawei.com>
Date: Mon, 7 Apr 2025 11:33:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <Z-wRGyMrz0Tqh0CO@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_203342_354361_31566F1F 
X-CRM114-Status: UNSURE (   7.38  )
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

On 2025/4/2 0:15, Oliver Upton wrote:
> On Mon, Mar 31, 2025 at 05:43:19PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> 0x35 indicates IMPLEMENTATION DEFINED fault for Unsupported Exclusive or
>> Atomic access. Add ESR_ELx_FSC definition and corresponding wrapper.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> 
> Just squash this into the next patch. Adding a helper w/o any user
> usually isn't a good idea.
> 

sure, will squash this into the next patch.

Thanks.


