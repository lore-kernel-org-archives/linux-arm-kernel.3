Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0E6C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhFKhdhw70mHE3BI3aqm1vnK7u3Z06BG0FGoHsvyfEY=; b=zMkKIrlOkSo98KT4OVq+yWTOoW
	1fef1W4Vid7hzSznKDTfmLvExkaghE+6iysk2wotK20U9QmPdVAcd2noN7QWMiDk/IavXrY3duu2k
	PLbTvZYF5uzqmjhMP1YfQcleHl7C/1ql+HP5foUhLsWnbDX7j+6hDTWPowiIM3h3qV7S7Wq86A0ER
	1D9Xf9k8CIlrRiqltPNps225GNVYmDOC2dglCbi4oDhDTfhA71qsgQx6QCdI+yhjX+SOaCGsfE5KR
	NbarNKCo48KW+pPD89S/cqg5Kxd9x755d6yKsBjDe7bIinE+vVQY18aoF4ETSUT6OFTEhCecFsJ+j
	rxGVoZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAOr-0000000HL7T-3BHl;
	Mon, 31 Mar 2025 08:21:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAN9-0000000HKt6-3LZb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 08:19:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42DF75C4BEC;
	Mon, 31 Mar 2025 08:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD33C4CEEA;
	Mon, 31 Mar 2025 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743409194;
	bh=k7k2/pOIGDeCvNTJE50TOMWYK9qKx/YV3St05Kv63+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYO4k9nl6kCuo8SfsJnxldb3o7ezS9EXsXYjzd6R6CRm6jcHAZxImU+QpOBbehMA4
	 isxoEzsCa3wEGkacepZzACOq/aJHwzhbtp1gIhT8UkU+/TgB90ZCy9TBiJ99oavGAZ
	 o72V3uNSP7BVSKmmzrv4PxXCYiK65kjmbh8xqBqfkPuokbGnYs3Bm5R+ubOyy5Xh00
	 1x6bLWCjFBZHN3JppQunNl5kVBttaPS/9Dy/uc6UHncor+a+HdFrx56C4x9RmBvqRZ
	 F/jWucXhyBgfSfQOT5ryNylz5NSVdLXgajOz9pDC1SQEMyvZcmRns0K16hT7o7oXR2
	 DInck3dgP766g==
Date: Mon, 31 Mar 2025 10:19:51 +0200
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
Subject: Re: [PATCH 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
Message-ID: <20250331-excellent-nautilus-of-apotheosis-fbd30a@krzk-bin>
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
 <20250330195715.332106-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330195715.332106-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_011955_880090_538D70C7 
X-CRM114-Status: GOOD (  10.02  )
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

On Sun, Mar 30, 2025 at 09:56:09PM +0200, Marek Vasut wrote:
> diff --git a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
> index bb3f843c59d91..5e2624d4c62c7 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
> @@ -46,12 +46,14 @@ properties:
>        - const: app
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:

missing minItems: 2

(xxx and xxx-names are always synced in dimensions)

I understand that clock is optional? Your diagram in commit msg suggests
that clock is there always.

Best regards,
Krzysztof


