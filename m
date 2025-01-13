Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC190C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 23:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=151yCuFF7clhov2wOILNabEg5khSC9FkvjSMqwGYGww=; b=rik4HbKXlu9HXoql+olui0oSVw
	O5FicJMZINo2MsKsQ2aEiyvGhYaAhF2ZuB/8662qU6Pr2BK8ADQR0lMq9nP2pE0PLjzVTWDCYwaP8
	f5CMEydcBtKgh+48GuL9YSm2pI6qCIbYewr8eeh+rv9FDEhDUgINZx8JAid1kwnp6WHLrR6s6XURm
	CAjXpOPLk+sMx8xuhKwPnk55iRs/Fz3sxHYHe1vdEol2zcXn0oQSyG6F+rkmV+9Kv4+8Ol5mE4k78
	NF7AD2v37Cmg2ApWBPLx1n4/4HgMaIDIGe6V1CzTG+c7UnYtYPtijhXTpQh4mOM3MwOia9xZp+gbL
	8vmyqAGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXTse-00000006x9E-1Jee;
	Mon, 13 Jan 2025 23:30:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXTq9-00000006wWa-1yPq;
	Mon, 13 Jan 2025 23:27:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21C9B5C5875;
	Mon, 13 Jan 2025 23:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F588C4CEE2;
	Mon, 13 Jan 2025 23:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736810844;
	bh=LU24eK07VvcIkX9LfFim5vaybKtgDkqsrjcRzbnxX2k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OuqVNYp72kU4m/ZLkR2w8do2Oiy7y5lcpPjjFWqKewZyA9/I+AfNf6J6fhIREy+HH
	 b2GTXzah5jpzVNawtzHJKjPNsmddER5XS5EyV+lnP/ui7RZ98FxjRjrOkLDDhDSEJ+
	 w3o2P7HMbpP9MALBadSLs2ReFD3WOmrNlbtakMP1lI2o8PbPHCMfR4CA5pJ/pZO3me
	 AGqIhBAeTU9S4thjZi3hSL3UbJoyc4BC/d1Y3CdH2EbI82LfG76jQS+U1jdxYOlA3I
	 K1+p68h83RITXH3DxG1+Ac4PtDCfi4LWnRWWEimPPBtFo5rmnRXBBYxKdXpbZW7Xux
	 riTGsdbFdY9Nw==
Date: Mon, 13 Jan 2025 17:27:23 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-phy@lists.infradead.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-usb@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
To: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com>
Message-Id: <173681084257.3610270.9006254199741701933.robh@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_152725_549110_4E33A56F 
X-CRM114-Status: GOOD (  10.32  )
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


On Mon, 13 Jan 2025 13:52:09 -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 uses the Synopsys DWC3 controller. Add this to the compatibles list
> to utilize the DWC3 QCOM and DWC3 core framework.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


