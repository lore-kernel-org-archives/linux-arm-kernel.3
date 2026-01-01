Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00EDEED630
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUn47cKp6fgr3DFGG/i63d6jHlNLrvo1nJ1MID9esbI=; b=ZE3MnGb1t2FYJcqHeNLEAa9ugF
	AJN6ioWJdiBffekvX12fx6XV3XgubtkejFQzjc4AdDC5sGGw0mSdLG2EdcRbjEqA4Qig77MdHpCCy
	w0zlxCqUEpNlCIONjBE7oGKa1IMCquIFDRPf9m6VeY+4LSSfZYjurHmnwT2Hk/vqTbuSfVoP3loBV
	78+Af+3uYrITlmD5kLljaOE64NLdxklFkeuEWhMT8zSsgd2sL0QSMwU4HwiBWAIG0es4k6Ligi+hZ
	Fdpz+jdfpPvrawpZaMWVWDK2oI1lmyAq8+kKC1O6qyGcInYqYB9GsbL5iQ74FWs1Pl7ad3s7YPE1C
	8jh7IXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMnR-00000007PFn-2dLq;
	Thu, 01 Jan 2026 17:49:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMnP-00000007PFQ-0cJ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:49:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB735497;
	Thu,  1 Jan 2026 09:49:02 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A91A3F694;
	Thu,  1 Jan 2026 09:49:08 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Sourav Mohapatra <sourav.mohapatra@arm.com>
Subject: Re: [PATCH] firmware: arm_ffa: Correct 32-bit response handling in NOTIFICATION_INFO_GET
Date: Thu,  1 Jan 2026 17:49:05 +0000
Message-ID: <176728970818.116738.6339335449341509968.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218142001.2457111-1-sudeep.holla@arm.com>
References: <20251218142001.2457111-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_094911_225638_FE13504E 
X-CRM114-Status: UNSURE (   8.15  )
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

On Thu, 18 Dec 2025 14:20:01 +0000, Sudeep Holla wrote:
> The FF-A specification allows NOTIFICATION_INFO_GET to return either a
> 64-bit (FFA_FN64_SUCCESS) or a 32-bit (FFA_SUCCESS) response, depending on
> whether the firmware chooses the SMC64 or SMC32 calling convention.
> 
> The driver previously detected the response format by checking ret.a0, but
> still interpreted the returned ID lists (x3..x17 or w3..w7) as if they always
> followed the 64-bit SMC64 layout. In the SMC32 case, the upper 32 bits of
> each argument register are undefined by the calling convention, meaning the
> driver could read stale or garbage values when parsing notification IDs.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!

[1/1] firmware: arm_ffa: Correct 32-bit response handling in NOTIFICATION_INFO_GET
      https://git.kernel.org/sudeep.holla/c/be4d4543f780
--
Regards,
Sudeep


