Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D05FED2FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1uHovn6Yup6c3SyQUieodwk4UlRm93zEwCbjt4JOGM=; b=fx6J2PIidoevoLHo5WlSKh6E6u
	gLzf9gzQjJptCPx6vL7boCe7uzsHRRqNS4YY4K1SmvirvIVfc7sJTRwLhdjM6H2BBJJSNXtGbsj2c
	DkZVOrccR/BJIGOqcJ2sbZMyao4XuGbJcg1WCmWbUf8MmGmhEVX8pml6p09GWweHJy9hJAIHpvrKP
	rFzfYDYgkIfnmc6N35PMl5mdFktmlMowbQ4uOeCmPKtkyqpxOUi+EcItZ45+Y1pMwaFKuBIqJIGsD
	EcmEZSe+LXbPvmpi5ZkHLObVJWLh+YcI4OQSYAWaYGxIKO2QFvJ4AEWLxOmz8dM9Qga9FtK6h7CoM
	i2oHUJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0daF-0000000DtNg-0qOC;
	Thu, 12 Mar 2026 10:48:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0daC-0000000DtNP-0Ym9;
	Thu, 12 Mar 2026 10:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=h1uHovn6Yup6c3SyQUieodwk4UlRm93zEwCbjt4JOGM=; b=KOZaB6VPojpyXbSwMlxld0miNm
	7g16fLh0k658rRfHRByxz/cYK+Czak0HvB0cjq1Unamdkddq9Jy0OXiIBQH1YliCbtT/owrnof8d7
	CKa5UkVy2W9R8ONXG1rKZQPQnmX6KvONtr+knwQdowiMI8outbs9Gemi2mG+NIBCt372NLD/8s1cP
	adTR2PRPPSaA3Y+qmus4a3zymTg4jxIG2k4wgW9CSuCOGAeFW+ozCrGtj+8VosmxDPwcyPL4XvOPl
	jyOpHjfkPsFXvSJKeas08oUU6/8+Xc10zfpixFPMJ2oks5lEol6rozarrh9NN6Qa/UphXJI+HvkjZ
	moD80Tiw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0da9-0000000BCaI-1IQ4;
	Thu, 12 Mar 2026 10:47:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E5435C415A7;
	Thu, 12 Mar 2026 10:47:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FF315FDEB;
	Thu, 12 Mar 2026 10:47:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11EC610369C88;
	Thu, 12 Mar 2026 11:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773312457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=h1uHovn6Yup6c3SyQUieodwk4UlRm93zEwCbjt4JOGM=;
	b=JaEHHHnqNbNmuD8Ch3LK6QaSJ74j0vNJCsrjA+LWq/5L84WfkVe1vDxAxQd+IxrJfZCa1a
	hT3qgXKMi0iGpoktI5bUvrNGNbafIDHPdCkcQys8BES2om5Es4IjiDSF/O0NYiWFZrs30b
	DK4n3LOBf79X8IKhHUEh9IB9rQMgmLhLlhR4iOAT0CWpesvwWDc4XGF7RkeJGsv6bna/9H
	h9sYoyn5cTcxoftMpAGK8iDeO31EkiuaiefYWnVbyAWxFLVIigg42FUZ8oO0FunKdNZIAR
	Ty/zLOLgE1raczyrfSphyi7ytsCEAGr/zaIPQg9Wg+rbyi3Ut/2oFnlepKEmww==
Message-ID: <a157ebaf-c8bc-4123-a7fa-e38beac8f268@bootlin.com>
Date: Thu, 12 Mar 2026 11:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mtd: rawnand: sunxi: make the code mode
 self-explanatory
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>,
 Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
 <20260305100137.2558423-6-richard.genoud@bootlin.com>
 <874impne0n.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <874impne0n.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_104757_397094_E12C555F 
X-CRM114-Status: UNSURE (   8.94  )
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

Le 09/03/2026 à 17:50, Miquel Raynal a écrit :
> On 05/03/2026 at 11:01:36 +01, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
> In the title: s/mode/more/?
> 
>> In sunxi_nfc_hw_ecc_{read,write}_chunk(), the ECC step was force to 0,
> 
> forced!

Will fix that.

Thanks!

> 
>> the reason is not trivial to get when reading the code.
>>
>> The explanation is that, from the NAND flash controller perspective, we
>> are indeed at step 0 for user data length and ECC errors.
>>
>> Just add a const value with an explanation to clarify things.
>>
> 
> 


