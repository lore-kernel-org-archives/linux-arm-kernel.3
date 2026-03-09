Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B04EF36E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHOnhMTOgxuYQIm/RtVPW9fCDLVlAoRkKypHVQyrpc8=; b=hS1Xdw+j3E91DuTtPdGvmcHt8b
	+klbdzddF/dreDspQNsD/3rdk3VCB19vSWduiBl7OIILpgwrLRyBwDBvtbzBawjcRJZKBAgscJKpS
	X4B80ffVegNejVfhJQb9dVhvUB+kue/tSYDTkTTMHGJxLoskcKoHAST1BxUQJmOFeuxAOwPvcJOtv
	TppOacg0NUappVaiIxhZx9Rx4zXjhlV1GkdAo/pPZeO8jPDs1hUQ8TVLSUTrScoQ84qCtSSqFNKni
	OoInln+sM+ed4th2tZcpY4m9ppr8AU9YMhtNJ5iSfrdse0UIGf5ZnCOxdVlWs5u8VsU4heRxTmSdA
	p+6mNCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzULz-00000006ke5-2huy;
	Mon, 09 Mar 2026 06:44:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzULw-00000006kdY-2MI3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 06:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773038670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xHOnhMTOgxuYQIm/RtVPW9fCDLVlAoRkKypHVQyrpc8=;
	b=eGO5wnvP1jDUoEHZavUsWzqunEeayAyAv6D2eSyO6bs2dOaRnw3pS/GfTzwYej29XJvT+H
	T/5/56rST4Auw1+EjXzg5uY1XI9sb8SUle8F6QcNuYTw3sXw/KUn8aN6tSeH3Pt6xiaqHm
	oC41TFBKxPKpUmbOlM6s7CEHut/XGgA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-WyiJuaxrOTm8ME98i3aJ1w-1; Mon, 09 Mar 2026 02:42:56 -0400
X-MC-Unique: WyiJuaxrOTm8ME98i3aJ1w-1
X-Mimecast-MFC-AGG-ID: WyiJuaxrOTm8ME98i3aJ1w_1773038575
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829c331b4ebso282464b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 23:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038575; x=1773643375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHOnhMTOgxuYQIm/RtVPW9fCDLVlAoRkKypHVQyrpc8=;
        b=i+csF13GsJ/9Jip3aFQHpScCGTlkbO9sIPOxfyILKMJHPpbo+p0+6F8im976BNnpb9
         SNsG/Umuab7PWk3fdzoMmYpvLcuQqmEJQoOo2tcWXlEudERrPFvqvT9yMyEa53LPiZe9
         M7s1qSGLvnpdZ5xMTYQi7fbSFEqJCMCu2usnx13UuE9CCE+UtR/BTDtbiCaaa9e/xc0c
         NTb6QQuV62WHJch1+Z084BgaH88Ouscs93sWb95Zjt6vNjLUME5UCbKqJQ2LfAjqtjZV
         QRsYHr1VGNNcxGgw+b+Dt8olro/clkGcUtxrn93GYEGY5/IASUgMUsQke1/jYU9jF2JQ
         iqeg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Dm7/z2ACX503n3dcjjCoye/99ceoNHv7HlK0DYpvA/yE+MbOxwT25KI/pFUqCoS0mrvbn0TynGvvpxSUrkB+@lists.infradead.org
X-Gm-Message-State: AOJu0YwVHiUehO6Eq5Dmdkk0nsUqR7unzU1aR6o3gRHHr8adZL9LNfqC
	dr+92KkxnMeetG9iARWfJ2LCvCStFgxNnI8+m7JUc2eCu5rggdCmhJxkz4BuUUjxabTYatjio0S
	Gw5iz3rrPmrLiYOVBpnfQM5VsBXElm+eNr3Wi+PurZahL/eDa2F2VMZc49pOjlAe362Q0IvOE2r
	6Q
X-Gm-Gg: ATEYQzyhrFx6xyL7l7UE+3JbB7PeH5SokskMVigYT6YTlzCJD34APiWL8/uek2kVplP
	Fstkr16hLf0sJKXjSRPztY+8Nj116ACvYgia/DfvUOJ2bpZTHr8C8x1j+mC2NSk2a03kZUX3xo/
	2cDncGALGRtyoilVNAiW2CjybA/una5P42+I1PKP7q1uIcI1s5r1wQDh+CCtEs3X1oGUHp+5zRI
	j/tezq8Gwa2Kjb9krIX0L1tQChsygll/9ros6Xp2JDiBDa5a3EnJbLwvkMPpb4gkwsHSHIFaI3K
	dchWc0WkImc7sTEfoyvO9qf4N4ZyAKUemDcgo5QfzMz4A4gXqWRDyxZIpb2igpuWHjI19QTpt6m
	ODpCTbIQfcGFqXGqVJ4W3Jl5LSPfAeKjrO1AIJtkPkUnnG2/1jcC+CB9HwHLk0IXm
X-Received: by 2002:a05:6a00:7586:b0:829:9f46:280d with SMTP id d2e1a72fcca58-829a2d81dd0mr7344334b3a.1.1773038575177;
        Sun, 08 Mar 2026 23:42:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:7586:b0:829:9f46:280d with SMTP id d2e1a72fcca58-829a2d81dd0mr7344309b3a.1.1773038574824;
        Sun, 08 Mar 2026 23:42:54 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48de551sm9217887b3a.57.2026.03.08.23.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:42:53 -0700 (PDT)
Message-ID: <43723d39-0ac8-4a79-81fe-1edacbec293d@redhat.com>
Date: Mon, 9 Mar 2026 16:42:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/41] arm64: mpam: Drop the CONFIG_EXPERT restriction
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
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <20260224175720.2663924-7-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260224175720.2663924-7-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QoPW-sc1nCdWiOv8GR9L7rMDoGdn1FRMH5XSw46Wpfk_1773038575
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_234432_700639_0CBFFD3C 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

On 2/25/26 3:56 AM, Ben Horgan wrote:
> In anticipation of MPAM being useful remove the CONFIG_EXPERT restriction.
> 
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/Kconfig      | 2 +-
>   drivers/resctrl/Kconfig | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


