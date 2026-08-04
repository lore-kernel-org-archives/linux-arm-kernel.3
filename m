Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508A0C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwQro0XBY36lk0ceBUE0Egz81FQANnimgQHnfgGBQH4=; b=A5E9Fplxe2TVeqQFp9zwBoofS+
	q6b8LOc0fXwlzz9YN4lSoJhpaCcKhDYMZOVfe0rpPJ2m7U6djySznFuuEN6EwOgNpzpjnaEZ1AwMj
	mmaM9VKJc5/QXOVY3ImZRQme2Cp9QQ4ugxqQKshNeHOSAMgfPPhi3zS3TpfJxL1n74ueOKNKyfK9s
	wneU9vTXMFzG1c9p6V+Zxb/FxqY19q1ay9wvV5OwI7nZ5p+wAKVKM6ZPh6YGaLItXzgiXdF5bLLcL
	QdXNUhdzN3GABcOeFgftjCnjJqsAIi45nM5HYUb4ctDSxeba6ipZ1bdh9ZKu9Ty2HZArOBGDUyPCZ
	LATzJU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr69M-00000000xBy-27PG;
	Tue, 04 Aug 2026 03:49:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr69J-00000000xBW-2pa1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785815344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwQro0XBY36lk0ceBUE0Egz81FQANnimgQHnfgGBQH4=;
	b=O6VCvshUliZ9m28u8bM1OoV4r1KxoNw4i1qEAgiJz1jqpRFCvzVwkBE+ISwnCoCEM4VOqN
	/gUMOc2GelLrEpEQB0eLhwHiSgibJQCon9FR5RJtfGTldX9SQkRBq9vIfgyE7CL9CqSNp4
	S4p1+uiXnLzj5bZjnLoG0M0MMO3kTYM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-dYIoJBzXM6SC3v4hKK6zSw-1; Mon, 03 Aug 2026 23:49:03 -0400
X-MC-Unique: dYIoJBzXM6SC3v4hKK6zSw-1
X-Mimecast-MFC-AGG-ID: dYIoJBzXM6SC3v4hKK6zSw_1785815342
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso5755595a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 20:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785815342; x=1786420142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwQro0XBY36lk0ceBUE0Egz81FQANnimgQHnfgGBQH4=;
        b=G3Vc/RohYXu4I+PQa1sXCUqxiEubeoyI2v91ER2wu16se4JfeWExZZY4jKGc935ffe
         g3OM5FgMTkLi7zONPqrPrcdazN06eyAkjXmoKA/5uhnA8W9JJOLRnXXhardjXnGcMb5M
         34DQRAb0mz1R4r9paTb4cbjpdqnP0T0/WD+EMJwnSG1qT5DoVKpELd/9oc6GL6EIyeOX
         /Kh16StZVZDlpJnMsfwOs7H/3lwWK9BLKf9NYl6WMejEwb9cvG6A72Qpa6qFmzj2eBNn
         5CDNizq6hipYjK2ZYT1qXhQkvAeoglejhNQ0MRbSnK8SMh5iPRN6+tsirzKAFV2AS+YF
         ALRg==
X-Forwarded-Encrypted: i=1; AHgh+RomymvjsGR1UmI2cPs9FaB4yPWxYGAlbnHDs/MKjDUUewJGjmqK51Yf1EY7m5xewzt8CDSf2wx8x6ykog63Nko7@lists.infradead.org
X-Gm-Message-State: AOJu0YyeVl5mmA/ZHXjtezwGl2jJyO9hSF+k2nYsOPwB4es/cQ1lHtSz
	3E8S7ogtk/cDDuhvgOd1tKMvkiaB+0plSO8to1K83Fl8b+AQ5CG/iqRA9rT4ePPhmq95vao87zt
	eEIb610FroETMn4Yvpkyz8tBzJukOErkbVyXP4QMHe3a1qPQjrOvGaVDHT1R0jdMXtsVK0Ksvhx
	mw
X-Gm-Gg: AR+sD12HiNP+2YUFDX/BFZjr7EbmFHjv5lt1d1YZ4SEBI3hY3MdYKzPcHVVgo4UL4T5
	VCTNoYJbK/IXqsKJ6iQiR/NQtgdfXMMn5BFG54EAobFzu3cTlEQl/qXEcweLMZ2fPxlfAzmnDyl
	WypCMMpmChE60Mcdpvs4GCbtEHa0OQ3OUsBOb17xJ0fIPqEshXdhCiKaPWY0Cbxg3p+I3Llp+si
	O3sD2TmloNRcLjI7agA4U3CCoOYfySGsHYagvYws3mfRXvpCWUpraU4/DYayKUIFhoW2xlMBFux
	0/4A/KaNI21QDVhPNeAN+hYszFBu7ZJh8zMMHU26inRqOYSgPXlvvvjHXzXTATyuqwMEp4Tme1K
	QECMbjQe4RV91x+GhwRLGaP/+dChWK+UImf93dXZHI3k=
X-Received: by 2002:a05:6a21:7a4c:b0:3c3:834e:89bc with SMTP id adf61e73a8af0-3c92a864c8emr12489419637.50.1785815341987;
        Mon, 03 Aug 2026 20:49:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a4c:b0:3c3:834e:89bc with SMTP id adf61e73a8af0-3c92a864c8emr12489378637.50.1785815341553;
        Mon, 03 Aug 2026 20:49:01 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f197sm45501799eec.6.2026.08.03.20.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 20:49:00 -0700 (PDT)
Message-ID: <9feb5366-1955-411e-8a8c-278e201cd2eb@redhat.com>
Date: Tue, 4 Aug 2026 13:48:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/11] arm_mpam: propagate MSC access errors for msmon
 helpers
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
 <20260731170324.2927758-5-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-5-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C4mOJ72W5gSqr9gh1ElbWBfT3dxhlHUdWZMKwcfWx3Y_1785815342
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_204905_792090_0766F7F1 
X-CRM114-Status: GOOD (  10.03  )
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
> Allow the helper functions for msmon accesses to return an error, and
> propagate read and write errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 72 ++++++++++++++++++++++------------
>   1 file changed, 47 insertions(+), 25 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


