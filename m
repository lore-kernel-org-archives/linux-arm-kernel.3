Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F6BF9D0FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 23:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7rPI74gfbA2XtefUw19IA/YOEdNbS/Pn3yAdirOPcI=; b=SbvW9ll1+i3GmB5pIBdKz/uigb
	UPqm3MgVVjNqAtD8EsLyOUTPgN3/loebiUe5dPjyIQdWNayUxAu3fDIoROwidj9gKe3Jce5Loj+QP
	EitudmUk8LztSHOWfEKZZK7lLQ7WFp/uMHq8sMCtXTLwhKTbFs1Ti5b/Ld7ZFsGedM1NAQsUoS5wz
	vu1i74fOgOhQnIhTVkeHAYCLqsmhzQXSXDpcpBbNGn4TNE57sHJ+85Lej60pZXGOACv1qbMR0CRu9
	+L5TMBtAitYOcyvrrdzwOG9r6qa/5hnlbIU0LGRrBtW60MyhuHsNIoKRcdpyZdz9N6bc9VjC/gSww
	A0o7/Jwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmtP-00000000JnM-0rGT;
	Tue, 14 Apr 2026 23:10:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmtM-00000000JmR-1iPt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 23:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776208199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7rPI74gfbA2XtefUw19IA/YOEdNbS/Pn3yAdirOPcI=;
	b=dLXgfYtA130ogV3m0GxXP/LZbGH4/K7UsSZYR12dBCwXOUuaG1n3nWvqE3Fje2kNd/O/vj
	gOAqzQuIEJYviPvYqc0oUMcvzoMA36RMjOJ6EiIq2Eu/kNAdzW4Q8kVt2kL3nflb+04cLk
	hXvRxsG+dfXdDKoCwnB8nZ2OptXqxSA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-QttvR6uVOiyfEZQq5HQpQw-1; Tue, 14 Apr 2026 19:09:58 -0400
X-MC-Unique: QttvR6uVOiyfEZQq5HQpQw-1
X-Mimecast-MFC-AGG-ID: QttvR6uVOiyfEZQq5HQpQw_1776208197
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24611696eso45145045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 16:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776208197; x=1776812997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7rPI74gfbA2XtefUw19IA/YOEdNbS/Pn3yAdirOPcI=;
        b=PorJQrZP8lZHt9ZaitjMIjJhqRBOkSdD95Qlpyy+nQG0/Nptv5TARyetOzHFlsk6YN
         p7puoHZatyV5u3JU21l+ZpeFJNHfqGjlGC0Yh3KQNx0tNbiH+sLraQJg11E74vvF356k
         ADPf37cnZzMAS5hmNHK3ZUdKZjTERpObLXoB/iwTK8fcdGdZ8Y1pxiV3M4VGB3M5kqWv
         pMfmpJ2PTYwucvp7kwvgHKD+n1GkJA0+WOpSHLCve4smV2PgTrtdP3F+dK0jYRH3FqC6
         gPBYguQOCJELeczQIkVEAJ78dy64giwNJFbe73xD6YdW4+FEPJ1LtdXVXX/R0olkSYXY
         LtJw==
X-Forwarded-Encrypted: i=1; AFNElJ/R5nvo1NZwSKYwMR4+vIeHn5rP1mKag43BBOpU4VgubV9FFETAZ1pBkLxI0847XSCdXaCmcBCUtgyP/BxItr+l@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7X/H2d/sqzzW3RnYjP2LKVjYpV5/+dePm9TDDlGkgfbNOCEyd
	z2LQSZlMrJ8SgRTzBbdWDvsZx0/BuPJyfFJTIPqmUODZf6phemQl3dj9IJgYpf8Ax8je8NTvW9N
	Q0nfE3tLm7iRcI5Y9XZSlvpOFjXY8MxlhW6fM/XQapw1MA+2sGSCPf6mdLSEJoIkx0z1ArKbzfc
	E8
X-Gm-Gg: AeBDieu057+312rKhFcHkqRXhZ/xsddqBw4IkdVztp3FrIAkoShogrB2db9u7unoYoc
	xW2ZIJLobmtJdTmmwPMW4PBNHbukYWZ/bU8bfRFb27IJ1wRi2p7cEaI/eMj/unFrQvJHx90UafH
	xRgfWczsBw+kpsKU+RJyH1lvMYHRQ4FMNrN4SKeoZ65G+zVmh/yrWrtU+GJ+tldbl8OGxVEB2EI
	4R+v8yS3QCnDnFfIV2hRhFeLnVppHXd+/GjVaemAP1JoWVur+aZQDE4oFwqwUGMZRtTpWTONvgh
	W0urHyBmGU7LN1MSdSYkwN7FkQkIiTiNN2cNBkS0A8haYMPcVFzjZc35VaD48B6ukNyYu3pHbHo
	FCmJ2SEX4JvVxnWzBUXPczBQ9NZjWVnLaldDxDmIxQvqUMa105ThbctmjxVuTlfVcswBWHGoi7B
	w=
X-Received: by 2002:a17:903:3c65:b0:2b4:586d:2e5c with SMTP id d9443c01a7336-2b4586d3429mr111702375ad.2.1776208196903;
        Tue, 14 Apr 2026 16:09:56 -0700 (PDT)
X-Received: by 2002:a17:903:3c65:b0:2b4:586d:2e5c with SMTP id d9443c01a7336-2b4586d3429mr111702245ad.2.1776208196497;
        Tue, 14 Apr 2026 16:09:56 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e23dsm67725ad.39.2026.04.14.16.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 16:09:55 -0700 (PDT)
Message-ID: <bd2953d1-9da6-4337-9743-17c8ba61740f@redhat.com>
Date: Wed, 15 Apr 2026 09:09:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm_mpam: resctrl: Make resctrl_mon_ctx_waiters
 static
To: Ben Horgan <ben.horgan@arm.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Dan Carpenter <error27@gmail.com>, James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
References: <20260414132758.196874-1-ben.horgan@arm.com>
 <20260414132758.196874-4-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260414132758.196874-4-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YsKiKiZ36FI70lZRoRvLY7kZKHqzMu_S30UHuQJ2Dlc_1776208197
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_161000_529761_BC8C0E29 
X-CRM114-Status: GOOD (  12.40  )
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

On 4/14/26 11:27 PM, Ben Horgan wrote:
> resctrl_mon_ctx_waiters is not used outside of this file, so make it
> static. This fixes the sparse warning:
> 
> drivers/resctrl/mpam_resctrl.c:25:1: warning: symbol 'resctrl_mon_ctx_waiters' was not declared. Should it be static?
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603281842.c2K96tJA-lkp@intel.com/
> Fixes: 2a3c79c61539 ("arm_mpam: resctrl: Allow resctrl to allocate monitors")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


