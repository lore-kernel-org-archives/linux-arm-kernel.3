Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8F6CF58C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtwQFxkx/HueSIkRpbhMdMtq1x4A2uQWt43LQaI+Bkc=; b=GoIy0yo0yaBjwhdyIV7CzPvgkI
	0S1XrIWouP1DRrdKnmpu1T5LEjO/L8KepeGwq8mxbakK+pFf9pBcwfYgzOTy1D050ByyxWI34Ffb6
	ZGbtFlAnBE9ajbOK4l4cnrP6g7GhTA+iDERrEZiEWNO6PyGRudqu1FIooHDgwJX50FAMReBTDtVfO
	LZJn3lJQMPQtaSd4HSAnFR3ptl/3OcxYT3ZfpT0vR9e0K7OusnsT9DwHll6TgMYJ5EIb+W8aYoa+G
	+aoo8CYjTEuzbaQSLeYopJ6jvFnIK+eYt1Mv8nmj9mx1ZJFO6nl0JtOopE3KZU8Nnvmf2t7UHSo2n
	g14uq4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmNs-00000004K5L-2CXH;
	Wed, 19 Nov 2025 17:54:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmNq-00000004K2N-08LB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 17:54:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18411FEC;
	Wed, 19 Nov 2025 09:54:11 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3204A3F740;
	Wed, 19 Nov 2025 09:54:17 -0800 (PST)
Date: Wed, 19 Nov 2025 17:54:14 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kees Cook <keescook@chromium.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] lkdtm/bugs: Add cases for BUG and PANIC occurring in
 hardirq context
Message-ID: <aR4ERqeHFbSWooZW@arm.com>
References: <20251112175316.2841017-4-ardb+git@google.com>
 <20251112175316.2841017-5-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112175316.2841017-5-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_095422_106664_E72272C7 
X-CRM114-Status: GOOD (  12.27  )
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

On Wed, Nov 12, 2025 at 06:53:18PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Add lkdtm cases to trigger a BUG() or panic() from hardirq context. This
> is useful for testing pstore behavior being invoked from such contexts.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/misc/lkdtm/bugs.c | 53 ++++++++++++++++++++
>  1 file changed, 53 insertions(+)

Kees, are you ok with this patch? Happy to take it through the arm64
tree together with the second one.

Thanks.

-- 
Catalin

