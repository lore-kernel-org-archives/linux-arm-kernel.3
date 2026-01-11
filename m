Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694C4D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXunsOKck5NLaqPP1pj13fhYNQN15zYs+l2jwEoFO8U=; b=YEx6DRbD2fJHbKWojKqpCol7in
	237hC92Jwv1S6x0bCBVdHc9TTFshRgAMIycmM/5sluhfiJ3cOqWNu6fEjWWnTONz6VYiAyA77Hnpz
	ThO9T8fxa1XQ09Ps8ZLuOI4yHMUME4rTKKmhSV1TB9pRM8VVKUf1QXSJI3XNJjYOSTkiTwGN+CvjA
	AgwYrlPezO+m/LnsIYJuKHcwRaW0efkjVyETfd3AX1N39DAJtO/TekPG7dNcxpsd81Iec+HgzfTCs
	IrM16/rtDAGm4V+O3uBy++7Kv9p0VUHJ+e2ssmt1kwPoYHCmWBXXKzRdBnZ/nKj0GYNTxt3f5Eeu5
	y2EYrbyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vew4d-00000004H6O-2sAz;
	Sun, 11 Jan 2026 14:05:43 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vew4c-00000004H5q-1a5c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:05:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b8708930695so81522866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768140340; x=1768745140; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXunsOKck5NLaqPP1pj13fhYNQN15zYs+l2jwEoFO8U=;
        b=VN+ypWXMXdCqhvif/iDr14xsX+M7skeAhz+oV/DkMfLs2QlggBIKwBB79OGsVkLkm4
         VTenEb6TWLcmE08G32G1xy58WtEqYmxBe2SYsshZafG78LuoogSsL2UdqacrrI22l4hA
         s1WhViJAi1JxXr3uvh8/JeGLsWIZYNKSz9AbTl/F82t1zrqqvk+lNVYw7xNmPOI0wavd
         r6Z7LXR2W2UWPy/N3AJIINZiZTyP5nhKclv4wWnxXB7fHN8ppt9Ch79Wu4xyv87CsMJs
         fwXKRqRTfKcPCmpwQ5oqVvCBLxo9I1DAfgCznNDEM7IwBgWQt9Q5IoJfvHV0PYwNvZVP
         ISqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768140340; x=1768745140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXunsOKck5NLaqPP1pj13fhYNQN15zYs+l2jwEoFO8U=;
        b=GsiGI6Wcc/2lDfd86uDx7bZTe6W6aIUfpMJibJX0nicwc9R5oMGC5VhLoiKnUxgGEq
         5eiP6zp/c1YA++R9etRpdzQr7u4JF/evqfvcExvZrJZ/yXoe9HJ1k1GMt56igh12N3Wq
         THs3/YinmQWzU4AdSzVRUmV7F5MheIK/XrHo9OXuLWqD2Or66De6VMCGNBvVrIFCDuRX
         ainJViBg5OSxB2DgzMHuNa9aP6EJbS2GpPOkX8QonTBUEopTPQ8DrI6cVOYDkxu82P4w
         irEYKfkWuHBDBpg/gZOsW+0x1RgX7zvWxh9wxndwde5C2Sd5jice/ssTxuLxqqVkh1E4
         VGNg==
X-Forwarded-Encrypted: i=1; AJvYcCU3FGivaCjJnG8BMXXpjFI4QD4bWU/0dXI3Nsy1vOXwrlsyWMD7DW8ebwe2H0j4DfoztD8CWHH7/i3Ry9/IUUan@lists.infradead.org
X-Gm-Message-State: AOJu0Yym/Om6ZziSlV1IW2HiQL6VuYl2n7WnI57GGCRsyx3QazswGeX3
	w5zlW1uH3s6nRSbBSxZyRKuG8vQw0drfVSyX39Ts4mFabIsIJmwrArAOJ1MUa6voAYY=
X-Gm-Gg: AY/fxX6meUpGgqZ0gBuGEJ1SWmsU626EObvWm0rnngoBm7Kn9jZq/cRRs8ozValgWfx
	kX6W+8aQpATrAR6Sli8/3rKt4UoAAKr8Dc2wCOkllB61ftSZGpDFNlo3IAVXY1ZjMeQYskiI2BS
	4eHM4rAk4Hsx3/OfOT5v3kmFm3lEh68hhBasvT7Spnv1jHbj4L5RKTTMARrxsnFfgEynk2l802j
	yoFSc7J9YsVLtJ0U9wLdRA7OKZem8gMYUuVqMldtHo6CT2ks9TZTIJaALn0GwcsaKs2/kzi3fDh
	lR/XcODSUNl/jm2ffnkvvlSXC4l8T6hPQw4rs6Fb/z8RwZqaVXDRXfZnUiJB7Pj+aoIpcNLxgRb
	ugWM/EMMr67wD66JSwVuBJ3ngJcVTN8psvNaz7l9nI7wgmpC5uVlN5mZh1q7hQ+UA6lMZM6hd4m
	MV9WbghpjoqY4nsHaokU6x0F8GJbUrpm0Png==
X-Google-Smtp-Source: AGHT+IGAomJOik8MqjiZHm7eirNShLlujIRGUrfTNhxgz3sez9ZGd+euk5Raj7DyHYRFF75x4SXADw==
X-Received: by 2002:a17:907:3fa1:b0:b87:908:9aca with SMTP id a640c23a62f3a-b870908b37bmr200612566b.9.1768140340256;
        Sun, 11 Jan 2026 06:05:40 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f1e95273sm439916866b.62.2026.01.11.06.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:05:39 -0800 (PST)
Message-ID: <05184245-9767-45ef-a4a6-d221f90fd20b@tuxon.dev>
Date: Sun, 11 Jan 2026 16:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] arm64: dts: microchip: add LAN969x support
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-14-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-14-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_060542_450801_D5E2ECF8 
X-CRM114-Status: UNSURE (   6.20  )
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



On 12/29/25 20:37, Robert Marko wrote:
> Add support for Microchip LAN969x switch SoC series by adding the SoC DTSI.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

