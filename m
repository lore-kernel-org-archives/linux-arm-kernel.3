Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A138C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tFmCMlIdazreXwyWNHIM7U0F2LSAg2/FgtTByBRIJs=; b=knOl5R23j0ZhX9dt5mUtCV8QzR
	VRkb3hdEZEoTbWDVwwkTA8npNDQZusQG1Z7Gj4l403ViYzE5KwFkbRj3P4HZVijYsHiHoeRuiz6zl
	lR83mMpNsSVpLileG+ielrK3w+jK8vW9tufsVAs0JymCuHu8R8/DQ0x7nU8auE4prqtntgCylzLDb
	ZyY9er/bDN5k6TBGqu97vevY148Gr1iSm3PVYKE0cmqKcik1nkTXvUL++UCrXH5+KB4TIB1wzs5MQ
	8vo+bnkl6RG7si5YqxC9b2gT9m93YompOCiOONcbkd8X88Ywbp2RuQ1MwPoj0LX697wwtXvwsDQjg
	G4l/M+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCqq-00000002RKK-29iI;
	Wed, 26 Aug 2026 12:35:33 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCqm-00000002RJa-2Xn1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 12:35:30 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso623835a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747727; x=1788352527; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7tFmCMlIdazreXwyWNHIM7U0F2LSAg2/FgtTByBRIJs=;
        b=VlV/cCPFeF7vbtvOpAFxlLXUmJKmm3bpx9TYrBW4+ZXoalZh/qLHHsVITXi3nB8vEl
         jmZzvtHJr/jNov3RM02UHXQEEKfnkQsbdne91eEfeR7Y8eq8scJ68ZDH8G3aHrq72NnB
         J3wq1LzzL8/lWzL8I7ODBUjed1/81dgTm9sKzvHZYvYEtZeUwOq7Cj/ISJYWvzaSwCVd
         vrt7s/NTVT2wt6T1uAF1jGgaEX11e+tckRDYPJ2GMZjF8gfE8O5CdTx3Cx71b/L4MPgP
         5dsa71oqMafEP56HpccuHiKcRyMbmFIifFK53VtXmPHu35E+LWeqrlIo/8B6NVTCtCdG
         niYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747727; x=1788352527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tFmCMlIdazreXwyWNHIM7U0F2LSAg2/FgtTByBRIJs=;
        b=Gj1zi2nvFna1KOcQkQaCGF29EDQqxKNZ+99qKSK7cM36L7LpNQ7Ng9qh6+ocQX3kBJ
         UzylgR3hHqTlOzRanwofZ86K1ZnjMetH+TtMui8g8h6VMFTTE+EvOwIg7rYpXlXrbfER
         c1ZKTXPOxdFKnFqFWjv/ob5JHpKBnQ5nVUws/Cckp8I3Dc8K1PvRcCiIJ7ikoTXkuczJ
         83iPGr237+Qte7chK2772vQjNm/zCnTApGkpmpmg5hQaXQqpSluReOZKOH0jrbKvO1J6
         oFwE0jVWBZEVpBtdMqx/BzSrU3d55xLHzYvadF57KtrCjH89wfwHYSPsC3nN6ytrJ4aY
         Zg+A==
X-Forwarded-Encrypted: i=1; AHgh+Rox11rgzP52pt34PXaSJxktv5p14jRU7mtvDFsMTb40oZNTwXSFidfPz7tfTNMFFZtqSIsSQR7xdCxLSr8FhoAU@lists.infradead.org
X-Gm-Message-State: AFuF++n0uSZe18ThqIl69R0IcaNxbf2fiTjuWK28M5qZ7eUMHPbHn1WM
	haKSNCMSZPww9t0eYMXQzKxR7PF/ly+7pZgCR4D7cfp1c4jEEUKi0JUF
X-Gm-Gg: AR+sD11hwJPQbb/fazwv4McPEjNIsD7V9mQB6Dg8jNBDOEyQ0jp2mCPR5WeNexyHJpT
	bzcXc9PGvd9tWK31+TilwqiSZHm1SWfcg/2dA8fRQxaS1ev7sDyUHi9S5UlLbrHodEG634pt+qM
	xl1z7PNcMWihdAwoMpY+pqfptfXHBTwwl13+lXf3mh/TK0LghB/9jP/RZmcBbnh95YpIoX4lccv
	vr72vtpmDNx4xS4RiM2ZQcR54TTuygEAjilfpv13HFjr5VNLDDfM0Ddw/F2XySvKTaQ6sOe5vJD
	yHSxeRvfgJPIesgDIelep/XJ+75jM6/c8tjN5sn2D5LAuXTos8qPhgID21EE+4y1c9z+tMrtJVJ
	kLS5Oiu2cTXz22EF8WE1eE3chTc7M0qU3VV3tiSGZGANA4G563V52L8PxrHg/QxB50Dx4bbc0PY
	c1GkJW4fxGlJe6PHDzUhBIlhR+Pf96ipKO9v/cRTBP/repoxKWc/tllInJLZ+3rVAzdtyxlrKdd
	fjiXNIK1maDid1UK+uSqdkSOvBWCw==
X-Received: by 2002:a17:90b:4b04:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3966d5f900dmr13609817a91.8.1787747726840;
        Wed, 26 Aug 2026 05:35:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5877:641:857b:1318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20095sm7925744c88.6.2026.08.26.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:35:25 -0700 (PDT)
Date: Wed, 26 Aug 2026 05:35:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: rva333@protonmail.com
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6572
Message-ID: <ao7dfxkXtbt9BybP@google.com>
References: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_053528_677534_58ECF54A 
X-CRM114-Status: GOOD (  10.72  )
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

On Fri, Aug 14, 2026 at 04:13:52PM +0300, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 keypad, that is compatible with
> mt6779.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Applied, thank you.

-- 
Dmitry

