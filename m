Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBC1D6207F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 17:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uymq2hJ1K6hg+gKANx0iVhR1Pmu3mEXXieKn7zz3mao=; b=Ce2qPdHd46IfIBJH8HFmA7c79b
	Y7Huwl8JT4T/EoTecQwe2zuSyIUW/2Zr8djnmDjcVof4V7kvvAKHHTO8N4HrGY0JJWeUN+iHnXByc
	AcXInFoUtsO/KTP/WKJbXyr/gaoA09IilrbEUQ+1IRH/SOWUYhv8AqLDCSGszcv2bPrECb3QRqMwh
	1pmhexTMCVdiNoH1UngiTOERktpQIPHAYZrFrnE30O+idqUwO48ZBbd5RwQ6+4/fbM0XWajaGO+yg
	fBHyJJ7T2MDnaorziTSVbk/d2u+rtk4aC56WZ3ZFaaV7VhCOCGDHf9GpiZLlh3BNOUaHEj5E6+zp7
	MCEHT8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSFf-0000000DFfw-0l3N;
	Tue, 19 Nov 2024 17:42:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSEh-0000000DFWL-3U5G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 17:42:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8FD96A42D80;
	Tue, 19 Nov 2024 17:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83357C4CED0;
	Tue, 19 Nov 2024 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732038118;
	bh=fC4Iu6ZTvWHVn0mAs02BF67Zmknk558M9DVYXjCgc4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ss2liA1CbtHjZtbxReG294xHb1gK7mWNfZcPAT3S6IoLVxeHOZMI+N76tfRN18dpw
	 L0tCD/2wgFXBxM1qWJDBHnZDl/jeJfSvEHTX64KLSF1Eqd1AT5HZnLaeeEifiYC+XE
	 lzfgTvx/U3s/CbkjsUN/v/hPdBPOhRs0AnlvtVG0F7ff9y+iQ7JyaMYz5BzwDNwaqL
	 Y6jZEput4/yxkde6XPdP7J7qVCn3OVSJuYQ8YpwqS3PL3KAOPep8m8CF2eRqxyswUn
	 9TkeeWfUkuZBtlY/nZGfs6xrY9pj0jxfGmYU/5GRXFRCYHDkZzQmhcg24iyx4m/WQX
	 y+yEn6R3bYzJw==
Date: Tue, 19 Nov 2024 11:41:56 -0600
From: Rob Herring <robh@kernel.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, quic_tingweiz@quicinc.com,
	quic_aiquny@quicinc.com, quic_tengfan@quicinc.com,
	quic_jiegan@quicinc.com, quic_jingyw@quicinc.com,
	quic_jsuraj@quicinc.com
Subject: Re: [PATCH 1/3] dt-bindings: net: qcom,ethqos: revise description
 for qcs615
Message-ID: <20241119174156.GA1862978-robh@kernel.org>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
 <20241118-schema-v1-1-11b7c1583c0c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-schema-v1-1-11b7c1583c0c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_094159_999913_9A820E8A 
X-CRM114-Status: GOOD (  19.66  )
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

On Mon, Nov 18, 2024 at 02:16:50PM +0800, Yijie Yang wrote:
> The core version of EMAC on qcs615 has minor differences compared to that
> on sm8150. During the bring-up routine, the loopback bit needs to be set,
> and the Power-On Reset (POR) status of the registers isn't entirely
> consistent with sm8150 either.
> Therefore, it should be treated as a separate entity rather than a
> fallback option.

'revise description' is not very specific. 'Drop fallback compatible for 
qcom,qcs615-ethqos' would be better.

However, this is an ABI change. You could leave the binding/dts alone 
and only change the kernel driver to match on qcom,qcs615-ethqos to 
achieve what you need. If there's a reason why the ABI change is okay, 
then you need to detail that. Did the driver never work? Are there no 
users yet?

> 
> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 0bcd593a7bd093d4475908d82585c36dd6b3a284..576a52742ff45d4984388bbc0fcc91fa91bab677 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -23,12 +23,9 @@ properties:
>            - enum:
>                - qcom,qcs8300-ethqos
>            - const: qcom,sa8775p-ethqos
> -      - items:
> -          - enum:
> -              - qcom,qcs615-ethqos
> -          - const: qcom,sm8150-ethqos
>        - enum:
>            - qcom,qcs404-ethqos
> +          - qcom,qcs615-ethqos
>            - qcom,sa8775p-ethqos
>            - qcom,sc8280xp-ethqos
>            - qcom,sm8150-ethqos
> 
> -- 
> 2.34.1
> 

