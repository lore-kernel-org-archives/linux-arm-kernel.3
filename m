Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916C3C44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 00:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHqYR7r+HsXp1+8aTKfJipuPeP0SacjoivPvFJAlmZo=; b=NN+8k5aedbcEzngfu0qKj8r2rU
	+LLZaFXmOzwCejsBN7atocODEsfyT0HJiyPOFR/86vVcavenRjGTu2Vwiy39Km4LIvqUmoKCkmCsk
	7Fiy0oLhaIFtOTL7VEOCrhkYUqFYXBOEVmFgPrbULKlXZXSxyT0li8loR6rz3RSJ1V/KZn1ALyBAb
	SItCiZhBbwQ5CT7XvcYQ6Q81ki5jmGjhiutC34Sh39TdUjc+czR6Ded0VDxyJzYZTXReANLdE5EGh
	cv+xpYTUrniCnqmwn74VBfyyG0Vu2ywisfU42ebWL11U/UCVsHCxdZPky4MyHtW2DmLRzJlmXUv6q
	thYunXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWsD-00000000rnH-1wxv;
	Fri, 17 Jul 2026 00:56:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWsB-00000000rmb-35XA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 00:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784249774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rHqYR7r+HsXp1+8aTKfJipuPeP0SacjoivPvFJAlmZo=;
	b=ENqwKcbKJXC78NxXhQkgzE0q9T1d3fquAVkfSQ9dw01slVw+4RrIuq6qDo1vXwnYhR9eqS
	8lW3wxwc3RDougPlDwgabBI0E4tVQnXy2mS4R0d6UqWttv45wUAu93XiIzxC8T6k4hDGat
	Ayn3f1EXoY9MOl9kFbkhHx+sSaXAHAg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-_5G8zKZhO6umbJr1ax9wgQ-1; Thu, 16 Jul 2026 20:56:13 -0400
X-MC-Unique: _5G8zKZhO6umbJr1ax9wgQ-1
X-Mimecast-MFC-AGG-ID: _5G8zKZhO6umbJr1ax9wgQ_1784249772
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so3253649a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 17:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784249772; x=1784854572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHqYR7r+HsXp1+8aTKfJipuPeP0SacjoivPvFJAlmZo=;
        b=EqBjvTNxQ9vp1bIYJNNlnC5AQr93DudX8oWh+3hBeyHQypNj9Y2htQkjqvDC4AXhFs
         EBHfPXscyypkMm0Xfgand1oNv9hy98O2gf92husLD3mIslriAO9u9jhil9knn88hL2c3
         SEbD/HD00oPW6zHIC0WFEKLNKERQ6tdQMUEyP8VnaJVKkT5BiFgEJ5tTenTJY06X8enO
         SVqAJKv+TmSxP3B13ylnKIn82l/t8TncK1IQDSz0CAMulFuB2/fIoursrr+SuvSoMpvm
         l+bNyKE5P7pjNHGyp+N5y6a7wt8Wrzttb7A4d1w7t/882cbx98IbGF3xj03n9RlaMcLx
         GnUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgMTEsw0ZQdzsxoErOdTmuRg09ZO7j61SJAiul3nDjmBbV4jbKXzJ9m9qMEsnekmovX3iIPS67MYjJkYMdJxVe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2C38A6fIK9u3hUAwlbHAKyifwS2DXshA05QdvlPjKNUdqn62T
	G2a0SqkcyT9ZDbd+F0lul2TBnbA2sglC3rmsRNMlF2KHrKm5HoGSIkdz9KbBiFkECaT0v64yLr6
	4zP3h6BdXCYsAERgSWFfRCIDZQ6B1Iykdw+e4pWTqD9WH56lTZidBSQvJInwoxPG7GyvKCjmxwf
	I3
X-Gm-Gg: AfdE7cknjfGxBDlPq5vB+XgCa4bJ+vbGAeDZs3EhvF8xyR/FQHEyIRL0kr+w/08yN9F
	t1FHfZYNw5wYl499XVKpL23PeFXqSrR/ICj23pIfjDAFBgO9xH6aFs/1DlznDMh80+SOYOaNKYf
	PSD41AVi8zAzs7KWrJUSoBfwMo19HMursuWTFSzB8lLY3S3TCyBBOjYQ6tgIonrfmzSthrKpZOW
	i8zf+iLOJIXCXQIJ9l1ejsyXa5e4iiLgbQ7gp5UUU8aLPOaEhzTvmXK/r6Ie1q9DcSHZY6coHKD
	BX3D8Mh3b0zm0WeOUBWzjVImGU35cNuQ201UCCXxJA5pGLsggM8PVuAYL8XG/PH0toqrNmN+8FH
	LRE3gWYw0NZX0Nr5DEaODIfrqbe+i7/ivckgFbPz9+wc=
X-Received: by 2002:a17:90b:2f0f:b0:387:e0db:bc31 with SMTP id 98e67ed59e1d1-38e4b56ed5fmr335285a91.39.1784249772372;
        Thu, 16 Jul 2026 17:56:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0f:b0:387:e0db:bc31 with SMTP id 98e67ed59e1d1-38e4b56ed5fmr335258a91.39.1784249771894;
        Thu, 16 Jul 2026 17:56:11 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4aff1cd3sm151477a91.6.2026.07.16.17.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:56:11 -0700 (PDT)
Message-ID: <6ebeb62e-853d-4ffe-becd-340195983bb8@redhat.com>
Date: Fri, 17 Jul 2026 10:56:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/11] arm_mpam: Add missing mon_sel locking in MBWU
 restore
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-5-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-5-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3zJniLwNOlpSSIFj2IXF81C4hKQIQICzMYMZ7DHa5JI_1784249772
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_175615_852280_B2BE98EF 
X-CRM114-Status: GOOD (  10.34  )
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

On 7/10/26 9:55 PM, Ben Horgan wrote:
> The mon_sel_lock is used to protect the mbwu_state, as well as h/w accesses
> that use MPAMCFG_MON_SEL. However, in mpam_restore_mbwu_state() mbwu_state
> is accessed without holding the mon_sel_lock.
> 
> Add the missing locking.
> 
> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


