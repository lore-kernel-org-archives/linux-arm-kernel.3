Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0027FC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 17:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpFFANYWC8oF3BuUI/bTa1pYQgJbnIlCD1S9bFmjp4o=; b=ZtfXpwap1SKlQ8WfYCHSbViDEb
	MNeX0RkMVrEz7s1bHafYA3p/xddN6vewExuf2hmYW9JX2mfydmsjiUzE3Yz2PgswXGR2xYIfkG2g3
	FVUl5sxVaYwZ/v8moZTK64WIQZPlANW2QDN++KLXbV+bW1ccTtdNKus6TME4two0DQSgca3ETnyWR
	APODCnwPNcmjfH0LTbri3c2hm7z0v1twleWOX24VFDy2qr0rXw7jtywatwyfYPeV67g4rvrO1UY9R
	9ZV6j4X/8GWPWLAPvxx7yClHr3ZLeqOTckfJrZY92YowIlvcM4J+us7ziJBHipOHO1ltqxVeUQh1A
	Pp5R678Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfVH-00000004L83-2VCy;
	Wed, 05 Aug 2026 17:34:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfVD-00000004L7F-3blf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 17:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785951241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MpFFANYWC8oF3BuUI/bTa1pYQgJbnIlCD1S9bFmjp4o=;
	b=BktJWwyjxrluFUTrTp30egmni4Hm7O3BZKQwu16cUfkkAWBgb71YFFJ2se9l4M1qjwDp7R
	uM3ft3cDhKCw+03qHBa0MKyh1KNCDxOLZNLZIwU4RCT2IFx7WYnWVHgnj3LwDmF18oBYvJ
	lmXE5aSRCOEMtWINfWhnI5YsQywiMwQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-KxTFSVQFMj6gYfacbOV6Xg-1; Wed, 05 Aug 2026 13:32:05 -0400
X-MC-Unique: KxTFSVQFMj6gYfacbOV6Xg-1
X-Mimecast-MFC-AGG-ID: KxTFSVQFMj6gYfacbOV6Xg_1785951124
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f8398ed9fso989080f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 10:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785951124; x=1786555924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpFFANYWC8oF3BuUI/bTa1pYQgJbnIlCD1S9bFmjp4o=;
        b=eoptXetp2azVHXn5CgStUo1iuC6Zu9PtP2mC4olYSFVMnZ5UB/m2wNzlUtPfvHeG8E
         x4/iHVSe74C09TOBpMjgeCATHusy+TcPwcP03v2aFK8z74D2RC3GP7r/QCUJ7fbgVp9o
         hu7po6HBl69bJpOkhvqGmbRCqcSPJlxOCfd0ZNGNrU1DXoNRYZw4hajcAcP+e29tgkZf
         Zx9OoU7iAV8RMLaiK3uxFPnWZ+XLSdFFkwBaN9Sg4eiAb8GtsjvXy4DhZehuzWDDtM6j
         QIIAJNCLlXbxaa+oEDDpZSA+gXAeBmos7poNXrURtD9JgQDlvWROnqMhbbtIwW/g2ok+
         WlEw==
X-Forwarded-Encrypted: i=1; AHgh+RpnuIk8AMK//tatHZHaH+mU3gVJ960kUNleJXJqQ81iRfsNHUqg2uW+BlNYC0tfY0xwdrzEddO3iz90sx5PirAL@lists.infradead.org
X-Gm-Message-State: AOJu0YzaCNLoF5Ag+ULDPa9LhBXN0WpxvfLcpidxbe0DGeFC2Dejv7eY
	aMtT6pB2cTzP/7NyKTp/ozqciQ8cZjtka6il6cjUiLcVjCuwHJHtqStLPkXLA0/G0U+l3IKIB6f
	szWZDBSz4HwlFQnI557zA3dTLQzNjvrKreIxJYzMQE5b0vIpkg/q0SCmrc7WgEno3oGOZ0qTQoR
	QV
X-Gm-Gg: AR+sD10UVwnlQOUAQa70v7TYVIBv7XxYksPQ9z9LYO+jZvngccKnVxwAKfm3P+WuROt
	N4IW/aajFfCkv3HyICcxdWDMee0mmeyGP9aZtCcnGRAjAgiYmnH30fto6zN82FjkJTWJ7iYibTx
	K5ZmsyXJxssQk15vbDBF2tQddIYYsRH7ZEPRc7pu5UPO29uoVmC6IFtqgtQy2ozNR688l6YLUPJ
	2PgV0pVLy6nfGLPkw46+f+BTGAWsed91CxTeBHFXMViCmm1WITaZX9PRG+ZBrYUZor1UnXnt6Ab
	ebF4f/1T7N8CE9omtC11ba6DPmqoKowPQSB5pnhNpQxkdPCc0zEymmgxFSfgze3KJamfIuv0rdU
	=
X-Received: by 2002:a05:600c:22ca:b0:498:ee7:e40a with SMTP id 5b1f17b1804b1-4994e7d2c19mr94429775e9.16.1785951123753;
        Wed, 05 Aug 2026 10:32:03 -0700 (PDT)
X-Received: by 2002:a05:600c:22ca:b0:498:ee7:e40a with SMTP id 5b1f17b1804b1-4994e7d2c19mr94428975e9.16.1785951123249;
        Wed, 05 Aug 2026 10:32:03 -0700 (PDT)
Received: from localhost ([2a01:e11:1007:ea0:8374:5c74:dd98:a7b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e980559sm66252115e9.2.2026.08.05.10.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 10:32:02 -0700 (PDT)
Date: Wed, 5 Aug 2026 19:32:01 +0200
From: Davide Caratti <dcaratti@redhat.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Daniel Thompson <daniel@riscstar.com>,
	Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: add tc-ets qdisc offload
Message-ID: <anNzkcCXvOehhNcZ@dcaratti.users.ipa.redhat.com>
References: <20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iY_A8aMVRzpvdK5xk1ox3iXDggPo7Q9LGNow3igVHI4_1785951124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_103403_971560_1D2B3DBF 
X-CRM114-Status: GOOD (  18.68  )
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

On Tue, Aug 04, 2026 at 08:17:35PM +0200, Lorenzo Bianconi wrote:

[...]
 
> When all bands are strict priority, the MTL scheduler is programmed with
> SP scheduling; otherwise the requested weights are applied to the TX
> queues and the scheduler is switched to DWRR. The TC_ETS_STATS command
> is accepted and handled.
> 
> Export stmmac_set_tx_queue_weight() so the ETS path can reprogram queue
> weights, and wire TC_SETUP_QDISC_ETS into stmmac_setup_tc().
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

hello Lorenzo, thanks for your patch!

> ---
> +static int tc_setup_ets_sched(struct stmmac_priv *priv,
> +			      struct tc_ets_qopt_offload *qopt)
> +{
> +	struct tc_ets_qopt_offload_replace_params *p = &qopt->replace_params;
> +	struct plat_stmmacenet_data *pdata = priv->plat;
> +	int i, nstrict = 0;
> +
> +	if (p->bands > priv->plat->tx_queues_to_use)
> +		return -EOPNOTSUPP;
> +
> +	for (i = 0; i < p->bands; i++) {
> +		if (!p->quanta[i])
> +			nstrict++;
> +	}
> +
> +	if (p->bands && nstrict)
> +		return -EOPNOTSUPP;
> +
> +	if (nstrict) {
> +		tc_setup_sp_sched(priv);

From what I understood, this will fail configuring the strict priority case (the only one
possible according to the commit message, where all bands have quanta equal to 0). Maybe
the if() statement should be done like:

 if (nstrict && nstrict != p->bands)
	return -EOPNOTSUPP;

WDYT? thank you in advance!

-- 
davide


