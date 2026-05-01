Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D6ECD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 01:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iH/p+QtR2LkX7EPSpsttq7TDnYDbp0jfIyCaRYZNvX4=; b=co/ey07++NDJiyxyPOUWMLarK/
	nEv/ZmqebSZfO11S2ibFujNUukvwQv0MrW4Ve6OFBZbEsuSKljuIhZv1dw/D1ASCvEhINHSmf1o4X
	0mBzzpWkumxxxS5bHgCHM3Kuu8q0LiPiPQV0GXt7vKDnSVCTqH2s0a4tsqMs0OsrBsyOg1qN/NgOM
	WB67lMi/cWs0+iEC5ZKFcrQWvtexbsgG/wZ/kBX8sCaydBc5NdzL2YHShkNdNxhGSijgTHv9ndAp5
	amPEjPqnAT/yg/n5geAIGhlrnCtECDMIHTg5ujKnh8oo61aTtWxzEuHfRIkDktCQ4jB9BS9kRjliZ
	nNwm5law==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIcPR-00000006CqO-3XUq;
	Fri, 01 May 2026 01:11:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIcPQ-00000006CqE-19zB;
	Fri, 01 May 2026 01:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EF3F60142;
	Fri,  1 May 2026 01:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B61C2BCB3;
	Fri,  1 May 2026 01:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777597871;
	bh=iH/p+QtR2LkX7EPSpsttq7TDnYDbp0jfIyCaRYZNvX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kjs1zysKsB5u7Ub6LZJvdV9NON1tf33hwhMQ7GdozOwBN+QXknDE1Wwy9vbibNOOs
	 t/xyBX7jJmN0uGNNj4oscsFZb+JVUp4ZSDf2tsDmxtPinpCoakaV2W9rlh/5AigPby
	 L3Oumpzq5ZSiZo0//SAWrAV17vh+udSPf7Tsjr+Ywt6FYKKT/vEtzbdcLqtPAIcz+t
	 xcXXKPCI5eaAhxpT22ulz8aJH88a/xuZlRqjQvX7J2q/WKM46Rj7HEbpa55FbmKAmd
	 FA+Ha2MjzPe3gzRpQo7ihrFSSwvGUdjCHxsjbtFQ2jgO/YwoazmJuPsYaJU0W74q/w
	 UGw1BRjVAjKNg==
Date: Thu, 30 Apr 2026 18:11:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: Introduce
 airoha_fe_get()/airoha_qdma_get() register read helpers
Message-ID: <20260430181109.68c65940@kernel.org>
In-Reply-To: <20260429-airoha_fe_get-airoha_qdma_get-v2-1-909e791f1dc0@kernel.org>
References: <20260429-airoha_fe_get-airoha_qdma_get-v2-1-909e791f1dc0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 29 Apr 2026 12:54:32 +0200 Lorenzo Bianconi wrote:
> Add airoha_fe_get() and airoha_qdma_get() as utility routines for reading
> a masked field from a specified register.
> This is a non-functional refactor, no logical changes are introduced to
> the existing codebase.

Doesn't apply AFAICT.
If this is because of the net -> net-next merge - please avoid posting
patches which will cause a conflict on merge.

