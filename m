Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104B7CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 04:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spA7o91KDi70Ll6ROh4SAqPxwOp0/KEcn9hPwha/0d0=; b=m1sInPHN8Mvf315kUa29Iuq43+
	7ZRviEG641v3wmvP+qr1tG4PscTxILFXXQJiWDDNQttSQAxG+w67SSYUNp7fbGu0hNswQ3XvqpbWV
	H+q/lKmG6f1BUh+T7k5BknZpQ4PSeyjqOQSxpGqTlofqaVGtE0K1fKJh1OVnaMO6w6yNrN0yzr9it
	xPVwd03gGF1cjrighmAzUbdJDBo7294WlCAxtZladGCeI21+8o0/IY6TLBuVOjeh3XCPS4S4d0R4W
	bSl6HaneMENTJXC9l33XbevsoMA1JiIyWJxMXD7586DPuuu455TVZnmraLvhKYALEvuPh4RqDsVXI
	zCPaCwBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhkm-0000000BspD-3X28;
	Mon, 20 Oct 2025 04:44:16 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhkk-0000000BsoV-1Fdm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 04:44:15 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so3538220b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 21:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760935453; x=1761540253; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spA7o91KDi70Ll6ROh4SAqPxwOp0/KEcn9hPwha/0d0=;
        b=aG2h/ce/YSxo9vh76M0ReRBNXgk++lRYW/OgfdyOxpDYQkSTHz3nmog4zoBliic69n
         P64wwnNowp2LnDJCjR11oScS3zhWE6XxEzi2uKLw96LPwsAUenC5AjYrcxn/XSGu5rbc
         2ZXr8guBDqm3eRqHGEgCD+Rg4KGW4jvJ4+vNUMB5eyTUwk00khyQimB8kDT+UbzrrNUp
         rcl8aziXusk1NOFon7JZn7sJGX3a140dEuW0Va8vIH4qvM8OocYIyIgacfSBlYkngE3g
         s5hlx5nK+p1qCuD2sfY6WWRNiGKFY+xUxRg0GpQXVE5WbXj4J9KSJfG4g+W2T7gwd7mL
         CgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760935453; x=1761540253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=spA7o91KDi70Ll6ROh4SAqPxwOp0/KEcn9hPwha/0d0=;
        b=YNkIF5Aaf1cgSmBMy689zT4QdcmupP1eBCCcViPtzjKckjHoIUu4gTSuAj5T2cjS0Z
         z1sVIV59HcdYUoHyLhTGoger40IjZZAZTxTnT6uvxFQcn+XizoooNPPsT6iXyRlu8Qr9
         3YzznXfNW4nTUFuB7yrySlvA+BlAWh08OMEPm8oONACjS5Yr/MtjJy8B1MZVUNWK/fZw
         Itk62bNxAaq/dNe00600gfmhe6t2FAl7JBRQy3CioMxZayfb65nczlIGcXWYCxyULuAi
         jJIpXKn4JNR7qUeY5PFYVcR3KMOZEjMJWD4u+UkL4MI5R+RPx2IjifYiTpqcSElNDfiK
         SHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWHp36upvqp8cKyukQWt35waoVNQrx3HsCo86jU51IgmCIkBuNamTEJZYtogNJocu+XcDJS/aDkNgFHoSpBYB5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi45XykVsX3Ad9xw2diYqwnXnbkv7BjHqZm+abHaRKyGdM0vmP
	ViuZupqAx06ziSlNWKF0uqu2IkC3Lkvv1km50mJGhA4ip8szyJhT9+in
X-Gm-Gg: ASbGncu395VYDc/eyQY1VbrsYgjhpmAuX1yHCl2dnCJgl0D3ujGBJdkzJ3j7a6se+i+
	VFwjMWvcEz6ha1CXCASLAvYCao825DRo8IvHWg7DjaEOKzVnbanrWn+LWOlRw2AMNjZpfg8Ys6Z
	FiTHCWYekwTG69f/B1DsmcGad5DxYtdDtNbcTkYfF4CJNMZOOjrBsgBPKunrg1pQ2n3smxPBKPn
	KgjTygYRqwbnwk/muroB4wjxE0iGYOJSKk5veLK8HDCUCDRIpma9x0smGlwQHyWj4AhUWdFfmji
	hGSabjVyvKzbCXEiKnwg8qUaUq5cs7b34AHFZ7IS+GuCVLphLoi14Hd2bbGjaaU0Ej+KQjzcWVN
	T7hCgC9Mk+1w6kRLpchvZdNMqACAySYNzSghmZP/85YQAJhHutiY=
X-Google-Smtp-Source: AGHT+IHWbr3T6FVN2FnRLa94Qqq1QareIcDELv0GtDJz5J4Z5xhqWfcvLugBUZ8lTWu9Dmv4dv3pCg==
X-Received: by 2002:a05:6a21:328a:b0:334:97a1:36af with SMTP id adf61e73a8af0-334a8523ebbmr15097184637.13.1760935452280;
        Sun, 19 Oct 2025 21:44:12 -0700 (PDT)
Received: from CNSZTL-PC.lan ([2401:b60:5:2::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f2598sm7217538b3a.40.2025.10.19.21.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 21:44:11 -0700 (PDT)
Message-ID: <08911ae2-fef3-432d-a236-d820c9cb67ac@gmail.com>
Date: Mon, 20 Oct 2025 12:44:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6
 with A3A444 chips
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Grzegorz Sterniczuk <grzegorz@sternicz.uk>, Dragan Simic
 <dsimic@manjaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>
References: <20251017073954.130710-1-cnsztl@gmail.com>
 <d70c0eb5-9aa2-47b1-8205-81b724180319@rock-chips.com>
From: Tianling Shen <cnsztl@gmail.com>
In-Reply-To: <d70c0eb5-9aa2-47b1-8205-81b724180319@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_214414_330121_5176BAFC 
X-CRM114-Status: GOOD (  18.20  )
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

Hi Shawn,

On 2025/10/20 9:53, Shawn Lin wrote:
> Hi Tianling
> 
> On 2025/10/17 Friday 15:39, Tianling Shen wrote:
>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>
>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O errors and
>> corruption when using HS400 mode. Downgrade to HS200 mode to ensure
>> stable operation.
> 
> May I ask you to test another patch I just posted to see if it fixes
> your issue?
> 
> https://patchwork.kernel.org/project/linux-mmc/patch/1760924981-52339-1- 
> git-send-email-shawn.lin@rock-chips.com/

Thank you for the patch! I will ask my friend to test it but he uses 
this board as a home router, so it may take a few days or weeks to 
report the result.

Thanks,
Tianling.

> 
> 
>>
>> Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/ 
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> index fafeabe9adf9..5f63f38f7326 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> @@ -717,8 +717,7 @@ &sdhci {
>>       no-sd;
>>       non-removable;
>>       max-frequency = <200000000>;
>> -    mmc-hs400-1_8v;
>> -    mmc-hs400-enhanced-strobe;
>> +    mmc-hs200-1_8v;
>>       status = "okay";
>>   };
> 


