Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D29CD2FEDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 20:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TajH8yN8UqkekEASPsMQ18gVGY2nFAz8e8hQXy99WE0=; b=jQKjNZYWlM3uUtWE4Bq3EWZJb0
	pOdaVN8YUQyWpgTmv/2QoG59liYrFZOG7xpFbJhCjQTc5KFUL7hNqH/DdHIVJURybh2jLlIB6sN8G
	UsT5XqGfqxEPJk/QQ9hFqAh8RfR6pIFJCKVB5nXMvEZBh9mDN2jv6nqtLmoGp8afhVj5lnDdSRffS
	y8dHcKZITopaTQBw6btSkZIAEN3ScB2UZ1pv/Am81/dxhpgyyOp1ktNLDutb3QO6VqJwAqTdNJUph
	7jafujn3qYgC8MpA9vUQtojwemLXYoXzD6IS2Fu6tTFjibqJWUj/6hvTBt9DhgV1u0jB0Zdcefqk6
	13FDFeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpSC-0000000EzUV-2Vzu;
	Tue, 27 Jan 2026 20:14:24 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpS8-0000000EzTh-3OET
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 20:14:22 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-c633984fbeeso76783a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 12:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769544859; x=1770149659; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TajH8yN8UqkekEASPsMQ18gVGY2nFAz8e8hQXy99WE0=;
        b=pOsXaYFvPho+ditxmTpov8hpnlPDzIG4yH9JGO1jEZt/p++3x8s9E1R4qlZL1JCOyD
         4Vp4vTCAZHVnjH2wuTF+XJlzO+9UMLsWUOE2EPSSdaiZcMaYA4nW0FOlttzfz118rX6+
         UTNKzmpwb+tMbmY9OVg3ZDKQw/JGkihcgbFfsh70fgri+FVe1EeZV+MfY/7tzcJXzg58
         MogOzO7Dcq+z6XKCVyEqhElspbKmQCqWa79mwgQO8m4UtQHOkZVP6ViQmdtNZJ6LSGSe
         MH0oS/oqQer74ppCWg30nnXtV4yFG5HrC2dlBo35NITXfvY7Y7T4LVabO11IkkuYK/dH
         sbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769544859; x=1770149659;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TajH8yN8UqkekEASPsMQ18gVGY2nFAz8e8hQXy99WE0=;
        b=sKWf0bVZlwCIXk3HZlgrxQ52QuOYklISBF0kWURe6A9QGyRFjcoAkPOLd18Q9pWxTp
         O5TWpWQZ9WYbP7JrbSkA2DyqKtXNJ+rvCW2JTK5hafCJeoKYVMzr9kZAhGMQg45wTtpd
         4xJQrQBwN4qE4vuWZHHI4haq7Y3Tco/NFQ8cGCbTz2UHbdbocJCX9JgjheE8yi4gphDA
         QaQkzM2oEVU9iwphRcQpL451mzrhbOfdx/KecRpDuxMGlNtMRP7GTV/tdQM1D93i2XbF
         R6bauCBP09J8N4CjF+SkoZrBoW2XYHmw3Nt5+uYEus3XHEO3xmtHpTrnWbdK+nNrblsI
         5hhg==
X-Forwarded-Encrypted: i=1; AJvYcCVC6l+VfybBlPI9fNETKmA+DK7nv5PxC6ZMsI2FsKSL0aNyoE/wgZ6t0OgtVzhTukc49vKpMXYkgHoIAE58HVm1@lists.infradead.org
X-Gm-Message-State: AOJu0YzLnMheN2v7tHKD8399Ri3gn2mxFipBbdCwYzj5ENIMbE7cT5+4
	IeaJesnrOUKiI6kG3Q2uh3riZ27/huggnh6UMIvE+2ykpa8TSuAUMntnD6WEnRPc/vg=
X-Gm-Gg: AZuq6aIC9clUka8PAOwfqyq/Br0qyS4St7XvyviMHb1gaV9y0vehzsJ2pWLZur/DnOD
	+9CapiFsPHyrMYqyV4pFPxPyYZ7WE1i6461IS9xYIf8HGGsSYW9Ajga/VhCeehG1QCMoGrKSjDm
	8JzUpYzWgR6ZwLNM57eku5wdURGMRI7Zm8VMAyl0padtzIuM7tHzvbhATiiK33MFLA5BJigflm/
	1rBC8OvH1ixBJp3+x0wSYJBRdDtcFGofkfPWrZwWAFd59og1qnOx8WzPOh4FhQrNdXWqk2aIzdC
	nz145H4DL1m6TwIidVqzfz8FGkg5pYYfrDgu5fJMWMWgUDA8CjtpgcKVet27KsnmcQO1B4tfujv
	KnwcDOSUuFdZVQWwPjPYe+ngU5MrMwvpweP/gF72SpnL9pBJFa7kKMmn672fWCsMwXRTyEKuAfv
	XrSwDTqQHT
X-Received: by 2002:a17:90b:3c4f:b0:34a:a16d:77c3 with SMTP id 98e67ed59e1d1-353ffa2e81bmr2244550a91.2.1769544859290;
        Tue, 27 Jan 2026 12:14:19 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61e0007sm3373581a91.12.2026.01.27.12.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:14:18 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Kendall Willis <k-willis@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 d-gole@ti.com, msp@baylibre.com
Cc: vishalm@ti.com, sebin.francis@ti.com, a-kaur@ti.com,
 s-kochidanadu@ti.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis
 <k-willis@ti.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: ti: k3-am62: Support Main UART wakeup
In-Reply-To: <20260122-b4-uart-daisy-chain-dts-v4-0-cfdabdf5e6c1@ti.com>
References: <20260122-b4-uart-daisy-chain-dts-v4-0-cfdabdf5e6c1@ti.com>
Date: Tue, 27 Jan 2026 12:14:18 -0800
Message-ID: <7hbjie6cf9.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_121420_850714_4F6801CC 
X-CRM114-Status: GOOD (  13.83  )
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

Kendall Willis <k-willis@ti.com> writes:

> This series adds wakeup support for the Main UART in the device tree of
> the TI AM62 family of devices. It defines the specific pins and pinctrl
> states needed to wakeup the system from the Main UART via I/O
> daisy-chaining. The wakeup-source property is configured to describe the
> low power modes the system can wakeup from using the Main UART.
>
> Dependency
> ----------
> This series depends on the "serial: 8250: omap: set out-of-band wakeup if
> wakeup pinctrl exists" [1] patch. This series should NOT be merged until
> "serial: 8250: omap: set out-of-band wakeup if wakeup pinctrl exists"
> is merged.
>
> Testing
> -------
> Tested on a AM62P SK EVM board and a AM62L EVM board with all the above
> mentioned series implemented. Suspend/resume verified with the Main UART
> wakeup source by entering a keypress on the console.
>
> This github branch has all the necessary patches to test the series
> using v6.19-rc1:
> https://github.com/kwillis01/linux/tree/v6.19/uart-daisy-chain/all
>
> [1] https://lore.kernel.org/all/20260116-uart-wakeup-v2-1-0078ae9996e4@ti.com/

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

