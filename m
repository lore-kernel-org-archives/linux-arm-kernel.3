Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99857C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wp7WIPM4acbNtx/6GioAbRHdq+dUssBIHTJbsJvHyw4=; b=DIAAkcL9//mVs1LQKKuQhka0D2
	q7VnMspoXFQuDmGF8crd4dPBK0F6MSxM3R7jB7CLDKhvw9Zju3VOS+dTb5R4ddz0nO9o2dxW7X8AS
	ZiplaeKEsURs9H9PAGEb4vMD1aIAjA7RgR2rotoFn8DueFYliBAjZ5JChb+TfehG9B0C4PzlE/w6b
	EIxa9AWweBRVJnBDoAIbjLyhuVIPCY9Y4VX/ECma+tEEMtJ8SWuZRp+ihurpNSnJQQ/YnWF/TfSut
	JUU/6b6Yv3q/l5bry6FIvHQnamvyGyzXSO53IqUbsvkdJUk3nBF9J3GLZCEjNGFshfcUfHmVwVw3e
	er5MN81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VVF-00000007K0r-1X6T;
	Tue, 15 Sep 2026 15:55:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VVE-00000007K0Y-0Mms
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wp7WIPM4acbNtx/6GioAbRHdq+dUssBIHTJbsJvHyw4=; b=YOIamUQON326hqTSps1Ljiyeco
	9lC2S4e6Rvlpf6qcxncjbffiPOUd2WhR09+B9SJAB4c2e6HmP6yx5quddDYviCbXXAxUBdJ3seUg+
	xeiYYEDCYWygVio3QjM+26TyeTxEPLGLAlRq3QXOT0CVtfPkE/ky5uMMaLChp67taAh/zLRkLa3df
	2vNUikpmAT+1fnfvw5yNd63VS3XBe8gH41UCz6m2z7+ozIFStGM5KVOpV/yek8IDVeVEzKn+1r3mi
	/GPgU8VkLrLWdb+g7NwphZLH4OGLsphJ+Qh+NX6xzzEIYHXB5rltgdCiC1L7+dbNsDnBIOp3OkAr6
	w6307AhA==;
Received: from mail-ej2-f12.google.com ([74.125.228.140])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VVB-00000006zAO-1HrB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:55:22 +0000
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so76786566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 08:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487719; x=1790092519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wp7WIPM4acbNtx/6GioAbRHdq+dUssBIHTJbsJvHyw4=;
        b=Jb+hiGtHg49UVOr9w0R/KHBVI4otQUiTpZJwfdKIIPdCJZuWaXXliIaNpOKEIyX6Ph
         dkYAcra1V0ofQs5ITzQpBmp2OSV/Awb8iFu3jWm2cMTyWUtbnnuT6donXXNUgBQM/JDG
         FO5xaOgLVqSR7jOylcK+VRDIxnh3+97BGNAH974iR6i4VbneDBhyiimD1RUpxS6aNejX
         uNgIoq+t2Zxpj4ut4/rATp0f4SCQESW2Ok68Bkx5TJo4WYzYJtCPdh4YgCHml1hPLETV
         gOvtsRhhusAA+rt1HbRm9XOIOXaDymb7ZLLfZj/iRb6O7GF0MEfL5LDRLGztgX0ile2b
         5E1g==
X-Forwarded-Encrypted: i=1; AKwUvBy8iNVV6M2M4qWLjEpYLkO0xeknZJvgOR7e+9XPgd7uZ6OWi+BniyrX7EF7p8afn1g6zwbGCucbfMv5zXBB33XY@lists.infradead.org
X-Gm-Message-State: AFuF++nLiazfWFT6aH2ThKi93n6bKKEC4J1wlscMEv0ZNZ7CFUv0sIUy
	Xdw8wou/ge+APCLX0SxGwQXexnm65V7QL+6GoIjAqQwwd3xWBOB73/Jt
X-Gm-Gg: AYBFou0nBSL9oAWDl8bevNV2NRKH+AbCQiT/w1oFQKXBE7FrezRhBL1hOk/nVmy3d+I
	Wiy0rG7hhK5jLCCF2osJKDcTdQ1H+rQZOC/vkB6LjgB8MUVVDi53vtD7mjSj1Redrp/OPcYcRfT
	WXdc+RAHUArw+gSZjUpxrCE3bsBDojUGXB1JXjZfffY6b7tnVeMn6FCIgDGPlzp4V8dsJadHiqP
	+3DCiZJ9xjoDYtMzNpj/DPlolUvBHXjfywYHasqZiKmAlLDbwDQ67VXY2ZbKlv0ZO/3XoY0f7fB
	BP0wEyWNP7W8REo4dU+JFakZDu4/dYUsaIve2bm7s8QEJd/bNnEzusRiRDTi2y/ShteqNad9+SI
	ocBYOAJ2atE9W7JS6pYp8fga8j6fMqQhgDeQbHsGHEI27dS84kuKM1alN8Ra39mrYRvso5/qVUe
	e/djhxtuXICBFJpF1vdnPG3b6jNpKQTsf9uWx9MCnMoJFkPUJXX3AG64A1Ozud+BxqhkfzbGc2b
	diSSJLP07ZnMaScuYY5jRbKqWG9lXI=
X-Received: by 2002:a17:906:4795:b0:c26:2f09:f2d8 with SMTP id a640c23a62f3a-c29d790987bmr118615366b.36.1789487719226;
        Tue, 15 Sep 2026 08:55:19 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966125543sm610972266b.55.2026.09.15.08.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:55:18 -0700 (PDT)
Message-ID: <dbf50a87-cf43-452d-8a82-6d7ee9af02a6@linux.com>
Date: Tue, 15 Sep 2026 16:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real
 consumers
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_165521_414294_9EE77CA4 
X-CRM114-Status: GOOD (  19.23  )
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

On 11/09/2026 16:40, Ulf Hansson wrote:
> On Sat, Sep 5, 2026 at 5:32 PM Lucas Tanure <tanure@linux.com> wrote:
>>
>> The previous series for the intermittent boot hangs on the VIM4
>> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
>> explained, sys_ampipe_nand clocks a pipeline stage that the
>> hardware design inserts in the bus path between the SD/eMMC
>> controllers and the NIC_MATRIX fabric to help timing closure.
>>
>> So the clock has real consumers: reference it from the three MMC
>> controller nodes and drop CLK_IS_CRITICAL instead.
>>
>> The series crosses three trees; patch 4 (clk) must only land after
>> patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.
>>
>> Changes since v1 [3]:
>>   - Dropped the Fixes: tag; this series is an improvement and should not
>>     be picked up by stable (Jerome Brunet)
>>   - Moved the patch 4 dependency note below the --- so it is not kept
>>     for posterity (Jerome Brunet)
>>   - Dropped the e-mail address from the Assisted-by trailer, see
>>     Documentation/process/coding-assistants.rst (Jerome Brunet)
>>   - Fixed the space-indented error path added to meson_mmc_probe() in
>>     patch 2, it did not pass checkpatch
>>   - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
>>     capability flag, not an SD_EMMC_CLOCK register field
>>
>> Thanks,
>> Lucas
>>
>> Lucas Tanure (4):
>>    dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
>>    mmc: meson-gx: enable the bus pipeline clock on T7
>>    arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
>>    clk: meson: t7: don't mark sys_ampipe_nand as critical
>>
>>   .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
>>   drivers/clk/meson/t7-peripherals.c            | 10 +++----
>>   drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
>>   4 files changed, 62 insertions(+), 12 deletions(-)
>>
>> --
>> 2.55.0
>>
> 
> Patch 1 and patch2 applied for next, thanks!
> 
> Kind regards
> Uffe
Hi Neil,

Any chance you could queue patch 3 for this cycle? Patch 2 is already in
next, and until the DTS lands the MMC probe fails on T7 with "missing
pipeline clock".

Thanks
Lucas

