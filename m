Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD223F513E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e206y8hZRSz3DX6+DSSzBMy8lPIoBlHv7UfWvFXYSoI=; b=YjthPqhzIn6nFlU2ydArmTSXqH
	Nu3m7/V9XrANa8aPvq8lwTVHw/YrFHYavLHOyiEZIGEZ2Xz+lL+MHmZmRgpsUBDReuFdT5PJHaX82
	sLKaV66k4sI3QqjriOMXT0n4X6e4pFghCquSO8Rldua4p9gQZQY123q1Po8qyoYYfRInlzN7BiR9v
	47MHoPByORBMLnR63PZmGDNt0IhKG2EY1b0EWOGcQLwgUWBL6WiOOFtklKd5KVELAQjc/wWiNLmuN
	p9JJHfFFo6ZuMYghZqObl8hXBSqIztcwmKIHIVYS/dAryUWpHczLBokipr4pGcvSgqe2+y+pw6xTT
	sRqmtksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJ4P-00000002mh4-2qCQ;
	Fri, 06 Mar 2026 00:29:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJ4O-00000002mgr-3Fh4;
	Fri, 06 Mar 2026 00:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36CD6600B0;
	Fri,  6 Mar 2026 00:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8D2C116C6;
	Fri,  6 Mar 2026 00:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756971;
	bh=H/ApE2Ifn1Gwf6HdI5rD2qg2A1C36R8oMsoc12fiRtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhRsuBQa2HW1msxsnJ1GDnVDwGgwkTtwysMZq4+woC0ocQdwWhGlzNU+N0+B5vfTl
	 ovmzsoIiOGaNz3xniEY6aKgIntgyaCPQAnRlGd1Jfh2DEGL4/1++9E0+4dSVYt4nSy
	 quDtjQhfegKASaFRSUXp1XBF3qyGZ0WNSgbN+AlRsRK3xefJMGMdowu1DmMrAJ/lh0
	 Eg53SZTvSty8k2hpkMkJqdG65oP2uTAM+bUx3h72S6PKHjKd4UrlvpJqTa1wuQ+4vD
	 RCohdrq5kYeD/Om8A01/jFs3Y5uitjN69tr4n4Wpoa3gAzvL84BNwm5xXNi3Jy0zrX
	 C1sz/TvvAvvqA==
Date: Thu, 5 Mar 2026 18:29:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-input@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Julien Massot <julien.massot@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>,
	Macpaul Lin <macpaul.lin@mediatek.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	linux-pm@vger.kernel.org, Chen Zhong <chen.zhong@mediatek.com>
Subject: Re: [PATCH 3/9] dt-bindings: input: mtk-pmic-keys: add MT6392
 binding definition
Message-ID: <177275697060.854738.6493014317679593134.robh@kernel.org>
References: <cover.1771865014.git.l.scorcia@gmail.com>
 <056cbc09fcbb4a2845cece69209a2a564d993ac5.1771865015.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <056cbc09fcbb4a2845cece69209a2a564d993ac5.1771865015.git.l.scorcia@gmail.com>
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


On Mon, 23 Feb 2026 17:12:42 +0000, Luca Leonardo Scorcia wrote:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


