Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499E3C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 02:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAROnVhnAkeu5y0AEEbAdxluS7JzVCg5yWSFlsMM8jk=; b=L9Kd4LRgTo38EPS45F0Byv+TtW
	F2yhyNTnMn5okCHXCcfxKw0Q2w2ez9mpnzmxJzgY6rT0KBVsvgY5VI3rm7fxYfnnXK543lJHF2y7V
	mf4HgvHH+aSMgt8CKgT3IlZycbEmW/N1rg1aJS34QaYHrCmSDfs7x02W3Qn5yrqyfAsc5uBG2ajTj
	s32JdsfUG+RAmeM5ZzRasssj8MqZErJtFp7aGm0v1n1p+VEALpenXlmwDkMSSqsdwawhKwPtxvcqS
	eGgnUw8uSR7jeU+LXKFFwPEAnl1u0i4WMiwpkDnRDC/vUb5SkZGfCWU2Uaot7G/TSxjTIw1SoROMl
	siR19oGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLYh-0000000FGZo-22nj;
	Sun, 02 Aug 2026 02:04:11 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLYe-0000000FGZH-4C4N;
	Sun, 02 Aug 2026 02:04:10 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hCNQW6jbVzMlGX;
	Sun, 02 Aug 2026 04:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785636244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GAROnVhnAkeu5y0AEEbAdxluS7JzVCg5yWSFlsMM8jk=;
	b=n9i4I1vozJzGZcSPuIoPpLuypkiaRkI86dE+jgR4bL6ZvLQHNoHA4HObp5ayonRe1/a6Bb
	vrBsYoR6rqAPIOH3V8Mo74XkOBAeQBe7kc6xqJ0Zb7kBZvue9dVuLv5pz9hTpgtdMH/dPK
	BGRlAunqEnIAEyOL37lTTd3jLEx3uNTqIOymmg4w4uZqZzLe6Mh2PC2Va21XFoYeVbbzF7
	DGGCaaSLVr6vbRCcfF6e5lebf/5CDA/n2TzuiD4v+q/NCt6g+AU2GCmfG5QDUhYvNKk0Sg
	QLMs1EAJ6sjHntWS5lfdpoyTE+aUe4rQX4TZac7x6jSeMrfi/AfKQ5d9qc//wA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=RgItc+k+;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <6108aa58-3595-4b43-82a4-6f94cb9cca31@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785636242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GAROnVhnAkeu5y0AEEbAdxluS7JzVCg5yWSFlsMM8jk=;
	b=RgItc+k+jb3+1Q+UviTwgUyiZsOWh004DL/I0Fq9hJSZa03L6EFvNBxgXLFAoLOrpMTNAJ
	znX3AHCgsCzbQHIKLZf93RGWF8degeOD94PzNCgSjkugPrpXCFYj4QCmmxpTxvPWAr9j1V
	za7XCw/cNKoNZXZ8mLBLzccprC/EIKV9hA1HC5XNMH92zofG7ifjV9D3/WMt3CQX8rcT+T
	EjcLS/gJW5KjJAUrnodiOg0bvi5UMHjlC+sn3aBdxzhpUNDFxi/MMHSHH947v7OP3yTRKd
	tidnaSlx7wOGosz7pNULJIEQMGQgYY4P6bgqEtlXml3s3Lellaf68Nh6M+6Ffg==
Date: Sun, 2 Aug 2026 04:03:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: PCI: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-pci@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260801195517.235161-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260801195517.235161-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: f80aa9cc35e8dfc77fe
X-MBO-RS-META: 6mrrnyrfzi36q3b4htmaiygg34gqfjip
X-Rspamd-Queue-Id: 4hCNQW6jbVzMlGX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_190409_208506_17282783 
X-CRM114-Status: UNSURE (   5.18  )
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

On 8/1/26 9:55 PM, Krzysztof Kozlowski wrote:

> +++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
> @@ -155,7 +155,7 @@ examples:
>       #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
>       #include <dt-bindings/power/r8a7790-sysc.h>
>   
> -    pci@ee090000  {
> +    pci@ee090000 {
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you !

