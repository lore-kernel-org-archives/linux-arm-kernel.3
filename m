Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBBCE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpsA1hCVY3ewqxQ7j406xH50/PlVnUrpfZDhJ2TaT4A=; b=K2WcTopPrNAu3gej+cpL74SPlN
	lyXgmM16VrtjmN7sZwtZLLiK1ET/LX+JlzagMSWcKXKCChvc3jB9JgFuuub6IfbTU0mkPJ00pUgBz
	vdHIWlJ2xInUtZLWSRYqewbqlVZpQG7IwVmGTyVEkx/gGaqmuSxlGEGalhaglxrHT6WaUDlp0lnSt
	hSS8px+owm0DoeQbJkecJ6qCu9DRSVRleCuitrm9txEpO4D6MX1NkyvmaOl8XG8+RWTURmSxz+FWT
	ijk24ko8Ij6ub7r5czwNPpd3y6rVmOVThGLDOfNktG739q1GrJ88Uz2MO3R0dILfYugFbnA5YMvcE
	2reiSMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDff-00000005uPR-294P;
	Tue, 07 Jan 2025 17:47:15 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDSE-00000005sIS-089w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:33:27 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BEB121F948;
	Tue,  7 Jan 2025 18:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1736271195;
	bh=YpsA1hCVY3ewqxQ7j406xH50/PlVnUrpfZDhJ2TaT4A=; h=From:To:Subject;
	b=dZXZV8FCflkSbXZf2ez6Y/NLj/wwpNR69lN/ozvq6wc0hHsv7aNHN7bcmznN1fdB1
	 8nR/aEIIP3JLTbzZhig7PZp7yrl0IFr4Zr1/jDq7/s4oA3XAZKIk27q1Yl8knhi4Cm
	 /UyHsYkvK+OMnN01osdNq0nQH6wZLtjMutCoy5r5VyrM6fNWTibTQhWJTC0coHFvM8
	 AMa/AAx+f+KLs2A38kPgagH0qrkgOm+K/deSLLzj1Uhk2rHErYdrWDDkqDkkVSWOH6
	 y/dvfV7H0prkHth0t+jSdD20DJp085U9PyAYfNDEnuYZqi34cJY+/bpQG9CK5LGqW9
	 av41Gza7na4cg==
Date: Tue, 7 Jan 2025 18:33:11 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Justin Chen <justin.chen@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Del Regno <angelogioacchino.delregno@collabora.com>,
	Tianping Fang <tianping.fang@mediatek.com>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
Message-ID: <20250107173311.GA72209@francesco-nb>
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_093323_106697_251A0E1B 
X-CRM114-Status: GOOD (  10.18  )
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

On Tue, Jan 07, 2025 at 02:10:13PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # ti,tusb73x0-pci.yaml



