Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C66C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 14:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbRMLc2DHSmY3gtRYXV6hsuWddG4eIKep4QdutNHpX4=; b=jIg+05Eaj0MKEBSi4sX0R12WYv
	ks/bdbXyadpYgqRfANXijUcL6DbZ/Y1WHZaqH6lYCYR1C51cOFeKal+Fnw21JaHsGOYyPre8yqkdP
	s0ZeMsfknQPV347z8cJQ14X8iph1OBH8bmQr/+mbx9g8vVPWbObNF6ZcIr1TSm3ynz1jh/DNUaWvk
	L4zxIvTzyTnr4Nw/X47tPYs7dkPR+e2CtJsvntuBdH74iP25HO1naQN/0BLXu7yEvoQ/rnPdjeQbq
	ljj9yGteGTS1EGU/mmMUxjmbdyKcMqXP5wMT37JhDLdas3/g1/ot09Dz5EDLr0svuy3phNKk8/P/j
	9TRlO2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQSFS-00000001QsV-2vxI;
	Sat, 14 Jun 2025 14:52:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQSDC-00000001Qo2-3Ytk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 14:50:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a53359dea5so1990187f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749912625; x=1750517425; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wbRMLc2DHSmY3gtRYXV6hsuWddG4eIKep4QdutNHpX4=;
        b=S1NKK+jaCrLCYhS2P4vgw3XYhsRbPHR8GtArImT7dys8SyL3c+EMaDuc8IPECLmAX1
         JY6AQriNuuGpx8S2sZ/TLK95av2fY15zTk/qosp2zdasj+YhhxdGw6cNeA2UeIqw2Gaj
         wsJx42o/DuoVDtzBz47rmrMRVtQ7WAxy2j1/3yEbhKBHS4Cs23OdY3ax8ijNUJYLb5ZB
         ptoSGxcoWh/5X7V3ONBirHSi3r6mywDlzpYFh9O1fe+shQVgcTH1KBi95Lyft454+Qgj
         xp84q/VFLdDRhnrvDAFKr5DuEQvzYM0EDXKGOFiIw127QcrgOiYOLaizwVGwg7T55zLE
         6hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749912625; x=1750517425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbRMLc2DHSmY3gtRYXV6hsuWddG4eIKep4QdutNHpX4=;
        b=K1txGCHJLT1+MMYSn8RtiCF8Ql459cmmlyy02X6T4PMjQRGrNFaTsPWD4VSnfPh3GL
         I+ADAyffik/pwf+Pg36LvVcFDl487BgNf2PUc6Dsy5GoUHb7BGWViOyZzHJOKKca4zPg
         oJMlfGCxxlXT8G34uxBQbk5Gtj0NA+23OBXXJs9yHvxlRf+KuXaTXZTFjPsPx1eHHmZA
         uGwNxOZksZ4CWW6bOv0RT2ZB+vgSReS17e6QbAxk9+w3Yg7Q1SrjHAGcHRZoiBjiY4hI
         R/eFJvKrXdFbQjwLVEpotUuBLdOshE+vZB4ibeT/f20/RkWgjNQ/9XLMFetER8dNwTvV
         peLg==
X-Forwarded-Encrypted: i=1; AJvYcCVxeK2AF21ES+UOTJHQ6sJYnKgwpfl7sIzP1krGBhHqvKz4pL+PLqbhzQPoq8QIpx9ch3X+ZkjiJlUbyDBQk+kD@lists.infradead.org
X-Gm-Message-State: AOJu0YwDIH02VC4IM91087mS4o7UzxXMzXQ/UpOWH1NaUprf4cQrYbWm
	pi/m1t9ZjhNW6eoGQbBZ3SBML0nQbiU0LFthMNbl9cUnqVutD+Ko/27P
X-Gm-Gg: ASbGncvcxD0tMc58QaAPDl7WM9BqunCmZEpF2kkeWSaTacz0uQRi5bOa4LT2nnY10un
	1+yrW7DD1x9ULtOUoaAvuluxZd8wUl5wg2oZZOOS+9asRnzJ15BGPcLKSVKcM4IHCPgwFLbWLMX
	hOBJcXM6pWEdJMw8D69pHN3K1CLxJY3mYShaimwj4ENV0VTwz+nxwYoj0wEM/exrimWBwCPcCbG
	fV7uaStDTe9fFrIWMbHOFtue5aODPkBiMvMpuIZXobjxpKxCSnEbFAmoHuofsrCfrlnKx4S3icY
	fBA1ZB6o2YIDeUCfgrULPiDfXOJR6Z/mOZbVl6qAwIVOOwwIKVt3wPTPC2HJyyXoXHTtwEYr72n
	v1POZrxN/VOnNAcCWjDQIDVXbTJ8=
X-Google-Smtp-Source: AGHT+IEni0696dlbfzFqWZBuZnunRZWdNQTsGCmjg9gZBYVPMKFqm2DwLd5HLiSgEdoqGRVzf1WUXQ==
X-Received: by 2002:a05:6000:2913:b0:3a5:2257:17b4 with SMTP id ffacd0b85a97d-3a572e58fecmr3447561f8f.55.1749912624775;
        Sat, 14 Jun 2025 07:50:24 -0700 (PDT)
Received: from ed.ac.uk (pat-125-253.wlan.net.ed.ac.uk. [192.41.125.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a734b5sm5521753f8f.33.2025.06.14.07.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 07:50:24 -0700 (PDT)
Date: Sat, 14 Jun 2025 15:50:21 +0100
From: Karim Manaouil <kmanaouil.dev@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
	david@redhat.com, catalin.marinas@arm.com, will@kernel.org,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change
 memory permissions
Message-ID: <20250614145021.7yve56wcxf3dlvwg@ed.ac.uk>
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_075026_892326_EFC955F2 
X-CRM114-Status: GOOD (  13.88  )
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

On Fri, Jun 13, 2025 at 05:27:27PM +0100, Lorenzo Stoakes wrote:
> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
> > +		if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
> > +			return -EINVAL;
> 
> I guess the point here is to assert that the searched range _entirely
> spans_ the folio that the higher order leaf page table entry describes.
> 
> I'm guessing this is desired.
> 
> But I'm not sure this should be a warning?
> 
> What if you happen to walk a range that isn't aligned like this?

My understandging is that the caller must ensure that addr is
pud/pmd/pte-aligned. But, imho, since -EINVAL is returned, I don't think
the WARN_ON_ONCE() is needed.

-- 
~karim

