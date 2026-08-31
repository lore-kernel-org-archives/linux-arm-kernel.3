Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A52C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsDsXUk/nDP5qhJBBwkmhIbA361/d82hYpBUhJ/4iyo=; b=ir3991kXGOdYLSHb43pef+HqmH
	ANu4kiTenrab1h1xvf8kLAZN5v70wE6Q3ByV/OUMQBgQJU/M3ljoYH4rvDzS3EHKd8XGwTbFtsIDQ
	/Z2tV+PtleQ9pHfn5RnZFB65v+7hG/vXbvABP8itj8l6lYuuKdjE/kNEeP2JO1iYMBCi3hlFXK49G
	pcQp6Cepcq7iSyj5XOTypTnBg5TCpgOto1E8u1IJUMJQeDLfJj5JujRMuqQu6LY73bh7+MCIHooyW
	U4b/i86c/MmIsVZUCkzbiwQSV2uryTSgUj9ms3ULxsCzJugusAIy6o+y9QqhsuFQlc8kRLN4rnM1z
	81Qs2y7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wK5-00000008iNK-0KRt;
	Mon, 31 Aug 2026 07:20:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wK3-00000008iMT-26wP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 07:20:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0574601FB;
	Mon, 31 Aug 2026 07:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF121F000E9;
	Mon, 31 Aug 2026 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788160850;
	bh=OsDsXUk/nDP5qhJBBwkmhIbA361/d82hYpBUhJ/4iyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Evwalu5vNSHZXGZm1ZyPrVFPYrvh2+XwtNHZmEtSOKu1LTWG1C1KhTf6mmSl1aXnR
	 8928JrMLwrh1g6qw4Mp7lPtE82VDyjTxp7pzD060cahA3QpJyf5GXDAK2WzvgK3zxg
	 gwbF4hJLEhKoKVaubsuDXxagKJfc6u3SXhMk1K9aNmK2S3zFVMZ2YUnT6LE1R7enG3
	 oX7MALyfCXwm1c1fXxf9zxfptobJjJ5SKRgD3tX3bBT1SO/mauUAsdWXts5JEGAnZ6
	 565FzyOBSqIFhWK9KYRxQSc8mWq/nAKCUtFXUeDloaKXDTBwBIJ9t2wfrC09Htop53
	 s95OUacl9zbEg==
Date: Mon, 31 Aug 2026 09:20:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Georgi Djakov <djakov@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
Message-ID: <20260831-clever-koala-of-typhoon-d3fae3@quoll>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-10-6d47636a8f09@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827-kuno-soc-support-v5-10-6d47636a8f09@oss.qualcomm.com>
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

On Thu, Aug 27, 2026 at 11:21:13PM +0530, Hardeep Sharma wrote:
> Document the Global Clock Controller (GCC) binding and associated
> clock/reset IDs for the Qualcomm Kuno SoC.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |  52 +++++++++++
>  include/dt-bindings/clock/qcom,kuno-gcc.h          | 100 +++++++++++++++++++++
>  2 files changed, 152 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


