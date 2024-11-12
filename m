Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA42FD41D4E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 04:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmMLruJlFWW1LhBjQNO6wKWcTB7EUYEqGpqOf2cF01E=; b=UXOz0fHEmpsPvGXDYCjAkPcaWz
	HiU7BwUlnHJ6iznzhtLEEeQc4MHJZ5E6u8hThcXWjeHilRPFZmlG51TyguLFCzq6bHpXTjHj1HWPE
	tGH9iywjVxZRiUXR6ijtcuaZWdAgp76A9V2or9N5sArPNQ02ypgbgDvtnWoH7nx2ioxt3dub/nKE+
	XVXPNrWIIofSd2bgtEfIT3z7H+oMR+iDnkxBWMJ/LZShx557UZvj1apPrUYlU325xqyZUaKrL6mmm
	M4wUW9W/rWvXVJBOPNkiHdPWa4yLFNA5SpPmpcQ26unnlyXpq26HJMgnDv9gqsQryxHsQiwNEWpOC
	z3keWfnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAikn-00000002B5q-3FVV;
	Tue, 12 Nov 2024 04:43:49 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAij1-00000002Ava-0Fhk;
	Tue, 12 Nov 2024 04:42:00 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731386514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GmMLruJlFWW1LhBjQNO6wKWcTB7EUYEqGpqOf2cF01E=;
	b=d/9s8ota76JB/qXgmB068WFHiMOhUh9wAhv1nxyPVHrj97xZafR8vomFmhD1/bP0XYhxf3
	FkKJS6I4dvXI76TVmR9DlmoT4v+5CkajA28AVNjVFikNef/LvO8OM78sV4PxzdO3vaT6s9
	+u0B2XRClK96AHuJUNgfkkzCpcSL7kAAnG/yqYQC8P2QVyylUgdFGN8N0r+wh6vZugEPoh
	uOnENSsxfip+1xh/cdXm6U7baYCp20yiMcpwdXSbU3yQnNaje698yT9AwHdIYJWrksZwu5
	wJUJI/frx56dVgagLJ6bdPpJjAa5P/zngcZeNqaguau7u4t8ISayf3trcN/t/g==
Date: Tue, 12 Nov 2024 05:41:53 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: =?UTF-8?Q?Tam=C3=A1s_Sz=C5=B1cs?= <tszucs@linux.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki
 <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Enable sdmmc2 on rock-3b and
 set it up for SDIO devices
In-Reply-To: <9fbdf05c-42e6-4ac5-9542-805200bc8c87@kwiboo.se>
References: <20241111181807.13211-1-tszucs@linux.com>
 <20241111181807.13211-3-tszucs@linux.com>
 <9fbdf05c-42e6-4ac5-9542-805200bc8c87@kwiboo.se>
Message-ID: <260af427ae64d6f3b02a1579ee83eb3b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_204159_408233_C6BC3520 
X-CRM114-Status: GOOD (  17.61  )
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

Hello Jonas and Tamas,

On 2024-11-11 20:06, Jonas Karlman wrote:
> On 2024-11-11 19:17, Tamás Szűcs wrote:
>> Enable SDIO on Radxa ROCK 3 Model B M.2 Key E. Add all supported UHS-I 
>> rates and
>> enable 200 MHz maximum clock. Also, allow host wakeup via SDIO IRQ.
>> 
>> Signed-off-by: Tamás Szűcs <tszucs@linux.com>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts 
>> b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> index 242af5337cdf..b7527ba418f7 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> @@ -688,14 +688,20 @@ &sdmmc2 {
>>  	cap-sd-highspeed;
>>  	cap-sdio-irq;
>>  	keep-power-in-suspend;
>> +	max-frequency = <200000000>;
>>  	mmc-pwrseq = <&sdio_pwrseq>;
>>  	non-removable;
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
>> +	sd-uhs-sdr12;
>> +	sd-uhs-sdr25;
>> +	sd-uhs-sdr50;
> 
> I thought that lower speeds was implied by uhs-sdr104?

Last time I went through the MMC drivers, they were implied.  IIRC,
such backward mode compatibility is actually a requirement made by
the MMC specification.

>>  	sd-uhs-sdr104;
>> +	sd-uhs-ddr50;
>>  	vmmc-supply = <&vcc3v3_sys2>;
>>  	vqmmc-supply = <&vcc_1v8>;
>> -	status = "disabled";
>> +	wakeup-source;
>> +	status = "okay";
> 
> This should probably be enabled using an dt-overlay, there is no
> SDIO device embedded on the board and the reason I left it disabled
> in original board DT submission.

Just went through the ROCK 3B schematic, version 1.51, and I think
there should be no need for a separate overlay, because sdmmc2 goes
to the M.2 slot on the board, which any user can plug an M.2 module
into, and the SDIO interface is kind-of self-discoverable.

Of course, all that unless there are some horribly looking :) error
messages emitted to the kernel log when nothing is actually found,
in which case the SDIO/MMC driers should be fixed first.  Also, I'm
not sure what do we do with the possible SDIO-related power timing
requirements?

