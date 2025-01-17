Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F82AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwpBCZYjZQUYzonRW4i4psjh5ZJtuC6Q4o9DAWvS0JY=; b=eN5jZzyvl+4nRE
	Nk6U2sN6A4oFyb6E73i4vBLCMVIHl0GcFhO2No6JbQflBrpbulIjqTkJ5/qHK/u2uVjiFIe2oco8P
	thJlgEicKGvebNuonzuJ8DTQr4RBJt3AvMoIUTWB+RuNOMgUZRM3xjq2FZdvCQrzbAZ6zjaFKBZRW
	qhOaJ3NaD25O+3DEMh6lqFPaYpM/Ft0fpWtOFh+5BGcddPNmJYMoFUys1W4msRhrLplmHPq0vpy7e
	KfyLHp2HDwHHugNNd1+vf3VCEy+qyjNfNNb2bSltFWKgSKYdcOyd4+I/PikkIOHmvUjvEDnMaeACi
	cC2MqxI147JqozVm8J5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpp7-00000000uH8-42N3;
	Fri, 17 Jan 2025 17:07:57 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpfh-00000000sVS-2xur
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:58:14 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 6368CA0391;
	Fri, 17 Jan 2025 17:58:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=SwpBCZYjZQUYzonRW4i4
	psjh5ZJtuC6Q4o9DAWvS0JY=; b=mCBvrnrT1iAwYU150vnasj7r3w66S3m3cr6t
	fJ+Ytn2EjzGkPsSxHHLYU0LGZAa2m9Dj2sLTwCKoNRbbv6Oqew2ww6kLt/haRG7C
	9Toq5FyUPHf4cAuE6jUwofuZYU070Uopabo4CVYyV2mIvBYWec1oaA+oPLAcPTVY
	wj8danFo6ag+fTxv6QMayMkdB8TC33czq4hSKbFWfZKijcpfeMCLXp6LIKwxOLT5
	j2dDdWM75BnQQX5FqlzAqDzC0b742WOfYp6Qn/HrTMwIQPTSUYd6iODbYmKuSlCg
	8MopwKCoIEbv+EW8oyjp6mRqB1LVvSiIlPR9Dc9NfhvA6wAMnxLe9kRy65W1ha+U
	xcIRhWbqmG2ACdj/x0cf+CnTUe5U8ka6yC+1l9VLZ03aAulUPXjEOZuWw7W9C1/i
	Fk3PYg/pNno7zzSH1soxs3Zh3G3Yjh9iSXUhT3IXW83krRnMX/AEPR1mL8aTaWhY
	gU0xF6SHPR2wSLbzZgMgOFlS+gLxvnosYYswZ8b+DfgvNz/f/tZFN/Jsg0t8t3L9
	RvrDCSDiQVjlpU21RvAbsCNIDoWQXyikjNHk3zcHevlAdzx9XeZEGHvGRPwUk31e
	KsNOLBmoXJT/x6xO4OKN/yyF3sPBmQzfyvgcV3P5tzl9F6+V6acIpXSbCfoA3olV
	elQ+TXE=
Message-ID: <43194819-3aea-4541-900d-381fb27ebcc9@prolan.hu>
Date: Fri, 17 Jan 2025 17:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] spi: atmel-quadspi: Use `devm_dma_request_chan()`
To: Mark Brown <broonie@kernel.org>
References: <20250115160244.1102881-1-csokas.bence@prolan.hu>
 <20250115160244.1102881-3-csokas.bence@prolan.hu>
 <c0bf43cf-895c-4a0e-b771-39481b6bc024@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <c0bf43cf-895c-4a0e-b771-39481b6bc024@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485264726B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_085813_898641_081810EB 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 2025. 01. 15. 20:58, Mark Brown wrote:
> On Wed, Jan 15, 2025 at 05:02:40PM +0100, Bence Csókás wrote:
>> Leave releasing of DMA channels up to the devm
>> facilities. This way we can eliminate the rest
>> of the "goto ladder".
> 
> You've not copied me on the rest of the series so I don't know what's
> going on with dependencies.  When sending a patch series it is important
> to ensure that all the various maintainers understand what the
> relationship between the patches as the expecation is that there will be
> interdependencies.  Either copy everyone on the whole series or at least
> copy them on the cover letter and explain what's going on.  If there are
> no strong interdependencies then it's generally simplest to just send
> the patches separately to avoid any possible confusion.

I did not originally create a cover letter, but now I made one, that 
should make it clearer, that this series is mainly about the 3rd and 4th 
patch, sent to you and the SPI list, and the former two only add the new 
APIs they use, to the respective subsystems.

Bence


