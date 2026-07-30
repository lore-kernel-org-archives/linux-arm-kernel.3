Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7715FC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ef1P6L/nl5Yq+a1L+Mp1w6BvcG1ZQc74+9RfReR48E=; b=PkwPbzgQpfnB0tQP/20maiCBeD
	UcwJpUo8MO/8CNpW4HIwf7kEdmU+3+IMOvmaSixCS4/vqwRUdpuXgjMivVvwQK69VC2ugWeidTc8n
	2tf5lc2BEklczPy8aEh/AVg99OVFIiKQnZThEMU4x06z2/K9x8aEOTMK97MXVzLdm/PyqlQ5fjaBY
	moyh/9sla+IfmTeb8iTWwVAG/gFjuOBQmYrjf8cCK9IkmLRrt0X4pGDM4tc07AYsE797vVd+xAB2H
	LvU+lMsr3QofESqoGgL0/FnFJhFgmd3aSgfqHuGFQD7olhYbDk6C2gpHPlVqbbK54vF1ueVQNN0P5
	RHnxGYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPNa-0000000AOy1-44ta;
	Thu, 30 Jul 2026 11:56:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPNT-0000000AOwQ-2jdl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 11:56:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 809DB1A131C;
	Thu, 30 Jul 2026 11:56:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49C91602B8;
	Thu, 30 Jul 2026 11:56:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75E7E11C15B5B;
	Thu, 30 Jul 2026 13:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785412597; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=3Ef1P6L/nl5Yq+a1L+Mp1w6BvcG1ZQc74+9RfReR48E=;
	b=H2CSFJEi52MZg5AMBAodTlp78EUjV/3SknW0Ms+7byVOonCK8bf7xweA+PQORSRV8GGmBK
	RUKqidciS5RFhXI3OpGjuePLa9RJADedZR1prt+ACFje4A4QDjNHmflTzHafNgETAdjv5B
	3Ey95ueQ56UnP4+nDZkoIT2LhZ/huDWgUCV1gExpgIny3qLZ5LGaQnLYW6SxkMNtyJtAIU
	umzpe5kkdlyFNddvl944Y+lXFFaUPzbZnpngOCTe7Pgl/vjxaGevnyFmsESvCLzUCw+uvn
	8R5rwSvmTKOqBaTzA1mYVUDVv8noVgTFag+j2uy/6Genn+qd6HJ8eQL+xZgj1A==
Date: Thu, 30 Jul 2026 13:56:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Long Zhao <longzhao@ambarella.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"soc@lists.linux.dev" <soc@lists.linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH 00/10] Ambarella CV75 SoC minimal bring-up
Message-ID: <20260730115630b8f9bcaf@mail.local>
References: <20260730104330.81367-1-longzhao@ambarella.com>
 <0fce6943-0d4b-4f3f-ae5f-277633577774@kernel.org>
 <DS0PR19MB792519CDB8D28B0672713A05DAC92@DS0PR19MB7925.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR19MB792519CDB8D28B0672713A05DAC92@DS0PR19MB7925.namprd19.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_045643_837542_3E19B807 
X-CRM114-Status: GOOD (  22.15  )
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

On 30/07/2026 11:05:01+0000, Long Zhao wrote:
> Hi Krzysztof,
> 
> Thank you for the feedback.
> 
> Regarding the footer: I did not see that disclaimer when I sent a
> test copy to myself. It looks like our mail system automatically
> appends it only on messages going outside the company. That was
> unintentional on my side, and I will check with our IT and find a way 
> to send v2 without that corporate disclaimer.
> 
> I will also switch to SoC-specific compatibles and re-read the writing
> bindings documentation and DTS coding guidelines before posting v2.
> 
> I will wait a bit for further comments on the rest of the series and
> address them together in v2.
> 

Note that tabs were converted to spaces in your submissions.


> Thanks,
> Long Zhao
> 
> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org> 
> Sent: Thursday, July 30, 2026 18:48
> To: Long Zhao <longzhao@ambarella.com>; Arnd Bergmann <arnd@arndb.de>; Alexandre Belloni <alexandre.belloni@bootlin.com>; linux-arm-kernel@lists.infradead.org; soc@lists.linux.dev
> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; devicetree@vger.kernel.org; Michael Turquette <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; linux-clk@vger.kernel.org; Linus Walleij <linusw@kernel.org>; linux-gpio@vger.kernel.org; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jiri Slaby <jirislaby@kernel.org>; linux-serial@vger.kernel.org; Catalin Marinas <catalin.marinas@arm.com>; Will Deacon <will@kernel.org>; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH 00/10] Ambarella CV75 SoC minimal bring-up
> 
> On 30/07/2026 12:43, Long Zhao wrote:
> > 
> > NOTE: This email (including attachments) contain Ambarella Proprietary and/or Confidential Information and is intended solely for the use of the individual(s) to whom it is addressed. Any unauthorized review, use, disclosure, distribute, copy, or print is prohibited. If you are not an intended recipient, please contact the sender by reply email and destroy all copies of the original message. Thank you.
> 
> Maybe I am the intended recipient of your message, maybe not. I don't want to have any legal questions regarding upstream, public collaboration, thus probably I should just remove your messages.
> 
> Please talk with your IT that such disclaimers in open-source are not desired (and maybe even harmful).
> If you do not understand why, please also see:
> https://urldefense.com/v3/__https://www.youtube.com/live/fMeH7wqOwXA?si=GY7igfbda6vnjXlJ&t=835__;!!PeEy7nZLVv0!mZI0csEB1zKe7UGEUdAjbQT7R3g7c3LEYitq4DVi3F_PXjl08eazP5ctMgouCBoz1x_bdQ3kJdmIWGo$ 
> 
> If you need to go around company SMTP server, then consider using b4
> web-relay: https://urldefense.com/v3/__https://b4.docs.kernel.org/en/latest/contributor/send.html__;!!PeEy7nZLVv0!mZI0csEB1zKe7UGEUdAjbQT7R3g7c3LEYitq4DVi3F_PXjl08eazP5ctMgouCBoz1x_bdQ3kYN0VDlM$ 
> 
> Please be informed that by responding to this email you agree that all communications from you and/or your company is made public. In other words, all messages originating from you and/or your company will be made public.
> 
> Best regards,
> Krzysztof
> 
> ######################################################################
> This EXTERNAL email has been scanned by Proofpoint Email Protect service.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

