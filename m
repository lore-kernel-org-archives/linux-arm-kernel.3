Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4yMg62YAe6Tk0Zq+iKrI/zpLYixVD/ZixnriSqWY5c=; b=LmZoOzsj5QZ/FCp5nJtOGVSgZQ
	+SBFON97zOQE74NuMHzlVb7KYQOc7vTwiWwCyDCYllmO3zBVNTdjoixmdZEGAxRVQWTUoggE2jrNJ
	UeAMcO/MHsvlIMXKYpWreZN5W0HCkD7cewmqj4bxajr8Eo5iJJmdE4mYvFgWEfZuIu04Lkvt1/3Ml
	R84Ey0GlX4Q4lfDjz/Aquwo0ET6iYTR20hXtVaWbhsargZE//xfSaQVBJMOGZlbYrwZhAfsO8A9Z+
	k24350iBdlQvalq6DR4Nzua6nI71MssdyN0wLUkbIgrN/44Nuy+C23YnSAMDcT0cH4FiAgNVtoVXx
	bcS0MEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8kt-0000000FTPE-1gGi;
	Tue, 07 Jul 2026 16:34:43 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8kn-0000000FTOh-3pOt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:34:42 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-698aa8d4dafso4410995a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1783442074; x=1784046874; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m4yMg62YAe6Tk0Zq+iKrI/zpLYixVD/ZixnriSqWY5c=;
        b=UwsO5WY39Fb6oK/siXLl3ATbs0GcT56v3rhpQG6nWy9DnO4iAV7Rosbbx3/LpXvSdo
         gYoxJE5DpIK8FOPS5OwlkZtWakZHpGPyoZzAMeTbUlv03Hq07WcXIGClxhMxEUtQ6ObL
         Om+FS+9zNgU2+kGTDkSLvZT7CWIBMb9ZsE4JXAoIi/Z6ygT383c+s+7Wj8voSd/jmUFy
         V/cVlkbm1UJOef+PKn8VdKhvOujD5yoq+gA5aI2iWPXb1Z/VX5+IdWT7PYpoe7igsVn3
         feYIzQa8LK3n1xeYQhv4Z/SISdu1kq42mRL9tHAJfWqyS34qrtQjx8NZCuvoMlQAX+xQ
         F0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442074; x=1784046874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4yMg62YAe6Tk0Zq+iKrI/zpLYixVD/ZixnriSqWY5c=;
        b=NkBDrIDDRyR+B1p4xi2PIcr/g7A4YxJsKGHPP5xLIhf+THMrmwRA8hpxmlLHSWzd/9
         fY9YaMZFyieOtVixg3odLZ3BvEuOlUpNwV0aDxZ1x1F3B+y8vnoxaOnJfTc93IZLkymH
         wQjSB3XICWK+4EPrBPUb+H6crsUZfLHpYlcT9WdElWjxXhXvtwxe6IAUf0rrUzDP0hWZ
         IlrLS06TenUOwheJgbq3eVOYKWSWDmLVYT4yzsL8bVMxiem1iHxX6y0S3ArHdpNmIM1i
         ebDl/ISctEK3ZfcADxKiMuAH0uSklgkbUC8F4uh3xKmQZQN6X3oNqTpjIRcY5SG4lrIg
         CVYg==
X-Forwarded-Encrypted: i=1; AHgh+RqVoBaUllMhi/4KmapqiS9ytUS/Ax9JkT72JIxsG/bq0KDWehLGgMR9bOQJiwQWbcCmhNfkN93FHPB7K0Zxo5nb@lists.infradead.org
X-Gm-Message-State: AOJu0YznIbfyCpXniB5TdIFoH1UDhlGMnHWm217/X6FLYLVonY+t0aOG
	bTARxPJbTBdY3nDBcusoiaG05kfzmqgHt0PJuSO5LXjuVaYaAU78nsTwwo1DroEp3A==
X-Gm-Gg: AfdE7cnuQkoao5b4vkS3J9wVgQSicYFQzRrU0E/dnP/Sj/AenyE7sME1ICTsC/UQV1B
	qsfI3xR6Dg0Lv+6wcO0LeSQrn3SWsTQLcbJtXQE1ye3x9tdYHwEVwaBezqBokasjODsGRLjas5k
	vDLy8n4xDZdybkKgZNHS/bg5BCQlOA9Q+p7chmVI39yF2NPPmzTGeefdmNvZPk/JnyWkPnDZurJ
	IUpQ09cg3ex0D+cho04CpQAx8hM88rxEuF6jK5qSbMK0mIzOzUotN5wCCzu8hStT6hiHLweQTL2
	oONtYK1Z0asePH4UH7gq1jt9yfqrQKYKOMluoyKkkT6LvSt+FDy2PklK5D/g/p599qqqk6JizOD
	KLVmdC7dAnmoK8zX0AoBMTS+lisNIeQFxr6UUyDaA9gXrrEg6cELijiYRMka5gvqazhnTMoKFtx
	tU2Hp1SMY3pYXFeRvWi5A2pq2VJjdO/9tFuv38MsH+G7Y4PQ==
X-Received: by 2002:aa7:d58b:0:b0:697:d4ee:ab97 with SMTP id 4fb4d7f45d1cf-69a8566812cmr2367431a12.12.1783442074173;
        Tue, 07 Jul 2026 09:34:34 -0700 (PDT)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d78a08sm6832401a12.18.2026.07.07.09.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 09:34:32 -0700 (PDT)
Message-ID: <da06120d-0850-4e79-9e07-efe481c057ff@monstr.eu>
Date: Tue, 7 Jul 2026 18:34:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, kishore Manne <nava.kishore.manne@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <cover.1780499520.git.michal.simek@amd.com>
 <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
 <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_093438_107058_D674E974 
X-CRM114-Status: GOOD (  15.74  )
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



On 7/7/26 17:55, Rob Herring wrote:
> On Wed, Jun 3, 2026 at 10:12 AM Michal Simek <michal.simek@amd.com> wrote:
>>
>> The ZynqMP clock controller binding shares only #clock-cells with the
>> Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
>> Also remove "(Optional clock)" from clock description because it is visible
>> from schema itself.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> ---
>>
>> Changes in v3:
>> - Cover change in zynqmp-firmware.yaml
>> - Move clock-cells to be the last in the example
>> - Remove comment around (Optional clock) which is obvious from schema
>>    itself
>>
>> Changes in v2:
>> - New patch in series
>> - Split zynqmp-clk from versal-clk
>>
>>   .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
>>   .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
>>   .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
>>   3 files changed, 76 insertions(+), 49 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
> 
> This is now causing warnings in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware):
> clock-controller:clock-names:0: 'pss_ref_clk' was expected
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware):
> clock-controller:clock-names:1: 'video_clk' was expected
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names:
> ['ref', 'pl_alt_ref'] is too short
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clocks:
> [[4294967295], [4294967295]] is too short
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:compatible:0:
> 'xlnx,zynqmp-clk' was expected
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml

I will look at it. Thanks for reporting it.
Michal


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs


