Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1E0C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRQlDEjdYv8aHSpXYbLd+b30kNF1Ev7E6NuM5iKhXqM=; b=kRGIHL++z2HzZGZht8LBi8p66X
	XRZsAq/lHcDx7//ZPwa95mZNPc+tQfafRT5RdRnfvolHwNZDCW/46QBdrkREhZK2njBe7mCu/LoeX
	fVnEdKHfa2+mNWjLlGNGaR0PbExdtbceSHiuwJ/9Ji6f3SKujnQf1qW7CGpOF6DPpgQRNdWo+7yNa
	F2jkyc4t7M+BDB2HEm6gEQf4OL4Yyz4/BGJagaqxrEBshA11njbc6PbgTBIYZY0w5RCYvAYq+Z+rJ
	nFSpY3esp1LgFlllx3tUSJt3cIwc7+VZkinY2uR/2jb1pU8J2E7EWjgEu39R+CRhBEQyZ196RHbmu
	ENQ7Vy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEMG-00000002ZoO-4BaO;
	Wed, 26 Aug 2026 14:12:05 +0000
Received: from relay.yourmailgateway.de ([188.68.63.102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEMD-00000002Znj-0qQe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 14:12:03 +0000
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hVRRG4WWdz6Crs;
	Wed, 26 Aug 2026 16:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787753514;
	bh=LR3sXZyv9BZpKnMkFqGg2COPCZoeIEfg8/rVtySW0wE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lUN82dPnB7XbbKExuk2IfwWOlfjroBdGo5tWmDybP9VKEpFd3dTDU+4qtsnyQR9V1
	 YRnKi0DZqM4KHr3BoFYpUnZNpECmbzEKg4Z7l6Fg/wEF4TFPSi+izmzbb3LYkS0Kvn
	 M+yjLrEshbs9oaD3qb7xxpOSBUTM00nYqnJOgjTyoHSGpRK91xLLBOaru9bIJyljPP
	 /muBx+gvJRUkk7sH6b7XD2T3gmQkZi5AQXLuRsQJ0wX6ajn034AnrC2r3w5bAB5YI9
	 fopo1FDc0WTrPoFKKl1eIbh9JGVz562H8C3LP+iq27X0i3bYn/At9SqjEldPPDf2cv
	 iRXoGX17wFVhg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hVRRG3mq0z4yTM;
	Wed, 26 Aug 2026 16:11:54 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hVRRD6yhQz8sch;
	Wed, 26 Aug 2026 16:11:52 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B2ADA5F992;
	Wed, 26 Aug 2026 16:11:47 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <04454db7-0779-4a7f-bab2-72fea3480dcf@leemhuis.info>
Date: Wed, 26 Aug 2026 16:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mainline/master: PCI link creation fails on Apalis
 iMX6
To: Francesco Dolcini <francesco@dolcini.it>,
 Leonardo Costa <leoreis.costa@gmail.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 bhelgaas@google.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, regressions@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, leonardo.costa@toradex.com
References: <bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57>
 <20260810211209.GB4821@francesco-nb>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260810211209.GB4821@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178775350852.4133069.1765088279857940281@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: B2ADA5F992
X-NC-CID: G3r5K1/Ois168fF789GTTufWvzg9G612mk5/qbx22u4FQm275A0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_071201_819776_6A2BEACC 
X-CRM114-Status: GOOD (  12.19  )
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

On 8/10/26 23:12, Francesco Dolcini wrote:
> On Mon, Aug 10, 2026 at 02:54:45PM -0300, Leonardo Costa wrote:
>> We are seeing a regression on Apalis iMX6 where connected PCI device
>> links fail to come up at initialization, as shown below. The issue is
>> not on the devices' physical connection, as they worked properly on v7.1
>> and are working on other stable kernel versions.
> 
> just to make this more clear.
> 
> 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> introduced a regression that prevented the boot. because of that we were
> not able to run any of our test in our CI/CD
> 
> commit 7678e81498e2 ("PCI: imx6: Fix i.MX6Q/DL boot hang caused by improper PHY power sequencing")
> fixes the boot issue, but now PCIe is not longer working
Just wondering: what the status of this regression? I feel a bit lost here.

It looks like people were really keen on getting this resolved for 7.2
-- even multiple revert were considered, but not performed in the end
(not judging here, just mentioning it). Three days after the quoted mail
(and thus even before 7.2 was out) Richard Zhu posted a fix afaics:

https://lore.kernel.org/all/20260813095003.356062-1-hongxing.zhu@oss.nxp.com/

But that still sits on the list and did not even receive a tested-by. Is
it not that urgent anymore for some reason I cannot see? Are developers
waiting for test-results from affected people? Or did this fall through
the cracks?

Ciao, Thorsten

