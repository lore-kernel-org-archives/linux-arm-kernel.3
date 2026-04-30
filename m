Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2932CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asyv7BZxX4DKLzzqzxpPZVMV4zIoDUir1OfAeG9wMnQ=; b=wV8U8w05MORE8FKs7Zw1P+WSIc
	N58YCBGhoyaMz+tLfiPaY/o3Q5OACNpOfH/cYAZfDMlG95pz+mfSXXBrLwkHromMxXP889ofmCeOX
	7QKAiAGuclxCx+jeNlXsjCux/r+AyVPksFarFPoP4TaUsxO8pth0Oe3MjSV2te1w3rM39p45PXbjv
	GI7m1qRnfNhua9FPbxqVQtFlILPDG5St/GkeDrQhBj8ZPkzzbAIQeoXDWi/NyQEHHb5ueXmrMdhL4
	kmbNl+4DgxUHVej73H1p24xsHYfD+d3mmHl5+8BY0Td2RllZaMvfxXAlQuah2iyXAv8iKe99Q7Sf4
	ALard9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIaab-000000065Jx-12JM;
	Thu, 30 Apr 2026 23:14:37 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIaaO-000000065IK-0RPS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 23:14:36 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c7ec83fff7fso655392a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777590863; x=1778195663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asyv7BZxX4DKLzzqzxpPZVMV4zIoDUir1OfAeG9wMnQ=;
        b=poWtEIIydE2HntklMrPUNJHOp9iQNW0AbOzaRi1mjVGNwtxILJAnKhHfdF4pMIzEJX
         vyUTQyt1j/1k0paEMkhSoUrN9knDDoTLttN29r3Su2isa7fp6CdzhzBna3DQbTsPrJez
         fTyNDi2376hWL8SEbp7FNyRmRe0PWh6MQOj2DLLhrL/x3TFklvqzOKs9HbyXQ9bCzW0N
         V5Xmh1s5JxEy1hVJtzbZeR9g88XUnnDSOUoi/hcjPGffLOjzX1AJAmoczbS5SKVz/ake
         czIKNIGC69BJw7OWhgqF5OSlZoV3iuwzR5bCPKeOrQ9BkaMpmnTZMT3jSgTTBPTrmOLf
         XgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777590863; x=1778195663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=asyv7BZxX4DKLzzqzxpPZVMV4zIoDUir1OfAeG9wMnQ=;
        b=EZeEgLGRnV8iwWdEz3mpfW6ZTAYmJxJOFCep50yPSV90/U0Pd/HUVFuvPWQJ8s6AOq
         g4/OKy9fqFgnqconTF1erTEQhLzX6HA2A9BuEtbxN3ECkGRuYE+6dZt6+rtTRb7IOpOH
         FLCI/Lxjdg1MoO9R3dhCTGw6bQevz1wWjnCtD6vZF2Tzrll52sVVHz3xnVwgcX/5CT6H
         LxmoavfuHdRPy89pISWeOW5NVMGCkMwlAJZPZWu/dWublrl+lTrQhjehtMEf0x6ugZ8g
         mEec1ehJAErZgzRIPoHzPMFHcoPAPm131LJNepUPzVfCBST9rCh5soGhYkqybaTd2tq/
         riBw==
X-Forwarded-Encrypted: i=1; AFNElJ8w9cN3V2NAKoTnP5Z/sFdasHpKYLcVfxjEvmaT1uA/hFyblZ5zHett0CRwTdCbOU2hsTFr42MH2/pzBKqLfWl/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6E2bxX+r3QBDJoe1vnRl6zqNOq37uO0JDHDpVdlfsAYrS2Jh6
	iJv5hnPXUuwuqhOK27IsFyQ2/rfwHD5OkP2qfQYetpYtQPhiiGWCBfUX
X-Gm-Gg: AeBDievR+70BQ9ZajxTeDxCqV1RsHMeE+2AG0XrgWyHWi9lXBGPA1U4SX8nZfYDNIAH
	MpEqmEU4GtgZs742LH0xfhBihw0DLmrQI/4hBTWcTTb8UTbLMu6FRKU7Xld01TbVoxiRGAC2Tfh
	8gz53AIAoPwd9M3gxb/yTXlbyndGbAeQ0EtgqQFjV2e7mrTLD4lcRvSCYyMAPePnmjPgS7UN9F+
	wEWAEQPNZHb/xin6dCvPOTuZ6km1y8dMUYWGw/aVTpENjH1BM8ccJG6StXEw6wPeZNhdQ4Y9fAd
	uwuURX0k6PM+mdjPFZpiAF1uBoO0u6LlmxOexWYn9LhRhz/w//yMUyuMk03AEjWAERAfN0dR9YI
	Uri0ZcgXbXKwqb2xZg+N0vcyPX2Z3ubmWbA0XDYQxknx9LPe6IsYhBCiY4OG4zIfUParJZLo0Dz
	6ABFjq8S3sHvu1epsVwzerHxSLXAIHgZoiEEUxDqkCbFjvJiKfossq+I0xEQ==
X-Received: by 2002:a05:6a21:3298:b0:39f:7183:b1ee with SMTP id adf61e73a8af0-3a3d1cf2f62mr4499046637.15.1777590863268;
        Thu, 30 Apr 2026 16:14:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm603009a12.32.2026.04.30.16.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:14:22 -0700 (PDT)
Date: Thu, 30 Apr 2026 16:14:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <4981e0ac-ee89-4c6b-8fc4-d6899f1cf353@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_161431_508202_17772405 
X-CRM114-Status: UNSURE (   9.75  )
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

On Wed, Apr 29, 2026 at 09:59:54AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
> 
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the PWM duty cycle applied during shutdown to be configured
> per fan output.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

