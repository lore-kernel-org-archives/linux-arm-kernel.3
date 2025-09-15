Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5160CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZCbahEO0Aw/Rlkp5fiG1DLe5Od+rkGa3tXo90vPdVk=; b=H42NBEu7ykbv3ZkiSLsggKD/9a
	IrNlBuXzupUVmWT+LeXgCJlnrhuYAfQ/vNAPiJf4AJetu+L/6TA/Qm86SHkvzZ3PGO2vRLxGy+sNa
	P+Puewy4k51kKK/ZW7JhPybr9hN72kDSAtQnG73Dfnot7Wu17JdAoJO/bTDFFFDi4yIcRaPeVgqWq
	ZNL7ozKrYL81dx34WMAqcO7KD2ZeL1UfdCo0n1X2aanh8VPhMhr5Fp0utuDOA9ZIAdUAHfGCWBYjR
	hqWlgL2EHrLr+5AbO6NCRFZ8wlkxPbQoLxDwemkJqwHrFIPKbh5AgsNfm+iy1CVR6L+lFSb+PDEZ0
	CssXLP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBer-000000052Z3-41xc;
	Mon, 15 Sep 2025 16:02:25 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBep-000000052Yi-45dh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1757952142;
	bh=PZCbahEO0Aw/Rlkp5fiG1DLe5Od+rkGa3tXo90vPdVk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Oqsszjz+nzLSGDoapxTXItdZX+1EhbRR/shy+5MTb9fF+CZM1X4Rl1iD/Y1iY+lYp
	 V90CrciwqGefxoh/SS8VQsDK7JS/qPcgYZTa59g19Y+llXS6b/kczsrQHe4l24IXbe
	 f27JiGMPbZD2Z5DqrD4AKpglx1Jz9NxXniNgXVrs=
Received: by gentwo.org (Postfix, from userid 1003)
	id 90FCE40346; Mon, 15 Sep 2025 09:02:22 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 8EE8E40345;
	Mon, 15 Sep 2025 09:02:22 -0700 (PDT)
Date: Mon, 15 Sep 2025 09:02:22 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
cc: Ryan Roberts <ryan.roberts@arm.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Takao Indoh <indou.takao@jp.fujitsu.com>, QI Fuli <qi.fuli@fujitsu.com>, 
    Andrea Arcangeli <aarcange@redhat.com>, Rafael Aquini <aquini@redhat.com>
Subject: Re: [RFC PATCH v1 0/2] Don't broadcast TLBI if mm was only active
 on local CPU
In-Reply-To: <874itk1dy3.fsf@DESKTOP-5N7EMDA>
Message-ID: <096ba6dd-091e-c86b-79f5-ecba9ce59b9e@gentwo.org>
References: <20250829153510.2401161-1-ryan.roberts@arm.com> <874itk1dy3.fsf@DESKTOP-5N7EMDA>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_090224_052067_D3FDAC25 
X-CRM114-Status: UNSURE (   7.13  )
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

On Wed, 3 Sep 2025, Huang, Ying wrote:

> https://lore.kernel.org/all/20200314031609.GB2250@redhat.com/

This patch is part of the Redhat 8 ARM kernels.


