Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7734BE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXdk9iXBjbSglfglNMlCe1O5qHEJC/mlI8TGpLrLN0o=; b=JmyzS8CB22KLN3
	G0v64p7hj7I/T5UVAn0n3BPfdWK2r8J6ACXWBnTuCwiAZ6vYZy6vVsiPSZaS20SsuKWLyHHYiMKHz
	yMXTSQyYnlew8HsYTcdQv4CG/6Z6wNI8/0sfpcKZQ7uzojA8d9e1qDCMLjchyoJn5o0EiDVeBho9B
	heSL974kJc5rf4RChPRbSoIfdFAhHfnQO+uNa4mKoHTz4J+6KuGuUp9+MH0LPEJdLZNBHd2B7Lxjn
	mLIJjLTWW9BTIz/PSHQP9aFCIx5eCmSxR7XNuveo+ZtegGhMkourAbwAsIRyr2j3TFb4cYRMb4WBg
	LQWpl+GgOQPqcuK25W/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCYk-00000001Mq6-2AX3;
	Thu, 19 Dec 2024 09:11:06 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCXc-00000001MYF-265r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 09:09:58 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 36265A05FF;
	Thu, 19 Dec 2024 10:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=uXdk9iXBjbSglfglNMlC
	e1O5qHEJC/mlI8TGpLrLN0o=; b=jmQoZNUTN1K0TmOO9Vccf83zEYA1Ylaf0Zkk
	xSkEtKMlPmVnhVLCCfJCo47AhxrA3tjdD2f6RBfZ+iJV0vMpDvQBzdLkl6j4tgbT
	wA3vwh5Tq69Ays6SEs2zaqXhj3jir00nj7qNA2qZlygbRZUNuWFiUUPgJf9dsRpU
	sEIJf9uGe9urF7KqyDdW47cz3CLaP5cbZOB6to7k+mcrCE0QEOXCNIjWxpmtjHKY
	YPqhTwGiPIKPt6u/Rh4UGRO19qKCtoLttE1I69P4wGbGKWb9+0zEpNK57E0VsTAf
	2IxapyW18AeQam1NHt/IeT3nGwGK2I8GPA9mQ/hExnHCjJHV8UYvgB7DnQccx9fl
	dwhgXVSg2fTXPkMF0oW46M4MJdpR4tllW+NvCq5jeqWisDaeWN3AgIvkHwyb2nBf
	c9z4pIDntf7SO/Dxu90Af2YfIfu1eXmFO2P/nODpejUAvXzOF18aTv29DvTv6JJC
	niafqNOp/81D65EehWmjcb8eBZ1rR7oH27WkSgiR1dMH0RdAMxxboKTrdgfRP5wk
	pca7IeDSoooYd8jkKzWKqmJSfrsJ0T86cVEytXYNytEpROtez39GE84Oo5TejgIl
	ns4kZlITv1HYPzqbo0+4/m4L+9QpBxFvcWKgs3ZYfXJhsanstNvBzhn4YGYWoLWv
	TQ66iAA=
Message-ID: <72874aa6-22c7-40a6-83bb-1ace0f3aec73@prolan.hu>
Date: Thu, 19 Dec 2024 10:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: atmel-qspi: Memory barriers after memory-mapped I/O
To: Mark Brown <broonie@kernel.org>
References: <20241218165850.378909-1-csokas.bence@prolan.hu>
 <b1661e3f-cc62-489b-a4f8-9964ccf65fae@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <b1661e3f-cc62-489b-a4f8-9964ccf65fae@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948556D706B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_010957_001138_3ABBE8C0 
X-CRM114-Status: GOOD (  10.97  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Marco.Cardellini@microchip.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Mahesh.Abotula@microchip.com, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Piotr Bugalski <bugalski.piotr@gmail.com>, Hari.PrasathGE@microchip.com, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Right. I originally planned on splitting it into a cover letter and then 
the patch, but I guess everything can just go into the msg. Dropping the ---

Bence

On 2024. 12. 18. 18:01, Mark Brown wrote:
> On Wed, Dec 18, 2024 at 05:58:49PM +0100, Bence Csókás wrote:
> 
>> However, the current documentation makes no mention to
>> synchronization requirements in the other direction, i.e.
>> after the last data written via AHB, and before the first
>> register access on APB.
>>
>> ---
>>
>> Fixes: d5433def3153 ("mtd: spi-nor: atmel-quadspi: Add spi-mem support to atmel-quadspi")
>> Cc: Hari.PrasathGE@microchip.com
>> Cc: Mahesh.Abotula@microchip.com
>> Cc: Marco.Cardellini@microchip.com
>> Cc: <stable@vger.kernel.org> # c0a0203cf579: ("spi: atmel-quadspi: Create `atmel_qspi_ops`"...)
>> Cc: <stable@vger.kernel.org> # 6.x.y
>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
>> ---
> 
> Your signoffs and whatnot need to go before the --- so they don't get
> cut off by tools, any any ancilliary stuff should go after.


