Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B96A606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bRlTqad7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FxbRFJIk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=izVuTaXv7urzHImsKbDUJPr30hqebXz3eIHBs72kLC0=; b=bRlTqad7X6cnwo2X6BfdUw/zRs
	vezIJ5HUkEP8cic9Jy2Zwcmtxt0bG6kHwh+lhPN+zWsl+lzAGAF/s58QwRhGex7n2Lm6sJ+Pkw2t9
	wAjiswy94N6dh+r1bYFkBAaM44jbc//t1iarBuJbrBU0Nks3REwUccWUTwc+SiIpkk6OJmJRqKEmK
	V7ESFtEBwemPaRzexNDwXDpgv4xKgkVKuYgMWpXwpoQqP7WzK62ZQq24JzPLHtHAqtYHy+9ZGfd4O
	DV7XJb2ioVv7eZDH/UvkQT5Z+ZWQB6BQBNC1PL8xjVGpZwdq3Z6yUzEi5hHaqtwg0/5Kjs1aZhbSQ
	gD8i392A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYWc-000000052dY-3VQu;
	Wed, 04 Nov 2026 10:47:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYWb-000000052bl-1Lxl;
	Wed, 04 Nov 2026 10:47:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B03EE60A8D;
	Wed,  4 Nov 2026 10:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B801F0093A;
	Wed,  4 Nov 2026 10:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789244;
	bh=izVuTaXv7urzHImsKbDUJPr30hqebXz3eIHBs72kLC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FxbRFJIkDb4ZJYTlZwyIhnq4AVYRI1w8iJ1Lc9TdhDJ5BSYl0iVnRhIO5cKZUdxYD
	 kWN4fMScLm65ugckP6RF/Yl5RZy58FW2wphonclexoMET8n8hQIipwnmruIj7VhyCl
	 lpeXVI0d4FqKrlvJYYri9cTKXT1OYP1qBb+mrdEEYGPrjmROaMUpJp+qWhfq4LsaBy
	 J69V2D0rT0h8j51s1H8vISyzlAim4pjPjwsXqfo7z5BQmovZ1sJIrKrqFMgA5Tsvgu
	 bEr5HpHWQ3fADB/FHyrARkA0zpOfN4mUtmK+lF155k2lTuuA8tdU0CNLUiyjkVq96w
	 PilRtze/xOXeQ==
Date: Wed, 4 Nov 2026 11:47:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM
 registers
Message-ID: <20261104-seahorse-of-magic-destiny-7338e3@quoll>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
 <20261029212513.4126083-3-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029212513.4126083-3-florian.fainelli@broadcom.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 02:25:09PM -0700, Florian Fainelli wrote:
> Northstar Plus uses the SATA IDM block to enable the interface clock and
> deassert the core reset before accessing the controller registers.
> 
> Allow an optional third register region named "idm" for the NSP
> controller. Keep other compatibles limited to their existing two
> register regions and allow older NSP descriptions without the IDM.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../bindings/ata/brcm,sata-brcm.yaml          | 57 ++++++++++++-------
>  1 file changed, 37 insertions(+), 20 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


