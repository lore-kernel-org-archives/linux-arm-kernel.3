Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4401EE7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 17:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idcn5ztOB8vCVixROzXdUZZgLSFHdenUmBztFP1iIws=; b=N6D0onqpBX4FrzXpZWr0VTf9Lx
	4mz8OR513vR1LQIaXbAk1P0Gxa/CraM5eHTZOpBtfZXPkj+fBEgTov11Xu+ELBASAh//SLlgVFyN4
	X/RTxx9Eq0fYD0X8XbITJfa7ZlJbk1CjCwudCAh7VdmAHkyHTWrPG1fKS8lIuFpPAFFnuA8+qfhXV
	Jgx0cWsaOJrtmo2eadTaRTW7nPavHkehDwTdp9m8i1kv9fPMUXhkEcSfW9b1BnzzSwzPLI3uldG9X
	zYV+eYPLLNz9XNa+uYAs/pBn3P6eFurTVXzvljtiK3PcJVVh9457tziWRAUL3G3E+p5vPO2uflwTQ
	0N5b6RTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxbI-00000005Lyb-3iD2;
	Mon, 02 Feb 2026 17:20:36 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxbF-00000005LxW-0wvA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 17:20:35 +0000
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-7d1851d85daso2000597a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 09:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770052832; x=1770657632; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idcn5ztOB8vCVixROzXdUZZgLSFHdenUmBztFP1iIws=;
        b=HDJSKUtpodUNT5zlXf5kro5WkuEPLwYO4ut49FNb1Wq/+eKig/XePsGNjaAhV1Efri
         KaCX90wzfkRf91Yp0BIo4/FcgBUSXP0PDC6gm1yMu/F6ww9eMRVBl9+3imA/XP1+LWmE
         P9UED/VGiE1H4wwSsx9j3e3sCDOvGiE4XTgTYSXsXnMohEvtbk11WDwI2DbjlbcDEMSb
         wdQBEoAyeFZGtciYhajI0EMT72URF8Tv28Z943n84ZAWzO8h4DaiQoWoIK97c4YTICfV
         09UAtK0nd6C4iK67yq7X2lLxbT9AGwhx684fR7kbZr+WUg3dRv+aoLAT16iNHys66F54
         5SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052832; x=1770657632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idcn5ztOB8vCVixROzXdUZZgLSFHdenUmBztFP1iIws=;
        b=JLCWi82dzvzLDL1JZEWEmSd9FeEaJZYS+tslCVx67fxkEBfHPCgqzYp+VDiEbdzB82
         JF6P1cejCwZC0Vw08KM7pdM9xNnMg36bIMNw8YNMnqRCbvhPZdq8cxsCbrVBTfowDxJT
         HZmJMeEsi8UaNk1pJaacnRV2It5PXSFgHoaxSgof/UoiWZcdj0W2A5e6NIM7E0iyb5ma
         9jBZBrRD/6agz4i3aIv3+BHvy3weRMM2qgnDR/rc+pZj/cWneylWzdEygRDBWAwfCavQ
         nJXhnTKAFFrDrsjx3NeJNfPw8vnV3lETt/BmXqmNQbtWiKsKtvu/GXvsRfPnX1qy5d8w
         DOVg==
X-Forwarded-Encrypted: i=1; AJvYcCVGg85h0RVwxm2TcmZsF8eufrnaPeEaGJfHBXL2sBYaxZyuUrjNZKCpoi+9Gg0P/IuNxYjfjciELls9u3a1UmG2@lists.infradead.org
X-Gm-Message-State: AOJu0YwmD55IUE5BLB8/IDrw0ARU7IKWTYdc+zMlLCoQOQtdJQmQBmZ+
	pFb6e7gvLqmvD+JyGxhC/Xa7XnvrnW/jTiLmLfKOhtqW0XAkunqxT+vWOugkJ5SE3GrCKY4GzGu
	0CEku
X-Gm-Gg: AZuq6aKZdiha1tKDZghv+/X41KoLSYk+gFyVNEA28Ze8QKPps39Hli9woyA7zdME2oZ
	xPrykXwQ0JDexCWPRT+OpQOZ2a164AekpHWfvyk+ot1Rw4BhQG4CqYPD8KTneiltPTL7uQods8O
	WEdOBWdo6aCcxL+BRjNgA8OH4n2PxH8nlKpesGxNbNzamZtPqSAMBpPwe+THULXqARcAovA4iSx
	d2SVDpfLBo2PR94ovS23AcCkAMlO3UoBGqlN1qn7faMTxyeWQUUqigkl5HuE60t8uf4Wg26kRIz
	n86D75RprzFka0CH4IbrTgzo+GqKh3ijeDW0Enc764ZGeDocJB1R0Ntme5AchlzIhxhLw0RSxzm
	IO7+m/H5VOWmW7RWTwu+r5AywfIe8NpLcoQN5Nft3nVDXVVgLn3tHPkZLmgUZUVXY9VXj2/gXCz
	qeKLeniznmnydHrYUwgYlAFcM2YPo8XreHPe4VDZ7HC2+0n2aiukx0Jyx/yn57
X-Received: by 2002:a05:6830:6584:b0:7cf:e41d:f0b0 with SMTP id 46e09a7af769-7d1a5341a34mr6832027a34.18.1770052832041;
        Mon, 02 Feb 2026 09:20:32 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c7ffcc7sm10907066a34.23.2026.02.02.09.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 09:20:31 -0800 (PST)
Message-ID: <25bc9ae2-5c27-407a-aae4-6c619367664a@baylibre.com>
Date: Mon, 2 Feb 2026 11:20:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8365: Describe infracfg-nao
 as a pure syscon
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
 <20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_092033_274139_996183A2 
X-CRM114-Status: GOOD (  24.61  )
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

On 5/2/25 11:43 AM, Nícolas F. R. A. Prado wrote:
> The infracfg-nao register space at 0x1020e000 has different registers
> than the infracfg space at 0x10001000, and most importantly, doesn't
> contain any clock controls. Therefore it shouldn't use the same
> compatible used for the mt8365 infracfg clocks driver:
> mediatek,mt8365-infracfg. Since it currently does, probe errors are
> reported in the kernel logs:
> 
>   [    0.245959] Failed to register clk ifr_pmic_tmr: -EEXIST
>   [    0.245998] clk-mt8365 1020e000.infracfg: probe with driver clk-mt8365 failed with error -17
> 
> This register space is used only as a syscon for bus control by the
> power domain controller, so in order to properly describe it and fix the
> errors, set its compatible to a distinct compatible used exclusively as
> a syscon, drop the clock-cells, and while at it rename the node to
> 'syscon' following the naming convention.
> 
> Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index e6d2b3221a3b7a855129258b379ae4bc2fd05449..49ad4dee9c4cf563743dc55d5e0b055cfb69986a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -495,10 +495,9 @@ iommu: iommu@10205000 {
>  			#iommu-cells = <1>;
>  		};
>  
> -		infracfg_nao: infracfg@1020e000 {
> -			compatible = "mediatek,mt8365-infracfg", "syscon";
> +		infracfg_nao: syscon@1020e000 {
> +			compatible = "mediatek,mt8365-infracfg-nao", "syscon";
>  			reg = <0 0x1020e000 0 0x1000>;
> -			#clock-cells = <1>;
>  		};
>  
>  		rng: rng@1020f000 {
> 

Reviewed-by: David Lechner <dlechner@baylibre.com>

It looks like this never got picked up. I noticed this was a problem in U-Boot
because it was registering this as a clock provider. And I sent a similar patch
[1] recently that has also not been acted on yet. I prefer this patch since it
also fixes the node name to use a standard name. Who should be responsible for
actually picking up the patch?

[1]: https://lore.kernel.org/linux-mediatek/20251216-mtk-fix-infracfg_nao-compatibile-v1-1-d339b151ac81@baylibre.com/


