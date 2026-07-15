Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45922C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsB8hfJu+3yCVVaQHQQ9mlLJPE2iEUCcCAm8+DLyki8=; b=l1//NfsSUeUrbUi3a54oeGqksl
	UqLtS2yV1dh+4JS/pEDA1svX+c1xrhL81wZskoJzKmbnpLt4hUhSQaQxKrn0yWtglkm1zmFc8tp/i
	k87AXS85oJyqYPAHyikoH00hdGXoj2wHpUSZr8n/QxnCu6SbRx1HQOu40A4T3o2JCbCGz3NOgtveJ
	H03tCI2vNnLVy0ZddoD0TqNijn9V7jU2ficmY3kqjTHmFsusjbXXLL9AWqhak0pAAv46Iv8NZvNXk
	dwV9P2+3g9cIhfVeBtsuwsKrYWFHhTIejLi0jPnUM/ReZAsNnRgLcSKjA5YNY5VFxVu9/QTVYX+WK
	0VcB/g9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwlq-0000000ERMW-3UmA;
	Wed, 15 Jul 2026 10:23:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwlo-0000000ERLg-37K8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784110995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsB8hfJu+3yCVVaQHQQ9mlLJPE2iEUCcCAm8+DLyki8=;
	b=W/0udtVomUrP5uoLRnQkxjShpu+Z2JJr1gSd/5NNQVe7XoZ9myFI2VtGnBPcqyPvscKou8
	+L9phVsUKO+ybioZR/f5N1DJivp+jc6PUfc/Fi75jVc6rKerlckETVGgdNp5NszPGEpRM6
	KrZjtQnNes5+116S23D5dY1fBKeSRMY=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-_DIaoL9JMwKTH1o3LQGFkw-1; Wed, 15 Jul 2026 06:23:14 -0400
X-MC-Unique: _DIaoL9JMwKTH1o3LQGFkw-1
X-Mimecast-MFC-AGG-ID: _DIaoL9JMwKTH1o3LQGFkw_1784110993
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8483e038efeso2316983b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 03:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110993; x=1784715793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zsB8hfJu+3yCVVaQHQQ9mlLJPE2iEUCcCAm8+DLyki8=;
        b=ZdBF1jK5IiXHPxuJj6g1OgbymA7M8FOsD7ZYEeqMJd+gqCrCivM/LMdye2WjESw9ug
         DFJb9ozu/4v5sKa6477UxloTNORivcj4ZxsWzJXt2fiRK84bFDdY5QZLAR3JDkh0lNIj
         MFdLZzpGCwjPgw2UIZGQBeGKC2uvsmynF14i0vOW5LvsHfa3MA7E67XN81Lzbf+O+R0N
         lZ70hnIOmismXucAB1G9k6tvpe2mLYRfUqGNnta202RgbpU3ZGcO4qJ9U4q46XmdyluO
         6J5sF/Q6OSN3w9md9wtNYfNZU5qayt7g96TNk61LGTHv/aXWhcdET/2H3k6YY3rljt2e
         zo1g==
X-Forwarded-Encrypted: i=1; AHgh+RqMqNmFLlxTQz++Ugs1reH+70hjUlPUpe8zE+SCdcBxrsuk0UpMMVqKKlWeRhcl7Yd+by9jRr/6nVymKMyuXO81@lists.infradead.org
X-Gm-Message-State: AOJu0YxsXb2AO0KnmQLOUR1M708nT1LTqDEIIx7OGCHVXdXR179883Zu
	oHcp2OgS0nmC4vnsMMf/paokAXHX7rgH4Z5KWazeH5i08KVKZ3WtDmO686xBLXzwAweNfuh0Wq1
	emyNw/W0eAaoof/nOMDBVOiJZIMuEHZRrpp242ECMN/kWtrwnQZ1BAzoSB2r123szO7g3Sg4icY
	+x
X-Gm-Gg: AfdE7ckIymTTkutEdS7Bzjz6kPnnK0rkt0eRM3zTskV5zHqXlDTfrgXeOPWfhqHYJqu
	ZxUyKM0lDBICUBRlSlOWLhB2GStL/eohzacC+4W3NbUBYapZKdGGTsdCufvV9PL/DTyX5PsJN0Q
	sWyijyUPsnZK9Z2mitjbf+0TZGRpcpacZDD6l7O2Of2z2+WU2qbnCSm+0u6IeRy20lsV9zsXOO9
	R0w1eifiY/8Z0Y3DAoMcZQzABurygLyu3tNMAZR3d3uvC5QPuHZN4MdNVL3M/tTr/otey3molaq
	mR1NY25NBgj5qH/evzXyVLFoj8zrZIyFv8Oz14LNYpSiT/mMw6Tjmkf5jXRVuh4LYMpK9FFoSyH
	rgJfaIMlCvCN2oPme6LFloDgk/TJ15l603XulAD54gEjnRwB8LCApVg==
X-Received: by 2002:a05:6a00:c8e:b0:848:7fea:93aa with SMTP id d2e1a72fcca58-84889602d2cmr14721203b3a.21.1784110993500;
        Wed, 15 Jul 2026 03:23:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8e:b0:848:7fea:93aa with SMTP id d2e1a72fcca58-84889602d2cmr14721152b3a.21.1784110992993;
        Wed, 15 Jul 2026 03:23:12 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f2778acsm2931021b3a.20.2026.07.15.03.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:23:12 -0700 (PDT)
Message-ID: <efafdbd8-70c8-42f5-9dc1-8723723b3512@redhat.com>
Date: Wed, 15 Jul 2026 20:22:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm_mpam: resctrl: Add resctrl_arch_config_cntr()
 for ABMC use
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jic23@kernel.org,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org, leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
 usama.arif@linux.dev, kernel-team@meta.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260707162440.12132-1-ben.horgan@arm.com>
 <20260707162440.12132-4-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260707162440.12132-4-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PpsEg-KVy7Iwa_Xm_bg0Vo9iUAuf6nWqdClaJLWxmHw_1784110993
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_032316_858739_763563B3 
X-CRM114-Status: GOOD (  12.56  )
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

On 7/8/26 2:24 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> ABMC, mbm_event mode, has a helper resctrl_arch_config_cntr() for changing
> the mapping between 'cntr_id' and a CLOSID/RMID pair.
> 
> Add the helper.
> 
> For MPAM this is done by updating the mon->mbwu_idx_to_mon[] array, and as
> usual CDP means it needs doing in three different ways.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since new rfc:
> Mention mbm_event mode in commit message
> 
> Changes since v3:
> Warning bound (Sashiko)
> 
> Changes since v4:
> resctrl_arch_reset_rmid() -> reset_arch_reset_cntr()
> ---
>   drivers/resctrl/mpam_resctrl.c | 48 +++++++++++++++++++++++++++++-----
>   1 file changed, 42 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


