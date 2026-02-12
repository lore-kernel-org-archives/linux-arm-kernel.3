Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441ADEE36AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWH52hHDoZsOt/pe7QFROJLUmHx4Nch/byKXwRcnIQ8=; b=VSlpS59xPM/LZX1j53CB/J+ifU
	wiVZVOe7WrWrFlBHiG0/ol+bRH9X8ZANnmF7Flt3zGeq910uY92t67XlQmZi1VDtAuQ7rwnzjmUU1
	yvmrjio42eGd385xVeQDTOPkgyn04ZP36aPmGZl0tDlZWTLBegbCYw2EhDIn+UH9cvfNTab0cQBx3
	xzJvCFHXu2moeE6OfMULPY2d2b+k+Nv6UfBRUi7xtH7IeogdWyeg//lpU8WtPoIQASI/Kv7Xyz64n
	Sy6hMm4PkQLfNzS0U9d6tpqRFziaKIAK+aFdJFQ8faIDS2F+ucJVUnL6t6hO8tNPgUoz/XYm/3ejC
	emBmLgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZyx-00000002PGf-11tq;
	Thu, 12 Feb 2026 16:55:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZyt-00000002PEm-45p7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 16:55:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4830f029407so45295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 08:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770915354; x=1771520154; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWH52hHDoZsOt/pe7QFROJLUmHx4Nch/byKXwRcnIQ8=;
        b=bqt9e6d8l0/6erekakBfnTsF1YwxJCcgo1vADajOPT5fpO9AAkdD6AkFveH4LTV79l
         x4O8+BrPP6RQ0072KU/lIGvYAgrjySDBtR4yNjgr7f2fD9vdQdoMpx0O1xDEf6mdcQC9
         dA4A1ATCqj2og64UpuV045UDHoXxou8lDPRGpeLyTmQFl8hY70YzIZWl+6mwXSmvSdVp
         km78M/kreNupTffUn7K2NVvEtB6tZHAo8vdsG5ikxTwthjyY2D4tP3/q171E5nEhYjoJ
         ksKW57M1sdb5hLE+H4w88ueMut0JtgV9HTdTF4YpKjJZWh46joHmvOyUSmaewg74jSa3
         tOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770915354; x=1771520154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWH52hHDoZsOt/pe7QFROJLUmHx4Nch/byKXwRcnIQ8=;
        b=fG2hAvxMjmI16BOqhj75QILIK0JTFhiQdsalUsWfGn4OMyk3NFeB7OxV8XOaToT7p7
         EIrF/PrNbuTgZUqt98HanRNBMgB11/zUpp+so2efj41OOB5OD6iZ0CQjZc5R9ZJXprsR
         E7iO7bxWE2OK7VyaIyHeV1/RnDE/vtMvoQ02WLZ+ymgaSzwi1R9VIlfXTA3vLdqVsJXK
         ygme1WPAp/TPcBEIRkY3ST3w9UJEXNAATC/Q/E1z6UrBIYRPD+7lMfiH3/kKDXuANKU2
         DYrBNNi5KD8zBaH9itc+Xn5yCxweudFtFz/M2nhz++DUgaFgrzZRgEBpo8QdBCioXscV
         NTtw==
X-Forwarded-Encrypted: i=1; AJvYcCWkb9YOAxqMxmriBmETraQcqBBS/W1MU2n7Yy0i3lP+PR4I8LjhrqoxE6oWD1Up29k4IYRuTxVt/sQVyLzvgi9/@lists.infradead.org
X-Gm-Message-State: AOJu0YzpkbxCTZqF++6MWRkhNqaSuXSVYUhsXio9+N8jhz+ikRYH+wVJ
	6Qo5D2E97BGuvXHyFFbmO9DXYX7ANGVK2xV5bCxbbRCRChOBecM7jTeq
X-Gm-Gg: AZuq6aKJRiCKxcaVx4i6XbXmdCp0ZGx2Jr0MDnzwy9FcJ68otZaGRqIks19Ud7N5y3c
	OIrypEKDYcS9Az2foT47DNUQC0z1kVzZcrAa3seHRCjgPi+u8j4lJZLpC+1CyxeFYZAbfnts0ZJ
	kcSsNCg4WfNUrWp/iuO3ODGAMzDYGMqrxWqBit/U/q6JMY22sHnpQjmbdzGs1bqFhrPAhdb5WId
	rwv1OifaZGsFa/VhGXr4j/8zhu3eH3jbJc6r6cZhePxoDKHzGgqbGedvbWzry0b+QaZ15VYaWpS
	f7fl1JpnyX24+MUlnKC6R4DlI8w1fPRdbEdCFZK5RiWaBbWYVKaZGMLihkCmcYXuqcsNMg4U6WI
	2iPIgpqJ3Xn0qjhJZXGW0fYV98nYwHg+F56NIagUliak5S3N4JbZbhbYNUNhxFspI6lOO6VBE0I
	anPRg6J3IOeiKpo4A=
X-Received: by 2002:a05:600c:a09:b0:477:9fa8:bc99 with SMTP id 5b1f17b1804b1-4836570e260mr29901335e9.4.1770915353815;
        Thu, 12 Feb 2026 08:55:53 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:2f75:bf70:f0b9:4586])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd20519sm222156105e9.15.2026.02.12.08.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 08:55:53 -0800 (PST)
Date: Thu, 12 Feb 2026 18:55:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: WeiHao Li <cn.liweihao@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: rockchip: Add USB2.0 PHY for RK3368
Message-ID: <20260212165550.mju3377fvphdsqoe@skbuf>
References: <20250909132958.26423-1-cn.liweihao@gmail.com>
 <20250909132958.26423-3-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909132958.26423-3-cn.liweihao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_085556_066507_EBF5165C 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, Sep 09, 2025 at 09:29:56PM +0800, WeiHao Li wrote:
> RK3368 has one USB2.0 PHY with two ports, This adds device tree node for
> it.
> 
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> index 1b21787269..b09e431a64 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -766,11 +766,40 @@ cru: clock-controller@ff760000 {
>  	grf: syscon@ff770000 {
>  		compatible = "rockchip,rk3368-grf", "syscon", "simple-mfd";
>  		reg = <0x0 0xff770000 0x0 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;

This introduces a device tree warning. You cannot mix nodes with no unit
address (io-domains) with nodes with a unit address (usb2-phy@700) on
the same hierarchical level. You have to pick a format and stick to it.

>  
>  		io_domains: io-domains {
>  			compatible = "rockchip,rk3368-io-voltage-domain";
>  			status = "disabled";
>  		};
> +
> +		u2phy: usb2-phy@700 {
> +			compatible = "rockchip,rk3368-usb2phy";
> +			reg = <0x700 0x2c>;
> +			clocks = <&cru SCLK_OTGPHY0>;
> +			clock-names = "phyclk";
> +			clock-output-names = "usb480m_phy";
> +			#clock-cells = <0>;
> +			status = "disabled";
> +
> +			u2phy_otg: otg-port {
> +				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "otg-bvalid", "otg-id",
> +						  "linestate";
> +				#phy-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			u2phy_host: host-port {
> +				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "linestate";
> +				#phy-cells = <0>;
> +				status = "disabled";
> +			};
> +		};
>  	};
>  
>  	wdt: watchdog@ff800000 {
> -- 
> 2.47.2
> 
> 

