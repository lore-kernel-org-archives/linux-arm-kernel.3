Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AFEC02196
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gRqZvbYl6PPQ9n6OUKHTLMwUX4Pwkr9UeEVZmu8tX8=; b=a+TCk8W1Tf7zPbHz+Zy7cduPwb
	/r9zKggjk0QNNIzh+E/uhmf0rY6MaU3vTPNVPp01HQI8TaYuF0IEdSVQFVnaPiUz+M8RQ/PqtkOvj
	Q8x3isvwV7Jkx/etn1B+8rlDj8MIIWVdrwLChT5+SMxzAMBIlWyx1YE91CcvIcNGtLUdgE/66SfiA
	Ag1byd4Z1teHzmhNWsdSc8ZEqqkcKhJfTvjMZ84uLKHOrci/7YkJiJIw4QYTKG6BQ3M40eElUA1jg
	kK6ECd5p6gWZ5fMCBvZK9bN/GoAf6YWDSN1Ea6+G7HtIZaa2lPEaXpcwjPRj5gkol46j4+OAD+blz
	4BDh/tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcMU-00000002pUw-0HfU;
	Wed, 05 Feb 2025 10:10:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcI0-00000002oLE-0u52
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 10:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62A0FA43343;
	Wed,  5 Feb 2025 10:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648DFC4CED1;
	Wed,  5 Feb 2025 10:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738749947;
	bh=KbEFKDcO9YO05ffSaN68MjwT5lvzDBl0owN2twsZxVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=suPMxBHc8//jkuGVYHew4b4EOor217p3lUW2a+tg57A9fZ553ihWgLVGhNf5BuaZ4
	 LmdGIG4jS83tvm5Vxg7G5AeBNcYbtHK2UFTLUbtt+QGOrZBgz6fx8Wv6wZmETjhyro
	 J7j7NXrsVtzKLfzh/0NBCHpb8PDy1hcJuxOP9T4f3rXo5xKmBbPE7iIFtKGVXznAtZ
	 2kLqbUe0yh6rfTJ2K3jJsrVw1h3ypaCxo2fZJrYHvB6SfcDo2eYiCF1yzwbeUnmeqm
	 eyD5l4k09mQHhrtx388em9uBYirOvdPpaahfxS8C1biwwb2jkaDiTuXYdFwf1uwYcH
	 86x7+F6oSh/3A==
Date: Wed, 5 Feb 2025 11:05:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: memory-controllers: qcom,ebi2: Split
 out child node properties
Message-ID: <20250205-imported-versed-oyster-0f23ca@krzk-bin>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
 <20250203-dt-lan9115-fix-v1-2-eb35389a7365@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-dt-lan9115-fix-v1-2-eb35389a7365@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_020548_317748_12C3F11C 
X-CRM114-Status: GOOD (  10.21  )
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

On Mon, Feb 03, 2025 at 03:29:14PM -0600, Rob Herring (Arm) wrote:
> In order to validate devices in child nodes, the device schemas need to
> reference any child node properties. In order to do that, the properties
> for child nodes need to be included in mc-peripheral-props.yaml.
> 
> "reg: { maxItems: 1 }" was also incorrect. It's up to the device schemas
> how many reg entries they have.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../memory-controllers/mc-peripheral-props.yaml    |  1 +
>  .../qcom,ebi2-peripheral-props.yaml                | 91 ++++++++++++++++++++++
>  .../bindings/memory-controllers/qcom,ebi2.yaml     | 84 --------------------
>  3 files changed, 92 insertions(+), 84 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


