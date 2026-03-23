Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF169D58CD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 04:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPVOVXRS5gJ3PFDSRQQsaieeJxLwdueewdmFDIlgVy4=; b=l4CsfPwAUSybpBxNqiiR3BqkbN
	kOjCpJueeaKpdwWYh66jy77XEItEH+whbw7uxBUSCT/us2h4jVH3C2pm8QqL/4cLypLymV+68983k
	R81ufLXDBlHTDiYoHuTvD6FcjRmX0aWchhFFP5UcsM0WiFz0XA1VUCmqHwG2NdKu7gWHTi7vGT8iH
	oRT6gshEVbKSSx8azKfHAR5L67cGyFFCWLIwSk0LfoE79/FK9KzWTD0LuSGB2pEwxfHWpPkfjzbpk
	vUBJ9WM8vSWieTCD9o2m9ZM1OrPRLtfxYQKDhrbLNCDdf9Drm8ycNYYC/EOJlS4co8V0lAEYAKtxI
	cX8oRZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4X30-0000000G1cl-3Ggj;
	Mon, 23 Mar 2026 04:37:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4X2w-0000000G1bu-25H0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 04:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774240663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPVOVXRS5gJ3PFDSRQQsaieeJxLwdueewdmFDIlgVy4=;
	b=fROIddAdBrQ18dl5r/qCGxXHYOk0Gp5dHNiLafUd26OCfyex/UgwwMEgiITw4LFTymP15Z
	AeGUf3rIPAjNoWNFNg1TB3o4bLTvdj0c352hKcgPKXEyHTcrMTCoRmpLaMBwGKyLFnJx3j
	zlALUW5BFW1S4Gp8PWnCtRAlY1Y2D8A=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-S19mcgu0OSuP6_7YqM1wHQ-1; Mon, 23 Mar 2026 00:37:41 -0400
X-MC-Unique: S19mcgu0OSuP6_7YqM1wHQ-1
X-Mimecast-MFC-AGG-ID: S19mcgu0OSuP6_7YqM1wHQ_1774240660
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso3376005a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 21:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774240660; x=1774845460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPVOVXRS5gJ3PFDSRQQsaieeJxLwdueewdmFDIlgVy4=;
        b=N3jXOnwNaZbB8naVOp2xFPNXizHn7n44NM5VCDbE1R+RnNKFwpBv/LnkhauJSjpkeZ
         2A1Ls8ZuJP/pUM1xbRDBHxEWD2TWSfONTXqrAG1/x2e38b8vaFQwD6pAGZMUkFxkAbsY
         /Jz2ymN4Iicv5YDi58acGzbLQCWPanNAhCyThDfFsiA7TFy8ppNawWjaJQHbd3erj3/Q
         o8+KHcFQd0hQzsEVJXOHn/A2dWl7bunUM3Yi1BB/Tjp7jC5ot0kWZ0bKkJVubbY4W2nY
         wvI8EnVxu+X8pc4vBEXxQS8mfu1oimmYckR29Cr8T4eAyakwkh1EW5knBxP5xUyF84NN
         cWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlGwg2iJ59I6GmLZCt2zpQcha7Ush+A3peVcU7vgMvIUtHymBUgDT4uAmOBtwPptGbooCylS7+8jNtzjAMGCNj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0oDJHmP3kn0EOhyj7FzkGn4UMp7oYBnXetTlOgJD0vT8v5ReO
	/zgW/VnFBvrR36xPBXv+NjBn6JkbzF8MpHImvYP+wxRfNUB9RwmZcD0Uf9U+wVX2SMrMnzl18ye
	5Q+faeJZ0JHxB378tjI3PCl/lEJg3Aa9WpR4deZDJZVWYrpSClBs1GsPFR5RztR8sr4lI4dgMzr
	Jo
X-Gm-Gg: ATEYQzzc71ZSYQ4hTKAe6Q8RTL22TkN7oIBg+8sb23wiapGc5oBeHp3xXxVEnpVOzHk
	JaVVcqmz5SoyZdJD/vsOtU6Pg/2GAy1UcygMtiBAevR0bkw5nrs2A3ealx5vmVnsKyYM55YkT0N
	d3rlJ57fqpa8ZcDrxWlWP2K94UUnm1pnfEJjAiB/5hFQ+loIlqclCMsPqavbDgNEfH70+mMyuaT
	PbcxmNo1nlDa42SQeYszznHiJwEHoN+Wfg38hIiq2aNvA3UaR4SsNXS2yjUW4IUS/Xtlwm6vXZF
	wFoAbD7VQaFsYVqnFJQyCs4VwouD2kATo3KNZkLT352aZbjJT/ljVw1qenqqdlUDEHAnc8a9bKC
	oVp+4AUitIBKC7Kb6gPDHW43dYKyqrZ2Yjf2CjGKkVIvYCOgsPTeT7msHH2/LOdUY
X-Received: by 2002:a17:90b:288d:b0:359:97d3:5c5b with SMTP id 98e67ed59e1d1-35bd2c6efd0mr8849953a91.20.1774240659532;
        Sun, 22 Mar 2026 21:37:39 -0700 (PDT)
X-Received: by 2002:a17:90b:288d:b0:359:97d3:5c5b with SMTP id 98e67ed59e1d1-35bd2c6efd0mr8849913a91.20.1774240659008;
        Sun, 22 Mar 2026 21:37:39 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd36b169esm3220585a91.12.2026.03.22.21.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:37:37 -0700 (PDT)
Message-ID: <ea006d67-34c0-44e3-8a7a-7934fb4da63c@redhat.com>
Date: Mon, 23 Mar 2026 14:37:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/40] arm_mpam: Ensure in_reset_state is false after
 applying configuration
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
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-2-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-2-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YoQrcz2qHBQv8a3frTk-MK_68v9bEqlCoRo7Hc2qV_E_1774240660
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_213746_612646_34F57C60 
X-CRM114-Status: GOOD (  17.01  )
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

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> The per-RIS flag, in_reset_state, indicates whether or not the MSC
> registers are in reset state, and allows avoiding resetting when they are
> already in reset state. However, when mpam_apply_config() updates the
> configuration it doesn't update the in_reset_state flag and so even after
> the configuration update in_reset_state can be true and mpam_reset_ris()
> will skip the actual register restoration on subsequent resets.
> 
> Once resctrl has a MPAM backend it will use resctrl_arch_reset_all_ctrls()
> to reset the MSC configuration on unmount and, if the in_reset_state flag
> is bogusly true, fail to reset the MSC configuration. The resulting
> non-reset MSC configuration can lead to persistent performance restrictions
> even after resctrl is unmounted.
> 
> Fix by clearing in_reset_state to false immediately after successful
> configuration application, ensuring that the next reset operation
> properly restores MSC register defaults.
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Acked-by: Ben Horgan <ben.horgan@arm.com>
> [Horgan: rewrite commit message to not be specific to resctrl unmount]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Subject was originally:
> arm_mpam: Fix MPAM reset on resctrl unmount by clearing in_reset_state
> ---
>   drivers/resctrl/mpam_devices.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



