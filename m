Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8591CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 05:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zze8JjQGVZ59f9v5sepoZK52dG/J61vT00o7vhqIkGY=; b=23LqUCfzU4QC5Ktmfu3R3XdXSq
	Wv58M+VCjhRf95DdTUIMtsfcJcMZtJvHIbJiQTOmkO4xO7eJVgX6S1e5H+G5VFpj5wAYArm0LJ3ta
	RCcWCijad9tbNHbspXSnYHAD07ahrcF+L+6MK95bR6bfP5plE8+PTPqGrzHMXZYp37xOBYUmIaaZ3
	9j6bYL8iOx9bQJge1AkUGmPCa2N684QfMiVHuaXFxoaHzpMSt579sSsuve2tQrukZk/XcM+bXSdXt
	mfkPPGbIg5ft1wZRID3i0NtoJqnPg5PUuHKofIUV3s42fap302aeqwCpq0+/18FoVhT5DLsTFGsrL
	+svuLuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60gg-00000001Jph-1tRB;
	Tue, 07 Oct 2025 05:56:38 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60gd-00000001Jnv-1Iq6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 05:56:36 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b55640a2e33so4344147a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 22:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759816594; x=1760421394; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zze8JjQGVZ59f9v5sepoZK52dG/J61vT00o7vhqIkGY=;
        b=CFj3/naYIvMuvYA1HPda3NR9ksW5LI9QtPKxWS6QD4X7ZM1WYN8yzQlx3sLla4eiTG
         wCcyOjpBlSh1oaZqo4BxapyPggDrr9G4wVu1EMu5XiZgVUVk/KT2v5s4TXeQhLmZdp/I
         2YQtDHu8Wk9zcIvddX7zMNFcldDuRYMNILGcZkXxLJ2j9X8DBw2SFR9wYP6rFUPwVDMP
         kDygZQ+DWyVllvA5Q6b1amXCb9LKS7sexDD5O7Yo+B/p96eq2O/NDlmqF+fWOOymHMEC
         oTh1kZvdP+YEBIexynIkwWcxT3CoVc89jII7gcRpgX7xrRIMH3gDg0fG2/f84HIhg/h3
         Id7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759816594; x=1760421394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zze8JjQGVZ59f9v5sepoZK52dG/J61vT00o7vhqIkGY=;
        b=n4HII0ZYgg8Lmp9icyAzL9ZaZHkAJCpTW+v8pzaGdstWDM/w2JkKuk/lTKK4G8cRSg
         +F7pecWy/e0zbG3MfAOGdufJc+BlYldqa+9x1ECkNZOCziLo4/A3J/Pp5N5XMb6ZNYvf
         3c+Xg+QF/ia4Lu+70TTmZ2K8G02BMghngGuUEWzYfCU0N1x43RtOWBSR9PVKfnUUeu4N
         Zzt8jYS4wZolL1V0HQD3rqCJa1ZViFv/Afwik/mXKq2dJLHbt1UwZWJgd/sFWTmDmNDf
         nn9c2MJjJrfDolJHUOJkRIpQXGg+K8x+NaT+1MLgtgUETtEcU0PPUi2Q/v7Fg/0ObzCj
         YJBA==
X-Forwarded-Encrypted: i=1; AJvYcCWlwR0IXZsQjGY6T5IocQ0RS01bLkFaN+rzdJbJyp2wxDoqcWlFpp0M5l7GIqYsusays+rnej/D5wtg7tXd+A19@lists.infradead.org
X-Gm-Message-State: AOJu0YzMpDRIW25+87WQIjMb3hGOiyQgptYv2d2d+KFFpnjijcS6hxX6
	K8xZ+juBCB0GjIP7fm0BRc3ih13d3pCRUNZylv7uzQY0E5ybDMQU8vzx
X-Gm-Gg: ASbGncsqMzffg3DsUFnYJlCj8SSx1kv9hkRVqcocu/5FbSqYIDofIPX6G4AK31ve0Pf
	q5piEwKlU/eun+sd5Dnfg6pQKYrj+AWMQCPcydrou0Pe5zZfZheA30hW1uq9yl4sTHet3HSDh4F
	eYqWHwKPeXpoxb8MVO0gDyTvisUVZ6pmPYZRbUYXmIJ7PxC8Sbd77kWo+IKvrQ3vaTSwT82Nb3o
	1zlkwEKcyRmBcVsV3egUzHIcaFnygI5OgG/O4xaPB47YLhOfJvv+TbGzBJhwfRSDlW3+ayL5uhF
	8niDm3cB4DDFTySBTCgnyCQHhBV6r6tun5HbV4bn5f6LxLTotsIzNE/3BqE1pGzys/eoWupbTNc
	VCIl8Iy8r6Lh9y38dkA4NavxjwiRs5FnM1Loo7xSEYZXa34FDFFUvbM2cLO4Q4hJeKBxLqG4Gdj
	lQNLrUwC9cZa+mB4ZOSxEGrt4V
X-Google-Smtp-Source: AGHT+IGJchkaRL43RoVbJQM3/xqF6zJKcQKtxGwtkcJ6fAH1ggss6t03FonlumhoWLdanF+7D9Tj0Q==
X-Received: by 2002:a17:903:987:b0:267:a95d:7164 with SMTP id d9443c01a7336-28e9a6b25a2mr170679085ad.60.1759816594138;
        Mon, 06 Oct 2025 22:56:34 -0700 (PDT)
Received: from [192.168.68.62] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1eee04sm148269865ad.130.2025.10.06.22.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 22:56:33 -0700 (PDT)
Message-ID: <467bd938-6fa4-46e7-9f98-d8d2a9e74eaa@gmail.com>
Date: Mon, 6 Oct 2025 22:56:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Upstreaming Pinephone Pro Patches
To: Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 Martijn Braam <martijn@brixit.nl>, =?UTF-8?Q?Kamil_Trzci=C5=84ski?=
 <ayufan@ayufan.eu>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
References: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
 <49dafe9afc5962d8fec10e6135c9b84d@manjaro.org> <8606261.29KlJPOoH8@phil>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <8606261.29KlJPOoH8@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_225635_347261_D363DAB7 
X-CRM114-Status: UNSURE (   9.18  )
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

Hello all,
> for reference for Rockchip dts files, the preferred format is:
> arm64: dts: rockchip: Do something on boardname
>
> aka "arm64: dts: rockchip: " and the rest is free form but should
> mention the board.
>
> But I'll generally fix those up myself if needed, so right now
> there is no need to resend just for that change.

Gotcha thanks! I'll leave this be for now while awaiting for comments on 
the mount matrix for the accelerometer and the magnetometer.


Rudraksha


