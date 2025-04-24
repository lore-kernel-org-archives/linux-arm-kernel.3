Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE36C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbkXLLMiBk0YrHxa0nSuY06ZZogYG6FMv64IFAM7UnQ=; b=r5KzJHXGaAEcomT496kgbywuL9
	BVuqVCuZGWv1taKRE6JFxd11r0X2vEX/CNWRXXwaGAK9qbOyLr4tS6C/Epx9TwGja6LvLJHGKrwZt
	CLcryTsaOtUhr/G8p+G5q8cJ2EpOCaIyLL7p+0s7XjocCwwm1bHTmHxUIR1FTrqe3STPD1671NC3r
	LmH4EDi2EfTAVG9pioVTiFHYsg3dLBvBu0WrBnr8QeteaDg2eAd6RCO5hFKH5PFRIZ3fPkkn1YCb7
	QSfmCng36Xde3FUzN1PwGUmIro5NgEhUCBvE2SwjOL7HbKwfD/b3UzjM6nNmaUyEM6cYSsgGPWPdp
	spPCmNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807b-0000000Er57-0s4x;
	Thu, 24 Apr 2025 17:12:23 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xBD-0000000EJNf-0Sim
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:03:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZjyQP6592z27hWM;
	Thu, 24 Apr 2025 22:04:29 +0800 (CST)
Received: from kwepemg200012.china.huawei.com (unknown [7.202.181.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 638BB1402CD;
	Thu, 24 Apr 2025 22:03:46 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemg200012.china.huawei.com (7.202.181.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Apr 2025 22:03:45 +0800
From: xieyuanbin1 <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <liaohua4@huawei.com>, <lincheng8@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nixiaoming@huawei.com>, <sfr@canb.auug.org.au>, <wangbing6@huawei.com>,
	<wangfangpeng1@huawei.com>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: RE: [PATCH] ARM: spectre-v2: fix unstable cpu get
Date: Thu, 24 Apr 2025 22:03:30 +0800
Message-ID: <20250424140330.42007-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aApBpnDcq2KNkfAs@shell.armlinux.org.uk>
References: <aApBpnDcq2KNkfAs@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.108.232]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemg200012.china.huawei.com (7.202.181.63)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_070355_376385_0B54C2B7 
X-CRM114-Status: GOOD (  10.67  )
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

From: Xie Yuanbin <xieyuanbin1@huawei.com>

>Consider your test program running on CPU 1 which requires fixup. It
>takes a fault, and before we enter harden_branch_predictor(), we end
>up being migrated to CPU 0, but doesn't require a switch of the MM.
>Let's say we then disable preemption and then call
>harden_branch_predictor(), and then restore the preemption state.
>The thread then gets migrated back to CPU 1. Again, no switch of
>the MM.

Your assumption is correct, and I agree with it.

>I don't care if this disrupts test tooling. The trade off between
>test tooling having a problem and a silent data leak through this
>channel... the answer is pretty obvious that the test tooling
>failing is less important than having a silent data leak.

I have never mentioned a test tool, and I agree with you.
The problem I mentioned before is possible illegal instruction and panic.



If we want to fix this problem without affecting performance,
can we add a new hook functions (in fsr-3level.c)?

I don't know much about the details of the ARM manual,
Are all user-mode access to kernel-mode addresses are `permission fault`
and common page faults (hot code) are `access flag fault`?
If so, we can add a new hook function to deal with `permission fault`
and set it in fsr-3level.c.
This means we fix the problem without adding a branch,
that there is no performance loss.

Otherwise, we can only add condition judgment before enabling irq,
which means that performance loss occurs. This is so sad. :(

