Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962AAC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/V6yK4AYSarYyuFwL0AOAwiP4ndwZDNRXbkjVWDUGhE=; b=HcJaxHkcQrnDqcm70qCqWkg6Rr
	ocEBqW5ZZbmtTS1ODDvvTY+hp/urFAB2kV2vBMSa3V4QN4NGo21hWX/VOgGyxCyFBQsF1O39Bbd5L
	FbD6FDmWRm/VfznSuW+fdtsKwlfDYPi/tDT1Sx/XZ/NamYmiURuqYIWVs985RVB3OgnX+BPD3Opu5
	B8tJ7xqdhFFuhpe+4bLRJKBdjJr/GSmQwFWBnPToBDPc5h4MczMbuoTDV2mibEDGCOw1vley1nsem
	LuZdPQoIei8GjogZX4gwPeQclmqgvVM41UoOmKSwM7m/kQ/nEBTXnafP1vXpORGKTQFEU44HV3iPx
	2qPn2f6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tK8-00000004HaS-0X1X;
	Tue, 22 Sep 2026 05:45:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tK5-00000004HZp-2sGK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/V6yK4AYSarYyuFwL0AOAwiP4ndwZDNRXbkjVWDUGhE=;
	b=hzvP3dydh8tp7uCzbF1tmKH8D8QV/n7uObDvNoeuLUm/kMyMpBCFUG2i40fgj5Ns6cMyE5
	xG6ZTD/q+k9ZooRsE/CEf5lmlCpBfamUEboS1w1jU0L9rDMDVPKvi9aaFZUTjqZ9UhKy8H
	HXtUReTiW1LCBsnhdPp8sBb1MtUewDA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-28XRjPZfPYCfMQ9ReYPldA-1; Tue, 22 Sep 2026 01:45:43 -0400
X-MC-Unique: 28XRjPZfPYCfMQ9ReYPldA-1
X-Mimecast-MFC-AGG-ID: 28XRjPZfPYCfMQ9ReYPldA_1790055942
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso5100552a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055942; x=1790660742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/V6yK4AYSarYyuFwL0AOAwiP4ndwZDNRXbkjVWDUGhE=;
        b=rg5WWHgS1c65RykL4XQQYGeP5bYXfElRAHmlxAU8qrr+xKtwqZb1tHLC2T/aixk0uX
         BP3WpFjZ2UWkLIYcz/xZdWFXkrumzwUbtPxwCSMc/P6WyQQUhxqes/vygUrrlNRm9Oc8
         o1bi+W+Jxj+XhyYZmtZ/QOAKctg8WWhtpYh1vXp+dYNhIvnWDjYohpdcEidbISISJn9L
         rig/ZCydRyMnGNofbpPna3BweiHHTIgzBffPX5315V69oodZKZcGCEsh8jhm6sUI7qeg
         9/gPmQiZ6nRzQ4nbabmjGcs0Z8rJEBnT3PCRQbYuSfnec0ugvXV/xqCxH9wLlVwZTkwf
         YyKg==
X-Forwarded-Encrypted: i=1; AKwUvByp43igbF8n1P/mZ/ratuy4L3rmqGUgWy8dCjS7SdYXlfavvRipDAjemB5NiKROoNB8qMeMHY3zsMx0/N1kAWpQ@lists.infradead.org
X-Gm-Message-State: AFuF++mhIYY7oBFHy+fVImQ8GwtWYELLHUx1LgdrYERT1m802wq/eF98
	rP5P7VAez0r/aPk0+iFOxDOZ0m8pyrN2zwq7HCW/2C+ryfG4UYZ/kc08LryPGoFgtJl43trBiUG
	JRhM3ZeowTT/g2LsDyePbDjYp4JW2Xd0f6i5AUQrYmPcZiOHXe4foqnQ/n3ZuUkoMpY3L3G1xUa
	G1
X-Gm-Gg: AYBFou1x41qRYaUxS6uP5vUiBHlfn+Wz1zRQAEU31ISiMt11P6CSJGQ/IsYg6lzRAqP
	5ER76wkZ5CsjNX73bAWMbDf4oLxJzvTciKuP8NJF8KAtIM1HmfZyp2AEcHItlCovnrfzeEw7YY3
	C1B8fqRp0EzB/ZIquNzQoJn3T2e6yrUtfoE8vpVEBbDP/I8qXz2ThusoAzaHbMBIFEo/ByJuyxw
	7d1VfUPo7DhyRx58KNV1a7j/jDKL3eGwXOgksLKZ1SckgO5hlL4vCMBYVWQuXrqjj7VxCfok3c1
	hLGImuF6IuSlsTe40az7fkql2k2qJyLbP/g9LP9148IHvxnRycVoKeACIlvv6ykvR9UFMjaADc3
	g1+ZqZudKBymoYwjag+L9Ahb5qpkTUcpa5ayh9eFhfg==
X-Received: by 2002:a17:90b:3f87:b0:3a0:631a:ba6b with SMTP id 98e67ed59e1d1-3a073201d24mr72366a91.33.1790055942014;
        Mon, 21 Sep 2026 22:45:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3f87:b0:3a0:631a:ba6b with SMTP id 98e67ed59e1d1-3a073201d24mr72344a91.33.1790055941557;
        Mon, 21 Sep 2026 22:45:41 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06747204csm2633409a91.11.2026.09.21.22.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:45:40 -0700 (PDT)
Message-ID: <b720d9d7-0353-46e9-90b6-5b3dfbfa15da@redhat.com>
Date: Tue, 22 Sep 2026 15:45:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] arm_mpam: resctrl: Don't stop early when tearing
 down a class
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Sashiko <sashiko-bot@kernel.org>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-13-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-13-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qpx--ve3Iq68LS6cSBcstBO55cwXz-VE4y7534RMatk_1790055942
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224545_889263_67DC0B65 
X-CRM114-Status: GOOD (  15.63  )
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
> An MPAM class can back more than one control and more than one
> monitor. mpam_resctrl_teardown_class() iterates through all the controls
> but stops if it finds a match which means classes backing more than one
> class aren't torn down. The same for monitors, in which case the mbwu
> counters will be leaked.
> 
> Stop terminating the loops early.
> 
> As we are already changing mpam_resctrl_teardown_class() remove the
> misleading comment. It doesn't call resctrl_exit() and isn't required to do
> so as the only caller does it first.
> 
> Fixes: fb481ec08699 ("arm_mpam: resctrl: Call resctrl_init() on platforms that can support resctrl")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v1:
> 
> New patch
> ---
>   drivers/resctrl/mpam_resctrl.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


