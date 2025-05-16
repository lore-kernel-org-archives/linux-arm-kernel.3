Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6EEC54756
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGN7z0e21T7dSbGplde5/HIUtjEEzTbReDm6+Lon+l8=; b=o9R3AzUi1faPW1mNwnW8PfTc+V
	bYwfXriPOWli8DLyoY/59iNfiwkCUhLPlsNVWFHnfmSLsBPjVOftAZxWO7f4wkQ6T5Njs6ifJMgx6
	606Kxle/Kjvc2pcbKGj4PJrl2y2CyFyQJAfxTmD1p9SUu1ha8YUkv9ZhqD51JMX17yByKAlt1FUYf
	pF1rxUS4w/YEj929eNyWcOG9cRlsLxe7NTEMilrsXAqVRjN+gr9v4TyHTM+2gWMo9AGL/BNiibXGB
	aEu86fHa+eRMCAlgSwoBEdiNelQEiewA2ExV79UCFGk9fYyefIISoOLMfki3V7GjLHrVEIRyw02y9
	ob44LUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxQ9-00000003v8l-2rzY;
	Fri, 16 May 2025 15:56:25 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwuX-00000003q6t-0eFc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:23:48 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id FwuQuoFNbNavUFwuQugVNx; Fri, 16 May 2025 17:23:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747409022;
	bh=YGN7z0e21T7dSbGplde5/HIUtjEEzTbReDm6+Lon+l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=GS289XTQHk3VLsLFpa5c/UYf4u4rEi+q4hXRXshv4vC+CJ9brrfk93Lotykr58NMQ
	 jGXUAgQbbN+gjZ9Z6LiZ0GOd236njwoO2GqxrsUIQYXYoM1QqDAJHibIBVdHh7LI6e
	 IZggX6xUeG4DUNGmjVt5lXFyT1O2NK08Rro/qv3nfVtDbDlvRKZ8DSHd+UBEXHWlAy
	 IUpsW9XBwhYgSfEPxTWPESR3vbmtQg8GJ7Xq5u1Xm7kAFzh/3jiqgIDraK26Efjcad
	 lMVnpMuPCOH/B3csNVHhzdGR0K6Pkhduem3L14lm7rEp2jgjkLajkru6YFV9S+XVAX
	 QxNKLpSDRsjAg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 16 May 2025 17:23:42 +0200
X-ME-IP: 90.11.132.44
Message-ID: <18ff08db-9d0a-40bb-b84d-785d25e2b8fc@wanadoo.fr>
Date: Fri, 16 May 2025 17:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
To: Cristian Marussi <cristian.marussi@arm.com>, long.yunjian@zte.com.cn
Cc: sudeep.holla@arm.com, peng.fan@nxp.com, justin.chen@broadcom.com,
 florian.fainelli@broadcom.com, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fang.yumeng@zte.com.cn, mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn,
 xu.lifeng1@zte.com.cn
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
 <aCXzPGvPayVyiMHG@pluto>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aCXzPGvPayVyiMHG@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_082346_399548_2C77B078 
X-CRM114-Status: GOOD (  15.55  )
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

Le 15/05/2025 à 15:59, Cristian Marussi a écrit :
> On Thu, May 15, 2025 at 08:38:55PM +0800, long.yunjian@zte.com.cn wrote:
>> From: Yumeng Fang <fang.yumeng@zte.com.cn>
>>
> 
> Hi,
> 
>> In the probe path, dev_err() can be replaced with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER and prints the
>> error name. It also sets the defer probe reason which can be
>> checked later through debugfs.
> 
> All true...but...if you look at the main scmi_probe() function all of these
> failures are trapped at that level currently on the return path...
> 
> see the call chain from
> 
> scmi_probe()
> 	....
> 	ret = scmi_channels_setup(info);
> 	...
> 
> ...so your probe errors will be overridden there with a more generic message
> left in debugfs at the top level.

This is only true only when -EPROBE_DEFER is returned.

In other cases, I think that we would get 2 messages. The specific one 
from scmi_channels_setup() and a generic one from scmi_probe().

in such a case, the one in scmi_channels_setup() will be better, because 
it will log the error code in a human readable format, which is not the 
case now.

So, I think that the patch:
   - simplify the code
   - improve the error messages in some cases

If -EPROBE_DEFER is returned, I think that the additional call would 
just but a harmless no-op.

CJ

> 
> Thanks,
> Cristian
> 
> 


