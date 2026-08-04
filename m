Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DC2C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5+qFiO5eRTgHEGmoW8uQomFkTfaTToj617XVLzFBYk=; b=St7v4qbX/XB3BrnWhHsgt3E/Bx
	0DGfllK9je3T+mClCciT8oz3lVEYiC9nqNq0LpSwt989v6ex1dXqxt/fxEpdYH96eo80wykNAQDOq
	/oR0B98IEfghgiNgUb4F92XKXyyqPvlknoAdjeDDnsDXIXqR+zTC4s0fdf9Qj/9EUVpcgPmewzRfF
	Sw3V/cqXpXB9mMNLaYRNzuVzd4NciGk1R1Bu5aB3LXt5+xDUjcN6Wtcjs6oyat8SGQPGoamjR7JO/
	lMh6eYpgnvzZRcVZwDGdQby5uRJSBMF/QGCIoE6qE7V3JJIe/YMJVzsxJKAKK0wVrcCeg+8JkUxK2
	3mH/agew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr64T-00000000wl0-3Dxf;
	Tue, 04 Aug 2026 03:44:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr64R-00000000wkA-1PQD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785815042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5+qFiO5eRTgHEGmoW8uQomFkTfaTToj617XVLzFBYk=;
	b=AdUFOw1jsEKQE5PfOIWosNKFSf0pX7Ur6iCC1OR1ovBtmNH4aj3MhjrfBV8FQNW97DUotv
	hGxiCzHYzvzkLdgjrbMc+QwVzlYXi9wEDChvBmD3zfVO+JjtSfZenTnKhtqrYOEXpvi+Xh
	/yS+LTMPvvMZHNaw72RdwtqCKYoF8ZU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-Oaeen-zhPs6BCe8zh3QbSg-1; Mon, 03 Aug 2026 23:43:58 -0400
X-MC-Unique: Oaeen-zhPs6BCe8zh3QbSg-1
X-Mimecast-MFC-AGG-ID: Oaeen-zhPs6BCe8zh3QbSg_1785815038
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so9852560a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 20:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785815038; x=1786419838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5+qFiO5eRTgHEGmoW8uQomFkTfaTToj617XVLzFBYk=;
        b=O6UElc56Qn9opu2aXm6uyab9aK7NCIy2UeJouUPGv6TxqNcRnq+MRARbpdCEqQWbgv
         NCom4PcDCgRj/oor9APQpkUWHzBYuQKM9oUTJeGv7gt/pYtoPvpyE3s6s4IirAcvTBGm
         vChU/sM3wkMdwfIADRxoEPFvSYdECH0LcNFt7GSpcza2VlUYTRt0dRd0RIOZ4ivSOwsh
         D1oQANR7I+o6aDc03q1X1HgpAJ9hQ08LvDU3Mbv5ZZsCfIYvvWjhv2/O5bGKU/bw8qoS
         UNNhl89YnrkGPtUIWDJmcfxEaZlpXp1yWLFe+Y4c+61W8nf9dZj1pAWLHpdbyZNwycfl
         gccw==
X-Forwarded-Encrypted: i=1; AHgh+Rqjd30plviwVF45HIpdXQyODAoUPgUIeDG0N/d4C9/OjN9MwvGkxSAzBW1U9W0T1sR4oYnomTiZhKE8ivzcnPce@lists.infradead.org
X-Gm-Message-State: AOJu0YxQtf/ESrDmlE3zJZG/YA5hgfOqnC6z0+/h3k7L8z3mVZW1Shak
	BFAGzUcZQ5HlDy6ihnxKLhbEnJ1ntNN5WMmkpYnEu4zH0rrQYW/PXBz+cKOIPfSrtXmoLTMcaUu
	33S8HBoJy3bzlziJZ/wOx8yKhVtOm29BOSEIMuntlKGIJQlU0cediTOBd48FFeNqRxAVFRU259+
	y/
X-Gm-Gg: AR+sD11Nr5OyiLfsBTaPjKHFBI0pmF3NWVow/iUTCaekma+JZnB1WlleFzjZJIYggvb
	Uvh0wMxSP1LYgyU+gVTzNtwKflnbMAiWahi4d1PQbm0eFZaIFaF0WgSff6709opRk8b9oEEbq6q
	tr8N2MTf6cB1GLyVXbP8fvyzzsgOTfjPcDHyJfPI/sa5vvb4glMzsWUgytNNZckiqauOn9wB+tF
	/uk6S7ZA/lyevwq2Zb0EcjGuMlv3NSRpfmtou1HEW+su60f6MLb+H7zqbYdCGHfHjWs4tsweLtN
	mz5/xgmOIGQqocJUvSGWih+5DXaYVhDyIthugMVJETrFnSw+dy5eRN8YF4lZZ9w5TkDOwrIWNiw
	zNsQr+QpCPJlfHCnfmkKtrVNY/lwcHRTD4/sppBi2pR4=
X-Received: by 2002:a05:6a21:8213:b0:3c4:46ca:3348 with SMTP id adf61e73a8af0-3c92a99a481mr12197371637.73.1785815037647;
        Mon, 03 Aug 2026 20:43:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:8213:b0:3c4:46ca:3348 with SMTP id adf61e73a8af0-3c92a99a481mr12197352637.73.1785815037242;
        Mon, 03 Aug 2026 20:43:57 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm41030387eec.9.2026.08.03.20.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 20:43:56 -0700 (PDT)
Message-ID: <b7c5fef1-4d26-49da-bbcd-ba65020949b1@redhat.com>
Date: Tue, 4 Aug 2026 13:43:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/11] arm_mpam: propagate MSC access errors for MBWU
 counters
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-4-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-4-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: InG6QNUb5fyWMzv9mZgff-pX20VANmIIAiNSuf1lw2s_1785815038
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_204403_472535_3E45C28B 
X-CRM114-Status: GOOD (  10.73  )
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

On 8/1/26 3:03 AM, Andre Przywara wrote:
> Allow the mpam_msc_read_mbwu_l() function to return an error, and
> propagate errors from the lower level up. This also changes the users
> of this function.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 45 +++++++++++++++++++++++-----------
>   1 file changed, 31 insertions(+), 14 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


