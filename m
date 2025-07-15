Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA100C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pyG/2LY5dgICfSkK972S+OHkvydSeA/i40rYGrcOi0=; b=NdSW+oV69TmSBbPILPv4pDoOV/
	XhcCbfGZOgWWVEfvcVwIO4lFt1VWN7oAolVxq8utTCFNiFK8gqxdrk4u/n8SfxAlBMjzhHcOc6Wt1
	mF/La09UwkskHj5ZJk9T9aztZzDEhmTabu+EHAPWEpPY6QH/0PA9tGVSrX+1mOPUXFqTTanIwsFrs
	FaSJsxXBXVDr5FQlx0Ez1CVHu+Kyqtf4t/TnnIfJpythIrStUCXCY3PIk3mAy/XmKV2lh6NUEUGZW
	m7azjOZhx4fJPKb3KUIxPK1ajfD1QD2ADJ9TlUW1jCSrO2IQVTX29uJM9+QXQHe4v1rOMiMyF4wed
	QmouhTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWlv-00000003wuh-3ish;
	Tue, 15 Jul 2025 03:56:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWML-00000003t9F-3579
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:29:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 108F9A4C138;
	Tue, 15 Jul 2025 03:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AED2C4CEED;
	Tue, 15 Jul 2025 03:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550176;
	bh=6vGbG9eZpdLkhCvtBV3XkyU02qs81/UKhfvdR9Gsg6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqA4dbXjHjNlbbMUdZVf7RhIaIL7O/YLmyh8HiGnsu6xUl7C7QOZIF7UUaST3Z1HY
	 gO0OxkCV6ZwndVwbW5bcevSG/FnVsm0+QP8/TyDwMDuJW+zCczT7a1pHNPdtmwmjmQ
	 FHYzzqLAwWy/8H3SiN2dGrZuK/Z79PjyJqhCCEl6iUuT4Vox70A89Al/IbxTLD2QPj
	 Viqp2Gs3JNTNZl90eAPCnVzyChwhm/DZc4bPBkEvpELW+PPm9QhtM/2CM2hmLUwp5E
	 m0ktCzBqKJGQ3XZf+lYLhAcJF9BURi0sjxANsYjXLy0GzBA096AcggjREBs0uu0Rrf
	 2ZAb3i9/F1WoA==
Date: Mon, 14 Jul 2025 22:29:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	phone-devel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-pm@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
	Amit Kucheria <amitk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>, Zhang Rui <rui.zhang@intel.com>,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 11/15] dt-bindings: soc: qcom: qcom,pmic-glink:
 document Milos compatible
Message-ID: <175255017499.4172256.4796309138108783817.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-11-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-11-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202937_837142_37754B6E 
X-CRM114-Status: GOOD (  11.00  )
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


On Sun, 13 Jul 2025 10:05:33 +0200, Luca Weiss wrote:
> Document the Milos compatible used to describe the pmic glink on this
> SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


