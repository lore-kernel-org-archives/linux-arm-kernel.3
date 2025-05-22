Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BD6C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 13:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uti3eTqinScyc55Ndt9/p1VEfowRAll3r6Zd6ZSjxig=; b=GeBt1QwU1DQOQ4Ln0+dkwN5MCD
	ul9/Khqitp7+TZMU7GNzxWz4vuo2E7WBfhcNxK109izpbcvGK5zRu2sh+X9DlKZDrTGN0XDgTZwml
	3svbtb/CDfArGyr4j27GLNP172LLfsCWM2ND7BCCyu1XEhMVTmOS+9+HPAyaQ6zoZ4yPyBJyQZXCS
	DmtrdSWSiUmUSkDKjjdKt4Tg1XK2+BxFcLOtMBygdztt0XiJLHjDB9LbK/8lIXvbJDkySFuw0NA8r
	qZOAR4SUY3WcT5xsoFFTx9+Oth61px5I2G+2AE/COYwJO9L5K7TfL8qquAaX8gV8UEyKBHndBEdkJ
	Jowz+4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI69F-000000018nD-0fwL;
	Thu, 22 May 2025 13:39:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI679-000000018Mq-0cr1;
	Thu, 22 May 2025 13:37:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B5FC5C49A2;
	Thu, 22 May 2025 13:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96093C4CEE4;
	Thu, 22 May 2025 13:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747921058;
	bh=xgvDD8ANcZWr7OKpt36kQ4qPO0NpYVOorGuzFibhgUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ro2bnwlyDybSKkER1vd0NxNkUFOExxdructoa9s9gDa1M/gr9xKxMBzI2MrEPfSeZ
	 Nls37IGt0Miv5R5awEE/Wrk/dR3Gnh9g3d9qbp9URVmNIvZEcaMTG5WlGqJ0LqV90c
	 Ziy29SWmGSWMqH16AM2QXYodX+2IenvAfQPm2QjJam3b8QaQvOiLI4jXCPPzjawANu
	 qZzsPmDjtoOkX9egXtklqGGcqJruHnv+tZqjKHiSfhDGe9Si0mXxRqeGk1XeA7JCy0
	 y91wgYg2Qwv+BpVW715/oiIBHsdT9dBJU/oJOZs5F+Hh53jzpFv7H6rGqM+Z3vSfGO
	 raQaZH16WJftQ==
Date: Thu, 22 May 2025 14:37:33 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/4] net: airoha: Do not store hfwd
 references in airoha_qdma struct
Message-ID: <20250522133733.GC365796@horms.kernel.org>
References: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
 <20250521-airopha-desc-sram-v3-2-a6e9b085b4f0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-airopha-desc-sram-v3-2-a6e9b085b4f0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_063739_228205_DBDBB134 
X-CRM114-Status: UNSURE (   8.34  )
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

On Wed, May 21, 2025 at 09:16:37AM +0200, Lorenzo Bianconi wrote:
> Since hfwd descriptor and buffer queues are allocated via
> dmam_alloc_coherent() we do not need to store their references
> in airoha_qdma struct. This patch does not introduce any logical changes,
> just code clean-up.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


