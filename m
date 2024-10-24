Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECCBCE8E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7HwCNyuL9Jhrwz5cj3lk7hIhMKnCQguwQsDKfb7b+E=; b=08eW3OtZkA+Yh1TbV+zh+eWxWN
	pRd3DzMdewO+Cjt8IvMrNsmYLQpo8QM9Wlx3g0wZjVz2ywUq6Awt3F98qB8gjZZyio6nb4xZPpP1Y
	l5A/3a1dTFTQu1Ri6zJtvhr2SzckSBnI+Yim4CQ+u+5LF4u4W0p/bL9OyZiJ1CVKF16kd8NCFmxMO
	Gx4fZSush4xUPMsERRQtH0Za8NSeu7L7+00/YrfhVuK8FBFPamCilT7/jyPhapToj9loZlejrun7t
	fdLgtWoRTHhzFXhtr9gilmDfABSh9aoieUNxuBFnEWgCPTFflrBjuqjuIXNL9Ta5nqqJiP4hJjpeO
	j6bRm38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3y1x-00000000YOe-1gj3;
	Thu, 24 Oct 2024 13:37:37 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xxy-00000000XL7-2Gpp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:33:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49ODX71e095658;
	Thu, 24 Oct 2024 08:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729776787;
	bh=D7HwCNyuL9Jhrwz5cj3lk7hIhMKnCQguwQsDKfb7b+E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GVX50f+R9KxL1K1v9jdi7uP/BZHBrF3l0nAL1zLSmSNeJ0B1zloneMzv7JXgZKQba
	 yUfE6wiymTgkXUGHCP7Xp/uX2IEsewTkStJmtfGvdec3NIL15YWg4qLD+lhsaoxZrX
	 FQs8A60qa7L2h7DLLbTBy5yaimg7fOyRv5ZSX8+s=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49ODX7JV043401;
	Thu, 24 Oct 2024 08:33:07 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 08:33:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 08:33:07 -0500
Received: from [10.249.129.69] ([10.249.129.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49ODX15L030296;
	Thu, 24 Oct 2024 08:33:02 -0500
Message-ID: <c735f62e-c9fc-4698-ae9f-305cd5519dbd@ti.com>
Date: Thu, 24 Oct 2024 19:03:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix 1 PPS sync
To: Meghana Malladi <m-malladi@ti.com>, <vigneshr@ti.com>, <horms@kernel.org>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <vadim.fedorenko@linux.dev>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20241024113140.973928-1-m-malladi@ti.com>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <20241024113140.973928-1-m-malladi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_063330_772043_8D151886 
X-CRM114-Status: UNSURE (   8.10  )
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

Hi Meghana,

On 10/24/2024 5:01 PM, Meghana Malladi wrote:
> The first PPS latch time needs to be calculated by the driver
> (in rounded off seconds) and configured as the start time
> offset for the cycle. After synchronizing two PTP clocks
> running as master/slave, missing this would cause master
> and slave to start immediately with some milliseconds
> drift which causes the PPS signal to never synchronize with
> the PTP master.
> 
> Fixes: 186734c15886 ("net: ti: icssg-prueth: add packet timestamping and ptp support")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>

Reviewed-by: MD Danish Anwar <danishanwar@ti.com>

-- 
Thanks and Regards,
Md Danish Anwar

