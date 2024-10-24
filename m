Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C0FCE8E92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIFlZ6/nJlWO2nrUvncmn0GK3k/jz6nd/gNeCMrrTtM=; b=QwwyL6F0P9klzH7CaAEKC+8jnk
	NdgusQBS+UDn9h6vA+x4ACXbIIuYdxassp6Ocy1UuLQf0OVB2IlUkvPGl/yOzV47ZlF4MfO65fLME
	yYOQ7sfkqc8XKRF4vFuvystoHt8ZMq39NDRPPV3EOqHyO64z+ZgPJfyrQ7QhEe75XHjE3tOjNLYB9
	50Ql8KeSrR2MV86ROXdYKsw72JBNt1ZmYqxEYRzgpMFj15CzWE2pLOUBu8jjp6Ioat6odGw2zvrqo
	lcab4adYRPDu8zHQVswp3PR/yEcuH+g/JhwxzexrR4BfFIUd8wjtorgiQJoeHdtKbudztYmiA1SKn
	vHXbnegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40gq-000000015iT-2KvN;
	Thu, 24 Oct 2024 16:28:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40e8-0000000152Y-1POt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F5525C5FFD;
	Thu, 24 Oct 2024 16:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F03CC4CEC7;
	Thu, 24 Oct 2024 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729787110;
	bh=GzICAYh6bjGfgV9C6PPyoTkjloSrnHwuu9P94evgThI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3dhrMLl8apWp+gJODKUv8cMryScIDXECj9ASGjjBH2ZfMETMd/mv6jmuh6vKxS3b
	 Gc6yKU/UUOR7jibYD6wKhwMZWRVO1P6vQGeLO3vNbtGsKe2kYAgGWY6PJoNQQqhZMQ
	 VmP0kQ8CkO39A6usjVqBN2y6Ik0NGeTYYq73Q45PbbjH5fSs2lDC6bHxYZqwJtc34+
	 apG5RE5qqaTGo4I90mhEeFd3BwCnesKOZxuGtb5RKUs+ihomfX8a3BUsz7hZUQlpuB
	 CwfBAeQMTvkXxMsGuIhYVtxu9pwCtBfgH3KvJZJJ6b13eKG+Oz3TpcnorbUudXf3SA
	 RhoUvZ4NPRszQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t40eL-000000002ap-1a7L;
	Thu, 24 Oct 2024 18:25:25 +0200
Date: Thu, 24 Oct 2024 18:25:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Route pcie5 MSIs to the GIC
 ITS
Message-ID: <Zxp09Q1DPYf9BK0z@hovoldconsulting.com>
References: <20241024161814.1827514-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024161814.1827514-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_092512_741733_E874DE14 
X-CRM114-Status: GOOD (  19.72  )
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

On Thu, Oct 24, 2024 at 05:18:14PM +0100, Marc Zyngier wrote:
> There is no reason to use the PCIe root port widget for MSIs for
> pcie5 while both pcie4 and pcie6a are enjoying the ITS.
> 
> This is specially useful when booting the kernel at EL2, as KVM
> can then configure the ITS to have MSIs directly injected in guests
> (since this machine has a GICv4.1 implementation).
> 
> Tested on a x1e001de devkit.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Sibi Sankar <quic_sibis@quicinc.com>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Johan Hovold <johan+linaro@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 3441d167a5cc..48f0ebd66863 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3281,6 +3281,8 @@ pcie5: pci@1c00000 {
>  			linux,pci-domain = <5>;
>  			num-lanes = <2>;
>  
> +			msi-map = <0x0 &gic_its 0xd0000 0x10000>;

As I just mentioned in another thread, and in the commit message of
9c4cd0aef259 ("arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe")
this was done on purpose as

	PCIe5 (and PCIe3) can currently only be used with the internal
	MSI controller due to a platform (firmware) limitation

Did you try this when booting in EL1? If so we may need to enable this
per board.

Johan

