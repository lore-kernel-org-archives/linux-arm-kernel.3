Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBEAFC72C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 23:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NL7u0uXFVbBow0LkO2mREfC0sqBnGNJGi0Yb4KYOjHE=; b=aa2JdjiBVVsYDA9wvN1sVXNHd4
	cBD/Wn7idJkZqOOJQbJs182XfglMCEBpVMueHV31xTyHSIow9hQacui2LEIpbCSVQpywzhedphKic
	Tg4Ht2NK7M13c15yJ3feoJI6p7aqSHiqXeB0dYd0UUt41nmZMWdBFEO6QIb51BRQVy6UXOgwR7uTw
	BtSakrNaFaiFLqA2qYwbh9FYxlbu+eiOkuBwKyrGha3eKrqHY4X0uDcG84Y0ZkEEsOvotSU71abMA
	dEiwTbe+20pS9e4sIHUHLvtpWtuOygzgSJqsCCMz1BP4r8m9St1nL6LuxB7aFE5/+Z/0sagsxraIX
	YJb64Kaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4oQD-000000007dI-3Q9L;
	Mon, 23 Mar 2026 23:10:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4oQB-000000007cq-3NgM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 23:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774307454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NL7u0uXFVbBow0LkO2mREfC0sqBnGNJGi0Yb4KYOjHE=;
	b=aaIAPh/MELGyimEx+iqcfohCqM8zV+bSFNacE4HX3hMrOuFwKq96qIfArXwHEjmkSZjw1c
	/LIM3epZBAbEt8UuzxJJ99e1SU3eN8rbX08giBTGOcmARigN6EW8WaGN5Qlo7QK6iASdz0
	/Y5sKOLOGllBszHBV6U9vxyYdwuNeXc=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-zCUatmQiN9Gu3X1UQO-yHQ-1; Mon, 23 Mar 2026 19:10:53 -0400
X-MC-Unique: zCUatmQiN9Gu3X1UQO-yHQ-1
X-Mimecast-MFC-AGG-ID: zCUatmQiN9Gu3X1UQO-yHQ_1774307452
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b05a3c2421so8128925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 16:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307452; x=1774912252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NL7u0uXFVbBow0LkO2mREfC0sqBnGNJGi0Yb4KYOjHE=;
        b=pOGVgg1BPx3dqD/tXs1cHE7lll2bJBx5Z6wiPf+86BPxy41eZtD8S4sxzN8yY/gR8B
         sMJBcCDZYpIV+1ZEBcyunhb0/LdLZuVDfsvKYjvfp0CPwYivO9KLARXC+TWPPGPS543i
         DbPwAfITiJgNtmvvIo5RSID20Jpf80B63p5F1gXXk5a7qUhmTQXOBiS1Rs6p5DhXqZJF
         zi5ly13Dry3GToN9IYttjxvhFxKotxoSj3KqtDRvG+Mp43OOU/qbmxsDge2IDdLsZlZR
         nATKMIXyObcCootDWJVI2KNq3MQlX86JC2B2HemGWMU833vwayIxHPPZrbWPGWgGBDBr
         Li6A==
X-Forwarded-Encrypted: i=1; AJvYcCVYWqheWXPC6/Nkh70SHkILuHRpNd3AfcTYoS7QDPEL0vhL7rGuGF8GoqhjjSkrR4x2W2zbDfsUQAKIUB61pUAg@lists.infradead.org
X-Gm-Message-State: AOJu0YwEd7RmatDULfqNku5td9gd/fZlxh1vAOr3NP9ObXmaFUXAzpK5
	Jjo0d6oJstCBmbBMMzDcEZD/SHGm4+b6uGU+5wQ2tn8IhfB2X7d1riP1Ud4LhgJ5YGED6u2OJtj
	IFISnT05cC0Ftwua/YUhOjzRodEPw5cxGt9gZEOeFkd+XvoF0lN7aAeW0Z0WH00X+IsuJbyWM6p
	2n
X-Gm-Gg: ATEYQzweShkJn7u+Lw6TVz8+YAUCbBIL9KnX0aeQA/SDoxcG7ixC+H1I1Mo4M8HNo80
	8GL/QOSpTuYJjG7+aVftTpzqT+cG+R6Vb4LpNgdSLBCGrF5Q6X6YNzXBGmYAkxTASQVYAAOO5td
	PeFP0lxJTMHB9W/o8w/R+e8XFEROY8dTtsgtovFNpvpD4Gv0ySBGTc1pbB5nTx7sZiK70vi6e5w
	LZAzDmZOieYb0KtpfitKPodQusL7vr7/weQaRLH3lc7czHZapY0UCdArh7oZS7Ot6LApQitdrIq
	eqM3jhD9qAFZNV0YJh9OcrLjy4XblzBYFfZwWkjbvyChMNgs2XwUA/yMEc/PUNwhB7pXSU2scU/
	iQ8SrLPnOyz+QuYhshwXeIeWXP539xIgBHjYtEIazwCrLkcbzcURgJMhMnALdgANK
X-Received: by 2002:a17:903:41cf:b0:2b0:6d56:8d29 with SMTP id d9443c01a7336-2b08278b258mr140241785ad.32.1774307452087;
        Mon, 23 Mar 2026 16:10:52 -0700 (PDT)
X-Received: by 2002:a17:903:41cf:b0:2b0:6d56:8d29 with SMTP id d9443c01a7336-2b08278b258mr140241545ad.32.1774307451710;
        Mon, 23 Mar 2026 16:10:51 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656b51sm152188685ad.54.2026.03.23.16.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 16:10:51 -0700 (PDT)
Message-ID: <ea39c13c-56d2-4f9e-b427-085b32720e40@redhat.com>
Date: Tue, 24 Mar 2026 09:10:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 26/40] arm_mpam: resctrl: Add kunit test for control
 format conversions
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-27-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-27-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kum_CwPCGMdgfabqD-N3mKbDVhzaQD5rlqAFfgLN9p4_1774307452
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_161055_920622_827BDF47 
X-CRM114-Status: GOOD (  11.81  )
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

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: Dave Martin <Dave.Martin@arm.com>
> 
> resctrl specifies the format of the control schemes, and these don't match
> the hardware.
> 
> Some of the conversions are a bit hairy - add some kunit tests.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> [morse: squashed enough of Dave's fixes in here that it's his patch now!]
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Include additional values from the latest spec
> ---
>   drivers/resctrl/mpam_resctrl.c      |   4 +
>   drivers/resctrl/test_mpam_resctrl.c | 315 ++++++++++++++++++++++++++++
>   2 files changed, 319 insertions(+)
>   create mode 100644 drivers/resctrl/test_mpam_resctrl.c
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


