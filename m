Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBA4D24451
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 17:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=He/OBDAGV/60Kenqn+UX0KL3QxX9Qpvn6cBOoDilKAw=; b=Me7YXKmsUAi7Ctn7JCIISfjd7O
	jap3EapFUzySwKQL64nr3NL46VdKbrWQQooeqnlMTYFB4R5sjBwhRN0FdqPxuOKPJKwIiUiSijqps
	2aooc7QhyekBL7gQ6wnL3jumQdGTYtEuBAPSmCD42ravqkvL1qEomiCRr1csqo7egyxhRNoD+QLcy
	spsS1/IOgdPVyU9N85H+jclZR2gzYSFz49OKkI++0c1RcT2MCcut3vKu5tdQqzp5yCo5RcPbdJyDo
	DgN4JOzzsLvcKiUx88saEfY7pTjYaZbY35BCnyk0rwG2gcserFW/Ol8q6UADsG7chunDwhn41Nal7
	gjgavU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDRI-00000008OnL-1K7k;
	Thu, 04 Dec 2025 17:48:24 +0000
Received: from a7-32.smtp-out.eu-west-1.amazonses.com ([54.240.7.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDRF-00000008OmY-2V7R;
	Thu, 04 Dec 2025 17:48:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5uqmrq7mz5dkaze44elodgxarejai7vg; d=collabora.com; t=1764870497;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=16Wn0lQW8kKPXKmHoDG0CVbwJTQ2tCjlkPsSCWmeuKY=;
	b=e5VOgMYfFdxFaOJi5sPPXb3rnuya2KmOJopWwfOuyZ79JpWsZQQAhMU7lw79DA7+
	2WZjhIgmGejNJNpd6OBvddg66OfGqPAHmLVYlC0IunD4cuxmgSkvM63+8WHPw1UZXGy
	9upEuuPSzRDPo+rSWTTd8z4ko+RQfqWQwiJ5hVBXSlacUKqxAGJ7gBMKN+orCo9PI11
	TXUYN+ydHIeJShgdHhzY9crFzG7JqXmxrqSnieYxlE2NJaCGI4eIja3HBMFmW/I4Qip
	4zj88vz6QqWwFhYKKkP9CkNI6CwBc1NUZ6cRrBZ+atc2rAs/iGOODj1S9lhzS1pHyQy
	Q6duny5gdg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1764870497;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=16Wn0lQW8kKPXKmHoDG0CVbwJTQ2tCjlkPsSCWmeuKY=;
	b=lgBm4VvOK7kNJ0MGPWVx6tnFKcdYEcKVj4SuC7tPRqpVvcXnODWC6VUXK4+5/nVR
	enyanw+ttrjApK2Vcjad2jzk1qWVbQZwqhU8FJAIu4bOh8tzOrv5bBO314vPsrJGUlg
	ZPbyrmj3IsUtcIhYfnO5kdMknDotcg+/csErLzbE=
Message-ID: <0102019aea7aa358-97e812cb-8010-4699-9a0e-ec041d6d9316-000000@eu-west-1.amazonses.com>
Date: Thu, 4 Dec 2025 17:48:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: rockchip: samsung-hdptx: Pre-compute HDMI PLL
 config for 461.10125 MHz output
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251204-phy-hdptx-pll-fix-v1-0-d94fd6cfd59b@collabora.com>
 <20251204-phy-hdptx-pll-fix-v1-1-d94fd6cfd59b@collabora.com>
Content-Language: en-CA
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <20251204-phy-hdptx-pll-fix-v1-1-d94fd6cfd59b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2025.12.04-54.240.7.32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_094822_293370_87CEEAEE 
X-CRM114-Status: GOOD (  19.68  )
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

On 12/3/25 5:54 PM, Cristian Ciocaltea wrote:
> Attempting to make use of the 1080p@120Hz HDMI mode with 10 bpc RGB on
> my Acer XV275K P3 monitor results in a blank image.  A similar behavior
> has been reported on Philips 279M1RV.

Hello,

I'm the Philips 279M1RV complaint, and this patch fixes the problem on 
that monitor for me.

Tested-by: Derek Foreman <derek.foreman@collabora.com>

Thanks,
Derek

> The faulty modeline is created by drm_gtf_mode_complex() based on the
> following EDID entry from the Standard Timings block:
>
>    GTF:  1920x1080  119.999987 Hz  16:9    138.840 kHz    368.759000 MHz
>
> It's worth noting the computed pixel clock ends up being slightly higher
> at 368.881000 MHz.  Nevertheless, this seems to work consistently fine
> with 8 bpc RGB.
>
> After switching to 10 bpc, the TMDS character rate expected for the mode
> increases to 461.101250 MHz, as per drm_hdmi_compute_mode_clock().
>
> Since there is no entry for this rate in the ropll_tmds_cfg table, the
> necessary HDMI PLL configuration parameters are calculated dynamically
> by rk_hdptx_phy_clk_pll_calc().  However, the resulting output rate is
> not quite a perfect match, i.e. 461.100000 MHz, that proved to be the
> actual root cause of the problem.
>
> Add a new entry to the TMDS configuration table and provide the
> necessary frequency division coefficients for the PHY PLL to generate
> the expected 461.101250 MHz output.
>
> Fixes: 9d0ec51d7c22 ("phy: rockchip: samsung-hdptx: Add high color depth management")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 29de2f7bdae8..cafa618d70fd 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -414,6 +414,8 @@ struct rk_hdptx_phy {
>   static const struct ropll_config ropll_tmds_cfg[] = {
>   	{ 594000000ULL, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>   	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> +	{ 461101250ULL, 97, 97, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 71, 1, 53, 2, 6,
> +	  35, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>   	{ 371250000ULL, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>   	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>   	{ 297000000ULL, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>

