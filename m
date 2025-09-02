Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96BDCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmRBdo9h3XnfPJXe6Cum7NDohBdItfjt0tPJoa+vooY=; b=iYaEKD2X5iu4oORP6DayJssEmI
	7PKw8htwWDXaTQGVxsQiMaJ6F3cuCfH9khLMh+CWVsH3pM+NH9YtUyfsppWpv2Lp1bM8vYK9qwYT2
	fLPXVMO31Ui6ULt5ONVjJyjV+YJh5np+yMryi8figUSxSCxzru9Q5KlTacPrFjmJVuCbivftHDNMR
	L5xgiyoW0gKXkkYwBS/jOiMBsO+p4y61cBuiGSswhlXW2zrWPCQBZZd4a1EuUTXl02rawHK9Kz+3j
	tMQCQ5CCggzfr4lGP9KExHGmYgV1Vj1Ie/Ue40AG8EIrduocdQOd7n/L3Ky/8LSrCf4oepWBCAQ0i
	mFxEgK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNGv-0000000GLnD-0pKK;
	Tue, 02 Sep 2025 09:25:49 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMfP-0000000G9wh-04Sm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756802801; x=1757407601; i=markus.elfring@web.de;
	bh=kmRBdo9h3XnfPJXe6Cum7NDohBdItfjt0tPJoa+vooY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rcumb9lZPj++pSJs1PeI2qC8O7Vqv40oSj9ccmvtupgmWPxiN9C5KNQ0RG/dKW8q
	 dxqiraeIkH7KRV3o9cNsAkKuEFOtdyzsUqgsNmpnmiJ/IOoX2O9/DqK4qxLCZNaKb
	 rbczPQqUwFqUNWmpdNrJnZ0luEokcCxc/Mc6GKOaKOZi1mnKJhDao8SeQPdp8sF1N
	 BaL8GbmylrMGFnwoNAwBSUNY1yHJG/M4vVMt9q/C2JkhLjCmUdGWQYlQHHFTblxBE
	 HkRG14tJZSndWyem6Aa9UoFz8zFTDcIBNN/+J9OXJ41I/bh8PanxGCc5dRbUxBxpo
	 IcygzOpJ3t1c9zJhCg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MODiX-1v97I93ROr-00NfzO; Tue, 02
 Sep 2025 10:46:40 +0200
Message-ID: <f4b706da-0e88-44a9-8207-2f5a32179cd5@web.de>
Date: Tue, 2 Sep 2025 10:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Miaoqian Lin <linmq006@gmail.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org, tony@atomide.com,
 LKML <linux-kernel@vger.kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Dave Gerlach <d-gerlach@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Santosh Shilimkar <ssantosh@kernel.org>
References: <20250902075943.2408832-1-linmq006@gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: pm33xx-core: ix device node reference leaks
 in amx3_idle_init
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250902075943.2408832-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8b8yigXoa2GdWdEXuDWWO22413hXKRYvLIl2vPs1B2c9s7nWFvX
 G1/B3BuGFLBEuaR0cg/pIw0YVnZuH9bpMgAp+gIXpFjfm06J5ya5SyZyy6oWrQ7YtimxZW8
 STD32GDeX0/tuv6pJabMw0M7stENkxOQZLCKwZHmhClZbVJhDd1ah4lksegWQLbUwWbpzUb
 8O3/6bk3kcM4ZbReB2D3A==
UI-OutboundReport: notjunk:1;M01:P0:FiM9O5fiJdU=;Cj4aE2Yr95HycH2UKPwyuVRdHmg 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_014703_396375_5B911B6F 
X-CRM114-Status: UNSURE (   5.32  )
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

> Add missing of_node_put() calls to release
> device node references obtained via of_parse_phandle().

You may occasionally put more than 55 characters into text lines
of such a change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc4#n638


How do you think about to increase the application of scope-based resource management?

Regards,
Markus

