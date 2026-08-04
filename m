Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3924C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6ueaiU7fBi7DY5TUPY/0MyqJcmKDSVc4RP0ImOk7N0=; b=CL20uUBS47cjA3gpfe74gF3Jti
	yuh0mkd4YKSfTePA78DnA54X1vH4n2Xseb7aG+QduN5rpoSIsseBa12OakOY3uc+CEDLhPzuzy+rw
	4POGYeyDW1tDAboUoizlyBfdRCpJ+fPJgyjQ3sN8BL/CfpCIkflrPwqd85odckmXR241JH+PKmZKy
	9ZCuGVZRZqJyq/Wgy48GhnyCHfrFjxGWdYJIk6pRpKYeMLR2DJUxydA3CcXGIZzSwEmp3op1iKaYv
	mdx34VVyfAfn2qRW/5RLzA0yelMjk/yn83aXoHnbKUhc6fiwmCMvzl9mQ/+dtfvZZPHtwWTXf225a
	lT/oYBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6HI-00000000xjr-2s8c;
	Tue, 04 Aug 2026 03:57:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6HG-00000000xj2-03Ij
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785815837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6ueaiU7fBi7DY5TUPY/0MyqJcmKDSVc4RP0ImOk7N0=;
	b=Zz/QtQHn62yb5K5saGbTsNoltWv37w2BBJ0PY1jUYNEc79m9BRS/K67LiK3E8+2iIhFUv6
	FCdvfiGJ4jLbDCz812A6/AaszSO+73lTvJpHnA3CqSyYmKvm9r9gF7yCd/mpuXIX3UTy6J
	Jj60BturFYIOTfZImlDPbe6D8d4cLjE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-a6B5Uy0YOPSPB8sCO0s9jQ-1; Mon, 03 Aug 2026 23:57:10 -0400
X-MC-Unique: a6B5Uy0YOPSPB8sCO0s9jQ-1
X-Mimecast-MFC-AGG-ID: a6B5Uy0YOPSPB8sCO0s9jQ_1785815830
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so51366135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 20:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785815829; x=1786420629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6ueaiU7fBi7DY5TUPY/0MyqJcmKDSVc4RP0ImOk7N0=;
        b=CmCTqSLAlk40gjMoXlARWF1c/xiEp8jKylkOwt2GwzQrUmwO899wUG2QZDgW8UjjK2
         CAtf6pW46xfEEDQGg28FMbYQsHEnfkI6KY2MW69U8TleGYt04dDIktXSKlyqyyMeGtkv
         xRDCn+V/O0HOjerZsqcwaMEXVgrOjInrFQVB64ULxsPpHaW0eeL+V/HOdRmJYHTYwwLZ
         BPiWOHCA55lFDKVNWcKpC/p53m5QbKQ2FfYKrmO4YIIh0ixGnaG/TetCacv4QsSdWl0i
         vHXvFJpq/Knzvidp23jHSzaO/orv206RdTE2VrRY9j/Jefo0H15mD1CIRPVcYXEnDBbv
         a26A==
X-Forwarded-Encrypted: i=1; AHgh+RpVJVV+QGANCUQHL/pnZEuFirsgw3YgwT3G4Rw5A2Oa5YTzTIdXBPq/heNK8ND0cwXRWqIrDYdOG2NJ5i5A3M6a@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0azYkjHXftDhR+tNOsDJJdLSp9ceLJtuB2JiJKQ27C+bM+NFV
	rITfzybTSd9Z3f+bLi/Bnpy6lZhVcXiT0z2vLxwhiQD8demWw2if57uiwE6ZY5SFQKHdb/v0cAm
	+6rYJ/NQeNp4JSTGbgUelDOQims7rqvdETSKaoeZOFH45vEeNV0QL2TcHqgXug6FokgjM7zMCQd
	kg
X-Gm-Gg: AR+sD11CtkXHhzoSBks7VnjwCpYRnkLwkCJ+jhrnyr864Y9zv17wZgnlJj3FEmnNhLD
	adjR6W5VoOtJe0LcHWeGIkhRf+F7uOd0qx/dEAoQSDp+rC+A447BnaIfNVNv8E1wlUWF9UIB50l
	Vwbzs47dHflIuScFTjYNKAd+kGC70/v/YzOzxTBOGPSt09Ve/kvsLkP4Nawzse2ej5djsJlzjUc
	z6teHN67ZuNmVz/sR56Npwna0YKVo2QqCVSID/IYX4QWzwO+LwTkrWcCDR/euum4LSzeKYCHX/9
	MxGgzXkkO9GDrBdUKk0F4CGZNFea5T4F1J5yCCYGJuBWf78Hsp4qovUo6GOlooKK52PUDsBrKhE
	7xFxyB2VvnB2YzgFPtz2IDmnNAvQmbWzzLbg1Dw7+yZQ=
X-Received: by 2002:a17:903:3c27:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d05219f8fcmr129612825ad.5.1785815829627;
        Mon, 03 Aug 2026 20:57:09 -0700 (PDT)
X-Received: by 2002:a17:903:3c27:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d05219f8fcmr129612575ad.5.1785815829239;
        Mon, 03 Aug 2026 20:57:09 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb7c3sm46155275ad.54.2026.08.03.20.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 20:57:08 -0700 (PDT)
Message-ID: <3326363d-45e6-405e-ba22-4b7d2c9832c0@redhat.com>
Date: Tue, 4 Aug 2026 13:56:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] arm_mpam: propagate MSC access errors for
 mpam_reprogram_ris_partid()
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
 <20260731170324.2927758-8-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-8-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iqJo0eB1EXMchl2FdRc7JpC0N63qIpYF3DgWfl469cg_1785815830
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_205718_129127_7D714F9C 
X-CRM114-Status: GOOD (  10.64  )
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
> Allow the mpam_reprogram_ris_partid() function check for and return
> errors, and propagate MSC read and write errors from the lower level up.
> This also covers the callers of this function: mpam_reset_ris() and
> apply_config().
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 136 ++++++++++++++++++++++-----------
>   1 file changed, 93 insertions(+), 43 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


