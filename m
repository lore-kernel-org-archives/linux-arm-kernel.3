Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F78C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rM6j4LxhLEjn1kGDVHysH7RTmZzEzRB3fWDO+/C5SmY=; b=TDuejLXt5H6gPr8GQYqcomxqQY
	D/9mz+eVNwNmW3H3or5vqJCATqA80JVZCoHI6ifjS5sA10K3GaMDCH49Z3OacNprLXnD1JjmZ7REF
	18NQkMdCa2P2e+joGbrCc94noExtQBtNEoMmOvGvgJQeQ7wuM3iwnyZClQgdBm/TS6tt5LsFyids9
	GIaEHybzoDzV4LDPqLYvjYHPx7ByzPXPNhnkVMeOHSHoMUD7G8PBpBaoNJnjQft7iyPmifPPB7wXd
	OY9RCB8dUVpPSwuXSu7nAQFmWdPWHG34F9qII/gk46Q3odp0aYHqyrEcy2enQ3B0l9EaS46IOcE9/
	U8VQDJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcaj-0000000Eh8s-1s4G;
	Mon, 24 Feb 2025 17:50:05 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcYj-0000000EgmY-2fII
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:48:02 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1950725B19;
	Mon, 24 Feb 2025 18:47:57 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PArui_dNLN8n; Mon, 24 Feb 2025 18:47:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740419266; bh=5Dld904E0IHeG2LNNgItT8r0/muuiN9ws/qnIs7U5TA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P3g1rziAdnhX2YblNyPfiR3AAhxzFY2a2ndkuJ+aIHo+hULpG9FghSrzHhVtVdkPw
	 g2kzCK2lwW8jQ+OKADQw2BLZi5hm7jkm6gEYKxoINcdipif3I0+1KkNHELE51n20V1
	 LQR4Lgx4X9CqwGrTZ7tDQ3gv/xq6Ff5AJJePUs7M/GxohccFfbhaq6n/OR80CLKCdP
	 owPUxMgy93fpcc7bzJEMIZDhB2hIlMcDs91CL6juJrTqM9t/QbJGhvNpN8im43POvQ
	 o+FEh2iq9EgOVFiGITvxkinTitrZ++pjeDedL6eeX8Ra7ECzAS/3a9pDmcGZ/9+IkO
	 15sPoMRjczZ+g==
MIME-Version: 1.0
Date: Mon, 24 Feb 2025 23:17:46 +0530
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH v3 5/5] clk: samsung: add exynos7870 CLKOUT support
In-Reply-To: <20250219-discerning-affable-chital-1fdff4@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
 <20250219-discerning-affable-chital-1fdff4@krzk-bin>
Message-ID: <e2ebd4503100ddbbe8d7e21290329e38@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_094801_808880_E734880E 
X-CRM114-Status: GOOD (  17.91  )
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

On 2025-02-19 13:41, Krzysztof Kozlowski wrote:
> On Wed, Feb 19, 2025 at 12:20:32AM +0530, Kaustabh Chakraborty wrote:
>> Exynos7870's CLKOUT registers are the same as Exynos5's. Add the PMU
>> compatible to the existing CLKOUT ID list.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/clk/samsung/clk-exynos-clkout.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
>> index 2ef5748c139b37ca5429b9071ee0e06f44fcf28e..9a31b1c311b45096f1d680b6724571854c08725c 100644
>> --- a/drivers/clk/samsung/clk-exynos-clkout.c
>> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
>> @@ -75,6 +75,9 @@ static const struct of_device_id exynos_clkout_ids[] = {
>>  	}, {
>>  		.compatible = "samsung,exynos5433-pmu",
>>  		.data = &exynos_clkout_exynos5,
>> +	}, {
>> +		.compatible = "samsung,exynos7870-pmu",
>> +		.data = &exynos_clkout_exynos5,
> 
> I wonder why do we need to keep growing this list? All devices are
> compatible, aren't they?

Well, there are two variants of compatibility having different mask
values.

> Do you use clkout, BTW?

Using the clocks defined by clkout? No. I added it as downstream
had it too. And the devices work fine without it. If you want me
to remove this patch and send the PMU patch to its respective
series I'll do that then (unless you object or suggest something
else).

> Best regards,
> Krzysztof

