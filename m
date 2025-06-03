Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2B7C61CE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 08:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VATFNIodnBQkjlIkjO0jfPQJjVdmzEaVcRBWapEF5+c=; b=m4d+USZYpcqnwtkFEbt7BaKYNV
	9qmqjNUHEQpqfmsH0nFt7r1O+IsECawj9Lc/4EGILMlMfMEZJII/cuPM5FZaEGbLNNAhPkxbJQmuM
	k0KdS6USBj4zjeLsXSMJaC3hG2FT3ZlMFnJ5GFstgzfjHuMJjF/tNZybvPwBqmhAA47ZgOg0UK3Tk
	85opsBNXbejmoW/OQPRPxsJ+tXWZ/fqxanV5zUeU2OO0BTC98l8f7GpahsETiHcEeuM6Kv0TF2RxL
	hbj+0khDbqE3GuU7cKjexcwxtQLY0gbCmBbjHoqXKxqkoJ180ny2zOR6gsjAkXW7FdeS6jA5DAJ+h
	YS6T8URA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMN7R-0000000AM8z-3T2s;
	Tue, 03 Jun 2025 08:35:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMN20-0000000AL0R-282Q;
	Tue, 03 Jun 2025 08:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7BA2A4FD89;
	Tue,  3 Jun 2025 08:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757ABC4CEED;
	Tue,  3 Jun 2025 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748939399;
	bh=xqHElZcqLYZQ/JxVxlw7t/s7Lb1c4zp+pRSDxtBSLTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BBD1Az7vOdigGWKNr9oj1gqkUQT6+M3bm0wFIxDRcgplIE+XV93xg+diIH9hsnK3g
	 fm4VZNRaVO0gtqSAvuiYZDzd8JWMz6vB8obqtoETvA9mD6rirKMOA6J2Lb4fHcBbIv
	 xw47mhCRlJMZGL6WD5VqLXViKBL5vTEMreDiHKeXpCETLpXrSjFO3EQfOFKe7cV6SX
	 yLxLYtpmSr+obelKNSit0LlxrnxSChdwix6xWKsaP2iWe0gioA1EzoFU3sC6KP2Hjv
	 AvR52y9BvvgHQ8bRyrFuHbP5cYMo6FgNzxsxvNFOLeuyfjDLy2W9WO7xQdC5QOwEpT
	 9PpfOjYOxDGsw==
Date: Tue, 3 Jun 2025 09:29:54 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Kubiak <michal.kubiak@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2 3/3] net: airoha: Fix smac_id configuration in
 bridge mode
Message-ID: <20250603082954.GC1484967@horms.kernel.org>
References: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
 <20250602-airoha-flowtable-ipv6-fix-v2-3-3287f8b55214@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-airoha-flowtable-ipv6-fix-v2-3-3287f8b55214@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_013000_610729_91A7B2A5 
X-CRM114-Status: UNSURE (   8.64  )
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

On Mon, Jun 02, 2025 at 12:55:39PM +0200, Lorenzo Bianconi wrote:
> Set PPE entry smac_id field to 0xf in airoha_ppe_foe_commit_subflow_entry
> routine for IPv6 traffic in order to instruct the hw to keep original
> source mac address for IPv6 hw accelerated traffic in bridge mode.
> 
> Fixes: cd53f622611f ("net: airoha: Add L2 hw acceleration support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


