Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B63F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FeSeMVGmiBmUUh+28J1mJpe3obybhw9+jiCLpL1n1Q=; b=L3cLjgPkm0ep9dh8v1dm7aly2W
	LrPZXhqZcceIfG59sYayxfso8hEUABT56Eyx3RBJ6XJXcD6nQ2Md4WndXC1Z6DmqW24AHCXaU0sbI
	8Y7H8qiyKagVdgcgRPAegautQleXxr2bIUkUEymOpnuvPn/vw6JMLvy/Rlz/8CXpR3oXHH9TXQa0C
	a7tcPJaqh2sbPDBngrkljtMZubtvHWoIoilJ0EYabTsn+RdULtiAyUZp/PzTL70h5ze7ZArwQr/aq
	hOZP1G4YkT1FpSyzGRKOqREH+WgNB/3xpERQ8TpvyV3exFtSEEfedjQaSu5J8xAvAjpUoVGFjQkHt
	Em7kzV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyskA-00000005GjW-0hZ5;
	Sat, 07 Mar 2026 14:35:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysk7-00000005Git-13Jd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 14:35:00 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso2450259f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 06:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772894097; x=1773498897; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FeSeMVGmiBmUUh+28J1mJpe3obybhw9+jiCLpL1n1Q=;
        b=k3wQtxFWBrCNV7SL3Y+ZSjDJ0lb2Zp0DADJ/uiYj94Ia6BYTUCFuS9Rpl6oK8Rb74v
         lnns6GnS+wPsMQIJS/FcmdDlZY1yeoV81MZ0GVjtKD12Vbt4o642YVoeS7MKutdcQ5qW
         UF/H3pHOKJvgCclOm7YU8eZ3I9CphpoSl9FtRDPvvhEYCYB71qI8vjrzVshvGDORTd4S
         fNwgcP3uDCCJF1lQT5ciFPCqXtEEhSX9WcX3zn6IHZBy4MIbRKF2r+s0y4DCU2hv8ytz
         /+zssD6fKTvf5d+nxw8UfmdOESTcuTJYYPFdLBI6iLlenRZpgpGM14L/pEUC4RMLIwFb
         d7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772894097; x=1773498897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FeSeMVGmiBmUUh+28J1mJpe3obybhw9+jiCLpL1n1Q=;
        b=Flq3N4G4kdqhQA6JmU8h8hX9Mho71owumWurXhnlpC3uaX/PAp3FfPwCaeS/jIOblz
         j2GM91CYj8kGIR1+8GQjvgKGzXciFxEuigLtl7deHogwoEc+cjLrtCrLwS7Zk9JZBzS3
         BsWhzHvi3g5Ru3wyyzdZTlc3QQUZoIWU+gXYnpoYQgbDbAj5nj7tifEvTZrXbzg169Et
         JkcR1dGvtjUr9ZRfgh3ypp2zmjhitiBqOAeMlHZIysblLmBUU2dIxuCVaBbQG7MjWa8J
         xCD90IWF8uF2qk5SuBeKYTt8T4cL+0R56RoGj13VWYQOuRJ+zFaRsZ6Xj9f2oxotS5Yv
         Qb3g==
X-Forwarded-Encrypted: i=1; AJvYcCUD2HigzXgZe3qlsC85NB9YRsRClFS8LcrmmawWY1IDA+L6DMb3zbflgHuy/jj55kwqGodhqSttjEce4Ra2uh3J@lists.infradead.org
X-Gm-Message-State: AOJu0YzgCap9aqcaAik3OsoZ7ieBOkaslJGwLYs1UWezlE+DUJgoNmVD
	LN4AN+g1/4IjiQZuK3najnV+rinad8AhDrzphWvAosO3CTGuYoatm88YuEKM0jEMqyk=
X-Gm-Gg: ATEYQzziJs4KuwZ+H1z3o6XOwvUktUv+1aovxIfwV7UuC0itH/SBDG3TDMKXAT2eH2E
	28vs+J87digfvxvhMqdkU5aeTbyi2mJAoup4ER0Q/vt1uKa4UKaLIZvcO6V9tyv2ABPL66EdXZO
	ifKaXvZ+Wqdb8PAvPlzKLwRJbFR8mdNaGdLKjAV2XoU6iU3h886Y4BHwYfZinwhEaTcweU0aTj9
	pQN8ypzrgm1Qgx87ldea65eSwRO6Z9Ufqjdhw2/18Ujgu7b+cfXGid/XOG1sCiapgOQKuHdD50b
	BeTNEzQ6Zj8qAW6x78Oj5+HeX5KeqtwTmLISUuzVTy9a3J806Wd41qU7cdoPyYxGx297wuDgrID
	pIpaBRhhr/KKTI8Nmmv3z6gvfH5ckawbMVIOLvy3pWJzflP8fVSmBfV2xPELmKzVpAAd6yM+htH
	OXHbDK+NLouIHQMeZRnwvii0Bg+2tLl0Uhrig+fEzy
X-Received: by 2002:a05:600c:a12:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-485269648fcmr86295495e9.23.1772894097126;
        Sat, 07 Mar 2026 06:34:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686bcesm186927115e9.7.2026.03.07.06.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 06:34:56 -0800 (PST)
Message-ID: <3477d2c1-31b9-4b97-8633-df02ddf71e08@tuxon.dev>
Date: Sat, 7 Mar 2026 16:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] dt-bindings: arm: atmel,at91rm9200-sdramc: convert
 to DT schema
To: Akhila YS <akhilayalmati@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
 <20260227-arm-microchip-v4-5-7e2ae1c5b5d6@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227-arm-microchip-v4-5-7e2ae1c5b5d6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_063459_324285_01A462FB 
X-CRM114-Status: UNSURE (   6.03  )
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


On 2/27/26 17:14, Akhila YS wrote:
> Convert RAMC SDRAM/DDR controller binding to YAML format.
> 
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

