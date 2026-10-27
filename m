Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757E606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A2XTWbCK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RtOJEvqY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jwVMYqATmMoi+MfU2NzwBtahzJeExlYAhj124bRfpQQ=; b=A2XTWbCKLlMZ7K/kloJW1JTXdB
	adXu1oz1nYXqW83qy6P9oKrn1dQjtF5qcvOqpeh39KXfBZuJDag1UFi6gcEo+z4biqtE1JFqMfAM7
	yECNgSuE6drFZVYJXqktE0kuztWWrs5utSVrKNrAtOkgEAoHPrRwene/QKNxncbhZ+6haXWSP++AL
	JRruY3h03U5KGQoxnggBKFK6nLuHP/8DsZn9b7xkD+PaNL76drVD/dLHrr22zxPNyosPyw2lOdprg
	fGeVvTDjilvX2NTBoiTijyRMadK7JJrW1ash5S6qEfCD8l4mGuOJV6A9sV+WhBpMwcyXO+rGStYkb
	QWHo90mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlxZ-00000005ZOk-3tIw;
	Tue, 27 Oct 2026 18:31:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlxY-00000005ZOV-10uS;
	Tue, 27 Oct 2026 18:31:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 723EA60236;
	Tue, 27 Oct 2026 18:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FA31F031E1;
	Tue, 27 Oct 2026 18:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793125903;
	bh=jwVMYqATmMoi+MfU2NzwBtahzJeExlYAhj124bRfpQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RtOJEvqYrmf4Gv3UUj4FUc1RKQOAxGc7QrR8+1C1H1aKLA19ft2ieBfxRDtSAiEpn
	 kiL6ortvW8eU/9nAcAGvFFt5MgbzfiQB/xlqVgMSqGnxtf3vQPOeFqGONlo+hgljzJ
	 CCsqczZ09+ye4LnWxoyU9d9DXwPJKQr4lZGOFMG2IXerAVFeqNP8pXSxIG85VwRRT+
	 ksPN5+6lhWv7XsC/C9cpj+Lv2EecXKSQY/aHrhCC+sf4APC4qngySz1DRCzPlUwo1e
	 BaCcjc7JUexHnEw0K5Q6iPfsNP+9GM8pHsl4eoBpUo/tVFgNTkbvtvm8n8fBHbgStw
	 sgZznyV1gpaJQ==
Date: Tue, 27 Oct 2026 19:31:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cunhao Lu <1579567540@qq.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: rockchip: Add RK3572 CRU
Message-ID: <20261027-amiable-dazzling-kelpie-cef3ab@quoll>
References: <20261027-add-board-ok3572-c-clk-v4-0-d4152b4fedaa@qq.com>
 <20261027-add-board-ok3572-c-clk-v4-1-d4152b4fedaa@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-add-board-ok3572-c-clk-v4-1-d4152b4fedaa@qq.com>
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 06:04:28PM +0800, Cunhao Lu wrote:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> The RK3572 CRU uses the PMU0 GRF for the AUPLL reference mux.
> Describe the controller and define its clock and reset IDs.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> 
> - Documented the xin24m input.
> - Made the PMU0 GRF phandle required.
> - Updated the example.
> - Closed the reset ID gap while preserving each named reset's register
>   mapping.
> - Removed CLK_NR_CLKS from the clock binding.
> 
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

Same comments as in other places. I probably responded to older version.

Best regards,
Krzysztof


