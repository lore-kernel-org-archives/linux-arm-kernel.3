Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C502BCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3MghWZoXYKGWm5kT0/fJsmO1EHuFwRnZNciIkUYSwE=; b=TVDX6OK4cm0w+2tkIEPupY17r4
	NPekmnhUf5a1TQoVpAG568kRfdVfDjsQj/2ONgZhDrWjX7Rq2sen3+DEnN3jtdgZ30m2BJup0JxPJ
	4x0XLf1Do9qc6H6J3LoyqYKzkpHja9aUlxKkHMUdEic++MEdMIHNlCd1rKkt5WaYSnQ1Y+EOpBO7X
	rAxFFU5k8DBfLvC9BqzjCWzVLaxlRLvve9r5VUEWrjXHbFBLlc7hgyWLhT4CZuRoOe/JDrd/8SwZs
	jC/FejvWtvmxguKw8tPq/I4BCWfKrLMlsgnB56jxg2vzIvq2V/iU51SvrGWDCc5Kmpipb9txrMob9
	PDOJxsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9pr-00000007EBJ-2leb;
	Sat, 30 Aug 2025 00:52:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9G2-000000074Cv-2ejA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 00:15:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B04CF60142;
	Sat, 30 Aug 2025 00:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69F4C4CEF0;
	Sat, 30 Aug 2025 00:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756512949;
	bh=HNjsx0i8x73tfae/eOHpgGMql3FZ9c4OcgiZIKPT95A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iZcIlotZnZmYfFdJ1Oc7Aza4lrGYWrNZzw/6UYGujc8KDIerJaO5eBS6aelA9SVTs
	 F1Qd0OE53bMMH8UD7Zo+6xBzYE51rblRUFPngwx7Tx2ttc6T0E6BxmAlywblHOGk5P
	 DFp3ugjyLE3dB6YoEs1jItpKh9Dkop1IZW3FzveZ15VAag0BKj5hsrogEjPZHHH6xF
	 reqOMqsi76TkbVCuJ7JiBbZQhYUDls+OE7hDTaVfoL9FhUC5q6N8P7/Vzd3LZCF/AZ
	 +kNp/ihIF/4CyQ2y2AfRmC18FgtNmpJ6NOePp9MR9ZIfDcrbqflq5ol6hB9696od81
	 4fG97Zov1H3zw==
Date: Fri, 29 Aug 2025 17:15:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/2] drivers: net: stmmac: handle start time
 set in the past for flexible PPS
Message-ID: <20250829171548.68d7addd@kernel.org>
In-Reply-To: <57196414-5ab5-41b7-b2e3-ff6831589811@foss.st.com>
References: <20250827-relative_flex_pps-v3-0-673e77978ba2@foss.st.com>
	<20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
	<20250827193105.47aaa17b@kernel.org>
	<57196414-5ab5-41b7-b2e3-ff6831589811@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 29 Aug 2025 12:51:40 +0200 Gatien CHEVALLIER wrote:
> On 8/28/25 04:31, Jakub Kicinski wrote:
> > On Wed, 27 Aug 2025 13:04:58 +0200 Gatien Chevallier wrote:  
> >> +		curr_time = ns_to_timespec64(ns);
> >> +		if (target_ns < ns + PTP_SAFE_TIME_OFFSET_NS) {
> >> +			cfg->start = timespec64_add_safe(cfg->start, curr_time);  
> > 
> > Is there a strong reason to use timespec64_add_safe()?
> > It's not exported to modules:
> > ERROR: modpost: "timespec64_add_safe" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!  
> 
> Hello Jakub,
> 
> you're absolutely right. I don't know how I did not encounter the build
> error while performing some tests, that I'm getting now as well.
> 
> The handling of overflows is already done in that function. Either
> I can make a patch to export the symbol or handle the computation in the
> driver. What do you think is best?

The odds of me being right about time related code are only slightly
better than 50/50, and I don't know what "flexible PPS" is :)
But in principle, if the reason you need to check for overflow is valid
-- add the export. The time maintainers will tell us if they don't
want it.

