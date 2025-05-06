Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26ADC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFFBzDDTJV9/V+OG2Q6zmOkB5e6TfffS7VHQk3Jtvk4=; b=1jC5CoZ1hNsFPhKtGNQ82yxwvl
	hEKiYZ/WLdQDbee66v5cSFmr03JnR/okTlpO9l3F6h+brZ3wehYtUzM6zXe/Ui2YJ/hV5mHBaOwcH
	repaEboIhybpanNWpx/PtQLpUCZ7CjLAINp/20zKY+sDkDtV272p71ELuypAMgDEOckxUqeZhVEos
	XRM5xzBbp/fnQ046azz8Z+YwbBPcrRtshzJnz3lBMAgZ6rh7YDIcGDF47JKew9RXAzvW9t1x7qUcr
	NPmZkiB+0VGN2FfKx21cnNkIFE5wEwkuuBV7ZbpYTdyX94iDJYeBwULAiL1IANmmmgGeOJC3KOPa2
	3Ts0mkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHYz-0000000Bweu-3JQC;
	Tue, 06 May 2025 12:38:21 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFVa-0000000BZF7-49MC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:26:44 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsDwD2g0Vz6M4YD;
	Tue,  6 May 2025 18:22:04 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id C2B741402FC;
	Tue,  6 May 2025 18:26:33 +0800 (CST)
Received: from localhost (10.47.68.20) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 May
 2025 12:26:33 +0200
Date: Tue, 6 May 2025 11:26:27 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<mark.rutland@arm.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 1/6] of: add infra for finding CPU id from phandle
Message-ID: <20250506112627.00004a7f.alireza.sanaee@huawei.com>
In-Reply-To: <20250504-eminent-sepia-cuscus-fc7f7e@kuoka>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
	<20250502161300.1411-2-alireza.sanaee@huawei.com>
	<20250504-eminent-sepia-cuscus-fc7f7e@kuoka>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.68.20]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_032643_172882_28A407E5 
X-CRM114-Status: GOOD (  26.79  )
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

On Sun, 4 May 2025 19:48:11 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Fri, May 02, 2025 at 05:12:55PM GMT, Alireza Sanaee wrote:
> > Get CPU id from phandle. Many drivers get do this by getting hold
> > of CPU node first through a phandle and then find the CPU ID using
> > the relevant function. This commit encapsulates cpu node finding
> > and improves readability.
> > 
> > The API interface requires two parameters, 1) node, 2) pointer to
> > CPU node. API sets the pointer to the CPU node and allows the
> > driver to play with the CPU itself, for logging purposes for
> > instance.  
> 
> Run checkpatch - missing SoB.
Shoot! I guess I know what happened! Will use the script.
> 
> > ---
> >  drivers/of/cpu.c   | 24 ++++++++++++++++++++++++
> >  include/linux/of.h |  8 ++++++++
> >  2 files changed, 32 insertions(+)
> > 
> > diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
> > index 5214dc3d05ae..1e8d1fa04d3c 100644
> > --- a/drivers/of/cpu.c
> > +++ b/drivers/of/cpu.c
> > @@ -173,6 +173,30 @@ int of_cpu_node_to_id(struct device_node
> > *cpu_node) }
> >  EXPORT_SYMBOL(of_cpu_node_to_id);
> >  
> > +/**
> > + * of_cpu_phandle_to_id: Get the logical CPU number for a given
> > device_node
> > + *
> > + * @node: Pointer to the device_node containing CPU phandle.
> > + * @cpu_np: Pointer to the device_node for CPU.
> > + *
> > + * Return: The logical CPU number of the given CPU device_node or
> > -ENODEV if
> > + * the CPU is not found. If the property is not found, it returns
> > -1. On
> > + * success, cpu_np will always point to the retrieved CPU
> > device_node.
> > + */
> > +int of_cpu_phandle_to_id(const struct device_node *node,
> > +			 struct device_node **cpu_np)
> > +{
> > +	if (!node)
> > +		return -1;
> > +
> > +	*cpu_np = of_parse_phandle(node, "cpu", 0);
> > +	if (!cpu_np)
> > +		return -ENODEV;
> > +
> > +	return of_cpu_node_to_id(*cpu_np);  
> 
> You leak the node... or intention was to return it to the caller, but
> then you need to document that caller must drop the ref.
That's fair, I include documentation for that.
> 
> Best regards,
> Krzysztof
> 
> 


