Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7361CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 18:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE52KGrgCtZ+VyZpOT6fUbWJKD3AmdItFb/k2R+Kr3c=; b=Yhj2iOqWpp+l1vwPf8FFZyG2W5
	9/bZ3O/nFhrhLSNRV+UEv/J5qy2QdmD58roMEFvV8B5/zWr8tiNom6AnvOYb5i0j5L987o79QhWjH
	HHN4zYSAmyo1J65Kz6f+L4J1Wy23IUs8M0PuO3rZAdVMoxgn9gktCFB0TwECZUuJERRTnyDIJlePb
	DLq5Wz+nME0iJJ40F+Q1/M1SFN579ZzyeSHmA8ZtOwfF7sifrqlQQu42ctx75GmlTYiZgj7y+/0De
	NrapSv7IQMAOaVk6H/C7jgHBo19+YfTct7w+1333C0O88kuXPUVpF07q7PhIwrX8adJMXp5vpXWgR
	HLhw8o0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfI3-00000006AgL-0UJA;
	Thu, 28 May 2026 18:17:07 +0000
Received: from relay.yourmailgateway.de ([185.244.194.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfI0-00000006Afu-14Ny
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 18:17:05 +0000
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gRF7c5vs3z92gv;
	Thu, 28 May 2026 20:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779992220;
	bh=XvHoutqyoCvvmHbt31I71MjafoJIIZtNHSPVtBcA8v8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fsc93otjfd0OcAJXZLmGXWIyrX7eR2rDBGgSEmjkDND35p571vc+ev0q4nCm98djW
	 iFU6u0sJ/wH5gXgQZa8rikVJD8+bMY+P9rdEAA5Ya0w9J+tFmYkJG/fhk8vjyVA/yb
	 FYkgdbs7fDyXqeqn04ZCDEoxhJXoNiZOxJQO2E+wU3fl8oexuwlubnRBgzcA7AQx8+
	 BODFYQdUQndmSOlHblKJwgvQnqPtUtS2jXCqIo9e+eqRk+QmSe+p3mVS+SWIPhQDnB
	 JQJ5xH+er4Wm16E6kAnj4KxvnwOrjdD8602QP2ahiDSqvWLiVDbEpMW49GKEPuN1q+
	 4TnSc7LzyWDZw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gRF7N36Vkz7ylg;
	Thu, 28 May 2026 20:16:48 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gRF7L2Mz3z8sZP;
	Thu, 28 May 2026 20:16:46 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 58E586173B;
	Thu, 28 May 2026 20:16:45 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <021fb6d9-fb2a-42ac-9e50-06471fa76383@leemhuis.info>
Date: Thu, 28 May 2026 20:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: imx8m: Fix match data lookup for soc device
To: Frank Li <Frank.li@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
 <177816879666.299775.3947960528231798400.b4-ty@nxp.com>
 <3cc57464-a10f-4b8c-9080-8d6f65a0d42f@leemhuis.info>
 <ahhxtz94pX9ujv25@lizhi-Precision-Tower-5810>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <ahhxtz94pX9ujv25@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177999220591.1352586.10954214462288242738@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 58E586173B
X-NC-CID: Sgv4i8IrLrGndGPNw8vK7slwLPYMtNLjy/L9JFtz4eDsqIYAq1I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_111704_559703_024A8E39 
X-CRM114-Status: GOOD (  16.92  )
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

[+Alexander +Francesco]

On 5/28/26 18:47, Frank Li wrote:
> On Thu, May 28, 2026 at 12:55:34PM +0200, Thorsten Leemhuis wrote:
>> On 5/7/26 17:46, Frank Li wrote:
>>>
>>> On Mon, 27 Apr 2026 09:01:48 +0800, Peng Fan (OSS) wrote:
>>>> The i.MX8M soc device is registered via platform_device_register_simple(),
>>>> so it is not associated with a Device Tree node and the imx8m_soc_driver
>>>> has no of_match_table.
>>>>
>>>> As a result, device_get_match_data() always returns NULL when probing
>>>> the soc device.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/1] soc: imx8m: Fix match data lookup for soc device
>>>       commit: 2c6821657ce3b3c85f92719ea81ec9f9ff27df11
>>
>> Just wondering: are you planning to sent this towards mainline this
>> cycle? The regression this fixes was introduced this cycle, so I guess
>> it's something that should be merged before -rc6, as that's when Linus
>> wants all known regression ideally fixed. But from the name of the
>> branch it sounds more like this is scheduled to be merged in the next
>> merge window (but I might easily mistaken there -- if I am: sorry!)
> 
> Thanks reminders. I intent to send for 7.1. But second look, not sure any
> big impact although it is regression.
> 
> commmit message have not show what impact.

Yup, there ideally should have been Link: tags to the problem reports,
as explained by our docs. At least if that patch fixes the problems
linked to below (looks like it, but I'm not totally sure):

> I checked code, look like only
> missed some soc informaiton. Let me know if I am wrong.

Alexander reported problems here:
https://lore.kernel.org/lkml/6593091.DvuYhMxLoT@steina-w/
That mentions a warning and problems with soc_id and serial_number

Francesco jumped in a little later:
https://lore.kernel.org/lkml/20260427064704.GA17710@francesco-nb/
This mentions "CAAM is not working"

Not sure what the impact is, but from the outside it looks a bit like
"better fix this now to ensure those problems never enter a proper release"

Ciao, Thorsten

