Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62AFC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G70QYwT2b87YzGrsLlcVWXcGL4r7USqal6YmpB9mtwQ=; b=ciXwr28dm/M9y6fcDGVOzDCTTs
	zGE5obtsEPisyYTHvFJ1nnPL4MdHqSI784JlVEatsUjXN5lSb0cqpcHstioJsD8i2xOAu+LnnokDq
	YesTmBPen0SMPAu1iyIksafjEkPXJyz2NKZStmzStKv3uGkg10a9rsB/UAh1qD7wSveRBFmXYS6/4
	bH+N76bySSQD5/INTfoRh9T1MBU9k81koRQsuNzaBgQDKMMOZjhnBYSXDUHjq3qKGtS/uLgGcmlul
	EuNy8/vBxLrNvuyg1+IKW9F3Fqjy9QCuu0K8XO+BdlaJVM4ah4G3Qrd/JWd3mTqm1FWKKZwPp4sje
	IFgn56Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcniV-00000005Aj4-0mF3;
	Tue, 28 Jan 2025 15:41:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnh9-00000005Abd-3BxN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00AA9A40E68;
	Tue, 28 Jan 2025 15:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7EBC4CED3;
	Tue, 28 Jan 2025 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738078806;
	bh=1Yhm9+Sys8O2xe0fP21kTV+Z0Km1KjgTwV+bcMX8KNs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=a7JIhBo+kbWOFf0tpozOgd09Ki5iNofAEkfScgYtJ2SIN4xTLLJhFkpKd6pZk3umJ
	 Tq4pDr/cQyCTESKxz4NnSRQnq8VCqp4zzbTZqjiGzs9WXhIO5fdeqfSQoqp+iVlS3k
	 KAct9GhJDaQwyq5eIpPxcP5qkYryaSs9Ql4kVZpgKIKyWLbV1TsZJTma0Th+eFacjZ
	 qbYjX4K5WFfr9HcSRMP4YIswlUuEtttWwr+xMjT3BTZCqjglzuMV4h0kNqw5jDNgWV
	 sv5bFu78lU/XB2/ywANJEk3slNl+HFhHgZAj2QPN591nk3THoJIzCQv9gHtlbfzJar
	 o631Gii1/jw8Q==
Date: Tue, 28 Jan 2025 09:40:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kuba@kernel.org, conor+dt@kernel.org, alexandre.torgue@foss.st.com, 
 linux-samsung-soc@vger.kernel.org, mcoquelin.stm32@gmail.com, 
 linux-arm-kernel@lists.infradead.org, pankaj.dubey@samsung.com, 
 edumazet@google.com, peppe.cavallaro@st.com, devicetree@vger.kernel.org, 
 jayati.sahu@samsung.com, rcsekar@samsung.com, andrew@lunn.ch, 
 pabeni@redhat.com, gost.dev@samsung.com, joabreu@synopsys.com, 
 richardcochran@gmail.com, ravi.patel@samsung.com, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ssiddha@tesla.com, 
 alim.akhtar@samsung.com, linux-stm32@st-md-mailman.stormreply.com, 
 davem@davemloft.net, linux-fsd@tesla.com, krzk@kernel.org
To: Swathi K S <swathi.ks@samsung.com>
In-Reply-To: <20250128102558.22459-2-swathi.ks@samsung.com>
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf@epcas5p4.samsung.com>
 <20250128102558.22459-2-swathi.ks@samsung.com>
Message-Id: <173807880529.3533023.16090537630413289579.robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: net: Add FSD EQoS device tree
 bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074007_869758_2848906F 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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


On Tue, 28 Jan 2025 15:55:55 +0530, Swathi K S wrote:
> Add FSD Ethernet compatible in Synopsys dt-bindings document. Add FSD
> Ethernet YAML schema to enable the DT validation.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  5 +-
>  .../bindings/net/tesla,fsd-ethqos.yaml        | 91 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml:41:6: [warning] wrong indentation: expected 6 but found 5 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250128102558.22459-2-swathi.ks@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


