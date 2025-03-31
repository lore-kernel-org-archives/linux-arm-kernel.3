Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9438DC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 08:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u48z5zRpAVg+nYddRAf6PeJ2jA02fYqThbVqlqdI1A0=; b=Z4VBSuHae+Znx04l8sh9ysv6i6
	9xiKr1TPtOxVlukoHtNH/DpONf/+exMQGRRMvJYLr130N+1uyhIHfY5s+ajSI/gpIBmYvMnr4k4vb
	/fMycNCdSa+WOwi8+jtlyaRTxQ/Z6Zm3QEmr8dZRg4QQTfHdNAvkC+LskyuSw0Cqtjma2jlXOBPxK
	aJQnxdZdW0siD8BvxKr4pnmYPX21wkB5zMp62YRiqQPjlwhs+ZoatEj5FYhUG6YWt79AW/t+tSbMm
	MjjDggubRkBuwUZ9S7VEsGMrYvhJ9GEcTJSdI1AIuIDvGPZYklYRhQnoMXYt/UdKl6veIRVoukbvQ
	VshS6fnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAQY-0000000HLT9-295y;
	Mon, 31 Mar 2025 08:23:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzANN-0000000HKxG-1Pzk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 08:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55E3F43774;
	Mon, 31 Mar 2025 08:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27FBC4CEE5;
	Mon, 31 Mar 2025 08:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743409208;
	bh=VXxFxHZK8YI/P4GsKu4JzltWluQVJHCyC/qX/kW2Ars=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0MVxr7SWsGz09FCeo/mbZGUhEy6sE2B7F9J2KGvWnhNIlbWWYcHVbD5Nd8Q0DMjX
	 CPBJbyVVCgnV6rKqWVtdNsdW/RMY+E0lFLdSKZUsAzNUtbGfaPzaMw+FqwIyJX61TZ
	 0FNqyOdxR/dmCwafSGrvqy56cCT44gq2xpJ7imhRdmoJiryrbW6o9sWfi/d9AH4SO5
	 K+rcq6YXWm/efJo29pN1aEvptRNAwsRzy01L/8uR4ATaWWXyXuFO0p40FI4opcnJfH
	 oxbCT2j0hLvXDRS8Nbq/H2Dg6ftAUO9pfHExgEotQuvQdLzg8FD2MJcuRuZZRzEVO+
	 do5JrglvID+uw==
Date: Mon, 31 Mar 2025 10:20:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	Kever Yang <kever.yang@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: vendor-prefixes: Add Retronix
 Technology Inc.
Message-ID: <20250331-logical-furry-rhino-04acf3@krzk-bin>
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
 <20250330195715.332106-3-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330195715.332106-3-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_012009_391854_EA453384 
X-CRM114-Status: UNSURE (   7.50  )
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

On Sun, Mar 30, 2025 at 09:56:10PM +0200, Marek Vasut wrote:
> Add vendor prefix for Retronix Technology Inc.
> https://www.retronix.com.tw/en/about.html
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


