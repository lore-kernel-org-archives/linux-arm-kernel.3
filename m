Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED542C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 06:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJjA/FXfjTD2FQE71QWuHDCBdzjs/ZNL3lM7sCOkk4k=; b=dwERcbjSh9/F66/Xj+Db2w6atT
	ozJNKOGJgStqjTN6gptrAFzVxdpWATB8x3QpLzyizrvBLH3bpdQkOY38z7VIxIH6swuem1PnzRh2O
	cKzpwSZFmuBpqYq+dBGMITVHNSBtQMIhcQ8Sri61VZHkSMJmyrtCJOaG1L4WlcAwWGTsyCrNkRJGD
	cs0qYf6iozgC1fGwjJKa8Dx7s1cEgK5I22yB96OAGnRL1UamdZ60WjN25XTGOIR5tmh/LdHVUHXxY
	qsqjk/VBKobsk5iYnaRGPWoQPZkUsINElw9iqLURmKTGKMElX4/SgYBnKFpANmaJg7RU3BEAIUtKd
	uhmxwFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMzp-00000008Yy2-1mwd;
	Mon, 12 May 2025 06:50:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMoJ-00000008WXx-1pzX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 06:38:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ad241d7680eso3081166b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 23:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747031926; x=1747636726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJjA/FXfjTD2FQE71QWuHDCBdzjs/ZNL3lM7sCOkk4k=;
        b=yAv0IOhq9abUWdZR6leuh+fj0yxegCWt2zmpH8leRDApxNbLvRmDVwmAyU7zXZ/0dE
         O1XMpTjX5E5vAGWBXlOOQGDSVjt2JD0IoLrgmyywNTmafa2S43P2HJSRe5+xVR48FRKY
         Q14kzKO+ddsy9Bb/+ccd86lf9vi/gjJMIlx/hxzb0xyZ2soJZk+8ROC7PcxbWoVxXI8D
         Drt5fEh1kbJDrcWcBYJjd4qoHVQBxWRYeHfrvrxpecVMlI7uO0mx22iQy7AMNyeoxkK7
         7aG7zXj61eTXGzn1wOGo1WTnjCRv4S44pF61/66kMQkMmfDHkQX9lKEE9GXAMsMEALUM
         TLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031926; x=1747636726;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJjA/FXfjTD2FQE71QWuHDCBdzjs/ZNL3lM7sCOkk4k=;
        b=qTfQWOlzxJvOig1kT8au8xtQ0hvgJbwHxfcIVmqOWLTBad2YV4d/VLi0T7shGZ3SZE
         xLWix+4pI6i/BxV4E7tFk1GVzRgdSsqvmmeTmqvmFmw+lynur0dNcfdOeeIw5O+ac7iL
         eMWAKnXIJXjOCWZLeaztWx+Wa8NPX6JaZrR0OYsVPOX8nvRFAn4TLRsrE8cUIN0y0M0r
         qlwndeqRA+z9tVXZaQUxvsNU3XxyH4oDqM8TWnYuliW9gvHi4lZeotklg1sdNKi5ywsF
         5aMdzWe8klVnYpmUeka1mvuoCWrZz1zgOEBmij7qoWljjlNCp1LVsetrN4EAiwrWhF21
         C+FQ==
X-Gm-Message-State: AOJu0YzMNfsi1yt0T6Z8aPtkzoKsVU2jksCKPG/8Cs/YSpbx74OvNQ4D
	IU/4HUFK5OtCefnd1XruiuMfkcbg4XlrlSq3oLTgfWYbvw2OQcoujyqUZ6t8iA4=
X-Gm-Gg: ASbGncvfk5rn/214pvbYK1Tx47nvnUzSsDM7w5wiJO1U/LclOdEOIqBsx3xvy1jQIZT
	PmPvGCdC+NhDpiPT/MJRnRXWjK0B7uUhra+JZ+aZXU5y4TO03QAYo3ORBR8MjQieBpAnO3wLZCi
	hoW6BsLKnCmhEWEyJ5B7i3/uPUoJZ2Ru5MbdctC5fpRq8DRggY++YlioKFwYI60y80Okvo2zMxs
	tyuV71Y8zJnzFOsAw8f8k5263KwHs1OKUSlxJ8gyZm1Fd0JFzH1xgFQnYo+dojbPIbmxz55Dess
	YQLDXOMbLr//j1+TEjGvnpBTffdv6vRNg74ht2z35Pg2PlbWviph0gf2Bg+Urac/WD3HuCg=
X-Google-Smtp-Source: AGHT+IHbNmFFgqP2TaNoo3r8XCJ2lXf2VHRvee7H9H7Ew0FqMOfSppy5wk3G+RtUy3MhkVtZA75gyQ==
X-Received: by 2002:a17:907:2894:b0:acb:7dde:d88f with SMTP id a640c23a62f3a-ad21975a11fmr359134666b.5.1747031925716;
        Sun, 11 May 2025 23:38:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219851314sm565951966b.161.2025.05.11.23.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:38:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250507-vt8500-timer-updates-v2-4-65e5d1b0855e@gmail.com>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
 <20250507-vt8500-timer-updates-v2-4-65e5d1b0855e@gmail.com>
Subject: Re: (subset) [PATCH v2 4/4] ARM: dts: vt8500: list all four timer
 interrupts
Message-Id: <174703192445.30990.13638059295757874601.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_233847_503456_22273AE3 
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


On Wed, 07 May 2025 10:58:33 +0400, Alexey Charkov wrote:
> VIA/WonderMedia SoC timer can generate up to four interrupts corresponding
> to four timer match registers (firing when the 32-bit freerunning clock
> source counter matches either of the match registers, respectively).
> 
> List all four interrupts in device trees.
> 
> This also enables the system event timer to use a match register other
> than 0, which can then in turn be used as a system watchdog (watchdog
> function is not available on other channels)
> 
> [...]

Applied, thanks!

[4/4] ARM: dts: vt8500: list all four timer interrupts
      https://git.kernel.org/krzk/linux-dt/c/e58afb3e1f365badd69aad6f0d53a2c66a63f689

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


