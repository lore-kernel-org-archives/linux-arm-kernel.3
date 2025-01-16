Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C4BC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etZxt/LGaHa3lFvXOIfdHtGrrH6brHAF8kmR9/9k3NE=; b=oex71OPFzWTTsoRC5CevSbc3vS
	HbOoD0JMKYHCC3xCwmiRIw4AU2/naQAB2xFAr3RzvvmlDJpCIBrGh9qKZLAtUiSaP0QcuCyIM8SF5
	nKCyxVafS7AowOv6Q2KwnmJpL47ubMsYbpiyDCMOeFkD+CG1GNtqNgIzNKae3BMv5Dnln2MEdfO9B
	9P6ApDiT3YZKHfXu+m/XCDuxLvV8jgV38hPwSdIzf1SMC5LhIodevq/oDiLMJJGxcZ50Ce5gTMPpx
	nztKYorR2yJ06VFaDMDBWQd5y9HGoqpaormIoLctd/2BWz8UAyPRbOVU1B0TBO9yUoE6EYZsuZxnT
	ofa/GNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZRJ-0000000GXn5-3hTE;
	Thu, 16 Jan 2025 23:38:17 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZEc-0000000GQX7-2XNV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:25:11 +0000
Message-ID: <70cf86ab-cabf-45fe-90e4-985ce09cc44a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737069903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etZxt/LGaHa3lFvXOIfdHtGrrH6brHAF8kmR9/9k3NE=;
	b=wqhW0WFxE2clqe+JZ5jTrHM/9+ehW4FGv8Q0JueOxiTk0aC243y/osY5LR1/0oJapCoPAm
	F/clJ0P11wJY1c18nc6W6I6VNZOX/4kZrFzdEXril21DzzGPMcwfH+vFP/vXcNL9B0jAbp
	icu1AzM/BAB5kUQyLxGdiwPcbrlzwM4=
Date: Thu, 16 Jan 2025 18:24:58 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] spi: zynqmp-gqspi: Split the bus and add GPIO support
To: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250116232118.2694169-1-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_152510_790863_F6772CAB 
X-CRM114-Status: UNSURE (   5.45  )
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

On 1/16/25 18:21, Sean Anderson wrote:
> As discussed in patches 1 and FIXME, this device really has two SPI

This should be "patches 1 and 5" (oops)

> busses. Split the existing "merged" bus in twain, and add support for
> GPIO chipselects.


