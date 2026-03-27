Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7051910BA42D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 06:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRXLsnkWHpLD2U3HVcRv86U8YDyR3CzfpMUGFNv4ORU=; b=ctR+9QMP+0Kvw/Mrquikp1iTeg
	ZKyvA+Mh0n4EMrvwMX7hgKiresH/QJCN0utfLnlFKeAGbcDnXVE0LxFy8hN96v2MmXtNpfdePyzoF
	yIPusyhK2RAS5jK2Tnwt8ujxVdlV70m/J2ioQWyCc/yvSLBUkSKES88txizHB93oavEM3OY9qjXeE
	w8tgzXM67JCwPi3uBnlDOk/lDfioAP5WibfPRrrAggvuhGDwXPMi2lkwkGdq00wbzgZUZsPC+VrZ4
	lzNSTRArxpBpF1/6cUXx99wTny9GHrK2kqyekN/uagVsDffBVklv6mSoG3ReT1H4v0dv7c29t1SQ1
	Y/FAShXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60Ej-00000006jW3-1KJx;
	Fri, 27 Mar 2026 06:00:01 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60Ef-00000006jV7-1LEG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 05:59:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NRXLsnkWHpLD2U3HVcRv86U8YDyR3CzfpMUGFNv4ORU=;
	b=UptJYoNQr/0I2Jzqdawje9po4fVSAQ3+f1ZKH3VqOUw9CsQotr2848QswnNfBwsXkk1Oj90hO
	JiYZNM93J6xvCGx5cOcZOLFqe83AlDuFtN7MmfegoCSM+hO1PnVzz1HZ/AtbHi8AQOTqHq7Itn6
	LB260z1Rh6ezAUM+h3O3b7s=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fhqZs2wL9z1T4FZ;
	Fri, 27 Mar 2026 13:53:57 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 151F84056D;
	Fri, 27 Mar 2026 13:59:31 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 13:59:30 +0800
Message-ID: <92799aa5-9959-43e0-b993-2cbe29dff584@huawei.com>
Date: Fri, 27 Mar 2026 13:59:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] selftests/arm64: Fix sve2p1_sigill() and add
 cmpbr_sigill() for hwcap test
To: Will Deacon <will@kernel.org>, <catalin.marinas@arm.com>,
	<shuah@kernel.org>, <broonie@kernel.org>, <yeoreum.yun@arm.com>,
	<jonathan.cameron@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <kernel-team@android.com>, <xiaqinxin@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangyushan12@huawei.com>, <xuwei5@huawei.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
 <177279809096.1376203.6124931515335372340.b4-ty@kernel.org>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <177279809096.1376203.6124931515335372340.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_225957_847070_C0A7CFFB 
X-CRM114-Status: GOOD (  10.20  )
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

HiWill,

Gentle ping on patch 2/2. I have received a Reviewed-by from Mark Brown

and there have been no further review comments so far.

Could you please consider applying it if everything looks good?

On 3/6/2026 8:26 PM, Will Deacon wrote:
> On Thu, 05 Mar 2026 09:36:36 +0800, Yifan Wu wrote:
>> This patch series fixes and adds two selftests in the arm64 hwcap
>> test suite.
>>
>> Patch 1/2 fixes the sve2p1_sigill() test to correctly detect the
>> FEAT_SVE2p1 feature. Previously, the test incorrectly assumed that
>> the presence of FEAT_SVE2.1 implied support for the BFADD
>> instruction, which actually depends on the FEAT_SVE_B16B16 feature.
>> The test is updated to use the LD1Q instruction, which is
>> unambiguously implied by FEAT_SVE2p1.
>>
>> [...]
> Applied first patch to arm64 (for-next/fixes), thanks!
>
> [1/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
>        https://git.kernel.org/arm64/c/d87c828daa7e
>
> Cheers,

Thanks,

Yifan


