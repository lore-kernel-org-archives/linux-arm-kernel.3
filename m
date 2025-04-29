Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48816C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 07:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urKgelWOFlmSlUlQX2Kv4rZ/DAfh6nV1whLr57LFMOU=; b=3/NohnJDggWfQ4GnEVEgP44WEF
	VKsw8pfFS1tEscCdQ+1qWLEJGLv588XnOl9t4WIpdgaodT7lRisn89vplyep1C0xOl5rWea5OBTpu
	XP5tPtbKQwrm/6kZS3dIkULQv0g1uWMgLpQqRuhSOiaJbX1+rSeOSO/KEOlwKmw2YmVGdJsJXYPKN
	SsmWdHoTXizf/XLvE1+Ve2fNB+XWfPqggPlNBEcw7nC7qHOYIY42cBoMTfmf3iDr5+8Fe5+GmvNb+
	Ob1oqJN2FJQ+UVCC095KAZw6gMnUaYrv/ZOxNi4oBoYJ/LOZtwUuytx648cfAwW2EIn4xv+cASCVm
	N62EIAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fMk-00000008kTc-3ioC;
	Tue, 29 Apr 2025 07:26:54 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fFm-00000008j3y-1jGa;
	Tue, 29 Apr 2025 07:19:43 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 6FC5A4984C;
	Tue, 29 Apr 2025 09:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1745911176;
	bh=SAHCBDqNy6TGIiso+JyQ7s/5TRfR/sINY5mPMtICcBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAU+z16iXwywI8TGOQsk32M7p3Gfc92zxC2WRlGKloWG7+MDZiYeVNdH5dR7KYbeR
	 F2KV99ePFzh/4taISU/Nqnw6mT2lm10/qygFp9Zo5zan5QGddcoA94eEaLmMFIJx3X
	 ntXi/NIOipXJgaHm/3D7oWEwFnOxa1LxSIo9FRKZ5vHI8PhhxSAYvKTmSZv1r+/WqM
	 z6+Gi9W1XO7PyCsrvGEGOnGrJ2Ay2AQ09AB9sZ66fJ1cQ8W7q1IRMVQwQaup+hqpA8
	 Tg29+9drMTSK5VTid1qZoswToM0aRLtcT6kcoZtF4xg80dLFw7oCHv9g7L29bjbfcP
	 68EWEH8avQQOw==
Date: Tue, 29 Apr 2025 09:19:35 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	yong.wu@mediatek.com, will@kernel.org, robin.murphy@arm.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add IOMMU support
Message-ID: <aBB9h9CDPa6Ww4td@8bytes.org>
References: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
 <aAETI0hrOiQZDKh2@8bytes.org>
 <20250428160227.GA1322286-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428160227.GA1322286-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_001942_696861_0FABECCA 
X-CRM114-Status: UNSURE (   7.99  )
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

Hi Rob,

On Mon, Apr 28, 2025 at 11:02:27AM -0500, Rob Herring wrote:
> It looks like you missed the binding change for this.

Both patches from this series are in the tree now. Is something from
another series needed? In any case, if fixes are needed, please send
them on-top of this patch-set.

Regards,

	Joerg

