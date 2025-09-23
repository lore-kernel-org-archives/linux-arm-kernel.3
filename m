Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C5FCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 23:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDzY2LVQMaK7Ywv58utFvcpGy/aHYxvDby3fPDHMQQE=; b=ZMg2F5aooyU0xOdgmuuc6Lxe8J
	kkzr7/N3lilqpUHGJKlyE0gpUfp58uAtRcIA+XvZAvfeqvECSchaJVnI6N11JijB+NaUdlHtGEzes
	SBrZbmyaeyognBE5uWC8YVG8+NqfNGGXhB1RjQ9mt1YMllfMNV748pQYV1bbForXXlRUDMXOujF9C
	jy+Mcyh8bxWuXaMwYp5pOkrCtXprwrzzn3FaBulvb7iqBe22chHE9Ms3mK0m3mHIgyzxICNii5d+j
	uAHtoiukoBlxxr6cvKWVMh6UhnD2HEXJuIPOiD5Adht4gOmtzaxMVpCZJ1P0SydS6E1CeD5yljEgg
	t86FeG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1CEd-0000000F8oh-3WP2;
	Tue, 23 Sep 2025 23:15:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1CEc-0000000F8oQ-1RWs;
	Tue, 23 Sep 2025 23:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88251601D4;
	Tue, 23 Sep 2025 23:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A9AC4CEF5;
	Tue, 23 Sep 2025 23:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758669345;
	bh=pvYfKhTpW3bGdjpAO4fy40xvT7yPgb7fyXYDyfDid0A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cSjI8deF/T3Mix8vrvDs9Z9batQCsKLVzSU5rsijTocNND7sNti50XVFJjAh1zS8H
	 dtLgwJuwWxDE3dTC8l0dLRYeAqtwzCHe/KB898BmFRWK74hJZITRdYuy5NTo5bL/C7
	 rV3tRB2OlIjYLo0yY0cnkXFeeHS0FbYbSJY6JewMxjbcvNZNQ2CxzqZoD5W7pvaO6d
	 q3ktcxqi2f+sl1QnqRf2I3SH/gdlsf0nq3RGg7uDqXvwyYh1ScMm/sli1e2WR4zOk/
	 RSVg0S/0ySBriMcnbO+Th7axxEWa8PMA231+9bpQgnc+mpwwU13b0WoB+MgYT/ZwBI
	 q+k+eNHNkzwfw==
Date: Tue, 23 Sep 2025 18:15:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, upstream@airoha.com, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250923201244.952-2-ansuelsmth@gmail.com>
References: <20250923201244.952-1-ansuelsmth@gmail.com>
 <20250923201244.952-2-ansuelsmth@gmail.com>
Message-Id: <175866934419.400019.15611978179247377029.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: mediatek: Fix wrong
 compatible list for hifsys YAML
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


On Tue, 23 Sep 2025 22:12:29 +0200, Christian Marangi wrote:
> While converting the hifsys to YAML schema, the "syscon" compatible was
> dropped for the mt7623 and the mt2701 compatible.
> 
> Add back the compatible to mute DTBs warning on "make dtbs_check" and
> reflect real state of the .dtsi.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.example.dtb: clock-controller@1a000000 (mediatek,mt2701-hifsys): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt2701-hifsys'] is too short
	'mediatek,mt7622-hifsys' was expected
	'mediatek,mt2701-hifsys' is not one of ['mediatek,mt7623-hifsys']
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt2701-hifsys.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250923201244.952-2-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


