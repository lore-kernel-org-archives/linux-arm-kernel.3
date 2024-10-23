Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15895D2E021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xucvEVD22+1c/Drr/tmNaS+bNLqZ2werLeIeT4aaq9E=; b=YIchoSSZpYrgz3U774AcLm9Dh7
	lC7F93IuHQ8sF86jT+xFf/JO2O4AT5AhSJKiGtpWelbf16znvoXILDYPBJm0jj5kQGWu1CQoGKoAU
	Z+jjugSKvnENJ+3vMa5asUKK8kHR9og5Ne9Tt5OUubqNO9rWEBlHZVrh/lwmkB9haKs8Ty7xa3gKC
	Ar5x+QfPdIDVjBQzReejyBcqZuW4oKzCQcNE7sNti0HIF4MO0iqNeJ4tchz3swaruJIfBVFVKrw8J
	S3Lx+e/czcPIq2Mi3OEHuJwvwXP0JwfQ1hw+/oVSTVhYrwfO3819XDLhYGfkpoB46M02E2tSe49NP
	HB2AlMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wpq-0000000DaZQ-3MSO;
	Wed, 23 Oct 2024 08:35:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WkR-0000000DZIq-29zG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F877A43891;
	Wed, 23 Oct 2024 08:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF55C4CEC6;
	Wed, 23 Oct 2024 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729672182;
	bh=qP2O+eiJB8iJQfwbz4B5eYxZINBTQj25Ci5NIhjnAO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qf4xxSiFOIOZzKtqrTLMLMIV3mwwAexv3DBcbYD3oxncB+ex6psESW/4fQq1+WvlM
	 iNbeUddsoqLJegxZd8lDElmi+NQ6ykFIinHYpYnEpGY1wZ9jT3TQO8Jzx62zU6yd7W
	 Ec9TucGeCLsuOyzfpVbJwi9jbrbyI6NYawVsU8msP8+RixANZUWZjjEd6hqnkJ2RBH
	 FqapQZB76CnfzBF/k8sCqWQG19qyZItvy7Ixf4ow2VZu3NzvLi1ahXnyMxHnZPL3M+
	 7LtW3dTPimBsO1R6J1vTOGP5lP5repUELMHrhQfyG/dy8RkT5SgCkZ6ueWEB4MTISz
	 WiCVheoVCWvVw==
Date: Wed, 23 Oct 2024 10:29:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document sm8750 SoC and
 boards
Message-ID: <q4tdx4tf5vlzky45bmrllxuwivtah43grl4sgcw4op5udoy3ve@baqlgxq7eyn7>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-2-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021232114.2636083-2-quic_molvera@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_012943_638366_83F73336 
X-CRM114-Status: GOOD (  10.64  )
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

On Mon, Oct 21, 2024 at 04:21:10PM -0700, Melody Olvera wrote:
> Document the SM8750 SoC binding and the boards which use it.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


