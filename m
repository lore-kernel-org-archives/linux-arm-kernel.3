Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEA3E6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MAYi8eL3LMPRoiNvTf0JPaZeOp+DxkVypEopfmGyVY=; b=wjE/LbYzd578L5N2JJWEUBSC8Z
	P/+jmdEmDzA/XS33cPQmb0qP2nXyyrF0mB2yo+8vLHz0gBhSYnb9slyVOAFCM0tFJZQYbznAX6Iow
	vmRfAgEoTf9+ZlSwBfOdTWU/9EbEGfAC2dBxrqL5jM1s0zIIVUcYY3w6ObytzgVutP5AOgxGZVT62
	E+MFRNO+J70Wehbpt6T+Y8L3M8fkm5ZmGVLnNsQiG3+7tTOUWoTzD7gUE8aaCWXs6wg+RbVk1os5j
	t86IiSqN49De9H7VOg+K8gRgt9wy5VmeJeVbX9R8xPiXc+efECMcauwJs8/hx0t0F3ZUyzOsrcu4X
	R656WBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6Ls-0000000FqFq-1JsW;
	Tue, 23 Dec 2025 17:39:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6Lp-0000000FqEy-167J;
	Tue, 23 Dec 2025 17:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57E4E4189A;
	Tue, 23 Dec 2025 17:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83902C113D0;
	Tue, 23 Dec 2025 17:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511552;
	bh=4l8j43J/v5I79EoFnJnHTBkeHnsgVhfsiIRiJM6PJE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jgTj6pjMV/ybwPkT55KhAQMex7OYEaok9RWh3sF7f4izlJkRlnPywmAcN+2twXU5u
	 /vGOgpa1ohwGHG1zDucBp5MFyKzVvibOutJPMVHKvZ5WxMgj3FFe33zeXUYriRYWV1
	 38tchg5fUoUps/Ra78769QTK/sWeThL+MNVJN6yAnhs4ZSxaD0G8ClKvyedGz4dYcY
	 KVLDgzQl18Zs2uxzYnGnGmtfKkar8u6Zd8zGuEGx9Dyw6jQuPSroOh6mL2KWJKRWUG
	 gvaQ2kUMt31lTXwYLQZhJBtpGiSXS3sXky9inlFC+DUfKpnbknf4O1Qgw7BFTsF9XX
	 3Lvo9kpbogILw==
Date: Tue, 23 Dec 2025 23:09:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chaotian Jing <Chaotian.Jing@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 01/25] dt-bindings: phy: Add mediatek,mt8196-ufsphy
 variant
Message-ID: <aUrTvAPcHNkyuTol@vaman>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
 <20251218-mt8196-ufs-v4-1-ddec7a369dd2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-mt8196-ufs-v4-1-ddec7a369dd2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_093913_321911_EEA230FE 
X-CRM114-Status: UNSURE (   9.11  )
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

On 18-12-25, 13:54, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC includes an M-PHY compatible with the already
> existing mt8183 binding.
> 
> However, one omission from the original binding was that all of these
> variants may have an optional reset.
> 
> Add the new compatible, and also the resets property, with an example.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

