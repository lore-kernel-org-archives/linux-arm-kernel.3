Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD091C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5OLeruoPybsSS8INmKDHZ/s9uZy6DjZH/QBW4ejIp4=; b=BuQrQ07nVfIsj92ahnocqtT5oi
	9HHyTQ12u2qnZvxvAMLjzo6QntAZxh+tCisDscELb5O4FVUT2tNqC0vsZ0SOQzIJYTeYaSLuOqXuF
	OuEnK8dHqtYtQX/5WgmF5Fn8HbEkKBbB+6awfXdkjnfZrqTJ1b2MJsPGVZvI3tp581Bwr+5BkpVRB
	6IBW6HXAHTKxcu1UZBjYdFr6PUbqcNWi0C9Ggonwg6CVBU5P7ZzMP66U2WwYiqp58YiyawQv0DIlP
	MhjXldqF2X/BHcsR/x+4sWVURTMKvsWburNgHJ+BF46LTZqzDCDR0/uo3JfV9ns9HqHoxFhPXp8Q1
	M24D2IUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6Bf-00000000xJd-3VsQ;
	Tue, 04 Aug 2026 03:51:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6Bc-00000000xJI-3knF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785815487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5OLeruoPybsSS8INmKDHZ/s9uZy6DjZH/QBW4ejIp4=;
	b=cM5nokPVGlP6GOy4OLdrH6o+KG7Dvoy0Oa9njb/U2ym4MiNSx097Os7YeeFu4Hag/9ZxWg
	XX3BQ05HzwW3cu+LBF+hiesvDdSDb29FQ6t8z9gjzES0IIaQ5ZQHOYG8vHoKBq9kPiYM63
	HukSWTkOldCmX/uANqp09VoiFvZrbvY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-Kq40gZHcNpuvGKR6g299aQ-1; Mon, 03 Aug 2026 23:51:25 -0400
X-MC-Unique: Kq40gZHcNpuvGKR6g299aQ-1
X-Mimecast-MFC-AGG-ID: Kq40gZHcNpuvGKR6g299aQ_1785815484
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so74367865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 20:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785815484; x=1786420284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5OLeruoPybsSS8INmKDHZ/s9uZy6DjZH/QBW4ejIp4=;
        b=WYm1n7PcoMNIjh09lHKdpwEd3SBzCcSeDT5DnonpKHTD1438rQZwr6Gb3snwuh6LFh
         WgzkyXDchuYUsNogB5dPLb/Oo0rlusDnwsg72fkgfy3fMZyCS+BqLXdPNf5HrK764r2T
         RpdZlpiDmD6xTkcXSjJfYdbPZUO5yX9WH5Cmf2YzLg0V0ZPDWGaky5Zf1iV3ewvqTAsf
         64m+Ptqp4mPOYvBRHEdvNHmNs+OAnvFBydkmJJOLN4KyZeUh6PggPLJ+wLJ5QDdAZRKU
         x61irFE3mT/n2uC9LOHBTQDviZPnXTiVEHw1YE7ivIHWunW9VOF39IzqYo/I9b+aYFNn
         RApg==
X-Forwarded-Encrypted: i=1; AHgh+RpVtHWRfBF+O8OMZhlSzLmf55rB4WlsWIkgK0Q3DJUEkalpRdOn7OWASt61cchNpTiuMJMnFhMbu9f/ESOgazOw@lists.infradead.org
X-Gm-Message-State: AOJu0YwL2DlPsFunkTWZ+gZsSUiLyTYDgmHDu46/hj5osXImIYefAy99
	IBBO8rxDYtx0BJ0C2F0u0uCGZbhShvEEx/tNon5w0TrDB9d2V8M8SQq4zmrcmB4ttMQ5W54oH2r
	UO3U+coxpoqSXfTN2gDKCpzphTDRhy4gs0/gy+Gt2AJ7pIio6dSuqGnXPGH88IfmK16VW58sNy5
	qz
X-Gm-Gg: AR+sD10mz4shoklkNeWeuKTsI+6JSLZ0P25ApsTL7h3G23xl0LDqMJuUFc+tsPjMViB
	9LXTuM5gJG1WOPxzu96jr2yQFPZhj4cVUOPjcBZdFptsMgOc60HqtUmUgxOzzhS1ylsqYLh03Y5
	1VhSncuXv8DdeTRi75bj7H8oKh86DrsOsnIaNlye0FQ8mlV7eNIRYUWAy3qQnQkXOLJIQsvmk3c
	1gCFCx7G3TPgpfzsnUsqjwxLfWrvap8MnVIkQpwaVEGvTI0k/kZKo5QTaHcPqlP0wNMDuZBrzxx
	em5ens2QcWBhtJcuGJkhxk7UZlMF+yjwOoFOPFQGhH2ijUjEBaigby6ibeSt0gG2gSO/gx8ptYn
	+ARe93Rh6vnZCGoMWdmM9U//aOsKVXb0Jz0j09VH+65I=
X-Received: by 2002:a17:903:19c7:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2d052212c61mr131820105ad.14.1785815484467;
        Mon, 03 Aug 2026 20:51:24 -0700 (PDT)
X-Received: by 2002:a17:903:19c7:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2d052212c61mr131819965ad.14.1785815484051;
        Mon, 03 Aug 2026 20:51:24 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19b82sm46004835ad.6.2026.08.03.20.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 20:51:23 -0700 (PDT)
Message-ID: <bfe951ad-9c41-419b-a042-79526dae028d@redhat.com>
Date: Tue, 4 Aug 2026 13:51:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/11] arm_mpam: propagate MSC access errors for
 __ris_msmon_read()
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
 <20260731170324.2927758-6-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-6-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EFws5WASK-u4iBORb3TTYyI0cxuV8K7y0yYTeHEYUx4_1785815484
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_205129_006877_4EB0F20D 
X-CRM114-Status: GOOD (  12.16  )
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
> Allow the function for RIS accesses to return an error, and propagate
> read and write errors from the lower level up.
> This function is a bit special, since it can be called via an SMP
> helper, so the prototype must stay as void. So propagate any errors
> using the "err" field in the struct passed in as the sole argument to
> that function.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 36 +++++++++++++++++++++++++---------
>   1 file changed, 27 insertions(+), 9 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


