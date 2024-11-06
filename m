Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF135D44D49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2GnrRLzEQWBzWLerKnfiSOA6ExofjYeg2htogKadB8=; b=tcpaK+cNvGVmpR1xpL9fFgZMH2
	Dno3NfHFQG1Ib1XdTRezlzT9EQkM8scIpGFnp+lugAUwbjrXalGtipybx3qS1XIEvD58dmmdmkLHp
	IeSgLU22GqBffQarjgSuAVegwa4n4UQNVn8BUEsvgyjA2mEwdOBuL2Mxl8RlLfg239I898XvJ354u
	1bQ2N6vgY5lgkk/z8ex3axmWZ1ylE4ByXt+uCa3mQoo7gJsVvr7/LBt8BgfwymySe7/nBDmXCZGTE
	O8z/AMs1IvRwFzYD4LrTeTO3hy0w4sX8tiT14kF4cLInVqU+WP2jBLgxAqYMpaOBeS+U1mGYa6mKY
	/+yQRWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dTM-00000002mHx-0jrb;
	Wed, 06 Nov 2024 10:41:12 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cl1-00000002din-2Irk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:55:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xk0rx1sg5z1jxjs;
	Wed,  6 Nov 2024 17:53:37 +0800 (CST)
Received: from kwepemd200013.china.huawei.com (unknown [7.221.188.133])
	by mail.maildlp.com (Postfix) with ESMTPS id 198391A0188;
	Wed,  6 Nov 2024 17:55:18 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemd200013.china.huawei.com (7.221.188.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 6 Nov 2024 17:55:17 +0800
Message-ID: <3d166642-4062-42ed-9e24-1771cd819110@huawei.com>
Date: Wed, 6 Nov 2024 17:55:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: uprobes: Optimize cache flushes for xol slot
From: "Liao, Chang" <liaochang1@huawei.com>
To: <mhiramat@kernel.org>, <oleg@redhat.com>, <peterz@infradead.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20240919121719.2148361-1-liaochang1@huawei.com>
In-Reply-To: <20240919121719.2148361-1-liaochang1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200013.china.huawei.com (7.221.188.133)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_015523_807870_2B91E7E6 
X-CRM114-Status: UNSURE (   6.62  )
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

Hi, Will and Catalin

在 2024/9/19 20:17, Liao Chang 写道:
> On 09/23, Will Deacon wrote:
>> However, we should use __GFP_ZERO anyway
>> because I don't think it's a good idea to map an uninitialised page into
>> userspace.
> Agreed, and imo this even needs a separate "fix info leak" patch.
> 
> Oleg.

Given that Oleg's fix info leak patch has been merged [1], the risk of leakage
is gone. So I am looking forward to your options about this patch. As many
functions start with same instructions like 'stp fp, lr, [sp, #imm]' or
'paciasp'. So I think this patch could avoid unnecessary D/I cache synchronization.

[1] https://lore.kernel.org/all/20240929162047.GA12611@redhat.com/

-- 
BR
Liao, Chang


