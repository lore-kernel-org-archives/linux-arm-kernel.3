Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8586BC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIn8jPtQMhs2iZgFSIvRHlzqHnaLCGoNBptkti3N1Pw=; b=WK3CYGq3+bdyAoPGx9ZxPktqeO
	9jgSsjM+hhHdpjbD2ozdGo3vgT9Y5m/GhkZ6COPWF5/r1YIlCceej1KD760Dk9YKggajFGGPkdxYi
	xD8qq9nxVgVDeVvc4dzJLeJVMGCelDuyNvLZy00VhbzVEwcJfD1lSjfAr/gbtpW65WgdSc3oJDV4r
	gv8cYvNZKVjdhgQL+R9hR/BuDoziwt5l2N+NRHwwGNmjiaZoxpXArrtwDsRpiOKxxUxsMeLtuQ6Hp
	ZmQvLXk3DwL0d9B4JE06Fb9HcwPjnjvlUudY0LO93HlgWJrG7qC94n9Goc237vEFutjWV3EiSDjqH
	RrI1f3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWSZ-00000003uO9-3SD0;
	Tue, 15 Jul 2025 03:36:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWKh-00000003shn-12oK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E63A543593;
	Tue, 15 Jul 2025 03:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDAFC4CEED;
	Tue, 15 Jul 2025 03:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550074;
	bh=RgjkmaG1JI4kCb3OMB2bqGTvB0ZifKXuh5j6zP9f9VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRzE4do4tUaPJFDv2Q1Q59tExpdoEaWMnQW6hDmy2JvbghbmZ7Jx26D/BJ0MZhVu1
	 7N7j4FcphOWWqZD1Paw7gcL18myt5DVmbG3vQ+oaocUdr30sC8eoA3ftXaC2LjfkPs
	 y9V5WpYXazsCrMLNfyiXI2ls4qXmutHton/d8WQu41ZEErAoiz7C1fSeRXKRsqnMZS
	 XEcxyC+0ahON1ftbYcy4/ufKBX1PL6d3g0V+ELp79UA0aUWDzBHoe9lctaulkGqjPH
	 ybv86Ohue2adM0pYecHnqXZ9C5E/IrjVaRYDfwa7SMIkYgTm6RdtD4pCSDMOjnCp9g
	 Eo8B6nL9XfVwg==
Date: Mon, 14 Jul 2025 22:27:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Robert Marko <robimarko@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>, linux-mmc@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, linux-crypto@vger.kernel.org,
	phone-devel@vger.kernel.org, linux-pm@vger.kernel.org,
	Amit Kucheria <amitk@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, iommu@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, dmaengine@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v2 04/15] dt-bindings: firmware: qcom,scm: document Milos
 SCM Firmware Interface
Message-ID: <175255007347.4169055.14756962065490424576.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-4-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-4-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202755_308747_230F1DD0 
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


On Sun, 13 Jul 2025 10:05:26 +0200, Luca Weiss wrote:
> Document the SCM Firmware Interface on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


