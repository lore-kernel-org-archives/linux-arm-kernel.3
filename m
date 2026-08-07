Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CABCC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIKpI3uZ34B35QjxV9DX5tJ3U5Uy0uDSO/d0q5BbUWE=; b=qhjyXEjbzwJdi+3KFQq+luguPp
	+s0lU/NPw6eDgRDQvuUhQBjgII2LajJ9MCbA2cVR9fIq/ChPsGVGvDOQ4GklYGOuUt+MDBKpja53d
	R4cSx8qnQRYk0UwfJnG5NO548yrMeEv0JAmrFCHxT9ghlhUxRyUFt7RMXmQ55qNwDImmD/KzN9D+U
	BNUUjQm3yFJRoyeWEO295ZOdUnRTz2m6hjlEJ9ZHwIhHsPZ7CDKnq30TGQ09BJ/hGvwjz5stY+EwD
	R9pmEiHRwHra8XAmTwLdvBF4M7mrETNNV+OpolXkEczMyKCqytWeSBwpq89707cYJKXBlmsW5bGqj
	R3kDplgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLQ8-00000008Feb-0sMj;
	Fri, 07 Aug 2026 14:19:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLQ4-00000008Fcp-3MGu;
	Fri, 07 Aug 2026 14:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786112368;
	bh=hgwRBzRiQJNn4iMUuJnS82O/yDS20iHLzWusYFbGalo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nu7JHy7YiD0+TngKozpgIkC3QZ4PsngzLPvbc9+b86Uvi6/uZoSc7+2OGspM4b1y5
	 +Q6MVKTSa848xdcw7eaWVRhBPbVmPry5EyAnl+ApGANht+g4b/lMNY8BLFjVJCNusU
	 nvF1TWQJHJcbHSfQPCXNWP0ClV2hOL0a/O2cuacerjVN2613+ZbwjatYQyfsOjbliy
	 2Q41W4DrLYDK8aoOfQeUbiMmzbMe1XKEeDr2EzNTNQUe/tOr1znajcWUcz7gT7tGYd
	 lRkTSUWQJp1biW6b7IAnS8tJ8bj/3ibxImaA3XliRDXmXEug2VcczhQh6w/G66+FLO
	 ATOk9Wz0lCQcg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBC1817E0048;
	Fri, 07 Aug 2026 16:19:27 +0200 (CEST)
Message-ID: <605f96b2-709c-49f6-9446-49ed3bff7d96@collabora.com>
Date: Fri, 7 Aug 2026 17:19:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] phy: rockchip: samsung-hdptx: Prevent
 divide-by-zero when computing clk rate
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andy Yan <andy.yan@rock-chips.com>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-2-8e786067865f@collabora.com>
 <qe6i5bvrn32xmwncl4zq3f5w6twpwfwvq5alaacsceq3vxn3nt@mbeytagr77j3>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <qe6i5bvrn32xmwncl4zq3f5w6twpwfwvq5alaacsceq3vxn3nt@mbeytagr77j3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_071933_016862_4E3D3C15 
X-CRM114-Status: GOOD (  15.99  )
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

Hi Mani,

On 8/7/26 3:56 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 23, 2026 at 10:41:45PM +0300, Cristian Ciocaltea wrote:
>> Calculating 'sdm' fraction in rk_hdptx_phy_clk_calc_rate_from_pll_cfg()
>> could trigger a divide-by-zero, as it uses div_u64() with a denominator
>> read directly from hardware: the values ropll_hw.sdm_deno,
>> ropll_hw.sdc_deno, ropll_hw.sdc_n, and ropll_hw.sdc_num are populated
>> from PLL registers which, in theory, could be left by the bootloader
>> uninitialized/misconfigured.
>>
>> Provide the necessary sanitization to avoid trusting the hardware state.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/patchset/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com?part=1
>> Fixes: 3481fc04d969 ("phy: rockchip: samsung-hdptx: Compute clk rate from PLL config")
>> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 710603afff86..44e99343f249 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -2270,10 +2270,15 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>>  
>>  	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;
>>  	if (ropll_hw.sdm_en) {
>> +		val = 16U * ropll_hw.sdm_deno *
>> +		      (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num);
>> +		if (!val) {
>> +			dev_dbg(hdptx->dev, "Invalid ROPLL hw state: deno == 0\n");
> 
> If the hardware state is invalid, why can't this be a hard failure?

This is an internal helper called from the .recalc_rate clk_op, which tries to
compute the current rate by reading back the hardware state. 

Since .recalc_rate returns unsigned long, we cannot propagate errors to the
caller.  However, per the clk_ops documentation, the driver is expected to
return 0 if it cannot figure out the rate.

Moreover, this condition isn't really fatal, as it only means the PLL
configuration currently stored in hardware can't be translated into a rate.  The
next .set_rate should program a valid configuration and help with the recovery.

Thanks for reviewing!

Regards,
Cristian

