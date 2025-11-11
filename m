Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7547BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWIg+G3NtGN000xQkIjWdpW8Cxq1lptIVIx/rlEItlk=; b=d8ON1iYhxdDLsgTth/X9O2Kn6/
	E6lJkwvr6drcHp4HFeFi+F4RsDC1oOPT6H/6M4DgqXYayjks7peO0rg+erJ98YHnpWJ7R3EUGIlmD
	aCqX6j+hxkqCHeBTnRzga5c0v83EP49S/5PjzlRtEPdzS7/zRgWnYp+j9Rz5Ol9TMkl1yWS3gxS/H
	M2HFSzFOEcuQQavKiczpZIU7f7RrVpGIviaaNGjTsFHPGuuPNI4SabCzBEnjzIv+piE7RKFaAWHA3
	97PZGuWYL+e2Oph0OB3Sl3Xg4xSlwTwKk5ZFZxQco/X5X78eaBQpcMhmPjFeWcM1ABM5tlejG64b1
	Xu24dHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqm9-00000007PmB-2EdQ;
	Tue, 11 Nov 2025 15:59:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqm7-00000007Plj-35Np
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 15:59:20 +0000
Date: Tue, 11 Nov 2025 16:59:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762876755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wWIg+G3NtGN000xQkIjWdpW8Cxq1lptIVIx/rlEItlk=;
	b=S8Fg/JFtyqdQ9Ni5R985O+MeLbhqKsIILBK2ERgFNnj3MGyEh4tfFNYMtZlICbIdIVHScI
	R1Vj+AZmVF4RdvIkpugUagbStaY5FroR8Xc+H3uXfbb/86UYbJIPwDuE6T17/k2QfOSObN
	hsMzYD6oFuvUxtc1n5HAE2kPPlqguAgmG8pVrGolbv9l/njAwrNSNQEULN87oyZ0RjBESK
	VbPw4rX57z1x6i5lWGlGQD/5RbT9cI7kLDNsxp6fHs8xGlWDZANVn5wpAJI0vbERf//fLU
	v2wBtjYSFu3ACH25IbhGYs5K8b/VB+9bWVWM0k1Efe8x9qH1nUv9JAloVd1+9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762876755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wWIg+G3NtGN000xQkIjWdpW8Cxq1lptIVIx/rlEItlk=;
	b=hrFePxJXGK4DRratCzXtIVSUrnmS9FUkddU/Mtda/4okTbJc3K6UjQlkJqJ1c8hPAUBZWq
	rdr3/jp1D8NyWABQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 0/5] ARM: Remaining PREEMPT_RT bits
Message-ID: <20251111155913.vH-cxYha@linutronix.de>
References: <20251110145555.2555055-1-bigeasy@linutronix.de>
 <8d7c55f0-ba20-411c-93c7-bb354614c0df@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d7c55f0-ba20-411c-93c7-bb354614c0df@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_075919_938623_FF674A32 
X-CRM114-Status: UNSURE (   7.59  )
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

On 2025-11-11 16:16:52 [+0100], Arnd Bergmann wrote:
> Looks all good to me.
> 
> Please send the series to patches@armlinux.org.uk according to the
> description at https://www.arm.linux.org.uk/developer/patches/info.php
> 
> You can use
> 
> $ git send-email --add-header=\"KernelVersion: $(git describe --abbrev=0)\" --to="patches@arm.linux.org.uk" --suppress-cc=all

Just did so, thank you.

>      Arnd

Sebastian

