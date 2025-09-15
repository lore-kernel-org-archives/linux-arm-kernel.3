Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCFFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=An6YdXg4eGfx92XlIXue1bjQl0ZEwOBl14AV7os1DcY=; b=gMRIFh2pu0HLckWGamO8xI8uwQ
	Mwpk7CACZEpk3/0a0nOCMMkHXvsJXF/u1814/xGeGIaFdMBJdNabNCiowdVm3py2X0BxYwAfK5YDG
	Pob0Ycbtm1W7fa6aBV/YnbjRcZTGf1tQdXLoKAzR6H7RHHumNMfxWMbR1nDaAP2cbxvpFtiKp+XkI
	7vReHZZ0stYVnGqSN2jv09cHCd/7BYBtdAqFpC5orqKgindAl2AQkohNCRTX2fJ5+G1OLUtLiJYDj
	Khc16KLwavrpnG4AJod/iNiMB4Otg/vE5CCvafDJcisI2S3X2d9tZzdv+PAvyoZ9BIekKP8BohTE4
	G6J0HvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAo5-00000004qHy-3g8x;
	Mon, 15 Sep 2025 15:07:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAo5-00000004qHm-1AEV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 15:07:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B196160242;
	Mon, 15 Sep 2025 15:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D0DC4CEF1;
	Mon, 15 Sep 2025 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757948872;
	bh=E9O/m/wb8v3DqC+2hZK4UMJAS0IXQ7UazYZ1ZtSz/GU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YriVx8BkL92SCf1o3zVzYqSUmzRGjNQWh+8g6xKOM8qW+1F9nhjaGkHFQ7yqz0PpT
	 61Kli187nqXARGqCf2/cZb9d2COs7tXT4ZEQyQAd9m4tUbK/VPo7oejrPVc0dgKzqH
	 VC7OkLyQOuX/aeItsQu9R/rdMPOLOK8wiHsnIEcTPnZORPRT0IslCwW1QCWOvRX0SF
	 wurXxEuY44C83mgyqGPF9HaTrw+JUB9FBqcXfmODxkx0dLzE7UDs85I0lju2m/WEeT
	 oY9Oe7qH2fbpbGRhzSlS9SYrXMClAU38lrV3/M5OVVyV26LEk85D92lrfnveDwLasr
	 bWPzDV3NZyThA==
Message-ID: <523bd663-4c38-480e-a923-d53c923eea1a@kernel.org>
Date: Mon, 15 Sep 2025 17:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/25] irqchip/apple-aic: Add FW info retrieval support
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland
 <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Janne Grunau
 <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>
References: <20250915085702.519996-1-maz@kernel.org>
 <20250915085702.519996-7-maz@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250915085702.519996-7-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 15.09.25 10:56, Marc Zyngier wrote:
> Plug the new .get_info() callback into the Apple AIC driver,
> using some of the existing FIQ affinity handling infrastructure.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

Acked-by: Sven Peter <sven@kernel.org>



Best,


Sven



