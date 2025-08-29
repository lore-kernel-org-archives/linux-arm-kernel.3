Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B94CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 01:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qf02vbgaxxrFuNveYOh0UIy1iH0+faL0CHHS+a9tVHM=; b=Ysz2unFUEYIF9cKVkAjU1+cw0f
	vaZCW7rNHFaD/tHjrt6DaxhvIKt6drnSqGyhpnY7rCVNafvhMNfn6yLEi5ueQ5XceE3pBvDwgzdyL
	k0D4d/+6wWtigleeISECbLEIHbBhklirkIlUnQ8FUIcjNqGUerOQ/oPPwF4AZL1vdU8zs3ZGrnzwK
	44SdBUgICaoXxnUelYQAgGM5S9Sbjnb2A4cNyowMOvj6aMma9vGktgoFWYEaGRIw+7WugDHColLgK
	0bL6Kf70E1op+Tk8U5Y+I9c3UiSQe+kliIQ9mj4JhC1BNU7pgaYePjJW0q4uuwk02A5pLX/UgPBhs
	IzO0Sbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usAnB-00000007Isq-3SHM;
	Sat, 30 Aug 2025 01:54:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3PR-00000006b4r-2aTQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 18:01:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6B1E601B7;
	Fri, 29 Aug 2025 18:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD6BC4CEF0;
	Fri, 29 Aug 2025 18:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756490468;
	bh=/UuJhuIUrV4aqujvs/BtKUKwpbhTcdWwtWwkXRQk0yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVbRMIWWuYPIxA3N0EY/bzeBYgTLaZB5v4vF9wMKcxl1GIc+zYt0Y2PX3AikSLXkx
	 OdzOx3in/PFQ1ZYJIK1zulYhUoT4njtMNNlMMv5M9+wE0/zjU6wMToXfFbvPkSnEl2
	 RFhaKiIAo2kykUSJV8GJSP7A0vs8GmCxVoyfMr29JM8+Hod9ge9Y+u2K21VuTa/E0X
	 Znx7Q+1C9R3VetOwq+o4Q1BVdUxc4jo8mpM9uMiMXfcggaV4eSnPcsF/991Bg0zjQu
	 p6gIAdY2v0rA2q/1AKhkmZKN/agfpV4qrhlI0UAHemVK6Izk7hUXdfFLasbdkXxToS
	 OEGDGSM68rO0Q==
Date: Fri, 29 Aug 2025 13:01:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Al Cooper <alcooperx@gmail.com>, svarbanov@suse.de,
	florian.fainelli@broadcom.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Will Deacon <will@kernel.org>, linus.walleij@linaro.org,
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>, mbrugger@suse.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	devicetree@vger.kernel.org, krzk+dt@kernel.org, wahrenst@gmx.net,
	conor+dt@kernel.org, linux-serial@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>, iivanov@suse.de,
	Jiri Slaby <jirislaby@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: mmc: Add support for capabilities to
 Broadcom SDHCI controller
Message-ID: <175649046165.1080149.6916098730897099191.robh@kernel.org>
References: <cover.1756386531.git.andrea.porta@suse.com>
 <181cc905566f2d9b2e5076295cd285230f81ed07.1756386531.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <181cc905566f2d9b2e5076295cd285230f81ed07.1756386531.git.andrea.porta@suse.com>
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


On Thu, 28 Aug 2025 15:17:10 +0200, Andrea della Porta wrote:
> The Broadcom BRCMSTB SDHCI Controller device supports Common
> properties in terms of Capabilities.
> 
> Reference sdhci-common schema instead of mmc-controller in order
> for capabilities to be specified in DT nodes avoiding warnings
> from the DT compiler.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


