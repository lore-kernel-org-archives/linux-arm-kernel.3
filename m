Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5E8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYlJ0E4Ef0Uqk35T62BnNc96CPI2l7xecoYuJAMTWcs=; b=oYAOn878gSeGwmbxuO+m826FB4
	+G4SXn/xHcStXObn4x5D5d0ZxP+3kca7v04pWqd2d6CNRWlygtfw41gKDKSNKYxdpl2cTZv9qPXsh
	euvVoICCaB8cXGZk7qlNIRj52CwxwdIPhOKIGs3Oh0NSc5jti4nkh/wzWO6pDI7H8XhTkditnzDZK
	uz0h9x1XgGXnQKjV3aSJRSkR+UPB5J38y4735snqFG0nZX+mQWoIFuhmLENv/xPIPOrQEALy4vTSV
	yclzzO/U5xzdPFTzZKYihRshPYUaGZaEce3DTpKw5NX82U5w9KTOQCvkcaQJzEGSb1biRaHAMmzoS
	39f4OTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79xm-00000006ZCh-0Yxk;
	Tue, 22 Apr 2025 09:30:46 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78av-00000006DzW-2hFJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:03:07 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e8484bb895so1448414a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745308984; x=1745913784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYlJ0E4Ef0Uqk35T62BnNc96CPI2l7xecoYuJAMTWcs=;
        b=bNx2jZ+VGoq6NDz9L9zFj7Mk39OzcDZbexdcVSDsxm1bysLn9vACtIUCmo/noKFj8Y
         hT5SFnN6dTeWNYt2FDrD5M6p4qAcVYTVVdie7eCkL9MhkEwQZLgtyIa5jTOt27h2XQwz
         vt36um6OALAlVGCgoSb+ZO+Z9OMPiW8m7dFq2TJTf97gfR5Ie5d2jMrZt2Yj+S/k5qpr
         VPIoFmiOcn9/zm7B9u+EUkx0+1fRTozWhvPzFeloJ0JoACPyuUse5tZnnnXVLxiCZ+ph
         98jFCENRiPVkanKgy94h5ZwMmfKIzNFeE76N/xco8nw3uS1e69rSMVgVbMN8HdoTr1eY
         2m4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308984; x=1745913784;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYlJ0E4Ef0Uqk35T62BnNc96CPI2l7xecoYuJAMTWcs=;
        b=e9DuZGcRPoZwbSXfy4344Uds3UF4PsYTzu2ss2l6gsAbq8VrGU53sYMqni72Wnk/1y
         HzT8/96D2Z887UDI823cciofdMn5stYdj78jbaT3Ae9GvgH7HoK95Q28BFmZIOgoXPLa
         V2VJUtqHuFliG1SjA3dq3uakptZBfCkX2O7h3ZrqbMl9dLYFs1X+mhI78+YnrAQzkj/8
         E/IXENaBjHo8ufgD/gHaWmJzxf7q/nqAV0Yl6+TMs5xKnOATHMAlpnckQ7gijiukSzlZ
         2Ip2C11zIJaYEvXk8z//KVy0p+K/M+XRg/RPm7U+m/B0OaazetJ7lz9YsJhoMYEQI8PZ
         z55A==
X-Forwarded-Encrypted: i=1; AJvYcCWg0DV9d+OQv27DDTdkex9/IQJ6dNKuXhdlRQp+bbvLbL6G9lBT8qgAw8n1+mP8o1qTKeQn9m23n4SCLy0+FlxM@lists.infradead.org
X-Gm-Message-State: AOJu0YyFp+0t6QAtmRBa0mWv0Y/FKfGPFdMzzQwdg0dSIcS7hfnjChAZ
	Ot6qGnqiNFSSk2QOzTWbCiKaFerXX4m3G1EcVyNwYSr1ck0vA2WRazEJOcD4U00=
X-Gm-Gg: ASbGncuSPwTmmP/FCAIlBafixv6wwLitYOIXgnWawqiWLRGReFSS4R4+Sg3wfE05grv
	UM/08asnsdXVSjWpjaKmY5EPX+Fsn/xftGu+SFnyYT/bBsgheto+s9pmVdIZUc7Ysaan8iehNts
	guwlPCwTDHQmFH3ocfZMh94bfsBYS7C2pfNHbHA95ZdAZZ2AaeZykL6A2hL6ddfLly00bLQ/tsp
	S+zjTGVRke8WjIIeDhZcfUlxDrPPPI/KCYoxxvIUXvEyl7qeB4xaVPJj5ytPnDy/2pC30Zxurtl
	LSvwQ36FVyvcEc4GHoxnyafg4C9UrE0UUSePhxhR+/PZMpq8VZ0pwk9mPzs=
X-Google-Smtp-Source: AGHT+IFpVvUV1oaLLFD7OMY4q7WMHWDpzWh2Hzu/nmhgvGIFfDUBztmXsWCEyQ0CoS3xJmrQ1Ct8UA==
X-Received: by 2002:a05:6402:3513:b0:5e0:803c:242a with SMTP id 4fb4d7f45d1cf-5f62860d4afmr4498727a12.8.1745308983873;
        Tue, 22 Apr 2025 01:03:03 -0700 (PDT)
Received: from [192.168.70.232] ([88.154.3.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625593409sm5532352a12.37.2025.04.22.01.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:03:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
References: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
Subject: Re: [PATCH 0/2] firmware: exynos-acpm: clients (PMIC, clocks,
 etc.) will become children
Message-Id: <174530898122.9276.5071475909293812602.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 10:03:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_010305_678357_F9E8B0DC 
X-CRM114-Status: UNSURE (   9.26  )
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


On Thu, 27 Mar 2025 12:54:26 +0000, André Draszik wrote:
> ACPM clients (PMIC, clocks, etc.) will be modeled as children of the
> ACPM interface.
> 
> This necessitates two changes in this driver:
> * child platform_devices from device tree need to be populated here
> * child drivers will need to be able to get the ACPM handle via a
>   struct device_node, not via a DT property name
> 
> [...]

Applied, thanks!

[1/2] firmware: exynos-acpm: populate devices from device tree data
      https://git.kernel.org/krzk/linux/c/636baba9489a634c956d6f02076af6bc1725c132
[2/2] firmware: exynos-acpm: introduce devm_acpm_get_by_node()
      https://git.kernel.org/krzk/linux/c/a8dc26a0ec43fd416ca781a8030807e65f71cfc5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


