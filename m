Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5F8C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSri3tmJxH3JUtjGPxRkAAQEpcW0FF+9Qaisj3Numv0=; b=4ULrws4sGcqSGefjVRKry1Tcma
	l9L9FvmR2lGltTAfrgKu6sQywA4zH0CyrBII+9iYidmw8RyfXLsSbR0h944VSabrBp0t5Uky175mk
	ytmchkfIHr4OGNAZST4EYRoEkjsBSHUUfru6uDFpMBQvFYBcASKpFZChdTJtwv9oodT8CdIoHz1XP
	AFINjteCGjvtb9gx2/1X4quiUga8EoI/VbEjwwFighO6LEKuy0pyWXwagunRRFMaG7PuHT/eaW1EV
	DvJxIv6onkBPWP5vV95IQC7GFgN6ag+t4/s5YP1hU63QVkqI27s5+jX+dFO/vyqWkoS+EzFsGth4i
	DLYDRSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuYz-00000002iPT-3oeW;
	Fri, 02 May 2025 17:52:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuX2-00000002iBo-1kzr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB71DA4C370;
	Fri,  2 May 2025 17:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E16EC4CEE4;
	Fri,  2 May 2025 17:50:34 +0000 (UTC)
Date: Fri, 2 May 2025 18:50:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 3/4] arm64/kernel: support store-only mte tag check
Message-ID: <aBUF6JduwlhHVR9E@arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410080723.953525-4-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_105040_518356_A88B2833 
X-CRM114-Status: UNSURE (   9.35  )
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

On Thu, Apr 10, 2025 at 09:07:22AM +0100, Yeoreum Yun wrote:
> Introduce new flag -- MTE_CTRL_STORE_ONLY used to set store-only tag check.
> This flag isn't overrided by prefered tcf flag setting but set together

Nit: s/overrided/overridden/

> with prefered setting of way to report tag check fault.

The preferred mode set via sysfs is about whether we want synchronous or
asynchronous tag check faults for reads/writes (or asymmetric). The
store-only checking can be combined with sync/async, so they are
slightly complementary. The question is whether one wants some global
knob to turn on store-only in combination with sync/async. We could add
more strings for sysfs like "(a)sync+storeonly"

It would be good to hear Peter's opinion from an Android perspective.

-- 
Catalin

