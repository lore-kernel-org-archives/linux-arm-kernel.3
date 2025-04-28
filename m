Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E08C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7+h/LgZtBmvJt8JuJ5cbWqsFbL9/uU/TCLyYAqk33s=; b=V+MCFcySvEOEQ02RX0K7XMOQ9q
	n7Iofz3amxCkFxXrFolCdz7N2VkbKaqRaGfXUUAqsxNkx+rSFM+6BVdKMRaUsmZHiwW/yk1Fw+YSa
	9a3JmxmxF2wnsDF6Khtlgt1SQJSXhpDdP/g2l7TKidxJPqzY3JfiLAZlcSdbJwQO4x4QrjzzBDsIM
	hbhvdbqz0fKb63sHO6cH7cifrCCzr5ZamLWMY9vo4m0jwp9BFWeF0ydnkuIvKRsP26gQvjmUqmFF3
	nOtmgo5zZognXw39t7grx4fcnk6SllFM3U8H9dWxKx9lwqYyLVVtMtId/brkTJ37f4Ckn8IrR60m8
	EP+g1M9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Pus-00000006hKB-0Zp3;
	Mon, 28 Apr 2025 14:57:06 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PhJ-00000006fWO-0Wvf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:43:06 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEh0JD2801171
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 09:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745851380;
	bh=J7+h/LgZtBmvJt8JuJ5cbWqsFbL9/uU/TCLyYAqk33s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ScNhtt87S6L5/RXRu3uQs1c2gOVUzCCvnUBkonVZaNmPICtYHcpHAfY7+7XyskCRM
	 bb8VMEQ097iak0CDJ+tm5sSireTi89IjNm7E3/E1yMyIkm0NoUqtD99eRjUmtUsr33
	 W+VycRRJLzO4mSMcSczdh4NWTHFyZJZ8KIZ+p3xA=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SEh0LH010797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 09:43:00 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 09:42:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 09:42:59 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SEgxWO102875;
	Mon, 28 Apr 2025 09:42:59 -0500
Message-ID: <09979b2a-73b0-4a74-978c-b082764e777e@ti.com>
Date: Mon, 28 Apr 2025 09:42:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add global CMA areas for few TI SoCs
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>
References: <20250424084415.66457-1-j-choudhary@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250424084415.66457-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_074305_269134_E3316EFF 
X-CRM114-Status: GOOD (  13.79  )
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

On 4/24/25 3:44 AM, Jayesh Choudhary wrote:
> Hello All,
> 
> Following AM62* platforms[0], this patches add global CMA reserve area for:
> - J721S2-EVM (1056 MiB)
> - J784S4-EVM (1920 MiB)
> - AM68-SK (1008 MiB)
> - AM69-SK (1904 MiB)
> 
> These SoCs does not have MMU and hence they require contiguous memory
> pool to support various multimedia usecase.
> 
> The calculation was done considering H264 codec requirements, dual-display
> supported in each platforms and multicamera use-cases.
> Additional buffer was kept for other peripheral s and to account for
> fragmentation.

What if I'm not going to use 8 cameras, 2 displays, and decode 16 H264
streams all at the same time? Why should I always lose 2GB of DRAM
unconditionally, just in-case someone someday runs this imagined
worst-case situation?

If I *do* intend to have my device perform some nightmare use-case like
the above, I can pass the needed CMA size in on the kernel command line.
That is a configuration for my specific use-case after all, and DT is
*not* for configuration, especially not insane configurations like this.

Andrew

> The breakdown is mentioned in each commit message.
> 
> [0]: https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/
> 
> Jayesh Choudhary (4):
>    arm64: dts: ti: k3-j721s2-som-p0: Reserve 1056MiB of global CMA
>    arm64: dts: ti: k3-j784s4-j742s2-evm-common: Reserve 1920MiB of global
>      CMA
>    arm64: dts: ti: k3-am68-sk-som: Reserve 1008MiB of global CMA
>    arm64: dts: ti: k3-am69-sk: Reserve 1904MiB of global CMA
> 
>   arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi              | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi            | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 8 ++++++++
>   4 files changed, 32 insertions(+)
> 

