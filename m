Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA72ECD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Er+CRp+/fzF6XP7lhBBmaTyKlQe5AEFZx4olmr5xIQ0=; b=b1hLBaSvMGgXRd9hU77SawmsA1
	VI9CNls+iMgIKOXuWEM+/vkjICM2Q0GoAarz7KQ2Sx6iLn0g23eQi0RM1EaCBD0FzyefG8/tHDWOO
	HRoc9UCxkfWAoz0qN7HzQfU5zOnxpBcnEOIVMeNaVyL1TO9Bm5pUKfKFE23D++heECBthjAlFOZhX
	ZGqw+iExAbJgL9MLsUH4DLBGHjo/EdwwRvDuL/XTsDV/THCVnTOJyy/vHN7FkrA88zigvKxyjwmA8
	QrK1RgodMzdwdSTHBV1XI0RxlMJOEEExZ/P0/4k1mnaQD8c9mEuiFnMXL0TpZBTNN54xNOiE+OTcx
	0cw7PTLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Cu-00000007uPs-38Yh;
	Fri, 29 May 2026 16:37:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Cs-00000007uPH-0VZe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:37:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66DDA43767;
	Fri, 29 May 2026 16:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4E71F00893;
	Fri, 29 May 2026 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780072629;
	bh=Er+CRp+/fzF6XP7lhBBmaTyKlQe5AEFZx4olmr5xIQ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DpJhVU3rHJQc98K2nTljj478Xh+GZiF0GUfOrwna3KtBKLlr2LjxoQlGAGOl1YFYj
	 JBYbOaE9746eYVP4RH2CqkzDMpk83yl26x5ckIrnbt4smT+ohvYdTsPlkFYVI1mTej
	 EB0KqUUmrVx45MeOEZ5y7jdg7Lsd+RA3Snlz6IhJrxF4Iu5Nya8fgNgD4vxLhbNqjH
	 KpmKdd5xCszMTY5cp16+JK/yjzYpX+MQt80DJQ5CJWKsYanZIszzTUQHokKsxNcmTq
	 Sh9iw2+A5hUTvVNfA2MHfr0zoJwCpvO1wp44xDknFQUzawJM/USdYwTFXVanvDnM+M
	 mqN0hjyHWFxgQ==
Date: Fri, 29 May 2026 17:36:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: will@kernel.org, xueshuai@linux.alibaba.com, saket.dumbre@intel.com,
 mchehab@kernel.org, dave@stgolabs.net, djbw@kernel.org, bp@alien8.de,
 tony.luck@intel.com, guohanjun@huawei.com, lenb@kernel.org,
 skhan@linuxfoundation.org, vishal.l.verma@intel.com, rafael@kernel.org,
 corbet@lwn.net, ira.weiny@intel.com, dave.jiang@intel.com,
 krzk+dt@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
 alison.schofield@intel.com, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael.Zhao2@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, Dmitry.Lamerov@arm.com,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 00/10] ACPI: APEI: share GHES CPER helpers and add DT
 FFH provider
Message-ID: <20260529173652.25069d3b@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_093710_180950_54556A5D 
X-CRM114-Status: UNSURE (   9.64  )
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

On Fri, 29 May 2026 10:50:40 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> This is v5 of the GHES refactor series. Compared to v4, it only updates
> the DT binding to address the latest review comments.

https://sashiko.dev/#/patchset/20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com

It is mostly not happy with existing code, but there is one point where it notes
a header that should be there (linux/cleanup.h)

Given you are working with this code at the moment, maybe take a look at some
of the reported issues whilst you are here!

Jonathan

