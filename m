Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370B8C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/Su0nNJOTZ5Ivfe1qEfm4b8ERGy6jToxRGt6ddEdPY=; b=TivpEwENFzbWrV5Shvb3Epm3sR
	9Qj5Sik3aX+iy9tDGESY6ABUFoTsZf6lN3Jil0nP9PHMjtGTI3NHAKjob56dSPZDVly5QiBeaRbn4
	2tg0L7cKO30yJhRQBzbK2Fb7PYo8DQxMLv0z8C4zFO0vJbxk87EWKjqXCMkp86wTOXMOzdz/NDqxh
	L/VUf/1NjOxPYlIoel1IAlwEnahd5MbKi/U4disW2XIUhc1vSLTHHfovFIEFfnFTIM6WrgZrrcMmm
	71zWx0OBfIVYjcsbUpGfIp5pXsj0HefdzOnqdUdnoQAb3J0LrvnWTkUU84aJDKP5aokAUakIahPHm
	rQjzY31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiay5-0000000BV96-20ct;
	Thu, 13 Feb 2025 15:17:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiavB-0000000BUcV-38Q0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:14:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 161F75C577F;
	Thu, 13 Feb 2025 15:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE95C4CED1;
	Thu, 13 Feb 2025 15:14:27 +0000 (UTC)
Date: Thu, 13 Feb 2025 10:14:36 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org
Subject: Re: [PATCH] arm64: scripts/sorttable: Implement sorting mcount_loc
 at boot for arm64
Message-ID: <20250213101436.39981514@gandalf.local.home>
In-Reply-To: <20250213150934.12012-C-hca@linux.ibm.com>
References: <20250210142647.083ff456@gandalf.local.home>
	<20250213125302.12012-A-hca@linux.ibm.com>
	<20250213150934.12012-C-hca@linux.ibm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_071433_844656_3CC21D88 
X-CRM114-Status: GOOD (  10.44  )
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

On Thu, 13 Feb 2025 16:09:34 +0100
Heiko Carstens <hca@linux.ibm.com> wrote:

> Something like this:

Thanks,

I'm about to send a bunch of patches to this code that removes weak
functions. Since s390 is big-endian, it would be good for you to test them
too. I'll Cc you on them. I think I handled the endianess correctly.
Although I found a bug where if you compile le arm64 on s390 it will break
because it assumed that the endianess of the build machine was the same as
the target.

I'll be sending them shortly. Just doing some more smoke tests.

-- Steve

