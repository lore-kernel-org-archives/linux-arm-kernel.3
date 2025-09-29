Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B659CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtpldhRDbRzoGsO+8pMp+y65v40hHUOFZZcRghWlbXo=; b=1pB5OQaTJZpyhVKStOQ52p4RR+
	I5kTRq02YZt8htwBq6Dby8bH7J/ln4IvP414uTXtiF/eLjNBjhoZmc9QrWSQv9Kn9xPIIQbjBgSJr
	gWNGd8XC1xmSqjJ4e5jbThrWabyiofq8Amh55j72U+9Ud4XwbCik+3SMwpWF+IBswbNeenktXFrso
	TEIc5BK1knAkzgWhFevgC1AhUY5wlilXTx9D2rgapKOYKXbC0oKQNSqQVSRyBxO6slDEJvpNG8WkZ
	72Y+fxEQKE0fWdxwHUi9FxJlG/vfP4qCPgzQacrDVOXqewnaQ0ukNhzSDvOcUfz5IikGjv/UD2la+
	frB0GfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38Ql-00000001dGf-1RS6;
	Mon, 29 Sep 2025 07:36:19 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38Qh-00000001dDy-3QYY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 07:36:17 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b593def09e3so1425249a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759131375; x=1759736175; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtpldhRDbRzoGsO+8pMp+y65v40hHUOFZZcRghWlbXo=;
        b=GngNaX0fsdvqgVb9P342j+P+erCZE1tNCRguv7GpdbF5HtDpg0yflwCg3Bhw52h3Fk
         sLaximbG5qsD5gTuv7eM0syS8RQS+vOfolyHbOtXpOoKcHeO0WoujGwBvlab5TKsLYda
         MKzdx9w+I7Dk6Q8JF+vZfhI159riB8EcrcxTGrKGx1hTwOSOl5c56rw7EYTkVUsgR6zd
         8lvsOnl5B1cYLxcgat3ouTRhWgXEXHRoSM0FeI4Drer/O4CLLFpNiLEmm3sRYakeDkGS
         +4y4WVC6ANPCDsYLnfC1zEK0l2iqDsSCq2QBdb9BJeyibNBLbExW3Jx735yq2xtsC7+x
         T2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759131375; x=1759736175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtpldhRDbRzoGsO+8pMp+y65v40hHUOFZZcRghWlbXo=;
        b=gkFh1ebxKS6iKvHv2P6PqpQbA1cxmTs9RTIsaOKlPTlnJxfGrpKs6tsylh+J+4rHOy
         s7pEG45vh5LGLIqRtqgOREaWLL7z+umXAlVpPcGa5uNSSNT2QE0VzLafs4IzbMufHxJW
         Q2w2BDnmnFTDft8FTe5cteeGpcnMLNfJ6QMIxjde2zctJycZb5JiUuzooDAlb/7ayHvM
         t2UCNujaYbLOxeevaOtG15o/s01ZPE01Qr5pTZ3TNec22DpZexcMk0ap+/RAPopGjXcX
         WXGEZHfBX9z5zHSTuvpcJihBVLUbCxPbf3XmDU9ot/ujlmLBrUOswlWR1zn1ixjuM4Hb
         VL2A==
X-Forwarded-Encrypted: i=1; AJvYcCW31tU6hBLqp8e4TiOslq8mOFsuWE6Tk3yzRwQPq3IiwWsvBW4MU5FwxzQEW6Bz6YZQjZD39QbK9+dGrP9LlF4Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwaHc0DvvLU+yqUdTcnOIBISjbXplkXMFDv06crNcOI4vPdMSVu
	+uZnRR5Z9hcbvQEo2xbig/7M4OjcBQ4ntTwdkHZDrk8VBsQqCs4VgSuA
X-Gm-Gg: ASbGncujYuIREsZvpA5ng7ubyveFHXt+tmuMf7Mg9WJAuNCVgcHBHq3Ux9KK7Bi3UN6
	4H78OZIvoGf7tfVLWwacCy9LIbV1MZY3qrk742hN1Lk6agwKDpjesvX0hC8Fl14+1gUqCWU/v0v
	BjgUUEZ4fsPBfPTrpPYYLQFTZUnS9CwJ2mBkbvemH/o5Bw/p40+7JQPSZXUCer3Cdwu8aGGCCGY
	no6KdRtZ/kJw6WQnbOX602fg10EQXMwJ/z0FCU8IOBb9xVqZ74vikntT5ZqpT4TcL5o8MkDoxrM
	P1o4kqNeRk6/oJ1ETbTEVCKp6yUOB1TIK5f66rN9ri4TrCSbkDOXTwTwhw1niHhXxpE674lWvei
	9b8Z/kzfhe+JIAIYhYhOmEVhLQzYGeXQ55BsNF+4avZgXkjkrKEj/cqmmtL0f4Hliy1FRqgy3ev
	Hf
X-Google-Smtp-Source: AGHT+IEWeCcdaLlQLuxHrfc5zv7vJMgw2RSY5WHEZHUZu8lif8TvLDvdNna1pOwRzpAobj4aitc+pg==
X-Received: by 2002:a17:903:110e:b0:266:64b7:6e38 with SMTP id d9443c01a7336-27ed4a47150mr170404685ad.46.1759131374689;
        Mon, 29 Sep 2025 00:36:14 -0700 (PDT)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27eec33b775sm92844965ad.12.2025.09.29.00.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 00:36:14 -0700 (PDT)
Message-ID: <5658a127-617c-464a-9651-5ab114161f84@gmail.com>
Date: Mon, 29 Sep 2025 00:36:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Upstreaming Pinephone Pro Patches
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>, "Leonardo G. Trombetta"
 <lgtrombetta@gmx.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>
References: <20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com>
 <175856183851.499898.2147562889507523573.robh@kernel.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <175856183851.499898.2147562889507523573.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_003615_865623_99C149AF 
X-CRM114-Status: GOOD (  15.81  )
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

Hi,


> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>    pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>   Base: using specified base-commit f83ec76bf285bea5727f478a68b894f5543ca76e
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com:
>
> arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: light-sensor@48 (sensortek,stk3311): 'leda-supply', 'vdd-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/iio/light/stk33xx.yaml#

Thanks, addressed in v4!


Rudraksha


