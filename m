Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58650C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8INpOFDdy6zgQZNj++IeYTATBDv20/pe9DlHWL5cZs=; b=0hQ+KiQk7MbKavHcYwTq4Kamyv
	wl0FFni+dr5cbHfTnfKNajc+rzih36jDM1Gc+JzIUj3wot56PCnzmhBPIDamDL0ogGxcgoeHvEhBk
	wly+N3jKHPlE6r9RffaZ3MLU8u/kANdK8innJZ/9x0NTPMvx0+0b5v6z74ZH/zxCm+EWJpZ+CD9TU
	XSGH3XkzMcOzbPGAN+N5YRIORAP7t1BwzGHSsyirw3Pb9kuFE1O+hjN/o4zopJzu4FBG+HfloRFdU
	Gb0nyWUpJegSZ4CedlNFIO6FakJJvu1K07rTh1LwohxvARCCiFr5KYMtLkBYyzUqfARjSYANSU/pZ
	M8N7XI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnwZ-0000000CHpL-0pht;
	Thu, 13 Mar 2025 19:10:11 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnut-0000000CHdR-2ZqU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 19:08:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac29fd22163so229373166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741892905; x=1742497705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8INpOFDdy6zgQZNj++IeYTATBDv20/pe9DlHWL5cZs=;
        b=OngEsNrYOp6VeJkCDZbvkcCHxxATuTGa3KKBqEkqAWOKdgy3GkMeGntxdpZ7stF5iM
         xaU8eDQKPvYE83764Mt9dxzfQsG7pHUnvFxSQDuthGBn2/TfJ0C25rZbjnWMPO/WdHt0
         MeZfIHv3RucILio2qojZadSSUluv2G3/Vp6NpNA6klz/TrNdr3pYSqxcLGFRKrLVnfdV
         cOd2UZrjCtNIyl2mHCxxpg0kwZkH89APklhcI8/QOatvvM4Q2DkxmMUxVqP2ngyGpb/O
         K6RWH0sNAHgLl7xr5Xf5KKcBiRruf4naz30Uxiz4KU/mZX+YmOsXXxrJ6QzpIsIp46ge
         XEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741892905; x=1742497705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8INpOFDdy6zgQZNj++IeYTATBDv20/pe9DlHWL5cZs=;
        b=Hn0woi/jzW57TmgVVQS9JnkAgicowXOcUEhFeLCCsbsyvmhUX+jxOUD9usdWMkoPEP
         0UM5sWht3VkW0LLYAaj24glBaHG4pw+X/Ihh7Qk9u6hbjtcYIdHniFKbma9o/iPxPXE2
         OQqSzO/7Ypg50y+FQLpmjxnf82wuEASFyN4/FYCpoBvKZXettdf9+FWkSkdQt4mVzCg5
         WgIomH90UPT63RVw7Zd1lG9fZjWf6lSRXXXMvoszrQGoC69VeHhUbqI3I+Golnx3xfHZ
         tKx9dE9PhOJK26NMl0rTA76dNs7aKV2QBhHbzOa8WFpTxjWaFg3+bdVjRT1U3VwQVDB1
         FG3g==
X-Forwarded-Encrypted: i=1; AJvYcCVPDRAQqXqCsBOlO/dHsFkJJ4HL3hoGNP/eCsJy0x8BJvKIOSYJq9fg7pzssy7Ox+lSrZ05NV6jps5eFCvT2Iq6@lists.infradead.org
X-Gm-Message-State: AOJu0YwCzVvbBctlQe2u4TrLX0GfrP27d9yKJbA5hQDi03LnxCKbIng6
	3kc8g7igSrnW17jaLNBeicbfMJBrl6/dJsn2NMmTBKpuJLBxM5L96ek7enB/QWC99fYQqM8iYYr
	g1g==
X-Gm-Gg: ASbGnctHaOebRtntuLhaC111ts0oG5qkhQY/qH71bgnMFekvzpL6wlGr6b3jwAYqtFL
	EqsTfsg7fPi9hEBp43jJ/7O7+by3qedYh7hHMf8K+YtxTX07yhThAI8Pld6mS6SX7ZBP0smhnec
	C8ZxqfWYjhm+7eVFtDbaQYziysCMdBmPKwyXMcFsL2xiJQ1xWVvaabJWVeY+McYN/0xjn7cjbK4
	k6MgO9ZZFA18RLZ7F7cIq/8nOUwlXCw/VrfEtDtfIN3duhdznCTIv3LdetULCpkVk1B9XfYqfia
	PS+CcrvXQAM0p4epl+GrheYLz2Xz2Qj6pL41a6bHrLZ2JEnA1kmCKWCl6Hu5/EwUu+rgWZ/Q+8t
	iWrPhMPgQzVQbdQ==
X-Google-Smtp-Source: AGHT+IFa00JtzqukTdU3WMYr5CjZc1RVh7xO3wiZcNVvi/pVcZene2/D4xio0rZGpWde7c+HTNy7zQ==
X-Received: by 2002:a17:907:9452:b0:ac2:bde9:22af with SMTP id a640c23a62f3a-ac3290943a7mr61434466b.13.1741892905085;
        Thu, 13 Mar 2025 12:08:25 -0700 (PDT)
Received: from google.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cfb96sm112178066b.119.2025.03.13.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 12:08:24 -0700 (PDT)
Date: Thu, 13 Mar 2025 19:08:20 +0000
From: Quentin Perret <qperret@google.com>
To: Gavin Shan <gshan@redhat.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	shan.gavin@gmail.com
Subject: Re: [PATCH] KVM: arm64: Drop sort_memblock_regions()
Message-ID: <Z9MtJPNm1pLATGo7@google.com>
References: <20250311043718.91004-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311043718.91004-1-gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_120827_668813_81AB2A53 
X-CRM114-Status: GOOD (  11.78  )
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

On Tuesday 11 Mar 2025 at 14:37:18 (+1000), Gavin Shan wrote:
> Drop sort_memblock_regions() and avoid sorting the copied memory
> regions to be ascending order on their base addresses, because the
> source memory regions should have been sorted correctly when they
> are added by memblock_add() or its variants.
> 
> This is generally reverting commit a14307f5310c ("KVM: arm64: Sort
> the hypervisor memblocks"). No functional changes intended.

I think this was originally introduced in an early version of the code
where the reserved regions were also registered, hence requiring
sorting. But yes, with the code as it is today I can't see what would
break without it, so:

  Reviewed-by: Quentin Perret <qperret@google.com>

Thanks!
Quentin

