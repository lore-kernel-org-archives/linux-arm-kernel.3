Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268FEC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7d3fROQsxfR6t49vpgfkS/CzgZu3gPFWJ1CEYt+M9dI=; b=gZPR/yAc0QNgd0utqUk2A+XHHb
	GIj6I/oZ5n6rLZGR8e7g5ANDHpqmo1oSh+9wIIbhuRqSZl3er13dyZpCVb3pL5iHKrGSRuCTk/yrG
	S3iKOL9qdMnGoAOA/n98sHMs4RE2WvVa40yZJ3iDBHQbMQ2KWgiWchx+egMgmlJXapTmMnrgxjUit
	hmo+C4DKbCfaYZPvXm9JsRyuniKXTfhF9NmCB3rPToUxWBp3GAiDLfifP8AlWnFYpxkH7ytAn15A2
	usD24hEvxOCcdsPMdNB8CT1PQR2mvBtLfgOaoh5ta8lgFlc8I1lwRBY88WFIieea25Kka+beIp8Gp
	jv6LleXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqpw-00000003LTc-1fbz;
	Mon, 07 Jul 2025 18:45:08 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqQv-00000003HHx-1sAM;
	Mon, 07 Jul 2025 18:19:19 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2AF6F2594D;
	Mon,  7 Jul 2025 20:19:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOWxhEcrvivp; Mon,  7 Jul 2025 20:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751912352; bh=p/dxjs15L0a5Sz3tQHqcixRBIuA7PAMaCm/nWUbvrek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=T00pbbO+jCdvdkvIOoT6jI7hss0OLTm99ZQjqyKP0L63hGzaxERsjIaztPSoaoORF
	 1bJYYaStDXrDm/zv9bRXZce5ftZbkx23l4AEXDtrOymMtJhsbUjhm38jaX7O5wrPM2
	 /UpYZ1axzfYs7RRBc2kG7fJ6FkyUHqIVB+8dCpzrkEKBmrWH5psxF0s206xVOUjuKE
	 fKwMdeNUIththWg4Ux0gZLKiAL0HNGC3sy8lJPqFR1K2EtfxHzfAz4r3Tq2vG/tb9c
	 qQiwDnl2UnKi8Px8Hgcz9jWGx/gAP771HIfkKehg+zgY26YirynXh2y9IOan+DWhKH
	 vES+3MNw0y1yQ==
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 18:19:12 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: exynos-mipi-video: allow skipping absent PHYs
In-Reply-To: <ff887aaf-966a-41ff-a905-f791820136fd@kernel.org>
References: <20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org>
 <20250627-exynos7870-mipi-phy-fix-v1-2-2eefab8b50df@disroot.org>
 <ff887aaf-966a-41ff-a905-f791820136fd@kernel.org>
Message-ID: <2153e31b0b15d2b5b630aa4c387dc4b3@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_111917_901282_123078A2 
X-CRM114-Status: GOOD (  17.81  )
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

On 2025-07-05 08:35, Krzysztof Kozlowski wrote:
> On 26/06/2025 22:01, Kaustabh Chakraborty wrote:
>> 
>>  struct mipi_phy_device_desc {
>> -	int num_phys;
>>  	int num_regmaps;
>>  	const char *regmap_names[EXYNOS_MIPI_REGMAPS_NUM];
>>  	struct exynos_mipi_phy_desc {
>> +		bool present;
>>  		enum exynos_mipi_phy_id	coupled_phy_id;
>>  		u32 enable_val;
>>  		unsigned int enable_reg;
>> @@ -54,10 +54,9 @@ struct mipi_phy_device_desc {
>>  static const struct mipi_phy_device_desc s5pv210_mipi_phy = {
>>  	.num_regmaps = 1,
>>  	.regmap_names = {"syscon"},
>> -	.num_phys = 4,
>>  	.phys = {
>> -		{
>> -			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
>> +		[EXYNOS_MIPI_PHY_ID_CSIS0] = {
> 
> 
> This should be a separate change... but overall I don't like existing
> idea and I think your change is a reason to fix actual code style 
> issue:
> 
> It is expected that each variant will define static const array and 
> then
> you assign in:
> 
> static const struct mipi_phy_device_desc exynos5420_mipi_phy = {
> 	.phys = exynos5420_mipi_phys_data
> }
> 
> which means:
> 1. You don't waste space for unused entries (now you always allocate 5
> entries, even if you have one phy)
> 2. You can count them easily - ARRAY_SIZE
> 3. Index in the array won't the the phy ID, so you need a separate ID
> member for that
> 4. You do not need this odd 'present' field, because really code which
> is not initalized should mean 'not present' and it should be never
> needed to initialize additionally to indicate 'yes, I do exist' beyond
> basic initializations.

Weird, I don't know why had I even developed this patch. The 'issue' it
fixes isn't even an issue. Oversight, I'll drop it I guess...

> 
> Best regards,
> Krzysztof

