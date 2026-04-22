Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A2AF9EDC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 12:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gALF8C80EJ2lCyyRbSwPhK0hTNS8uppnnB2sBTEGTHs=; b=tpzoZ1aTD2hIi+wXRfAYdC3EWv
	d1ZaakPZBsOjFAX+LNDsxy6lYIcdO3ctrFOUpUQb0AaWeIIQjZC+4kgJeLm6NRQSmCNescUKVFSKU
	bUqd5/tj/ErNsGbcxj10isY10i3UydiTVnhsoTFU1VWUrXDvnDv5cDPJiQwaJgyqSOVJqojIoKf/3
	HGLUtCOa9rU3rtGKIoGyf+q3LT8lrdf/ZoZfgpWHn0UTXIojeEVbLdDNSt//1ZAWrzIv48RJFs9vP
	b18vkG0cmiLfIfp69vyjrrxykc3O5lmqFH5vaEzKeqxmQR2Et2iAbiI4lj6xszIUvPNw2CK8KmO5h
	m6ZSgOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFWsq-0000000AEM6-0C9z;
	Wed, 22 Apr 2026 12:40:48 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFWsm-0000000AELK-46PX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 12:40:46 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8a068db9989so57996076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 05:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776861643; x=1777466443; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gALF8C80EJ2lCyyRbSwPhK0hTNS8uppnnB2sBTEGTHs=;
        b=RDmVZanWj2Rjdoxgvw9h+uJS4nIbuCs2THIiWEyttSiGLfJk45rjnBhhDwP6YpmF39
         jfiQ0OlUoR2FkNsfP+Mk9uTV9Uqzr6VzTyQy0KTCjWw8ZYtbrR5ACJtcpylP8Bqw9U7+
         v5uZxnuu8CNhIKeDGMu1XaX7JFkbM/qiOYMXWkwc5JLL2BuXIFNO/20euMzyNTAhe5YA
         7f/ThObZTYdtJ4vNGl2oBWI+A0VrJiYy5GEPSVdTSlTmrUC5WW0m/RE3vRx9EQpYwr7y
         tC9nCzrO4+6NJR+YMSYMnHVvsimzXUsde5dPN6KpTPHIDyuJXsbKVa7uO+1Ii7lrk+lm
         cgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776861643; x=1777466443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gALF8C80EJ2lCyyRbSwPhK0hTNS8uppnnB2sBTEGTHs=;
        b=ov5wv+rA/FIj1d7ELlvk2aCrpj33N+DSFrQTbfCxIuW565zgu30qS2Yrnt+JTBWy20
         ihuyxkbWGiG1OShMnk3T9dCmGqe4HLNTPNidJo0Z9mdy1BINpA8QJih87FDp7emeM5AP
         b7yQmCmcJ98vtwl6DkTY7l18KRCLh0Kx6WDj5ExNymCPdJW0qmG09MEWBur1E0iVZqx6
         b2fHhLV/ZrVtntr/LMqNXfZR0jPCmEOIrEMUFUgNptkQ0RbcArVj10oKeAUtbutm3XVB
         DB2KTMKVuudeA9cSWdPeKFslAbFOaNusnfoXOfONe/Ku3Dg+3MBHjsyLypZnNBW94lwa
         JFNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9I9ZFcUxupPE9A/RDLiWjo8WrwddV8OGJ3+voDdUo10WWsnmXfvbqZTuDKzkdqefRtM4O/8q/08A8VlNfCheho@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2AmV4pZaVEntgEUoGXsHW/8rAwS/eQ3CkZ0g23xcss4++bvw+
	kGeHNLhqFFWZQ6Ez8Kefw1jYAeJmcRAs8QfPf/jKHQyGjKSP4RNwrUkx6W1w3lwEFu0=
X-Gm-Gg: AeBDiev5IN2WMq6JRBDiMB2j3Q4pDMPXtewGdFZNyqJjTT9+5IyE90vb+UXZnAfjq6e
	BDq//FdXlhP7Ynh5ApQ1bp8/Hd/ZiaW4pDRo5DQt68hopQBgj+rz6ZYz/wOMAnZ/mec7VP41c7V
	QbSBllCNV05EICvAw/z+ixU+P7PLr1ewx9MW9awjWJ08zlZfx0WkyrIC7+d2AgupwFvZJKcw9Q2
	AfKz9+3XuqNyepuH+zyLEZ3n72TFt/n9Rnc+mxfdOW/YULmkmnKr8DeN1n/IDzULdjrf7J/7xv3
	8dzCNvJ9SwVn5BYVWsVOtCw2JnHIJy72LXFAOkhjgX6eVtwO7jS0PBzTCJ2WJipKexWBKdS/Uag
	z0rBw58kz9WJSIWXRb5X2OGEJDLssmQiES15oPWO717BIen3OBX8oqRwf1++ER7gpy6H7y1u5ic
	t2Q/0b5gQ9x+qV26U2KT/gI91sYF250eESaj0DToQpim8Gz9xED0sgwNw+HB4om5tLNefLXT2h9
	9qQnUj9Qj+hJi+O
X-Received: by 2002:ad4:5f0d:0:b0:8ac:adca:2325 with SMTP id 6a1803df08f44-8b028693febmr312429496d6.15.1776861643374;
        Wed, 22 Apr 2026 05:40:43 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02e035b0asm120411376d6.22.2026.04.22.05.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:40:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wFWsj-00000007c2r-46xO;
	Wed, 22 Apr 2026 09:40:41 -0300
Date: Wed, 22 Apr 2026 09:40:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sami Mujawar <Sami.Mujawar@arm.com>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>, Dan Williams <djbw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	Steven Price <Steven.Price@arm.com>,
	"gshan@redhat.com" <gshan@redhat.com>,
	Yeoreum Yun <YeoReum.Yun@arm.com>,
	"cedric.xing@intel.com" <cedric.xing@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <20260422124041.GJ3611611@ziepe.ca>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
 <20260414133525.GA2577880@ziepe.ca>
 <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_054045_198522_AEBECCA8 
X-CRM114-Status: GOOD (  16.43  )
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

On Wed, Apr 22, 2026 at 08:57:00AM +0000, Sami Mujawar wrote:

> > So this is tying it to the same FW event log that TPM uses.
> > 
> > I think that strengthens my point this should all be uninform. TPM
> > drivers are directly exposing the event log today, but I guess that
> > needs generalization if non-TPM drivers are going to present it as
> > well.
> > 
> > How do you imagine getting and manipulating the EFI event log to use
> > with this?
>
> The event logs from UEFI will be handed off to the OS using CCEL
> ACPI table. The CCEL table spec update can be seen at
> https://github.com/tianocore/edk2/issues/11384

I ment from linux userspace. event log is well establihsed in the aCPI
side for TPM and in Linux today it is only exposed to userspace
through TPM.

This is not TPM, so how do you intend to give the event log to
userspace?

Jason

