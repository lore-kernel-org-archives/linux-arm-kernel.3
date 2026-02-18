Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F04EE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 18:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/ko4EJCB3Dl2W2lTPRk6NN6wMJNY6EWwpWLgSk+D1c=; b=S1z9Pq3fGpZVA3g1ZnmPK8/JxT
	DIjP/pzN0U8Mb2BNZgZhr2MgkxrOTA+dM/EIcDS9jweOAnMUJ5hyg04PuOW3Q02IBTtGH7jnUWjS9
	Jw2527eWc7oV8aM3dsRGnGMGX8vSrHplQNfc6hWHRByPWaolOqyWZe9qUqfqV4W0wKc+5/9Mtgei1
	zSFIHvpPHhW2Ith9UvqR0YTl7bANHQ/TcIg2NI1l5Zc0rB7a9gEjWyKt+Ecm6g7xvv+Lyk45D5Bz6
	gbUvCzlrb6rlOZlm0Kz5Tww3pGM9qUesXEqtjcWlyRRswtVrjRKysqWUKq4bkxX47J8yA9fnaFdYq
	m/06RziA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmS4-0000000AGDh-22th;
	Wed, 18 Feb 2026 18:39:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmS3-0000000AGDY-241f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 18:39:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01A646132F;
	Wed, 18 Feb 2026 18:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA1FC116D0;
	Wed, 18 Feb 2026 18:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771439945;
	bh=MU38ojQtO5E1uk6qyEB+YcDaosdVNcaLAaFz0GYcRdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9P4A5Z7UsNKxy2bGtUdJv8kjCwMCMQXCyCFpNgjeEcaH1MF2VZmFL4z/pUSDv0QV
	 8pD2EmpA83r7rRDYgUHYLZTs1bs22Yyf3WxDT6YqMwEkNnfW0OIsapycYKk0cAWJ5i
	 qXgsUIG1Vh0r4IVhLd0jOv38RWFCrTspgLmLVsPYynKl1ds8KpYILcdiPafSDDQqPc
	 qhpnV1JDUNRl7xlf0m236fzMPEJKfCwFaVXi8s2qNbr4+1gLo1l7/Iu7UGnXK0La/d
	 MPPSK0okTzUTX6sDpPLMvh/SfXRocmuGqzopPR/pmWM/x5nJYCZNca7bbkjn8bw8Fg
	 fwqkwfdWhdvaQ==
Date: Wed, 18 Feb 2026 12:39:03 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: convert fsl,imx27-pinctrl.txt
 to YAML
Message-ID: <20260218183903.GA472024-robh@kernel.org>
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
 <20260211-imx2_iomux_warning-v1-1-1c5233771b32@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-imx2_iomux_warning-v1-1-1c5233771b32@nxp.com>
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

On Wed, Feb 11, 2026 at 04:00:00PM -0500, Frank Li wrote:
> Convert fsl,imx27-pinctrl.txt to YAML format.
> 
> Additional changes:
> - Add the compatible string "fsl,imx1-iomuxc".
> - Add gpio@... child nodes.
> - Add ranges property.
> - Remove the redundant intermediate node between pinmux and group nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/pinctrl/fsl,imx27-iomuxc.yaml         | 126 +++++++++++++++++++++
>  .../bindings/pinctrl/fsl,imx27-pinctrl.txt         | 121 --------------------
>  2 files changed, 126 insertions(+), 121 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

