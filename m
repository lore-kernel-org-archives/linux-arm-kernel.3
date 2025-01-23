Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63E5C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 16:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37PCcaFsphtONjU1WuGj3LJHxxawzOceGVtfL5iTpqc=; b=h5/MQBTMstr01UqZ14wNNv+joA
	OxqWdDOnz2rPXDwIHXurVSZounLnk1wEcB9Xo7Io3wZ2CLE9hDTKHgmLR+SqgnGAlKmjOB9fBMd+P
	qDwtRGJb7RdiZEHUpgVejgHxm20vVB8HjqJM9kvmiy6HA6dUTX0Bm+yw04ghF92Q+szLTOV4qgT4g
	uR0TJd99wfYfb3yAitbmZQ9SXOHW58XGMLfcgCvWSZM69EgNNnj3qcV+MAQgsxz4KT2TQI/YYR/ua
	pZD/hJT2EIKJ9hfRQ6GvL6rqDJw3IDoe6AhSc4YBo0EcZpZ7jVB/kmPd/MPd8fVArm23yHJjI7wyG
	wIRWdkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0C7-0000000Cq9W-30Fk;
	Thu, 23 Jan 2025 16:36:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0Ap-0000000Cpyy-00eb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 16:35:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21644aca3a0so24999905ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 08:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737650117; x=1738254917; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=37PCcaFsphtONjU1WuGj3LJHxxawzOceGVtfL5iTpqc=;
        b=XV1RM8Wta8D21+D0TNnUjOzOR/6egdAB+4S7N1Dd8rAba/vEmZJZu9a9UjUg0ceqp+
         fQbd5ofsGhNOcx7d92Frb4D8y95J2GEwE4/hUvHRxsSkPAUIegG9uMg5/mwKLh5Ghimo
         yV+aGqHo5OT54RL310Yy7gcrV8fWPUzUXGOcUvwZmS1zLpBX/JuhVUPIelJkZ2I8lDLL
         iHfM84qGEo7NlQdQKAcuYDOTNuXUTBDO+Cxh53QhwyZfZySQ6wATDimCW7DRSQud1a/4
         glbzOoau0L9dZz4tNLzlu+gU81mpnHDZLEl2GcVyvyRoe1G+TIA+Gjk9oB1yzvVSeY/J
         GTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737650117; x=1738254917;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37PCcaFsphtONjU1WuGj3LJHxxawzOceGVtfL5iTpqc=;
        b=ekwfLHQ6jnnfmUyaHlXqjdb4bsAhGorJnR2P7ZxRIetH6zTi3skpKMqW1yJDnbnksR
         l9S1+U4/BCMf435+YsChrH0MF9PlOFActsYGm8Ai16sWulcxYzz+fzsG2SkH4o49v9ux
         euYDEdO8T1UsvQLFb8uFWwz9GQ7nqnuieAlnr6d70sSi9NAJfMpjp1d8kwb00KdfbySi
         mXAbjNt0cjzxson9TsDDoyHxehAFSYXdOekbh9AyH6KXzbGQKfKHA1uSVw4YCzMBx56Z
         Px+qcgyOP+0uSFXwJjEYSMZUfUBtB0SZoclEuoVv+iqVHo/eDWTL7eLgGg8Ohpan0Ovh
         B/fA==
X-Forwarded-Encrypted: i=1; AJvYcCVRAs/+lSyysKswUU9ZJ02kb5M121lNnZZhS1V5MoIoVXcZywqNyCRzuwVhO2G+gW6uQ0rTP9a1K8+9cJ42P7H0@lists.infradead.org
X-Gm-Message-State: AOJu0YzQifypelVjNfxiaZ8GqClThnYozqBmnDYz+LrwKCkKVdXoDoMh
	Zi4bFnIcBr9kg+BT2jew5kDIHPSBXPKNHoPR9MNykEgpnpXwTSj6
X-Gm-Gg: ASbGncsZ4TnIFeBHogxHHncWWrzjkC4fp49xJiIcueY1VWVCRq6iLmgumjE03AuemPC
	uF1y/f2XPyip1NfAwCsC9lHVApQv75+ylmjg1axZefTnMg43Fgwr3yygd9RLaSh+pzb5Dh9pzxm
	1dHbSLAEr5LWhl2NDtieJkRoG4ErLdB7S3U0Xd3D4UKs6ngE4oteu6qD8h2rzuzUfxTeVYgcyK8
	aHUAmIeNcXjoQph22jCr+74cXyOrcgecBx5vTAz//+7l+C9z0QjKlZ9u6ryQN0188kzfdJFKneb
	KOixw8eI
X-Google-Smtp-Source: AGHT+IFs4lUJjgFulZgoKt9vLCAMNVT+ssvpUR3RYJq7IZyHJnj6PWguIOa0Hbt9lV14uqVBhXgqSw==
X-Received: by 2002:a05:6a20:394b:b0:1e1:d22d:cf38 with SMTP id adf61e73a8af0-1eb214f0f61mr39291398637.21.1737650117287;
        Thu, 23 Jan 2025 08:35:17 -0800 (PST)
Received: from orangepi5-plus ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a76115bsm117705b3a.108.2025.01.23.08.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 08:35:16 -0800 (PST)
Date: Fri, 24 Jan 2025 00:35:01 +0800
From: Furong Xu <0x1207@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Joe Damato
 <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com, Brad Griffis
 <bgriffis@nvidia.com>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <20250124003501.5fff00bc@orangepi5-plus>
In-Reply-To: <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
References: <cover.1736910454.git.0x1207@gmail.com>
	<bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
	<d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/uWm=6.JKohvenzJ_Cv9eW2I"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_083519_056310_A711E28E 
X-CRM114-Status: GOOD (  19.27  )
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

--MP_/uWm=6.JKohvenzJ_Cv9eW2I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Jon,

On Thu, 23 Jan 2025 14:06:42 +0000, Jon Hunter wrote: 
> We have noticed a boot regression on -next when booting with NFS.
> Bisect is pointing to this commit and reverting this on top of -next
> does fix the problem.
> 
> I only see this on Tegra234 which uses the 
> drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c driver. Tegra194
> which uses the
> drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c driver
> appears to be fine.

What is the MTU of Tegra234 and NFS server? Are they both 1500?

Could you please try attached patch to confirm if this regression is
fixed?

If the attached patch fixes this regression, and so it seems to be a
cache coherence issue specific to Tegra234, since this patch avoid
memcpy and the page buffers may be modified by upper network stack of
course, then cache lines of page buffers may become dirty. But by
reverting this patch, cache lines of page buffers never become dirty,
this is the core difference.

--MP_/uWm=6.JKohvenzJ_Cv9eW2I
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=force-disable-rx-checksum.diff

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index edbf8994455d..f00bcfc65dd0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5442,7 +5442,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
        struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
        struct stmmac_channel *ch = &priv->channel[queue];
        unsigned int count = 0, error = 0, len = 0;
-       int status = 0, coe = priv->hw->rx_csum;
+       int status = 0, coe = 0;
        unsigned int next_entry = rx_q->cur_rx;
        enum dma_data_direction dma_dir;
        unsigned int desc_size;

--MP_/uWm=6.JKohvenzJ_Cv9eW2I--

