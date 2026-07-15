Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7024AC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjm/2/Dd4ZfLuzbgAHtKlOVzx5R3S4ZFBISKeUkecyw=; b=xUXKIc+9e/xqVwpk+Pzvn9xjVU
	LT9WLQbE2hEMI4/ifRbRWQ9AmC8NAbQ2iiQkM1tcrB1uPfhOTOvlfYnuAv6uJLP9AcT1CBDvtdUdL
	hMmZa/g00F4DBpUvX5O24wrAhBPv+9xrcjIsHBhsQYQ7wTpiCUzZHo1q0iC37aknOTFLxhXeQwG/8
	X4FXdGsI54HVvin6aVZ7hXgQGgIrxTx78+7X58NaUVOyiasNJy7aWDvBjfDwyF8MzcOfNwR981NrO
	ZKH1yE43Bftk/lL1DFeT5INkzveFXje9HtT/9rgo4fQRHkbs6+A78t7Bc2rzIbNKvHu6cRk+nw6d8
	Xbp8ofag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjse7-0000000DqCV-2MCZ;
	Wed, 15 Jul 2026 05:59:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjse6-0000000DqCJ-2Xme
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 05:59:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7C1A42EA2;
	Wed, 15 Jul 2026 05:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05D11F00A3A;
	Wed, 15 Jul 2026 05:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095141;
	bh=pjm/2/Dd4ZfLuzbgAHtKlOVzx5R3S4ZFBISKeUkecyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TPWIoQ9iGrbYDn6JQ7C3mSfqeeS1y1SPv1SXmg6VXbrt5OVz7AhxoSot9s5mv6nLp
	 CYvV8qmzOZvZLAFpTigTfcgZRMZZMifGv/bCl+9//pDkcI+DnrFDwCqykTMe/FdChC
	 9URwadkBvghO2yQDCRJBxclTSTC5U9oEA4M5ulZCxP2pGIpFRYlXkhshU+QX4mZvrJ
	 WwpOiildTfVAUuoOZutQjClOVzO6PmGSK12wcNQYB58vnBjBsNtVDWDi4VGvMQebsU
	 0DlLCUmFXAKIhV3OSuDOgLInILAinZrRBkpuTzZZyYqDi30A02mkvkFhuUFlWkVNPd
	 h8zbc3V0Im0+Q==
Date: Wed, 15 Jul 2026 07:58:57 +0200
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
Subject: Re: [PATCH v7 01/10] dt-bindings: clock: qcom,milos-camcc: Add
 missing power-domains support
Message-ID: <20260715-eager-smiling-swine-8484e0@quoll>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-1-4d91bcef50eb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-1-4d91bcef50eb@oss.qualcomm.com>
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

On Mon, Jul 13, 2026 at 08:23:39PM +0530, Taniya Das wrote:
> The Milos camera clock controller requires the CX and MX power
> domains, along with their performance state votes, to be enabled
> before the clock controller can be accessed.
> 
> Document the 'power-domains' and 'required-opps' properties and add
> them to the required properties list and example. Since these
> properties become required for the already-documented qcom,milos-camcc
> compatible, this is an ABI break for any devicetree using this binding
> without specifying them.
> 
> Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


