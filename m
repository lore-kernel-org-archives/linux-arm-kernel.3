Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5E2C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXPnRB/iegayMOPs+83FEtjVYuLFSq110+Y110/DRwA=; b=m9D8tk3md8OJCZSTvvKVQ2B+1s
	b1Gc5Z/PdaN1VEVJDvxULZ5KZDxCc3CKNg7oQNDa0gsnDQdN3qP8IUIQ+vR7zhBMVezUJ74oC8KTO
	3mWCfz4XdxbQX3E0daKkIR03GVy0rpbucxZr5eQT2N7Xz/3W5xkFXZXJhbCpkEU71pTjC47/7waJa
	tlato8xWxNpUc/KB5vs07+MxQJgo4ptOSZVqPe34w546dpVBToLP95W9RTYKFFZAZt6Rh/1+TKXKB
	Fc6QDKfTxX8D5sl1lcn/xM84olrbkr1zTLlRAnedFSw0zUt4MpyR3AL/pi7QFidSo2UAPBHSKOZ6s
	VvrRGRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnF43-00000003NbR-0ynk;
	Wed, 26 Feb 2025 10:54:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEff-00000003IT7-20fU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:29:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 007A31BA8;
	Wed, 26 Feb 2025 02:29:57 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 831503F6A8;
	Wed, 26 Feb 2025 02:29:38 -0800 (PST)
Date: Wed, 26 Feb 2025 10:29:35 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v6 06/10] perf: arm_pmuv3: Add support for ARM Rainier PMU
Message-ID: <Z77tD1VuD_W0CK5B@bogus>
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
 <20250220180427.3382482-7-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220180427.3382482-7-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_022943_558965_14C87639 
X-CRM114-Status: UNSURE (   9.26  )
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

On Thu, Feb 20, 2025 at 06:04:24PM +0000, Vincenzo Frascino wrote:
> Add support for the ARM Rainier CPU core PMU.
>

I can't take this through Arm SoC unless there is a strong dependency
and/or urgency. I can take 05/10. The other option is you can take
05 and 06/10 via Will's perf changes as usual as I they seem quite
independent to me.

I can take the rest of the patches through Arm SoC tree for next merge
window.

-- 
Regards,
Sudeep

