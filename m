Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03943C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rzPW0CUckbkrF39Ekx9Pi0vtsbA5yjRkuFGFKuxzek=; b=FCYm4jVoN/Kyn8iliR6fH1vaN3
	ADn7Dp2mgQ20pjdZLfs3+0DS7zZsZD0FTnnjUmBu1L+JFZSFd9t/LIdTrbuPL9Yo/rBu7kaTyDBdK
	DVlLlFOE8Nb+F9G3MmSwqveIY5tHCvLudT4gebJkGdM35aMYjMt1AjcNtX7khlS3srmRSjloThgF5
	bP4hLUURZ7nuqbGQHImu+Tr4BOYvy3zCK4BE+MlqkxFRb0dKXDdK+nORl/GYqfbJ29Of4my5gtRpJ
	n86N+yXDWzRRhwDi4JOowHyJtZdtTZF92PjBPNV0iAP6zHhim/22LkXDghkrZmtRa/HjL/lQmRCCW
	9TdMM3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8xb-0000000FXms-1fjm;
	Fri, 24 Jul 2026 06:00:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8xa-0000000FXmM-0vp0;
	Fri, 24 Jul 2026 06:00:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 305EC600AA;
	Fri, 24 Jul 2026 06:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3A41F00A3A;
	Fri, 24 Jul 2026 06:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784872836;
	bh=6rzPW0CUckbkrF39Ekx9Pi0vtsbA5yjRkuFGFKuxzek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SJ4S4muwxAjPqwN3bl5N3K9mlPX5ztOTcDpunS2J0kEzqUWBG0SS0UtzJGOf3bANn
	 eyjQumooGnJtkNw7HW5mNwxNfaSN2DrMHU6EsxiTgVBmth+jxT8ol2i6DKRgn7/U74
	 Nuahy8UsYiCHf6Q64qJ9zhYtA52xoHHWUsxCK3MLlJno1ItjqbmY+TCJcBBrMBDxUd
	 hXvZtusw1l6p0s4FNmOkI9g/ZRaxyWOo4Y+Gqjkb4QVp6Q7Wuf6+SS8hXgs2MifcgY
	 Jbx3MMJW0lKXITrAnkxqY6kgN8eUoXfd59iGo3vhR6P/zMHkPXnE1pCy1IyI02D2Xv
	 C1TfCVVca16sw==
Date: Fri, 24 Jul 2026 11:30:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 phy-next 9/9] phy: lynx-10g: use RCW override
 procedure for dynamic protocol change
Message-ID: <amL_gPKbD0BQG10S@vaman>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260721231603.67865-10-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721231603.67865-10-vladimir.oltean@nxp.com>
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

On 22-07-26, 02:16, Vladimir Oltean wrote:
> Up until this patch, the only protocol change supported was between
> 1000Base-X/SGMII and 2500Base-X. The others require an RCW override
> procedure which was lacking.
> 
> Since now the guts driver provides the means of applying this procedure,
> make use of it and remove any comment which mentioned the limitation.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

