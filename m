Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04ADC44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PBmppuhCNxseIU2k0JL0kCPG9sQNuCzK5Mbh3VeYEY=; b=nCZJQuIgkQ5uBx37rS0Aeb6WMJ
	/EZijl4E7SUaySar+j+9G2XH9XEX6BrMP5p5j/tmIZioTiTJfiAC0S5yjgFgnto+qtsAnHwT8oNtH
	pJuxZwj9JGjRji8OZRm/4nc2FUEH5Ex4v5NkrdYEzSLQ+bbnl+0oyCSb3UR/s4yWsTr20b5rqhrWU
	BH072ult7Pd7ok3lvxKYDg4hdvqJTHx87TZKnKjEUaMHuSYimwMU1b/Beklbr1xvsFe55RwRSSVKF
	CHl9GJWJC2s3pWcN6VM+rzFlvAxEMvpcMV8fNXvR8a93ai4XZHKrwyj3V0WjeDYcUceiQ2pBzhgB7
	ap78/hzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0eT-0000000FAhD-0913;
	Wed, 15 Jul 2026 14:31:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0e1-0000000FAGi-2pG5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:31:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b966dd74so22023325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784125887; x=1784730687; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PBmppuhCNxseIU2k0JL0kCPG9sQNuCzK5Mbh3VeYEY=;
        b=WZz4NdrDSqa/xIVuvCCjIz5BR8DEPKlNofVE9n1Ty4zME0I4Sj7YYQTisDXyftw6Y2
         v5Fzcz39kWCGRBTpzsOO03pS3SrM/9OQehCVWgWuwZOZe5UZKK8t4NR61mEAx/S3veXu
         0kSWnpiCOYQYcKvywaAMc6VKLw7KR9T6lVlE3VYpz3/5tn8iEoShZlvuH3CU7D+gKdcd
         TknWuHGyKPYxXBipQ8Uff3AGdWdFzD9jjgRQFcwmQA5T14fPg+1sYas5FT3mdskpjYUd
         PNCIRCKUF1kujpMwzn8XhAAuan7aAeYV1O5joEYXqoC8o+VUSs2TpAgzH40BypLkDV3/
         Au1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784125888; x=1784730688;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PBmppuhCNxseIU2k0JL0kCPG9sQNuCzK5Mbh3VeYEY=;
        b=BYEkkOLqFHhXdIYivqsQTNF7S8SDaQ5WvUk5/LtBLwSqw2yPEhIm8OFhjhim0ffgLB
         nvAe6lBpvc/XpU16Do1sp6AcwbhiTR1Vbmz4ubdminr2H0YE/XoFt0aJYMb4xhGADBxh
         3svd4017TdrONsVINgc4nS0Jwd/dr/BEBYXTTQW1LrW4NRPl/6A5lhJypm3tbuFO6aX9
         bELU4/Y6d+RB3J0NFReEQHLy2rNvmK8J5tkpj7yCGOk3LY6f7v5aM8cVIqYCkIPk8Klc
         1ViDi0SQws4DYZNgEKYQlP9AlAykg27FxCIsflCwQX3b+ex6YhGxWmv6UFwOh4bNg9K5
         3fjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5BRY1DVGArxwJLEQ5ssjD+9b9SqrkiEhLeRNmwIQ6/2d1WjePJbUzFsn4FKYt2pyiBa0rR3d7bvCoW2pf3pP4@lists.infradead.org
X-Gm-Message-State: AOJu0YxIuBqHburfsiNcSMr15bjCQjjfXbxAMapTza1XSdP1zQ8rQ3qY
	bSR4lJUKpNseb9a04vj9hzNRmdyMuzXkTvhthFbhYv9I8NSgFQYewfS1Pi5lY1n60aY=
X-Gm-Gg: AfdE7cnoy69r8iMxJJthH4MGT/jCcpoj9ELgrp5zio/AXqzznh1/eXLbK8Apr+JeUVp
	b0nw4fxb88aODPgI5eq4dj1HUTLDBqP4jzWHGy2hVPaToCKAdi0RL8p9E2aqm+2Gm3Fduk19SLq
	WmzEcJ7i2kQoaToB20n5+zgSv0F02eFko5qrGRLrgSAcMhL+uLCG5RQR3R4r0oY0yBRUBOKNc0A
	e0Fm0gQb/tK/Qjtn7y6VAwTj2vRc//igzO3S0WKNRkKmaLn402tUoPGsC3vrEKgcZojAC1gKrQY
	9bHlCsDY7nNpXNpImeRaPo1waDJhM0iQa8gsYBqK/AChlOZZhQotoI8wxrkBqo4xryh/9GWEAmU
	Vi32AoC/WxWpqlz7GerOYOYcOnoNN85beD6Vb7rzofRjJevIBV7yVtyQ5M7SA3PDS6p7PT1kByu
	paHVEuFjqbRi9UfS53O4+dhl0P7/nMH1vSp5B2ktInN+dbv3fyFUyhG0IYHiUj1Fq5oJT+bGg3w
	9DnPeSHlDolwFVV
X-Received: by 2002:a05:600c:8115:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-4953c14f78dmr32474645e9.2.1784125887641;
        Wed, 15 Jul 2026 07:31:27 -0700 (PDT)
Received: from [192.168.2.28] (p200300cb8704a900f059545e4a985631.dip0.t-ipconnect.de. [2003:cb:8704:a900:f059:545e:4a98:5631])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495087366c0sm280236385e9.7.2026.07.15.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:31:27 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: aspeed-g6: add pcie-lpc and pcie-kcs4
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
References: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
Date: Wed, 15 Jul 2026 16:31:23 +0200
Message-Id: <178412588365.243141.16731478852761544781.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125887; l=1599;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=JBebJb4jcuu7x0vRBxHn+90SiQlNqxWidAhC89Jq7t8=;
 b=2EvNZFMIlLmhR89ccAd8ZS4HjM7x2BcXOqQidZyE+xoKd8+yYA0umsKD0IHfhb6FFnA6BrCOH
 UvXNmryk/sVD5AzueTiADnnFB+O/J1ykpDm5t7mVugXdP7qpI2GTpYn
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_073130_624399_1EFECCAA 
X-CRM114-Status: GOOD (  17.07  )
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

> Add pcie_lpc node and pcie_kcs4 child to the ast2600 g6 common dtsi.
> 
> The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
> interface on channel 4. This is a fully KCS-compatible interface
> that is exposed over PCIe.
> 
> This can be used by the host for IPMI when the PCIe BMC Device is
> activated.
> 
> While the datasheet provides interrupt numbers for KCS channels 1, 2,
> 3 and 4 over PCI, not all 4 are described in the "PCIe to LPC Controller"
> section. Since only the KCS channel 4 is described, only this channel is
> added.
> 
> Ordered next to existing lpc node for address ordering.
> Use existing "aspeed,ast2600-lpc-v2" compatible string.
> The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
> standard KCS interface.
> 
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7..ac351f01048f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -658,6 +658,21 @@ ibt: ibt@140 {
>  				};
>  			};
>  
> +			pcie_lpc: pcie-lpc@1e789800 {

lpc@1e789000 already maps 0x1e789000-0x1e78a000 and 0x1e789914 falls inside it,
so you're describing a second `ast2600-lpc-v2` node which is unnecessary.

Suggestion: Merge pcie_kcs4 into lpc@1e789000 and use 914 as offset. That way
you don't accidentally cause an overlap for the devices if you describe more in
the future.

	Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

