Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC70C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 00:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCoSEk/kdI6Jx/Hs/Ys/2xTpv2gnopuAEfd6oSTk8rU=; b=HdD+AgG1aI+7+JHC/1+FAM5ycJ
	eH13akzTDs2j+lgVQyUQiXPhIxhL/Aj327d2uxyNpcvn0WrchHwHF6FPKWX5yDclyPuoZDlB7//Qb
	ouAZ1XF88cwkN1yTwZoODN37d5/9vpbDoxZUfCY18TS8bTOS4hSf1sLO+y2jL63XQrph28hEOFb8V
	7gSzPCYqOHH8uY1Heiw5ziqV0wtRVqmMcFN2cL3pjGsd1YHA6sWZVeAq1MI2OT3j2N6ux1jP5c79v
	trLUME3ps1QFAMuz2siPtsaTfDCYif+aLCWc0XfeyJDN6GFv/DwDzwElAo1KSckBCLyo/JF/b2/Sg
	4TO7HtYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dSj-000000086gW-32zC;
	Wed, 16 Sep 2026 00:25:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dSi-000000086gN-01m3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 00:25:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C079443DC8;
	Wed, 16 Sep 2026 00:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A301F000FF;
	Wed, 16 Sep 2026 00:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789518319;
	bh=oCoSEk/kdI6Jx/Hs/Ys/2xTpv2gnopuAEfd6oSTk8rU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WTI9RUBBKTus/OejACddjmDt4WpWCJnxpQYbgneSXISSOjPXhkMi94mfL37NWPMvr
	 1t4sJc02jmrYa86lVfMD2LosqN+Y3QDXzzN8U1nO8l1cWGW6hN/UOuJSa2Q/ECKp/n
	 WMZJaNJYaxr4ZIeAZhpAvzsnsoe+56YtJ+Rnze8q+fJglyCZ2bIheyoKyoWQC9L0Rr
	 KZyqPHzhPI9TtNVFpje8aUGKavG68sWrLd7ZnPhiO+CC1pDD0tASaiVQEN9ltvAr+/
	 OEXwJjnDFzR56ZfPJs2PuRyTdgD9Jeew2GJVLtrV2ZWfclOk9B//LU0r5jG1e81iWJ
	 61ujnb0tHDTvA==
Date: Tue, 15 Sep 2026 17:25:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Michal Simek <michal.simek@amd.com>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rt-devel@lists.linux.dev>,
 <neelisrinivas18@gmail.com>, <git@amd.com>
Subject: Re: [PATCH net-next v2 6/8] net: xilinx: tsn: add the endpoint RX
 data path
Message-ID: <20260915172518.09e66147@kernel.org>
In-Reply-To: <20260909-patches_v2_external-v2-6-3a40babaff4c@amd.com>
References: <20260909-patches_v2_external-v2-0-3a40babaff4c@amd.com>
	<20260909-patches_v2_external-v2-6-3a40babaff4c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 9 Sep 2026 00:49:54 +0530 Srinivas Neeli wrote:
> +	guard(spinlock_bh)(&xchan->rx_lock);

Quoting documentation:

  Using device-managed and cleanup.h constructs
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  Netdev remains skeptical about promises of all "auto-cleanup" APIs,
  including even ``devm_`` helpers, historically. They are not the preferred
  style of implementation, merely an acceptable one.
  
  Use of ``guard()`` is discouraged within any function longer than 20 lines,
  ``scoped_guard()`` is considered more readable. Using normal lock/unlock is
  still (weakly) preferred.
  
  Low level cleanup constructs (such as ``__free()``) can be used when building
  APIs and helpers, especially scoped iterators. However, direct use of
  ``__free()`` within networking core and drivers is discouraged.
  Similar guidance applies to declaring variables mid-function.
  
See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#using-device-managed-and-cleanup-h-constructs

