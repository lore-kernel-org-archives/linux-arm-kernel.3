Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1C60A260C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=terjsuUO;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkNoZJ0n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U6rujUAQs2Y1Y1weMw1WSfHc22ibpIuMwbt2s+QB2+k=; b=terjsuUOnf3+HBYMlHRaHl9wLv
	F3i2sUi3le4etmR4yl3M5tUkox5Zhy/nCh3ywvV03eRFVYqK0zRt/Hw5y59lR8FJoKigq5GVXnSzp
	NgPdkjDs7cpN86VxQxkNisZx5rxUn5xHlft+O9JKUa2OWidWv5eVwZ3fDM28w2godZUEPYIFWppBE
	ijGFBSZPyBpu14TjpnwokPP2oR/xj6XjZ6blU9dVgdRqByrLWESt00xufqDxtnK/U9bT95bmwYqxk
	2CMPAbKimOLfQj2V+As0KkAyauShkrRNBoKccwgZmLVDPyo372jpwt6+FVDcAKDSOhVO0tquHRNeq
	+W7c39FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNn0T-0000000Fp9h-1fip;
	Mon, 02 Nov 2026 08:03:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNn0S-0000000Fp8z-0Qiz;
	Mon, 02 Nov 2026 08:03:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F30B660EF6;
	Mon,  2 Nov 2026 08:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E330D1F000C1;
	Mon,  2 Nov 2026 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793606582;
	bh=U6rujUAQs2Y1Y1weMw1WSfHc22ibpIuMwbt2s+QB2+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nkNoZJ0ncC7kvMOAEmJnnNbUlp2tHy4dbnyuT9fv2n0nS+11B4dO41kssOR9pUspI
	 uw7G7IjA3et1iqmN3UrjTsJsuonqATVfKe8Q13m899JkYYSdLFl3uirYA+ODqCruDQ
	 De9T/FrComFmMPphSBzjqN7NSJZXQ5iyG6Dcd6ByZYpxsJrkHRDC+JGhTMq5IPgtmd
	 l9X/GdwM+JNmiv5wsfI3vTgae/P0PXBTjjzEQ9EvvVv0ut1SOvVUCH7WzAU1oQmR+Z
	 HMQRDP6G4NKov4OmSRq4W0SsODcyr+0GiMbtJq7WYyzNX3iEtthDt2tDeC1fCh6nAn
	 LZzuLcLx0fLcQ==
Date: Mon, 2 Nov 2026 09:02:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cunhao Lu <1579567540@qq.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: rockchip: Add RK3572 CRU
Message-ID: <20261102-casual-free-starling-fd87a5@quoll>
References: <20261030-add-board-ok3572-c-clk-v5-0-9a43403cb149@qq.com>
 <20261030-add-board-ok3572-c-clk-v5-1-9a43403cb149@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030-add-board-ok3572-c-clk-v5-1-9a43403cb149@qq.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 05:43:57PM +0800, Cunhao Lu wrote:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> The RK3572 CRU uses the PMU0 GRF for the AUPLL reference mux.
> Describe the controller and define its clock and reset IDs.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> [adapted to mainline rockchip clock and reset handling (xin24m input,
>  don't introduce CLK_NR_CLKS)]
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


