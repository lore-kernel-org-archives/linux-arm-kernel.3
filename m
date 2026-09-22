Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFEEC98304
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4HC1mdDQibwZbY5oZNDaWXuRMJYw/6XZYpkXODzj58=; b=V7LvKrze3i38QnZabD6yOxRS+V
	ofGdU7G8BcdJVcTbfv9WvDNo87g2FwWtXctWaq0srXWlYQ6hQ7YN/Btacsvy4pwGTxNUGsfugdmA1
	uXx5tObKfzZxtqpPExn07dEvXs5FlaMVMEC4gHr1rvC7/W2PZUOj0jHzRkMW63ld/fxwIH3cFqXzs
	PPL7Jmb5R+PPG6DGZrdy8HgFZpUnMiOroFokcLhWDE4Yfn3crxpmdddOCy1NqC/9JJO8C3MOZ82zu
	fwViYkQqs0SiyZQu5ncQASa007z3dYaBcjOkqhgTlroemRR5SqDPEipLqD7I+oT3gNW5t7zJ5d8XX
	fO5cGf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tGQ-00000004GTZ-2opp;
	Tue, 22 Sep 2026 05:41:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tGN-00000004GSf-34M1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4HC1mdDQibwZbY5oZNDaWXuRMJYw/6XZYpkXODzj58=;
	b=glUkGYOOa1B9bEUGSi7dTdmvCBw3v02mksW0WZscS/QLuCePWN8CfiEUO2C45CSkWYF6ID
	KXt923ELOOes10oDxhtJBvvhKYVO9jc9ZO9qPghVv42T8QLncqtfmKiojm0m6+pvCcq4tX
	ddbxQbV7xlzP+Knsg+6Nehc0x4HVGAQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-ilBFQGFRNBiAzuulV3c4Tg-1; Tue, 22 Sep 2026 01:41:50 -0400
X-MC-Unique: ilBFQGFRNBiAzuulV3c4Tg-1
X-Mimecast-MFC-AGG-ID: ilBFQGFRNBiAzuulV3c4Tg_1790055709
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so46902305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055709; x=1790660509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4HC1mdDQibwZbY5oZNDaWXuRMJYw/6XZYpkXODzj58=;
        b=1OafsHLVQmkkK5HTzRnhQpCdEar8Z9qAiI8sfumUhh9tdiUmtg9hDFwg0w4F2db9Bl
         UvSZ/qgNq4sarJuFQ4zrpaNqX60ybHHh1I0Tt6iKM8ObAeA8t/s0ovB9NtCnl9nwCIO+
         imyRFLRDXsQoggdx/fhR7zxbc4l+EqYUkHq7obiP0dESS6hx3XGPpGEA7+H2D05TD2w+
         35QZ6WxGoNqaftCng1usU1rEJvEXe8LgljnWT8Hb12xm7FBWiw/kZ8xmgNKFg0ZP/orE
         MHOnq/4oTIRGdCzyrR33e6AJNJvESw7kgHg+TuzZjXeKHb8PF438j0T/rXJtHPk3Zq45
         uegQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbSFTQdqnt1nZ4Z3rnRaSrz43ebrZxZMEykz8aJ8bftEN9ZBpJhhWYaiX4YXQlY8fzIp9CWiBc5woLcUb35f2Z@lists.infradead.org
X-Gm-Message-State: AFuF++lv9+5unXOe7yO6oU44BBuQ4K758RMfqnL3ZAoCnvtWSPM8bYVK
	vjc/KjxgbyBBQPpKM8ZOm6LIysBdJE/R9m/crizTOZfkCZGw8UDe7c7x6dNkAUpA8RMIKCjeHFq
	k4TfSKvXoDVuABlXNlZS/MFi89QuKuRXJfe8ow2Tl6dbw59xcbRybIgsFzscvqcDmee3OPvuBI7
	Or
X-Gm-Gg: AYBFou2U2u7nYeuL4yttlIpqkEv0W8muzRetYVNHnbLDteEoLtNuAL1/RBXDiDkxQK7
	5jkwiL/YG0tPAeKnYF1QbfnuDousBdoguuWOp9LaL4gJPjmdTA2SqyKtgSad1eUx6/MPFuRi8EP
	d3mzMWYHa5FsDKaKJJe02RgQzeIX5EjEerc00ySIQ2UhxA70jZy5ZuyrBXKoQIz1mmL7Etg111z
	ddCjJ2Wp+i/MVfp3lDMpn5ae38bkx5ryEdxBjPEO/goNhmJiyg6e+R09YJplOg5LD0NRr9rgSoc
	SjuNrpDHOjckwLpxD3X+cvcAQ1y4zKJHGw37O1dMtrDxBd+7kTHgk9wu7MNJGJVfq4U860D7XbX
	6AgG/ePqWfuH/L6MpToYUJKfuX12MDkAG5mQtYagX/w==
X-Received: by 2002:a17:902:e951:b0:2dd:ad73:c989 with SMTP id d9443c01a7336-2df60add9e8mr1117025ad.33.1790055709382;
        Mon, 21 Sep 2026 22:41:49 -0700 (PDT)
X-Received: by 2002:a17:902:e951:b0:2dd:ad73:c989 with SMTP id d9443c01a7336-2df60add9e8mr1116715ad.33.1790055708974;
        Mon, 21 Sep 2026 22:41:48 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d019fb1sm3587565ad.17.2026.09.21.22.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:41:48 -0700 (PDT)
Message-ID: <beeefa59-f976-411d-96c8-2db5d2d13403@redhat.com>
Date: Tue, 22 Sep 2026 15:41:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] arm_mpam: Move MPAMF_ECR write helpers to allow
 reuse
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-2-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-2-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ETgajibIo2ljN-biWOcWsMEXuRUcSVVDCuWfx8RbEvA_1790055709
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224155_850941_7736500D 
X-CRM114-Status: GOOD (  10.00  )
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
> In preparation for calling mpam_enable_msc_ecr() from the CPU hotplug
> handlers move it higher in the file. Move mpam_disable_msc_ecr() too to
> keep them together.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
>   drivers/resctrl/mpam_devices.c | 38 +++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


