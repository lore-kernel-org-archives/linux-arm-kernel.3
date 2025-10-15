Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA75DCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNBtxvHQnc5IioU6O/qt1qOm9lZqIpqGTRsMKMDDSM4=; b=mbyxE1rkVeG23EVdqwnOC/OEBV
	ExFwDhewQ/wjc3eobflng7LEElWZoNoth2gfHjT8aP0QC4sH5fDxwwxfxqY6lTLvwS44xaScR4IYM
	MbTBde0BQ7IjypLjvaeyZrm2N8i7if3HhrGkyUR3mPxHSSmIAUSbqRCoSKR5dFfQ/mympNhuyQUjm
	qjGLABPtkPnuWIVGBzJHpAGQmB4NfgyzjC5hAHxuOgKMKNGQtHs0F0taS8/8WQAoRnXqD0GrNNIu+
	vED5lamZn55s7xRx6cELJSUrlPcXXBJd0SXGwM1Ea8+HpbJ+SuD/SphOgkXIqsXO6p8ioGNvB156q
	+0VBevlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9421-00000002DiI-2HuR;
	Wed, 15 Oct 2025 16:07:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v941z-00000002Dh1-0fbW;
	Wed, 15 Oct 2025 16:07:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF86144D03;
	Wed, 15 Oct 2025 16:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EB3C4CEF8;
	Wed, 15 Oct 2025 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760544434;
	bh=MJJ2ARInEp9nuBoQhvRqunMxsb/z0LeLIlIn+PkYGvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqGs0yCV9VVLU5C+sp6b4Hpq3r8TEooFHRZn4LXo9RyodYfgMpER76QhgAeN8U/lh
	 fK1u9X8dlcGSlBSLYwKzu2bJbXSiHj7qg6ECnVBJLDf1l2CsSjnLiMLWx6ecWtpNTG
	 7llPkZAGRf3MWjJ9mFzELaBzm1neMdVeuJqEZbRei/K/ykRsn+ahKePq0KHpzfzysa
	 MHwy3qGXLBGNeEtPHxzzppaShKjtN8fx+HEXla3zq9nRoH1t0OCBHQp0QztllA5Oic
	 Xip/KibWyoCl2yuBAeFn8OWbGpnQTD0IEsP0ryrWHnryYJER/Opjhad7YtS7Gaela9
	 59ja/2boyvRuQ==
Date: Wed, 15 Oct 2025 17:07:09 +0100
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
Subject: Re: [PATCH net-next 05/12] net: airoha: Generalize
 airoha_ppe2_is_enabled routine
Message-ID: <aO_Gre1bLbh5qlQ-@horms.kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-5-064855f05923@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-an7583-eth-support-v1-5-064855f05923@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_090715_218145_2F7C4220 
X-CRM114-Status: UNSURE (   8.48  )
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

On Wed, Oct 15, 2025 at 09:15:05AM +0200, Lorenzo Bianconi wrote:
> Rename airoha_ppe2_is_enabled() in airoha_ppe_is_enabled() and
> generalize it in order to check if each PPE module is enabled.
> Rely on airoha_ppe_is_enabled routine to properly initialize PPE for
> AN7583 SoC since AN7583 does not support PPE2.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


