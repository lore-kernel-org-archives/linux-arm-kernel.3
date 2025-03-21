Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1CBC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 17:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM1LB5RPRJUoaX/SK0r0zxXUzjTWyAeypB9AEGb5D3Y=; b=jlTfFixA5aBd2W+caxM4LQDG+m
	IUYGog3Fd32lQM1TbvkAWr3QwNBt9XiPlkbprhl1C44z/81ZU1nx7S/8rQZ0THVR3adO8FyQuDM/0
	Fnb6p3CGs8EE1ImQdfGjGNaJPBta0UqVncfJvwrLUFlvBt4bzFbKPpuDpUEAekIaKF+ug1QygL2fv
	uHWuzs6drZWU+YjXA/H3PkYGIjtPEV+dXT4wWSB9fE+kgvte7OC8XOoA+NQ/IGEit/nCC2qxy9Hvk
	by9P3O+Jf0GBniC6YX3dRCSS9NTHqqR6zuMvHXtdbi8UXb2U1ynOyqXjVWpKz7rgLDlXNLh0zQKfv
	alxVeqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgJ5-0000000Fj44-3rha;
	Fri, 21 Mar 2025 17:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgHN-0000000FikT-1JpW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Mar 2025 17:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VM1LB5RPRJUoaX/SK0r0zxXUzjTWyAeypB9AEGb5D3Y=; b=WbgaLgDnzaQtZ5Hk93ULrYCC4r
	+sRw4HR3beRhexyGlMRZXtUb1GXIUOpkZFjPcS2J7pddq6mTb7uvpxdtX6IiK/0mCZRAyEapcxt1G
	/m8E2SPSSc6ibbQ15eW2x9JOH3rgdpn1N7MovPVe6VThTS5btXa8HiMlny67Du05ayMlWvTu7Zg+r
	UfbzzdVrghTxK/Tr4QZgY3VJY7sk7OZUCP/8p/W3r3YeZlxOO0P+olUjmr9Vu/nACqRMR3+RR9TD7
	iA2RrOyVZ1I/bLjH6WN6wfMh6sdFyH8PfuIt9YLKYScLK1xW/iPFvHIl9UyfDIuwXEgXZtIQLcO/U
	DQEUzdWw==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgHK-00000004Txl-05dN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 17:35:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso14669935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742578528; x=1743183328; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VM1LB5RPRJUoaX/SK0r0zxXUzjTWyAeypB9AEGb5D3Y=;
        b=BcOQU6kt9tLcBdAKXylSbAsWQ5J/Mi+A/XDpR+HeIxX8wP0rjDX+058vC+Md8fBzmo
         GHI8aO++Jior5o3rt8vv5F7TQ2KLwaE8wM3l7S7U0PK7m1CPsVdnN5ihfPsoI1fV5Saz
         +RkmJ579G0pL7a46TVU34YzAqZMG+h/XQ2pGOOMb98QkAQIgywYxKwPS1Q4yGsC/gA2a
         JgersSQ30UABAoTytHPSp184AVBYg/GwxxTJxBCATdSVVK+V6BPt5/M3zaFj8NJnERCg
         ndfuE8MH8aUILsV0EpA1fljMAa1Ny5sA/kZZqowedK01Si3ObI9jyxjT+kqv1TzwtpY/
         x72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742578528; x=1743183328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM1LB5RPRJUoaX/SK0r0zxXUzjTWyAeypB9AEGb5D3Y=;
        b=R1rg5F4qbrvSEp48vgp83bfThZJYI8VhA2jecMq+b24/gVhI0ROa8zzb93zpwfV1vK
         ObDoOzBSU39u5I8RDlu64SVmJWXtBdnR7t/IGydfXKotYkBymnPThgHdQUDB7VX2u/FD
         rO3sv+KTj/XXclABTbRbRygLdaJgsb5hGtD5Et0Nay5sOehQ1pDmqRfyuatsd7LF1foT
         qZVDWr3ikNEq3FfDM11IOpjNa2lCyTi2m4kCswvwlp8CZ6yBJHjbownDgPrErKVkFHdW
         hSaL0t+XnSwR02/xks3nrB04UdAY3dPx3bLJ5dBThAYySMHI1Z6z5JPtKG0sLA9aSHzi
         CTdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9rPx4wd6NSmpTcb+2pOGVSRBWGmvvi8lbv5ZOHpN8L+cfIWMNUyb35BTodh+e7vOCdrz32avhJKdAbCYTY2J3@lists.infradead.org
X-Gm-Message-State: AOJu0YxmDYSjxKJenDeuqg1+zNH1tjuonyJ9PZ+U6kMTxWpEsY2AjK1D
	5cCtcXwV+IjXNM8m+dSjigXfHVedo8XrheGBZg6X0bcx7QFOSVbfC8qR+Gt/gdI=
X-Gm-Gg: ASbGncsQMbApqTLW1aKOpIzb8TOtZy6JHGcdbm27aNdNY0w8RBxCeMx0oRXLKcNGgeQ
	2PAj1AF+TUfGl+tCR8uPzVYb8MsDaiTwjN8MxbAFkEZpz4Ei8VX2qL3k2H1Zt6Pq4WhSVjVWXqW
	c6XUrxZGWjUDg47Q5osibIEkO73BltTzI6GZr6JxLEnnDSn8Y9uL73L8ywiJ51XxbUbrzTgMPhN
	NLHHYKafXtPd/g9u8cbxZ8cro3NLly0ELUHTnng9JLu7hI0v6PmMa2P5t80OWdfvJl01Wy/T544
	zKKkpBfnmszWxfatANUy14sf1Gd8SNSUXIKKYHaGo+SDIWitHQ==
X-Google-Smtp-Source: AGHT+IGjauLF3FiaekujjWRPdiwnm31O9jhDz+mK3nAqpBJ67EtcwutfqHgUb3S2fV6TNS6UHTigjQ==
X-Received: by 2002:a05:600c:1c19:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-43d509efa30mr35210415e9.9.1742578528065;
        Fri, 21 Mar 2025 10:35:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd181b6sm32529655e9.9.2025.03.21.10.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:35:27 -0700 (PDT)
Date: Fri, 21 Mar 2025 20:35:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Qasim Ijaz <qasdev00@gmail.com>, nbd@nbd.name, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com, Bo.Jiao@mediatek.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7996: prevent uninit return in
 mt7996_mac_sta_add_links
Message-ID: <356de8c6-b3a2-4f7c-9737-011a91c4bdfd@stanley.mountain>
References: <20250320201914.48159-1-qasdev00@gmail.com>
 <46a714fb-8a14-4d24-a0a6-a22cc9d45768@stanley.mountain>
 <Z92eiVIFIUOFKXj_@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z92eiVIFIUOFKXj_@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_173530_275620_40DDBB82 
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

On Fri, Mar 21, 2025 at 06:14:49PM +0100, Lorenzo Bianconi wrote:
> > On Thu, Mar 20, 2025 at 08:19:14PM +0000, Qasim Ijaz wrote:
> > > If link_conf_dereference_protected() or mt7996_vif_link() 
> > > or link_sta_dereference_protected() fail the code jumps to
> > > the error_unlink label and returns ret which is uninitialised.
> > > 
> > > Fix this by setting err before jumping to error_unlink.
> > > 
> > > Fixes: c7e4fc362443 ("wifi: mt76: mt7996: Update mt7996_mcu_add_sta to MLO support")
> > > Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
> > > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > > index 91c64e3a0860..78f7f1fc867e 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > > @@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
> > >  			continue;
> > 
> > What about if the list is empty or we hit this continue on every link?
> 
> we will return 0 and I guess that's fine, agree?
> 

Fine by me?

regards,
dan carpenter


