Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74D8CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06L5SCeiHyhtjlUSRZFcTn8L92AVzkUKBwCUzeMt7cU=; b=hrI0kMiOh/VkcxVKZEs2p1JTk8
	0tvEdaxUbNwY5ql8HUcGXxHFe6xbru9e9PCWur4wlQVFBn+KlRXEnuMEMuaWnoBmuF72TbFt2CTxt
	cCUuRj3Kdos8CAdMG6h2U0z0jMWy4rj46fqE/zlEPz852Iqs/GzmSOSMorlZMxm6O3SZFfRtLZkeN
	n5u5acGM4EcXr2nkVtcv2ZzjGTaQMVI2wsn0jeWpKOEooZEND2Dlh0ynOdUs05FLFPJZ8lqaNASIs
	oYLuGcadeQNW00aGwPV45UX6OBRCL97MBNh1R4wrojkHgBj7yF+gb0S2HZJnt+pXiiJ59ahjchw+/
	4DD0KKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtBE-00000002Enj-3ozl;
	Tue, 26 May 2026 14:54:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtBB-00000002Emc-1iGN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:54:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B902140194;
	Tue, 26 May 2026 14:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F8E1F000E9;
	Tue, 26 May 2026 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807288;
	bh=06L5SCeiHyhtjlUSRZFcTn8L92AVzkUKBwCUzeMt7cU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DeJM3QJJJrDqxLmlk1PZ+7gd9k1/0xWciaHngJWKxIi5no0Z8FcDcTFc/pwgwHLwG
	 T2nKJAqIPgq17WLjhaC+VcVccqcWDggbp+7nuxa1r2Ri4R2ARfLih66jmVTGjqK5jc
	 yQkS/uvquBkMlDLDUNnCwv0YlZYCNd3rCr9nGgYRYXvBdcTi2PdgUZI07nRjWULw4O
	 JjcJptD/ucpDlxQb7NIaxaGC/U2UlV1NvzoiCE/IeovQGSpvR+wXa2bdG9m4+eWOGA
	 HH7c0md8duEukRI/08LbmYfnST0BSLG0f4o3p3UnLZEbduEjGedpzNDDJ6ipVDSKeV
	 cuaIULTgYXIVg==
Message-ID: <6e123037-e677-4f6a-95cf-a065c646a602@kernel.org>
Date: Tue, 26 May 2026 09:54:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ARM: socfpga: Fix OF node refcount leak in SMP setup
Content-Language: en-US
To: Yuho Choi <dbgh9129@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260525024709.1336252-1-dbgh9129@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260525024709.1336252-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_075449_474737_DBA029E9 
X-CRM114-Status: GOOD (  10.16  )
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

Hi Yuho,

On 5/24/26 21:47, Yuho Choi wrote:
> socfpga_smp_prepare_cpus() looks up the Cortex-A9 SCU node with
> of_find_compatible_node(), which returns a node reference that must be
> released with of_node_put().
> 
> The function maps the SCU registers and then returns without dropping
> that reference, leaking the node on both the success path and the
> of_iomap() failure path.
> 
> Drop the reference once the mapping attempt is complete. The returned
> MMIO mapping does not depend on keeping the device node reference held.
> 
> Fixes: 122694a0c712 ("ARM: socfpga: use of_iomap to map the SCU")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>

I'll add "Cc: stable@vger.kernel.org" here, but please remember to add 
this for future patches that have the Fixes tag.

Thanks,

Dinh


