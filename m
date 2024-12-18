Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E89E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qt0P3R1vKXTUavS9vBpfGY+ZxmfygAefQyUoKcSG0Y=; b=xth+PWpBcVX9emRalfLRCoEP9j
	iY5ft0ELs/zM4xe5IzqqD1s+FssBMMEJgdK08iBN5T0Fq7c5bfncGWgjBD39nuPZBdkFar0E4U9wF
	03XV9+sJjL2Q6CAaxt9gQX8drAtvsRMhUB5+ZoQO1rM5uIVOY2YyUvSWKhZq20uYfoTe3K8ebyfZ/
	YcHYbTOaA/IWDdZxZUOqGRMj03atktpVQ4C7ZZsFc0GySnYFtM1m2Vb9JOKCs8UWrQXyx6Kv0ICVH
	O4TJRqiltdBwGqgyeVZ6T6zIzKFrNymlhEmeFtZe9v+Iwtn888464GPKrXDG6TkEXMfTzfQJR2XV8
	qTFWqCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrDN-0000000GFAp-47hp;
	Wed, 18 Dec 2024 10:23:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrAu-0000000GEiI-1bph
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Dec 2024 10:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+qt0P3R1vKXTUavS9vBpfGY+ZxmfygAefQyUoKcSG0Y=; b=f+XVgUmmkMMTBv5uEwGCbsCNXu
	cpDc81nf6Oj10MsTQvRAwjlOlVpEArnRcs28Rx99X5PWykjSadlgIxThSb010cevwhjw+rMmZFWwh
	rxSLIpG1Baqs7tYhUFxp1ubZ+UIePcJiDDgDx+VFO5RM/EDL1nXX55oKCtJWOo7dTpOJYVCKVDEKY
	7HHY1mYceW5/KYlgKJyw+ZV3kGlmjShJ593xndW1OTj44aPl3lWCDZEbeGwcNzkXHnsgQ8i4ALytw
	r9Uc/j/e9/cjRmpIyNOJ8ZStLfh1iGvi1Myg7P6MFZgkCQmARuT0n4CM+9ij/Bu9FuBfTKhru3riA
	vZ/k1/sQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrAr-00000005Ebs-2j6J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:21:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6481F5C60DF;
	Wed, 18 Dec 2024 10:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B20DC4CECE;
	Wed, 18 Dec 2024 10:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734517255;
	bh=Ab03XkBtUozzcDUMdRROIutgfm3vkMiKIL2A68fECHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZD6fgX2S68dJW4GP+MS3aRohCyuLVIN7F8Khpjr2vRlROwsLlMqczZPp6LAzRGy+
	 KBhc0RIvygKEB4Bk9ks8HLU2svTGV76k7x1NC2gCRVic0VzrIrvsuPG0AnvJs33B1S
	 96POBOWFBJeP5RoqdB7p7gOXsxDd4PQxqR3nSSe7L6/7+O1mijrGXfC+wWl3sqN6Vg
	 g/UNb8oc1Wy2UyCXm7YcA8xEJglEEKtiE+H6tkTbRJKbVl9z5rk0L/1UQGkAy5gVzL
	 LK+a9Q3srp2YP5pGsSKhJy1jxQs3E6zSIU8OcyK/GJqdlzrIyB2L3SFk0EzU/TkrR4
	 KoZaHHZaktfLQ==
Date: Wed, 18 Dec 2024 11:20:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v5 3/3] MAINTAINERS: add entry for Samsung Exynos mailbox
 driver
Message-ID: <67thhhblxntdoej3gzxj6qqwaalloztazujfydv22dl34lemir@ixipa4h2fnwm>
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-3-cd1d3951fe84@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-3-cd1d3951fe84@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102101_899266_D41CB892 
X-CRM114-Status: UNSURE (   8.86  )
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

On Tue, Dec 17, 2024 at 09:40:22AM +0000, Tudor Ambarus wrote:
> Add entry for the Samsung Exynos mailbox driver.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


