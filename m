Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B605FC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C54Jp/OXwn6pBr69apSdFNlJcGXa//mpbe0LaniyLCY=; b=4r11eWbXovZ4TCGpbIRcxSGHhO
	cRmQtpP4XZSv1ot+BW+M9omSzOAE+cfKJEFwcYykBIDwOZIasH9UB92RV2qKHyhi7/nDlgV6CtVHy
	NKSho5brJzrrMl+R0uQM4o8zMvuwgtry/CdfnrYl8XWV+yvK0LVR/qe1YxKyXKAcuDugsgMbEXnb1
	76YvaCI3ZN9HE0mRK/3S2HO/vEuBP/2RHvptOMI5HdWOIPGIboLNWfKNrQ+yweiIBLOlR9lYDJI7b
	5IF3qa2tGK3PYBaMAUz7qo1ASRqZd2TbL+T5BVwfQYE6V1e6oV+KDtGVAeboXbDbdV//K2a37TFcG
	LG0NTKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6vD-0000000D7wS-38uE;
	Fri, 28 Mar 2025 10:26:43 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6sE-0000000D7Ms-3iHg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:23:40 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SAN9k72125479
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 05:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743157389;
	bh=C54Jp/OXwn6pBr69apSdFNlJcGXa//mpbe0LaniyLCY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oltVO8IoBMg/hUAlimth67nyXuBFiEonnp1jULNpxyW40Wm+qowPdOv4DT3pU2cLV
	 WGQMw9m4nXvVEOm4233Sts4Z1FxRuSERUMzAU7oW6LkMW67wKjQPtRPvqJiT9geqjO
	 ZwYwTkXOxYduZP+fWoAc3ImHSPwRnGvagP6fBo3k=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SAN9k6015681
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 05:23:09 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 05:23:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 05:23:08 -0500
Received: from [10.249.140.156] ([10.249.140.156])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SAN2I7002993;
	Fri, 28 Mar 2025 05:23:03 -0500
Message-ID: <de68dc95-25e3-4bed-a2ab-4736a83867a2@ti.com>
Date: Fri, 28 Mar 2025 15:53:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net-next v2 3/3] net: ti: icss-iep: Fix
 possible NULL pointer dereference for perout request
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Jakub Kicinski <kuba@kernel.org>, <pabeni@redhat.com>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kory.maincent@bootlin.com>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <jacob.e.keller@intel.com>,
        <horms@kernel.org>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
        <daniel@iogearbox.net>, <ast@kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Roger
 Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250321081313.37112-1-m-malladi@ti.com>
 <20250321081313.37112-4-m-malladi@ti.com>
 <20250325104801.632ff98d@kernel.org>
 <0799d2f6-3777-45f6-a6b6-9ca3f145d611@ti.com>
 <326ebaa2-7b8f-455c-bf22-12e95f32b71a@stanley.mountain>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <326ebaa2-7b8f-455c-bf22-12e95f32b71a@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_032339_100947_91E24ECB 
X-CRM114-Status: GOOD (  23.53  )
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



On 3/28/2025 1:32 PM, Dan Carpenter wrote:
> On Fri, Mar 28, 2025 at 11: 46: 49AM +0530, Malladi, Meghana wrote: > > 
>  > On 3/25/2025 11: 18 PM, Jakub Kicinski wrote: > > On Fri, 21 Mar 2025 
> 13: 43: 13 +0530 Meghana Malladi wrote: > > > Whenever there is a perout 
> request
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> uldqfVdF3CcxCkXE1pKJH1UXrlua- 
> GvI0DSoHvw1l5Yyu6xCbgDWX8PlhMSuV5lCv48fT7ChvXbQ105c6PHChn2lWCWZMsMcoHjvVwM$>
> ZjQcmQRYFpfptBannerEnd
> 
> On Fri, Mar 28, 2025 at 11:46:49AM +0530, Malladi, Meghana wrote:
>> 
>> 
>> On 3/25/2025 11:18 PM, Jakub Kicinski wrote:
>> > On Fri, 21 Mar 2025 13:43:13 +0530 Meghana Malladi wrote:
>> > > Whenever there is a perout request from the user application,
>> > > kernel receives req structure containing the configuration info
>> > > for that req.
>> > 
>> > This doesn't really explain the condition under which the bug triggers.
>> > Presumably when user request comes in req is never NULL?
>> > 
>> 
>> You are right, I have looked into what would trigger this bug but seems like
>> user request can never be NULL, but the contents inside the req can be
>> invalid, but that is already being handled by the kernel. So this bug fix
>> makes no sense and I will be dropping this patch for v3. Thanks.
>> 
> 
> I don't remember bug reports for more than a few hours so I had to dig
> this up on lore:
> 
> https://urldefense.com/v3/__https://lore.kernel.org/ 
> all/7b1c7c36-363a-4085-b26c-4f210bee1df6@stanley.mountain/__;!!G3vK! 
> XPLUWNuB49W9FXpnac95FM8thR9_zMOBwt7JgYy8Yaf72LIm4Xt-3Yc8h1sEti5uVdguSWQhcfsnC1_ymQIMTg$ <https://urldefense.com/v3/__https://lore.kernel.org/all/7b1c7c36-363a-4085-b26c-4f210bee1df6@stanley.mountain/__;!!G3vK!XPLUWNuB49W9FXpnac95FM8thR9_zMOBwt7JgYy8Yaf72LIm4Xt-3Yc8h1sEti5uVdguSWQhcfsnC1_ymQIMTg$>
> 
> This is definitely still a real bug on today's linux-next but yes, the
> fix is bad.
> 
> drivers/net/ethernet/ti/icssg/icss_iep.c
>     814  int icss_iep_exit(struct icss_iep *iep)
>     815  {
>     816          if (iep->ptp_clock) {
>     817                  ptp_clock_unregister(iep->ptp_clock);
>     818                  iep->ptp_clock = NULL;
>     819          }
>     820          icss_iep_disable(iep);
>     821
>     822          if (iep->pps_enabled)
>     823                  icss_iep_pps_enable(iep, false);
>     824          else if (iep->perout_enabled)
>     825                  icss_iep_perout_enable(iep, NULL, false);
>                                                      ^^^^
> A better fix probably to delete this function call instead of
> turning it into a no-op.

Yes agreed, current bug fix is bad. Will have a fix similar to this and 
post it soon. Thanks.

> 
>     826
>     827          return 0;
>     828  }
> 
> regards,
> dan carpenter
> 


