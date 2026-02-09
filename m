Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AFCEF0702
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 03:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmldnmLhL9SqYkNgbH+pg//X2nCE1O776WGQ3GQgbFQ=; b=CceUOI5790hfnpftMmEI5cj6uB
	iVWDZtNH3DU58R6uVrDgLZgFOLGFLwxVfna1ES5NGK2L/SDHk5TKWlOaMqFhQdiYY6his3WY8DWSB
	crW11O2IgJyDmJEwYEC8qMUDx/bYlUIbLJWyRAQ0Phgnsk+b6USweF98FbCwX4gFOaC4HIIKbLDvb
	tsmlFKwkkGEfxt7jcBvgKJEklKmfXSr5m0/LwASVdhapwa7dKwa/iquYPvgtG0sLHlzJnhFgwOa3x
	yhCGkalzUZ1MIxsL7ArkxgsWYrQ3j1rL3dPjJwDIiUZHfkC0h+gnyFkJkN29cfY2qI6Ev7+0a/PfL
	BtRit4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpI9M-0000000Emdt-3AgG;
	Mon, 09 Feb 2026 03:41:24 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpI9J-0000000EmdC-2g4d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 03:41:23 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5029af2b4bcso20759871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Feb 2026 19:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770608480; x=1771213280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TmldnmLhL9SqYkNgbH+pg//X2nCE1O776WGQ3GQgbFQ=;
        b=mFPUn+Yrddwm2HN/jYal20SbFd4nyjMoLZsraNwBO1dhxnCHppBie+tnlijH5M3F/R
         NG5qKrqY9SKjBF8wa0d7rcGScqdnYlxkPj6q15F2hy9QYLdi1NvtBVTgTiE2cPaIfV1y
         rEmdHiNHTKtxjBGjO62cqy0Xg5l1Izp41skXgLpJ05mGq7BRnqcqL4pR8OgsT4FVM31E
         O9tRYcNkHv4WLwvP5qaGdblatt9jPolhuZDmlDSeCt7SjQPFA+YswkypOe5SvJ3Za10H
         0l+lVcNxHXjcYTiic9h80DybR1STdJIwpgtzNaS5oiqg0PDX/oUqft1Gfm6vDMs/NZ/I
         0+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770608480; x=1771213280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmldnmLhL9SqYkNgbH+pg//X2nCE1O776WGQ3GQgbFQ=;
        b=X41A6GJRNUFl71ka5v9M7NQ/QdPBeJm5q5uyQOMqqCiGjObAb+ogY88F/jWHr1skDH
         6YrKtEzPKZrbY4L20Iaup/GH78ykbMSlcuLbuZnFEQUBUAio1d9YmSti7SZEQTO+CWKd
         nmZ1dGpoKAnznELhrcwtg8RQ5K6VLPTaf3dfhL3Ori1z+YGII9SRocNp+Nq9h5aedYJB
         TZErj9h5h8L15scjC3PYjE8G4RpZSj+I377BIBwfovKqRV928KbySHBDhVYH3MPiLXOS
         /wvvxELNcy84Mvwtq3dCqe7rIWm1H9In+IVBJ7Z2Je59HvZm+c/E3UD6fhk/uR2BewUH
         qfqA==
X-Forwarded-Encrypted: i=1; AJvYcCUOqoQ9LittGiAf9359uHvp3CHgnaOvWNtnggkWMTlD9HgVvMFivuEr+kw2WqRjPTIV4ia9ezQLO86ypfX76Jok@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9I5+uRV0tFqYd7vIk7JGAeVxUKEIH/7oNBZ3XVcK2IytprhEF
	DLk5GP0FcmhlQE8sTzSUYbKV5I+IyqOksuBPuwAWASx7OLfAbJw2zJzd
X-Gm-Gg: AZuq6aKLp681tOAhMcvDu7X12/SOLwoYRK2xRjNW6shkfMVd0I4AY57KwCi3YiZj0Ph
	BUBHBMm/nJj7k/z5T+21h06KSYpfShM05qjx66u0iZg66rlz1FJu4bgAJbkAjp2dOyRrtv22RR7
	e+NK3PeVpkoxp5dTfTq6RDWH1T2qg2PlKB3NQZMfxTQPzXdSofFXrfLTOin3LQgfb8TUP+xu0rB
	K52Sz4Tt7xoCNh67HTTmuBY2cimFw9Mrwo4rKWDjLbKV8ubytT6tE7v8YcD6DRMaGnesp0zZseC
	7x6R9Kj8BOtPN/Q9EzazwVnOznHJiOO0+jGMHWPgAVtzp/sDgo98kbt9j7KExGY8jclp8zAND5H
	oXh5DUfJOJM4sJTiqylA98V3QApswBBRhJhFhDeB/SAMRM70Wm92BVcMGEm2G3+sTVFgGN/eRAj
	55xtCoa+eu90j6BbIIKJYq9WDZa68vGxuWEtmZtH0Qt6TDu1z17L++
X-Received: by 2002:a05:622a:1386:b0:506:217e:b0e5 with SMTP id d75a77b69052e-50639675655mr130106381cf.0.1770608479777;
        Sun, 08 Feb 2026 19:41:19 -0800 (PST)
Received: from P5510 (h69-131-24-92.cntcnh.broadband.dynamic.tds.net. [69.131.24.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5063913ba7asm66837111cf.3.2026.02.08.19.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 19:41:19 -0800 (PST)
Date: Sun, 8 Feb 2026 22:41:08 -0500
From: Jie Zhang <jzhang918@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, jie.zhang@analog.com, horms@kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: fix oops when split header is enabled
Message-ID: <aYlXVIqHfdOfcAAl@P5510>
References: <20260206195643.11333-1-jie.zhang@analog.com>
 <aYZPUx2WrIkPmvIU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYZPUx2WrIkPmvIU@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_194121_691989_9C6C8E4A 
X-CRM114-Status: GOOD (  36.25  )
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

On Fri, Feb 06, 2026 at 08:30:11PM +0000, Russell King (Oracle) wrote:
> On Fri, Feb 06, 2026 at 02:56:38PM -0500, Jie Zhang wrote:
> > For GMAC4, when split header is enabled, in some rare cases, the
> > hardware does not fill buf2 of the first descriptor with payload.
> > Thus we cannot assume buf2 is always fully filled if it is not
> > the last descriptor. Otherwise, the length of buf2 of the second
> > descriptor will be calculated wrong and cause an oops:
> > 
> > Unable to handle kernel paging request at virtual address ffff00019246bfc0
> > ...
> > x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
> > Call trace:
> >  dcache_inval_poc+0x28/0x58 (P)
> >  dma_direct_sync_single_for_cpu+0x38/0x6c
> >  __dma_sync_single_for_cpu+0x34/0x6c
> >  stmmac_napi_poll_rx+0x8f0/0xb60
> >  __napi_poll.constprop.0+0x30/0x144
> >  net_rx_action+0x160/0x274
> >  handle_softirqs+0x1b8/0x1fc
> > ...
> > 
> > To fix this, the PL bit-field in RDES3 register is used for all
> > descriptors, whether it is the last descriptor or not.
> > 
> > Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
> > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> > Signed-off-by: Jie Zhang <jie.zhang@analog.com>
> > ---
> > v2:
> > 1. Update for the latest net HEAD
> > 2. Reduce crash dump message in commit message
> > 3. Add Fixes tag
> > v1 link: https://lore.kernel.org/all/20251202025421.4560-1-jie.zhang@analog.com/
> 
> I was trying to work out whether this was a re-post of a patch that had
> already been merged and it was the result of someone inappropriately
> re-posting old patches, or whether it was something to take seriously.
> 
> That is because of this in the patch:
> 
> > +	/* Not GMAC4 and not last descriptor */
> > +	if (!priv->plat->has_gmac4 && (status & rx_not_ls))
> 
> Commit 26ab9830beab ("net: stmmac: replace has_xxxx with core_type"):
> 
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 99022620457a..151c81c560c8 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> ...
> +       enum dwmac_core_type core_type;
> ...
> -       int has_gmac4;
> 
> So, has_gmac4 no longer exists, and hasn't done since October last
> year.
> 
> Thus, it seems your patch has been generated against an old kernel.
> As you are submitting for netdev, it is a good idea to ensure that
> patches apply to the net-next tree and/or net tree depending on
> which one you are targetting, and have been tested against that
> tree.
> 
Thanks. This is a new version of the patch I sent last year. I tested
the original version again the net tree. But I forgot to test the new
version again. I just test it now on the latest net tree with other
patches for our board. But Ethernet stops working. I'm trying to figure
out what causes this new issue. After that I will send out a new version
of this patch.

Jie

