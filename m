Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9098CC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 05:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTGrNcFkd0r7wvxM+LayJdDhB/Bf4MUfRoY837NnKYo=; b=UZBmmdOIqR4voI58Hw5aesNTdk
	/nTsr+471h2xwQl57inbUX6NSeTuQPzWt+r/rBbq2vlTuHmZRB78VROwMQMkplxsV6hieqZYvKUtZ
	0aM/hEWDXTF7itmIbzVHBRzX9ZmYCo12LHfc4qF8c3bJVYQnuH96X3x6VhRisr5JVsovHPj8arXUb
	QRgKXo082zSi4Kh7OXCL4aNVawCL4DvAX2Rlzr+wgcNchmdZIqD0ed+b0rfA89oZTG8VxesqbYM2W
	1vWNq2V74jRSHU9ZV/31YnBO83s/20kciLSCmd9FdgGvF1nfJakfuBypI3mJGmF4ShtynzvfEdJX5
	KmpFhKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ytp-00000002LxG-1EKo;
	Mon, 14 Sep 2026 05:06:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ytm-00000002Lwt-3dhI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 05:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789362393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTGrNcFkd0r7wvxM+LayJdDhB/Bf4MUfRoY837NnKYo=;
	b=iebbuoxfdHNDrRrH+OPJGQsqFSlydKTpVup364qWyXRhkb7X/lCQcO5ar+8YWaXJS2Dh2B
	mur5u1MfPbUYeQTopBYcwH3uFuHjmVSWDMvje8tumZlaO6Juw4AFK8oIUs4IQ9gNRQtoHL
	hnrrK2uHXv4ggbXIlW+osooA/Rto02E=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-12kLDdEGOuiMp0eIA_5tVQ-1; Mon, 14 Sep 2026 01:06:29 -0400
X-MC-Unique: 12kLDdEGOuiMp0eIA_5tVQ-1
X-Mimecast-MFC-AGG-ID: 12kLDdEGOuiMp0eIA_5tVQ_1789362389
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso2363200a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 22:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362389; x=1789967189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTGrNcFkd0r7wvxM+LayJdDhB/Bf4MUfRoY837NnKYo=;
        b=jDCdAj0+c2iLgCdZbDcYp0x38UaxgN0aoqSZ2EqTso72DoZjRMWAI8wuyrJ64VWsvK
         E8HHq13jgVXW0nCDFrODtxmWHMGbgfUsX2LnAOMUFZh7Re6oKmyBJz+W7S9DqdAE5dJp
         7Fuy4VGCySGf1ZZPkmKL/U4UORMvz9yOuXe7h+/expX5AE805P94/JS+IINeZldg5N+J
         //b8TSeUFgD5QKG9Jl6y198VCqqnxmaIypYEz1mjdj3ZAoX4KpQ2bfb2g/zYI6q1drPD
         25ynhgGs9z+f1SRJBBKVNMNKF4TC2dGcIPhjUNQcbStONQCA4HgPvrmFFRRkvi7EtfcH
         hQjg==
X-Forwarded-Encrypted: i=1; AKwUvBwHgV88ekm/AYJpI/XxHh3WVFvywUdN4zOPxtGM0MfeKvciHFs261J9hce3fKQv+QAeDYqlw9jdmz7gAOQlzGKF@lists.infradead.org
X-Gm-Message-State: AFuF++lJrPzoWUw+gnLXthNUw+QKtJFmzJN9dq5W6WCmqqs38T1IaEwb
	qFCsK1hu3GZwHTwKU3P68MhygZSgVyDXZ816f4+aBjKO5O0PWQ2RRgLclTqpCMik5kFn8hisbgb
	eyskEjqbHMImNKCp/5YW/K3A8Bg8K1OLLaii4KVjTZjSlSt5yY73esA9rmKAl80oQA807PIn1ie
	U1
X-Gm-Gg: AYBFou1yy1QuMG9ZL8l6AFUHZbgke6ZMrBU2dFWRAWk3cWTW6bhhr9MysEQejTYXo0Q
	oUPcu0GyeRBkFGmCij5zfC8mF+rCLrQvnL9/3hyLp+Ukc/IhPVZNH94Fi/1FuvlR4aCnh8Lnkmj
	ldOXfneYm1RgA6m7u7K+gZ+HdGiXKh5zzTdp/QX/DmwgUW2spwe9KhzbO9kYIFf6nDdUzgOjRTz
	pf2CfgdHQeo1FGjrYaQqHvSEIMaAoGXm8ZqvtJsQO8uYn8Qkeinu+lEV3bTn/mhkRv9Y0Y1QeRE
	c8iRQ/56xHX39Kb0Ex1w7EPyhrjouiBbwDCY5U6GpUkhD2kEonFC8AEuvfLZMDUOCo3nZWOSVMI
	d/NBDZHg72Szzsr0xNNF2q9zd+YI9xdqs6Q9k2DyGqA==
X-Received: by 2002:a05:6a20:7290:b0:3d1:2dc5:7d37 with SMTP id adf61e73a8af0-3db4039c82cmr2007599637.3.1789362388784;
        Sun, 13 Sep 2026 22:06:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3d1:2dc5:7d37 with SMTP id adf61e73a8af0-3db4039c82cmr2007526637.3.1789362388369;
        Sun, 13 Sep 2026 22:06:28 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c654b5b0sm4167221a12.13.2026.09.13.22.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 22:06:27 -0700 (PDT)
Message-ID: <e15dff15-74d5-459c-98ed-0473a7761c69@redhat.com>
Date: Mon, 14 Sep 2026 15:06:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 5/7] firmware: arm_rmm: Activate the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-6-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260912083611.2513845-6-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BItP3ey_9O4TbVLpnLathFJB35piBVkSqk-DMv8jXK4_1789362389
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_220634_983289_961AC8D4 
X-CRM114-Status: GOOD (  10.97  )
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

On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Activate the RMM after the basic configuration. This is a memory transferring,
> stateful operation.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v17:
>   * Inline RMM_ACTIVATE command and remove the definitions from arm-rmi-cmds.h
>   * Use scope-based cleanup to free sro object
> Changes since v16:
>   * Split into a new patch
> ---
>   drivers/firmware/arm_rmm/rmi.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


