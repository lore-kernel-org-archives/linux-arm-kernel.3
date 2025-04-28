Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FF6C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 22:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqZsxRe5YN9EuISiamPnjxKWy6QshrLL8TJ8PdqwMXA=; b=rtkyP++57qY+LYE0MdwBWrGenP
	ExUwwzn3aPk7rN1jEkhA7fEpmeAjLmrtvSCKjfACnS2GjtuC77MeqPAEE1jB89C5adCu4eOK4OKWa
	K31Fyu97xGwLSIBgfLLNVWHs/YIMeCK/G/XowL6yU+BmVC/s1dWvpVWpDDozIIdaFvBBISQarvuTQ
	N1O454p5kAEdzu7y1C/ib9fHBw8AMOgK3yoFo47cutGqO4T7v6RlqXQLW82z17hC0+buNh+zU2DGU
	9YrcZBc2ohZywGgCiE3+IEk6SuNenpVRvkSx64tfPpiEPhLVzuWWcFtfSoOA9YSMSciSwcsmO2wmZ
	rnP0ZPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9XHA-00000007kdV-2eAJ;
	Mon, 28 Apr 2025 22:48:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9XDy-00000007kJV-03K4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 22:45:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBA035C5ECA;
	Mon, 28 Apr 2025 22:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986C3C4CEE4;
	Mon, 28 Apr 2025 22:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880316;
	bh=iEgcLTkDkFJOT7HlI3aSWIUb6zLNar111Rw+B+KVd0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKGA7d4I1Xv4lnO2QEvAFptiF/Bk8yCyZlzREFkxc8/ZbydV/Io4cKBOfsFiepgbx
	 faoR2VNi7zkUBoJk10MO/Cy+DPlgiJf7FQnBHCd9GwRokCO6HNBXQbFFhr65FUiFmc
	 Ipt4egabLR2vqhIJpvijiGY3y+5zCOUMlvVDnL2w8K1EyM6OSneipar6rwIBIpfLoh
	 35ITA8fTL4cG8OcFr5r1VIiZArG0GO2mf8LM1FVUQBBaql/FwO029E5PPjrIARsiUD
	 Rz990rOVpRtTaZxytBdzAqS8q3wpYYuBhgM+LS8juAwbkU0X1hvbS00qrq3xI/G00c
	 BPha6HbRhfIKg==
Date: Tue, 29 Apr 2025 00:45:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Apple/PASemi i2c error recovery fixes
Message-ID: <enap4curtpjaiazxpcsw3sk64aq2i7wqi3iwm6l2pfph5qduwj@gkagpeazcumg>
References: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_154518_098515_7EDF9CF2 
X-CRM114-Status: UNSURE (   5.58  )
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

Hi Sven,

> Hector Martin (3):
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Log bus reset causes
> 
> Sven Peter (1):
>       i2c: pasemi: Improve timeout handling

merged to i2c/i2c-host.

Thanks,
Andi

