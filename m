Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9DAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEb+3qqZQ6y0qknhmyqZMe7sYP4AQ+xYtScn/gz9NwM=; b=vtg02jQcMMdFiTLxnKCkDa4DIU
	1Cd8mk5SfllY8dMgDeWjkcOMWC1lQhE57tEzZteW+j4azgEZQicbtoryNL52HBhbtLHCkuNzIYMf6
	kbMaxSL2Ub0WbO/0py2CE6+Shf+PSdxeESgncq7KeaPCuhldKJ8vT8a3PcAN02gvYgxI8xoGspT7w
	xftuwG1JlfIxkf/Iwt/KWNwoGznxgUp6EyX7ZbPEfigkpTc9SgRDYbB/j/Vyd8CJb+yqrHv5Y47pp
	WEMxX0V1bo6mkFvVgVRmgN2ULCShEoNFCu2eQETfFUp6FucE3qdqsQEfne3eo+7S/xDjbEQP/6afH
	CKCiZZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mlA-0000000GRgT-0M5H;
	Fri, 18 Apr 2025 14:32:04 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mjD-0000000GR8E-2VwF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 14:30:04 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac73228ea73so18816266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744986602; x=1745591402; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jEb+3qqZQ6y0qknhmyqZMe7sYP4AQ+xYtScn/gz9NwM=;
        b=Z80VX/LmyF9nM0+5JP6cFkCeC6UgE/xAHNDUaB02H6qTJrXm1Y+no6SxB+Fb1MJicR
         G4ZyVzboQ3H/JvBEQy45mP7qBnSe0kDwJziUVDGyzp2Z4u0pD3tR1V/fXY7or9Nm3+wI
         CQuZRNTLGxJNOHyU2lfvhyGVr0hRGCaN/IJbvwGgxl5s6/oTApuP48nc2WW2jCADRNGc
         9w9T1+AZKM+ojlfxA2zzEBXdx3XZI0S/0guMOHqd5NzBmPaiWT5ipnRYZZa3idtRWmA0
         TcHtL0Bw9geuqDc3BRbQmuyopTDXGpzCTgdL3mz/bxxT46YFV3aTpnjjVQpE/OFA5eWx
         z/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744986602; x=1745591402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEb+3qqZQ6y0qknhmyqZMe7sYP4AQ+xYtScn/gz9NwM=;
        b=wYD97vG5lqtJckUrpwnzKBSQX2ICU1s9Jb/gUo8iJ4CplZnpJ69XSNXPDJOi111Ulh
         +DLBP8L8aJo7czLDtySgcjTiVHxmjLehrmvDt4NnyZl8uRRVR4CQGPTyaVudiWHymFRH
         YNHi83skObmmTxfHrQEhpj0MO2All+015JqjqC4MVT9t80gWoZ0RUePb6TLkJepWHxFB
         NA4sV8oQoTiUgDnE1U3uXHgbM4FPV6djQsp4HfiLEd9gT/u1OgLYC2rw10vJ3XzGCll/
         fBrVrq9fZfoeW1dame6bHTZzuJg3NN6+7dHAbEoDFkKMk0jQMHsFRShKbg9dILnBQ122
         lXmg==
X-Forwarded-Encrypted: i=1; AJvYcCW7ZEOeD9oje1YNOKc6+j2aj1OkRgL+XQq4S4B8UBBuRwQ6q+9Y2wH5+skolQKmFMo8tyz5zYLljXzWxNNOlWzF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq+unYDS2kMwVh9QHr5NADEAUqjuXWxj4LePpRUUxxguifqBE9
	vnqvhwxwFAx2/PVJv5acVKG1HxtsLNftievMqWs3uxml1p0VjQ2a
X-Gm-Gg: ASbGnctrEYoyh5uBLc93wI8eKuli+7LtiNcWQeZiKHDY4cq5omQp9IaOgvgOtwKKG/o
	EQccfKZJSQ8QAY23b0yZtPvtEu5S0qbazX1xbrWEHR839Zzx3tgayk6BWwiLPzlbgzffpPLhih4
	feGu+BQofpqgUhDJ/sRsEa00MJYCdkXJ72Nan44yNZjir6G0y/OjK1MEueTKKoMn/tv62jC1UtX
	mv7TNIR8mVqFRutUPfrPNLvUWPNZbXiKIjJ9fk90wX4PV3tNyAO6pKzOMslGg5yQyBR3AtOMnTd
	cWnFWedd14zjyatpzBnHFRhisWOk
X-Google-Smtp-Source: AGHT+IGdnYDFhquPDANBW/t8s+v17pRTpxTdgVNlSSlgqLevLyFnxfpZxlTzVSiFWuujrFYTqz760Q==
X-Received: by 2002:a17:907:6e8d:b0:ac7:2aa7:5ba6 with SMTP id a640c23a62f3a-acb74b2d23emr92002066b.5.1744986601569;
        Fri, 18 Apr 2025 07:30:01 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm123261366b.124.2025.04.18.07.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:30:00 -0700 (PDT)
Date: Fri, 18 Apr 2025 17:29:58 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Message-ID: <20250418142958.6ews5uuoqayc7lof@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-5-wei.fang@nxp.com>
 <20250415204238.4e0634f8@kernel.org>
 <PAXPR04MB85100BB81C6B25BFC69B32B588BD2@PAXPR04MB8510.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB85100BB81C6B25BFC69B32B588BD2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_073003_640099_EB087E8E 
X-CRM114-Status: GOOD (  13.73  )
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

On Wed, Apr 16, 2025 at 05:16:15AM +0000, Wei Fang wrote:
> > -----Original Message-----
> > From: Jakub Kicinski <kuba@kernel.org>
> > Sent: 2025年4月16日 11:43
> > To: Wei Fang <wei.fang@nxp.com>
> > Cc: Claudiu Manoil <claudiu.manoil@nxp.com>; Vladimir Oltean
> > <vladimir.oltean@nxp.com>; Clark Wang <xiaoning.wang@nxp.com>;
> > andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com;
> > pabeni@redhat.com; christophe.leroy@csgroup.eu; netdev@vger.kernel.org;
> > linux-kernel@vger.kernel.org; imx@lists.linux.dev; linuxppc-dev@lists.ozlabs.org;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for i.MX95
> > ENETC PF
> > 
> > On Fri, 11 Apr 2025 17:57:42 +0800 Wei Fang wrote:
> > >  	enetc4_pf_netdev_destroy(si);
> > >  	enetc4_pf_free(pf);
> > > +	destroy_workqueue(si->workqueue);
> > 
> > I think that you need to flush or cancel the work after unregistering
> > the netdev but before freeing it? The work may access netdev after its
> > freed.
> 
> Yes, you are right, I will improve it. thanks.

I think the workqueue creation needs to be handled in
enetc4_pf_netdev_create() somewhere in between alloc_etherdev_mqs() and
register_netdev(), so that the workqueue is available as soon as the
interface is registered, but also so that the workqueue teardown takes
places naturally where Jakub indicated.

