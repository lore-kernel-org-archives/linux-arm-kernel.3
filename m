Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CCAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3Ks4mocpdIEXUivuFMkzFbV286Z/TWBxR+6eAPxe6s=; b=iQqg9U0cAx0VA6NG1RJSuyzXRP
	IdOOK48f9lVEpm1LJpsPavMi/nmgcXkBWM9gS0YBdUsvrnhiFAhQo/O+jacfkpaVrM9GGOndJbGCr
	rcFak0ubv3Mf0/HUX7aV1ZC5Yx4kVwHWRsmLIn1EVDWqkSTtU2YqGnfmgBPRC2N1mxBiucA88/9d0
	4makINFK2q/gbwigEc0k5cBv5odpJtLg/fZK6r+ufdca4J/VLYkcJKr/s3JUhpUz9nxuv8mlbpqya
	EwTUCK20NHivqJfSOWAzraDOL0Kb+v1AHYiSGjllv/SozgVr05B8Lu9qSOS96D1Y1iNDZ6pyLHXUg
	xwCf6tfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQ9u-00000009Uvp-1lCE;
	Sun, 05 Jul 2026 16:57:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQ9r-00000009UvP-3i8g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 16:57:33 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493bab44440so11225045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 09:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783270650; x=1783875450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3Ks4mocpdIEXUivuFMkzFbV286Z/TWBxR+6eAPxe6s=;
        b=YgrVxtN284D7GGcau+rDCxSkqk0G0jQFdLmN8+ElK9412NCKiHMpYuxk7iK/0V+JEx
         PyKLsqwn9gUABTk0SKNfxkJxzIG3plYma+ocqRHNTTaxZtkMRqCXsj9+Fg10syCkNqTV
         A8pqXILHnIZ/94VLYpROzv0fkRHpVBehRMrIY14rApCXrkNqxp13/BNDRF8XFY8Y7LiO
         qn6EH7xjrefPzMOwxCq5S+GyXc9BHxmfHf7gzR3PChcD5kaFKSDZtx0ehbd/C5UwylRK
         KmnzvNaPMIKHhOAXd4XOICf2f70of38H/BG+eV2f2916bfPvyL8VSY3JL0X3Jn+361uM
         4N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783270650; x=1783875450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P3Ks4mocpdIEXUivuFMkzFbV286Z/TWBxR+6eAPxe6s=;
        b=ocdFEiJL6J1e157mu0YwCDZAnjor8GzEAotJf5jlmS2bWH1TxiyRHt+JudLlbcVdtW
         oeGMJD0o2qMuDwDVBP4u3rU1n9FdNdIe2+ZM79chBdk523VSTi4WiqfsiYPppV+AZXNC
         F5/FSHtXh0co8IpGkCkiM+eZ0Bksl7/JQhaHU0kOQGarZrfUdJ1+Ewm1zkgOW+SThWQk
         +24OuqE2y9Y1ZFmgkUKGLdRYyFUTlBN/a860zO4pUwCp6uSieTlQemYwrOtBWqbJ/wHt
         KvYKWZ45tA4OhpNbONrGbqybOWzXMs90xhZZ4q6DoGc/rzQQYbpZHQvObG+PiOs2yPZ6
         3/wA==
X-Forwarded-Encrypted: i=1; AHgh+RpOGPPg3XFINGLD2jIq6A7GH5lhlGbawtiT/r0KmEr4OwWhgctZ+Qx2PGwEwv1nP3HO4vlFVoDYELF3GDacNfao@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ8rrNMoxncAAFQQkAiLaZRNlQMjaANB543xpuxEebKCqZMIKH
	iLkPA51nrpjPYZTJfueg0mAN+L1KFYzJlN4W3+Ve0HyaK2f03fQBvB7d
X-Gm-Gg: AfdE7cleUOQO560qp0RYwZ168ejqX8Oknyn1X1G1Cl44bXxdcXzLQHyzUVDvFiEzYU0
	u76BK4gV/CvZ9Sr0Os/j5a/pi7kucv1QpxD9R+jK2KoBqlpBBjiZwcsmtC+8t2uXoI8CZ++Ax7G
	pcCJGzWdJIzS/+BTB0OMH9psCvJItNsvhqLMJTNySmcbljrL79CIiprOAN7rJdYxMrjuPCPcUyS
	BCujbjqWi1FJ0SKyx3+t8rBX6zeNGnU61axGjRbuIEFxW0KmjyVjHLF8faHb/L1BOBYnRFXZOdU
	Fyj5Bb43a5g5tupI2mjbM++H2st8hhe6Lw6PsxWgSMtT7MTxj1M/yZU2AcvmtJ8Cu+RyJwAVIIk
	JblQ4s6ITCDVPwltoUEtnSbgYyGe88bFdQy4BUcNSMB98ZLJMCHkKSQem+ZZ6RiHWQ1EEgHjEad
	7uEchIuaWZ9cNzGk48
X-Received: by 2002:a05:600c:46c4:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493d159b8fdmr65120135e9.17.1783270649788;
        Sun, 05 Jul 2026 09:57:29 -0700 (PDT)
Received: from avermoal ([185.13.176.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm363764965e9.13.2026.07.05.09.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 09:57:29 -0700 (PDT)
From: Mikhail Lukianchikov <avermoal@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: convert Xilinx XADC bindings to YAML
Date: Sun,  5 Jul 2026 22:56:20 +0600
Message-ID: <20260705165620.9818-1-avermoal@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <d7607a98-f5e1-417f-ad64-d0029c9de662@kernel.org>
References: <d7607a98-f5e1-417f-ad64-d0029c9de662@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_095731_966470_663BF33A 
X-CRM114-Status: GOOD (  10.56  )
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

>> Convert the Xilinx XADC binding documentation from .txt to YAML format.
>> This conversion is part of the ongoing effort to migrate all DT bindings
>> to a machine-verifiable schema.
>
>Sorry, but what effort exactly? Where is this effort documented? Do you
>have a mentor if this is some sort of mentorship effort?
>
>And if this is ongoing effort then don't duplicate:
>https://lore.kernel.org/all/?q=dfn%3Axilinx-xadc.txt

Hello Krzyszof,

Thank you for feedback.

I'm the newbie at Linux kernel developers community,
and sorry for my mistakes in sending commits.

I'll answer your questions.
I am not part of any official mentorship program,
I just decided to try to contribute to the development of the Linux kernel.
Yes, it's a ongoing effort, and to be honest, this effort is the general
community initiative to convert all DT bindings from .txt to .yaml. I didn't know that work
on this file was already underway.

Tell me, should I continue working in this case?

Best regards
Mikhail

