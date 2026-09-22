Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61170C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gc3045Dwa4vjQJ/8MBEFbFz/5QxFhFaTid5Jh1bQ0hc=; b=qJfibvTMnkrXiF5sW4W1ympNv0
	a1+8EHg468rd5ink/Gp3dgE9Zdge4SBS8vi6DTqFih0YBAr7m9dV8enVgWmvhnRbxHZHplzxIwoH1
	Cerpg1B2cYWOGyLgbTsLbj1e1WyXkpbKNE2CE6V8Ce8eDaOdKZUo8+NCV3ATLvdiDG0e5otXmzQXT
	NqAUMSRH49dpmX0rwPSEro9ezf85cvtDgWHTsbRFB2GK/VaRBg3I5SPs/ows0oISrElT6BETBw/5h
	aOr0DBOcyioZ+HrlUhJ2oQMd6Fw7Ue7VQpf78DQiq9I2A4eQyyyfntwQDStiQ2nJt/aCBPScorwcA
	pnobYE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tGg-00000004GWa-3Kr2;
	Tue, 22 Sep 2026 05:42:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tGe-00000004GVo-08Qs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gc3045Dwa4vjQJ/8MBEFbFz/5QxFhFaTid5Jh1bQ0hc=;
	b=R6J398xPkB8USNra87LTzPqw3dtGdqINY4r5rEvl1446P3szjw9dz3VqUAOSuvDQ971c79
	dZbp+vB+oxVu60WeyNUAbzGn+ONntQ6B5Vp1Hq/nlyrgsj8DRWO/c66hTl7f2qrHdYs13y
	ZC/KprgYTE9LdPa/4QfRn+99QMYMfWg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-5lQIlfZyMC-pIV8FtUNeig-1; Tue, 22 Sep 2026 01:42:09 -0400
X-MC-Unique: 5lQIlfZyMC-pIV8FtUNeig-1
X-Mimecast-MFC-AGG-ID: 5lQIlfZyMC-pIV8FtUNeig_1790055728
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso6500384a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055728; x=1790660528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gc3045Dwa4vjQJ/8MBEFbFz/5QxFhFaTid5Jh1bQ0hc=;
        b=IryJaa+SUA7eWwfznwT5zHU37pmhlLZbvPIR9azqYbDDrKaAWSeL/qrSri3APoXnGj
         mooKWxtrX5wJ3NC0JY3ulZ2sgRJ6Rgs2q8Ti8aHn92czyDZA+7nyYDhHFJGi100nArXH
         l+6pKLaBDbmf0Ah129gBYMfwEFgA0JOudXqrFTFNnF8sjMt4Ukl4RLLDS5KKwROJuFY6
         T2SM/6Pk7M0iFbPk7yE0O3iMEMWrkHyfZkI2qunvHilFo75cX2B8ttI2quhqjPK3njW8
         NalZkbQKGSpqReoOXZ7zqd+tVa8DFRo11+r9qwOZ5LJ3+lQfs4uA9I+RvASdeGej8YCW
         S/KQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNbhjOy62+dr5LRsmVYBI/TRvu+ZTNNUS+OXNxYNFAQ556hJZKnqwnr5YQAyamDSux4vFZIWvtXUUMgdEL9VBh@lists.infradead.org
X-Gm-Message-State: AFuF++lrtvJaSmzTf0piAMUOEvkYS5kuEkGljZ5LONhQMNTil9fURbB+
	7H2OmgCQsqeePgYZzSIA+Rb/zp7n/hcoLjEfqqi8e2OSEuULeouvirbl+9hTqCWP4vwL7kslI8O
	pWaIOJICS+J/4foIZntAVmhf/phTjJ+0vrFz+lXXr/lS/D0xKs+RD3S1/1y6wayMe8fwBUoEfsp
	y6
X-Gm-Gg: AYBFou1On/hUuHzjoW9IQ+8m5wXy1gMoTNcrKOKZ7WS5umVmXZKx65IeDk7RNWZKACI
	HVKQii9MAScaS76cIuRMyMT7L9u9mRHmXe4xGyOq1trt9DxIDPsu0kFacq9QzaAde5Ih1nWsSWY
	7+ZCiGS3UZwWFUkSVL2VKStttpGFO2R7J+Qy3BkUJLN985Dfflh6IfAiS+k18DQSPlMy/w1WV6n
	HjdQwvDheNSLyMeJUbfl3VfU3faSkefZVIg+R+/erckWyQCNX1rGu7s6H2MGth7kLq87VpOjwCf
	jX7beointJRCWrEmCo/UZCBD0eITZYM7Ye9pGkMF70lG4MD+NmUfsyMRvTDK3PCnvKn3OMqYlpI
	kQxMJxWknxbMyyl/tDYyKV7jDaBSb2lrb7CS1oKVoKw==
X-Received: by 2002:a17:90b:1a88:b0:39e:6b01:f93c with SMTP id 98e67ed59e1d1-3a07310e545mr68737a91.13.1790055728190;
        Mon, 21 Sep 2026 22:42:08 -0700 (PDT)
X-Received: by 2002:a17:90b:1a88:b0:39e:6b01:f93c with SMTP id 98e67ed59e1d1-3a07310e545mr68726a91.13.1790055727738;
        Mon, 21 Sep 2026 22:42:07 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0715e9d5esm628384a91.17.2026.09.21.22.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:42:07 -0700 (PDT)
Message-ID: <a1084c66-4e4f-408a-ae3a-794dce005a4b@redhat.com>
Date: Tue, 22 Sep 2026 15:42:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] arm_mpam: Restore the error interrupt enable
 from mpam_cpu_online()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-3-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-3-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oZTI87ivClLajkH0GsKDZwy05JFCkwgrvjUjkc5UPqk_1790055728
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224212_152550_925F5624 
X-CRM114-Status: GOOD (  13.42  )
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

On 9/18/26 12:56 AM, Ben Horgan wrote:
> When all the associated CPUs to an MSC are offline, possibly caused by
> PSCI_CPU_OFF, the power supply to the MSC can be cut off and all the
> registers that are unknown out of reset, including MPAMF_ECR.INTEN, are
> lost. Afterwards, we need to explicitly set MPAMF_ECR.INTEN when the first
> associated CPU becomes online and the power supply to the MSC is recovered.
> 
> Restore MPAMF_ECR.INTEN in mpam_cpu_online() when the first associated CPU
> of the MSC becomes online.
> 
> Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
> Changes since v1:
> Update the commit message (Gavin)
> ---
>   drivers/resctrl/mpam_devices.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


