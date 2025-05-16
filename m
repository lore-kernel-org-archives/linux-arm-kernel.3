Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE23EC54756
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+si/UPjuJh2BckbJK0+hez0icQwi5lGfZaPv3XD6SMU=; b=YIc39yxTKyizF7OmqvkAj5kwhd
	VUgU2x/5gYWCdpcJokmiDnpzxeiuMxE576NCIf8OWKlzHZpiCdnJX8fHjUpJHUtjVyVXviWXLNJeT
	bHNHh/Uvy8td86JeGQ8uXmu3UGfc/f0IucdVO3v3JZlKDDKxGYzyvgb/CTmtCLBB1MJL5IFXDof6g
	Np85uREVg2LemjlgI0kbte8Wxv4Q8IaI7N8qkB2N1PiTJvt8nzcPG9K9ykErHZyRM1RomJ7X1Uq4b
	WGx1eo6TGOLuOLL0oM+3srGb2xDfGL4bnwmjDexJB3QnDSBfyMJ0k+gB02SmumD++OnIQeIoJ+3+y
	nR5LUL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwaz-00000003m3W-3KnG;
	Fri, 16 May 2025 15:03:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFw6l-00000003fsU-3sCs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 14:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C30AE436F1;
	Fri, 16 May 2025 14:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DFCC4CEE4;
	Fri, 16 May 2025 14:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747405938;
	bh=E61O55q6UktoNqtIVZI86pVw7KFKbc5kPfAwhVWnqpo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RWTIhTi1MNaNFwp7zWk7ELiRpUFWnDwGbP29IoJF3McVx/FS5/ZPlas/gGFEKluBU
	 CvrWyZP6eKDTR0gzdXgeLxRs7fPRuLdXv7VrKiCDLKzenjgC5RbU5BAnGxt2MnhVvS
	 zagHmUmi82y54v+FZAySqjsgcXXf8EYExOXj/LCt6CAShrbnlhU/bq6Xb4IpO2N8tE
	 V+FC/C+rzgKaNIoYEaQ/Bpb98yJRfW1QSzYCbtQaATLp2E6iKtTcDu346He/bBknju
	 ANuLxdYuiPFXlq3EgX2lB2myUyjll+2FebCSr2WaMpfitg59e0eb2HiVYiDzxm7tOI
	 d1nRfNd/tAYlA==
Date: Fri, 16 May 2025 07:32:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: weishangjuan@eswincomputing.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 p.zabel@pengutronix.de, yong.liang.choong@linux.intel.com,
 rmk+kernel@armlinux.org.uk, jszhang@kernel.org, inochiama@gmail.com,
 jan.petrous@oss.nxp.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
 linmin@eswincomputing.com, lizhi2@eswincomputing.com
Subject: Re: [PATCH v1 2/2] ethernet: eswin: Add eic7700 ethernet driver
Message-ID: <20250516073217.115fc170@kernel.org>
In-Reply-To: <20250516011130.818-1-weishangjuan@eswincomputing.com>
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
	<20250516011130.818-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_073219_987269_74FF4ED3 
X-CRM114-Status: UNSURE (   6.47  )
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

On Fri, 16 May 2025 09:11:28 +0800 weishangjuan@eswincomputing.com
wrote:
> +	dwc_priv->clk_tx = devm_clk_get(&pdev->dev, "tx");
> +	if (IS_ERR(plat_dat->pclk)) {

you're checking the wrong pointer here

> +		dev_err(&pdev->dev, "tx clock not found.\n");
> +		return PTR_ERR(dwc_priv->clk_tx);
-- 
pw-bot: cr

