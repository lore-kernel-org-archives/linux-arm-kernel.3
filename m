Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F0EC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 04:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQ6iqE3CVQ6fMWid2Z+ZgCWt4WmuaoGbFtM2g47/Ntk=; b=TNXuGY3IxBYMUWv+FC31ab+QmI
	0L+Cd9ju0lufL3P7CTflAsRtN/g4pNRt8Pp2+pNMmLyoKSmzY9LBnlWu2qUsPlHgK5+PexNWexGeM
	vs5CkW79CVG0AX6wlCUoxnpA5bHDkAEAa2ULaKiCpb1ixD7hdGGSP6THOlrp1L3loSDckyHgs+0Df
	DmtsaywRmb/sgfZimDl0YuURy17SdSJlvdkglxZsfC8Qb5sNQDyTqElCRFGnOJZgpLsk+yptQuofj
	iPkMYqW2t0sRNFmltHoc9siizkswZAYFIvpXUULmSBmcqTFaGqPMPxeFwTk5hIOXfGBI4HdGahHfm
	aaCY2YFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGOR-00000009Bov-15zR;
	Thu, 17 Jul 2025 04:38:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGHM-00000009Ahe-1eqF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 04:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3737601D7;
	Thu, 17 Jul 2025 04:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3503CC4CEF6;
	Thu, 17 Jul 2025 04:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726691;
	bh=FUphvS0A9PwEICMfXvjYOafxfusNQmr5yCGzqlIMojE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ExYE3jCEJ3wVAeaTVmKiM8j0TWjaFKo6Pp45jITxs6/g907yx6TC8C/Av02lS8SeN
	 xcANIhoJOvpIpzp7Dc3Fu0M7k4r6Ta/zvVm4Q7pKOXXn/PtNHqPBEYNtgXsRzvUJYF
	 7vK1KSPEa2RKUnBVsvid7HmjfTf8aTLbH9Rn+wFqf5tAOvgj0ZXgB7TRznJLhwLdSN
	 DJwUmySslz+68gszrxuBJh4LLi42iFprCGenbtYkOZshtWZoKxpklCXkutk6EzJd5n
	 W755o2u6KtIqQWuv1eQMMHfnHQD8NNhTFDcan11MonCbQgWsezhDdfUyVlstolhC3J
	 kSPbAJB6fGwrg==
From: Bjorn Andersson <andersson@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/15] Various dt-bindings for Milos and The Fairphone (Gen. 6) addition
Date: Wed, 16 Jul 2025 23:31:04 -0500
Message-ID: <175272667138.130869.10008592038680168443.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Sun, 13 Jul 2025 10:05:22 +0200, Luca Weiss wrote:
> Document various bits of the Milos SoC in the dt-bindings, which don't
> really need any other changes.
> 
> Then we can add the dtsi for the Milos SoC and finally add a dts for
> the newly announced The Fairphone (Gen. 6) smartphone.
> 
> Dependencies:
> * The dt-bindings should not have any dependencies on any other patches.
> * The qcom dts bits depend on most other Milos patchsets I have sent in
>   conjuction with this one. The exact ones are specified in the b4 deps.
> 
> [...]

Applied, thanks!

[04/15] dt-bindings: firmware: qcom,scm: document Milos SCM Firmware Interface
        commit: 4405f3f7b44767c037270d8c40fe2fb3dc3454d0
[07/15] dt-bindings: soc: qcom,aoss-qmp: document the Milos Always-On Subsystem side channel
        commit: 6cd06adc39ac92ebca04d5c0df5acb7f0ec5ff2d
[11/15] dt-bindings: soc: qcom: qcom,pmic-glink: document Milos compatible
        commit: 4587d3910f805ac74348e6c320071a9b65be035e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

