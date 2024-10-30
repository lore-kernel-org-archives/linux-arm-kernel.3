Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11929D5CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zr8em/6KB2VzZDWr+lWK7JictXqq7aOltFeo+p/9gI8=; b=LxBRQm0yQrSlZk/rnXq6uxmYpa
	Qsh8/Lwllfqza5De88m4Bg1oxwc5gyqNUOqJhUiiPudLpKNN4RGkBHE0MP8D4IeHcB10+nqLnLY6e
	bC5MsctocYFURgzcRwkkSthskXH+PXeWdFBZcSfraFCsxnIfFUhEjQ30BVf81eQtSiUbsSWRHtXhS
	i6FGlvihps3pTItOlwUsqu0qi0Wd6AhZszh+OELA461gzSLgal0wPhMC8RrM3gt6tDr7ynkt8+PHf
	NKfcpJJfShKAPK87XNOkxFa033z6C6VqRcjGCflfOLRn3lNMn8cdnTFltefwhH685/IZA/DbERCnK
	VZgYC30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67SY-00000000GGh-1mju;
	Wed, 30 Oct 2024 12:05:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67Ed-00000000DgO-2D9X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:51:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4315549c4d5so8023615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730289093; x=1730893893; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zr8em/6KB2VzZDWr+lWK7JictXqq7aOltFeo+p/9gI8=;
        b=VEAc7Z7atb6JF4vZc1MEnaK7M/5Xu8NTqGeI34ze7juXiVDb3MYAalfdpf0ukiWpzz
         hBGesVo2QR+jSjSb92slUilKcaP3YeZtATcO8otdunlr7a7577DL3iEm3IFOCdvoGH3R
         PTgAYtmHa6Eg+UJVjuINr44RVdnPb/qKQ1t/gt4HY27G+pvTKa4W6q9pXVF8+Q+Dvc5o
         S3U5uGLqlvV8cD1WjQqq1z3+6p+o1PIA/OU1fOzkTUBPZb16MHPsO2Xp310RQfYKiyw6
         icpcakE+O72TdciSSAXh9PdLIk8H85FkQoRBmFD9kN8hZdGftMlPMUuFHzRBpZU4BWhu
         IH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289093; x=1730893893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zr8em/6KB2VzZDWr+lWK7JictXqq7aOltFeo+p/9gI8=;
        b=ruLgVhWaGGc6SjDmf8DucE8mJE8dI/PGM+mOQjR/T4RqLHQFQujWP5tGLchctuMMDo
         vsv8UyYqECWhPEgrTjB3Bp+hlWFrg4ZHjd4bBMUWu07Eu//OqRitafokVTpbHx/+RArQ
         ma8T8xQ7VCG1EVCfCzVrCZj3YYd9Nqqxm3RG3PPnsZ5r/jZrGF7SaG7KDnOSnBmFGTnZ
         ruEcQzKagrk+dNMd0ohe2LVWUFnNK68UUN1jCjnqdKGECvoPwwghSSP+UhMMa8DbalNQ
         NV3RZKbYvC/GEacLh9AhmoyJL7or3MEbkgvIK+fAVbJ/kkn3xZiEWhifZY705OO6YGEb
         We3g==
X-Forwarded-Encrypted: i=1; AJvYcCWRviprkshoqBCsKQr4Q8z4C2grWdQSYYeQ7GJLyTOQfA5+C2LkJA4IQP2tuALdDL+1feQ/sA0b3t49+fOlpqbt@lists.infradead.org
X-Gm-Message-State: AOJu0YzpUA3Jn2/BMlV9Jrw0zchogLj5FOmTljqNFTPKKySj3QoceZay
	hLXB2XEhbiJTeqDdD+9ty/s8YWMyNf+UfJ+mhFcqPO9khfs6bCMw
X-Google-Smtp-Source: AGHT+IHfOnqANP7C09P+cywgl9OXz0QiH/fs1DGqvzLpja17LiaKIrBmvdJfRFGCtH5Hajte3gqlzQ==
X-Received: by 2002:a5d:64cf:0:b0:37e:d92f:8272 with SMTP id ffacd0b85a97d-38061222801mr5875538f8f.6.1730289093192;
        Wed, 30 Oct 2024 04:51:33 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70d5csm15250055f8f.89.2024.10.30.04.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:51:32 -0700 (PDT)
Date: Wed, 30 Oct 2024 13:51:30 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v6 5/6] net: stmmac: xgmac: Complete FPE support
Message-ID: <20241030115130.pnfoy5iiioha5oxk@skbuf>
References: <cover.1730263957.git.0x1207@gmail.com>
 <cover.1730263957.git.0x1207@gmail.com>
 <7d6db0a3e995163b6f2ff69f88b650eea812ce5d.1730263957.git.0x1207@gmail.com>
 <7d6db0a3e995163b6f2ff69f88b650eea812ce5d.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d6db0a3e995163b6f2ff69f88b650eea812ce5d.1730263957.git.0x1207@gmail.com>
 <7d6db0a3e995163b6f2ff69f88b650eea812ce5d.1730263957.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_045135_591795_342691FD 
X-CRM114-Status: GOOD (  16.67  )
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

On Wed, Oct 30, 2024 at 01:36:14PM +0800, Furong Xu wrote:
> +int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
> +				      struct netlink_ext_ack *extack, u32 pclass)
> +{
> +	u32 val, offset, count, preemptible_txqs = 0;
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	u32 num_tc = ndev->num_tc;

Curiously, struct net_device :: num_tc is s16. Just use netdev_get_num_tc()
and store it as int...

> +
> +	if (!num_tc) {
> +		/* Restore default TC:Queue mapping */
> +		for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
> +			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
> +			writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
> +			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
> +		}
> +	}
> +
> +	/* Synopsys Databook:
> +	 * "All Queues within a traffic class are selected in a round robin
> +	 * fashion (when packets are available) when the traffic class is
> +	 * selected by the scheduler for packet transmission. This is true for
> +	 * any of the scheduling algorithms."
> +	 */
> +	for (u32 tc = 0; tc < num_tc; tc++) {
> +		count = ndev->tc_to_txq[tc].count;
> +		offset = ndev->tc_to_txq[tc].offset;
> +
> +		if (pclass & BIT(tc))
> +			preemptible_txqs |= GENMASK(offset + count - 1, offset);
> +
> +		for (u32 i = 0; i < count; i++) {
> +			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
> +			writel(u32_replace_bits(val, tc, XGMAC_Q2TCMAP),
> +			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
> +		}
> +	}
> +
> +	val = readl(priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
> +	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
> +	       priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
> +
> +	return 0;
> +}

