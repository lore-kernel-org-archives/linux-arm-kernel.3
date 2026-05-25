Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A159CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 16:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICS7Dz29jLrJ1wTqVXTj0KDShL8/FYLDELZ9YhttbOo=; b=TejfK/5y+H++hQKps8NRZ0Urt3
	Sdtue9gmbIRJCap1RA2mL3bSDh9PSTX0hJooiDkDbeios2uSRDyJyMFD8+Fb+ooru1/VsOxdavBJg
	/5KWSCE/Nog54qIMMoA701/+4by1oT548+aX3Mu7uey8vKjFrsG48UesDmVeon50EsKWsFcZKte9h
	E2rscTzWt8q66zpM9YMCcjfG4Sz9XlKh2PedC1BOxhSgaLrX19nD5zSYm6Aragqnjk+zLQwb38/8S
	wcu2QNd3a0NEgJHqZKg5YBBq5lWrZzLwRy7jzBPtuVYs0TymUepleuL7cN3EZGcPEZhR0MyABRuY9
	ruOAtlvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYSW-000000003co-0QDO;
	Mon, 25 May 2026 16:47:20 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYSU-000000003c6-1v6o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 16:47:19 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8b3d6b215cfso168733536d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 09:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779727637; x=1780332437; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ICS7Dz29jLrJ1wTqVXTj0KDShL8/FYLDELZ9YhttbOo=;
        b=efVSqny9VTejW7Lgrr1JGy7KENEPMxO1yBI94SpFe5oeSoqPb9fAWJ6lf1xDcZOR8x
         81e/OxaCoxUc1tKsXMCdm8Y56fIP7qqZmINnWKO0wB1/r8AlFXhOZjMB8iz5mBy0WaUw
         Gwmoei0czKpAa2E+0MMTe75GNlG3tkIBkv4+z1v31Sr0CQKcMq85ty3Ll3LNVAXPDoVj
         WojMAWBPs1XGCPMO8HQigi9RNcTLx5/924SovKbr/q5q+eJK9GO+9QR8TaDkVAhMuZZ2
         gMNevnCTsMKaDiuQZoB6TB6bez6K76zkcl6QcC2hI3N3F/jAioLk8RceGDqiB/MXQiAo
         agcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779727637; x=1780332437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICS7Dz29jLrJ1wTqVXTj0KDShL8/FYLDELZ9YhttbOo=;
        b=RakwE0B0dzttvp0ckTW4wdSI9SxlWBQgGKOPAnSw2ez+uuZN1qMagKuBuhrSJEn+dh
         +wS5SUTXQNkZUMgVWsaFK6gmGz5Mnjmbj3AUWNNUN+ubrILk72KULZgPRkATosSrthTC
         Sh6XUTw+y56/EBBwQFUO4K2HtSq39/4BKuiNJEJp32Bu2SswItBnMb/ajAJh/ds28Px1
         HCbt9svBOmi6r2FMPFAyfnSMXoRr6AumPs9okje4EUWgNrpekob40VzQjT3Bkix1oir0
         kfGcqUYBtvChNrt3JAaHK0QLV8lpVqg4/lzHmELPWvLUEb9c7FfmUlujwwTHnMP6hs6+
         3KmA==
X-Forwarded-Encrypted: i=1; AFNElJ9F6KkTWTcPmNOg76GBM+CEcohmKi+kF8wACBAp86Xnjq0fNO4xAo1EVmBV39CnBxp0b8zBlKeUGCYJUpltosiU@lists.infradead.org
X-Gm-Message-State: AOJu0YwniaRoHMGpjNuFxDJ6uBVN3MH9/8Vl9+y/o2gSftT0d1mDu7yb
	eDg39joBPb8ZmDkccMBO9YlUlaHSQvcRuawt3f2U3tM1CQLdmirozgPdaUajgbd6azM=
X-Gm-Gg: Acq92OGR53mJbDYQ1JsaXjRoGX2SEivCpqZBVwdkbBHAMZqaYmfuYTVuJzc7hamyGqz
	chUo/StURYgRdjFfGRA9F241DUkRMo6Vk/1ErfzZjp3gLh+e5GYddOI91VegTlqcvjK1yZlInWn
	yy/HBwd/LlYrZiZfDW32bysoGFYEuTTtjD4TE7EgF5dpCwkds6FCfKY8GpJp7DlUAI8ZnkSgXA0
	v4UekrJiDS2X12IXvZKMJ/qyfwNls+GqIiAWLrFBhxcyo6joC2dMa96jzXjsmpme2SfKkvdK6cq
	KsZnUCPcLfnqO/Rhn6Qt3N4TFvi3i7F5Oz3n1Oze07MGlvunZUGVUMzVcGDlhahPRcy8KW4Jwh1
	iOtag8chPUOXFAO7vlcEciGwKAD4Uv+J4LiCpgupyVIsvA2KcQUtajmCcVie8RxeVmWCk7fo/0p
	+tYby4ubtLRShN0CjTU7ttsB7d2fiJDaoEe5JJSHABFWHwhaVAybEGRAfPXN1qOGw3jBlLV3K5v
	s73JOOiTBGwqt1L
X-Received: by 2002:a05:620a:690f:b0:914:cad9:fa2b with SMTP id af79cd13be357-914cad9fac8mr1258537585a.55.1779727636838;
        Mon, 25 May 2026 09:47:16 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914bb9d6b1dsm1068052185a.26.2026.05.25.09.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 09:47:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wRYSR-0000000AbRY-2eeV;
	Mon, 25 May 2026 13:47:15 -0300
Date: Mon, 25 May 2026 13:47:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joonwon Kang <joonwonkang@google.com>
Cc: kevin.tian@intel.com, Alexander.Grest@microsoft.com,
	alexander.shishkin@linux.intel.com, amhetre@nvidia.com,
	baolu.lu@linux.intel.com, bp@alien8.de, dave.hansen@linux.intel.com,
	easwar.hariharan@linux.microsoft.com, hpa@zytor.com,
	iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com,
	joro@8bytes.org, jpb@kernel.org, kas@kernel.org, kees@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, nicolinc@nvidia.com, peterz@infradead.org,
	praan@google.com, robin.murphy@arm.com, ryasuoka@redhat.com,
	smostafa@google.com, sohil.mehta@intel.com, tglx@kernel.org,
	will@kernel.org, x86@kernel.org, xin@zytor.com
Subject: Re: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
Message-ID: <20260525164715.GA2487554@ziepe.ca>
References: <BL1PR11MB52710D3CCFA2F75F6B540A468C0A2@BL1PR11MB5271.namprd11.prod.outlook.com>
 <20260525152924.524721-1-joonwonkang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525152924.524721-1-joonwonkang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_094718_497583_281E375B 
X-CRM114-Status: GOOD (  10.96  )
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

On Mon, May 25, 2026 at 03:29:24PM +0000, Joonwon Kang wrote:

> Currently, the only known expected user of the new kAPI is our team. Since
> I test if the patch resolves our problem before sending it, I believe it
> should be good enough. Do you mean more than our team by "accompanied
> users"?

He means you cannot send patches like this that only serve OOT drivers
to the mainline kernel.

Jason

