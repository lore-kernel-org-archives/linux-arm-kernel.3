Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C1ACA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LD/A3nglaC31jBIMtUDrqXBiepN73OFs6DJpCa6dtO4=; b=iVGdiFUOUHnAsuiaEU/pJXdg4P
	OzcPMldHsQPiOe1IjgxE3Mj2YwGIqT7GV6tuqLllVPVeAno2hAu/1V3TPg1063uFTpxd5QzS7xMi4
	gOx79pfd6aaS/ckh9vH1nUotAA932JqF9KFFvWfj/QycgREvMuFs+jTUSH3lOUPDbNNJe41kWqVxr
	k866CSU/XsnwHPSsRgiqG+1+YayxzL69HYKTT1Yztsuqj/+hICpLP+hp+c5UPJRxtGAoRKIXqq6t3
	sE1J/O5137XUljqN+PFQvXzZUePcKw/hsnWNkE58lnNTJUR7NFfq7LRlHQLqsdQMpaKp2O8MssLvQ
	FRjMb3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCesM-0000000Brjt-0vQn;
	Fri, 02 Oct 2026 15:08:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCesI-0000000Brh7-3QPW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790953716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LD/A3nglaC31jBIMtUDrqXBiepN73OFs6DJpCa6dtO4=;
	b=Gf3pglWfrqbJTauSJEYdtySw15tpLwpmvdX4QPA8PCQTvTLYRw5O7Yt1XRqlFx8Yqi74mH
	Hb3A1Fxhsv8i0lkm/cTXBaG0bh7qs+X05+6bPkdki6E5jV8dK3w7QU33+6aIFbgO+dmzGA
	p4F+YuLSyQiCHhblyCDltkkX9/sv14Y=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-kzPrHaShNZaN6ormhtIPXA-1; Fri, 02 Oct 2026 11:08:34 -0400
X-MC-Unique: kzPrHaShNZaN6ormhtIPXA-1
X-Mimecast-MFC-AGG-ID: kzPrHaShNZaN6ormhtIPXA_1790953714
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350c2b31c8so4304961cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 08:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953714; x=1791558514;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LD/A3nglaC31jBIMtUDrqXBiepN73OFs6DJpCa6dtO4=;
        b=BPomjvofuh2rbDKrNMSwJXLJDsZETyBLie8mcxWtSDGnlNqZljmG84l6c7yc6YcRyq
         9M5E8JLziumKxN29Qv2NgwmevQBCQYnjR96p+e8wLFK/MQmucRfrXGbkoJPfLuIsx9gf
         QttmnoRguvQzdih2bqLoekEQ3o1jp0c+jMtwP8sZZ8HsZ6mpXNj0qAVMvtuJj9ISocXp
         FyHVu/89gLMzhcxCUS6ZVZ3WSoTTAe3nUEXk2sRQvIt6coN2lFCRaLsUSzRJWOsWqMel
         BfYPkw0rHv8iC3L2ixVKUeWmO6vLt0DppMwRUfnI00LxYEVgPK3xOpJ22GtESZOHMetH
         9YLg==
X-Forwarded-Encrypted: i=1; AKwUvBzTdzyj+sXo8OY2Y0KI433CykmcxB1NIh6MaZS4pG4Jpqfxit5lK5Sh21Fz2ZndeiDOzQWhzDKSLuLt3N6vyT6V@lists.infradead.org
X-Gm-Message-State: AFuF++kWTTZ0oSGRgjMCg4pkRayQIbqQkU+3fk7GW/ThST38PMdsr6LI
	YqORGIDhp3r7Z1mXXnchOoiYMNCXuNfU9bqM67wqZuReP6fT6vRZkEEGpqLm8DCd13I1lQfX29o
	UEdH0gs7eDBE/ijHEfw0qBB4D6ryIa+WWZSwEtEAlB3hyXe09+ZGjarI1MlZ7YUrpFrFZmUHZJg
	h8
X-Gm-Gg: AYBFou0mAtfKbNPfWwpiQHIvIs3kPjDqh1/1yGsY7tRVrz9w8abVk9dOGcz1cFcubSQ
	Decmxc/fII6WK1YALTNAL7y/GI8WIhekik6iwiMZEw3ZPmo1Ij3PwbQ935ig3uSjvxAdoeoTNjl
	yHbjwADpi+PImHVxU3pFL5Y880dfZopDbedJNGV7k18LOdsWHKuIBpJ/gJDO8XXXiCDuBtntx4+
	/2alnS9pSdEQAMX5Jovpb32fq6Rzgx6HkpHIsq+P+f6mYaxTP5gBBeaNU9s+BCociMOlPDxLubo
	HWdl1t2FWwFu9muEQ5YLkFEDJB3hHaNbxyjKvz9bvNU9NZneLfPuGOh4u1KkemQBopmYg+VXALk
	WN1TkHlnxDLACpdLkyrYJPNyF2FY4+vgRp5LSbCERG8cmOsxTn+o=
X-Received: by 2002:a05:622a:1353:b0:533:3610:c5eb with SMTP id d75a77b69052e-533d96b6966mr49792591cf.53.1790953713805;
        Fri, 02 Oct 2026 08:08:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:533:3610:c5eb with SMTP id d75a77b69052e-533d96b6966mr49791681cf.53.1790953713259;
        Fri, 02 Oct 2026 08:08:33 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d128ccsm27596841cf.24.2026.10.02.08.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:08:32 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
Subject: Re: (subset) [PATCH v13 00/13] ZTE zx297520v3 clock bindings and
 driver
Message-Id: <179095369547.791677.11922932020340915175.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:08:15 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=LWMTx7OVyEurkrK8gxvgvVLf0aBDX7nOCsHhfPnuLAk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2n3j1sCJv/pFzhTZJnIp6XLMW1T+Zsn17zf5NPhp2l
 nuniVRzdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARdn2GP5ylRUdjm2eldZ5u
 XD5jQ+j9xzleR9dJh/49fXhFlVPSDB9Ght0/fk9fsCKpqrNG5anMU3n7TWp/uuXyZ0pIxLpUpGv
 P4wMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e0jQzr-hntlaB1qnCFYm642SJfW1WY_gctgROj8W-M4_1790953714
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080838_949228_28184C3C 
X-CRM114-Status: GOOD (  10.10  )
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


On Sun, 27 Sep 2026 23:13:28 +0300, Stefan Dösinger wrote:
> ZTE zx297520v3 clock bindings and driver
> 
> Hi,
> 
> I am sending version 13 of my zx297520v3 clock patch. It addresses review
> comments for the MFD driver but has no other substantial changes
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
        commit: 9b9e5daaea8febcdf67a656e76b3a7e1d0f2290a
[02/13] dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
        commit: 3847bc94d1746c1448c984338fcfdf1216db0827
[03/13] dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
        commit: 4500e2e361ecba42cb1abd6f6891a45d99f57741
[06/13] clk: zte: Add Clock registration infrastructure
        commit: ad5107a88e993b576b01761c6560e157519e0f84
[07/13] clk: zte: Add regmap-based clocks
        commit: 0f973ffd1038e2bca5ad89279412a508df62f44f
[08/13] clk: zte: Add zx PLL support infrastructure
        commit: 77732e66cd47e849031e4fc8999cbff0ec958deb
[09/13] clk: zte: Introduce a driver for zx297520v3 top clocks
        commit: 392a4957db5c2f2c37bf0191d9531710b3080dbf
[10/13] clk: zte: Introduce a driver for zx297520v3 matrix clocks
        commit: 4ea299afff42c6a09eb1aea1d29c678c3374b824
[11/13] clk: zte: Introduce a driver for zx297520v3 LSP clocks
        commit: f8a3cbf8678ab80d3aba5918f2f5e1acc1e7287d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


