Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D99C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jDaRtUMpq8g1D3hT8OlSV4lyB+CYZjnq+H5npk/3eI=; b=Jr3ySCi3YdVYaK9L2He4zYJwku
	Y/ts7BKCrMpyBNhkXQkOI+dLAeqpnmQiRZEeOv1/+MCQjNbW70UAqtb2JG/NTaVRBHIH+W5zwr4/4
	hFTTTGWdL1owLbffCGetKOU9CaMVRNFm672jMPxF1/VEt2Bsgu3kGUFZxx57dya3IsxGtrxzTSY/T
	KM3QupzJsNKQFNtcMijE/bZKYgedTVd/N/hCiui65wlTc7ltfNDEaJzFpwTVgH2Iz+OEpF6mS3ddU
	8fXLmts1SgQFur6R4XFvTARRKjC6h04FgpkvfiknWy9r6Xfi9yaZLx0k0EZbgHTqQ9WqUvh9lfn4v
	s+bRSVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnQr-0000000DF3Q-2zoo;
	Mon, 06 Jul 2026 17:48:37 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnQp-0000000DF2F-0rzr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:48:36 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gvBfj46F2z9t7h;
	Mon,  6 Jul 2026 19:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783360109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jDaRtUMpq8g1D3hT8OlSV4lyB+CYZjnq+H5npk/3eI=;
	b=xD7HUIFRn6NMjBZsXGtVyPlCDmZNKasa/C9msk50NPO4X4l7LU7rQU4MPcqv3N9g+LB3x2
	eYAryU0gh6H3NgPtEftBa6qZagMkA6RCl/RDfUm7kQr/R8aIZReLuRw2vnc4Xgpx8F4U+6
	jzDEjR+SVW879/WNxtuBIrLHXb/ydXNpUrIWWn1Ot2dOdFN5nYWzFkIS85vd3GRr1SmoEW
	ap3zCqqf3mbwQEniT44tV0PX+kIT1GQalIC46P+kI8P0WO1lLWTP197tUApdn8POJcPH98
	f0UdFlPsdcx8PD57KCpRl+6NdG7NcGSabvp7ao5W2kPqB4aeDC7z2LGJzItjfA==
Message-ID: <8a921ce9-e339-445a-af05-d20f9f2df01e@mailbox.org>
Date: Mon, 6 Jul 2026 19:48:24 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/5] PCI: dwc: Determine whether iMSI is used before
 calling .init
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
 <20260701203918.63189-2-marek.vasut+renesas@mailbox.org>
 <4qyn4fljtb3cbzcmfpkdomkm7vqnwn2rfbtqng4iwmtvfd4bpj@t6kkw53erl7f>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <4qyn4fljtb3cbzcmfpkdomkm7vqnwn2rfbtqng4iwmtvfd4bpj@t6kkw53erl7f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8koqiwhmrec16pchxx9cd39q3zdejbz7
X-MBO-RS-ID: 805b02712b98a9c1cea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_104835_398340_3A5C7333 
X-CRM114-Status: GOOD (  10.75  )
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

On 7/6/26 6:43 PM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 10:37:44PM +0200, Marek Vasut wrote:
>> The R-Car Gen4 PCIe controller integration configures MSI registers
>> in the controller driver .init callback, because those registers
>> have to be configured while PERST signal is asserted, and the PERST
>> signal is asserted across the controller driver .init callback.
>>
>> The registers have to be configured differently in case the iMSI is
>> or is not used. Assign pp->use_imsi_rx before the controller driver
>> .init callback is called, so the controller driver .init callback
>> implementation can use the pp->use_imsi_rx value.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> LGTM!
Thank you. Can I get AB/RB before sending V4 ?

