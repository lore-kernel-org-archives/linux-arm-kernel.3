Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270E0CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 22:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9Vrh4hLm6Gal4VfKPd/BvcKzpt3wbNXvBBiFNbMLpY=; b=mz1QYnU+QEqtDaavjBG8kwQ9UA
	lLwhqugFY5r4YkulYghL+f08lXtRrp7pPFUhWlOld2eTIxNGjycL+BIOSpMRCup+ApCiC8iLuJgcH
	W8TSeSWWgvQHu19FK0UZ7QPA+5CxvnOcWZ5YlFew20YpnztNqDxDtv1CuwRQTsg9/oZUl5p8swyD2
	6KkfCpH+r6FHIpIc6KdZo1DmW+uObfZ9AEuvDdi9ug+RI+smeP2mnokpGnB3febITQ4fWZ9UzYwMF
	g00ql9MxdwBs0WhaOAynk4QU+xwG8vS24RW9swBVZ4Kyyv8DfAPMA1KSzgoVs8oL3/h2syXx+OADk
	ruvFTV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDly-00000004R9A-1A1X;
	Sun, 09 Nov 2025 22:20:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDlv-00000004R8l-1Z1R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 22:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762726830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9Vrh4hLm6Gal4VfKPd/BvcKzpt3wbNXvBBiFNbMLpY=;
	b=QjfgvLd672QWUWqDpV2bHwa6+jHSUIYZ1Zt2AWp/yEMdHXFrOY9EuBXpwH9J0uFEcEfNJQ
	3cxiGnvkSxwFDJW7IFafVyQX5cgKpUB91q7NsX5osi/SuQnQdZp0AEM1PBeQSlVCh9grPL
	7P2Tmya0kmp+3aUr5qYJmfJ+aezB3gI=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Z7iHpMw9N2yagLs7wd27wA-1; Sun, 09 Nov 2025 17:20:28 -0500
X-MC-Unique: Z7iHpMw9N2yagLs7wd27wA-1
X-Mimecast-MFC-AGG-ID: Z7iHpMw9N2yagLs7wd27wA_1762726828
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce25bea3eso2629448a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762726827; x=1763331627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9Vrh4hLm6Gal4VfKPd/BvcKzpt3wbNXvBBiFNbMLpY=;
        b=uvwFcx8RPkjYXO7f9UUDSSv5h7cMFHTyJcepTmEWxsydPtDZQSeyNoiXAzBUPaZDzh
         8IzEmmPktLm4uuu6/zHDm21qZHTZd2djNE6U9nE7Sohjw+GsjfEWTtOv/b2EcrdTPKvA
         knfkvv6bPM42mx6VyCQjyY+dBcPiaPfoqXUz8kkPSw2Nej+KSR9+yeQR+YInsLf0FdrR
         ogngMbp9Qt1i0+Bs+s+N0ab2dcsA/NT1YewDAHEnPTbHSyIm5bR0AzAv6gXIX8CIvMmy
         gSl202w+FzROBEJVerS9m5F++zbLTtgUshU3z7OovXbsJ47hf7nj/ohqeCx6D8ogP+sr
         HDpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmyV30W712qnja8yG+/pFnG+CZ5VN90cDU+CkIATUG8Lc05eHEje9AHjRpw/0hcmOBVEdPRFlRS4vaJGpa2Bh/@lists.infradead.org
X-Gm-Message-State: AOJu0YzoKg4g3953E/f/rQoD9sCBDdGEWygw+7b5YBzs5ObobI5ARNRi
	YT96l3vThZ+lBGiFvE2dOKWaqHwuaudB+OHoCGems7z0OLBC2a2GUGVlZyMVtTKyj4w6W4OBixl
	pbHOer4QuFbORFl6330FH1ix8TG8UyXIj9tCYAg18i5jAuJ0+ijsQMV1xEuz1eu4tEndwtBL392
	JC
X-Gm-Gg: ASbGncuwa7uL3tGt0fksIKOXYe4IsgUFIXOJ58oqnoPwcE11QzbU4WZ8OflZXh4Aban
	YSXQF+/rwIykVCWyCdP0myjioNDj8+xamxzGReP3a5AMFIlTlkWz5unu/ERpE6Wpry2rJH8bBo7
	dW1+gc7DxPIzNSw2WD74So5UNI2Ps6SQCOaLWnuUtYKpSnqibzFjjZh5DSur8rAS6Phjc8dK3xq
	hNZ9kpU8jh+4y/tkU7x0Pnr1Sgk6MA3b/s0mVvlUOUD//F7WDXuF4QCB8SI+ytlgU8EoAl312cy
	QyjKWemqjzhodOpvWINQvpb+FujmGXZ1jbVwEreaz+31x4EpyuSJAETwT+3vGSElazAf7hMSkz6
	M0SVb0mn7Ah9Gl/FLGiNNYYX6YeZ5vlBj3J5eMUk=
X-Received: by 2002:a17:902:e5cb:b0:295:b7a3:30e6 with SMTP id d9443c01a7336-297e562871cmr79572325ad.18.1762726827615;
        Sun, 09 Nov 2025 14:20:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwTISJ2La5PhmrXo8AgSy/Yt85FoIYmCW5lG5+yT/l4xv4t8A7YS357AfTy+jnJLHP7TlYiQ==
X-Received: by 2002:a17:902:e5cb:b0:295:b7a3:30e6 with SMTP id d9443c01a7336-297e562871cmr79571975ad.18.1762726827220;
        Sun, 09 Nov 2025 14:20:27 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm121886565ad.23.2025.11.09.14.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 14:20:25 -0800 (PST)
Message-ID: <0d3b5565-4f38-4af5-80b6-66d230b68edc@redhat.com>
Date: Mon, 10 Nov 2025 08:20:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/33] arm_mpam: Use a static key to indicate when mpam is
 enabled
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-23-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-23-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: alH6sIBfK7kVotPsYT6B5PWZLfkluyZ6ivBtCO68Kn4_1762726828
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_142031_521688_CA4C1149 
X-CRM114-Status: GOOD (  13.72  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Once all the MSC have been probed, the system wide usable number of
> PARTID is known and the configuration arrays can be allocated.
> 
> After this point, checking all the MSC have been probed is pointless,
> and the cpuhp callbacks should restore the configuration, instead of
> just resetting the MSC.
> 
> Add a static key to enable this behaviour. This will also allow MPAM
> to be disabled in response to an error, and the architecture code to
> enable/disable the context switch of the MPAM system registers.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c  | 12 ++++++++++++
>   drivers/resctrl/mpam_internal.h |  8 ++++++++
>   2 files changed, 20 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


