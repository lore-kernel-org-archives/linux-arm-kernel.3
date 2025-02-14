Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B62C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4UBbf/mkWEKM/VokbNzAourX7ml+PSD2WND+A2EMho=; b=VsOfvpuoFmZ7HqkfSRX+njMWam
	/fMogUQM/8hVxFfz0ZOrdMfA5WD9HpsAuzBh0YbmUrL9tHAW+advifHYeoxiiFk66CUggZh4veiuK
	xiJiOBeZ3NRvmo1HvwKCE0RufV9qTDsUG9BP64QEsq0xQvDrprnQlNnviRXHD8KsQyCUY2Qvi8mFB
	VTWNieY9N5VSSPYaW62ZyrszfI4PMHtVYlWKWksF1K4b8tKnri+6Js4dRlbUBJePvzeaEIg7wvhfJ
	joRYNtu9gGP18yeMPbBTTqPhXNMnAkMhaBuq5KJ4x54Qpt3816N5A+OHird8wSRxMBp5ORNUb/E1I
	0LleksbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiveG-0000000EzAv-1I6W;
	Fri, 14 Feb 2025 13:22:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tivHZ-0000000EuH1-1L0p;
	Fri, 14 Feb 2025 12:59:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42A765C4445;
	Fri, 14 Feb 2025 12:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADC0C4CED1;
	Fri, 14 Feb 2025 12:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739537940;
	bh=h6D49r1ItgNgeLQ5sQSietMLZJjMNj0FrXN962iqeCs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ATtEvCIaXYrfO3mZ0U1GWbogbs10zRN1Tz7ux38J7RX5bYAdD4G7UAH5Y+71LSRLO
	 QZAso7lAUoiVKCETlCh9ri2uHqrMGbEegOxUgrRrXF4r/1/st5qLWAdi/KmU1Q3ogj
	 H7ihrDOncuCVBQRjq/oslW02XAFdtoCATjo7EToDrBKyNCW/+eWbmJ3XeKPcqlRP8j
	 VKL6bWlCziTfFZ+8lHtV8rt4Njk9azohBJjJ2gSgXFmvIIq9g+CqYo8KXW0Ky0kPJe
	 FUm/Pv/ndT5TQwYOeIN2IHhmKHxJyrscOk9tjEaIZBdrw0D09wkQlQGU6v4lR0XF0o
	 n5Nycc0aEd8GQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241205-gs101-usb-phy-fix-v4-1-0278809fb810@linaro.org>
References: <20241205-gs101-usb-phy-fix-v4-1-0278809fb810@linaro.org>
Subject: Re: [PATCH v4] phy: exynos5-usbdrd: gs101: ensure power is gated
 to SS phy in phy_exit()
Message-Id: <173953793587.323038.14073970116035091802.b4-ty@kernel.org>
Date: Fri, 14 Feb 2025 18:28:55 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_045901_401998_FAEC8117 
X-CRM114-Status: UNSURE (   5.31  )
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


On Thu, 05 Dec 2024 10:22:00 +0000, André Draszik wrote:
> We currently don't gate the power to the SS phy in phy_exit().
> 
> Shuffle the code slightly to ensure the power is gated to the SS phy as
> well.
> 
> 

Applied, thanks!

[1/1] phy: exynos5-usbdrd: gs101: ensure power is gated to SS phy in phy_exit()
      commit: 8789b4296aa796f658a19cac7d27365012893de1

Best regards,
-- 
~Vinod



