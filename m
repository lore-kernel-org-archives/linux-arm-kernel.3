Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4607FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 21:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPX8Qo4WfHXuWtgG3KrlsoZlJSWwTSu8oW28laBWyKA=; b=GI6lDsTFlb4KJHZtH6+SF7LTeO
	apCi1bWHG9FHDr01zwF/Y8I+t37aJi9kbYhoml5x25qC9TeY70cjBt/k+q/6lgJvMcR/F4Np5Ktz/
	CJlmeDXfXAEXofRfY7FyJdaA55ojYKIEZBr/2V4sMFNwlwA27GHb85yY4woQVuE8LXeJ/vGSPUjyL
	NHYfQBrpt/fJtmthNytr+ti9lZHK4Tl+7Q4p7eMdHLyzJHPoqk9ntAv7cg6sgSCOpr+uI3UMYX5cL
	EdKwrx029lKFn/CuYIk5ZleLsSyXYFOnSiYtJqrbgFk9aK7Ar0k513BvnPQd3brZ0bAebR5ha3yHA
	GhdLmKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0ei-0000000F60S-3cvv;
	Thu, 23 Jul 2026 21:08:36 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0eg-0000000F5zj-34QO;
	Thu, 23 Jul 2026 21:08:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784840903; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZofzkxPKEd7lf4sDW9ciklCThBWOnDQ2GEu7rPIcNaZveH9q1nkb8kM48CYwN8GMvpuJnjxPky3on0RqbGebq8g3fVMumPEvh1gd1mpW3+ZFUDxm60Cf8a91YM086VgWBTS+gZvD/RJYzE1VwLFNiBHsbcA6a+IidzjsoqP8wwc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784840903; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jPX8Qo4WfHXuWtgG3KrlsoZlJSWwTSu8oW28laBWyKA=; 
	b=MUo8/zrAo8wr/AzKX4gpdUEUQCPaHTcqH4dLsSk+G0+4FPxWbet1ZIYyRJz5kc7HbT6i1zyrQsfSDypga842FuSbIdNWAiMvbi5bkAuoHTtjZy5hlx/oaKAyBf7ND+R+HcxVFFzvUe3rNZu6TuzneKEiCvpgpg38yqto651n3Ic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784840903;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jPX8Qo4WfHXuWtgG3KrlsoZlJSWwTSu8oW28laBWyKA=;
	b=hcA++BWE7+onuKGfOK8O7BxIQ+Jb2Es4UNStWGXOCVpgMqc5KzTXngemk9NMCmFf
	Z/5eEncvx3EMoJeG5bGDCH5D8NW+Z/8z330px0NWVDnptX7H+UjRkrPqVT88yzY3mKy
	eOIGz1lJusekYanCOTU5MKzSEySqKiWs/JaMmVGI=
Received: by mx.zohomail.com with SMTPS id 1784840899618134.47086648505854;
	Thu, 23 Jul 2026 14:08:19 -0700 (PDT)
Message-ID: <6f38788b-c577-4c79-8a27-3c0942ba1400@collabora.com>
Date: Fri, 24 Jul 2026 00:08:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add HDMI RX audio on RK3588
To: Igor Paunovic <royalnet026@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-4-royalnet026@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260721064115.64809-4-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_140834_826042_8D298A20 
X-CRM114-Status: GOOD (  17.62  )
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

On 7/21/26 09:41, Igor Paunovic wrote:
> The Synopsys HDMI RX controller exposes two digital audio interfaces,
> one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
> property so audio cards can reference them as a codec, as documented
> by the snps,dw-hdmi-rx binding.
> 
> Add a shared simple-audio-card routing the receiver I2S DAI to
> i2s7_8ch, the receive-only I2S interface dedicated to HDMI RX, with
> the receiver as bitclock and frame master. The card is named
> "RK3588 HDMI-IN", which is what users see in alsamixer and what ALSA
> UCM matches on. It mirrors the existing HDMI TX sound cards in this
> file and is disabled by default, since not every RK3588 board routes
> HDMI RX audio; boards that do only need to flip its status.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> Changes in v4 (both suggested by Sebastian Reichel):
> - define the whole sound card here as a shared, disabled-by-default
>   node mirroring the HDMI TX cards, instead of per board
> - name the card "RK3588 HDMI-IN": the name is user-visible in
>   alsamixer and matched by ALSA UCM
> 
> New in v3 (as "add #sound-dai-cells to the RK3588 HDMI receiver").
>  arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> index a264001..e0dce15 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -23,6 +23,23 @@
>  		};
>  	};
>  
> +	hdmi_receiver_sound: hdmi-receiver-sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,name = "RK3588 HDMI-IN";
> +		simple-audio-card,bitclock-master = <&hdmiin_codec>;
> +		simple-audio-card,frame-master = <&hdmiin_codec>;
> +		status = "disabled";
> +
> +		hdmiin_codec: simple-audio-card,codec {
> +			sound-dai = <&hdmi_receiver 0>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&i2s7_8ch>;
> +		};
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -338,6 +355,7 @@
>  		reset-names = "axi", "apb", "ref", "biu";
>  		rockchip,grf = <&sys_grf>;
>  		rockchip,vo1-grf = <&vo1_grf>;
> +		#sound-dai-cells = <1>;
>  		status = "disabled";
>  	};
>  

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

