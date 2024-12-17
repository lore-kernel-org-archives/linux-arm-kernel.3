Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B481E77187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxoUsZGHcpmKWLj+fokxr1yAa0cTzHmO/DM2CxwXJvo=; b=2YevHKrUMUDQM4b1lmhZoGDJB6
	/Y9p+OyYTwFVoSR2dzQ70+GXdtmlk/g8awSRvjxNZZ4PfLy26IpSwncj8PVWHKqzArrMP1RtEick/
	qPpyVK0m4y+KXGejT41gUVDe3B/uiEdUOnD3Ut5fFiqy99K5BOfwdzco990MCu/3zoSdxB9G+pm3J
	UHx3OhkcOALvNcGLHHHD/7m1iIro+//0pLsb+6Fkb29IJME0SRwYSNp9eIcXuouhMfvzPlFi0a95i
	pUWbdvfDiWGPC9YMQaMT9Su0pcDhj8jhvV+S0Mb/NXGNgCfuJybMHVJTbPh0PQ3M7egqCDU3cr5Pt
	95pI00ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfR5-0000000Euzo-2F9L;
	Tue, 17 Dec 2024 21:48:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfOZ-0000000Euas-2HtO;
	Tue, 17 Dec 2024 21:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734471982;
	bh=9/SlMqJheV6UBlMdYFEbz4fj4zpzDrak/dbk5Hz2i7E=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=A9VWstEzPcXQiWHL0C4j6BVCWeKwPoOtm1T/XMCWve83tkNjkNOyZlAWQSNPm1P30
	 MfQuPMdoNnBDLUZr5DKsIsUnxhmN0UAA89kTnyOB3QCLd7iJ6KVD3AC95iuab7Yn7G
	 Eifiv1gvsW7mBze0HKR+KCIrEnrEfyDHifr+veNHpJrdqbEHf6lz0O6amCY69buCtu
	 Hf7J7YXPCb0WKByKoe9Co8sseE6kTC/wBJjYuZNXfeOuJm9YyYCrvyJEQ8lS2Mr7be
	 b1Mip2WCQ63TvMiqtG1SbGeHOtP3Y7alg3oxNuebUvDeJXuhEbiYCHoZWf+P3Ovq+4
	 ZUPbX6RdIoBWA==
Received: from [192.168.1.90] (unknown [84.232.140.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 223D817E381B;
	Tue, 17 Dec 2024 22:46:21 +0100 (CET)
Message-ID: <b13cbeda-79b6-4700-a2e7-083a50541c80@collabora.com>
Date: Tue, 17 Dec 2024 23:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Provide devm_clk_bulk_get_all_enabled() helper
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com>
Content-Language: en-US
In-Reply-To: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_134623_730373_91F6232B 
X-CRM114-Status: GOOD (  18.98  )
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

On 12/17/24 11:41 PM, Cristian Ciocaltea wrote:
> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> return the number of clocks stored in the clk_bulk_data table referenced
> by the clks argument.
> 
> That is required in case there is a need to iterate these clocks later,
> therefore I couldn't see any use case of this parameter and should have
> been simply removed from the function declaration.
> 
> The first patch in the series provides devm_clk_bulk_get_all_enabled()
> variant, which is consistent with devm_clk_bulk_get_all() in terms of
> the returned value:
> 
>  > 0 if one or more clocks have been stored
>  = 0 if there are no clocks
>  < 0 if an error occurred
> 
> Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
> the past form of 'enable'.
> 
> The next two patches switch existing users of devm_clk_get_enable() to
> the new helper - there were only two, as of next-20240913.
> 
> The last patch drops the now obsolete devm_clk_bulk_get_all_enable()
> helper.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v5:
> - Rebased series onto next-20241217
> - Removed the patch introducing the new helper - merged in v6.13-rc1
> - Updated last patch to fix a rebase conflict
> - Link to v4: https://lore.kernel.org/r/20241019-clk_bulk_ena_fix-v4-0-57f108f64e70@collabora.com

@Angelo, Matthias, Bjorn:

Could you please provide an ack for the first two patches so that
Stephen can apply them to the clk tree along with the last one removing
the obsolete helper - there are no other users of it as of next-20241217.

Thanks,
Cristian

