Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED170C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 03:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ynSAhKjwAAjcKTYW0e4L0bg5A+RQVDw3lejJ8fmbfs=; b=EDpShFbHnl0tV5935Elb9lnRVH
	MXN5HZJvdySHBDmEnzZQb/UyVADscoAhc6azsfxTeu0Sv+0M1h3PNouR76UNWmREtLb6v/njjC9/5
	ysNM/Aov5yKlb+s1DGX4Uxi9dxNI77GMwUsVF71ipt8h+kUXgTy2bI+M4FArTIRV00PqauHo8t4uf
	+pvwltnVN0rtVzlGUpv2evFrXYvwzSaBlV3azsFY41GUAHFrkg7rWUuTeJ5b4KIUnXWmUw82qLr8F
	bZBS/MdJ2fAgAJBaL1LKMqfYtkapBQc5cmAsrj9iCbgVcMdgq6vkYRKQG/VVjdZs+FnHQWdWhSuFO
	Dy7DH5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1Wt-000000040zf-0yFI;
	Fri, 10 Jul 2026 03:03:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1Wp-000000040xR-3JJt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 03:03:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ccdce28edeso736175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 20:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783652630; x=1784257430; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ynSAhKjwAAjcKTYW0e4L0bg5A+RQVDw3lejJ8fmbfs=;
        b=EJoXXLINDrBxveNANgQoqQFhu3aCEj8NdFYOr2DnXISGJCLMmLJAmJGgF8mts9KMAJ
         l8yTO6uZd5d1LSzYaC1qOPlHDxfd9LdakM4/ts3gWdWkCQXDEkeaqG02A+9K5ZkdwwAk
         aXv2Y7JC/LNxQ6Ez9Uayi3b5eAFN8xbijivD55nB1e3oLbigXeOsih259RpTSYkBcSHU
         qmgW4YsWkBJ85xMBM2tb5dRHiQ3+cDL+nd41CK95EkBpCasOQGJzDmngxp63JY3VlK68
         OeL/Te+0aAOaOakJ1ncEYX+6qn7X+oDH4OmHBVllatYgVro7nE0qi7gVloNmvZiGhTyt
         EuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783652630; x=1784257430;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ynSAhKjwAAjcKTYW0e4L0bg5A+RQVDw3lejJ8fmbfs=;
        b=hwTYEIEEgsPQsQ6yEKVWj1g1Qjl2VwAAKwrhlVuRowz+yLgJwG4vaAcepYGGcJAoLb
         WyQeyIQuZChSlpMRoO/lmQ688KsEDXwi8lEyCt4WJZVSnwewrsL7luAmTbKPMBwik1a7
         tScpqU1Fk2NF2VtI00rvUJIbnBDriCgnj6M174QerlD8pmFddaRwU1fgIX5XVFgXw7+m
         D5D8fHYv+29fyBXtl5moGQW+4QKmGqB/UNXmmCThZBYLvUMDsdKuWgE3JJVlN46BvkDO
         mFH5dbdPnpSZBcJ6mUhBZ6KswIXiBG9b6tRNk0S/xwPQuwoUGr0TINarCD2mUjiYJY/C
         D1+w==
X-Forwarded-Encrypted: i=1; AHgh+RrWJkmg4alrx+KTDmZZvtfdHjtYBGgVsK5HsfQtCo2gVIpmt+7/NMedPet5E3B1rHQjhjH07k4hNM9r8hASLEMv@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe18fxHTm7JVzMxg6RoytLLOoJXO5y7DwXImlEZnIlIV8b43LD
	Ry96RIcZ3jiZDPACeiXUqha2252XEaW/2ocT2SySagd8PwuuTh9eB7rD
X-Gm-Gg: AfdE7cm9ATw69LVXYUJ461Bf0a1nBd8tjEWxJ1GvlJN/Q7JSjfW26HkjNFlk8CGLUFI
	tqsjPmRwBETWA+QfINq+1Hl3qsbXnCwfuqSls+sUk7008W62GpSJMyrNcSXfqE40Hj32Vj/bTKe
	haeEQDLyeT/U6kHWymdEyhPmJ+hiBnNidHB6siTjXaAOSLo4IbcEsOTM1ERNfd4SAswdQCp5MI7
	1S7npba6O4iXNPoTfq/Dx69AlcRXKo59lWwHeR91pTSotRE4O+ljUBf6a02mq7kxW6hAdYR+z9U
	2XEbNxFzGxLYzMOKQfCLzUmpobTKCmBm91l7vwoFUjTwShbK73r9CaDFOB8TKbh3BbdxGyBSYwK
	+2ojU4lOWNsXC0+jCsXxGmAiVr6Epgy9CE5k8FZYn6IU3grJei3lEBjTHdMcdMg5W4QAIOx+9g8
	qzJiOmTr0iIKEadk0lxfrhawruf+QpQ53mOkgmTEDJUFDY1mq6MCafoXs=
X-Received: by 2002:a05:6a00:1804:b0:845:3ffb:ac1d with SMTP id d2e1a72fcca58-84842ee0509mr7628366b3a.2.1783652630328;
        Thu, 09 Jul 2026 20:03:50 -0700 (PDT)
Received: from debian.lan ([240e:391:ea3:6910::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm9594805b3a.53.2026.07.09.20.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 20:03:49 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: usama.arif@linux.dev
Cc: xueyuan.chen21@gmail.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lance.yang@linux.dev,
	jannh@google.com,
	yang@os.amperecomputing.com,
	rppt@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org
Subject: Re: [RFC PATCH v3 1/3] mm: make persistent huge zero folio read-only
Date: Fri, 10 Jul 2026 11:03:41 +0800
Message-ID: <20260710030341.8527-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707131714.3266156-1-usama.arif@linux.dev>
References: <20260707131714.3266156-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_200351_829838_B5FFCDF3 
X-CRM114-Status: GOOD (  10.19  )
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


On Tue, Jul 07, 2026 at 06:17:12AM -0700, Usama Arif wrote:

Hi Usama,

Sorry for the late reply.

[...]

>Can this really skip the TLB flush here?  This runs from a
>subsys_initcall, after smp_init() and after the folio was allocated and
>zeroed through the writable direct map.  The noflush helper updates the
>direct-map PTEs but does not invalidate stale writable kernel TLB entries.
>
>I think we need a TLB flush here?

I checked the code, and you are right. This runs after smp_init(), and
the folio has already been allocated and zeroed through the writable
direct map before changing the direct-map PTEs. So skipping the TLB
flush is not safe.

I will fix this in the next version.

Thanks for catching this.

Thanks,
Xueyuan

