Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CEAC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 05:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0SGocToquLN1fFBmS7KLjAIRrJxEJXwbv4xjRLyoF8=; b=y4vplTTtaAcHAsnSwQDAv0tszm
	sBpJnsFLMIO+rJYtVmv7dJGt5lXkn5ticUJcrD+Pwam2VCXPTV4P02hGrQf6j3CRnFYv6/47zsPBg
	E0TR9H4R7z6YyQBRAYtZSmS6aDifJvo4tbTiEZnaSQpV38/I3QzuiaIVXpaa+f81oqM+7NVsOmNru
	eXzsGDY2RdCh8RbZBUYRRe8nLpYurd3A5FyvMUgIgdjT9RcydbfEmIr1OSb4evC5NxSJ08jSWUdVS
	940KIE4QGgUxuqztiGxTcthSiQOMHi2N7YwfQOfhmvCOSsOlLseHkn6Nhr5UoEiuZEXPzW/FsO220
	LGllBSew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjseH-0000000DqEF-36tn;
	Wed, 15 Jul 2026 05:59:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjseG-0000000DqDt-0cED
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 05:59:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B5E3601C6;
	Wed, 15 Jul 2026 05:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127FB1F000E9;
	Wed, 15 Jul 2026 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095150;
	bh=n0SGocToquLN1fFBmS7KLjAIRrJxEJXwbv4xjRLyoF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oq+KYvmE5SBNjAa0lG4FN4Rwv3CPNZ93T9avUd4rPiEGNeRK+sP2xbsfk2B3HggqJ
	 4VO/FSnRP1QoCAj1hsBSg+usGL2ZsYEukkJRGAWdz27uIuNicpvaqD9dqNSWsHoxIi
	 fV3K7DOFC3qhZ3xfQbbK0aO9qxieXJJfbz9Kri0wFZ1lDILlM2+3/dvZgZ8cjc/fjq
	 ImAOHHXPR8voq0ds6AYOnivUdCdiaR0Tm6dJ64F8SvycaP8IBSbsivvo3TuFJgK/hj
	 7FPr2vkluNlKB6yQs6p3S4HwpplReqR0YnJOj/RMAys64Fs8fVkWmE63KHebWzeVUO
	 Lz+yPhahON7dg==
Date: Wed, 15 Jul 2026 07:59:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Message-ID: <20260715-luminous-bittern-of-coffee-2ecfd1@quoll>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-2-4d91bcef50eb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-2-4d91bcef50eb@oss.qualcomm.com>
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

On Mon, Jul 13, 2026 at 08:23:40PM +0530, Taniya Das wrote:
> The Milos video clock controller requires the CX and MX power
> domains, along with their performance state votes, to be enabled
> before the clock controller can be accessed.
> 
> Document the 'power-domains' and 'required-opps' properties and add
> them to the required properties list and example. Since these
> properties become required for the already-documented
> qcom,milos-videocc compatible, this is an ABI break for any devicetree
> using this binding without specifying them.
> 
> Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


