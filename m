Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2FCD41C32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 10:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXvr4mO7fwTlJpWCcYy7vDBdoktmMmTS8oTatIqGyUU=; b=S7f+MffjCJ8nh8sSi+hoxUNtFx
	7/bRBKRQoSg4l/OqIGH9dq36VQEtTUAVWwKp/pM6JS39X7CaIGKH5xoqDXlv1PH9IlU1DI73LL59s
	WHgvSltFYYZv/wKNaS07bwAI7hOYMhUk9lEggDzJ2Tz4rAdVfcn0iQMiAocDRUyRaxYfyHuFIo9py
	FL7qgyLU1KgMe+cCKvqkY3bD8d+iHcpH1XFe7cvfGkG2L9omvbm4E6B8YrJxKAZhmVavkAVtbr5qL
	CzVVOf1pJnix0aoeCx0fyRKAuzr2aWytRWwMn+Te3ytqAGWp4QZdz32EkvMngZBUHA0lUQznCKjND
	gLstCXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAuS-00000006UdL-0daD;
	Wed, 13 Nov 2024 10:47:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBArB-00000006UEZ-04Vo;
	Wed, 13 Nov 2024 10:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fXvr4mO7fwTlJpWCcYy7vDBdoktmMmTS8oTatIqGyUU=; b=kWeTH+et/fxpQNlA/fe+KREjsY
	EXr5W2bNBeKw7EvybFcGwiTUo0eIVVKixHqGSTstd/EqvW1UlH/0rxIfICvYid+Fizbx1+9iLgjDt
	cj7NjP9xBXpfyjAucCzbxkN6Db4nKE5ga1T4fGS/jwFsaL2KsK3z4oPkdEAsYt6MyV6undPb0jaNE
	cRdDeV0WQ16WzB+NiuVjHBOkg3cgHUtE8/nDuFvPiG2BOJX0iRW+HowdmQU6fxDLjxQgPIURWDNwy
	rP3k3y4fnDbO9VfZWrjsw3RatajrRyvhh1A1fZmzf9AVH3Ep+hESXbQBPu6DvWz5De0I02gQHGlET
	YueDkKAg==;
Received: from mail.manjaro.org ([116.203.91.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAr7-0000000DFix-2Qi6;
	Wed, 13 Nov 2024 10:44:15 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731494650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fXvr4mO7fwTlJpWCcYy7vDBdoktmMmTS8oTatIqGyUU=;
	b=Leuit8V4P3a7G9UdIsXI39a1z5PMuvjjfv1EPKqMbZTmr3CRfgGypgMcFQrPEQdvKTMqLP
	SUi0isgEl2+8FhafPxCjjMSmfQBVd+K1kmjqL4yUpm7xXIvdRyVj/ZW4eRT1iMOAFHQ+zy
	j+HkloQT6FGUuUicCgkFlwZKODS/EagW0DbgJegbq9v03RlxxDIC8ya73nFiTm28xJsrGZ
	zHf/IWxr4i1FFC7lBZXkhbLYr0JodZgOlIEeCX8cG6P4cJ1+kDdO7KEam4JuQaKU9GDDhF
	FAKJadyj5NTaSNY5yadsOtLaFrBR4jXtARGJLMeVm4Ph8O/v+dOxmHqJMlcubQ==
Date: Wed, 13 Nov 2024 11:44:10 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Tam=C3=A1s_Sz=C5=B1cs?= <tszucs@linux.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki
 <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Enable sdmmc2 on rock-3b and
 set it up for SDIO devices
In-Reply-To: <CA+Gksr+aoDazT3b7uPFTOf5h3Drn3idZ5Kiris3k1fAxweXcyQ@mail.gmail.com>
References: <20241111181807.13211-1-tszucs@linux.com>
 <20241111181807.13211-3-tszucs@linux.com>
 <9fbdf05c-42e6-4ac5-9542-805200bc8c87@kwiboo.se>
 <260af427ae64d6f3b02a1579ee83eb3b@manjaro.org>
 <CA+Gksr+WvS-S+jeYYG=Bo9cemvnJmjsmU4aj9YnD3t8-HY7wbw@mail.gmail.com>
 <303ad3910668e852d6670d1c79dc22e0@manjaro.org>
 <CA+GksrLLbfyHdvu1VYB4S+W78C0T1DEWu5W6pP2-g3KdBeT-LQ@mail.gmail.com>
 <eed7f35d1311eced9144fd7a5656b58f@manjaro.org>
 <CA+Gksr+aoDazT3b7uPFTOf5h3Drn3idZ5Kiris3k1fAxweXcyQ@mail.gmail.com>
Message-ID: <7229c5a3e9cef5dc05f6c42a846fcd29@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_104413_881279_4A6E902D 
X-CRM114-Status: GOOD (  44.93  )
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

Hello Tamas,

On 2024-11-13 11:24, Tamás Szűcs wrote:
> On Wed, Nov 13, 2024 at 12:38 AM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> On 2024-11-12 22:05, Tamás Szűcs wrote:
>> > On Tue, Nov 12, 2024 at 4:16 PM Dragan Simic <dsimic@manjaro.org>
>> > wrote:
>> >> On 2024-11-12 15:35, Tamás Szűcs wrote:
>> >> > I think it was totally fine to disable sdmmc2 at first, especially if
>> >> > it couldn’t be tested or wasn’t needed right away. From what I’ve
>> >> > seen, this board works great even at higher clock speeds than what
>> >> > rk356x-base.dtsi suggests. I don’t have access to the RK3568 errata,
>> >> > and there don’t seem to be any limits mentioned in the TRM either.
>> >> > Overall, this board is doing just fine as it is.
>> >>
>> >> Sorry, I'm missing the point of mentioning some clock speeds?  Any
>> >> chances, please, to clarify that a bit?
>> >
>> > It's all about stress scenarios, right. Sustained transfer at maximum
>> > clock, multiple SD/MMC blocks used concurrently. That kind of thing.
>> > Different data rates forced. I hope that answers your question.
>> 
>> Ah, I see.  Though, I don't think we should worry much about that,
>> although testing it all is, of course, a good thing to do.
> 
> Better be safe than sorry. Let's just say I've seen worse.
> 
>> >> > Regarding device tree overlays, they would be ideal for implementing
>> >> > secondary functions, such as PCIe endpoint mode for users with
>> >> > specific requirements. However, the primary functions for PCIe on the
>> >> > M2E will be root complex mode, along with SDIO host, etc. In my view,
>> >> > the hardware is well-designed and interconnected. Users have a
>> >> > reasonable expectation that these primary functions should work
>> >> > seamlessly without additional configuration, right out of the box.
>> >>
>> >> That's basically what I referred to in my earlier response, and in my
>> >> previous response regarding the UART.  Users would expect the
>> >> Bluetooth
>> >> part to work as well, but the error messages I mentioned look nasty,
>> >> so
>> >> perhaps something should be done about that first.
>> >
>> > I'm not aware of any nasty error messages especially related to UART.
>> > Well, MMC core will acknowledge when the platform part fails to
>> > enumerate a device on sdmmc2, but there's nothing wrong with this.
>> > It's not even an error -- certainly not a nasty one.
>> >
>> > [    1.799703] mmc_host mmc2: card is non-removable.
>> > [    1.935011] mmc_host mmc2: Bus speed (slot 0) = 375000Hz (slot req
>> > 400000Hz, actual 375000HZ div = 0)
>> > [    7.195009] mmc_host mmc2: Bus speed (slot 0) = 375000Hz (slot req
>> > 375000Hz, actual 375000HZ div = 0)
>> > [   13.029540] mmc2: Failed to initialize a non-removable card
>> 
>> This looks acceptable to me, but I'm now not really sure that we
>> should enable the sdmmc2 in the board dts.  Let me explain.
>> 
>> As Jonas demonstrated with the WiFi+Bluetooth DT overlay, additional
>> DT configuration is needed to actually make an SDIO M.2 module plugged
>> into the ROCK 3B's M.2 slot work, so what do we actually get from
>> enabling the sdmmc2 in the board dts?  Just some error messages in
>> the kernel log :) and AFAICT no additional functionality when an SDIO
>> M.2 module is actually plugged into the slot.
> 
> I think if you want to add a specific bluetooth DT overlay for your
> favorite module, you should.
> Our modules need this much and it's very useful already. I'm not
> interested in nailing down every single one we have in a separate
> overlay at this point.

It would help if you'd share more details about the M.2 SDIO
module you're referring to, please.

>> >> > Dragan, what did you mean by SDIO related power timing requirements?
>> >>
>> >> Whenever there's an SDIO module, there's usually some required timing
>> >> of the power rails.  Though, I don't know what's that like with the
>> >> non-standard M.2 SDIO modules that Radxa sells, which are intended to
>> >> be used on Radxa boards with "hybrid" M.2 slots.
>> >
>> > Ok, I see. Not always. I can't comment on Radxa's SDIO module but I'm
>> > sure it's reasonably standard. And so is the M.2 Key E on this board.
>> > Actually, part of the appeal is that all standard buses are very
>> > nicely wired up. I want everybody to be able to use them.
>> 
>> Yes, but getting it all wired in some way unfortunately doesn't mean
>> that it will all work without additional DT configuration in place,
>> as described above.
> 
> Agreed, well these are the common changes needed.

They are common indeed, but unless demonstrated they're all that's
needed to get some M.2 SDIO module fully functional, it escapes me
to see what are the benefits of including (and more importantly,
enabling) these changes under the umbrella of commonality.

>> Also, I'm not really sure there's some strict standard for the "GPIO"
>> and "UART" M.2 modules, that part of the specification was/is a bit
>> blurry or perhaps even non-existent.  It's been a while since I wrote
>> the M.2 aricle on English Wikipedia, :) maybe it's become defined
>> better in the meantime.
>> 
>> >> Once again, please use inline replying. [*]
>> >>
>> >> [*] https://en.wikipedia.org/wiki/Posting_style
>> >>
>> >> > On Tue, Nov 12, 2024 at 5:41 AM Dragan Simic <dsimic@manjaro.org>
>> >> > wrote:
>> >> >>
>> >> >> Hello Jonas and Tamas,
>> >> >>
>> >> >> On 2024-11-11 20:06, Jonas Karlman wrote:
>> >> >> > On 2024-11-11 19:17, Tamás Szűcs wrote:
>> >> >> >> Enable SDIO on Radxa ROCK 3 Model B M.2 Key E. Add all supported UHS-I
>> >> >> >> rates and
>> >> >> >> enable 200 MHz maximum clock. Also, allow host wakeup via SDIO IRQ.
>> >> >> >>
>> >> >> >> Signed-off-by: Tamás Szűcs <tszucs@linux.com>
>> >> >> >> ---
>> >> >> >>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 8 +++++++-
>> >> >> >>  1 file changed, 7 insertions(+), 1 deletion(-)
>> >> >> >>
>> >> >> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> >> >> >> b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> >> >> >> index 242af5337cdf..b7527ba418f7 100644
>> >> >> >> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> >> >> >> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> >> >> >> @@ -688,14 +688,20 @@ &sdmmc2 {
>> >> >> >>      cap-sd-highspeed;
>> >> >> >>      cap-sdio-irq;
>> >> >> >>      keep-power-in-suspend;
>> >> >> >> +    max-frequency = <200000000>;
>> >> >> >>      mmc-pwrseq = <&sdio_pwrseq>;
>> >> >> >>      non-removable;
>> >> >> >>      pinctrl-names = "default";
>> >> >> >>      pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
>> >> >> >> +    sd-uhs-sdr12;
>> >> >> >> +    sd-uhs-sdr25;
>> >> >> >> +    sd-uhs-sdr50;
>> >> >> >
>> >> >> > I thought that lower speeds was implied by uhs-sdr104?
>> >> >>
>> >> >> Last time I went through the MMC drivers, they were implied.  IIRC,
>> >> >> such backward mode compatibility is actually a requirement made by
>> >> >> the MMC specification.
>> >> >>
>> >> >> >>      sd-uhs-sdr104;
>> >> >> >> +    sd-uhs-ddr50;
>> >> >> >>      vmmc-supply = <&vcc3v3_sys2>;
>> >> >> >>      vqmmc-supply = <&vcc_1v8>;
>> >> >> >> -    status = "disabled";
>> >> >> >> +    wakeup-source;
>> >> >> >> +    status = "okay";
>> >> >> >
>> >> >> > This should probably be enabled using an dt-overlay, there is no
>> >> >> > SDIO device embedded on the board and the reason I left it disabled
>> >> >> > in original board DT submission.
>> >> >>
>> >> >> Just went through the ROCK 3B schematic, version 1.51, and I think
>> >> >> there should be no need for a separate overlay, because sdmmc2 goes
>> >> >> to the M.2 slot on the board, which any user can plug an M.2 module
>> >> >> into, and the SDIO interface is kind-of self-discoverable.
>> >> >>
>> >> >> Of course, all that unless there are some horribly looking :) error
>> >> >> messages emitted to the kernel log when nothing is actually found,
>> >> >> in which case the SDIO/MMC driers should be fixed first.  Also, I'm
>> >> >> not sure what do we do with the possible SDIO-related power timing
>> >> >> requirements?

