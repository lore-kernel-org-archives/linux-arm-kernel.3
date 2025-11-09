Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF8BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uy3b83BPtCTZcruT6IGjn8K2xYi0joQB2DmZjVjxtN4=; b=T4WEIFPrkGu4HUUobsgo3lLLT5
	+9My6YpBDwDBJpaCs1K/QnEvWNiW842Q/7s7599vMR3O1xHzZkgbLWOJ8kf+TobQMMMSTiuXQXv0O
	YFBYiZm6FedJF97e7QLQ0Cm/B8jlgoz5XUnTvIkY6HymCM8+2/mgr1Mk1ZTkPKPYBWCqTvqR+P8Oz
	sRQ8pKXhUhkl2YNG/HxqADyhiBtQDlz+i/+7MxjJi2K0a1DBcktkisOaCQjZElDWUX3y72Se15qqt
	128TLab2zyFMklFD7RlXAwm308xJFj6QKeaDWIz9de2CylU7O+zwG76qehSw8Ezdas1Bf3gFrHZRK
	sYoH48aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDhy-00000004Qiv-0Vij;
	Sun, 09 Nov 2025 22:16:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDhv-00000004Qia-3lN4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 22:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762726583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uy3b83BPtCTZcruT6IGjn8K2xYi0joQB2DmZjVjxtN4=;
	b=LvzhbYc9nH3yZwPxQ9+yxZtGsOuvDsB7DPoYOCqyaEglHwUE32g2JSgR5KvDaZn0EIkuOQ
	iYlt/+RADoUK56e+za+NEMon1xUPfkEaMP/YItMLglV9meog2lE6vmllflc3qGBhos8H3W
	TOWTkC5cr44L4AMSIlg8+LE5QAEyC1U=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-8WFmdVYxMkKDzAeXz_rLMw-1; Sun, 09 Nov 2025 17:16:21 -0500
X-MC-Unique: 8WFmdVYxMkKDzAeXz_rLMw-1
X-Mimecast-MFC-AGG-ID: 8WFmdVYxMkKDzAeXz_rLMw_1762726580
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29806c42760so18781485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762726580; x=1763331380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uy3b83BPtCTZcruT6IGjn8K2xYi0joQB2DmZjVjxtN4=;
        b=FoIPlvYLvZDaf/UUxwB06XVtdY60HmAmOTC5LwGI/bwZ0tfqOHKPpu7fwnbubBcNF3
         7Iwpe2Htu+rFrtIJIK4GNiKmHJca7CRQA2xGuhtuS4Xqva66j7E96RNX0lQcjAw/ij1h
         wnmwXLAOepDLW7EmyNaYwDmCHJfcIUAmQYB+19xcmBaLnXP/Ro+oRbwSG3aU32nD+quZ
         K0woi5F8lGGbnoW2fAVd03qlbg6DjgM8dnJMG+N0QcXAlVqqcUr6xZI1h+CQgP6EGL6O
         Zxg6kqYWivTGN5qEeg7kvsH/4MIUmDLgRhaSP0hHIFI1S8/8muIjEiRWbS1pvpD804G2
         /vJw==
X-Forwarded-Encrypted: i=1; AJvYcCUBqrehffYIPaWmr46V7h9k25bWUc8vF212T8tUe4UeSr031ydkduxVT1rS96zIFDkRVdC6QVYuPYNvHmnGU24Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh8lV89N5oTi2Cjr+hkVU0GbsouocZAOPI1QyoGxZ2+8bGjhmH
	13erg3VXQ/0xXyVIaiCr6hcblAhcd0AA9knPpQo60a4gGJlnye8c39exZaxba+nb9ypls2Sgpea
	/wAfcOsSCA3mu4BT3TjTOX+WxcEJeSL4QBRtMRMJofSt4ECNFSIZWcKRhqmYkGXch6KLv7JKSig
	Bj
X-Gm-Gg: ASbGncsK3ZEfZjqMRhSS8Hbn4QsqbOibsapPCtCtqhpnJQYmgd4xOs/+2yEok0snTfp
	WKa2R8MhCrEsQ4PEoeP7q9U3vk7s9m/cq+4U1JNX5oj8WbiHqfXZPU8lN1EY3HhpVwm5qxQ+8+2
	cNNhj0H/UeALWdsg67KbQuaELt+UQGkFlWv9V0zBAnhVF+1KT8sQ7bJdxzHT0x1LvQf4PUuiJm6
	Abe5518d0HxYQFmMiSsYrPQ9+YLKvvYrUELsBqH541UMm9pBvzp/67YZj5G6lFCwpM8faTPekiP
	jRUOBRo5PhHpBKK3qW+CIym/+6XGjHVt8H3Rodw29vZAzhRSUNn+JvU22+CnzGohtCrn/Jd7m+Z
	MMrL5iqwG7vAfZN1aI5/UAw5agGB5mQH/SLJqZcA=
X-Received: by 2002:a17:903:94e:b0:264:70da:7a3b with SMTP id d9443c01a7336-297e570dd4bmr77735985ad.49.1762726580279;
        Sun, 09 Nov 2025 14:16:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcG19xyiPZhNYlQHBgksRNQWkm2IICqnjavOrSaWgOtjPu4QREcIcjuS/S8Nrkbqd+UHhwHA==
X-Received: by 2002:a17:903:94e:b0:264:70da:7a3b with SMTP id d9443c01a7336-297e570dd4bmr77735785ad.49.1762726580003;
        Sun, 09 Nov 2025 14:16:20 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93e5dsm125460015ad.81.2025.11.09.14.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 14:16:16 -0800 (PST)
Message-ID: <3e551b14-fab7-49f9-8806-6d14a4229dd7@redhat.com>
Date: Mon, 10 Nov 2025 08:16:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/33] arm_mpam: Extend reset logic to allow devices to be
 reset any time
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-21-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-21-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -KcrbcZHSoprUda41tzg4CoXwrEZb_rzF3JoqLWzRdc_1762726580
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_141624_046550_1E356054 
X-CRM114-Status: GOOD (  13.74  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> cpuhp callbacks aren't the only time the MSC configuration may need to
> be reset. Resctrl has an API call to reset a class.
> If an MPAM error interrupt arrives it indicates the driver has
> misprogrammed an MSC. The safest thing to do is reset all the MSCs
> and disable MPAM.
> 
> Add a helper to reset RIS via their class. Call this from mpam_disable(),
> which can be scheduled from the error interrupt handler.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 57 ++++++++++++++++++++++++++++++++--
>   1 file changed, 54 insertions(+), 3 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


