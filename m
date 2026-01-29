Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FCCD46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaFIZYsDltYEpS6mHJyDR3fu7UUXnbuSHzd5t4zdWjo=; b=MUSm+nW/em50lEGTANDgMkDftR
	HH9CELLYHPB+OMpagplCZ9D2vxe/vivNUQmRFlJiCvET922QoEICIp3VOpXB5iQdC2VrdOIUUjNpu
	Vr8E+o5NOoxPJTlibVEs95LFTjzpP+A7O2Zvh/JEtIBv0Y3rCUTVtBdP4tu9WOWlEn/dmXKf+FzYZ
	nbCVJ2BfLRg4mcVmcZZaBHdKcDiekbaOfq1+YNKjPRlGpFsTO4rZmrq1zCmhKt8D9XIsrZZsI91pN
	H8yqVMxVXwDVdkL1DLZTVBh3jKIzpdjzGSGHT/VUC/QfKru0xRo3gS2Dab4CcBI/+gPscPvNvy+Lz
	Jj+Cn+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFrz-0000000GyK6-2Drl;
	Thu, 29 Jan 2026 00:26:47 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFru-0000000GyIv-3NL0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:26:46 +0000
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id A48F78C43D;
	Thu, 29 Jan 2026 00:26:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 44B0D20027;
	Thu, 29 Jan 2026 00:26:36 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:26:46 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 04/30] ring-buffer: Add non-consuming read for
 ring-buffer remotes
Message-ID: <20260128192646.02cf1b28@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-5-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-5-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: w83yetxxzut7c8f5ts7rffnwaoyqf9pa
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 44B0D20027
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/rdl/XabBL++DHiZHfOLAsNiVHUmtio3E=
X-HE-Tag: 1769646396-519553
X-HE-Meta: U2FsdGVkX18lKQWYiJxaOCSWK0x0w5aJllREXXSd4bijFpbilRGhh2NpQyQLmmXniCcqsVYArp/P5dvymZnfUr6Tp5GWPmuFEZcJxl5wPHX9XAGSqz+ShetgwprGaKwnteEK7ZjWWJaEHIHNg0ZYgbV9fwe2ZTC3XWzcnLex7lH9r2JWgg7cu2SGUqwPnapdxBYIEXCx1X7ZUaYzliCcW3S1IVfmC2TOhQhqe3ZYuTwwU7NOst3koU+EuoY/Br/jXm7XGu934AopVPBgHF5PWACD0/vQV5DMWOQbmwPlf47IV5FUTU/G6N1KfA/874sOX5SANF/hEC6BDBm9H3lNQB/XQX8vlpEhYCgdhl4jXixh5YHmnKiJ4aMyXPeaTwOtHw7ysFTRSzalwULxGYWvSA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_162645_166867_4C95F6B2 
X-CRM114-Status: UNSURE (   7.81  )
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

On Mon, 26 Jan 2026 10:43:53 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Hopefully, the remote will only swap pages on the kernel instruction (via
> the swap_reader_page() callback). This means we know at what point the
> ring-buffer geometry has changed. It is therefore possible to rearrange
> the kernel view of that ring-buffer to allow non-consuming read.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

