Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0465C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRJ5Q7/EfFEdh1EmuEgbrDPUDpvR4UsWxQQj+QK4w6w=; b=cefAEjMJ66kPA1nBC4GY5ux+Wo
	dqB3FG7pz5HXhnmO+x2YOj5ttxlbx5hWOlF9OWlHdng2+1SxzMUBTRf7WSAYPKjmrMvFswPyuIiSS
	+fPzLrfoB5TGjDL6jwh4i+BGwRAeg3Ny+J9qgMYUx8tmxozaJPSDpRbqUaK7NBzql6xBhSW3NMQj9
	JxT6rgPre1TT2uZxwKjZbopu3XJPSbaU6HdtZ9r52S2Jciu4cZrLmnVOATKWzO+Yckx86XqDTGIKn
	Bjyc6HvTpoplewm8HfnumsP+ybxzIKb6SfgCcUBKhpPptkXwvU2dom026S3uxSqtey+SSghUEfSTi
	aPwVvANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAX7a-0000000GDgF-40rc;
	Thu, 01 May 2025 16:50:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAX3n-0000000GDIh-1pHU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B06585C4448;
	Thu,  1 May 2025 16:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A57C4CEE3;
	Thu,  1 May 2025 16:46:52 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: Lee Jones <lee@kernel.org>,
	James Morse <james.morse@arm.com>,
	Doug Anderson <dianders@chromium.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays
Date: Thu,  1 May 2025 17:46:50 +0100
Message-Id: <174611800133.1529001.17837513036800587380.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250501104747.28431-1-will@kernel.org>
References: <20250501104747.28431-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_094655_763461_35598F8F 
X-CRM114-Status: GOOD (  10.57  )
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

On Thu, 01 May 2025 11:47:47 +0100, Will Deacon wrote:
> Commit a5951389e58d ("arm64: errata: Add newer ARM cores to the
> spectre_bhb_loop_affected() lists") added some additional CPUs to the
> Spectre-BHB workaround, including some new arrays for designs that
> require new 'k' values for the workaround to be effective.
> 
> Unfortunately, the new arrays omitted the sentinel entry and so
> is_midr_in_range_list() will walk off the end when it doesn't find a
> match. With UBSAN enabled, this leads to a crash during boot when
> is_midr_in_range_list() is inlined (which was more common prior to
> c8c2647e69be ("arm64: Make  _midr_in_range_list() an exported
> function")):
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays
      https://git.kernel.org/arm64/c/fee4d171451c

-- 
Catalin


