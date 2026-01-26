Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF40C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 07:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVvTUI8UupyRmOf5K6skusIpJ5Jjph0bv9+GfAz6OEo=; b=ItxPsGXgWfmN6ZN1k4DIrtWPtX
	IPF1JERpYr3m6S6hZAksfN3nQOezOVvGXJ6CgAjfM/1AaW8czOHcRwma9vEjrSwrblcCQQSowAzZm
	VQU4DLmZ0uHfLDFtVG5/1+kRb53MeOkB3DCQF20kpXzd3MGegPUwNo2KIHlSJ3N4vjSyJb7MOgv+4
	xPuuU9nQTatOvF3tctNFWWja2EpHZQKQu9Ctm3/hHSqVPehj0hrqT1eAtxSOJv7Lrg1t7PMI2Nfvu
	D/YABFd8XV7cnfVwRPEXGdkl0tm5yWHA3WDwZFYzfADmPIklI6p0ThUTeHm5Ag//ffIliNkszjVVm
	bSRkO/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHRN-0000000C48W-14KO;
	Mon, 26 Jan 2026 07:55:17 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHRJ-0000000C488-36Og
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 07:55:15 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769414111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVvTUI8UupyRmOf5K6skusIpJ5Jjph0bv9+GfAz6OEo=;
	b=v/LGZA61bpBcvimui2KqicjS2uCApwE/YNjYWwXTi2HoYeybEuMufWwv3AUFBVfgTyp6KQ
	n//6V0OtWfqiBJNtLsn4sRtshNVr8WIg8uCX53UyTkW0sX7RZQkuAFt29fxSrqVjmKx4Sg
	u87IKESuZqSIIp6CFwAHmRjCIA8pa8Q=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH RESEND] stm class: Remove unnecessary local variable in
 stm_write
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <83v7goano1.fsf@black.igk.intel.com>
Date: Mon, 26 Jan 2026 08:55:02 +0100
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <6D495929-0881-4B38-BFD1-4C55135C7A7D@linux.dev>
References: <20260126004312.210402-2-thorsten.blum@linux.dev>
 <83v7goano1.fsf@black.igk.intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_235514_019778_E8020025 
X-CRM114-Status: UNSURE (   8.34  )
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

On 26. Jan 2026, at 07:33, Alexander Shishkin wrote:
> Thorsten Blum <thorsten.blum@linux.dev> writes:
> 
>> The local variable 'err' and the corresponding if check in stm_write()
>> are unnecessary. Remove them.
> 
> Nice catch! Is this a result of manual code inspection or were any tools
> used, an AI agent or a coccinelle script or whatnot?

Manual code inspection. I think I stumbled upon it when I was working on

https://lore.kernel.org/lkml/20250909102512.694203-2-thorsten.blum@linux.dev/
https://lore.kernel.org/lkml/20250909102512.694203-4-thorsten.blum@linux.dev/

which are also still pending. Could you take a look at all three patches
while you're at it?

Thanks,
Thorsten


