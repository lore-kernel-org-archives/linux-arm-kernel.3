Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5395F532CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUeLGoeTwPTz7/suB9ZfTfJ1UEygTswX0AuYIezqldY=; b=2zZkI5zIGAIkcWtl4vJuhuLMHI
	+LDto4aZYhzj3I1iAcsD4YTMXTHbLdyjhhQa24bcfOnsf4QJ5EBAch8y08JzK9wL7YOegsnncjR6i
	hdqfG5INWqbxjdS0GZtjRA/5NdjFTGXT4VTB0d35fXf9VfjKzTgfii8xc7pQXHm5Q02U8dGcOJbRt
	A2VgsU1LrcPANif07tM3tH9dIEm8CMznxyJCqFuYKMHIkI9Ic2xHGytpq9u7SwiCkdggtX+XCnckb
	RvrRuJse0r9LV8zDxWwFJ4DvkUkPRZAReYMJpHBcPdpvZy1Xyu753TiI/x5TPiEEEWRji3JvjBxtU
	yPRqyCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4seP-00000000V2f-1CDH;
	Tue, 24 Mar 2026 03:41:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4seM-00000000V20-43dC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUeLGoeTwPTz7/suB9ZfTfJ1UEygTswX0AuYIezqldY=;
	b=fxtOY5CahERjaV8uVFfcKsrj3FoOZzBIZ3yQof/aj8EksMU0oDf/MstGvQ67VAlXm/+AXM
	1FawIJCc4FiFuqw5n4Z7Ny3LcViv5r7wDN0VJtBl3RJwQ/fFsq6iy+5vFdQGbk8qL6zUn0
	WWFIWUF6y2DFtNz7k1s084KwwpPquoo=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-E-az7TL5O12-SFES5hZrog-1; Mon, 23 Mar 2026 23:41:48 -0400
X-MC-Unique: E-az7TL5O12-SFES5hZrog-1
X-Mimecast-MFC-AGG-ID: E-az7TL5O12-SFES5hZrog_1774323707
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7398e393a6so1407364a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323707; x=1774928507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUeLGoeTwPTz7/suB9ZfTfJ1UEygTswX0AuYIezqldY=;
        b=PjWm5Imos/gPqjh9ivg086uFRUHkh7EHBW4pW2acmiDYlVApwnyNU1HbfZIB9q87FK
         rVTgk3XM/JbHJwraHPDPP7bq4qJgpQ6hDIezJP+PLANlGWRAWMTmvteATnVUFpD4IjcL
         gGByQSUlbyp1Kj3BRW49C9lxV2168ziJ0ZEr9O7W9cFh8PMPe7Ikeqi5EH734F2X5WtS
         LJCx4p4cf2E0p/vIZvMVMzNDmxkZhjU/5l2+0x9PJ3ScsmkK+UTYxW77X1z4JR1cykvu
         1ToolLFGbzldaoytAnZf/r9hHilyl3Nz8WIcsLTKVxQk9ri/3gimhl+RmqwWWjFhJuGa
         CToQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs/22hxDRCMLdFYCGs6kXRuy2Ui99ksXZLvROWkHpwgP58WKERo4r4UppRBm7hCrUuX/+x+Bs4GOfWide1qtT5@lists.infradead.org
X-Gm-Message-State: AOJu0YxKKMbK0F/OMdqM2/u3D374z6PA0CFzlY0FMhXPoGXU2R7nhdWb
	a6RCbSwoLObWjIrfmEPJYpXP6TzNlC1IyVNX5RNhuIlthMVQIZfdf/K5rfRfGOhywkK2mjyv03s
	XfI7we6Hgw+KObN0GDQA0/ysceUdkJ7LfAsgTmDwMDSl8cd0An+e9lRcGmq0mXxjJSjW3RpaSir
	mI
X-Gm-Gg: ATEYQzx+pnEHNVKG2hyxFynFYiHpMulqMju4eH/HvewHYN7iP6WnJB6IKfpRMkLM+eR
	TFT2APH0FfUiI7UrU+AIkwVl1mpN7gI55tqLMV61Z2c5UCD1RaODVdHgz+b6Z3k3IfZ7zujI66D
	JMjRHzwWeUSoLaAW1S+DYfgrpY2xXE2QL07LmdnBH/ihQbiUz9923WxeAjIKIqT2TiuJ74ItAw5
	RCsVSmp+2mNMVPChV+Cp7nsWM1Np1kj07CBy1+OmZqEUSRQWAmbP64xTO+tYNHCKw/5Z1H5Jdta
	LFApjeZMEhep5nl5XNpBYxtrDXHY2FUWLBeOs/sPTvZk0sNbuoEaFMlscvbXfIsuaUYnjRVxGLE
	aYPV+DtjD6R5Fl9UihWqGT/4amZ9l/W0jSNorV5ZauWyNz/7AzaVsRvRDi1Kr75Xz
X-Received: by 2002:a05:6a21:4ed2:10b0:39b:f292:d7c0 with SMTP id adf61e73a8af0-39bf292e04dmr5956830637.58.1774323707473;
        Mon, 23 Mar 2026 20:41:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ed2:10b0:39b:f292:d7c0 with SMTP id adf61e73a8af0-39bf292e04dmr5956795637.58.1774323707126;
        Mon, 23 Mar 2026 20:41:47 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74487b5b8csm9108581a12.31.2026.03.23.20.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:41:46 -0700 (PDT)
Message-ID: <1ab278d0-59b4-4fcf-b72f-ddcdb4fc96b4@redhat.com>
Date: Tue, 24 Mar 2026 13:41:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 30/40] arm_mpam: resctrl: Add resctrl_arch_rmid_read()
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
 <20260313144617.3420416-31-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-31-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3nF6VYjOGHfsps-kDm4EFAz1KLvOQQmHtW2JfxNY2tc_1774323707
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204151_078653_7719BBEE 
X-CRM114-Status: GOOD (  12.31  )
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
> From: James Morse <james.morse@arm.com>
> 
> resctrl uses resctrl_arch_rmid_read() to read counters. CDP emulation means
> the counter may need reading in three different ways.
> 
> The helpers behind the resctrl_arch_ functions will be re-used for the ABMC
> equivalent functions.
> 
> Add the rounding helper for checking monitor values while we're here.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> cfg initialisation style
> code flow at end of read_mon_cdp_safe()
> 
> Changes since v2:
> Whitespace changes
> 
> Changes since v3:
> Update function signatures
> Remove abmc check
> 
> Changes since v5:
> don't read mbwu
> remove reset code as only needed for mbwu
> ---
>   drivers/resctrl/mpam_resctrl.c | 82 ++++++++++++++++++++++++++++++++++
>   include/linux/arm_mpam.h       |  5 +++
>   2 files changed, 87 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


