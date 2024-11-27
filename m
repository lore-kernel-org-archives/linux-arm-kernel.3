Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE58D6ACE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHle/cvFTB626bZjyYfjQ/81l5NAk+SKJ8qUdHosYeo=; b=h//S4ePrrw7+bOpX3d5LqkpjCS
	9rHSMUQ9Z0pEVTv3lWQp9sBTveRrTtfI2es1q1Cax1wPzhQB8cvy7BBxFSYp6aEhKSwiO1WfT0UEK
	qyys6Lngnmyj1YlgBvTOqUO2GsLbXgf1RSX9WwamjzCpgd+DSszC+LR10RwHwSzdFO2b3KZAKflly
	lGujExDb6SSprx/p0/QK5aGlhgZPzixvLPr6tq80XMEJXJbYy5h6qjnVEymZxYfDiKn1jUANA5LEi
	iQVBndMkkeAw4NwbyFmHmDsWqOD+yMGLtwbXIeCMMp1Oy0sDZjB6TXgBRSQy2h/VgoTzcmtEFHNcu
	vUo9vyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJQo-0000000DQFy-1zdW;
	Wed, 27 Nov 2024 14:54:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJOb-0000000DPvW-0hRi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 14:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CCC9A438E0;
	Wed, 27 Nov 2024 14:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40AAC4CECC;
	Wed, 27 Nov 2024 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732719120;
	bh=4AGyVOnYw0w4dA8qEhJmW3K+EMnHj8IiVSZHynrM+v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+0diw/SG+LpWSeAMVxpAb/FmmbAkmMGG4B7vDhTX4AJVjigqTnN6FJoNLQIeH/Zt
	 JSwce2GHbaJki8uXr4zdsMlGJi7I4ZnMR27D4EGyQJj4kBliw44EyMT2eWb3IhQABx
	 8+7ydZJomGric4n4nS17nh/VHVhZLHhJ4lkRqmtzdoqBZUBDMioIuSueVVFlitriZy
	 faz3ac/nf1mI9mvxZN3k80Owjx218EAyBOr5mhiXennGgJACEavucWOVfkFOuDqtYn
	 0ElH5Ab4Z+VsvYq89DktlYtAlQHccODmNWBWiAUjkcmQc+kgUrxApHJnF0T21tn1Av
	 97VJRqWszflzQ==
Date: Wed, 27 Nov 2024 08:51:58 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, cassel@kernel.org,
	quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: PCI: Add STM32MP25 PCIe endpoint
 bindings
Message-ID: <20241127145158.GA3480289-robh@kernel.org>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-4-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-4-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_065201_265090_75D3BB10 
X-CRM114-Status: GOOD (  13.74  )
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

On Tue, Nov 26, 2024 at 04:51:17PM +0100, Christian Bruel wrote:
> STM32MP25 PCIe Controller is based on the DesignWare core configured as
> end point mode from the SYSCFG register.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-ep.yaml        | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> new file mode 100644
> index 000000000000..0da3ee012ba8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP25 PCIe endpoint driver

Bindings are not a driver. Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

