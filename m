Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBD2C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0FQAZMCTtVMu+SfQBpj4XUrE+k5949tT3pyyR9/qH4=; b=t6Lv5SXMmuuASHUII+KHHRaW0v
	ny1mlSmEUKnQcEOPODjg2A7Ypg4nZj/7lfL4XZ5L+7snaycb5go+WntujNRb+y5jCDaCluFKE1BGZ
	4Lu4n6MyluIBLdszLJzguoV/s8Y+vOcn6zwYU+ydP3tpf5iwKCUVnywgJCOqyeOasHxmPtp/tNWjv
	emxxqTOj3ngL911BErnXsZRw4EnnWE6kJXnoAMJUkY7qGcj7J/Ig6cfLT454Gdvd+n13/RrilhvUe
	maObroyjVfZo6Gr4EVoHC1ixO+ALcnVymh9mx/hPwtbxHlg8MAWenOvsTH0eHRMCi5+tpk0Bp0hBd
	rRO06Zlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrca2-000000044ye-1jqI;
	Wed, 05 Aug 2026 14:26:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrca1-000000044yX-1DtO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 14:26:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C538E4179B;
	Wed,  5 Aug 2026 14:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17B01F000E9;
	Wed,  5 Aug 2026 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785940008;
	bh=h0FQAZMCTtVMu+SfQBpj4XUrE+k5949tT3pyyR9/qH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qceu6FYzmtEP9k/+BTogjyl7kCvl5SLBImKlYNAsxgA0B0R6UDLtjFxfAku3TQrdG
	 fpyToLNBAo8AWZifjl1u4VuLFi8aDndzEHqltMC+uzWTID8BBzXnUjmtuEsi9GRfku
	 yRWFFC2iPdHMgJgzCDrEowY8jEM66OOWqJPshFgp6+XI/AA4CViPT77OxdYJZXlwIO
	 22rZX86QnymccpzY2iax3No2CXgLkhnjAK9meWvVRYVui3p6BrqMbd0JJn0P6g18fo
	 K0Bd9PHPwnX6KUHdrf2fB2BHYJY0sRSFrBXn7ggBwvWQb4Wq3h/N5XcwGvxU7Tu/LB
	 TMEE8HEjAXvxw==
Date: Wed, 5 Aug 2026 09:26:46 -0500
From: Rob Herring <robh@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v9 06/10] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
Message-ID: <20260805142646.GA795123-robh@kernel.org>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-6-39067760dc3c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-6-39067760dc3c@oss.qualcomm.com>
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

On Tue, Aug 04, 2026 at 11:20:19PM +0530, Taniya Das wrote:
> Eliza camera clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza camera and camera BIST clock
> controller to the existing Milos camcc binding and add the
> dt-bindings header for Eliza.
> 
> The camera clock controller provides power domains, so 'power-domain-cells'

You mean '#power-domain-cells'?

> must be present in the device tree node. Add this to required properties
> to enforce it in the binding schema.

The sashiko report seems valid to me. Should cambistmclkcc be a power 
domain provider?

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,milos-camcc.yaml           |  12 +-
>  .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |  32 +++++
>  include/dt-bindings/clock/qcom,eliza-camcc.h       | 151 +++++++++++++++++++++
>  3 files changed, 193 insertions(+), 2 deletions(-)

