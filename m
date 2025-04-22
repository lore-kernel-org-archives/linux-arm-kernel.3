Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E8CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+KF6QErdbY2aGPv8cN6+b4qKLV/yGuzbUNxXqDuDzo=; b=nMJrZLJAQOFzHmH0HaLWls2/gg
	OnLBFe5ANdt06po+CJV8x81iPnh2bKnT2R9d8NnY4n0+ehdi8UZTSFZOQxe3FvfAHGhV3aw15bEn6
	Rm2Us92ySq/thG095gc9vNhEVqBiGtoBaGfCUzZ36J9cDbMRlRFs3verSnCkio+x7qFDxPy0/NJow
	F4E8j+GjxLqbj/PhphW85EyVGDOi+w6JyVoChe0Acl3wUCDl+aCC7iJKljvZU/jjTeEFXRf6FX4tE
	LYbgBSCOfcRwBmUYcjtc3pRcMAZI4aAUSqD3J1Mvp5YkXOy+9Wf2y4abiE46/DdvMnt760LzeUJ5A
	5jM9UOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Flv-00000007lpT-3T8I;
	Tue, 22 Apr 2025 15:42:55 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EXC-00000007Ta6-0kX2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:23:39 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MENRxV1230927
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331807;
	bh=T+KF6QErdbY2aGPv8cN6+b4qKLV/yGuzbUNxXqDuDzo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WKbocqX2ZNL+tQd5wEGF/zAANTA9bOepLYZvKBUIuA7z6kT45tol0AXFXKl76ge85
	 B0R9p02Auohxbg2vH6yLoljQ7IqPVTyGyAJvbduJEJ5WLIyqe+Nh4UmS6S/haIKGho
	 1bfnQEl90lv098tvP/H3wnYS2bl4ams6rmAw6nE0=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MENRAF000308
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:23:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:23:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:23:26 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MENQjG000925;
	Tue, 22 Apr 2025 09:23:26 -0500
Message-ID: <86938add-1ccc-4be3-af3f-cff911c96d42@ti.com>
Date: Tue, 22 Apr 2025 09:23:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
To: Nishanth Menon <nm@ti.com>
CC: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <lumag@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20250421201055.3889680-1-jm@ti.com>
 <55d306d4-c9cd-4119-8798-b65a6956f4df@app.fastmail.com>
 <54b6880a-bf65-4a79-8f3e-9fa66b6c3550@ti.com>
 <20250422142207.2tu7gmhnjercmoa2@basil>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250422142207.2tu7gmhnjercmoa2@basil>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_072338_329093_FB2E446D 
X-CRM114-Status: GOOD (  15.12  )
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

Hi Nishanth,

On 4/22/25 9:22 AM, Nishanth Menon wrote:
> On 09:15-20250422, Judith Mendez wrote:
>> Hi Arnd,
>>
>> On 4/22/25 1:37 AM, Arnd Bergmann wrote:
>>> On Mon, Apr 21, 2025, at 22:10, Judith Mendez wrote:
>>>> Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
>>>> across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
>>>> default on am64x SK board.
>>>>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>
>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The patch seems fine to me, but you should address it at the
>>> TI K3 maintainers, so they know they should apply it and forward
>>> it to the SoC tree. You have Nishanth and Vignesh in Cc already,
>>> so I assume they will pick it up from here, just put them in
>>> 'To' instead next time and move Catalin and Will to 'Cc' or
>>> leave them off entirely.
>>>
>>
>> Will re-spin and fix the to and cc lists, thanks for reviewing!
> 
> There is no need to respin, it is already in my queue. Will pick it up
> as part of usual process. The above information that Arnd provided is
> for future reference.
> 
Sounds good, thanks for the help.

~ Judith

