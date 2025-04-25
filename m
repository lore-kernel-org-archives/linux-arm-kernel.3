Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326F2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IMOiea3GhWLNir4wotniHxT7Pbt88zv8Te73Hc/hlo=; b=Wl20f3RvyNbQ7EF9LLGRr4El1S
	4oQzvqUYpi/MUSYwbvKqi+53Lt+dQCDt5HKfK78icxO4YLL8eqUvdd8weJxf0DvSKmPdfN2I/Ot1u
	wdaW33a9pLfRdwuqanACFyLuYZ4HzF5M/rk66HVRR9cBz9XF5YlekR6ougI/mlJbnAw0L5OrGiCQ0
	kzA9q7Nma1kB3PP9pgSWv/aObn85CsODye36Qpy0FoD9fVVKxuW/buKRTUyadOIdtOhzJeYWOc7DL
	eGbtw7McN11+9zDYqGbI8TLny9ZD9TcyX9/094BDEjJlSlICQh/m6UD/dMurcG1QddUdBlIDP+6bZ
	XAMVb1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Kj4-0000000Hb83-2Bw7;
	Fri, 25 Apr 2025 15:12:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JG6-0000000HJT4-34XR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Apr 2025 13:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6IMOiea3GhWLNir4wotniHxT7Pbt88zv8Te73Hc/hlo=; b=FLP1QiLsKAuT6iNNatTn2ExKhc
	hsY4MwNEpUY/hW6rXwxhQmoBEOwqVb2yxp+mrNuOt+69fjDMODd8MRC3kHhI//7QoFodeAxfoJ5Lt
	zBR8cRDBRa2CfgLMwE0oxtqFShi6J6n+5Dm7wNRYT5pTYFK1dU+jew8wkpoASugwVupkpaRHCh27A
	Q5y0lxwZk6Cv2sRySei0fFRQh+4r6qYVPNex6w/U20vU8hr8nRiBOHvmc9gczsIjkHieOqkh6S/ek
	BrQRNDrK52Uj70mlW8t5XVSywSFcNxorDnIkf90onqVolIllQudzKBApHywYpmwrQO6Q3XMvKbyMe
	1sidU3vw==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8JG3-0000000C3Jy-3qBr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:38:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso3744782a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588302; x=1746193102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6IMOiea3GhWLNir4wotniHxT7Pbt88zv8Te73Hc/hlo=;
        b=Ke9dp3Jop6wxW3jWxgaLyk5VozWGJbuelE8iQpbQDOGbGIAtlKvJiIRh2pjbGVfPvO
         pxhoBxFX/VV0oQEQ+XuLyLpArXVru6Nhx9shYHWdaAoNw+m1WrJwkWG0ahO7ednt2RuD
         DGQ5jexdj6Y8g50hs+Vb5GK1TNqxkZdJZkqO2Iz9XKtTR2sU8gWdjHImgd54vE2+XfO3
         y9EkY5+W3E2d5KDpSQJ0hOBga1JRln+pLtsHx/02xRTBroWGIwIj6+mxkegbcVXSuWUD
         wKM+Ga5e9tRn2kjksvkf2KD09cevNNk8JJGCAnit13v7w586ixkgJtqQ8ryUUCEisEQy
         AYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588302; x=1746193102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IMOiea3GhWLNir4wotniHxT7Pbt88zv8Te73Hc/hlo=;
        b=CTeOEWtENlTZv3SeJSmRBjvzkYWlwzGWTJ3Ct1KzL1RseoZGpgyI1JYNDgBzguTlQo
         2Z/4WFPlHAZDDFzgg8dPGMXcEf1m1XcWieEzx8bKgFgMna0lIrkceXUVJ/sAvtDcXfyo
         o6GpJ4ydLHXBlHTIFpFHkeLhE26ER9CwTmFsvEA29wRkYsJnDEmSigKeIVHIzz/298Kz
         Jl/Zch6amX+zok9ZfMKRyw4CGR3/WOqfbKgv/TMARjqJr6GOzUSwBkLWka/LKyoSRBa3
         jm3oPkbCqM04zgZhVfV1fTqwE0tK+JiR2tJOAbQ4XvM1wsu9categT6S3MduNjoqcGf/
         i21Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4sykof46LD1ttBy4XcpLm443ovuesn7DVxHW43vfi4nviz1kH9N8D/HMLMOjZLPCmKG0laPLxZi3O8QCd6b0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5BazUgmhocqpUMaSRLYuRqLWu2VzzaRV2zMIl3DOSMji6D5UZ
	vEgwUtESUT09zDVw+xZGVt5mZJMgSR55pc0Di/ZMAr/jaUZF1VW7
X-Gm-Gg: ASbGnct6/hzs2YmiWI64Lw57UjZ5qXg7Au2QaeWC4VxI9dXikA+AuRGhyNV93V0blJO
	J6NUjV3JIvXdVWUedbNvZoOAXYQKA60B3YQxI7j7CVj5bscf4TJUGvMk8RmEOv4vuU/sWETbNZA
	bLaBoqTl9AugQIMRqDbqlHmBpe1jI4uof+vRvEA0uXiLtez02+ZBHzVulSNOH+B/3iOwV3iZSnI
	W7z4VPxb7Ygw3Z1w9ADj8QsuPqRuahPF0AP5rLysqcGB9Q9/CXJFFsRcJYxg2WgHjf96o1SYx4d
	Rd8o3g2FBum/R6ESFAsFlFXyG4PqOMhb+gugVNDG7hlc5UUt0b3KcWQ=
X-Google-Smtp-Source: AGHT+IG1oJi+fCaW3nLcNOn339NORpBu1OpVP+r3+z/N3hqTIFh+IGeR/Kz+ryWWUdgqSktDSZIf3w==
X-Received: by 2002:a17:906:730f:b0:acb:88ac:e30f with SMTP id a640c23a62f3a-ace710c6585mr259076066b.20.1745588301955;
        Fri, 25 Apr 2025 06:38:21 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e4e7a4fsm142045666b.61.2025.04.25.06.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:38:21 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:11:55 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8qm: add system controller
 watchdog support
Message-ID: <aAuKG-_vk36dK0is@graute-macos>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
 <20250414-imx8qm-watchdog-v2-2-449265a9da4e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-imx8qm-watchdog-v2-2-449265a9da4e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_143824_039247_D3246186 
X-CRM114-Status: UNSURE (   8.21  )
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

On 14/04/25, Thomas Richard wrote:
> Add system controller watchdog support for i.MX8QM.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

