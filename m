Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C2CD232F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a98W+72H+QrvZTa+W7QmD1B9sIhKMP4/j8pKEcILt+U=; b=M1OkHGWDezOpgdI88yRrT0kzAT
	8QcahjRQNOqhBebJ2dT4yFq69fnE1V0IgnHRC5shGYllAuu1XWBLyMWeKiOfHhBsUbM/lwlPHVCAc
	OeFJkhkRGqjg4UxDGcNa51f6rMT/8kBpNPEbNm1sFeUKciRKxiV/XN5u8BE/JYiEE13ZIvvs9cJs9
	R361jPWIbTl2VH/MqGpUkKYH8/KnVCVBNe+5gPZY5JbDxToO7LiiE8VOzvZyH/+vGAs5SdX5ghjOU
	cbSO39HUMP8buNkpa3qHd4is8Lxlc7pZrLlNK0ZVTDD9Dp5AaLS8PfLQrxgaZVf9bXMxT0GnK37gx
	ATJpb5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve81B-00000001vBr-25g1;
	Fri, 09 Jan 2026 08:38:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve818-00000001vAw-2c6U;
	Fri, 09 Jan 2026 08:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACC50443E2;
	Fri,  9 Jan 2026 08:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B998C2BCB0;
	Fri,  9 Jan 2026 08:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767947925;
	bh=a98W+72H+QrvZTa+W7QmD1B9sIhKMP4/j8pKEcILt+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AsCBqrk0vvLVhmih7qPc+AeKhH4Pu47oQfOdgYtmjO9go4kvStnPT8U3A8pvQHnNI
	 j/2kTuMLpbzENN+/r4sdyNRrbMSiLsPU71fe7eBoMNvAgrKGKZLhzrjeuwruQMKK74
	 wJ+PPJWdBrCml+yurM4+bZY6f7ptpb3sNGKBg7TAlvPCnZCfYLvW19QGbfJTO0W2YC
	 hnVk5mUB7BbOWQBXqdlnjBBzil5KyFGzn9Z/Op3ivQM9ivLZ5W2d66JSiFwFqDgwMT
	 ZqLE5NpDbCE/od6DnBMdYLvrcwA7gtQwDR96DDsVAghy/rf4TUUsZvH2HFWO2/rybu
	 KFcL9DzNhOKTA==
Date: Fri, 9 Jan 2026 09:38:38 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
	helgaas@kernel.org, heiko@sntech.de, mani@kernel.org,
	yue.wang@amlogic.com, pali@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 0/2] PCI: Configure Root Port MPS during host probing
Message-ID: <aWC-jkgIR7Q4scxn@ryzen>
References: <20251127170908.14850-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127170908.14850-1-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_003846_677757_29F7750E 
X-CRM114-Status: UNSURE (   6.89  )
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

On Fri, Nov 28, 2025 at 01:09:06AM +0800, Hans Zhang wrote:
> Current PCIe initialization exhibits a key optimization gap: Root Ports
> may operate with non-optimal Maximum Payload Size (MPS) settings. While
> downstream device configuration is handled during bus enumeration, Root
> Port MPS values inherited from firmware or hardware defaults often fail
> to utilize the full capabilities supported by controller hardware. This
> results in suboptimal data transfer efficiency throughout the PCIe
> hierarchy.

Hello PCI maintainers,

any chance for this series to be applied?


Kind regards,
Niklas

