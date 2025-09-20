Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E799CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 21:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Subject:To:From:Date:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ey1TVXi/MS3WR8yat9Vw6iUgNo638CAO/mjyeNK3rn4=; b=fBXjseE2fdNQxVOHZBcyZGQ8RN
	RJUsjusrWo6G7XjhNa6R+PBKQtcPtMg2riWYdz0IMsniABEfPfU2CtrljnKE6FYV9N8uSYSOTIQAm
	V/y0vUGBlIi44I4KFUVfVPuTXREumHtT3Ru3NsgknnkD/2UXYylRmympvaZ//NjCqE9QetNnpB8fS
	OOLtwonzLjQxKJm/1s4mOrqIHRmYp+f+9zB9cTr3xexKx0AQN0aV0uxQrdRSvkBV/+/9i+EGTVVst
	aCwjI4Wx5/hzmtBfIIaG/DF2fUY5syq1tdTHjzB1VFNbETH6KIoZ0ArCjwW9VsoB4lTq6cQz/PTsp
	3bY0+/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v05Vq-00000005z8F-2X9L;
	Sat, 20 Sep 2025 21:52:58 +0000
Received: from m101-out-mua-2.websupport.se ([109.235.175.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v05Vo-00000005z35-1n89
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 21:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=technux.se; s=mail;
	t=1758404912; bh=ey1TVXi/MS3WR8yat9Vw6iUgNo638CAO/mjyeNK3rn4=;
	h=Date:From:To:Subject:From;
	b=NTbUu608hVSNCRuWqddzyVB5EkfVqAwqw8KySfF6rm0LvOVC5Zu3bWKlQuIyz8IJ2
	 KWF6kHswhzcwDbIog8J2pj5r5hXCJk4X0LnfuULWLQJ12M2iqIJ7sUcLotmXRQeqBf
	 pUady65Y4uuRnBus1SiZN4NDC9B7F7mTDdrkbrl9oXH9/AcoXhaLzJ8cNQVHMrlK4Q
	 OdLS0CxIDkMhksmiuQ5wbCZwEBzUmlaZbGAVTAEtC3bsqc8o5mz4amFTPlRiNlxWWc
	 B1JFl1GgFx0rEO9lUS9XselQvX2XRh2rpJ1rXOxwTP3/R/31FHL2clW0sKe0v68Clw
	 pn/6AVlDTYHeQ==
Received: from m101-u7-ing.websupport.se (unknown [10.30.7.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-2.websupport.se (Postfix) with ESMTPS id 4cTjg44HBGz1h88
	for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 23:48:32 +0200 (CEST)
X-Authenticated-Sender: petter@technux.se
Authentication-Results: m101-u7-ing.websupport.se;
	auth=pass smtp.auth=petter@technux.se smtp.mailfrom=petter@technux.se
Received: from roundcube.ws.int (unknown [109.235.175.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: petter@technux.se)
	by m101-u7-ing.websupport.se (Postfix) with ESMTPSA id 4cTjg4235xzwXh
	for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 23:48:31 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 20 Sep 2025 23:48:31 +0200
From: petter@technux.se
To: linux-arm-kernel@lists.infradead.org
Subject: [BUG] AM335x (BeagleBone Black Wireless) suspend/resume regression
 starting in Linux 6.10
User-Agent: Roundcube Webmail/1.6.11
Message-ID: <31a22abb0cadefc20b22fd287065f7c3@technux.se>
X-Sender: petter@technux.se
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Out-Spamd-Result: default: False [0.00 / 1000.00];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:41528, ipnet:109.235.175.0/24, country:SE];
	ARC_NA(0.00)[];
	WS_IP_WHITELIST(0.00)[109.235.175.24];
	FROM_NO_DN(0.00)[]
X-Out-Rspamd-Queue-Id: 4cTjg4235xzwXh
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WS_IP_WHITELIST
X-Out-Rspamd-Server: m101-rspamd-out-4
X-Rspamd-Action: no action
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1408
X-purgate-ID: 155908::1758404912-F3A44325-551F3682/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_145256_772238_9DE2D955 
X-CRM114-Status: UNSURE (   9.46  )
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

Hi,

I have some issues when trying to bump a BeagleBone Black Wireless board 
from Linux 6.6 to 6.12 (or later). When using rtcwake to test 
suspend/resume the system freezes on

[  209.104183] PM: suspend entry (deep)
[  209.111191] Filesystems sync: 0.003 seconds
[  209.147496] Freezing user space processes
[  209.155818] Freezing user space processes completed (elapsed 0.003 
seconds)
[  209.163098] OOM killer disabled.
[  209.166495] Freezing remaining freezable tasks
[  209.172805] Freezing remaining freezable tasks completed (elapsed 
0.001 seconds)
[  209.180559] printk: Suspending console(s) (use no_console_suspend to 
debug)

I have also tried with no_console_suspend then I can see below 
additional printouts before the system stalls

[ 215.505253] omap8250 48022000.serial: ttyS1: Unable to drain 
transmitter [ 215.531553] l4ls-clkctrl:0034:0: failed to disable

I tried to bisect the issue and reverting below commits seems to solve 
it on 6.10 -> 6.12 kernels.

4bcc2e91b9e7 bus: ti-sysc: Drop legacy idle quirk handling
2414277f5145 bus: ti-sysc: Drop legacy quirk handling for smartreflex
5f711f036588 bus: ti-sysc: Drop legacy quirk handling for uarts

BUT on Linux 6.17 I tried to revert above commits and it still seems to 
hang. Anyone that knows how I can debug this further or have any 
suggestion for what is really wrong here?

BR Petter

