Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057E5D2CDE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 06:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1V2JrRZLy50lGfYI+U2x/HtZk+7BEyYsKaQ2kS/wkdc=; b=4g3vK6xoJcVQgsArWAUNhLBfSI
	EzwtNqtyPgMiWrPUuw5MERhQ7RKj9OSfhePGdY9r6BjoTl7qpqou/07HEDySoQs22844NDj0DY3ZY
	/HMN8kK6+FZfvvxKfef7exqGt451PStRhB8SRxG162mIPmCZ72KUeaZoWgFD/LORJRyHLeFPP4Ifa
	MaTEmJw4Qt3GIDR/S4/v/eQc5EspoFHhCY4Z/hPcLDI0M0cIRdXoGkVyHNeZyxMHMXQTfTATOljhb
	jpVthIH319VWFbw/ZPlIEVdag/HIOYB31VyVovy68GRkdBqnfh/C1ppEYZES+uyqhepD9745NtEZm
	r0MGuoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vROwg-000000094rJ-1kCH;
	Fri, 05 Dec 2025 06:05:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vROwe-000000094qi-0o3T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 06:05:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 355844340C;
	Fri,  5 Dec 2025 06:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79510C4CEF1;
	Fri,  5 Dec 2025 06:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764914730;
	bh=jab9snt46oPpyIlOxpmF0rFOtQv/+fyPPNBeaMr1cIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ysHn1/ZB7IVhRmNXcEX77XYvFL5Tth6pQYyODG62Q5P5fRGU2k91InSh4EOy8mEdV
	 7PUZC7RNjslG6UVWiVjCqX8Z2bxP1VlFpY4b0WS6IgRv5FA0mO/30lYJXSUPOdZf5e
	 Sv6mkHFeApBsVGUVcuET1rXH0PVAEh0AipEoKyNY=
Date: Fri, 5 Dec 2025 07:05:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Message-ID: <2025120553-suffrage-divisive-5890@gregkh>
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-controller-v9-2-9f158b18f979@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_220532_358762_61C4CF12 
X-CRM114-Status: UNSURE (   8.06  )
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

On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> +config USB_DWC3_GOOGLE
> +	tristate "Google Platform"
> +	depends on ARCH_GOOGLE || COMPILE_TEST

There is no ARCH_GOOGLE in the tree now, so how is this supposed to
work?  Shouldn't tools that check for "invalid config options" trigger
on this?

thanks,

greg k-h

