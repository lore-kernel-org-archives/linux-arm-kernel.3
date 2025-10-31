Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8723ACCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8Vz/kVetkZkK1cizTpypIQTEgiMe9aRwVeIYyr3Isc=; b=Fo4U7n++tN66AAlOy0qq4me1X7
	YFCQxJfBk42QNarrDO/wCITzvmXUaN4FXRltbaUDnh+NXqWHMtFo5r4LlgUZRh6jw3PkF6kaOMf9p
	FGC314aID0xnao0gw8wJEG2pYcAH1AUcTp2UdTqmQkKDpuEiiSwPnvoIF7J1atJxRfeDgs5Jl+/5F
	Q+rW4ZNePpsHYx6dg9gKjufTNIJCcTmuE77zgmZoCxZHLXDfXdaAuUFm/bSp4TvIny08PspBPq3lI
	65OoTN7GKeRM37in4jbgIOKfb2oZ3zpA4VCgsppwVVn0Pno8k4Xd2TPpPhtvmolg5cmQrqjILhRSh
	IgEkP0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkM6-00000005d2r-2Jgs;
	Fri, 31 Oct 2025 08:19:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkM5-00000005d2c-3dqA;
	Fri, 31 Oct 2025 08:19:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09CA3601D8;
	Fri, 31 Oct 2025 08:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2498BC4CEF1;
	Fri, 31 Oct 2025 08:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761898768;
	bh=KxNLKm898ISK9bg5Y6Dwq7+27/Y6B02z4sitZmbdhhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDRnDgoQwv4gBXL/VUzJI6qGi4Zy3uokZrGwaE6SKKFuKRt+pTZT9gTjpAzBT/Co/
	 Qso8QrABj/VtulwZ4lvoIr5kWCpirgnjzq1uHgwIwczKNgrEluq2uofGwIYFdELjUY
	 PdkjBaZ3Ad2+4K0D9++HEFhucTPuw7Ca7DbD5Xo6hMZ98kj8GjyI88OlFGyZmT2V+1
	 rb0goahzfje7Ej6/vgknrOKQmAX3LVt9QkYa3gMMQDbCjJABz5fByn1zTVvpSsI+BG
	 9F4bbFi1MIW1bLytKYZ3uzPSKNN86cqFh+ZEYNvEaKpCdGDs5Bgbn7C4nuF4HeiykC
	 K71fxnhwQdSRQ==
Date: Fri, 31 Oct 2025 09:19:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Jack Hsu <jh.hsu@mediatek.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	srini@kernel.org, ukleinek@kernel.org, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	chunfeng.yun@mediatek.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	sean.wang@mediatek.com, zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com, 
	lala.lin@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 07/11] dt-bindings: usb: Support MediaTek MT8189 evb
 board xhci
Message-ID: <20251031-nifty-sticky-hoatzin-eeafeb@kuoka>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-8-jh.hsu@mediatek.com>
 <20251030-underwent-courier-1f4322e1cb34@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030-underwent-courier-1f4322e1cb34@spud>
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

On Thu, Oct 30, 2025 at 07:32:26PM +0000, Conor Dooley wrote:
> On Thu, Oct 30, 2025 at 09:44:39PM +0800, Jack Hsu wrote:
> > modify dt-binding for support mt8189 evb board dts node of xhci
> > 
> > Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
> > ---
> >  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml         | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > index 004d3ebec091..05cb6a219e5c 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > @@ -34,6 +34,7 @@ properties:
> >            - mediatek,mt8183-xhci
> >            - mediatek,mt8186-xhci
> >            - mediatek,mt8188-xhci
> > +          - mediatek,mt8189-xhci
> >            - mediatek,mt8192-xhci
> >            - mediatek,mt8195-xhci
> >            - mediatek,mt8365-xhci
> > @@ -119,6 +120,9 @@ properties:
> >    resets:
> >      maxItems: 1
> >  
> > +  reset-names:
> > +    maxItems: 1
> 
> Is this reset required on mt8189? Does it appear on other mediatek xhci
> controllers?

reset was there, it is the name added for some unknown reason.

Best regards,
Krzysztof


