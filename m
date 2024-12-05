Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985DDE77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95J/4I16ZOfi0aNqPQOHwFzFZR3fi4JmEZHj/JIo1Ys=; b=jRtk9JAg9jjun+vCNNferdiap8
	vmoXFLx2uf6RH1dfBun6Iqox8gfYyzEy9+InYdDqq/Ue81d3od7XKfyrgY/EHDI9SP+SD8npgjQ6q
	m6MXjY6Jd04LtuUuv+5N5sHqECo2M+W9Z2CWTsYB/Walbja5jZYNb0JrR33dRS/DB00PO3v9BdcUS
	vHusHtN6yCjQa+uHxkno6XDdRp726xQjH14ElDsKQfuoB/l/P7+e5dqJI70aKUKiZip4zdK28MZop
	zFO/3noADb4Ki7igsQsj4xg/A0hDtfxq4WV27J+Lb7l8MKR14SYr7B0HLVVRNRi2vIORbz8dfds1R
	+nGNZYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Eh-0000000EzVZ-00Gy;
	Thu, 05 Dec 2024 07:25:19 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Df-0000000EzK3-0fMt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1733383449; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=95J/4I16ZOfi0aNqPQOHwFzFZR3fi4JmEZHj/JIo1Ys=;
	b=fHSNTHA/S3ReYWsOBlpZyhvvLZA9N+5BIZ5F5UKU3vOui4RbZ7wWodTgk6xel7N00VYDpUOVZKsLycBGNCFOz6paU5adgqZF/KCcJ0xOSYu/JME5tDoNCMD2JS+Q9fMRzlzXQ3aFUQFD/ttv2FdctZOE1K3OEFxiTHuQoowv4EM=
Received: from 30.74.128.237(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WKsWPiz_1733383445 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Dec 2024 15:24:06 +0800
Message-ID: <412549fa-ca7a-42a1-9fad-85d3dcd14b79@linux.alibaba.com>
Date: Thu, 5 Dec 2024 15:24:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] perf/dwc_pcie: Fix the swapped event numbers as well
 as the documentation
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 Jing Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_232415_671542_07C1E22E 
X-CRM114-Status: UNSURE (   9.63  )
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



在 2024/12/5 14:19, Ilkka Koskinen 写道:
> According to the versions of Designware Cores PCI Express Controller Databook
> I found, the eventid for "L1 aux" is 0x08 and "TX L0s and RX L0S" is 0x09.
> 
> Shuai and Jing, could you verify that your document matches ours and the events
> are indeed swapped in the driver at the moment?

Yep, it is a typo.

> 
> Cheers, Ilkka

Thanks for the fixes :)

Best Regards,
Shuai

> 
> 
> 
> Ilkka Koskinen (2):
>    perf/dwc_pcie: Fix the event numbers
>    Documentation: dwc_pcie_pmu: Fix the mnemonics and eventid
> 
>   Documentation/admin-guide/perf/dwc_pcie_pmu.rst | 6 +++---
>   drivers/perf/dwc_pcie_pmu.c                     | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 


