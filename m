Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079F6D44C48
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYIhPG6x60jF1PxiSFq6Xnv+Wsxju3BBfQyn7pIJfb8=; b=RqlmCyO17vYIMMY/O0Wv9EEMYD
	bEJx9FBgL91SPe7GdaKiHslTO5Csd5uOjdTDTNb/htW3yvEKLhnjm2dqT5NJ43SVXWX7ojnBDn/pq
	/Ab713XdUWLTbhX5zvkj4oO2PEgdvigThoRjvEOdLk4dH2/1ojblicJSIvYKPYgHRJyUHaGhgGLsr
	TW/yz7iH36ob9CgS2rI3L1RBgy34071iF2PhiifpGSeIRQRIFfgY1n+h17xz8Hm+uwh9sLbytENq9
	eUVGJPvYKLp6SdYG2OVAcjiCIoqZyYYrOGWqqLbIqz1PYHZiqTUCO6MWgY+hY4faO0r2lHscIyuBq
	deqopynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNtW-0000000CRoY-1LQg;
	Thu, 15 Jan 2026 14:00:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNtA-0000000CRlx-3Yaw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:00:02 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b8765b7f4c0so163728266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 05:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1768485589; x=1769090389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYIhPG6x60jF1PxiSFq6Xnv+Wsxju3BBfQyn7pIJfb8=;
        b=BjkSDnY07dw+f98Zebzj5k9enm0kXOr24zvwhFIDB+iSfdSzVyKfDBx5tLLE2zl3+K
         k4TqIcSbMQCR9dBxWhFHbn/U6be36fhNeH4FSMYDV9Ys6SBYxCN3ROGxnj9Q1ToG6QoV
         q3UVKeaId4pTd1OPMuiQEgEaHEAozvRFlFN7HAcb9ky3DY6Rv7d45lLW4pGLUSQ+1Qpu
         zl9kNzZsxwI5ebRU/3BA75ptaliO2zg4DVagrqz61A3Dt9O7k8eeJh16Nby+Z8JXOR7c
         p5jcy3ZtCchUBeM754SVrrr710OGZoRmrOUm2DxPnJkq71uJ4XLywdT6tXCYnjUp5GQd
         gL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485589; x=1769090389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYIhPG6x60jF1PxiSFq6Xnv+Wsxju3BBfQyn7pIJfb8=;
        b=NIJeaikMGKAM1c+WRFmJdJh45txUAW7txBUe8NGwzDtIj7NsHl3OBeeosKontP93yw
         SwArEE5rj00/i0mwTbKtLeJ11Hk/U3R1tO1PWhFUDDIN2bCWzMf0t13cCICotU7JQNm6
         H+x7+0NyfRvJCeyggN6Uj92l9s87lECSfXr4qUrlQ8ZFN/ot2h9tLUjer6FpOBq5Hmkc
         JpHoZ41P7PeXhlOrMhshrXnR/mlErGoqfuc2YxJ53M6jmC2bHMTS5sx0q13VMs4g2Mn1
         jr1zVq0TZBlbkvm4Tr+BsAkjZg/LRnTQFab9Clb6F3K1JVZxdNmahb+mQ5cl5LwAQCB9
         D/mw==
X-Forwarded-Encrypted: i=1; AJvYcCV2E7aWbQEHr2s3e9R0rPIY8lTj74s4F50xDv318T9nTUxgZcv8XSuSWfnM3MsXnhLj3Jrnj5lpEyKsP7YdpghH@lists.infradead.org
X-Gm-Message-State: AOJu0YzlfajgXtOnTVTcESBOyOiUpHZJE1XVTcvRRjtwQbxrCi8ueCzu
	QJ1RvSG03MHp4BANZP67SK2laI2/XW61YX3Ez1JpFWCrItjOI0qGYFWpgXkuMa9baA==
X-Gm-Gg: AY/fxX7+S/9VCquK2C8mYIGNM8wJp6/2FmShgDXVNtpAOw7qFlJ/G238NBktQI9nAUB
	zgkWB3MsMDAlI6FdBjD+h3Ln15KiObL2VXPDWxOKwOgdj6z9ef1BKTv+0rjMOSM4ZBPF8Sba5Bp
	spw7eHVJ+uIZFq7Iljh932oEdbf1FIrVjvP8HYKb3O7JXnC1Bo+GiM5SRkuvbI7ISKvBsTk1ito
	UATIGUSNYPhGBQCElFwAEpl1xxfpjEYpStkf/bnu0NwuJObTUH+e5PxBnfyRId1Pu8ZwB+WAQNK
	90GUnmS8SFh6KohxP+sx/1WcphJwYGtCq5nKPygqYyPZeY6aqcdRbgSvVfoDoTipsTWIqZxiPVz
	7/q1hDAecv+HUcdRnDEY/YnUT+BcynRbrGamf8CrSw7q/G2TUJpGsZcAiT7W7JfVF+uIEsI/zR3
	wq19g8PTqqsZN7nfGbsGzj5VgAOlFaqTLJK1mzsWD/CwriApz/yEitORCQTP7ba2WIukKc7jans
	Fa4QZmDiQ5J+0QzPW90jItguiBHWbGrvcgBabSDgKYPUoFlJr2uRjVmQQ==
X-Received: by 2002:a17:907:3f21:b0:b73:8b79:a31a with SMTP id a640c23a62f3a-b8761059dc7mr555045166b.16.1768485589247;
        Thu, 15 Jan 2026 05:59:49 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:ed4f:c8ed:4383:1c08? (2a02-a466-4d7a-0-ed4f-c8ed-4383-1c08.fixed6.kpn.net. [2a02:a466:4d7a:0:ed4f:c8ed:4383:1c08])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f0d6d7c6sm1614104466b.42.2026.01.15.05.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:59:48 -0800 (PST)
Message-ID: <1f256bf2-2739-4785-88fd-25101df9dad9@pardini.net>
Date: Thu, 15 Jan 2026 14:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add the type-c controller on
 Radxa Zero 2
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
 <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-2-8b5cdf328fde@pardini.net>
 <aeaee3b5-5f08-4abe-b646-a45ab79a35ab@linaro.org>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <aeaee3b5-5f08-4abe-b646-a45ab79a35ab@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_055952_957506_60852E4B 
X-CRM114-Status: GOOD (  17.38  )
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

Hi Neil,

On 15/01/2026 14:00, Neil Armstrong wrote:

>> The Radxa Zero2 has an FUSB302 controller on i2c3 at address 0x22 and
>> INT# wired to GPIOA-13.
>>
>> +        interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> 
> OK it seems I did read too fast, this should be 74 !
> 
> S922X Datasheet (same as A311D for this)
> 
> Table 6-32 GPIO Interrupt Sources
> 
> ---------------------------------------------
> | Input Mux Location    |    Description |
> ---------------------------------------------
> | [76:61]        |    gpioA[15:0] |
> ---------------------------------------------
> 
> So gpioA13 ==> 74

Indeed. Sorry for this.

>> +
>> +        vbus-supply = <&ao_5v>;
>> +
>> +        status = "okay";
> 
> And I get:
> 
>    DTC [C] arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb
> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: fusb302@22 
> (fcs,fusb302): 'connector' is a required property
>          from schema $id: http://devicetree.org/schemas/usb/ 
> fcs,fusb302.yaml#
> 
> Please add a minimal connector, like:
> 
> +               connector {
> +                       compatible = "usb-c-connector";
> +                       label = "USB-C";
> +                       data-role = "host";
> +                       power-role = "source";
> +                       source-pdos = <PDO_FIXED(5000, 2000, 
> PDO_FIXED_USB_COMM)>;
> +               };
> 
> I'll drop this change from my tree.

Again, my bad. My intention here was a "minimal" description, mostly to 
reserve 0x22 so end-users can run `i2cdetect` or such on the 40-pin 
exposed i2c3 and not be surprised. Guess I didn't run dtbs_check hard 
enough and missed the required connector.

> 
> And you may also add support for the superspeed mux to switch the USB3 
> polarity.
> 
> I have a prototype at https://gitlab.com/superna9999/linux/-/tree/topic/ 
> amlogic/radxa-zero2/fusb302?ref_type=heads

I'll try your prototype. I had no idea it actually had those capabilities.

Do you think it is worth to resend this with just the fixed 74 pin & the 
minimal connector as you suggested? Now that I've seen your work, a "add 
FUSB302" that does nothing (while being capable) feels frivolous and 
confusing.

Thanks,
Ricardo




