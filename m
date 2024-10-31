Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A006EE6895A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eLyIHEDLmnqKBkl9EZ/QS1fOPZWds5n1WBxINpUw5s=; b=MKgk2TEa3ytevIzpU+vvb8KDU2
	TsI1J1LRHYmQ1s7zgAJBCespZwpNgP5vytErwH+SrOIBmuIrFJFsOBUQ0fmfp/ayxVh/ewBAybQty
	cSjFJxvJ7QAqQtc7newB3Epb8iH0MGNtEnqPHflzMYYOOOm4W9k3Mc9kWLKiJRYTgO5Ss1lJsuGi+
	fiUSwdFcX6uvaPpI/hzoS5EM98BNlyri1sQtBwZrh4dSw5U0nRJKWoy21nH3KHwiR8KflafQT5BsU
	SOb5e9x+tyHNnDxdwKzsAI/v/xeveHcA8tUiAKg80ikQGKIbsi+ysGsdcDMbxS17KcEtF9BXpF6cx
	F+z9mb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Phn-00000002p0r-3bHz;
	Thu, 31 Oct 2024 07:34:55 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Pdq-00000002oPh-1vlu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:30:51 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a998a5ca499so78347866b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730359849; x=1730964649; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/eLyIHEDLmnqKBkl9EZ/QS1fOPZWds5n1WBxINpUw5s=;
        b=ck81YoCLG9oBhMV1GjadDT55ctTXoWl6Z9vx4aWRgTxBerNHCjCah3FE1A1kxTtjqP
         BwMoWtGBEhkdKz6Oc8uvAOzRP78UQso+8OpHvAWKIXfgmmfebIuOGw9sPJgbLLOBTPED
         31Vovl6Um2oZ4xFxQl90R9/4wxP1OeYdIgkgGTS5cHSeMXYuo/4X334YBEs58y8pL9lt
         YvfnSCWTli1/eOdjPac2rOVPWL4ICoh6gK/ADK9shCdQ715j0OgyhW9UC3b8uXR2ogdJ
         g4gkP4y7wDHPbeXZUVq/mHyMWRe2bLdVaEE5UvQHARGqEiNsLTNiMdtRnqlOts/2jZHP
         SLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730359849; x=1730964649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eLyIHEDLmnqKBkl9EZ/QS1fOPZWds5n1WBxINpUw5s=;
        b=ktJaDZwatVwRuJ4/IPOsbWSBtPVcCFMjXswKtlcAp8AROtJ4mvgsazBDgORgbzHN4j
         5Uv4RWcde+R2+WSHUCcbm5I6kmz/MZ+RnCyGOQ+dm4aDRtUt77qRB/7bi1UigPP9zvxL
         4B7UV8yO3eW8HuajJwLrYB8E/mUKVw6491dGDWQeotq1YXnSTPETiTPV+tFizE0WZjc1
         aH1TcuZ58hmuN8QO5X1lmw4rEa2jOREGh0kFS4mVMRWwaANQzlxU9eji4a6FpAUyLFO7
         aCjuIqjSIV7V7jTW+VjetdIe1c2wb8ukCO+EcEwGCl1ZtxuDbkuyeiflNGdXD2Bo+B/t
         Zmjg==
X-Forwarded-Encrypted: i=1; AJvYcCW8P9jF4WsorLmzK0YGbtvChB4RimJTizV2pOJ0MRiMvzjk8yobbIKv8Ja1L5SuXAALhkpM9ypOTRYZTzq5jd8E@lists.infradead.org
X-Gm-Message-State: AOJu0YyxmchKHmwx8wMdpW2OCZ2Bk1c16bKUdynIfXlPGTM+Ee1ygA8h
	c0spzqjtJvYC/mbx0fsKvtbADc3+URsBFdFyIyayiSvHu8JVMI8NaB3dMQ==
X-Google-Smtp-Source: AGHT+IEc9E2xS94xaD1VTkOKzTYVeevxnLXidGIu1k9elFl5LfpBJ21mQ6g00F4tlmDxQntuwkCllQ==
X-Received: by 2002:a17:907:94c1:b0:a99:4ca4:4ff4 with SMTP id a640c23a62f3a-a9de5d98002mr1480023466b.23.1730359848554;
        Thu, 31 Oct 2024 00:30:48 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e566797a7sm36034666b.190.2024.10.31.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 00:30:48 -0700 (PDT)
Date: Thu, 31 Oct 2024 08:30:46 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: sprd: sc2731: fix bat-detect-gpios
 property
Message-ID: <ZyMyJrSPTfFrSC-t@standask-GA-A55M-S2HP>
References: <cover.1723716331.git.stano.jakubek@gmail.com>
 <e57ee9b94f128753d156d77015f6cc3dc24fd9e8.1723716331.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e57ee9b94f128753d156d77015f6cc3dc24fd9e8.1723716331.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_003050_527266_2D5BBF51 
X-CRM114-Status: GOOD (  20.70  )
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

On Thu, Aug 15, 2024 at 12:13:18PM +0200, Stanislav Jakubek wrote:
> According to DT bindings, the property is called bat-detect-gpios, not
> bat-detect-gpio. Update the property as such.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---
>  arch/arm64/boot/dts/sprd/sc2731.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
> index 12136e68dada..c8b30c0479fd 100644
> --- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
> @@ -97,7 +97,7 @@ pmic_adc: adc@480 {
>  		fuel-gauge@a00 {
>  			compatible = "sprd,sc2731-fgu";
>  			reg = <0xa00>;
> -			bat-detect-gpio = <&pmic_eic 9 GPIO_ACTIVE_HIGH>;
> +			bat-detect-gpios = <&pmic_eic 9 GPIO_ACTIVE_HIGH>;
>  			io-channels = <&pmic_adc 3>, <&pmic_adc 6>;
>  			io-channel-names = "bat-temp", "charge-vol";
>  			monitored-battery = <&bat>;
> -- 
> 2.34.1
> 

Hi all,

looking at this patch again, it seems there's some confusion going on.
The bindings specify the property as "battery-detect-gpios", but the driver
checks for "bat-detect" [1]. I assume the DTS was added with "bat-detect"
to make it work, even though it's not conformant to bindings.
It has been this way since the bindings/driver/DTS were introduced
back in 2018/2019.

What would be the correct way to fix this? Change the bindings to
"bat-detect-gpios" or change the driver/DTS to "battery-detect-gpios"?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/power/supply/sc27xx_fuel_gauge.c?h=v6.11#n1186

Regards,
Stanislav

