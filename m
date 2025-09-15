Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA8ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKUDpDfzBZ4KYNKc8nx/AQL3mt0Lz/4GCtOGcv2DnLY=; b=jeR1Sld+QA3xxs87JjT/UscvSk
	UMkWvV46y7QUMVVHJWR0cYkuivaW8Hv2D5saG68/dhiaIjOtCwpZfrTS7Hv/PxJtSRW46mNex1G6h
	QcQOcfDl2btE0hdw+170rDlcFn7K+zAXgwONQko5qJ+cwvSQHkqWeT7IXs5KG2zNFjPY1Hn8X02GM
	Huh5M6lIF54973C+VSKbItRMuiyMtDsoSYXX+syFm0Zze6FsW2n68JjooMU5wteHBjSP61S8zyazz
	tv8EXZut4nZhfEAQRWXWAHhz5bKm2h5L7AWLRwca0/6q/z+uXRM3I4MfrfeET/3CQVUFrdYt1ucg/
	e+PxRzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9YI-00000004RJQ-3HJ8;
	Mon, 15 Sep 2025 13:47:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9YG-00000004RI8-3ZOA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 13:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CKUDpDfzBZ4KYNKc8nx/AQL3mt0Lz/4GCtOGcv2DnLY=; b=LcRxEHHlvbqzYC5dtPCoD0M/k8
	wS7VwhS83KBdZMJbcaT1pUXr9pmR3l9BCBwCxZdjbvHvWKrUr5OL3hbYkeeVlBHwmYYCNbjwHiEVS
	Lec7p6K2bRRe+F1KdOxVw29G5yms4WAWv56P5eEE2texwfbc5bcURDS4EGePzkSLLa5lcpL38Ut2Q
	ENP86CaDsRMyfSsuvYbYu3ZuYrFA3zhWGqhYthX5XIgvmeMdp0YPbqpDezWn8jZAkE4XTina0o0ww
	DbeKM/9K4V5Z6Xg+sROD/ULn1h4CAfYZl7NgNvuwVmid1eshjpDmI/OnnAfbpT9fo8EUHzk/IOB/A
	e+Hj1y3g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9YD-000000071NK-1XDF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D540436CE;
	Mon, 15 Sep 2025 13:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E81C4CEF1;
	Mon, 15 Sep 2025 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944041;
	bh=9AViTU5RWD1JwxYeTPUfmvXGdgLMSJvWywCAquChztA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5KAfDUWhWUxaEyqapMF5Cz0bLydBIAIluRn/zrIwSrGO1+Nw2U2GPTXJpThhAbsF
	 5BHDeWxydPDVX8GJXKoczVtLV8Z0SCcUJIq2BYyKb8RV8l7YJraFEEkHBr60QEVwfs
	 QEj5vpwKS1xQdprghKyJdFRKFYhiWQB8iMtPiBRpqL8BFftY7iTcpzcBIRSsQpHuPG
	 9fZV7vcTJMQYwqqSoWRjP1lj0ChhmWq9R7n06kNkN5C2MOi39lvAwJeb30zYPMERy9
	 m9lXC5JFhJLdfx7HOFWt5uOjSqBUuWTAqcH6ZsvLf7O8bLz67kO74aGLa3tlsQMnjO
	 hHSKzNGq2hU0Q==
Date: Mon, 15 Sep 2025 08:47:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandru Chimac <alexchimac@protonmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: soc: exynos-sysreg: Add Exynos9610
 SYSREG bindings
Message-ID: <175794403920.2666251.4158627694069114504.robh@kernel.org>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
 <20250915-exynos9610-clocks-v1-5-3f615022b178@chimac.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-exynos9610-clocks-v1-5-3f615022b178@chimac.ro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_144725_691503_6BB122DB 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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


On Sun, 14 Sep 2025 21:20:09 +0000, Alexandru Chimac wrote:
> Add bindings for SYSREG nodes, compatible with the standard syscon
> driver.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


