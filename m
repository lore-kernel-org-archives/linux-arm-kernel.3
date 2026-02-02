Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81483E7316D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMtwM17CKX/8W2nz2qFNN/9+egceBVoLznQr83mTsDY=; b=ZwOb0SifbZg+zkoCfnY5QfhT5s
	gXKFUPxwpp1I97zuPzeDSMqoAMfxpe/ybEEJJf4EpYeSYGPs0wX4urvpi/B1gAV3znI0BpfYbdsQl
	8QygN/HkSRUynCFODVo0dtzdR7HtnXNH9oaotjZS7sWSPF+JHb3Jyyup29ysmNIOkEBsj6zSwIOF/
	MCmBOtPofowY3QsRgbp6jdfFJ/iaBmMK6FWUFCIvD3uYWoXWu/E7BVjcQRjfdQe59bqOC+PXUeFLz
	skzXk15IGqQ9eHpKYy1/onkaeA/sCYBTRW8mx1aftCoB/mS9wcBOgDRvjBa+azDoxHJkhh4DBXtIa
	N+ON9dsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmu7I-000000051A2-3FKL;
	Mon, 02 Feb 2026 13:37:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmu7F-0000000519V-268z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:37:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42fbc305914so3993925f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 05:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770039439; x=1770644239; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMtwM17CKX/8W2nz2qFNN/9+egceBVoLznQr83mTsDY=;
        b=TF1YV6XNLUJCguIz/Dd1sTd5c9lX9ZpmLItLMmi1XZAkL5Y/Nwohw75du78BAmWQrX
         WhffMwGGboOrs6SrFRObqId9XvPkbtDrebmMSNz4ufmKT5cciUjC9VJuNSgjK2kJB3uo
         wPEKW3fdWnTaDnaBy5j5m7H0hss0x0bqnePQz858XHW1EwGy1W1y4+fgMdymum1xu7eQ
         Z311E3m/LWom8Q340b/ArilfwaL7ryOa0OKN5SPMeZ4Y2g5KO2Uj+IhrYJ83o2WKGIKa
         pVAGFv97g1pmgV0mK+4f2lfDorR5WW1mNCVldSDnMfvX59ju0kfhVDTWlqEAihdsGoQg
         l9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770039439; x=1770644239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMtwM17CKX/8W2nz2qFNN/9+egceBVoLznQr83mTsDY=;
        b=gCzgwz1YS6TnImoUuk4sUzof4BhPYfd6Wz5Mhu3wHEI7TgwnPYcVuUmreVOxghxQv7
         oGvwKU6dL/57+c1gyGOqam7QN+wJGchHO3bkFtJl+NIgvG34W8TQnvoYB9gzq1nZj8hG
         Jgdpv3mTg7p4KJeL62ebt/CkHI89Pz02fuw0He91gU4ofWxlbBYDkxNR01RWfiUtLRjk
         2sSFNopyIscuQ6V+7Bqju3rNabD1u5Gp22Ft29Z5nRERTXXoQQ6SBaNT4ddhWeAEj9dn
         r71+HimK86oEZMgWK9apFlQgH3zh8OAMJCPHo/LXtQrdFtdHLZAFOkKZFQws8gDtHS4F
         a11A==
X-Forwarded-Encrypted: i=1; AJvYcCWTUWfRVgmvHZrzy3+18IzhUKbbymrDMXrdof2KM1J9w9lQyqVB6pAHKrzwkf/U5+TVh6t2ZVcdUDKrW5qOLGnV@lists.infradead.org
X-Gm-Message-State: AOJu0YwiQRTs8Rtw6XNKR/APQ2UzWS9/FGh+GFCRN3FlRvRMzOvnYDDI
	ELDsMlJ5UdaToDDdx7Svs7ba+8beZMDsCXpRXPvag7oXQvnNWCXMYAhQ30cyDo1NQok=
X-Gm-Gg: AZuq6aJfJQ+g+C4lPT6WM2iqkA9EKDKrLEEjSC8pyRUw7Wyfn1lncxgsOS3I2NWxbww
	salTQJusdYtSQWxo+WKv5X9TCpZOI7q3ll8j7rTU4p1D6S00Rc34NUOpj0zyZmoBOfq5xv9kS6c
	EPhqdmPuhcTdfU+bSfvmLHMKwS7Gq0JlzOn26nIK/lWNz0Vj8l4frC5sF8vmG4v/E2oQbbBK5gp
	katEFqVyysOZcvV7+sf3Gde/EFIh+QN0muAlioeTcTcW6qy0yQtyoU7bxnybSmhJvtocvAF1V1R
	g206jm9loRo4nHgYp/lTQpTJd77Qax+HShN6lM+VDN/f6207e3m5m5qLItIOja2F8lPJxoxlP8j
	Qwx9RPXvWl7Kuqo56zye9EqGbANFB+7y5GMZHIUeCfyaAKxZFqhc1CJFkSzLwxAGg7CGw1f3L8H
	6ERzxasNW/bcl8tw==
X-Received: by 2002:a5d:5850:0:b0:435:dbe3:c6b1 with SMTP id ffacd0b85a97d-435f3a92b77mr17179529f8f.25.1770039439418;
        Mon, 02 Feb 2026 05:37:19 -0800 (PST)
Received: from vingu-cube ([2a01:e0a:f:6020:7cf3:628:f0e:cd4d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm43065097f8f.24.2026.02.02.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:37:15 -0800 (PST)
Date: Mon, 2 Feb 2026 14:37:14 +0100
From: Vincent Guittot <vincent.guittot@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: s32g: Fix ports parsing
Message-ID: <aYCoiulppKnvvOpp@vingu-cube>
References: <20260202130756.1421488-1-vincent.guittot@linaro.org>
 <scnf5gh3h5pwvnbe4bwtztdlgcpvvtse4fg64bto2jgyotfpwl@sle4k4ky3gtu>
 <CAKfTPtBZCLiq0E-a2QA5X_Bix2PxXiCyuCira1V_wBWZORUS6A@mail.gmail.com>
 <howlzhze3axqiguqvxslssc2tr7ocaa7l2obr4623n3piw5xee@ujnyo5bieril>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <howlzhze3axqiguqvxslssc2tr7ocaa7l2obr4623n3piw5xee@ujnyo5bieril>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_053721_556746_BD48582A 
X-CRM114-Status: GOOD (  25.93  )
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

Le lundi 02 févr. 2026 à 18:58:34 (+0530), Manivannan Sadhasivam a écrit :
> On Mon, Feb 02, 2026 at 02:23:52PM +0100, Vincent Guittot wrote:
> > On Mon, 2 Feb 2026 at 14:18, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > >
> > > On Mon, Feb 02, 2026 at 02:07:56PM +0100, Vincent Guittot wrote:
> > > > No error return is missing after the loop resulting in removing the
> > > > ports from the list.
> > > >
> > > > Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
> > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > index 47745749f75c..767f5a622441 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > @@ -285,6 +285,8 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
> > > >                       goto err_port;
> > > >       }
> > > >
> > > > +     return 0;
> > > > +
> > >
> > > Hmm. So the initial 'ret = -ENOENT' will become redundant and you'll return
> > > success even if there are no Root Ports in DT.
> > 
> > good point.
> > 
> > >
> > > You should do:
> > >
> > >         if (!of_get_available_child_count(dev->of_node))
> > >                 return -ENOENT;
> > 
> > or maybe
> > 
> > +       if (!ret)
> > +               return 0;
> > 
> 
> That'll work too. For some reason, I initially thought it would be ugly, but it
> doesn't :)

In fact this enables more changes and I end up with:

@@ -282,12 +282,12 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
 
 		ret = s32g_pcie_parse_port(s32g_pp, of_port);
 		if (ret)
-			goto err_port;
+			break;
 	}
 
-err_port:
-	list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
-		list_del(&port->list);
+	if (ret)
+		list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
+			list_del(&port->list);
 
 	return ret;
 }
-- 


> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

