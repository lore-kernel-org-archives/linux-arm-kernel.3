Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21586C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrH66w6hjy8vTdk3/chb+sp4rDPMHTlBdbnwkF+r5mI=; b=IjKU7Erla9SN4jsin0dAEg5i8E
	08i7k+s/YB98DOrDDYCKsLZDWH/9SwNF4hjQvoTR/Yu1PId7L7lUsmnyXXO1Kpr/gaLYIiVVp9XPH
	Oomc9KCKI4ix+G/v+cg4nyV1EB+LfGoB0KrCOpSxb2eQL1QYLW1o4VQ36UuuP28pW38bwRnO5j2wd
	iiAaKeYnBgmSQtwhwAz60fs06AEpmcrBYFKlxW8iCeUstfrQZpq/sHSxJMcSF5fQLLxXdqP4EK0DC
	qL/BCyVfQ2Xnw/vteRkvrTX6i/9y7vpM2/MalIVJexsXTOfrdJE+9f175CJLmSPrae7qLpLVDqBDz
	xA8rIZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjV7-00000003pMR-0RBW;
	Mon, 10 Mar 2025 20:13:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjIw-00000003nLB-29kZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 20:00:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso13139195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741636849; x=1742241649; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrH66w6hjy8vTdk3/chb+sp4rDPMHTlBdbnwkF+r5mI=;
        b=sXoWokGTD//OCQSnc4UPqku81AZZEZ7gBvOr+4iWWeI90g2ebaOYxooiFwyu4y/p6L
         FaDVpDKKJS/RdSdgvcpbbmJ2CVwTqVRK84EtccbfoeH4I2bJylcge4mCmV6mncltOmEu
         bi8yNmdek0/SZWoBn2WmQ1YR02B5SpDN6BHDc/lGkC788qylTdz5Nfv6dUOhX6Q45QdD
         Gq2AxMU3/0Sroe9bqu32Liw3ezqOSy54fPYuMwgwhh3rTSGEXbSfsDvXKB3Evu0KU9Bq
         /kNePSwEdLBgAi1c+3o6KqWHZvqxaCxbGV2zbnMM9rVFBJ39vNjqzuUTAy1ooeiiO1I5
         Zb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741636849; x=1742241649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrH66w6hjy8vTdk3/chb+sp4rDPMHTlBdbnwkF+r5mI=;
        b=VkWxCqp7+OqepW1pvBTz/Ex77bIX0zUM3ds5a7HGRk6m+GKLhtu+ft1RhMPupqVCbR
         s5Dm9558lMkosk5Gd7BIP8I+RQa8saMO8sggOJgxU09uTwOBY/vQH16dUwCru/A6g6y6
         ksi8c0LstT9LuqMagxJUFw07QuxA3eXroAl727I0JTIvU2JlmY/Qmd3pUBVCI8xAiEQB
         Iw7HjGXi/sW09owD5hHtDTkaIOyWcw88hHxuC1tfrK0ad0nCgKg3X5izuyJcmptvo9pB
         EkzaR5oRKTARaylfKKucGoSjTFeWEDrdGpZgIm0AZrbG0K9hRvGrQjz65bLyu9V9Qs9W
         WL9A==
X-Forwarded-Encrypted: i=1; AJvYcCXpTLL/gUn8sV32JMJcTE0H5KyR89MN1Il0p+drDEVchCTjWIUEJ3/ITPP2b9eO6DQCXLzVf5dpjzKjS2feOuC7@lists.infradead.org
X-Gm-Message-State: AOJu0YxIgIMUYaFSI8gyQ5Q6+2gnknEe9k1IKnmqWZemLpRgaTKrKofK
	lZufZpUfjtbge0RyaQDO98n1l9AOvVgzO/S1tOSs2QrSKMXrPo+NZ8iNgtyNx/Y=
X-Gm-Gg: ASbGncstnj8gqrcYcY559wz49Jjb62XbftuqHGbfm9/SpcqHipAj1kUPqkpL8iC48YR
	TQlMZirY5syDFq5dws7+jf0T4Nq1y2trX7V1w1AYvRJlRC27ld0+XkqG6pdE8kxjmJU0TnawuGO
	n7oJH+FMx8KHWeJRWWLT28L6ovN1KQdNa4dOGeUf7hZCZE+A4Rl2zsrJbrkgl558vx7MpDrt53Z
	jvVnxARTaTucPPP4cjgCV4WH/jK5A0Vn6x1HQ4hb4Tf0FVSk2dqWa1pcaoXXCjg+2tHNq60C9qw
	D8obzcamVCdUNpv3mtvxC+OkDNbf2uKmZC0h0kgfDrKLbyAXoA==
X-Google-Smtp-Source: AGHT+IFM0bk3L92HPL0a5ZdSUwgEKFaDtW1VyX0wWUqemrb2A9UISJTLPEdrw9TUJkHbZkhUzucD2Q==
X-Received: by 2002:a05:600c:3512:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-43cfded98b3mr28404325e9.19.1741636848948;
        Mon, 10 Mar 2025 13:00:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfb7aefsm15672875f8f.20.2025.03.10.13.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:00:48 -0700 (PDT)
Date: Mon, 10 Mar 2025 23:00:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: mediatek: Fix bit field in
 mtk_set_queue_speed()
Message-ID: <20f34718-e60f-4361-9ad7-311d3f67e40b@stanley.mountain>
References: <eaab1b7b-b33b-458b-a89a-81391bd2e6e8@stanley.mountain>
 <Z87e75UV0Qc4oY64@localhost.localdomain>
 <aab6d5f3-7ef9-4220-8b67-ee9b09a5f168@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aab6d5f3-7ef9-4220-8b67-ee9b09a5f168@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130050_568638_4C47EB6E 
X-CRM114-Status: GOOD (  25.75  )
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

On Mon, Mar 10, 2025 at 10:27:34PM +0300, Dan Carpenter wrote:
> On Mon, Mar 10, 2025 at 01:45:35PM +0100, Michal Kubiak wrote:
> > On Mon, Mar 10, 2025 at 01:48:27PM +0300, Dan Carpenter wrote:
> > > This was supposed to set "FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1)"
> > > but there was typo and the | operation was missing and which turned
> > > it into a no-op.
> > > 
> > > Fixes: f63959c7eec3 ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > > From static analysis, not tested.
> > > 
> > >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > index 922330b3f4d7..9efef0e860da 100644
> > > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > @@ -757,7 +757,7 @@ static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
> > >  		case SPEED_100:
> > >  			val |= MTK_QTX_SCH_MAX_RATE_EN |
> > >  			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
> > > -			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
> > > +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
> > >  			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> > >  			break;
> > >  		case SPEED_1000:
> > 
> > 
> > There's a similar bug a few lines above (line #737):
> > 
> > 	case SPEED_100:
> > 		val |= MTK_QTX_SCH_MAX_RATE_EN |
> > 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 103) |
> > 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 3);
> > 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> > 		break;
> > 
> > I think it would be reasonable to fix that too in the same patch.
> 
> Yes.  You're of course correct.  I'm trying to figure out why my
> static checker found the one instance and not the other.  I will
> send a v2.

Oh...  Duh.  if (IS_ENABLED(CONFIG_SOC_MT7621)) is false for my config so
first line wasn't reachable.

regards,
dan carpenter


