Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8069CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 02:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=; b=Vpov+dF3XpVdRTFIZHWEGmJNln
	M70l44AN0J2bvNScavRmz9CKGaprXMHC12Nujlif6TcnaMmU2YO7gAWAtWo0bxGnj1ra7/eHaIZA8
	z1xRIVdR/urk7IB85GYLQDEd4BaSbX8yZaf2SYEh14Po8Aw85qHr9rOJGOpC6+l5fLd1q3Zu06h8e
	8TIHFENiff8T9H68aYukx318GV1/KBXkpwmx3UWKG0/T4HxVhXa48ACxBedVzo4We0p/KzV1NsM0O
	BB+W+KSTCfCEXJFBIbQgqCi+lESh5E2rGBHxcEtH15zSg2X43gbVTQ5qh2XQP9MgWuSbTK+cRfohy
	BzhKjbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGae-00000005Rkb-0VJC;
	Sun, 18 Oct 2026 02:25:36 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGac-00000005Rjl-0YJi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 02:25:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c2a4e013a44so120582166b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 19:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792290332; x=1792895132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
        b=wf6L5k31BbVnEuaYDaSFFEMfrW6576wxwHi9Q/MR9OGu2PfkdXruCU9wMqDkd5dpdY
         wcYpkMWGHFK6CytTPOWcMu0toVLpbVf1vtZo6+a7I7JVzB0sYz7jSHhZUZaXADgonnJd
         BdtmaE8riClMi8J5iphDZcmEHGmtN/vKZa2/Y3YkT1gTzdoiZzo1VLRPTXjG/JIfxH1c
         5OaQVKUFEVaZkKr7HkSF7Tiv2R4/DNLAso8z+qOgUO8bBwckyFzB8c/0VfxC8/eBp3GT
         FrOodl1YPJhym/y2ENujGSGMyEr+wbUifGHC/hrB2oQZd5pSiTTcVoSgPAFL/T12X1GT
         /V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290332; x=1792895132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
        b=BqXfvsIeCnKXAIkUkzZRZcAqVfWxYDM8342p9//NZZYWTpAH+l/bbHQgoKEBWIn2Q8
         oWZx+Q5Dkga05JrwbVXH4z97LdJZWETSqNV6tyiuWk6NJbKVTaLsl3B6neBYg/j5T1ID
         HPBA/YZ5XhimN0UmQPsX2oI6p6qMm4yqFk1K9+AEjZ1P5XdbYlt4h64ghYg4K8shoo7W
         xddrwS3tFg2rZMhpiWqJqBF5Ms9/JTztJcNmS93gpS3/9+UPglRcQGikjDAwoaOVmdl7
         J+f3HdhK6yVaUu0wkAnz/Yy5VduOE7iqxP3Y6VvUqnzYp4EnLwFwLBC1QMIwbpVFC3vO
         /Xrg==
X-Forwarded-Encrypted: i=1; AKwUvBwS5F4XTSeHwnFibdGVHR7az7CLEwBKCfpCK2zhvyh9w8TfT4TO6EOydLqfw7+6x9Mc+/o4NM10Q0jM/32NPiSM@lists.infradead.org
X-Gm-Message-State: AFq9FYIIm/4Cx4aTV4V0yPkCRejAhypPBTejTHdiLGgTRfIerc6nBrpl
	dnBwx5vYrEMuvBP8n+dv2enH0kiLdKAN1Kttrm30FQkgGTfBSblKK0ld7C6orAQar9cZ4TpQgWx
	0yfgBjZGr
X-Gm-Gg: AYBFou32FafdiqZ0bTAniSgvWrWQfQ4aCVkmciA5FveDIP3ZsbUnyr47iZriXpWet1a
	WUNOMdd4WKafZmwt4ZYzQOPwBztpd1VsG0458WbIntKS2CpXrWuf1plviImuYESRivZHD83KINF
	VziylV0I7wwKnS0X15UwiMgdxJHVWprnlrNDYyN1bk3nD2sNhu3sNFRIO8/InBp+pf2GBM4FxaW
	b3BrS3nEVBIJsoPTN4vIEFoUQRLAslXmTAs2DteSCmvSMB64pADSsSXEI4Bo8bnKbS5x0crUHsr
	JSHPvg+cCqYFH8yRMc8TkYpgyARHpRDRYcchNQk408Cg6k21oVAFoqvNW60TlqN19VlTh/j9JFX
	aWZ+y56oxKb+EwwJ71AGwqIhz4Wny1eRlmf0KYEiFsPl9c88/H8cOZdvvcFHxmhGlYpc+t8Vpwh
	Yg1p+h/lwNFeff/Y0QN4/ZCK+qdMkFUjn8RdZM0+u/XvnV4w7OQ3S6w7NDSNzsRNohJcZTnEDxH
	ebT5ehuR+kD6gZOoEUeXPh/FcR4fMkF2Pq9LeCQ9RSZKMnDx5Yaj9GqZHtjRKngVQYhO956PKN9
	B8zxC+TMW1ILUZW6sS8RXSvkyQth5OLYkJnxuod6zsCf2kEQdUym2Fe6j6/W7TvHrWq9EeiMMK9
	v6QRGarJtifeXHacDv92mGj0a+88DLK3pZHWCADTrAIG6TVInDVSUtE1nvP4efZHEG3oqrJQWIr
	DR1yk9fj0R3g4h1rH7+CMpKbHbCtmrNDuru5DPHucbVjeN5ZJAfM5ahx3EgF4ytg==
X-Received: by 2002:a17:907:e849:b0:c40:4320:de2c with SMTP id a640c23a62f3a-c419e73e2a1mr277700866b.15.1792290331870;
        Sat, 17 Oct 2026 19:25:31 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247429d100000000000000a27.dip0.t-ipconnect.de. [2003:f2:4742:9d10::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4c5dsm222994366b.39.2026.10.17.19.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:25:30 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jianbol@nvidia.com
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
Date: Sun, 18 Oct 2026 04:25:27 +0200
Message-ID: <20261018022527.4065122-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
References: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_192534_213649_4073D5CD 
X-CRM114-Status: UNSURE (   6.19  )
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

Hi Jianbo,

v4 is ready with your Reviewed-by on 1/3, the rename to
skbedit_prio.c and the consequence line. Pablo asked to handle one
series at a time, so I will post it once the fdb roaming series is
merged.

Thanks,
Julius

