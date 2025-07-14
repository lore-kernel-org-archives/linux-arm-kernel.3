Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A07DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tvj3gb3g5xG1uLM/RcM8g7BKLGsZeoiyqFNvZ44VmfY=; b=O6t+mKq7Y9+EmSzFCKWXZevpAi
	IL1zOBZbL2J+DXGb/rV4404gCvybowK/yAkDafhxmOh/XAjmpP7o+k9SA4FqhEy4kqb5oXnLm+IL8
	Pd1XE1KSUblxV1hSRm4ec+xXx7579KcZWZwEltVz6y1VgbLrrdksAAMpd8+xdZOQR6hIolcDPoY2P
	zaAQdHNwn+uvXL4PxC81V5O0Rq1NkmRG4+cnQv2bejC/QZzi7oXzLQ09ht+zfLNjHdLuSfuQjSKMx
	j+Q0l2VyNakgF2PzaCzEmByCCBcQ0LlqxVzEWzYys9/cnEu7DUcfQEAxjxL2gJBVMcQUowngbSbQu
	tdP5LWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDgv-00000001U2b-2wp8;
	Mon, 14 Jul 2025 07:33:37 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDIc-00000001Qdj-0Xw1;
	Mon, 14 Jul 2025 07:08:31 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553d771435fso3469543e87.3;
        Mon, 14 Jul 2025 00:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752476908; x=1753081708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tvj3gb3g5xG1uLM/RcM8g7BKLGsZeoiyqFNvZ44VmfY=;
        b=qOXm+mQT+KL483L8KALVx+mdpw8ZyEhOd6x4yI5K8EXmvE3bMiIw/fpqv73iKQeft2
         +VCVNsyEJk6vhzbIL9RWr+HnhQKCLAXQogmjrKhUrGYMvU1d7tk3TZT1Gb7rnuFgVsiC
         zRnZUkl3lQOrVPeLXRYy3SufcWx51v56rizKNzJI8PNIP5olj1cKSKqXon7pYk0oi0lw
         q4P0P2J1yJQq3ofKmBq9FL4EEh4wBmHj+Z08qos5k4887axxV4wytjmcL8v4oFlWqOGo
         0z4ZplTl6Yd4q8kP9fNj8pmKWuF6ekYbUOx94Bq6XffjWIY62ii2W8suIOyKbjW1Xcex
         6tSg==
X-Forwarded-Encrypted: i=1; AJvYcCUJls37t7UxzQfhRrpe6qhtoViGMnnc3vm90w3U5mysGuIq/4HTmHji5Rl2OuAc0S56JmoqFvxro2GeT4ipC7YZ@lists.infradead.org, AJvYcCVbIVaxVVcMYe0gpPy0euEfQCwdzW9HWeO/XpSko8MEkzD/ac7JMxUoliUiqgvYiDF03g136ftkzuAwALQVw2c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzR3DfdObKctK2xuAbUdmpnH9qh/a31OFIGrwXit3X145VIYQvw
	NM8+1lyDyk3LJzQyLpIlsw+jlBpv82Eq43vvZod+FS0hy6Kb7dbEYXcb
X-Gm-Gg: ASbGnctXR5QN7gtg8RZPMUKyCkHoG4JJllBaFVMXBflVqdu8G1yD6t/UVphXnHCEfuA
	qgANrKGmVQe1Z4k3tUB5u5cKkcsbxB/SsjyU5iDR0CCUX/HsTv3yUKpSNOX4rvGxgva36p4t094
	YTGDtw9Stp5Vsk0SThuV9++LqDrEd/jnDWd04p8SIb0cxFofU1zStaIEc42OXJSzv4Zg/rJMaKP
	0ofq19fx7ukjL7IOTL4LF0Kw5RUK7nDr8PXkXHoX64RK7SNndWq6fPFbAVfF+yb11z+KRbLHnug
	8h5M9/Xxbw3NoXhPYwPsTogvGjqBi2/etx6FWal+IKr8C+SpGtKWXeTtytk33GZl5MktnkV/peM
	LWJhNF9fi5h/yYlOO3CYZ19ZQYo7DwPIklY/Pk4mYfptJ4hJY630=
X-Google-Smtp-Source: AGHT+IHZExcglefkFbZyxQyZmTQW7ESvjfFFcOrkVbfQH5yCY2A1BKdqYldJd9CQjXY0nM8bm5Zx/Q==
X-Received: by 2002:ac2:4f05:0:b0:553:2e4a:bb58 with SMTP id 2adb3069b0e04-55a057c3822mr3294856e87.9.1752476907492;
        Mon, 14 Jul 2025 00:08:27 -0700 (PDT)
Received: from flawful.org (c-85-226-250-50.bbcust.telenor.se. [85.226.250.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b8c5ccsm1838327e87.258.2025.07.14.00.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
	t=1752476905; bh=pT3B4LvfDX/MI3J6lEc9pWSE+5SEOgad6IB0H01Ds/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAzUu6mTAghiqz+sb/0NN+t3i5vbtH2Gm0D/k79j8IW1KdAXdxYqI+TyyNvO+m+pR
	 j++AqOsMDVLapns9fbPJiEwAc2serysN51fUe8tpkJZIZy9wdzXjyUNGHnmK480yHa
	 vYQWoBPspdSwe8tejxapHU8TtFlYMxZaUKsgcIBw=
Received: by flawful.org (Postfix, from userid 1001)
	id 4F1AE2C0F; Mon, 14 Jul 2025 09:08:25 +0200 (CEST)
Date: Mon, 14 Jul 2025 09:08:25 +0200
From: Niklas Cassel <nks@flawful.org>
To: David Bremner <david@tethera.net>
Cc: wilfred.opensource@gmail.com, alistair@alistair23.me,
	bhelgaas@google.com, cassel@kernel.org, dlemoal@kernel.org,
	heiko@sntech.de, kw@linux.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org, lpieralisi@kernel.org,
	mani@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
	wilfred.mallawa@wdc.com, Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Add support for slot reset on link
 down event
Message-ID: <aHSs6ZF8rQIqEOyR@flawful.org>
References: <20250509-b4-pci_dwc_reset_support-v3-1-37e96b4692e7@wdc.com>
 <87cya6wdhc.fsf@tethera.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cya6wdhc.fsf@tethera.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_000830_472025_0B16C49C 
X-CRM114-Status: GOOD (  15.32  )
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

Hello David,

On Fri, Jul 11, 2025 at 07:48:31PM -0300, David Bremner wrote:
> 
> What is the current status of this patch (and the pre-requisites) with
> respect to mainline linux?
> 
> I'm wondering if it might be relevent to the problems [1] I've been
> having with rk3588 resume, but it isn't clear to me what I need to apply
> to e.g. v6.16~rc1 to test it.

This is the prerequisite series:
https://lore.kernel.org/linux-pci/20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org/

However, Bjorn gave some comments on it, and Manivannan has said that he
will send a new version.



That said, if you have problems with suspend/resume, perhaps you want to
try this patch instead:
https://lore.kernel.org/linux-pci/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/

I don't know if Shawn intends to send a new version or not.


Kind regards,
Niklas

