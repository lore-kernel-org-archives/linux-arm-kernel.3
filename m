Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89702D3E79C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 07:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3V0PaRYfY3fBDVZ/uued3juYot3klR9+5V5lvSu2IQ=; b=crXTqMhNcioMbA3+mzaqY+7/S+
	TkPo2ZLgYbjppN+p3ddMSjNKetMetunmN56NTPWmjWWeWb/Q9BszFU3USjT3hoadfnLIFHxfrO5DH
	ZaYlOv5V0g0LwtcQB9eQ9aNsBLOiSXOfRovxYQPKNWf0hXiKV/havxtSrMf/7F0kNAvBbI1bQQugu
	/AsaPxfKwHMi4Zj/nVmc+3ZhqNpYbSxwrGcloH53NLxuzHNtEmdW7FDqjrIHIIGoUM8dXGgqX+WmZ
	CSVD88T9qW4jpkMp6TLegWeKtJKZvH939Ri4hiCIxMzwpfNC/kwMocWZlf0MORc2lE7o9AwHZwvBk
	UqsSAoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTb4u-0000000GKPE-0zWn;
	Thu, 11 Dec 2025 07:27:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTb4r-0000000GKOq-3XEj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 07:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06B8D43D60;
	Thu, 11 Dec 2025 07:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E775C4CEFB;
	Thu, 11 Dec 2025 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765438024;
	bh=9Pn1TKGAFTdX+pqMnPKSN9bM9scXmjgHyEfUQ/iaBpQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qzOv7Bo8Itdd1tUVpORjTIq8cHlEI4+LPTHdmUYoOGkJSVrDUD4sgJjOX3pn65GeJ
	 QquSGnlSOb8286INlggGzLdlV28KMasU9ELsKXyjQKTqK8zG3pL3fOi32N+WMGbAwP
	 Fidv8h4QB58Gwsabdfczuaxu78mvALZr9Iih74BLk6bbW1w4QkyHLE0KJQR+euzI7z
	 jSX3L7yjmGQ8XNgqvEn2gA9yWMYpcp/Md5j+LBGen9ZUsBCnsFhPNTJHMinRZRJEyL
	 M0ejpszuRqmBEchnnWeMh3tACjuhIat1v3FXoPFVtA6C2q+BbKrdYNQWIfr4nHCq83
	 lphQ8yTZbV9AA==
Date: Thu, 11 Dec 2025 01:27:02 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Suzuki K Poulose <suzuki.poulose@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
Message-Id: <176543802198.60924.10267408914731981420.robh@kernel.org>
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_232705_903914_933B0FF0 
X-CRM114-Status: GOOD (  12.94  )
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


On Thu, 11 Dec 2025 14:10:44 +0800, Jie Gan wrote:
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshold of the
> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.example.dts:36.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


