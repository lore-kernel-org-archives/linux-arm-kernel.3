Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AB4F9937D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuEIgjEjArTj+JyO4Ygwrjl4LWyQinNsFZcCJHuv5ak=; b=3RnRsBIwnlSp8n2BGJoiq7A7pI
	0f2WOuVFkiIQis1l3NGG2W34cUrpupQoWpjRUgB3eSxaWSYFew2azZpgn39MTs9m/uCcQWmi9m33C
	zTY9jlpAKAjfGT9OIDVBL6m94SVGMccARPxV+PqJWf5eAayXK8FnUT9I0AE/S6IyZtwfukzNc4kvr
	/hWwJgIg4LVl0VNN3Uuvq6R3EDnFHmLj0kwVfG4o1MQuyaeXkyCV7jgx/gQWspfxAmYpMJYP/JZHD
	XimfTgEotFypXREfmumWyJ6CRf00bFqF8kkx8TAdtcWDHEOts/4X7e4/p9ogRryd7AjWhT8pjhACw
	QxjWynNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsVQ-0000000BY4Q-3mkw;
	Thu, 23 Apr 2026 11:46:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsVP-0000000BY4E-2ByV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 11:46:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AA1B6001A;
	Thu, 23 Apr 2026 11:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0337FC2BCAF;
	Thu, 23 Apr 2026 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776944762;
	bh=FlBRd76Wf4UdbkyU24qsKdC81AKW3AqatiosydymFOw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=REY8dtkdaZxdUR6okwtIXOG/XGyWzPkGf0MYf3QwzfvxjV2kpDLd3Ro3+bQx+QQ3u
	 wy/JKltqE4FC61pI61fS2Hgb8wFuSuggGXnIr/GMsrMBtV8utMusBfLm+JEcnFJMSr
	 Lr7kiw0mRhlKf9NmNe5s01IF/iT+OIaCC0heBFuUPru0L7JXhSK9WtaAHdPjQqOmLI
	 f202blDCRAGwXIfdMZPJBdDEW5/yF0sF3elaXYS1g4Lhg2WUvqgKtD5+YTLxRVd7Du
	 YyFKyiSpiiDJAYEh+X0QG93OuXRpVXL6kUgU5Uwu/fGRsgYO/wdN0W03N2Kroml+0d
	 2m63MJmUmpwSw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, praneeth@ti.com, nm@ti.com, afd@ti.com, vigneshr@ti.com, 
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
 rogerq@kernel.org, tony@atomide.com, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, s-ramamoorthy@ti.com, 
 Akashdeep Kaur <a-kaur@ti.com>
Cc: vishalm@ti.com, sebin.francis@ti.com, d-gole@ti.com, k-willis@ti.com
In-Reply-To: <20260401112257.1248437-3-a-kaur@ti.com>
References: <20260401112257.1248437-3-a-kaur@ti.com>
Subject: Re: (subset) [PATCH v3 2/2] mfd: tps65219: Make poweroff handler
 conditional on system-power-controller
Message-Id: <177694475669.204183.17654636429051313740.b4-ty@b4>
Date: Thu, 23 Apr 2026 12:45:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Wed, 01 Apr 2026 16:52:57 +0530, Akashdeep Kaur wrote:
> Currently, the TPS65219 driver unconditionally registers a poweroff
> handler. This causes issues on systems where a different component
> (such as TF-A firmware) should handle system poweroff instead.
> 
> Make the poweroff handler registration conditional based on the
> "system-power-controller" device tree property. This follows the
> standard kernel pattern where only the designated power controller
> registers for system poweroff operations.
> 
> [...]

Applied, thanks!

[2/2] mfd: tps65219: Make poweroff handler conditional on system-power-controller
      commit: 0af600b8e3bced37afa267ac9a7f68e15764f502

--
Lee Jones [李琼斯]


