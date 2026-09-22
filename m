Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BBFC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKXk6E7IJgUy44hxqkIoAOjGZTQ4msGrU4sztKdUeCY=; b=1u1GLP2nEZIDEROxUEoMvXzZC6
	YIIpcErIb6iuKaFlF893bfzxoSxeGQ8kGU4rDiw1PzJ0wnWTMt3AyCpEHyv/lZYQ3jWsnWPyAE/84
	R9YhEHjsUgFR4H/ZXW9DLD2o6gXTLuzIrljnRcFB5nJ8cX6Ta3O7zTZmEy2t9XC8GVQbayAJJEcUT
	l1FLt2T2sMb379pMIB9KPEPQoCyKq5Q/T1yUaMCD7eFrSFmIDfebTS5yBQcNj8gugdAXaagycZAkS
	0bEuIEw8WDgmlb4va0I5JDx2iA0bHrTF3erw2OithNLagjaT+KzHZxQ2K0WM6cSnkA8H+UHUKtW/7
	VJPUrtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tHA-00000004GhD-0SG5;
	Tue, 22 Sep 2026 05:42:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tH8-00000004GgE-18le
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKXk6E7IJgUy44hxqkIoAOjGZTQ4msGrU4sztKdUeCY=;
	b=FtHMEqaf8teLwy4xMxFIJKHsZZQlpQrBnoHV0aTZrh91d/ZgYBz6yIrx8QEBeMAnDT4Qn4
	XjrfNIRzP0iH4M53nOzf0pHt3t4FI0aEDQfifMEIdcnRTdiL3oHudOK6J3udod1WZB4L75
	5rx+buX9J39Vp5FYnovOcMLjAGyiceA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-9jbUi5lAMi2qKFlxFwg65A-1; Tue, 22 Sep 2026 01:42:37 -0400
X-MC-Unique: 9jbUi5lAMi2qKFlxFwg65A-1
X-Mimecast-MFC-AGG-ID: 9jbUi5lAMi2qKFlxFwg65A_1790055757
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8710450f731so3667236b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055756; x=1790660556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKXk6E7IJgUy44hxqkIoAOjGZTQ4msGrU4sztKdUeCY=;
        b=VTB9e0W3Ne40lpDDJNK60SDvQ/rRBZEePlw7naQ7FnULpKzkBklxyOl5N4VnAwdWnA
         CPVIfR5YOEzCOuxoz0dFZ/AMymiLtKZR7g8l9ZNE/p6IYwJgCuIhBRYYCPetZGV3NUCT
         6TFOvT25V4tPN6SgP92AZ+J4u9+BUNl/f2kuIxAQApFfUtwW3a/AMX4WYKdvsNdgPwWt
         jXBheMbVR8eEJgi63zs1p4q3O+l6BIXb6DbdgQH+O2Fe2gGTviR3le9pEpS+SEnLOVjL
         uLWU7kT8QJPQXZyN6KNMdNClXWPkv52Zco7+c07f5QR1/oXruINYU457Ri8nwwpA2Bj6
         f5Eg==
X-Forwarded-Encrypted: i=1; AKwUvBynLIvTVTRYx07115SCbIqYNG6OdKEbjlu76H00/ZmdzgLQrm12XSPcNSIQq15IuOjs3C4AYQWZHeq6WYEDepX3@lists.infradead.org
X-Gm-Message-State: AFuF++mUiKONMC10hmNR5COxzvId4UPPLsAiStG4rtz3e2GtUDRaLZ+3
	zm/VL9MDydmM5LZ6OlyAFpNCC7u2xKxUVbAIhHtAP2InY4LZK68JOr7/8UfHBEyMjZlY5ndnxvg
	/f6UtEOiUUcsjpq4vuewl3NIZBQHmid1nhiAlxMSvuKkXTMhz2hpzlliYaX7rGx39vHSbBZ2Qa1
	qi
X-Gm-Gg: AYBFou0/kIU+NHF+hrL4VtBvrtqvaZGFnNPtxERkJgP5Q4sLaLa8Q81yCino++O8Zne
	N3SZ7qUN597jDDk/jBLItFp2mdr3WMFBqKLw0cDQRPB8qPoMuhoGHUhtV33h40JEspnZwklZ+Mm
	PIIud4hbXCqAwaZH+bpW22Yee21U4V3MiVny48jis7yx/RveTgesvMEupJ+2BwADHhcuDt5k0K2
	1fHTqur3DLhmfVg7BptjYhQobykJn8BQ4kbwZXglOapoWRNYgjvXu/K6lkirnKMaUCXezFyWJ5P
	LmbZ//R2tkYyYoulNde21ER63YjnLv+1rXvex5qILoOVzEyUY/v49gR5PNtRC/SBr99JCXRhRX6
	2npWhjZ3h6551/dK/QVSYtG1sdFLATI/ZaIg1pAtkgA==
X-Received: by 2002:a05:6a00:14cd:b0:869:c368:3675 with SMTP id d2e1a72fcca58-87c8298c595mr71274b3a.17.1790055756439;
        Mon, 21 Sep 2026 22:42:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:14cd:b0:869:c368:3675 with SMTP id d2e1a72fcca58-87c8298c595mr71260b3a.17.1790055755988;
        Mon, 21 Sep 2026 22:42:35 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c31ee8aa2sm284836b3a.13.2026.09.21.22.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:42:35 -0700 (PDT)
Message-ID: <0bd449a3-6432-46c9-8cf1-26c774e5c056@redhat.com>
Date: Tue, 22 Sep 2026 15:42:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] arm_mpam: Set mpam_feat_msmon_mbwu_31counter
 when there are bandwidth counters
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-4-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-4-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LG7j2kYRlaaj_l9Lpu0aXmqYlnaQwWHEhqkONVJBjJg_1790055757
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224242_386634_E59F8FE2 
X-CRM114-Status: GOOD (  13.73  )
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
> When MPAMF_MSMON_IDR.MSMON_MBWU is 1, MSMON_MBWU is present and has a VALUE
> field of 31 bits. If additionally, MPAMF_MBWUMON_IDR.HAS_LONG is 1, then
> MSMON_MBWU_L is also present and has a VALUE field of 44 or 63 bits as
> indicated by MPAMF_MBWUMON_IDR.LWD. Hence, if there are memory bandwidth
> counters then there are always 31 bit counters irrespective of whether
> there also long counters.
> 
> Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
> counters.
> 
> Fixes: fdc29a141d63 ("arm_mpam: Probe for long/lwd mbwu counters")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


