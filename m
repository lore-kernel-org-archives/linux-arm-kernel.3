Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF564D3B7F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pI8BQQ/T5SVzIWF61zZavJ6P7DIvRK0aGvjhr4khLmI=; b=W/jLagS6eNHpqxMm/FoKH9s0Se
	/nPiBfNPONBuhw4JeZSvh0flQXV6Syvv2XXMEhhRovSUknubph0pEosuj8+Au5w+EqgUbvgXZ1f0Z
	Vhd1WCfa3nMvwUN2mZn95GBiuQHxxT0oUS+A3dZ1aO3La5ujcPBfHZPdnNX4MXUo142yU+n8qu4YK
	/qprDMq4Qad9b7IMV3o6PWN6soNf4Ee3PdzL3aUiSVq1dF7fWGUbJ1D4taVlbLLC6rxeHpxqGPgkI
	KiEqwGzQH+xnizRrps4ZMUbpE/6cheKucSTxFs0ZNGySFObf9/Zap4R/LxgXqYPhmyJHXGZo1+z9c
	ZbyDg5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUhu-00000007QvB-2DRR;
	Mon, 25 Nov 2024 08:44:34 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUgw-00000007Qi9-3HlM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:43:35 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7fc340eb006so411682a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 00:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732524214; x=1733129014; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pI8BQQ/T5SVzIWF61zZavJ6P7DIvRK0aGvjhr4khLmI=;
        b=OIcdqVydY3bdIIgRbHMIc/35LW38JCRx7sPU0mZZSlhWHOWJ/5rleCAOBzf7QfrDrR
         4VB9UI6Z5Hlcpn5VrppaDyqfL1jdOejLKzZC8IS8HT1c4tRyFwOcj3p4X1/jpSmQniVf
         V263wgJ2GKEKY5GyjQlxVVKObREqYgw2Nw5obcsY57UTOkVTsiJP+mg7Pr/iMiXzmZHq
         FcXpehEZbp9UAi5Bc98WPqqfNChod4kIVMTvZB460/bCfgrk8eqxKHxQ8X8bq/9Sf7Sj
         KDqO/IZpnAkg34Hk0N3FQMS9GuLdZWPpCHFU6rKd6bTDHSzV6DxCLnOvIgk6Ms3Pw1NM
         T8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732524214; x=1733129014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pI8BQQ/T5SVzIWF61zZavJ6P7DIvRK0aGvjhr4khLmI=;
        b=iVarwD2N6YxcXHl1AguIoNEwJh09K8qhxRlMjwdJ3bulxvkRs0i4MZPv1VidhPGFv7
         XuIQCtHtukCCujkqe1VX9XoODAR7ShyvY0Tige7eDNVThRHynQrg7NLW0BTwEDJjbyTI
         ed4g6+iycCtfUDoCjEkHOtaLLtqwS9oKLB81lqNWhDZ62VbqEvx6bpc96KoGyGlolPu6
         6G1tEA/BKlj1ZZUzQMGKhpLm/XYX9cu9Q/y349iWxc61odyDO8qWKJhN01N9Q07rDDmv
         vz4xx0Es1vkXB00bySuCnPl4CjXoAmw0gmuSACViUOynlNmh1q4P1bypjwGhaBq9GloK
         RzjA==
X-Gm-Message-State: AOJu0YyzILTsSu9HR/DxxG26mcH4MN1mWQRKmP/6It9t00BZ5oU88Aw5
	BY7NPAzshT2iuUgHLZGn48h6VPBTVnI+2vOdu7S8IaUqFHud/pLG
X-Gm-Gg: ASbGnct1rHQotBkbA4rTkGvGsdrCbIm3UEA0av85F7Gt18Rq4KYsveR0sJUFTbKTcm0
	SS3i5UKnQOSpHCQqQ7JmjTjWQ2q2sBIy3z2Tn38zpfiLO5/VhcV1wJQI5PHgOEp3rrqlUDCKYoT
	5G0Y/sgJW1iWvchDNdy9EBxofqKRCpdslEWBjxVPaMshmVR1XR/Xid4GJKE3xPI+B+vXvqUayQR
	Sr12Fa5j+uW+QMleQmyHr+kaf9gz9ALvdH7hE9LrEU/z2xrCG7J6F2mUwvvzRVFFfHc
X-Google-Smtp-Source: AGHT+IGhgxcXQ0ft9/Za4vorVCq/dkomo2GMsbGwiP5RlHt6aZtAoqt6aKppLpP3grbtnbLAwPJzMA==
X-Received: by 2002:a05:6a21:7881:b0:1e0:c92a:c838 with SMTP id adf61e73a8af0-1e0c92ac9e8mr5471906637.35.1732524213648;
        Mon, 25 Nov 2024 00:43:33 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db9fdd5sm59524145ad.58.2024.11.25.00.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 00:43:33 -0800 (PST)
Message-ID: <4a3c832b-0c8d-4487-b1bc-122450a57516@gmail.com>
Date: Mon, 25 Nov 2024 16:43:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: apple: Add touchbar screen nodes
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-4-3191d8e6e49a@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-4-3191d8e6e49a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_004334_819916_CEDC14AD 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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



Sasha Finkelstein via B4 Relay 於 2024/11/25 早上6:29 寫道:

[...]
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..726b11376692580abb129b9be35107bee1550a93 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -379,6 +379,31 @@ cpufreq_p: cpufreq@211e20000 {
>  			#performance-domain-cells = <0>;
>  		};
>  
> +		display_dfr: display-pipe@228200000 {
> +			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
> +			reg-names = "be", "fe", "mipi";
> +			reg = <0x2 0x28200000 0x0 0xc000>,
> +				<0x2 0x28400000 0x0 0x4000>,
> +				<0x2 0x28600000 0x0 0x100000>;
> +			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "be", "fe";
> +			status = "disabled";

Forgot to add, status should go after other properties here as well.
> +			iommus = <&displaydfr_dart 0>;
> +		};
[...]

Nick Chan

