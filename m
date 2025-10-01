Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D341CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcxuMsvHxdt1GuBSac3BK5wxqvpy0n3MyPF+GF+2ZL0=; b=ie0MfLU18VrhJi6cZOltMbeKFR
	5ZVvqn3xWCnkzttZ9Sd9RCc37vp4ZSWyfMWxLwCjWbbv7HHIoq37CFRFVR1EeNtKLV9+W3H8NJFCM
	fe1R4YZupvqglnzVxP8vG8edv+vGZHl0gyIjljZWw10q7h6kaI2NKJxVt6sbfjNS39hgmOhTBj1jm
	e0vWdbn95O8jdNmjr/pVp+w0OM9XnEbm5/IobwM9yeHoORamhEKz1Kk15x86pEirz8JGl4ULlHhYu
	4EjTE4GAjLXjge+teOmedQAOPmDC7Fw2mhKSilRm5DzeVXV8IFBhRVcCgKlnDM8JbO2TTkIm1gUwS
	03Qeq27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v65-00000007P68-1bpO;
	Wed, 01 Oct 2025 11:34:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v63-00000007P4m-0Gpg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318449;
	bh=Q2Q12qT4e1anQPRDSKmIVi1PJqAH4mr3j7v6hwedv0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dCy/x7KfT7QwAb1G/p3lPVCLZGeyGKm8lI514+VKyZDQs0cga52+d5T6GC/aNulX6
	 4ofOmXqtuNEnt+I94N1jVsI/oL/x0GB/1OOj2t10ske12ualkDgm3S8gCTTRd5larI
	 5pf7BHCK4Gh0ayA/zvkd9wW90NmkGSo6hiPfwt9eVUeasQVHhcOJm/w2bQqXrXOCe8
	 ac1IXoeVn9inujFHwORSOsmkBvdS1ET+uix/KXWeur0Xfc+Sz/SuGfKqGLnGKvVLWf
	 fvAv6uuVIFsnyDLmPIStxKkAsalDdn4N3hKxgFNnCpgA5cAFjweaGO+CjPbe+n+uMy
	 76myzOK9EFdNQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B2EB017E12DA;
	Wed,  1 Oct 2025 13:34:08 +0200 (CEST)
Message-ID: <34e2b620-f540-4fe7-a68f-0aaa87bacf2b@collabora.com>
Date: Wed, 1 Oct 2025 13:34:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 10/13] spi: airoha: reduce the number of
 modification of REG_SPI_NFI_CNFG and REG_SPI_NFI_SECCUS_SIZE registers
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
 <20250930022658.1485767-11-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250930022658.1485767-11-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_043411_281993_EDABF88C 
X-CRM114-Status: UNSURE (   7.47  )
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

Il 30/09/25 04:26, Mikhail Kshevetskiy ha scritto:
> This just reduce the number of modification of REG_SPI_NFI_CNFG and
> REG_SPI_NFI_SECCUS_SIZE registers during dirmap operation.
> 
> This patch is a necessary step to avoid reading flash page settings
> from SNFI registers during driver startup.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



