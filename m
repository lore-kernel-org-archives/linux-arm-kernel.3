Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAE8CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 22:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9okIbnnWMA5fCtNaXf3R/J2fcIUUcAk0NufM6vDgTSQ=; b=omhBZXI1Hsmg0BW0p8ao1EjPdL
	s87Xus4nK16uXsG0Igp0M4qxKfYZ9zQScCrm7Ua5WFiGD1pzlp4jGARdh9Nts8l/Lerjxek1PCCYr
	ZKGUvEqCE5miPcHhccH7KSoKUpApnmDCPHBtB1AQCMLIVhZAPOxfpC54UjYYPLQ5YR5BCn174Ftld
	x10NlY1Mi4nZCSpXr8WLzTtMhwNtL/JW8ZYMT1IheVqjTSjATf8yJI+SnwDj//oe20/S0ijos9WCA
	dto5UrUjOnoAsUcc09u3n2zvUqkGSzd1xoflt+VALMTTDERv7tiITnL962U0DVN+ivq1yDNt91iBq
	oqmZ6ttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8tp-0000000GKtB-2131;
	Thu, 06 Nov 2025 22:56:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8tm-0000000GKsZ-1tbz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 22:56:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 676CE1A190B;
	Thu,  6 Nov 2025 22:56:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C61E606EE;
	Thu,  6 Nov 2025 22:56:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98F6211850912;
	Thu,  6 Nov 2025 23:56:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762469767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9okIbnnWMA5fCtNaXf3R/J2fcIUUcAk0NufM6vDgTSQ=;
	b=Dj7GcqpmhnNmvdn6K1QHbb7+pFpotHX4MIc8+PJ+oyONcZ1zhYtigX8k6Cpx4UiQkixO4g
	vIuFHWvbvLkdqs0ZfLnjO+HImF918P2X6Y9U/2n1TN+s5acjpRHKBc0mu0uNOn7mu809RS
	ZpuHDVVmKRpklIQmlyVBS1+unkRwimukD97rBuuqv0Ce2S7Eo2nSZFa60qAl5/3U5Zl9XX
	XcDufbpCmyUfZeInheYvcVwtd+rf3Zz0JzD68K/x+A73n4zLsX7EPIMjxjP+/L/fcagLaF
	axYqyma8P8gkpCI3zCFmBtJOzqOtSCGThl1CneRDwrE/OnXqRfqzKscBLDtCNw==
Date: Thu, 6 Nov 2025 23:56:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shubhi Garg <shgarg@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH v7 0/4] Add NVIDIA VRS RTC support
Message-ID: <176246954836.40627.4534725186662447569.b4-ty@bootlin.com>
References: <20251007135738.487694-1-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007135738.487694-1-shgarg@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_145610_619787_71BCA287 
X-CRM114-Status: GOOD (  10.66  )
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

On Tue, 07 Oct 2025 13:57:34 +0000, Shubhi Garg wrote:
> This patch series adds support for NVIDIA's Voltage Regulator Specification
> (VRS) RTC device. It provides following features:
> - read/set system time
> - 32kHz clock support with backup battery input to retain system time
>   across boot
> - alarm functionality to wake system from suspend and shutdown state
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
      https://git.kernel.org/abelloni/c/4c03653f19ae
[3/4] rtc: nvvrs: add NVIDIA VRS RTC device driver
      https://git.kernel.org/abelloni/c/9d6d6b06933c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

