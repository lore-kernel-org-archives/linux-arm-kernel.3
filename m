Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32170D3ABD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VnPq+DeI1kfAletOjyV/VL2RBE0BCGOhdueSpkA9mQ=; b=zB3g8FFLTh3altw1UgCRROhdGh
	3Iqr9FY4JPYpvVA0T8N1ONSmMeWO/q5yo6TZ4OEASMLpT3okUpvoauU6Ufr6tC2LENWFIkJ4kEl3t
	9R/XFkn3FkmWNRTK4t1SWkgr5Ai6n8w6yboNIcVP0EXS/TrqOM6HZ3mfqvMWXCKQ5/wT7as2RD+/J
	EfCsuIfUKzyi1qR3/NRaVPhf5kBeUZROsKJ/gj2EePLLN9L1dsoc6fXz/r1GFutdvu9oJCn9PnKEV
	MLXlKs19xaJp6czoUGmulW9i27mB2SaRjkA2cCoP7EIO9pW7ag3YGNrxYURCgRKpgBjqnIh9t1yFu
	WBLaa+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYIe-00000000jWs-39Ox;
	Mon, 11 Nov 2024 17:34:04 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYGl-00000000jA3-391M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 17:32:09 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B751B8932C;
	Mon, 11 Nov 2024 18:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731346325;
	bh=9VnPq+DeI1kfAletOjyV/VL2RBE0BCGOhdueSpkA9mQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mKvMEGC2qXTRIpDTI8ZHQv1sRC9QW0QW+FNMcUhBHlD7/+avXgQ9GidYw6UGa5MDL
	 IFyetyBGfJq9hJPA8MdQGFAmYXbmEAR77/gQtcMdKeI2GAYaY421s6HSnL8jEupURL
	 E3W/1x/aN4TxzUoBbAdAzlMLNiYhxLNoU5/00iI8fPjEd4QH5SskGWkfuoLIjOA+Zh
	 ks+NYv7ikOcoN6H642x6ZXh5gmj1prIhzuKOzfpW6+YWXff+IcdEV7gUATNacWCIn0
	 TDbTIJ3fgxlxWti5jY3ey634KPkZoeLhLoCWcEt7jj/4Ak/HTTSl4l5EJ5B4DBty3T
	 uEYH7wS19/vrg==
Message-ID: <4ee8d8a5-ec00-4b11-a7bc-4137e1982218@denx.de>
Date: Mon, 11 Nov 2024 17:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: zynqmp: Work around broken DT GPU node
To: "Sagar, Vishal" <vishal.sagar@amd.com>, linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Michal Simek <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, parth.gajjar@amd.com,
 "Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>
References: <20241031170015.55243-1-marex@denx.de>
 <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_093207_983913_EB4BEAC6 
X-CRM114-Status: GOOD (  11.98  )
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

On 11/11/24 3:33 PM, Sagar, Vishal wrote:
> Hi Marek,
> 
> Thanks for sharing this patch.
> 
> On 10/31/2024 5:59 PM, Marek Vasut wrote:
>> The ZynqMP DT GPU node clock description is wrong and does not represent
>> the hardware correctly, it only describes BUS and PP0 clock, while it is
>> missing PP1 clock. That means PP1 clock can never be enabled when the GPU
>> should be used, which leads to expected GPU hang even with simple basic
>> tests like kmscube.
> 
> Could you please share how you tested this?

I tested this by running kmscube, see one line above.

> Please share the dt node too.

The GPU DT node is already in arch/arm64/boot/dts/xilinx/zynqmp.dtsi .

> We will also check at our end and revert for this.
I do not understand this statement . Revert what ?

