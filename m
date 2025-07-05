Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F44DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhylvSenSTzbTSHgGzTYtUpcoD6+sjQINmEOCQtWK6w=; b=dnKiH6fpvRFoMzRc52FCj6sDzM
	yS7cGT68r931/TnqL6oHjvxjoJILMywCyDvJRhwSGyjVHWcl255GBJdz5xbNE/Kq+70RYyQz7adeH
	W5xR9BxS4eh8+F91dO1gNO1RuMDHhUsjVAoh7YS2CxTjkDHWirO6ffFN5bRTDC4/6zXe/k34/v6kr
	9q7+tREYV2rRIVYpwRJG354wW6GwDatH8cy6SS5lKnGPOivZ74CwwDEpsPTC/mCX7dXXTMbFgoQJ5
	NEzgZIM0mlSyv5Z9szls6SyhbryAj0coh2G2Z+cGTXmXlmFmwOfdVc+LKCYAnR15zVjboDRXTrIgk
	Mn8EtmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxWZ-0000000GEif-3VXb;
	Sat, 05 Jul 2025 07:41:27 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxOH-0000000GDoR-29c6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 07:32:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ae0d7b32322so227463066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751700772; x=1752305572; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhylvSenSTzbTSHgGzTYtUpcoD6+sjQINmEOCQtWK6w=;
        b=kvlVeNKTAJNUWX/p8T9iiIWlI/yQWR4dqWQ2H/Ncx3yRZuDysF3mUe5pD//uVwRrAT
         vp3SX+emtWu1Be6zFsDaBO01qKjTA4sOY64nYsSSZf0j+xq49xgwrYbN+3i8qzpHPJQW
         FFtyzYVuWCspiE5932Uvqo48yYNDR41RZ/IQ1zWxvFxmsW/HbYDgAGgmaFJ1yIPIzcDK
         AylAHrt/pXmNnANoRL9GE0CJ8oHWh89olvnvLSIRWf+jSERHZuIJAOrde5MJ/A+JYX/o
         cnT42aXjWW8sdJJ6GBy3uShfjRADU8iyR+2eYVR9jfZqv+AQv4UF6LFwYKMD97ItmoLF
         CTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700772; x=1752305572;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhylvSenSTzbTSHgGzTYtUpcoD6+sjQINmEOCQtWK6w=;
        b=gKvG5MoV/HdY31sKJi9H0FmqGEHZvXCf8AMHx0ewbgZTEDUUT/nBctlmbdfpySEq1i
         RvUVXyVLNjixFml4x+DmGUzLgiMTjiNGQnv+Lo1BBnV2kBt2kk7LishcXEYS8AYu+yG2
         8fwLThEChfzjZswAM/7e8HR31xTz/sgtpxqnNKipJtKS97JuhGqV7EQZi0leeNSYaaVt
         s/QBlKf/d1OcnV4JXOVwsvpPQLlUksdk5bkBn9uqkhXHBoOdSztKdhIFiJIYkv5vYZq5
         d+4gbKMJopo+XL3WsLRzJvKkvkQRkp17zXSro4K+dMGtwS8qTTypKK0gEu7RRb8A8bHK
         Ei0w==
X-Forwarded-Encrypted: i=1; AJvYcCX6oSWloVYGdn/XFSVWH2JKtd3LLcie0WmS63yHBPZAuZinims70LdoJy6LsV9elDs7GUc9DSuAlnipv5MjgyJk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk7OiD27V90yH1RufZENbNt5LFkyMC/ZvvViJfQdLWYpN+m1D2
	T4hWBOAmInoJiJePfck0QqsdgUPzwR9X/kcilvyiA1/C991WF7M/OZiak+vV8lRjnBo=
X-Gm-Gg: ASbGncslfc+ftv3Ku0NDCP7HhYmO1Cu9+AZ07keI3HvY/R9NmEXXvv8YdlD9IhnUkjd
	OTqRbwjWGLrhXjMFzH0lmFPjunojFE3Jfu5b+uZJtVKpNZxE5EWrgehUGKawsEMAVpBzh1DJ3uq
	Jfei2wNKralG8HXDe9fUnYGgiRSVkcAM2liz2GWbCrEmervXRjYgsODlMb4WMPT0gc32zzFgGXz
	bK4BRPaqfcubRNWjc0twJQ8I0Od7zwiUxZ2CpfyQ1xiYb5Ctov5hYslDLOFEBp/DLDDeEX4intC
	VbmcY+AqqpL2jSxh5oW6v+Ud5BJ4s0ZS4434plczYacXNTKGkiJt4JOqGUZTCsBU8AIWrw==
X-Google-Smtp-Source: AGHT+IGypJ6ZzkoJSLfm7mtSoGrYFW/oBciDR2Yh9zboCch1QPddzX5kM1vpeJocDK+Uauw6ezziIQ==
X-Received: by 2002:a17:907:798d:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-ae3fe599332mr424341866b.37.1751700771848;
        Sat, 05 Jul 2025 00:32:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e785sm300317266b.155.2025.07.05.00.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 00:32:51 -0700 (PDT)
Message-ID: <a70087a3-b9d4-48d0-b03d-8d48468b79b3@tuxon.dev>
Date: Sat, 5 Jul 2025 10:32:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ARM: dts: microchip: sama5d27_som1: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-2-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_003253_557988_EF7F6E0B 
X-CRM114-Status: UNSURE (   6.73  )
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



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 09ce8651229b ("ARM: dts: at91-sama5d27_som1: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>


Applied to at91-dt, thanks!

