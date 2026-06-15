Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5570FCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 22:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BxQrn967BchhiPMVf9s3SPbfGb2SRsf64DIOXc/lgs=; b=cjynA5/3ViAAO2/shrfx0V0e6h
	Q560N2hwxTaoC2IWuRyWjtGTe8MNfWzbSp/fkGeShnnGnLCmt6KeR+Q/lbyWIp0vR2hEFRLDS/eSZ
	FTERIRJT9uA3g44+Rs9ZIwGBjtLG3lIZNwYageX18/FUo4kyg5Ge26AzN+IisK+0O+f+b3Bc5jJKX
	GmNgOoFwIljomUacXFj7EtLfLayk0jiZDKJ5ApwzjqSiPPG356CC/ov2In9Hr70gD9lLXn8y8eIe2
	FUfi9hd2ek9lGRrVJR60ll/1qG9CV0mQsxXSO/grGfcdyvqebzwoJqiYIrmNOLl2qNrOIidGi3ZgM
	beVtTLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZFtM-0000000EtmA-0YHU;
	Mon, 15 Jun 2026 22:34:52 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZFtI-0000000EtlQ-29q0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 22:34:50 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so2761668a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 15:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1781562887; x=1782167687; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BxQrn967BchhiPMVf9s3SPbfGb2SRsf64DIOXc/lgs=;
        b=ILFBMDHwb7gP9JJD93iMkyZX8zWMSFYCgMKe/H5MTQezvMqRBTnNzwPnkv4DkxOmGO
         GcySmZU6KjaGfYiEqpYn/fAlqJymPf8EUg8zS8FI8ESBPpFS1VvJzJHs+noK/knEr6vM
         csnbhYxaIqY+2aDmUovxtPwH0koVGWZ4pSGsrCnI2jyRxJO3eGxf9QY3hOh17HQRxrD3
         YTtjZXvltVPSarSipp7TC3Ig0Dq3zig7Ws5+XwiNn8HIXdgQqIYlHJKRwKNFshPtVstK
         IqtSLEG6eXrJNkYwzddJW5n9LXq0AEex7D8JQ2dykfwbuXUhnyzTTWE/viEEec+0lwAZ
         h8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781562887; x=1782167687;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BxQrn967BchhiPMVf9s3SPbfGb2SRsf64DIOXc/lgs=;
        b=pmejqLqk0sckvXImF9G+9qA/lH89lrhncnCmuZowixGm9NlOws5hr4zGQ3Slu3k37p
         trrmo6KOz+VTqW+Ti8tN1TmnAng1G+fWo9M7kfpaIvCAamZ1wcceog3d/kgTr3xzdWAj
         9wmJbdoDyDAn7/n74M6iD1BauUHkXCVC8/U0RWy+D9Lle1agT2yFFRZTm8EKEHWuAu4A
         nKoPFW2h2W3cfmWNibIv1ZvnG9yJS4D26/BKSKYliC09ydjQk/FpW7or9Y3h/NsIH2ts
         jVM9m6BRPaQNNBYA3mQHPeoNah1dMx9dUW4sEI0unCXOGrMwnvuvtCYYvA6ICSl3Nmeg
         37RA==
X-Forwarded-Encrypted: i=1; AFNElJ/ArN3KK6FM610lzPI8d9FTZRq8eWWR9G8wyEjsbHIsbiGNp2ViG75L30KOcOycmo8wle+DyystG5yfZknpl1ja@lists.infradead.org
X-Gm-Message-State: AOJu0YxT09sE4Viho2T8diMs0b6KGsQeRooCURR22yl6fbluYHEFcije
	hXk96GC4xp7X46iKBaRetxNDUP8azjBHOJAEIOAT7AmO73y+cKr2fU420laJuiPi82M=
X-Gm-Gg: Acq92OEyiMX+ww3rCyGcfFnlQnLK52pyNJggiSkgR1CxZQbLcAkpbggz4uSVYPdmvjF
	hMYpelf1UXsXpeItEWDNT3psiLoPd4Iwr+Jl/c3qNg38OQFPpP2gKSdhEyvOnerk+OP4xG3Z6CL
	3aiykmvMrdeUe2ag1taPd2ZBy0tABAzE09TCz4tl4AtL0Wxr4H1FbsbVwtX3b8h5n5yVRqM2EEp
	/lmSet1jM06G9sc4Ss0q8yoec4jhFH0ZktxdwxHpSdaLrUVPqZ9hWVX2kUlm9ciUFPwAbNoXJxG
	KGpLvkuFxSFa08+gDbw+LRHXnucpQ+ToW4JzITcWPCm2xWeiIrL3GUAPKwo4RedHJeiZ6bsglRi
	aUGzAIRFZkTG+kQ7pAVEXTlHEWTKn/UqknGk1PWucwIVpG0mFaQkgJq/HbSmhNVF5be2M0u/7ja
	kWA5NQ
X-Received: by 2002:a17:90a:a897:b0:36d:66d4:270d with SMTP id 98e67ed59e1d1-37c2bd08179mr9024782a91.20.1781562886775;
        Mon, 15 Jun 2026 15:34:46 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c522a019csm620311a91.14.2026.06.15.15.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:34:46 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:34:45 -0700
From: Joe Damato <joe@dama.to>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2] net: airoha: Fix skb->priority underflow in
Message-ID: <ajB+BfOXHpRhCTnO@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Wayen Yan <win847@gmail.com>,
	netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
References: <6a2ff493.5934d26d.389ef4.d16d@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a2ff493.5934d26d.389ef4.d16d@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_153448_591376_347B6577 
X-CRM114-Status: GOOD (  19.56  )
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

On Mon, Jun 15, 2026 at 08:48:13PM +0800, Wayen Yan wrote:
> From b894fc031e307f1b6756ea9fcac98e82e23815e1 Mon Sep 17 00:00:00 2001
> From: "Wayen.Yan" <win847@gmail.com>
> Date: Sun, 14 Jun 2026 07:30:54 +0800
> Subject: [PATCH net v2] net: airoha: Fix skb->priority underflow in
>  airoha_dev_select_queue()
> 
> In airoha_dev_select_queue(), the expression:
> 
>   queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;
> 
> implicitly converts to unsigned arithmetic: when skb->priority is 0
> (the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
> and UINT_MAX % 8 = 7, routing default best-effort packets to the
> highest-priority QoS queue. This causes QoS inversion where the
> majority of traffic on a PON gateway starves actual high-priority
> flows (VoIP, gaming, etc.).
> 
> Fix by guarding the subtraction: when priority is 0, map to queue 0
> (lowest priority), otherwise apply the original (priority - 1) % 8
> mapping.
> 
> Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Wayen <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hm, I tried to apply this patch to my tree just to see what would happen with
the duplicated SMTP headers and it looks like they just get added to the
commit message.

I think you might need to re-send it (but you'll have to wait 24 hours between
re-sends).

The code looks fine to me, though, so feel free to include my tag:

Reviewed-by: Joe Damato <joe@dama.to>

