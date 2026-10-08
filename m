Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AB5CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZE5AyB6dfBQs8CS7mr3Fvb05uXEMPU3WMOtaMF71eU=; b=PmYz1rP4I/DxyPgEJpMDwGV1gq
	70J0ZNIRagD7joBM2zvnFe63y4wa0nunvc3RjEFfjXcdfk8pq6D6kjYPdkIUgQNm3aXCao3rhDpYM
	9rXn6VN+25b1AxkIB8K6nURjApTdYT9j1QvXtV0iSqVEYSL3JJToFy0uhobcOidcn/7iIxgmhlOXG
	VLoDagDQCIDWuzxKqIPoRwI+dyUzVlXIf/GhAxcdhAQRmvlPj/yuS8fT4aTIXvw6QFtKBjYNYF1eL
	B/lMD1EnxGGPMh8FufvRsYji2g7ScwNZBO49zCwArs25EVku5ks/h7uoOMs+dv0RkEk3Vv3ZR/E+e
	4zOc1AbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEk3J-00000003xdR-0Rlb;
	Thu, 08 Oct 2026 09:04:37 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEk3F-00000003xZ3-2gNm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:04:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nZE5AyB6dfBQs8CS7mr3Fvb05uXEMPU3WMOtaMF71eU=;
	b=VlSde2ZNOTBpzEllPbG5HUJgfQJ8E0gJkCy6Trswx4G+wVthH2Cr0HWMXhaAjbjNfpc0NmCl5
	WQaLIr0pg9xJTdN/G4zcptmQnIgE93CTJ0vTlZUYZLbI12uJLhfc2xHybPSX7PbjD+tT7ghGklm
	T5L6SoBGVzKxEB6MRiiedp4=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4j0kJT0g8fzRhQs;
	Thu,  8 Oct 2026 16:52:09 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id E6B2740538;
	Thu,  8 Oct 2026 17:04:19 +0800 (CST)
Received: from [10.67.112.178] (10.67.112.178) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 8 Oct 2026 17:04:19 +0800
Message-ID: <6AC75C92.9090409@hisilicon.com>
Date: Thu, 8 Oct 2026 17:04:18 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Linus Walleij <linusw@kernel.org>, <longzhao@ambarella.com>, Chanho Min
	<chanho.min@lge.com>
CC: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Bartosz Golaszewski
	<brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>, Long Zhao <zl020895@163.com>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v8 10/18] gpio: pl061: convert register access to regmap
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-10-282ff5d98dda@ambarella.com> <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
In-Reply-To: <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.112.178]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200006.china.huawei.com (7.202.194.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_020434_176679_BEC7B3F6 
X-CRM114-Status: GOOD (  13.51  )
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

Hi Linus and Andy,

On 2026/9/22 15:23, Linus Walleij wrote:
> On Mon, Sep 21, 2026 at 6:23 AM Long Zhao via B4 Relay
> <devnull+longzhao.ambarella.com@kernel.org> wrote:
> 
>> From: Long Zhao <longzhao@ambarella.com>
>>
>> Replace readb()/writeb() with a MMIO regmap while keeping the existing
>> gpio_chip and girq irqchip. Use a raw spinlock so irq_ack() can run
>> under the irq descriptor lock.
>>
>> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> 
> It would be good if some critical users of the PL061 could
> test this patch.
> 
> Wei, can you test this on HiSilicon?

Sorry for the late reply!
I did not get the HiKey boards these past days.
But I test the v9 patchset on the qemu sbsa-ref machine to verify the 
gpio powerdown and it works after resolved some trivial merge conflicts.

The detail could be found at below link:
https://github.com/hisilicon/kernel-dev/commits/topic-test-pl061/ 

Best Regards,
Wei

> 
> Chanho, can you test on LGE hardware?
> 
> but it looks good!
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij
> .
> 

