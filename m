Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE29C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 13:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P49Q9WVq5qfnXQAFuTcELX5eDeiqBbINfBH27a+ra/g=; b=WnlD1RbQ7X6U/iQ/6eWM3iJZu6
	R3ZL33lD8XWRubkWIc+J+hRwPQ+Aif3STw9T8NIW9N9Iu6BHd3Ob5j3N9VO7ZgGKY6r+vxUqsjQ7h
	CpRT/35re5bY2tblCJjWnno+SkPhEYdAFROpUVVc+Rs68XIFguEPL26dgPM6rNO1xIbxj+RYihPV7
	h6H6GJ07LqNLnh9xMFnDf4wxvxtz5h9bPusXdunibzppetobRjUWIesbaWt+Pc7bcmXbN4IeSryEj
	QX0Pf2x9+mMZncE87GBTuHvSwvQ/hauRFcLt1cbEiWDSiD1Et5xHXniGjb7JgkGyEQOpRgNw9O408
	UhuTn3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI6BF-0000000196P-0bwT;
	Thu, 22 May 2025 13:41:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI67P-000000018RL-1p18;
	Thu, 22 May 2025 13:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D60D562A41;
	Thu, 22 May 2025 13:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AE3C4CEED;
	Thu, 22 May 2025 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747921074;
	bh=ev0arRRmbzjSG9o7W9ASomHCIPJ3iT09QMhMAO9W+Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=akPRekvw/K4j6AgtMeGXaP0Tz5yWJj9qSVCI6bwIMYqa+NAzgRM1GgdxYb0BPVJNc
	 dLgeMtQsTl1KbvhCJhvKg1bjC10xyOts+dLA9vlLxwGEP3Ak1/YJTPzTu8P55m6ngP
	 3xTfPOJ+xJ5IPn45kqSFgwJ5w+3GCucRJ/7jL1oi1TQ6n1+yKktBsizWKsNvjBmsaw
	 sEn4OwzXuYPWIkUQ27HPjqHSMyroBGIrGBNG76cHHNXvp/vECE/qipGwoNNpO7dP9a
	 cjc/o18hlrOyvDxfWk15IhzmkXFkBkWlgObMgjZaYWQWbph7aY9WcuVJaI4ZWVkRLU
	 DDw4TAdDxmxLw==
Date: Thu, 22 May 2025 14:37:50 +0100
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
Subject: Re: [PATCH net-next v3 3/4] net: airoha: Add the capability to
 allocate hwfd buffers via reserved-memory
Message-ID: <20250522133750.GD365796@horms.kernel.org>
References: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
 <20250521-airopha-desc-sram-v3-3-a6e9b085b4f0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-airopha-desc-sram-v3-3-a6e9b085b4f0@kernel.org>
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

On Wed, May 21, 2025 at 09:16:38AM +0200, Lorenzo Bianconi wrote:
> In some configurations QDMA blocks require a contiguous block of
> system memory for hwfd buffers queue. Introduce the capability to allocate
> hw buffers forwarding queue via the reserved-memory DTS property instead of
> running dmam_alloc_coherent().
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


