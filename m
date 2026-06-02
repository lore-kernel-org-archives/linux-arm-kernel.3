Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D3ACD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 12:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4LbN0qMsJPM0M7wr5pjCmaihB2Av83fU87UeNOOiAM=; b=2MS1rQN0xAQIH3gYlI5iRiuy+L
	NQKWxLQUrUT5ZXlt8fZenyz5eK/6T3ewIhJRe8f1F/nnXKV0id8OEBXMltMa+KgwC/kVYHYIF4wlF
	XesBB23B92IlCWC+ZYCj1tpct7ZMXXOYgkgAUQtMDvbh2S+BPzQ0LrgVaIqbVKbNehnRgV8grnI3v
	wBeHLijm0OvrBf3krMefJMfIDy1l1E22ZAREVI+b/DxWc7TRJiYPrg9tNTOuE9wNKIj4EZy8AeCWK
	PeBPRcuEFEYRlVMQXwJDuIhjMP8VvTg8/NpUtUvrTfKPazR4fWBpX4PLY0hPUoyGupHtE0ix3VRcK
	t3C73wsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOIM-0000000CzKu-2TZT;
	Tue, 02 Jun 2026 12:32:34 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOIJ-0000000CzKV-3mrb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 12:32:33 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-9156b74006aso128573285a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780403550; x=1781008350; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4LbN0qMsJPM0M7wr5pjCmaihB2Av83fU87UeNOOiAM=;
        b=Csxb3p92/JjVEpNAD67kMJ+cMXlGTJsHSkMeEEhN9sYr8oaNP5IvH162EPo0w9iUZf
         Ukl1Ksbyr34vSOMcfAsKP7Cym9Rmtwtt1KrjlT5ujI9Jf+krFWNMlbomJ4fVZZbWQ4qf
         FcAEZNbcXT/qohP4SjmG34G1X6083Bp8wKqDdscZX5pNTplJe60C9ATnKGm/ZLSXiub9
         ubA7vJUuNX5oBn0QU8zhIdmjoanSrvWVC1u9guKqB6mjbdjzQ+5nDCeq7NGcDpsRMLiO
         duyHwROQEg2ZJ2wb5mPTV8/doHdQfpsyWN+aLyHgdLBqmpmSjbcRYkC914bFgtJJL3ND
         u1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403550; x=1781008350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4LbN0qMsJPM0M7wr5pjCmaihB2Av83fU87UeNOOiAM=;
        b=MWRl1kLy3cYXngcVuoyf7GR0acvHa+DpQMOy1XUjGYZmYIbGMaCBrYgABmKYBTIBDu
         +o3MblJRh+exRryLkbRCYtPftQF+9yVhx39hrsdzCVjOeWT1c8Dkevx4V0LUFM3tHO3S
         HK6O7djClIenLWY9D0u19k/YQOyt2V50hZzH4K577yNq868yUIACXK84wcfwvIIlXqBQ
         ZuRSGt3q37xaC8gSVsMlHDQzST5oEevWkt/WJFNhZ3G2P6EunjuqElXivmUj+TReLyHA
         hoKgqvMnvnciNqG7tBaKizSc1HJNkelyveMx2uhCFw6C+2/OXEsj59qRpcjpEyg5R9ZI
         w6qw==
X-Forwarded-Encrypted: i=1; AFNElJ/22aaGf9UnwTywX8ccFc4qwFFekl/BJvEP06DjWYALtsaN4tsbH8/BUWKeHNJrRKxZCNsRdSQ7SN/YV9rNfmz0@lists.infradead.org
X-Gm-Message-State: AOJu0YzBx3OSrgS9ZEau1sxndygSQQjDjaPoUPtphn5dDdt3G5KTGv5o
	O87xYZ4ICoBd2ETBNVhgIHnHo2/ychPEefcJWetjy3cgeviU1BXxi0vgts6ipENZrjY=
X-Gm-Gg: Acq92OG2BqdbaFDlw42OckdhWL2+FLgaRo0m5o7EuZkLgERe6tD6dsBdmvgGjFsXwCw
	tOGKFPreKCLj5T8MKS4qpT2EY/oYW+dXYAHphjzeFKaZLIlHC2iDZI8tOki46OFy/OP4GxuyX3X
	YXSPcpWtdyFaC/0t13/Feno7nuxFpu2LSYp3v0aFBUm4hA+wwP2v2eWuB/3hW+LKpR2V67uche7
	ZNpbkBtEOsVl0Azi3x8V3/KzWDkTK4VomcHvu+f78PbGEIPbTH7bAcqr45+KUqVcNN3IC/hMpbh
	qho6NrCb3qojPTuQQlrsz4BR+KIFdve8b0qxLnIJS0IfX5mDOhwy2OMhfnyZVFGGWO6rTBggUS6
	sGbsI6USQdV5Z2zQmVzVsoAoTJYEe0pItoEoJCzm3a5CLOwBPor97+WlmjEbeYObSlgKRG0tDPA
	5+UHg1QrYJk7PuM0RqwTRa7rYDzOJvAmt/EEypxq3N90s2jJFWO/K8a2Ou7uUGXvQWSw/hgUMXO
	0QsU1e81JSTcgWQP9B0XkIn3sQ=
X-Received: by 2002:a05:620a:2587:b0:915:5576:df09 with SMTP id af79cd13be357-9155576e1ebmr1554899685a.3.1780403550019;
        Tue, 02 Jun 2026 05:32:30 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532445a83sm1272224185a.10.2026.06.02.05.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 05:32:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUOIG-00000003lvt-3BeT;
	Tue, 02 Jun 2026 09:32:28 -0300
Date: Tue, 2 Jun 2026 09:32:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "guanghuifeng@linux.alibaba.com" <guanghuifeng@linux.alibaba.com>
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
	adrian.larumbe@collabora.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	liviu.dudau@arm.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, alex@shazbot.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
	dwmw2@infradead.org, xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com, shiyu.zsq@linux.alibaba.com,
	wei.guo.simon@linux.alibaba.com,
	alikernel-developer <alikernel-developer@linux.alibaba.com>
Subject: Re: [PATCH 3/9] iommu/generic_pt: implement iova_to_phys_length
Message-ID: <20260602123228.GF2487554@ziepe.ca>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260531093637.3893199-4-guanghuifeng@linux.alibaba.com>
 <20260531235421.GW2487554@ziepe.ca>
 <605cbc0f-dcfb-4edd-8756-1c376c9bb6ef@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <605cbc0f-dcfb-4edd-8756-1c376c9bb6ef@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_053232_014534_B41FDFDC 
X-CRM114-Status: GOOD (  15.42  )
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

On Tue, Jun 02, 2026 at 03:20:05PM +0800, guanghuifeng@linux.alibaba.com wrote:
> 
> 在 2026/6/1 7:54, Jason Gunthorpe 写道:
> > On Sun, May 31, 2026 at 05:36:31PM +0800, Guanghui Feng wrote:
> > > @@ -159,45 +164,51 @@ static __always_inline int __do_iova_to_phys(struct pt_range *range, void *arg,
> > >   	case PT_ENTRY_TABLE:
> > >   		return pt_descend(&pts, arg, descend_fn);
> > >   	case PT_ENTRY_OA:
> > > -		*res = pt_entry_oa_exact(&pts);
> > > +		data->phys = pt_entry_oa_exact(&pts);
> > > +		data->length = BIT(pt_entry_oa_lg2sz(&pts));
> > BIT is the wrong function, it uses the wrong type. log2_to_int() is
> > type'd properly
> > 
> > This also needs to keep walking and accumulating length for
> > consecutive PTEs until it reaches a non-contiguity.
> > 
> > The other drivers don't need to have that complexity.
> > 
> > Jason
> 
> pt_entry_oa_lg2sz has already considered continuous PTEs.
> 
> Does this mean that multiple PTEs need to be traversed additionally for
> consecutive PA address mappings?

yes

Jason

