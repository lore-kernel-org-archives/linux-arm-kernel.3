Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDFEFF495F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELQ99DUHclnDOffuSW0lyygwgn+jLXmNAs1AdGgvIKY=; b=OwNZaBjihYXlXXAU/tJNIRT3//
	Zt8Eb9D4NVSqHId6S9jV/+T2K5zwNJInwYQ5DQNaezfRFGlmv88qzirXzaHSMNBknvU1/KsAlsl5J
	2RIUMNL+f7a7J2ri5UVazgA4I0E4F7H2nA8NxJn8TgWxNzCIg8Lp/k2xVI36LeBcQAyliKlgxqpd6
	jg2K2En/57W1fss5ZpTX3rfsiiOWx0FgNfVrqMQnQMjcRuBRXdQSIsqstAYowPnM8ELhahzSLBLVd
	L4lYgWAEpjKzjBGqUTfq2JLylLLbM0Tzsz1WMCp/VPuKBzfj3aFkUeQA7WXCzB7Trg+bPaBdIcK4M
	sd2ofg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77mi-0000000Apk7-3dFW;
	Mon, 30 Mar 2026 08:15:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77me-0000000Apjc-1WKm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:15:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48538c5956bso40971925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774858538; x=1775463338; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELQ99DUHclnDOffuSW0lyygwgn+jLXmNAs1AdGgvIKY=;
        b=mvOpCG1nUwit/rTzK3l8b9geXBYhxYv21ADEPqv9ZfJcrC8HoQQ/jaX4p5emkcHdav
         uwO2v4q7jdz+SpAHhtfKzaDXzziz6/sx3Onkte0rNuN1zM2iBHI/cVzRh19qt9xhm5l0
         5naU5UBAIiZaktPaTXpwQtmMW+SGN5LaYTQiGaZs0Pn8hnRNx8cXcw/Aqo06avtxzXOW
         f3Ubu2c4oHQLct+YtN9uk3npOJCzjH9SMuTPPbTni1S5icJJXdqnezT1S1+wuyXIIUVN
         x6XIH4iERt+0wJuDtzOCMmQd1MD9KtQfheQZyZud4hNRV3wnXSsvMwNqeakc7v3OvE9V
         5Y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858538; x=1775463338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELQ99DUHclnDOffuSW0lyygwgn+jLXmNAs1AdGgvIKY=;
        b=P4kF/tWxm7EU/Bte3NvDrE2ahcxPa7bFs/kx3nJlIjJetrktt5Kloetdolk3PVaSxY
         eshAM/s9dBAv+LUYM0Y9weDE11mD5QCoRQ4iKPlEjGB4gGck+T7dJcr9s/k/148n5drk
         wq94jkVad/pvHmuvKOwp6Ia7Tc1O8OkEPGjokxMrMhOJL7T1HKeHborSDj7RxYAJEiZK
         tcY2S5uhvJ9a1OW8v6RcNmEFxCpKgHfCPZ2PtphfHkn7MpBCAV9uY325OmosWRhksXpt
         UYxJZCNUOTo69xaRmJO01ZbC7Sl1eocN4nphR5+rDuhmlDRs4HtwUSpStSYpIEFw2nCD
         2Qcw==
X-Forwarded-Encrypted: i=1; AJvYcCXlF3nBW3gKCUHU0A54iL1V7jvz8G5Zi2eeBI01Mc5MfPzGQN4vknc37Y3AVa5v8mUqFiiU6ZIlMP45Gfpu+ucm@lists.infradead.org
X-Gm-Message-State: AOJu0YxNEPfB+29//tNwBYuOttj43q8QReWTVDWIUMxPFMjQZ8WmALZ3
	gOfG6ePHFiOIB5kCgsy9Ze8nTADV4mI/l94YOTIsJR6XaraQDcWz2ohq
X-Gm-Gg: ATEYQzwa4144pNVd3CjY6U+Iu4771v+L5NtScUG5ZzAmnd2B6sbOAmXA2D5WMnrrHDP
	BkUV+beEJE8lQY8+NU4yFLS2qIfVcdViaCaMYnxj1t30J59gXgvg4GyuHK91FR52fCwTUGDk+Nw
	FLcjLzWxo5t24a8XRlYe2PzRXeWPDDAwkPXCQaiVhvYPiWd793lkwbp+a3ogBlGvd87CZrNEpqd
	T9aHLimf0v3+HWJTBwcD/vfXnC6vcJsZxJkjehfmCtfc5fnswHzDkItL+JEzMbirPr51ePZG5be
	PdvBJ4Hsi4W75QWeuM7JzbdfmCHx7L9fI9DUaTHUKuJMHZ08cVsNWQKkZH0gNIwj6ZTDqWVLgIN
	0ME+pvIaxwz3d8xKYshp/u5zuDdScPf/tWky0zkCj40tHFljsMRjDJnvrkT3TZlJyiSxiT9bItl
	MpVezCkDlf0UCLJQ7BXTV3QOpPX7da14ywQDeiEdPLp3y4SLyepzPzVSKAvupwqlm1MO/nQZhuF
	JRxFaiQI0eswotxVYwDnyg5e5RmP204mO5jXtR7qH/a
X-Received: by 2002:a05:600c:c172:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48729109ac4mr162979685e9.10.1774858537664;
        Mon, 30 Mar 2026 01:15:37 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061ef41sm168098415e9.3.2026.03.30.01.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:15:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:15:35 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <acoxJ3KUVHqIR1yQ@Lord-Beerus.station>
References: <20260327163243.17334-1-stefano.r@variscite.com>
 <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
 <aca7ckVY9ure8Cwe@Lord-Beerus.station>
 <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_011540_429368_26FBADE3 
X-CRM114-Status: GOOD (  14.66  )
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

Hi Frank,

On Fri, Mar 27, 2026 at 02:41:21PM -0400, Frank Li wrote:
> 
> Accroding to signal name, it is MUX chip select signal. Of couse it may
> connect to a buffer's EN pin. I have not checked your schematic.
> 
> If it connect to MUX chip or some select signal, it should use above method,
> even though it is permanently asserted when access PCA6408.
> 
> If it connect to EN pin of buffer, regualtor should be good.
> 

Yes, it is exactly the second case!
It's just an EN pin, that enables a buffer to route RGB signals used on
the DART-MX91 som only.
That's why I think regulator is the right way for this case.

Best Regards,
Stefano

