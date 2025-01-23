Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FBEC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kav0vywzNK/Lke8CSBltT7ORnmfq4aKEvc7LgdKS2FQ=; b=dk0bDVFT0LoUQQCIQee4jMIcdK
	RnMoM2mgOHS1VZZpF/aAU5jVty3x2WW5pzlobQni+0WRK7FKoLyCYW9CvfQPoe/bvRlx4r2Mfo8O9
	LIb5MeC4YHtCBU+h0OGShbUdY2JVnqELHBcraXgCUMNqOXtXEYr1ZfpIUyj1jfTQjTbqE7mQSXt7f
	zedNMLClFqjPLGnOmp+UbNmzgYLcEXczux87p7bZsLt3ywykbZ8ZjSlsoEWjj1HVBJlxw5Qh/5Ij0
	s/U2ZEqhMKnYsHyR6h/DKP8yMcwIlNnUzAhDz+isCF6FGIOz2UwihCH/mnNNZZzPwlXwl6SA5SQrY
	UlEzSe/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb4Xq-0000000DIig-0KSP;
	Thu, 23 Jan 2025 21:15:22 +0000
Received: from smtp-fw-9106.amazon.com ([207.171.188.206])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb4WX-0000000DIeA-0rOQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 21:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1737666842; x=1769202842;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kav0vywzNK/Lke8CSBltT7ORnmfq4aKEvc7LgdKS2FQ=;
  b=iZBAI/ciTqGRMjnoMtbvDa84M+GNEG/YefU60SfHqXwF2Rn0WIdW+dWF
   xfefLVJFRhWH+3R+LhDD04fKHXaloQebZIlcEA1YO8/kIlCIEwdkWv7Wx
   tWSsn5kGBXvoKiWsfTeIMaT+B7jRcb7DDgwLa1m6VVg687XA2fk9QzGWZ
   4=;
X-IronPort-AV: E=Sophos;i="6.13,229,1732579200"; 
   d="scan'208";a="793255573"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 21:13:53 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.43.254:7461]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.37.156:2525] with esmtp (Farcaster)
 id a043c6b0-f00c-497f-aa64-71da178f7873; Thu, 23 Jan 2025 21:13:52 +0000 (UTC)
X-Farcaster-Flow-ID: a043c6b0-f00c-497f-aa64-71da178f7873
Received: from EX19D003EUA004.ant.amazon.com (10.252.50.128) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 23 Jan 2025 21:13:52 +0000
Received: from [192.168.19.212] (10.1.212.15) by EX19D003EUA004.ant.amazon.com
 (10.252.50.128) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39; Thu, 23 Jan 2025
 21:13:48 +0000
Message-ID: <508f2d34-15e1-4c84-842c-ec34bcbdd4cb@amazon.de>
Date: Thu, 23 Jan 2025 22:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: proton-pack: Add Spectre-BSE mitigation for
 Cortex-A7{2,3,5}
To: James Morse <james.morse@arm.com>, <linux-arm-kernel@lists.infradead.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	<blakgeof@amazon.com>, <pjy@amazon.de>
References: <20250122174736.1560714-1-james.morse@arm.com>
Content-Language: en-US
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <20250122174736.1560714-1-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.1.212.15]
X-ClientProxiedBy: EX19D037UWC003.ant.amazon.com (10.13.139.231) To
 EX19D003EUA004.ant.amazon.com (10.252.50.128)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_131401_301458_6D35766C 
X-CRM114-Status: GOOD (  18.06  )
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

Hi again James,

> Spectre-BSE is a variant of Spectre-BHB that abuses a power-saving mode
> on some older cores to dodge the BHB mitigation applied to the branch predictor.
> 
> Only A72r0 actually needs anything doing - this is basically a bug in the
> published BHB mitigation sequence that was published for A72r0. This
> series moves A72r0 to use the WA1 firmware call for mitigation, and adds
> the necessary reporting parts for user-space to discover which parts of
> BHB/BSE are mitigated or vulnerable.
> 
> WA1 is used instead of WA3 which was new for BHB because we can't rely
> on hypervisors not to use the 'local' workaround, and for Spectre-BSE
> we don't need to worry about discovery via. (Which is why WA3 exists -
> for cores not vulnerable to the issue mititaged by WA1).
> 
> Arm's description of this vulnerability can be found here:
> https://developer.arm.com/Arm%20Security%20Center/Spectre-BSE
> 
> This series is based on arm64/for-next/core, and can be retrieved from:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=spectre_bse/v1
> 
> Backports of this version can also be found under spectre_bse/backports
> of the above repo.
> 
> Because this vulnerability is hard to expoit, but the cost of mitigating
> it is high - the mitigation is disabled by default. (see the last
> patch). To enable the mitigation, a command-line argument is needed:
> 'spectre_bse'.

I see that the patch to introduce this parameter is in the git series 
you linked above, but it is on top of the three patches in this series. 
Did you intend to send it as patch 4/4?

Best regards,
Bjoern

