Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E81EC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHWfbX4ugQ9Wz5FG1B2S310zcMCLrWz2sj99+0Xivic=; b=i60hlGOrQlf99eowqSZRxmi2LU
	gNM/q8Vsl3Mmj09u/GKUurPQt2jF4Nka6TxDHpSw8xGLo3tNCGF7sa5OwQkcx3CxBiUp9xLxmhsww
	XODVaocXPlx5Qr5DZyffbhK1xXZ1Re30SNLXudNKO+G4zHG4EWgGRv7Xw7URYIxP6U4zt3NBeKFoy
	Y4M6pkSuELBXVnaYB24SW/6V6xFVLvp94utL3p2bLJoRVUsimrw8VPj9DwtjiUFCVnXTQJLDWV3vf
	ceco1uMxF0lY1fhbLvfJcgQFKM974CLYmGFzlHzIQiHnyRODYkfLzCAzWs6Nj/u3gPIlELECZKMHI
	bJ5xUPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzQN-000000097MH-2nJN;
	Mon, 19 May 2025 12:16:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzNJ-000000096hq-3R9c;
	Mon, 19 May 2025 12:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D081A4C8B5;
	Mon, 19 May 2025 12:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F2AC4CEE4;
	Mon, 19 May 2025 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747656824;
	bh=3O3BvXFkL0/xSTFEqW+BpY5Pwj+Qd/rdtZVU6OQMxto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gd06Ib3PDWHH2moEvq6vkVS0qSxaNfRGzNBhl8t9Z0HQiPs9CZfvZi5GlEC4H0Dhd
	 R46XsDF14LlLrqsCIySaNdXjFUrpNDgga401BUMSBQKAot4pfe5SA8Wq0Gfb2e0t9/
	 gt+osA9yQi0u8oR+weLu3H8j4mHdxEmw6Wlo4yBn3Co8pN2nYgx8EjR/tGJ9B/7cAU
	 pxM4GYibQiXoNmgzLCy01DES9+r0HPi7IK0+reROBpnnkzS6CGvriezaP8lyNKV7uX
	 9UR0OyuYz9KMKB3HK5vZKCaITvZBjoSDuF/zCV6pdnvPJFJ3NL3eJ9Mj8TroXVMVRA
	 R6bMIbfe68TZw==
Date: Mon, 19 May 2025 13:13:41 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/3] net: airoha: npu: Move memory allocation
 in airoha_npu_send_msg() caller
Message-ID: <20250519121341.GG365796@horms.kernel.org>
References: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
 <20250516-airoha-en7581-flowstats-v2-1-06d5fbf28984@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-airoha-en7581-flowstats-v2-1-06d5fbf28984@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051345_925038_4DBAFB7D 
X-CRM114-Status: UNSURE (   8.13  )
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

On Fri, May 16, 2025 at 09:59:59AM +0200, Lorenzo Bianconi wrote:
> Move ppe_mbox_data struct memory allocation from airoha_npu_send_msg
> routine to the caller one. This is a preliminary patch to enable wlan NPU
> offloading and flow counter stats support.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


