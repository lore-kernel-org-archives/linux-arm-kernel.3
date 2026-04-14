Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414B0F9D0FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 23:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWUEmqhSN2RoGOTBWUHopuvZw14OJ/kmyzi/wm54o9A=; b=M3OjrZjqQglKWU0Nyc4OMAAKAr
	5mNr4E9BIqoOCbQ8vDYGq0l5YeO2sNQcIHlSm4gjRu7yh2a8MsgkaceQxLxmd64uUQ2t+cxcN64yX
	CRMjYHrMFYBJVxskppZvYP/wX7R1p+TnE2EOHblCv/yxQL78DUGh1LGksIvp8WrC/bG51bPO85psG
	nskJfv5SshlR5bOIyFDoUBpIJQPVrEs2xWvBEFDj1bvH1oc7eYQclcT0UGptpBC6gUUK1rcE3VEif
	4QkBTSzKkDzW0ka/Bm9yZKXLseayqwDypSjSGnPdjhZkDTz/dXbTtVRn45v1YFVtKmFsm/9fqL7BU
	gxbWWrew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmsG-00000000JgY-3Lmi;
	Tue, 14 Apr 2026 23:08:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmsD-00000000Jg8-3Rud
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 23:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776208126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yWUEmqhSN2RoGOTBWUHopuvZw14OJ/kmyzi/wm54o9A=;
	b=NMz0AnjtUOsW/D/pU/F8PAmnEY0i9pZaUrXvt5SvKd2p1txvKlPlSM9u9whzP7Fuap5N5h
	MuJcAPDa38YvRSzEnry+tUfDlWgrWCj/JtifC3E29ERQPp1tUUNmrUPytz0oxzKwQx3+aQ
	+Eh9k+DHk14JADYTurH1ErFfTFMtm4k=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-maTGZIasNAma1X9QkRibkA-1; Tue, 14 Apr 2026 19:08:42 -0400
X-MC-Unique: maTGZIasNAma1X9QkRibkA-1
X-Mimecast-MFC-AGG-ID: maTGZIasNAma1X9QkRibkA_1776208122
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so6270226a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 16:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776208121; x=1776812921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWUEmqhSN2RoGOTBWUHopuvZw14OJ/kmyzi/wm54o9A=;
        b=dpMq1mNUXJqQn9IP0VHqLUXgFxF0o5tP+gmT/pIAeScj0RSxdnHCM2csiMyMdzkyPJ
         r9qd2ihaDIg4n5Gf1kR5EmZwD47Cet6qXwrInh3PzyQgwjT3oHa+IgJk2O1it1V8FDrg
         m6XDnIoP3F887SOig71E01CCbtQxcDu5v0F/3q+R/9PqrwJ7t/7m4wRgFnbLnrf6JUFI
         pHDlhHOOI8qumSxyiXOkZDtsrk1gtJvo8jSzQ0/y7gZHpOvdLXbdgRYi4vnNUURrQX/T
         /baJEVVEnbvwFQdEqBH4Ppn8vW1gIxpiTKehUh83G3zj3ddNAnbY7lYblcVU988nT5k4
         A8Jw==
X-Forwarded-Encrypted: i=1; AFNElJ9iJ7dUkhoCMiQ54TDOMoerVy9XrtgJtZieDYGghv5PfkF9peayB3tmTDV+KckgY9FGbGJO9qEb95/2ubHSGEhq@lists.infradead.org
X-Gm-Message-State: AOJu0YxzP8fr1G7ZMAk3OSRq652Esl/ETgau0ALf5ohmoj2yo8zScxv2
	v40Rk7oKvuCvH84QFAz62oYCbLXPLLp8xufG9z04TCb/dPhOIOPlSC40JsOwET/t0gnWLwD8Szr
	OiNAwc14RkQI6+1lwFsjanCjtQqM6XMLKAU1iakGVLD95wxaGLadtRHhs0ie3Apm8fBYQeAcevQ
	t6
X-Gm-Gg: AeBDievT2mZypwfRv/L7XFqO8Nu6oYtPkTKVsajx3/ZemlJYkgbeS1DI8TufqZ3dbOW
	c/Pf0uyxnLTXE5IudKWdgt/gG7F1NNXdFEoFF7aO7+PcopcnOgn38kecPOoQHSeZh0O4KK7++9Y
	pt8jqJbp+knDmTp+LXE/VSmNztfbE9H2OVdXtXK5lqBWaTL53ugk9Zaj93ngT1iUiSwsczxJGC4
	/eytqddybmBZn4LmWQbJYuMujJBzKeK+x/BIDKjwIHk/nXap2CjYelDWWWzRvwyLkSIN8Ji28J1
	vJ1JLv342KPng4PxRqi7IHCkoVQLd4nB/dBnKMlsVJL+XmZCq6drfqnH7UmuNeCtPf/wf+dv6hF
	ZykJseIxCl4+bhxMZZa0mMbK4jJsy5qn7+ahdEOIw44tTNQd7lp63EAgRwaWI5AJASHvDin0YUC
	4=
X-Received: by 2002:a17:90b:4c4e:b0:35b:e551:90d2 with SMTP id 98e67ed59e1d1-35e428592f7mr20523862a91.28.1776208121588;
        Tue, 14 Apr 2026 16:08:41 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:35b:e551:90d2 with SMTP id 98e67ed59e1d1-35e428592f7mr20523833a91.28.1776208121150;
        Tue, 14 Apr 2026 16:08:41 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd21b5730sm67801a91.2.2026.04.14.16.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 16:08:40 -0700 (PDT)
Message-ID: <699733d1-55ad-4cd7-9d14-f8562c00d598@redhat.com>
Date: Wed, 15 Apr 2026 09:08:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm_mpam: resctrl: Fix the check for no monitor
 components found
To: Ben Horgan <ben.horgan@arm.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Dan Carpenter <error27@gmail.com>, James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20260414132758.196874-1-ben.horgan@arm.com>
 <20260414132758.196874-3-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260414132758.196874-3-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: efaaKLrhcYu_icxL7Kj-KK42AACqN7GklwpGEXVTZ6o_1776208122
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_160849_942983_59346E99 
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

On 4/14/26 11:27 PM, Ben Horgan wrote:
> Dan Carpenter reports that, in mpam_resctrl_alloc_domain(), any_mon_comp is
> used in an 'if' condition when it may be uninitialized. Initialize it to
> NULL so that the check behaves correctly when no monitor components are
> found.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


