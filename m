Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C078C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skNVEL3uLL+Qoz2PhuVY5Jf1niaOcRpZt0e/UVKPDZM=; b=pHol1pg7ey553ww2DG003yt7Qr
	SBdJCgtx6SCZOqYSwlWlnm0nsLNwWYlDNKY7kF+NbnDfavY60AsIqCi5risVH13k/3FhsLQp7Q+8Z
	xSCpJFB7HrbQokUykdyKZ9X6jTBgKVaYDbtaN8rwYpPTWV9iKbfw/YfaVKmc28+e/gNqOvuqmIXzV
	Yn6oai6Caq+QJzF4j0k6h6XYungCXZ/UBzgkf/cCeR6kjWDgfZeSgzBEC35P+QkfBPqvNjJqfUrd8
	KWjtFeSTIMAkrLOKCpRCOW/nZOeTSH0I9ymHzahlk3JHirYfFbqdez0VJEceL6Q+5FtyKr0+Go62N
	n6VfnneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglpA-0000000EMry-3q4P;
	Fri, 16 Jan 2026 15:33:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglp7-0000000EMrH-25pu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 15:33:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72A931515;
	Fri, 16 Jan 2026 07:33:09 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B7EF3F59E;
	Fri, 16 Jan 2026 07:33:15 -0800 (PST)
Date: Fri, 16 Jan 2026 15:33:13 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Felix Gu <gu_0233@qq.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
Message-ID: <aWpaOYy6M_wNiMJU@bogus>
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
 <9d44f5c6-9197-44ec-b7fe-50c2a686a751@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d44f5c6-9197-44ec-b7fe-50c2a686a751@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_073317_596426_AE1AB705 
X-CRM114-Status: UNSURE (   8.72  )
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

On Fri, Jan 16, 2026 at 02:36:58PM +0100, Markus Elfring wrote:
> …
> > In scpi_dev_domain_id, it does not release the reference.
> 
> See also once more:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc5#n94
> 

This is useless and looks like coming from the bot. Note to the author:
ignore this and no need to act on this.

-- 
Regards,
Sudeep

