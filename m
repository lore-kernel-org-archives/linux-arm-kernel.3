Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9254D597AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 21:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSWFFVrhqf/uEWA5kxeVnqIffQKLBFsrKHLm4H10upk=; b=YBwyuID/RGWrwPmSEKcbLSePQI
	iMtLuqorNHcCxIM51wBzpvtn2drh9nnLrhnh6H1mMMtNnLs4VUhP+izZ39b2CSzch7b+lpexGuua0
	ils5WYvMYjk0K4rFW9BVsxb+mNxpOSLReWlrYW5gV4RbJ6rJ9XdJaZ9Zjf/AXD4E2bc0Z/lwJ9aGA
	+pWLBMYJ0XXnIz+gpugh1L7uC0LDDUeQc26f6Sba+BLzHsDmJQTflaKS4mJf+cy3A7SYb1UVnkyX5
	6KD4sH2KfP4jrhGxhBPLh6esW/snZJ0sjoCa/uvKxEWgv2iqVctp6gHp+jalNpvRJDJ2e1dYE0oCA
	5wgBW2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAyrO-000000054i7-1O0k;
	Tue, 12 Nov 2024 21:55:42 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAypa-000000054Sx-1cOk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 21:53:51 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5C666894AF;
	Tue, 12 Nov 2024 22:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731448426;
	bh=vSWFFVrhqf/uEWA5kxeVnqIffQKLBFsrKHLm4H10upk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DYhbbW9bP3SG0q5TSaVFXxoc66aesxy6lKisoicD889CMEzntYV2HAJwBtkqIxBu5
	 GdrsmlQQTI8X2SlErW6lR4Ne3nfl/fsSWSgNVP2lZiXS19pEKSGTC823RD6Eqvd7SP
	 tHnDpEBr6+2H1UTQygKxVTPUUszq+DY+xpUfO++9iHX0Ltsht8CAqwIZ/gCw82unXv
	 l6E/+am0zNZrPct3vBEUtHiG1U2KjGOnlxubjt1rL0/3dcREOpiljBmBz0AKRjF8qe
	 lWfmJLdYCiFSeXHUHN3XrR9wpA/R+ulZ+d9YoViewlWeM3/8ZVKdfk6qy9V/yU/6wB
	 HxzxIK40mq8RQ==
Message-ID: <638cdca0-05ba-4b2b-8a92-3041247c2c7f@denx.de>
Date: Tue, 12 Nov 2024 21:00:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: zynqmp: Work around broken DT GPU node
To: "Gajjar, Parth" <parth.gajjar@amd.com>,
 "Sagar, Vishal" <vishal.sagar@amd.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 "Simek, Michal" <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>
References: <20241031170015.55243-1-marex@denx.de>
 <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
 <4ee8d8a5-ec00-4b11-a7bc-4137e1982218@denx.de>
 <SJ0PR12MB69656066F70FC40E4A5A93B499592@SJ0PR12MB6965.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <SJ0PR12MB69656066F70FC40E4A5A93B499592@SJ0PR12MB6965.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_135350_597214_ED53B581 
X-CRM114-Status: UNSURE (   9.69  )
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

On 11/12/24 2:17 PM, Gajjar, Parth wrote:
> Hi Marek,

Hello everyone,

> We tried running glmark2-es2-wayland application with mali and lima driver and didn’t observed any hang. We will also check with kmscube application.
> 
> Attaching logs for clock summary.
> 
> Did you try with mali or lima driver?

I only use lima driver.

Can you share full boot log of this machine , including the firmware 
blob versions ? Is it maybe possible some newer blob(s) enable both PP0 
and PP1 internally to work around this clocking issue in Linux ?

-- 
Best regards,
Marek Vasut

