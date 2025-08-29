Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E5CCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jnF/a//u5QMSX1R3SM0NmD0w3+owFPgMdNl2H9i9c8=; b=SzpclOQypdUGU6Sz65SB0tzqH6
	NzVQkUp8xxO641p/vrLOCHqfSLgXcqD7+P41Uzl2nd4m2kEyPFF5jbkWMa6m3HOc4npeMjx+SGXx8
	l+bP+3Lb9p9VIEIKTCQtcL79/glB0JahJwlK4wqHr3rzFSV2RPWiuM6k/Fq/YH7iHXWAuzgJXLNPF
	uJo/vD2M5Ii8/wONju/+yrYGRJ0uC6fMFYydS6IUVAGD16s64E7Q+VbNz19TGasYqwlWsI326tpxd
	+HJMKaOehDrT00l1gp5jCEJOp47SSrT5dRjLdGotqUeJOFDsG3MSGrTrjGUlYY37tPHoj26askYn7
	fDgrjGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryns-00000005kfo-0FFA;
	Fri, 29 Aug 2025 13:06:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwIW-00000005JZy-1a5T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:25:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 593591758;
	Fri, 29 Aug 2025 03:25:23 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 387663F694;
	Fri, 29 Aug 2025 03:25:30 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:25:27 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] regulator: scmi: Use int type to store negative error
 codes
Message-ID: <20250829-marvellous-iguana-of-weather-4ab064@sudeepholla>
References: <20250829101411.625214-1-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829101411.625214-1-rongqianfeng@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_032532_461543_37E22EED 
X-CRM114-Status: GOOD (  10.99  )
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

On Fri, Aug 29, 2025 at 06:14:11PM +0800, Qianfeng Rong wrote:
> Change the 'ret' variable from u32 to int to store negative error codes or
> zero returned by of_property_read_u32().
> 
> Storing the negative error codes in unsigned type, doesn't cause an issue
> at runtime but it's ugly as pants. Additionally, assigning negative error
> codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
> flag is enabled.
> 
> No effect on runtime.
>

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Mark,

Not sure if it is worth adding:

Fixes: 0fbeae70ee7c ("regulator: add SCMI driver")

Especially if value > 0 is not treated as error in some driver using
regulator APIs.

-- 
Regards,
Sudeep

