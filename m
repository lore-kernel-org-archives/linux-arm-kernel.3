Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6251606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 11:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kz18/6UV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUR7Oz6W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1xCsCum4W81R+P1kEUptIDoi+4ELNoqKmaIVdJvxeMo=; b=kz18/6UVC5wT5e
	P38FrjKQza4JQKAeIh7/eYSRxLOa0lWtQUZegI8D+2T3fnK540DSTAYC9TQH6licxgtHouMk4h3JN
	bVaT2yNzlBcernu/LYAAl/u7mCjnCmyKhhnQq82rLipEMk7Prku0s0lFkzUxKzVmfrfZormC593rt
	yZUIRn7tNHbts/uK/lsNTLL/u2ELhTLcfEBx8u5LfkSiR6SFcn7u20DDcIdnil9boQQ8zJmgH4li0
	e2dEvLcw8XrapemFTWPQG4ZpX3CmfxSzlTzhgyEWFIiNQ6PXnmHSH6WC0wlS8ECYrDXygJzeDnlbO
	rk7d/vwkDDcIGPYapS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTJO-0000000E7LM-3x4b;
	Sun, 01 Nov 2026 11:01:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTJM-0000000E7LA-3aDi;
	Sun, 01 Nov 2026 11:01:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 95065402FD;
	Sun,  1 Nov 2026 11:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224B11F000C1;
	Sun,  1 Nov 2026 11:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530876;
	bh=1xCsCum4W81R+P1kEUptIDoi+4ELNoqKmaIVdJvxeMo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GUR7Oz6WADc5CRMmq0ybOjfBnAgBvNs2N+ZZwbeBiXNVquDYxwgxHx0Dvv6AcBHbk
	 m8+PH5Zm+vjgN6ohHOZd99MBwIe+Ge+xhV0+H9rxgFp4azz1ClAvNZDEXu4/Jv6ewI
	 aNriN4uNNi+Ss4CzgDMXk+bCV+2oFep9MsCvj3XmmzQi0AKFgYS5L03nt67TIS68yv
	 LN3BD+wYnAuZcJm1Y0GM0NP+YP0XHz8UaF6sNNNj8RdV/SRT742hsn4e4oBypox1DQ
	 ik/RYllpWsuWOkk7rWkf1WOr3HiCZQffxcq3//BZuAHYJHFRw9ayvQ+FxhONjSRT7/
	 PGGbJInxEip/Q==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v18 2/7] phy: rockchip: usbdp: Add reset hook support
 for dwc3
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-2-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-2-60000d03fca2@collabora.com>
Date: Sun, 01 Nov 2026 16:31:10 +0530
Message-Id: <179353087013.2955.6406615135050034585.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=mani@kernel.org;
 h=from:subject:message-id; bh=p1oL61d8c14uqGgknj8yB3KbgyHypRA6MkYYlKZBKP0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xv4XbeysRLw1HQgwGNIUQZIABb32RuEwTX/8
 hNgW7Djq8OJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucb+AAKCRBVnxHm/pHO
 9fVcB/wNwzllkYkudD613UP/rMmnTeDwshWG87frpImWtJY5uo8/Q5JMSSvDREUpiE75rLU9wnc
 8vUsR5yIG7O4fAa+TzNDt8Dj5tLxLpxzLyBfS+T3Tjei0VqQD5mdM9Eabk9r671SakIZvXzsn8K
 N0ycMiD+3sJCfHlFyvwqUJ8rlwJJ9/IOKY0sdhVGv/8gH397pqBahFQuz7P6ZlGzBQTt2MiuKOx
 9VRU54n5ZQZA9wMeIP7jGAapD7nOAaPvpw/7rFNEeIFDr0z2lN94j8JlvMaHZFwijDXmiln2HIc
 CRvmsFkf87LlXs4eOyX0DTJ7oCPit93zforrwNnRtfA4fkoH
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-21 20:05 +0200, Sebastian Reichel wrote:
> When TCPM (Type-C Port Manager) triggers a orientation or mux
> change, the PHY needs to reset. This results in the PHY no longer
> providing a clock to the USB controller. If the USB controller
> registers are accessed without the clock, SErrors are generated.
> 
> This can be avoided by switching the clock provider for the USB
> controller. But after switching the clock, the USB PHY sometimes does
> not succeed to lock its "cmn ana lcpll" PLLs again. I suspect this is
> due to a clock glitch and after some debugging figured out that this
> can be avoided by disabling the USB controller's PIPE interface while
> the PHY reset is ongoing.
> 
> Implement an API that allows the USBDP to actively request a reset
> from DWC3 as a quirk.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



