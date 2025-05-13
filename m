Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233F4C3ABD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AmTicikg6AbCgykyQ170ibQEtDLWwpXbIlQZZb2wXI=; b=1xYGH1UhngIYSX3eccQ5cU9OhL
	oZ953R5v7c8bppvBEM9G5kxTdk1luaBcj6Kz+FvQ7K4RBbEvnMI8z+3YLxXS4TrpWJhB56jY4sVfw
	1+Yif6BWGjZ/LauMbCS/gwfQY/Iz/c+s2LZKzhIUGZsXA4wwLfquwNJv1YSleb2JgZpPr6h7/SE9T
	lTRsoLaKkiGY9hjiRKNJ/q5TFmBbMdhv4EVtqNzBF0SSxuZ5eQYwpLbyKaIpe2zVpICw+xxDUPw/C
	H2cMveV3d2EuxvoDhCq4jfnegyxmm+ZNh0BW13dHD/ZC98AxvTzrqAMgzgeSjK7iqAnmrYN79+Iaa
	9XNkHoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEq8K-0000000CYSp-2ohX;
	Tue, 13 May 2025 13:57:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpwY-0000000CWfo-0xJy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:45:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A60F168F;
	Tue, 13 May 2025 06:45:02 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9524A3F673;
	Tue, 13 May 2025 06:45:12 -0700 (PDT)
Date: Tue, 13 May 2025 14:45:07 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Makefile: Ensure initrd parameters in /chosen are
 up-to-date
Message-ID: <aCNM42HhLVQIePIS@e133380.arm.com>
References: <20250512150944.38322-1-Dave.Martin@arm.com>
 <aCIY_bKyj6Pl7ZZm@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCIY_bKyj6Pl7ZZm@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_064514_317058_8EB973F6 
X-CRM114-Status: GOOD (  18.62  )
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

Hi,

On Mon, May 12, 2025 at 04:51:25PM +0100, Mark Rutland wrote:
> On Mon, May 12, 2025 at 04:09:44PM +0100, Dave Martin wrote:
> > The initrd parameters in the FDT /chosen node are fixed when the device
> > tree blob is generated, so it is important to regenerate the device
> > tree if the initrd image has been updated.
> > 
> > Currently this does not happen, so the parameters can be stale.
> > In particular, if the initrd image is bigger than it was when the
> > device tree was first generated then the value of the linux,initrd-end
> > parameter is too small, leading to truncation of the initrd image on
> > boot even though the whole image is present in linux-system.axf.
> > 
> > Make $(FILESYSTEM) a dependency of fdt.dtb so that the parameters are
> > refreshed properly based on the current initrd image (if any).
> > 
> > Without --with-initrd, FILESYSTEM is the empty string and the
> > dependency evaporates, which is just fine.
> > 
> > Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> 
> Applied.
> 
> Mark.

Thanks!

---Dave

