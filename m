Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72CCCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtTea7R3YJBuOC6RfV8X0XMfpykeCTOh6GwDCkF3AOw=; b=Z1BU5JOYmJWY6awzulUBWaJqrB
	XjvnkU7BTo8wFkXlJdbzrtQ+9lYy0v52TMCiA7A7ZWWtwQNtLzB5+u1MBaT2kAvR7NnEs9+mz2SUh
	CQen6Z5ApfJJ7yn7VQqzORy+oHjuXJkjqyLa7TlBhPgR5sdU2A/ucdKZTrF7ZYkXHH5H7zuVcZ/Bx
	ex+6oMAHfKaJOCKtzgK55vO/7BHt/BpiDfb472gcVr1Sxk94seLJsAF0a5Xz/Fp9ZO67xWw6TiqXH
	g/qRELeOzB//edWkmrKpyy1dKff7ILv1sntu/cGeRrZ+Z6BGOD5UN+dmSNPZX28g+cKbJzEWwpsCV
	cUFD/dng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXtc-0000000DBke-1uK4;
	Wed, 05 Nov 2025 07:25:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXtY-0000000DBhc-2pP0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 07:25:29 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b3df81b1486so102811166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 23:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762327527; x=1762932327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtTea7R3YJBuOC6RfV8X0XMfpykeCTOh6GwDCkF3AOw=;
        b=Gk5mVmvw54/ZDBK8xgMu+6X3fcoQg3GoeFvYwO1GQenWmyZOEfqXrTyUDBhHETRHjy
         yanaHn3oiqVZOLWFG1aNHnEE/6duafibowmouL9O2Jmkx0ZvwkrvpjHY0qoXn1zhCVxr
         VbDrpZQZ14ReHlI9ZgOZz+1IuVCik7GLAZx7jmnYYv004z/Y2flRpk81dYhd/8vVDeYC
         xPOHH0SpAcTnzRvr4VCQlk8Tm6v7W3g9GPyxqp4KyzchuU/7XS7X1y9TydzSyD54NuKv
         MVnBFcYxJ85NpNXUUxYlSdZOKLf5eW0mW504JaKsUj+ldUE3WUmP7dYswiZYLThjP1Ur
         KKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327527; x=1762932327;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtTea7R3YJBuOC6RfV8X0XMfpykeCTOh6GwDCkF3AOw=;
        b=sB0AmaEe57a3P2RyvwGCjHgQqSnBDnOunr4boOpT4EarYIlYchZCmXdSMaACceTGVu
         jbZ/+SFhZNmlEsIyYVougeHEJYcHoQXO86qWEKqEwLyw60qYzSAVpOzILOc7uPnESwX6
         CDzA/A6g5V7qJq1qs5QBSm3HoFYpp1kpbdcb1TEeotLeHvqCNKfewwvWPNjwF0eYTUkc
         NxoeYHERwigeknQqFGaAgs7Sd05PiaqUUQl1bjXhwWRBHugT+md9THHvj44577EDBWZG
         2BusRJ+KjCGYFi/sfyle73kEZM+N95fjmJQ9WGm5r6haOPDyWkAzJoGaJopxjNDYb6vS
         4yLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfdqT9+LDOsxBBv8LrODKy62HXEsdOovI4hImSXGurWCCLvtWAwayEtaZzl5sL+9RH7OkbERFUqwYzVbwR+1OJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwI5WCrTzu0sP6vlJXTqUFYjBx4rYsednOcFgr5rpr8hVKYHYZ0
	IH/di09ur1z5mbIqej3pKvaJaxHhJB2cf+Zff3z2yJT3Sq5gEzwCtQuJJiD4kMNx2PA=
X-Gm-Gg: ASbGncsTt/J/PXSU17tvAzdWyG+XJ5sn+Img5AzaVEpHqEAAr3wN0h0DmUEiqZB1Nm1
	Lpadd/9oW6XbB0cvA8GZPHaym6BMgFZttCMey23ofRr5X8hIgdGpP1ubY9Jz+f0VJx+JSLOlstJ
	nvNmFt0mZuQzoQDUbPu5vGaXLYMp/TER3sz5ahEAXQ47tTopY2nxxk/SFNKT1775tr8w1HWU+36
	bzHg532G2j29L5gWA4RaC6bZtUn/w8eYEEhs7Chh1kDXQnV+ar4Xq6UzAjjWI38akOh/dT+nAiO
	aA+yziMV/s4tjiyYXloh8qH6LUog62zRMsSscVPuo9wIqzesAp3tfANr5aziYdsqRkNclD4n4NU
	cleYQyiBOMfZS8TE0r6CM6IchTT9uJioNEaSVKZkqR8tE6DQatj/bgv1qM1XHn0H+GOI1i0b9HX
	xb3KPjcVmmtPrhrhwa
X-Google-Smtp-Source: AGHT+IH5piUBnmYvJgxB5GNOkBUWa7uI3f0Itj2oI/p6wHP7zi/ZySBa/bWL+wMjtsFvIeyWMU8PkQ==
X-Received: by 2002:a17:907:7248:b0:b71:a627:3d9a with SMTP id a640c23a62f3a-b7264e1fb60mr110002166b.0.1762327526646;
        Tue, 04 Nov 2025 23:25:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm411534866b.20.2025.11.04.23.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:25:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031-exynos7870-drm-dts-v4-4-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-4-c1f77fb16b87@disroot.org>
Subject: Re: (subset) [PATCH v4 4/5] arm64: dts: exynos7870-a2corelte:
 enable display panel support
Message-Id: <176232752532.13426.618023682429747371.b4-ty@linaro.org>
Date: Wed, 05 Nov 2025 08:25:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_232528_743050_15B92577 
X-CRM114-Status: UNSURE (   8.64  )
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


On Fri, 31 Oct 2025 00:50:18 +0530, Kaustabh Chakraborty wrote:
> Enable DECON and DSI nodes, and add the compatible display panel and
> appropriate panel timings for this device. Also, remove the
> simple-framebuffer node in favor of the panel.
> 
> This device has a 540x960 Synaptics TD4101 display panel.
> 
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: exynos7870-a2corelte: enable display panel support
      https://git.kernel.org/krzk/linux/c/ba2cd209cf8dc6e826f3ede80212911c23ed2076

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


