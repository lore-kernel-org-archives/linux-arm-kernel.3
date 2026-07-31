Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23951C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEv56Jq+LDIkoT/lGm+K1+duopGc5V4H+8YjSUF9M9k=; b=im7Gdikyd1WIaXGvOuTPu6El+z
	i2UnetQJ07NnQMyA7WRlhQtPbJFSdXaii5qqaGe3Ji5SpLUE35WO4AuPW773NC0xPRQa/lKZJEWGP
	fE2ASiQyP5MW79zYWwPfWPkJfg804/4W8kHFeTQ5oLV5T+Jzmi3vO6x2L2Mnc+VyjAWs/9tVx2WUi
	Vk4IPruVu4bxBMlJpDMFg6mSoYuPM25gaoetbQ1WnbogEAQ1alsPBgw1biKMnFgjHSRqrYZ1eicEW
	kAfgjlBTnMvydXUeSK8Yg/Z1+8TrYxJ1wZ2abGsBAQ/0r825GcU0uNLp5n7iQZp1XcCOLnrEbjdnP
	nv6lyNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjhE-0000000CCOJ-2sgA;
	Fri, 31 Jul 2026 09:38:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjhD-0000000CCO8-31dq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 09:38:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E0E06004E;
	Fri, 31 Jul 2026 09:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92AE1F000E9;
	Fri, 31 Jul 2026 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785490706;
	bh=oEv56Jq+LDIkoT/lGm+K1+duopGc5V4H+8YjSUF9M9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ldGo7bc/TTpLI9sS2t3cA33+ewXENIbW9f0tjslayRSE+AI08YJBkYM5VuSMmb85n
	 RxPORc/nU1X4Ih+UL/MHIImf7Zi829VrBfTbI9zsfPY/YmPZ7kmzyk1RwP1p22wxsq
	 5q+JFBlE1Aoq0yOfVx+icq/Rn5/upkunHH9Y7bTM4PTatgvKXdqHKRSPogWvLzOpan
	 rJOz/cLldCvXaFZCPDvcH5XzMSt0O9zsCB5nB3GSOcfgctMSWNXhnYIzMoT5Tbot9V
	 putMeQrQgiEAeTKrO5QCf3LaAsDzzFV/J4XJLOWGh6/PRTp/ssGLsEeEtpx0uQ38ei
	 DxF0GBRhpZKQg==
Date: Fri, 31 Jul 2026 11:38:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Message-ID: <20260731-sweet-curvy-lion-bf0215@quoll>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
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

On Thu, Jul 30, 2026 at 09:34:10AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The imx remoteproc driver assumes that the names of the reserved memory
> regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
> conflicts with the devicetree specification's recommendation, which states
> that the names of the devicetree nodes should be generic.

This is not true and I already told you that at v2.

Best regards,
Krzysztof


