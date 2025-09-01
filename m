Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B25CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmhrtJ3SpQFTEJYu3C44GX4F56teJp8N8kqvQcZ9TXE=; b=2HjvproBS9Aym5IaUlvHfIDhTS
	tZHuCNUabn0+xCgziiAfzOXxLzeBnpdaKmRznq8dcFxYgeqbJJF3RMApN1oCUDq4PNZc4E9sq51RM
	0ATyJ965iCqfHZE1YEtlGIRN+4ku8JgC1jVt5zZkrJQjpbL6OjJ1gUajt8Dlg37HH3rennaayLWhn
	0BpW0aQD/LgEcRv9axgliaB0c9LcKhsNWBxlDJB6STCDEh0YK8DSL4GJjZM6fzBWLBWTvkruEnZln
	PxrZTgKvdg6pwdQw+7GQ2i/V7JdPVaLQC7SEXn80D3tjurlReCQSEIzPYrfjVO5MAW4E6E28UKjA2
	E9td+w2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnH-0000000EIEm-1DQd;
	Mon, 01 Sep 2025 23:18:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAwI-0000000Dkxx-36ZM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 20:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VmhrtJ3SpQFTEJYu3C44GX4F56teJp8N8kqvQcZ9TXE=; b=NHA1Z6uo1BoNEZKPCJ8RBHkRuc
	G3NYNDkJrZq2KKka3FyqHJn7AmSV1jPqkJ38M8fBkr5Zj4dCR+1GG1Ov2I1kJBkE8UzZP2n5JTsxh
	p2R31nivOKRo/lMTn4XZ/uIzZwAofqjmmlI6cNKnKPV0SiUtydjyqCevwA++7C+6D0RqVGb2QT57e
	zcgXq2GvS+QeciVTX6QM9JktZAK10M8MSkHDFN0HbNzRST4lkKn1DUUO9hCKqcdcKhRQtfDLlITkr
	Bn5MYyNdGXOyokxHg4y0dvgrg3akmVqRWSv+/Y8a+f5wWc5dGKx7pUds8TEvCxE8LmDMZlgLjJSCp
	5/gcs58w==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAwF-00000003rgh-0nsW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF18F4052C;
	Mon,  1 Sep 2025 20:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92333C4CEF0;
	Mon,  1 Sep 2025 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757733;
	bh=3BZH0uUJXuz6io7ubXiAH/ONnYIewmwaMA9TS+0uono=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJNldwouDLazoESO/VLGKWy1lJLAmMwN61v5yNIha6IorVJ6x0Uo1W2ciPuGtDtZa
	 vaKC51dBvS4xPk4bUQD0B819+3dt2rEEfUeOM7tzKOLDJw4OS9M7hdXdRs2lPAuCAX
	 zbIiovzGaDmTW+8wv1LRHM/fkXv/8lEcLhXGFRf1YZhu8wXVVtccELOFm0YQaIN6ir
	 RySrXeHcq1pN2/gasphhAicd74PCSAZDwo3+NUyTttiKGQ2w8xvxU7RfHO5jOqy9vh
	 D6xh4sp18r6CZVNL7BEkpXFte4mHCer7cceFvy5c/5Y9jnOpXjWOS2Yb3dKr8PQgZH
	 9j3tlEYmiXxZA==
Date: Mon, 1 Sep 2025 15:15:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: samsung: Drop S3C2416
Message-ID: <175675773230.269015.13722583795481095762.robh@kernel.org>
References: <20250830113253.131974-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830113253.131974-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_211539_650945_E88975F1 
X-CRM114-Status: UNSURE (   9.75  )
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


On Sat, 30 Aug 2025 13:32:54 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ------
>  1 file changed, 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


