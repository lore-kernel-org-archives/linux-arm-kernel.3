Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EC5D2E9D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83Ex4i0amGXOVK4wdTZcphg7YQMJCRSlYiBwa9dai4Q=; b=11FukOZBPLByj+PEoSF/WAh/6A
	XoocBurnXd3irwY0R5BuSRDlMk9ibFHIQ7ePKZQ4bXFX0tohB5+yyG6jS3SaPeFYYLd/NO6ODIlt8
	IeCRQxT4VtETGH1TTG/0vud/1aLkIBbSncYYyPPI8fuIfDD5MMjE4DWPf5MwKoJV75p9tJxzTQvYc
	ObtFWu59qxsd146aXFgaOSFr7DjgsoKujwN7EPrqiBQemI+hJXuVaSpa81vQEMCpDjWua48BIsS34
	P14zenuromOk0ABbIwX3BsQ7mEYeegbWjtwXm6gHSSSuLwMarj/0unqhDaDtUHUWyGZNpqxXPtllJ
	1zPzFBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARrq-0000000HKDz-3IMn;
	Mon, 11 Nov 2024 10:41:58 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARpv-0000000HJpJ-1X7v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 10:40:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c94a7239cfso3388318a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 02:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731321598; x=1731926398; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=83Ex4i0amGXOVK4wdTZcphg7YQMJCRSlYiBwa9dai4Q=;
        b=i/EXnKnwdns3G25NVkax8zcNM/Ksu6NXsg0G9GuozedrZpu9WlzyIDzh7uq3dtuU+E
         iP9wltcfrZY8tbSN7QJIw6QdK0x8bt+76I1s/qet9r3RzjzI1Wtxo/pqr5z4ovTmKCTL
         ACLSwJiJ9Y3DLMJG5dGzhRMvDUJB5+Q7lbmKn3GFG1pm3vc/x5hdoCn2FPl2nWTZMqdY
         qG02Uu97hdsDx4ipXniLY2+ZNq6LIMBd/nfEYQ8Q0jdPkDyGoeqjXwTmWO77+RsNIM0F
         4fZUJH61pwzNrjTDnRMSgBmLUK1/3NbD5Ywnfps2Z5zFa4074FeKbwpAWuqahLLalCN7
         QmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731321598; x=1731926398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83Ex4i0amGXOVK4wdTZcphg7YQMJCRSlYiBwa9dai4Q=;
        b=EH+ZLwaQQOcATfA4TPHMMVs/7RP/7Lg+pdZGP42dqeVP9BzRJ6yxpUoX6OTHtLlqzi
         komJEIzr11py2xYLrgUxzggqRrYKd7Ihc2gUBPcw99m1DFahUMvwlq3oKZpnDV+PvQTm
         Bi4GiaVcBKFz8qPZoe8yBuEjqKebnDAauzCqQPApSRjZPtfPIVyD4afV5uqM3QCjc8f3
         QBOnWJctnA32cjm0+VVCmRHSCS2/FBqXsSuVirDMWZlYCFTakjnAGhQ7f2OxWuRbfzNv
         Q3IJWVKDp6nE9WzfiUj2xdXPl+ZtK0pE04A+24ey949JCCJrBGXin1IyC96Zl44dtSBj
         xKzw==
X-Forwarded-Encrypted: i=1; AJvYcCX5taVdnpj+ZBB1jwsjDu12l3fLH7pQuYpXAWjoiwxQ/kZIl5lcZMKKYZGiX4oQRRzkleoaEjyMbP+ds8VGGtvf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy/nT81NDirIwAm4H4jlrnng63QlyHFRyWtkaOtc2s8SfLi/EL
	78h/I5cPTXxwEJfHYa/d9Ry9Yhp4hIEliziRROmulDFMhHiQ5TWwtat8/LyE+60=
X-Google-Smtp-Source: AGHT+IG3n2/H+iwpqZ5QO1ewQ3Ger1ZK+UE8iF8Hgk62H7RKzgwtzGUzRUPggQWQjwX8bVTQ7/DvaQ==
X-Received: by 2002:a05:6402:51cc:b0:5ca:efe:10de with SMTP id 4fb4d7f45d1cf-5cf0a4467eemr14296940a12.30.1731321597634;
        Mon, 11 Nov 2024 02:39:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4ed9fsm4794848a12.62.2024.11.11.02.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 02:39:57 -0800 (PST)
Date: Mon, 11 Nov 2024 13:39:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: oe-kbuild@lists.linux.dev, Vitalii Mordan <mordan@ispras.ru>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, Jose Abreu <joabreu@synopsys.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>
Subject: Re: [PATCH net v2]: stmmac: dwmac-intel-plat: fix call balance of
 tx_clk handling routines
Message-ID: <9e7d4adf-f147-43a8-a654-8c2ee722121e@stanley.mountain>
References: <20241108173334.2973603-1-mordan@ispras.ru>
 <e1b263d8-adc0-455b-adf1-9247fae1b320@stanley.mountain>
 <20241111-def1390bf54ce26f76be250c-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111-def1390bf54ce26f76be250c-pchelkin@ispras.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_023959_431519_C99DCBCD 
X-CRM114-Status: GOOD (  20.05  )
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

On Mon, Nov 11, 2024 at 01:25:42PM +0300, Fedor Pchelkin wrote:
> Hi,
> 
> On Mon, 11. Nov 12:39, Dan Carpenter wrote:
> > smatch warnings:
> > drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c:163 intel_eth_plat_probe() error: we previously assumed 'dwmac->data' could be null (see line 101)
> 
> There is a patch [1] targeted at net-next tree which removes the check. I
> think there should be v2 posted soon.
> 
> As it's not the first time Smatch is pointing at this issue [2], is there
> something to improve? I mean, posting the patches in form of a series or
> explaining in commit message that the check is redundant and is a subject
> for removal? Adding new redundant checks for the fix-patch would not be
> good..
> 
> What would be the most appropriate way?
> 
> [1]: https://lore.kernel.org/netdev/20240930183926.2112546-1-mordan@ispras.ru/
> [2]: https://lore.kernel.org/netdev/20241003111811.GJ1310185@kernel.org/
> 

Once we remove the NULL check then the warning will go away.

I don't look at it like a big deal that both Simon and kbuild-bot reported the
same issue.  Especially since he reported it against an earlier version of this
patch.

regards,
dan carpenter

