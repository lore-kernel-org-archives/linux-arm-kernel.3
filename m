Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61119CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaaASdllv469UH8GC6GoZygLxohTJBte5OoOXJHzFA4=; b=f0P80Bz6HYl6/Z37Vul17uz0Vj
	Dq9LC9EPyh02Pqx2yNkCvYj1nP5wuFEhYDB33qhI919liOZ1NuiGLlHzbyDTOZamZMxilDPrsoj0Z
	f535DRpAM73V4O14ovBwCFHFszHwFQdBIJ+vAQIhAqjhQcnPiMrz0SPiUTrFH9TeHNxf3snR4FUdZ
	WsakXz1bOdO5MRplePHDGeAMyXvYa0c/6ehUUHsf0zH2PHaIdhq4qZKyS2UCUH6eBQ6fUpE7YI2jo
	92fqkoEd/9dSXIJ5KjRK3+IDBlNhssZbRnIL32R2glGhsFKRqQACBeqKtapgRmXUO7eqP9SVJdK/C
	d/fte8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QPV-00000005KMK-32r3;
	Thu, 16 Oct 2025 16:01:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QPP-00000005KD9-1Xym;
	Thu, 16 Oct 2025 16:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eaaASdllv469UH8GC6GoZygLxohTJBte5OoOXJHzFA4=; b=auQwE+FD1SHytVKH4ql3YRlKcR
	XAgQ4XGdCjszo3a1/+kHBvVxuGNHOPggGSn9WMPkMd2aR0390IVxbcZQHxBP4zr159dSwdrrfKpG9
	99L5CbDIwnxIS/4M1KAR51AAVjvF+v1wOHeC+cvZ87VUb7+u6jdsf8N186XwwCtMxU9k1gjINtabl
	dkgwAFwr5EOkz/9AQe/KWmaCRzDKHlh3AJvX7KJ9h92JPFhGiu9HfJJGrMONxpp18VV5lKmBBbFV+
	QBeRjOyTAcPKE3lbggu1u5gU3IL67FLRJoqVK6BgylgOOdn1GbDCKlPoyX8eXZ5ZiNORbW5q+fQlv
	Hfxqm+aw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QPM-00000006qN5-0w6b;
	Thu, 16 Oct 2025 16:00:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 929754418D;
	Thu, 16 Oct 2025 16:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D84C4CEFB;
	Thu, 16 Oct 2025 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760630445;
	bh=wP6vXDlhFuYqFHW+R+FJucItnIxpqKnTwS+F/MUaEXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KLsJBU+NGTekT3lJD8bZzbUZL7mpypn9d6sseKpSmPBLD3e7VrygExoPmgNHpJ/OR
	 7vpICSiW57AtXnDzb9YV+Px+QYfvbDzsjhZIY3Z1Z17dLe57WaplaG0BtADeU7Xc7m
	 mia7IhBN7M8U90zOmyNmhYTlmKDCdUP1V5rfa6t3ucbhEYfFc6cLMreG59/pNbRE8l
	 Rk474qliIo9+ND1dpjGA7/5Xpokv72LcyIM0UxQ0N+hG5On7+iZyKr+yrvWxddk5VW
	 wIkVCCQYsgRQWIvqHciH7SQ8cDPL/1cvPC7J6Ceu3HHo4QA8EWq5F39OIhg1sJhtaA
	 jMfXlZncMrWFQ==
Date: Thu, 16 Oct 2025 17:00:40 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 13/13] net: airoha: Add AN7583 SoC support
Message-ID: <aPEWqOoGZFysIBVN@horms.kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
 <20251016-an7583-eth-support-v2-13-ea6e7e9acbdb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-an7583-eth-support-v2-13-ea6e7e9acbdb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_170052_587509_F3D875BE 
X-CRM114-Status: UNSURE (   7.39  )
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

On Thu, Oct 16, 2025 at 12:28:27PM +0200, Lorenzo Bianconi wrote:
> Introduce support for AN7583 ethernet controller to airoha-eth dirver.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


