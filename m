Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4EBCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 01:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEt2zGmZj6lPzbXEb1Zf3HAtidB4DnYkLZze/rH/nlc=; b=TmoSaueSX5cI2bmBD4Z6Q7ISyT
	4xxim/GnuVCmzgToYGDir6NTWHuHWyfAkUPCnOSyTKv1Nk+gxIz5be10Z46M1zgLFQyKcN9kh2F2U
	3j4MpB5x+Ojoi/79umysKN8wxfeSrtmQ5W9P/yePV9riUTiH16V16kyPorqAnbkz+iCWXgFA11iva
	R6rmJYfbrg/5sS3XofGKV+URqggpHhz/J+KXx14qfwIwd/ii1xvMb8MW5yUZaoP/EVI2g5CbKVvm+
	RO7FL7SAlesLjxv97AVvu9obqI+upoCGwdY5xyf0hW2x+uTVkAVSUztbYLhvzOFHOYsubE100Dk7z
	JKIqtYjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBNl5-000000019Xf-3sv3;
	Wed, 22 Oct 2025 01:35:24 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBNl0-000000019Us-2MRf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 01:35:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IEt2zGmZj6lPzbXEb1Zf3HAtidB4DnYkLZze/rH/nlc=;
	b=EHecl6k1H8ZMxAvgF1e3uN3F3lo3vLhujVmGVHcbENeT7kf79Tv5AeWjmNmrlinBpqNfA7hYW
	N6s26ZZ6lxB/jMKn9ivWsUytuLYjxzDEaX4zmbKnyPhkB8MRCzq1WwJzegSI+fBgMZ4NSb0IKQr
	LJz7iSrzS0Ctz2Xvr/Ilhig=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4crsC7502lz1T4Fg;
	Wed, 22 Oct 2025 09:34:11 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A79818006C;
	Wed, 22 Oct 2025 09:35:05 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Oct 2025 09:35:05 +0800
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemq200011.china.huawei.com (7.202.195.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Oct 2025 09:35:04 +0800
Message-ID: <a3663aaf-14c9-4601-90e2-49650af90d7a@huawei.com>
Date: Wed, 22 Oct 2025 09:35:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Add kernel parameter to disable trap EL0 accesses
 to IMPDEF regs
To: Marc Zyngier <maz@kernel.org>
CC: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<pawan.kumar.gupta@linux.intel.com>, <mingo@kernel.org>, <bp@alien8.de>,
	<kees@kernel.org>, <arnd@arndb.de>, <fvdl@google.com>, <broonie@kernel.org>,
	<oliver.upton@linux.dev>, <yeoreum.yun@arm.com>, <james.morse@arm.com>,
	<ardb@kernel.org>, <hardevsinh.palaniya@siliconsignals.io>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20251021115428.557084-1-liaochang1@huawei.com>
 <86ecqwwig3.wl-maz@kernel.org>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <86ecqwwig3.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_183518_775449_68BDC4B5 
X-CRM114-Status: GOOD (  12.46  )
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

在 2025/10/21 20:25, Marc Zyngier 写道:
> On Tue, 21 Oct 2025 12:54:28 +0100,
> Liao Chang <liaochang1@huawei.com> wrote:
>>
>> Add kernel parameter to allow system-wide EL0 access to IMPDEF system
>> regregisters and instructions without trapping to EL1/EL2. Since trap
>> overhead will compromises benefits, and it's even worse in
>> virtualization on CPU where certain IMPDEF registers and instructions
>> are designed for EL0 performance use.
> 
> Since you mention virtualisation, I want to be clear: there is no way
> I will consider anything like this for KVM. KVM will always trap and
> UNDEF such register accesses, no matter where they come from (EL0 or
> EL1).
> 
> Allowing such registers to be accessed from within a guest would make
> it impossible to context-switch or save/restore the guest correctly.

You've got that right, it seems like both the guest and the host would
need to save and restore those IMDDEF registers with the VM or task
context.The only exception would be if the registers aren't for saving
state or configuration, but instead just act as an interface to trigger
a special CPU function, such as ICC_IAR1.

BR,
Liao, Chang

> 
> You can of course do what you want in your downstream kernel or your
> own hypervisor, but I wanted to set the expectations on the upstream
> side.
> 
> 	M.
> 


