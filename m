Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A781D65C58
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l951S4IYbydSxanTEwIpdoBDufR3qPn1Xqk5u0bjTOM=; b=XE5uA/J5sMIMJBEquUmKnk37wi
	K5wij1tFyVrDz/qIhuMbJkosu0lDIEs8iO2oBcm4vllsWHAo3lWp2gHhQk2znxlTkfCtW1m7/8DkE
	hHq0Z8piNj60ov/uWshFYNOgmUylyl6yWm6y7FU/6ODzT1k1WtFhKkf7mlk8HkHqRyqd9J5PgIV9s
	9e75BlI4n1yFU+L6cTcUb+JbilUO+NEi6Z26VGkNl1zvBF110t4Tp2IBMfn1lN5kyjJSrWYhBoje9
	SgCC14juhUFOwxsGwguSKfUNrMUySG/5CPmkQeydCECC4s6BevfEDjrWiBy+68C0K+/Krym/W4CQ2
	zEsxyRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUTv-000000096Z7-2JeA;
	Thu, 14 Nov 2024 07:41:35 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBURY-000000096IQ-2CAc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 07:39:10 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XpsTw45yvz9sSX;
	Thu, 14 Nov 2024 08:39:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJoK55fB28wk; Thu, 14 Nov 2024 08:39:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XpsTw3MBWz9sSV;
	Thu, 14 Nov 2024 08:39:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 63BAB8B7A0;
	Thu, 14 Nov 2024 08:39:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id AypRQ-2jg_wh; Thu, 14 Nov 2024 08:39:00 +0100 (CET)
Received: from [192.168.232.55] (unknown [192.168.232.55])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 283798B763;
	Thu, 14 Nov 2024 08:39:00 +0100 (CET)
Message-ID: <b22fb30d-96a5-4455-a0f6-0d7fe564cfa3@csgroup.eu>
Date: Thu, 14 Nov 2024 08:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v2] soc/fsl/qbman: make use of the helper function
 kthread_run_on_cpu()
To: Hongbo Li <lihongbo22@huawei.com>,
 Frederic Weisbecker <frederic@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20240904022633.2079803-1-lihongbo22@huawei.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240904022633.2079803-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_233908_757399_EEAA58DA 
X-CRM114-Status: UNSURE (   5.37  )
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

Hi,

Le 04/09/2024 à 04:26, Hongbo Li a écrit :
> Replace kthread_create/kthread_bind/wake_up_process() with
> kthread_run_on_cpu() to simplify the code.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

A similar change is proposed as part of a larger series, see patch 7 in 
that series 
https://lore.kernel.org/lkml/20241112142248.20503-1-frederic@kernel.org/

I prefer to leave this patch aside and not interfere with Frederic's work.

Christophe

