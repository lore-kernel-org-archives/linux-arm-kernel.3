Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FDAD3610E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAAwhDOLxYWmDbkqsvBzMfP0/SCCQYlDtQH8frb8PpE=; b=V8/BmmYJOU0UpPO1obucPySmcf
	ZDJVoiGOMlgmDrSndOfWhyZTLJ6tD+1tWiD4qKIktGoxEkcOUtidyMTxrWwrDjXNP5hknN97QXg6T
	smmZyKFZuMQHBpPmMfsUROrRiCEu9pssZdtd/HOfQyWS9yzjNL4/dA8Qbi7uu+hUiKzPiTg8VkLP8
	BJwu49GZeO1Lk6qIGpXe0jDUAKWkFsSl7gYEDh3WCrKrAYOS5KMml9BJBiVghc1QdQhTT1JTzKqsN
	lIB2fhh9iJcnyQBgbXYzQecJXd7qw7oSnSCufMI8+3cCq79QUk7bXtn7MsomLueBuoRhMmK6IpomH
	1YwZ83AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PVv-00000000b7F-0M83;
	Tue, 05 Nov 2024 19:46:55 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8POw-00000000Zop-11nZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1730835581;
	bh=ZhBK97FUhcgex1j6IeiZEKWkxD39UOOVk384iRdbxbY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ElRTCRTX2ZOePC1n9rfGgYkfPoKqQmb6yN39B01sF0MEfck2OyHjuFfkV7XnGCCzo
	 IdNdVbimwqeiR7rVECKoechA/ocmsGDAMfJEV7bV0ADjObkr12HAvdmTFsamvuejdp
	 qrWTksmRJTTSC22nWzUctzmnWBBAL6udTuMnfCgk=
Received: by gentwo.org (Postfix, from userid 1003)
	id 7D0DB409C6; Tue,  5 Nov 2024 11:39:41 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 7A3CC4026F;
	Tue,  5 Nov 2024 11:39:41 -0800 (PST)
Date: Tue, 5 Nov 2024 11:39:41 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Haris Okanovic <harisokn@amazon.com>
cc: ankur.a.arora@oracle.com, catalin.marinas@arm.com, 
    linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    pbonzini@redhat.com, wanpengli@tencent.com, vkuznets@redhat.com, 
    rafael@kernel.org, daniel.lezcano@linaro.org, peterz@infradead.org, 
    arnd@arndb.de, lenb@kernel.org, mark.rutland@arm.com, mtosatti@redhat.com, 
    sudeep.holla@arm.com, misono.tomohiro@fujitsu.com, maobibo@loongson.cn, 
    joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, 
    konrad.wilk@oracle.com
Subject: Re: [PATCH 2/5] arm64: add __READ_ONCE_EX()
In-Reply-To: <20241105183041.1531976-3-harisokn@amazon.com>
Message-ID: <901a1fff-a747-fc44-31a2-95141c7eb7a6@gentwo.org>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com> <20241105183041.1531976-1-harisokn@amazon.com> <20241105183041.1531976-3-harisokn@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_113942_359281_9FB770D9 
X-CRM114-Status: UNSURE (   6.17  )
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

On Tue, 5 Nov 2024, Haris Okanovic wrote:

> +#define __READ_ONCE_EX(x)						\

This is derived from READ_ONCE and named similarly so maybe it would
better be placed into rwonce.h?



