Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251FCCDDE60
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRGP9g89any50ysl0dWJkXsHywW8wl3y5/qvRsqWfJg=; b=TEFzTJ3yTZ1fApWQHPnR2upvFO
	W0xA7tnBxOJqY1oeFJtKjmS/Ux08HHrrd1mIchA3kll/WNDTYaFyheufmShYj23QDQxrr1T26P5KX
	MSn/u+JWMFtvDqR58vJs5+QdfMASPsOm/6sy8Xxfyw7N3VnZWRaXR0Kqmxtec4KmzQ2afAkYQSCCH
	XWf/TIhSEh1eOqvVI8luD+VqimYfws1LVntMpkquxLpn2iNTEsjpHrdlQ/tgyTPrEw68cQJ+RYP2H
	G2xCIWkQGLGsX63e/pmQEwmuT6h5yTAJ797QsJSUFeoG7namY/3u+RhtgGrEvjMv10KT7fQszkkrB
	bR7L0u8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Yng-0000000E1EZ-1Ojo;
	Wed, 23 Oct 2024 10:41:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YGF-0000000DvV4-0Auz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 10:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:CC:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zRGP9g89any50ysl0dWJkXsHywW8wl3y5/qvRsqWfJg=; b=fFSltSYFUfjrxE3MD9l4X1ZoC2
	ukntN16IltLWY1H0k+f0zxYutWuYkBtDnAC/izXkz+WoSqWdSOI3YZThj26KqXiwuQkgnQrclTdUQ
	IYJr2pb4XKh84+JAQHJ9DLqNZ3c7/2g/GWtNGBNiZWH/23A2ivW6D/xefZaVpQccNdrPfzVd2nDoi
	lGOw8GThXOmN5NFQkhqgYxzMi4GY8jj1HMSYMOa0u74/UbcMlLXORMThlou8YOuRRhlwTKO39FT7k
	t8cy//wcB7wW/QUmX1C4RVrMN0JHWjSHMApNJ9y9Q5aHj7eWQXsn9X2dxxd4bMsKtwcEIbOwzL1eg
	L7fOA5Eg==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YGB-00000008NTe-2FFO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:06:37 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XYPmD5zkYzyRyl;
	Wed, 23 Oct 2024 18:04:44 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B78F180115;
	Wed, 23 Oct 2024 18:06:16 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 23 Oct 2024 18:06:15 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<maz@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <oliver.upton@linux.dev>,
	<ryan.roberts@arm.com>, <linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>, <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 1/5] arm64/sysreg: Update ID_AA64MMFR1_EL1 register
To: Mark Brown <broonie@kernel.org>
References: <20241022092734.59984-1-yangyicong@huawei.com>
 <20241022092734.59984-2-yangyicong@huawei.com>
 <c462f93c-5480-4776-bfe4-bb64ed1383d3@sirena.org.uk>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <b543e99e-6868-011e-c30c-1b2ec973523c@huawei.com>
Date: Wed, 23 Oct 2024 18:06:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c462f93c-5480-4776-bfe4-bb64ed1383d3@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_110636_124314_472F3F40 
X-CRM114-Status: UNSURE (   8.63  )
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

On 2024/10/23 1:05, Mark Brown wrote:
> On Tue, Oct 22, 2024 at 05:27:30PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Update ID_AA64MMFR1_EL1 register fields definition per DDI0601 (ID092424)
>> 2024-09. ID_AA64MMFR1_EL1.ETS adds definition for FEAT_ETS2 and
>> FEAT_ETS3. ID_AA64MMFR1_EL1.HAFDBS adds definition for FEAT_HAFT and
>> FEAT_HDBSS.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> 
> This was also in a recent KVM series (which prompted me to send the same
> change since the change there was only partially done), it'd be good to
> get this merged.
> 

Thanks. I may missed that series..


