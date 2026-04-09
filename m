Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724B5E98FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5j/TI2O1rcb0qeld7rzH6RIr1gR8NaCoajZ7VtV8KY=; b=xNbjOstOv2x59ghMvA6GU/+tQA
	1iTHt+RirkfXQwIkHtx7vLEhPQRrBFrzQV+6XDVvXacz8v4zQlMExqWotxXWb50NeAosGF2+JQxki
	qImCqOO+qlNtV3ATCzekmZk6cZrbavShzLaz1HJVecrdhBtc8y5Dd5OR146fQ2rQnEQYWEsPKiPNR
	0n9+Adeci9lAVFGWZnQBEj/DdVBhRWYYgmFBj6jklUKzhsAGGARyqjhlhdNsNtH0VTsZAvoohMEAF
	pE4ghhGCSGfcLPYrru1fXpq+/ki3LU8ICDEIXsaSYILrZJgD2+495itbzMXJ7/x+Dil/iYYjvSSOw
	w+wAm8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAsEF-0000000Avep-0llO;
	Thu, 09 Apr 2026 16:27:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAsEB-0000000AveR-49MJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 16:27:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0A96452F;
	Thu,  9 Apr 2026 09:27:28 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42F9B3F641;
	Thu,  9 Apr 2026 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775752054; bh=PcwHOgTB9v53Jq+fpgtd844vKQY3L9N5xVo3GA34vtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhMdL4zsviRSrkAvCluaZ4CN2guSJEMEzeGl6ns2I7u4o1Q62MLRtOtH+Yp+cWRgc
	 Ov36T71k3Ojdcg664ExrE1EzqdCvlZ/8SrzMYQMqiKzTE3fQgTcfbaJZEjLM0ovUEA
	 kpp/r1COurflGLA/F17bNg6OHddGlMD7jDmQ2F7U=
Date: Thu, 9 Apr 2026 17:27:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>,
	Will Deacon <will@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Thomas Huth <thuth@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lance Yang <lance.yang@linux.dev>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mte: Skip TFSR_EL1 checks and barriers in
 synchronous tag check mode
Message-ID: <adfTco5h9P3kV9QT@arm.com>
References: <20260311175054.3889093-1-usama.anjum@arm.com>
 <c347fdc9-90b4-43ac-8c2e-559248777ba8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c347fdc9-90b4-43ac-8c2e-559248777ba8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_092736_173626_2BF613B7 
X-CRM114-Status: GOOD (  11.89  )
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

On Wed, Mar 25, 2026 at 12:46:40PM +0100, David Hildenbrand wrote:
> On 3/11/26 18:50, Muhammad Usama Anjum wrote:
> > In MTE synchronous mode, tag check faults are reported as immediate
> > Data Abort exceptions. The TFSR_EL1.TF1 bit is never set, since faults
> > never go through the asynchronous path. Therefore, reading TFSR_EL1
> > and executing data and instruction barriers on kernel entry, exit,
> > context switch, and suspend is unnecessary overhead in sync mode.
> > 
> > The exit path (mte_check_tfsr_exit) and the assembly paths
> > (check_mte_async_tcf / clear_mte_async_tcf in entry.S) already had this
> > check.
> 
> Right, that's for user space (TFSR_EL1.TF0 IIUC). What you are adding is
> for KASAN. Maybe make that clearer.

Yeah, I'll tweak the commit message a bit. Even
system_uses_mte_async_or_asymm_mode() should be renamed to something
resembling kasan but I'll leave the function name as is for now.

-- 
Catalin

