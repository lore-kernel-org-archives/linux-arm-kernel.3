Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287F2C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4tukFGFzn6p5oj09GrnCj+iSyX+UpoqR76XLNwFCdM=; b=0bwjHHzlqoHKn1/qgYbX8yiSnd
	lSHJqnvH//axREzpoPpSdmH/39RnfThZdHwiGv1CTEJ/YTBylaLrPaVlVXmgEztGffMwhIEhJw/bq
	7n2tNlRLf8ik0ZE+SBnrufHXLzNyZwku92VlgapKierPKk+8TFlYki5LuomlknYNsiZV83BPwjXa9
	5MCt1hXB4JpquF4RRsOSe1Yl4lPc0BdBmMn6d8bdfdy7GKG8sT0DHko/HITghCYvhidlSUX/YwbRm
	dI8FfXb8eAsr319nxVCVcDH7hifopWi5yMf5GMxaNOUKa+UDl5WTwpuxhOwHwfdIjvZ7PrzsDQyBU
	0RI/JsWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnl5-0000000HKQz-0nDD;
	Tue, 29 Jul 2025 17:04:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnEk-0000000HH5K-1Ghq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 16:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4CA8439C4;
	Tue, 29 Jul 2025 16:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76977C4CEF4;
	Tue, 29 Jul 2025 16:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753806693;
	bh=sPWerXoTnJdupEJFgfzlBFo08Ou/toO0osnBkMyj3F8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xt4z40PFrTNRm+gchkzSFN8IZ7lR97MmgUmhmW7xTh+MJkUc9okSXr9V5mM4Mw2i4
	 7xketuGtMIVNB85UWt6kb4nKjtJGf/mf5a/0SF8E5QqCk4jWVsby/FjJ0W4If9YWSw
	 n3UQTfIab46FGLkOee3bgXACTsvM3uFdjuTJmKwt8azfPGnQ5u3/oo64BG0175yQjU
	 MKj++96I31z25cIz+ITK6gTWF8osNPZ1SGjzNaR+FGqBWhoLRWOEqo9Qs1jZOk+W/a
	 7NFkAYgEBUzlgqe6Bh7Sa7wA1Co9bMX2SK0n8RIFVkpGjymWU4b2feO4sAQlPqee6S
	 6iexWo6KdPe/A==
Date: Tue, 29 Jul 2025 11:31:32 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] dt-bindings: display: st,stm32mp25-lvds: add
 access-controllers property
Message-ID: <20250729163132.GA507560-robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-3-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-drm-misc-next-v1-3-a59848e62cf9@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_093134_362892_38104F9C 
X-CRM114-Status: GOOD (  13.18  )
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

On Fri, Jul 25, 2025 at 12:03:55PM +0200, Raphael Gallais-Pou wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> This property is added when the peripheral is under the STM32 firewall
> controller.  It allows an accurate representation of the hardware, where
> the peripheral is connected to a firewall bus.  The firewall can then
> check the peripheral accesses before allowing its device to probe.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

