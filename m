Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D06C02182
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 01:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CIWoUy3ha4vzmjbfSmJFxTGA26KK4HHUmc6qsOMGbs=; b=ceEj8ScBcdB7vz8mjJ4UkWznUd
	WzzGLRikjHAKVAD4krwfKKqeo+ImMKnHZdtMCWBdc/Yx02w/5Mi+JlcouOhoTak0HtWzuFPeKi5RT
	CcNStc3Vwwq1UriJWG+1DBWtJF/7l03MaugmQ1fhD5tF4zqk9uTMMNAUb3KT2KkFvgnGbgd76yuD6
	8eR/sc+PX4h/c3G3URd0uJQQlpr5t8MPB1MRHu4gON7SwJv8cdcgiF5d/ygXUJp1Zp6iCYBVZ1TJ3
	orfd7hMUhYXp3FOzOIKxypAsxnc6NCXymUMcd26JD+reUYipgdtGu5MvRJInSeN6o030iI4K3KnzB
	nhOkCMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb8u7-0000000Dgd0-2pAU;
	Fri, 24 Jan 2025 01:54:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb8sq-0000000DgYw-06SC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 01:53:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-216281bc30fso37415795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 17:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737683599; x=1738288399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CIWoUy3ha4vzmjbfSmJFxTGA26KK4HHUmc6qsOMGbs=;
        b=JhovNrZkRQSwfqjJirfETC3u5feU9z4WMp57ReO2B/T+BXalq85BkpiwtNmYlVMi6P
         aXtJLCfGNWgmVxyVVXpvvc6doB6laQcF9nebWBLTn5aj7OGff4Z5SrNgtt/hLcL9QA7x
         tN1b11ewtWgAYFO4KZJZD1rVoYtZzLgKV2FDUvp0clCN+fyyICe6nrrEwu6TN4ZrapVZ
         MEg96KiTMqEZYk/ytQsTI3QKtpUmMtHVc859A6qsX3bST9gJx7YW2Aibx/WseJ9L17Ad
         vCOkZh21o7Ta0MIOjtwsuj79HJogauefbb247FyOoe+i+KnR1R0XkgcHyTuODTfZKkwL
         KY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737683599; x=1738288399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CIWoUy3ha4vzmjbfSmJFxTGA26KK4HHUmc6qsOMGbs=;
        b=Mgb0wXCtTUz7pqBrAS9U3bL/Zl5YS0EDl+8uCcSzKW6p4dE5O8BLtEMCicmupw3VpL
         U04wfmCKpOVzj5MFQ4mh37uZ0qQ21jYnGvC8QvxS1JcYxfC0kkYk8xKrRdyqTdsbLFfe
         jbdrMq8w1749tzrq6Hg6+vqMqVSovSEUjfiVJWJXyNqAbGoGEKnc3/qDlCyfgVT8vw81
         7Wnwobw3rse2TKbgF9tGCxtwxlv+JbsLWVCNsi8VbNPed+O//Phs7ZDkFBMBAbxdIRH8
         1VcjbhIrvOQwLbBiXv9jXwmDVkMQTAIGg20spW3oGYP2/dAxcUnMuPi3xhgqlSMs466f
         UhZg==
X-Forwarded-Encrypted: i=1; AJvYcCWrA07DPqjZGMZ6UKWPEoy3NijVx3zlaHk67Fd3Q4u0W2UclqPkd7XZpW2Zsc0EDKhuixZNvcaklMdWA4OXhoU5@lists.infradead.org
X-Gm-Message-State: AOJu0YxC5P5Cl4T1NZepj4IJbjus88gSEdLqKCsxR8TnCKZkQ9kpYe3m
	i+P5eU1OsBXBsuTkpZKyKLMjGUdLcNGbaFiWJFblJclg86eI0m4m
X-Gm-Gg: ASbGncu60akzb536CFO3MLYLkRrii7q1+yhNjpIwP5smyIKNSi4Whg/FZY7BQh0GL2H
	clvVTndp41pTzZXrr231DtY02aksxC3g3zOY5Jnkce/NVpgIimbX6AyhrnChXUD16UXo2XN4RXO
	Yx002tgRSuN7Eu0cI3YjvmLQY29Dn2w7PwaFCVhLjcMKk4S/bdJprC3lSaWO4qaUFbxkzonREh7
	kVxsCyTQO/oSbfwd0KaLT/rBf5Plwcdrq6YAIs+sVvEckvB2+ccipJzuCfXduxxPa+4UpgAVcZs
	Aw==
X-Google-Smtp-Source: AGHT+IFZRfnI30bnwFu/Rtxq5p6ANLOVPVizJ9I6bLn4f1DAiaJJMm0/EPmYHmngP0TFWmohDF1dbQ==
X-Received: by 2002:a17:902:ce8d:b0:216:591a:8544 with SMTP id d9443c01a7336-21c35630a13mr474511075ad.34.1737683598984;
        Thu, 23 Jan 2025 17:53:18 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141100sm5538865ad.137.2025.01.23.17.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 17:53:18 -0800 (PST)
Date: Fri, 24 Jan 2025 09:53:05 +0800
From: Furong Xu <0x1207@gmail.com>
To: Brad Griffis <bgriffis@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Joe Damato
 <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <20250124095305.00002b3e@gmail.com>
In-Reply-To: <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
References: <cover.1736910454.git.0x1207@gmail.com>
	<bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
	<d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
	<20250124003501.5fff00bc@orangepi5-plus>
	<e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_175320_068410_3E832D23 
X-CRM114-Status: GOOD (  26.90  )
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

On Thu, 23 Jan 2025 11:53:21 -0800, Brad Griffis <bgriffis@nvidia.com> wrote:

> On 1/23/25 08:35, Furong Xu wrote:
> > What is the MTU of Tegra234 and NFS server? Are they both 1500?  
> 
> I see the same issue.  Yes, both are 1500.
> 
> > Could you please try attached patch to confirm if this regression is
> > fixed?  
> 
> Patch fixes the issue.
> 
> > If the attached patch fixes this regression, and so it seems to be a
> > cache coherence issue specific to Tegra234, since this patch avoid
> > memcpy and the page buffers may be modified by upper network stack of
> > course, then cache lines of page buffers may become dirty. But by
> > reverting this patch, cache lines of page buffers never become dirty,
> > this is the core difference.  
> 
> Thanks for these insights. I don't have specific experience in this 
> driver, but I see we have dma-coherent turned on for this driver in our 
> downstream device tree files (i.e. dtbs that coincide with our 
> out-of-tree implementation of this driver).  I went back to the original 
> code and verified that the issue was there. I did a new test where I 
> added dma-coherent to this ethernet node in the dtb and retested. It worked!
> 
> Just to clarify, the patch that you had us try was not intended as an 
> actual fix, correct? It was only for diagnostic purposes, i.e. to see if 
> there is some kind of cache coherence issue, which seems to be the case? 

It is not an actual fix, it is only for diagnostic purposes.

>   So perhaps the only fix needed is to add dma-coherent to our device tree?

Yes, add dma-coherent to ethernet node is the correct fix.

