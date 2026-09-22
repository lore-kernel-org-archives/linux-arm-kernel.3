Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4F0C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmA9jiPk7zoomWkGiowG3gCebu1IH8Li4eqPWHiVK/8=; b=T4r5cLvxNYXJqlMGfwGTUb6e4S
	pMLE4a3NcRIcWyd2KgnpNiFtG3mjq7SKAPGDJjmHL2UH3gcT6mmdT6XoT8EM2qeYI2gOzpKJLChY3
	DHWTPWegurmq0iunWgpasbc6I91IqR2EvO0RpNeBpzmFnMZMsgpg9YllWsQkmavIwTI3gKP/dvOkp
	vFlDfMmmc7sBdb7x/m09Amou6eqEbpRvrv5jrdGKNXotecEGzZUUtWbEug9BRjUMiUX7KdtcRmYSq
	P8bCmfFblzXvTLcUIzKcF/wWbu8neVjd989DW4dWXOjhPXVvRyzcVHN1owYsI664rWRdorQMz+p5K
	JTFxI9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tIx-00000004HIg-0mbI;
	Tue, 22 Sep 2026 05:44:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tIu-00000004HHr-29kY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmA9jiPk7zoomWkGiowG3gCebu1IH8Li4eqPWHiVK/8=;
	b=aETMd90/48Jda6UZOHMv7ju/VhVh9HtJAA7EPlzlBPDiDHXYswkerRySPuMOSd4sOrxVH3
	lbfvf/cKNxX4Y5NRysLkPLcpd8uQllemEUezlePcFWljFKKtPNO+fzF5qWUGhhKcrUVtLZ
	caG2fnJVYJ7GHeTm7M4tFulHGbui1gw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-yVXpO7OhOhKsu7SV47_H3Q-1; Tue, 22 Sep 2026 01:44:30 -0400
X-MC-Unique: yVXpO7OhOhKsu7SV47_H3Q-1
X-Mimecast-MFC-AGG-ID: yVXpO7OhOhKsu7SV47_H3Q_1790055869
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso588622a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055869; x=1790660669;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmA9jiPk7zoomWkGiowG3gCebu1IH8Li4eqPWHiVK/8=;
        b=LF9EUGMi3nctK3YeHWYE7/3c4pAj7cRes9+Okp/DYZ4HcXT0mMUgrSvQovwBUAc4nl
         Btqw3UR+if8v5pj1T1rjQGVi4yCFu66xM3Ka9pUYasuvfSlt8S/C5+bDadm3kBoy2csC
         nHj0hlQivRrJW6ZvFweibZfi70vNt5JhkwnciPVsinNFO6mwUcytK7rCKe2VvT65A5UG
         cdODr4MjGSdEL51VTxssfgXZ5bXUJVYg1kg9LAFwiIS52/gBBfpeP5ufqbDaNEmBIjIc
         FW4zy2CDOt2a0R4ZHu6RiNtH/q5LXv2NpeQ6cA1FY8QBpYySf91hs/6UamOCvRwkY8KW
         CD1w==
X-Forwarded-Encrypted: i=1; AKwUvBz/RurLy2+kfPjeCbuUljsjMi6gVSsaF7Ic5RHzBWrfxtYMFLTbkTI7AeEJReorinyFDGq/CmmMJ6qITDAxs0rW@lists.infradead.org
X-Gm-Message-State: AFuF++nDK+0UceHc3wwIlPVSpz2D5lJHG1sMCn+y9NYwYFYFkIOUp8Mm
	7gJ+oeO3h+uEN82+zG28P/T/X5gtYS47vJn8tm8DL+ckwbxrxN1bU7Ggt2+/C3KEaOkNiNbP9uc
	K1jgqqNaJ1rb2fugynMP7OtZy34gTjQ7O1F0mtwxq5bvctnZdSxWgxeVFFAz6DkdrF0cuwN6Tnz
	/R
X-Gm-Gg: AYBFou32eNqXA5lqs8oDeUdCUj9L+x1CARRsaMPzy4ACtZF9YDWt1y3ZLkT+TR+Y8jf
	zEF4sIXy17tiQpow9pLo5V9bxVBw4caIb7Ngb0HjAOz9ZDJGTu+dVusAi3m2RCGUTtuk6zt/4/h
	+KU3FMNPq7335z0pknUJP9bbFV3vi2SpIrzgMSFY8wcKuHMnE1umcRH6j03Ylqb3eYvUhZtrL83
	vO1Lp0WaAz4vxp+BN8B4N1aPeLrdTV70d04H+Oe3YA5JFaqqZlz/l0D0qSohA9l0ipa82OEomfE
	7EUFQt6RX1CJ3OG9L2BRQs2kEoUMhOwckUoQL4OaAMLIa4S5vyWRMnj08X+NqRdFIfUbCpwp1dw
	j7Qe+3C08IAKtqe8LKKM0g3wwSo4wGY2Jx1W9h8il2Q==
X-Received: by 2002:a17:90b:5846:b0:39e:6a7f:6188 with SMTP id 98e67ed59e1d1-3a073680db6mr6848a91.25.1790055868913;
        Mon, 21 Sep 2026 22:44:28 -0700 (PDT)
X-Received: by 2002:a17:90b:5846:b0:39e:6a7f:6188 with SMTP id 98e67ed59e1d1-3a073680db6mr6837a91.25.1790055868458;
        Mon, 21 Sep 2026 22:44:28 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e53c107sm1266677a91.5.2026.09.21.22.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:44:27 -0700 (PDT)
Message-ID: <6b0e04b1-f0a2-418a-9b24-9803713676a5@redhat.com>
Date: Tue, 22 Sep 2026 15:44:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] arm_mpam: resctrl: Make read_mon_cdp_safe() self
 consistent
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-10-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-10-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -UYy3fSw2hC-m8TS12WA9tfYLuXp27hxQJO2enFB0w4_1790055869
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224433_377059_D4BC1081 
X-CRM114-Status: GOOD (  17.74  )
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
> When read_mon_cdp_safe() is called with cdp_enabled equal to false then the
> reading returned in val is the sum of the monitor values for the given
> component. However, when cdp_enabled equal to true it is again the sum of
> the monitor values but with the initial value of val also added. Both
> resctrl_arch_cntr_read() and resctrl_arch_rmid_read() call
> read_mon_cdp_safe() and are documented to return the val directly without
> consideration of the older value.
> 
>   The val is always zeroed before read_mon_cdp_safe() is called except in
>   __check_limbo() and __l3_mon_event_count_sum() but the latter is not
>   relevant on MPAM systems.  The extra accumulation in __check_limbo() means
>   when there are multiple RMIDs in limbo some of them may be marked dirty
>   when they are already clean.
> 
> Change the cdp_enabled equals true case to match the false case and the
> documentation of the resctrl arch hooks.
> 
> Fixes: fb56b29932ca ("arm_mpam: resctrl: Add resctrl_arch_rmid_read()")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
> Add fixes tag as actually fixes an issue (Sashiko)
> Update commit message
> ---
>   drivers/resctrl/mpam_resctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


