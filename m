Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D7EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26lXKT785yvCvobLaXwQS2oGnYumhwcPmyzMrL9rH7g=; b=a55SCMtmg/GA6iLGT7wVjOVD0h
	i/oPU1fCa/WBQBwoNg/2fHCoZE4N/otIY3zUIEfp27vih2WGeuNCleEFNdp1rTQnJwaLLfotruQQX
	r2NUiKkZ2UlLBVNwyJYn+/uLiMevlV0iGWx2okMp7AB2ugX/rsnCVQ3Ob7wLzXb6QNs0IJpIvoGfN
	20nKbzAyricZVdQZBJHRxf0Hc2uqR6jDTIXP7DCWwMoNmNrf9QD3A76fdhsooNfNb3l8yNBcapUJl
	F5u3LhGL9TH2ssHCWCfligeQEKgDbesCuFr96Qxffuh9N/yO8nZt7BNS6Y/qTCQNHx1ZOiXhfUMRx
	tzDbdKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dYm-0000000BIw1-0h0l;
	Fri, 04 Apr 2025 09:42:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dWx-0000000BIjh-3CPV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:40:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16E471515;
	Fri,  4 Apr 2025 02:40:07 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02C173F59E;
	Fri,  4 Apr 2025 02:40:03 -0700 (PDT)
Date: Fri, 4 Apr 2025 10:39:58 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [boot-wrapper] aarch64: Enable access into FEAT_FGT2 registers
 from EL2 and below
Message-ID: <Z--o7ncepklaOoEd@J2N7QTR9R3>
References: <20240730054643.157295-1-anshuman.khandual@arm.com>
 <Z7xmenE0scM9omcU@J2N7QTR9R3.cambridge.arm.com>
 <4a87b3b7-6bd3-4c86-9a30-43f15759948a@arm.com>
 <c8cddfa5-fcf2-4de9-ab66-ca036363c0bb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8cddfa5-fcf2-4de9-ab66-ca036363c0bb@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_024007_841205_38DCA07C 
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

On Thu, Apr 03, 2025 at 09:29:54AM +0530, Anshuman Khandual wrote:
> Hello Mark,
> 
> The current mainline kernel with HEAD a1b5bd45d4ee ("Merge tag 'usb-6.15-rc1'
> of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") does not boot
> on the latest boot wrapper without this patch. Please consider merging this
> patch, otherwise the boot-wrapper based environment will become unavailable
> for v6.15-rc1.

Sorry, this got stuck as I was waiting for the kernel side to settle,
then other issues have took up my time.

Applied now.

Mark.

