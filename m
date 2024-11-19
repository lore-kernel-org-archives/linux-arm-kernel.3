Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD6FD6C2B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 23:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txvjGg/xDtaIUmdcEWY1LrlQC+N7Iwaw7oIJUyV0+DA=; b=0U8p6RUEozXLvAttqfCzk1njxV
	LWofoDYVRaMsu8AwQ/FpZi4Tr4iX8+KW6/p28DpsqnTZHz3p9nXOFKQnct0tC6hWA947SC9VHU+DD
	sjZIg89YMeMLuJ0Zio2Df5/Lm5V3MGidrvni4ymwfjm2A+Ou/T9yadx33nAZIuxLmVMOOszwr9Fa3
	FaPqW1PIzx3KSO1HGlimaQinYm9YpO2cNJveiyqidnJBNUodN2dlRcBtb78kYwzzS69o/R2CXoiFd
	N0rAnlu2VktMos2We88bHsB/spFYchqPgx58iatvbpz7y4RJ2ygRFDwFUH5v+TnK1gaRGtrfe7hfQ
	7QtoB08Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDXxc-0000000E09h-0Tcp;
	Tue, 19 Nov 2024 23:48:44 +0000
Received: from out-176.mta0.migadu.com ([91.218.175.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDXwf-0000000E03Z-0sd2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 23:47:47 +0000
Date: Tue, 19 Nov 2024 15:47:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732060061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=txvjGg/xDtaIUmdcEWY1LrlQC+N7Iwaw7oIJUyV0+DA=;
	b=oIQ2Syfljioi3BHubscZHs/uSHZwesPTCLkDzX08O/Ej37eWZeoNwd+BSfau0HQ1C3AF4O
	5Q4RUv3yN+4x6r46H4Sth8+k8fflCloOH0qSDqnv5eBderG5I+RFGpslucCeuDfPiJpxrN
	CK8H0zKHUWfptj1M4PE3AQIV045FAcY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/4] KVM: arm64: vgic: Collection of fixes for 6.13
Message-ID: <Zz0jibnQ5v_Pkl47@linux.dev>
References: <20241117165757.247686-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117165757.247686-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_154746_036756_71C1E694 
X-CRM114-Status: GOOD (  13.29  )
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

On Sun, Nov 17, 2024 at 04:57:53PM +0000, Marc Zyngier wrote:
> This is a more or less random collection of vgic fixes, addressing
> issues ranging from "purely cosmetic" all the way to "pretty annoying"
> (of which patch #1 is an example).
> 
> The general theme is around the tightening of the internal API in
> order to make it a bit more difficult to get things wrong, something
> that I'm particularly good at. There is a bit more I'd like to do on
> the ITS, but I'm testing the waters here.
> 
> Patches on top of kvmarm-6.13, tested on the funky x1e box.

I'm quite happy with the look of these patches. FYI I'll start picking
up fixes in a few days.

-- 
Thanks,
Oliver

