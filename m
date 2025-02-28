Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19021C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/YCY4QhV0U17HVcIuIR7hymAR0CmjWSHDk8xrbOfkY=; b=xTPltKmbDcWAtw1B4aHJSsBWr4
	9ZTignhzamYLoFrB3HREfu7Vve/UbR57o5chReY+CNponBzi9yAvvdMLcGfFxYwr1W92LszPLvhne
	oS/yJ2+OGhB1Y7yeD4cPi5GYEIkpR5NZkO17Vxz24plo0s6+uYckiKi+Neb2Orb2jxD0phzSJmH47
	EG1igzvoCVo8BqjSbfidAQhkhJxjoBFy2Sy6ZfWfuaTM0xQL6vWuRT+xt5Ib56uOrLWSZwl5hxvK1
	yl5RS+m9/znUiWhXtWGq5ly7t43bOqLunMDDV04th5d8362FDOcvrXBA2h7SSBZYQqRpn7xl+oO6D
	Kj+OFjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvoK-0000000ACS4-090z;
	Fri, 28 Feb 2025 08:33:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvin-0000000ABML-3p9D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 08:27:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22334203781so44068085ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 00:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740731269; x=1741336069; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/YCY4QhV0U17HVcIuIR7hymAR0CmjWSHDk8xrbOfkY=;
        b=sph8l2RXNBksRYXczDzoQaO6MK6jTzGvpruble1rKLsxmQ/w3ubpJB5ivgj7maD/m4
         ZkBdwmHoTXXz2+ZDJ84PfVAfvrccmLFbI/OUqkU5+a3kNi9echsT+sFQoevpQZjdhKmJ
         XbjgHE4aAVUc+wpkSc0iMZPxx9J6GHBuv3o83d+FlAGhPGCg6EHwIObY41oW9y6FW2ym
         +MRdLoOV+rdxd3Hu8YuDl9YYBnIw26vj3kz8UBr5UqUZZv6ORIzOMpNkXbEx+n791oST
         nzjulfjfAtpqfFIuvyKm/sCLsmp6HFT6EIHO91RXknAoC2WmCrc6am4dZ468nwTScUXq
         cfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740731269; x=1741336069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/YCY4QhV0U17HVcIuIR7hymAR0CmjWSHDk8xrbOfkY=;
        b=U9mN613CP4MDZH35lxpK33GCRRKsX/Iy/N9uioy8bvIGY+TYZlk10ZDViPoSh+BJhg
         EPgIr8E2ZH8EzR0PKPLIpHoo/8O77n0qfWQ/J42zLWafeaJZb/YyCfWNu3HwnknIyWuo
         ma5tJqqg25gfARRswo8PlDttvBu8ywk65k6bu2K5c3LGpjrZnQaDteRCZwML6rn0Pz1C
         aXLOsLtDvNa4/VqbsAc0vBflhupFMZGXnkNiKmOhyKQod0d4aeS3pMXFP7fHSAUQ6hvK
         dI8au+nFdeUbbKRGauctcoaIAOz/jbdQ+o+3C9ErpY+77BnU1hn5QpmyIxcX1gleBz+t
         S3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXNGvLOYRQgMkmwS5wIz1BH+00Y5UF0mRQw6zPMU00JPpavzCjh7Jd49ILnExsWv7fmcRlTVBpHmWqUniDqwAGF@lists.infradead.org
X-Gm-Message-State: AOJu0YxqY9y+rmOG7tSd/1gFc5BU7sL9fvl3Hwb3dV0Jq/RVbRRHmR4p
	14R0IOcGP+fuc7i9r80rxMwOnkWYKdsj8o5A14MsLZHDfFERibHjcRauijmsTqg=
X-Gm-Gg: ASbGncupGwWPKoLlLvExgtdRVRlXlDE44qe3e6SVR6CTd+M9mxiBc7jADFhG+GEcroH
	02dgRpeHTthHhNZUaifaI0GdCBhNPDzk9Rya0G3KI0Ewz82/SJvcdcd7euvjfFeu7eJuKV5mB+2
	sfTYk+MLO3hzKEXWA/akQhj7BgjIPLw2wwC9+P9NGX2+NKizjQGiKfFdhyenm4eA8/5SBUBpCuR
	xCatxwqG/PoodJUUeXPrQ+itPp9rMgyfPMWoDGpuhwyiBgy66PMR9+I5u6tmzCEJADyLtFfr2kw
	TjZ5bZYPbfpd5e0GdpDIzT45JLk=
X-Google-Smtp-Source: AGHT+IHGr47Db6l2St+90Kkhqacb9ZEZ96TNwAIVftc00apKFnyCA1On0wbzyLHpd8HB2mYA3zvL7w==
X-Received: by 2002:a05:6a00:22c5:b0:732:6a48:22f6 with SMTP id d2e1a72fcca58-7349d2f51cbmr10238365b3a.9.1740731268633;
        Fri, 28 Feb 2025 00:27:48 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a005fd15sm3149453b3a.168.2025.02.28.00.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:27:48 -0800 (PST)
Date: Fri, 28 Feb 2025 13:57:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Set dma_mask for ffa devices
Message-ID: <20250228082745.rc2u5jiqnq7h737l@vireshk-i7>
References: <e3dd8042ac680bd74b6580c25df855d092079c18.1737107520.git.viresh.kumar@linaro.org>
 <Z4osWNCUfufciZNG@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4osWNCUfufciZNG@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_002749_956787_AF6736CA 
X-CRM114-Status: GOOD (  10.45  )
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

On 17-01-25, 10:09, Sudeep Holla wrote:
> On Fri, Jan 17, 2025 at 03:35:52PM +0530, Viresh Kumar wrote:
> > Set dma_mask for FFA devices, otherwise DMA allocation using the device pointer
> > lead to following warning:
> > 
> > WARNING: CPU: 1 PID: 1 at kernel/dma/mapping.c:597 dma_alloc_attrs+0xe0/0x124
> >
> 
> Looks good, will add to my queue after next -rc1.

Ping.

-- 
viresh

