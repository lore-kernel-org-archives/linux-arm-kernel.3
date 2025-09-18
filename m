Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185AECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaadI5SAW6v0ky19+Ko5Bl/MrraxkvDiMi0HVLeIO6g=; b=L9fHN5zfJ+gu/r2Ng9na+N3rs+
	E5VPo9HXCTXtSr1iursm8Mfkrhr7NLv5QBFQp5pTCA1RWfUIvpxOw0LTjHkvp5wVR8yhVb1i2h8Lv
	dN4h2eMdWa6INi0y7gxBKKN0saRVFgqIehAb4dNtbcDeBrkXisMfsYOB6xiB36chBsokIjwkX6NPA
	v2hQ24AoCMruCwofx2my7k9cDCBcC9pOCDJrEhDp+HgJdJhsW63JseQ2JBoUIhgpcIyfSIfo92hno
	5YygQ7s7GERBoba0o1Du6pT1cH10Oy0i9RaewLOW3dWK7Ua6dJxZvtcEYU0dkP3oPSZ3YWX5sVk9U
	ewmRlhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3D-0000000H6pB-1XNF;
	Thu, 18 Sep 2025 10:39:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3A-0000000H6oS-0hTM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:39:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0D77439E7;
	Thu, 18 Sep 2025 10:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69582C4CEEB;
	Thu, 18 Sep 2025 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758191979;
	bh=fgVQ+j91Fez+nkL73mza5lRSVa/JXo8LJ4pD2kGgnIo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=j3+FK3JAwgdtXmAmA/n8u92H71M5nmXhj88js81lHZ0PXcz6dejE4g+PoS1D2NCaN
	 eQnTteMfrViMm+HcaWZrAEgPLB2ij3iBbzpI0Y1V5RKXEUhzETS+SxXn7XLZXIXmki
	 PvAil22+9Tolh89AXqSomKl9WjJuKKeJ7AQsqfjJV+V5Vqq5+9Nlnl8HvmH+h5+3Ae
	 frBfUxrXUWKG7IthYpVWfT/AT4I1+wsRXPrnMtBTa3g3wHhofsApylkI9b02aZSkgj
	 71CUivatKdvvr1C6gvAtstsxtB8hy8r94dET5moVfTum20xjdekXQmHOUCmNZTRIie
	 FePqtINQC/CZg==
Date: Thu, 18 Sep 2025 05:39:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: ningyu@eswincomputing.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, anthony.l.nguyen@intel.com, 
 yong.liang.choong@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com, 
 boon.khai.ng@altera.com, netdev@vger.kernel.org, krzk+dt@kernel.org, 
 andrew+netdev@lunn.ch, vladimir.oltean@nxp.com, inochiama@gmail.com, 
 jszhang@kernel.org, linux-arm-kernel@lists.infradead.org, 
 alexandre.torgue@foss.st.com, jan.petrous@oss.nxp.com, 
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org, 
 linmin@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com, 
 kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, conor+dt@kernel.org, 
 pinkesh.vaghela@einfochips.com
To: weishangjuan@eswincomputing.com
In-Reply-To: <20250918085903.3228-1-weishangjuan@eswincomputing.com>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918085903.3228-1-weishangjuan@eswincomputing.com>
Message-Id: <175819197799.813528.5926397518793037522.robh@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: ethernet: eswin: Document for
 EIC7700 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033940_224926_F683666A 
X-CRM114-Status: GOOD (  11.02  )
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


On Thu, 18 Sep 2025 16:59:03 +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting clock
> configuration, delay adjustment and speed adaptive functions.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/eswin,eic7700-eth.yaml       | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml:127:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250918085903.3228-1-weishangjuan@eswincomputing.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


