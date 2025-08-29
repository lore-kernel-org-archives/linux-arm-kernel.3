Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCDBCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLKEYWCOQmMDQNx/pwPo3zfJS6SvTUi5l0tmvLYsX6k=; b=0HfNXg/qZlJcWtmNXMERLfEuik
	/qt/T/xHK9cgwS4g45KkHBEGEC3Chm8qFmfcAvX95c2w5yUfteYcxelOff015OqSllno2gS63j/qP
	jkBIE8H2uIdF8zwxXcD7z9oXEUqjiT0RHJXy0UmcOBlkxA2A90LVnlUFGVjxSx0RFmLP8CF/maT0L
	EQOh9W3C/m9BqR42/sFb9pxjIKon77LugAv1DcMlY6u/uWFZoSFAdyfNKVov9DHNpDbTyBJ1QIwLr
	Y8d37BZLc7QXgdbWOQjIpGFb5Z0l37lAofVkbbkd+DUKVz3owSRKDEvJQybFM33URP9Tal9J5q1fk
	K7jxwm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0VU-000000067Cz-2hnA;
	Fri, 29 Aug 2025 14:55:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw5N-00000005H2q-3dUu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HLKEYWCOQmMDQNx/pwPo3zfJS6SvTUi5l0tmvLYsX6k=; b=trC8TmGGWkV8XmJ1xRQnsYuKML
	M0TU/7fG2aZwTUA+lL6h1cxZ8BsaytI/TiRCPNmG8nlnjdvH9iK7hEKQL4AeDagDt7Cod89RU4L5t
	hLT9oh1r3vaBMAPOEzZ6VDgkp6stVbN9oNlZBfpjqpXOvSDzjQ48Oak+ZbJWg2iaFdV9+JH1QDOmN
	ZDJGVkRtkBBir9MO/9yT70Nd9I0nm+77chksqmliT9JEuAKmIAQHEUOgPtEFG+bFcDzCg1inajMs9
	JNzSE547v35E7KyQzppx9BnLh5YOYkGBd2k4pXpvQHiiRi9ZbJprblv8goc7zd/EbL9fkJhM9n1U6
	l72bP7qg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47766)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1urw5I-000000002dF-4159;
	Fri, 29 Aug 2025 11:11:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1urw5G-000000003yZ-3YcK;
	Fri, 29 Aug 2025 11:11:51 +0100
Date: Fri, 29 Aug 2025 11:11:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: module: Ensure the override of
 module_arch_freeing_init()
Message-ID: <aLF85tovbkn5vjav@shell.armlinux.org.uk>
References: <20250829090726.834456-1-petr.pavlu@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829090726.834456-1-petr.pavlu@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_031157_903445_923CFC15 
X-CRM114-Status: GOOD (  15.27  )
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

On Fri, Aug 29, 2025 at 11:06:44AM +0200, Petr Pavlu wrote:
> The function module_arch_freeing_init() defined in arch/arm/kernel/module.c
> is supposed to override a weak function of the same name defined in
> kernel/module/main.c. However, the ARM override is also marked as weak,
> which means that selecting the correct function unnecessarily depends on
> the order in which object files with both functions are passed to the
> linker. Although it happens to be correct at the moment, the proper pattern
> is to make the ARM override a strong definition.
> 
> Fixes: cdcb07e45a91 ("ARM: 8975/1: module: fix handling of unwind init sections")
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>

LGTM, please ensure it ends up in the patch system (see signature
below). Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

