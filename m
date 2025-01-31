Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7099FC02190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 05:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NY/iR4Q4dA7A11sL48cZCdsqtQhG1vg/GEGlJsRArk=; b=SETWdN9bOu73edzPUi7kDmUo63
	qDJlTLSkFTHW12/5/O2UsD+oLFEBvPL6XZCU9D8j7KDX8IyghFlx3wleA0kZc34X4+h2ND+bW6j3j
	nf2qdBdUA4Vb3lCBzk+A6V0eW635DaJNHWZyCgkAtlvMFzhsFyXJCl1MTQ1xxdTwqmd9Cm6pZ7Cfx
	EankTf0AZhT6B4DWb2I2JtjiC7872wdo42G1HBBs/EBwjKgcVPs7Wt+FqrmsXnhxzXliT/doHO8Hb
	VggvokkrtSouLXSOHnGk+1WV9Doos24Qbj5jkdqzbwuscrNGZ+ktPoKLC/afk0XHsA3fPH6Saww52
	+G4mEKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdjsp-0000000A2BO-3DMu;
	Fri, 31 Jan 2025 05:48:03 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdjrW-0000000A2AG-1d1W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 05:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738302397;
	bh=8NY/iR4Q4dA7A11sL48cZCdsqtQhG1vg/GEGlJsRArk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=d8nrsWh49y1AOesxcW960F8AVA38BKdWEkB/i8k+fe6Z9ypS1Vg17JPicLxI4OfWm
	 GDORuenl603ne4ipO8FyZStgq/fgLGo8M2P7ukFbOv8wS9bC9QIm0oKZiijegxLYgk
	 YmsB+eRogTG88jJIWBkrM58dj4cs1AFPPWJ0CGNIpE2rtxKYQ8ARyjs0UR7OH4Ii2a
	 PvhcBYjlEp89Ytt+CLYjtAbEgnbwQV9dZoubpInu5ew1dJSvsWlHC+vYQpPY+3j3ND
	 Ex+As/hofMPN2rvxiA6sIFWy4IsNP7opKHv4fa4q5JWE0OefVhyEbyeCqypzTSQeDF
	 TpAnDFHNKNUig==
Received: from [127.0.1.1] (ppp118-210-186-162.adl-adc-lon-bras34.tpg.internode.on.net [118.210.186.162])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B75471747;
	Fri, 31 Jan 2025 13:46:36 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
In-Reply-To: <20250115103942.421429-1-joel@jms.id.au>
References: <20250115103942.421429-1-joel@jms.id.au>
Subject: Re: [PATCH] ARM: aspeed: Don't select SRAM
Message-Id: <173830239611.118418.17158541895628336713.b4-ty@codeconstruct.com.au>
Date: Fri, 31 Jan 2025 16:16:36 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_214642_632864_C14BC073 
X-CRM114-Status: UNSURE (   6.30  )
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

On Wed, 15 Jan 2025 21:09:40 +1030, Joel Stanley wrote:
> The ASPEED devices have SRAM, but don't require it for basic function
> (or any function; there's no known users of the driver).
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


