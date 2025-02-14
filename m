Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DBEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov/yz6TvqZ9BKjuI2h4Bh45EdpqAuSzrPazgzJB47HM=; b=jo+g/6eJ6Fl403k2CHEvXIYosY
	njxE2CRneTAh3elJM8X+Ga6zZciRgQ/uXVBVtrLeJTze4eI7ZDoey0mO3efkubyvGX5dXIIqkXNWZ
	mvqGlCynLHDbSrR2JEQAFiLU2UF+J1eJLIUg75DDZOYGyQ+BOvvBGViDuhkE7Fb2r5EuPU/t/3Yxs
	EoiM6kuI3eu6Tgwx0ghuvaXqgvILUorVVrm7qfAZ+D6FsRpIEZrjuWcWX6p706T92kyJ38fCO4wni
	Mv1wLjqKMyoRcu1aQ2wjx02vIlITWbdoyv6lX6/+HlFpUsdZsUEy6PtYWh4vmGcHYEc4gsay4Zy4B
	pwuWPKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyB2-0000000FRlp-1aM2;
	Fri, 14 Feb 2025 16:04:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiy9Z-0000000FRZ3-0Zfo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 16:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739548974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ov/yz6TvqZ9BKjuI2h4Bh45EdpqAuSzrPazgzJB47HM=;
	b=MAlrYOvF772OD7AIcJAunDF7vyU8qIqNBhnnZGLDn2IrQ9l76DNiaKvh9/vS9WU93fEwrq
	ilveVsxQs3ZSb+0cK0g1Tjv1rXZbTxbef3s66LV9MT0j1jDsZQukcW8yQ2ki1X/eLOnY72
	N0n6XY0wfgESKiN6AWwqDHwUUHiHr1w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-x1rp6XWoMSqlbfC51d8E5A-1; Fri, 14 Feb 2025 11:02:53 -0500
X-MC-Unique: x1rp6XWoMSqlbfC51d8E5A-1
X-Mimecast-MFC-AGG-ID: x1rp6XWoMSqlbfC51d8E5A_1739548972
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4393e8738b3so17982505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 08:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739548972; x=1740153772;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHHGr6UlqvjFzr1C6/ImYP9v1pPBAQVBHm5GV6R4VUY=;
        b=b99+qd0YeuJP5xCtaF3hRaArSGLtn7YY7s/GFwKf77pDN+PC5iizdxhQq4tv4mACJW
         6CWSa9FkExeEG0tI9pqEU5VZDC7nm5a7n0U7eOMcnx6wg6snzF/uLBaxJfqNRKP+W4vq
         vTKUKnuOhMN8zEQdmO3GTj6JRS1GcpPCSQLopheKjS+SL+rwt3mTFlTPKxD+xT9r2muo
         WPgF5OgUsCzTklHQo89VkJ7vuVicMQLqi17ZJyIEzqi23j21o+OogyG6ur+Q5QPRx+A4
         0rGDk5EDy/vLVCa9nGduDWJu27aIR95iiheRpIF50sdOOdFs2ISA0Hk0F5xjJvz2ca/Q
         5USw==
X-Forwarded-Encrypted: i=1; AJvYcCVvTpmKFWzqVos2gHyUU7heSl0u2FTY+0//47kfCtZg+Rnl/XTVzdWw7XRZ+/d5W90Rwl6ZjUfT9A4/FWiWVaaQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzSZY9RLmb7fTXAW8RNrqNyja9TtCttqH9KkBqYrdLp5350RVac
	CkkQeXLgv/dgif6ld1jNSi5kPA6nEZdHcnq/yeg5ce+T93DmN2m8T5NBCaCrTCzPQQ04S3iE3lR
	GayTLz2dbmubvb6ahUK5l24+/MnYkX12zgsQ6D/P6zb4uVutxo81NVMIzjzgtOpVVYmTlcOCy
X-Gm-Gg: ASbGncvL3ym2qb//Plc40blN6dlhKmV2Ch+1OteHH5O0sp0UVujh2iCtY42gZXdi/IS
	A4Ah8jroaCFOg6x/ubhotSnqPg5m2Dp+NukirE2xvOitMXTPdLD3Lt3H/UAAkRrczUbPfGY85Ia
	R3g1gR9hEi/gww9H7Et9A3n+fYMVsF8vVIa4TxouUMNbWjjPcW2YJiM4g0o61Abjga56gtUJzTS
	YHie0hverVzLdBwwIBFah4OJZhKjgNtIREHtcqM9y3Ep7cSk51dBSzFqGZT9RSnxy5Myxf1E7FR
	CE4wkN8p/IaYNlJAD+oFHbsEuUFvF97r8KDSPRKwy2TpcAr+TM0OrQ==
X-Received: by 2002:a05:600c:3b0c:b0:439:34dd:c3cc with SMTP id 5b1f17b1804b1-439581b278amr139019715e9.22.1739548972101;
        Fri, 14 Feb 2025 08:02:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCWi5zgJmLNi4VvF0bp4+O6Kdu/1ZG0Ttr0yyud1Bsg/IXKfIJhDyOIe3BpTuYO9E29gTAPA==
X-Received: by 2002:a05:600c:3b0c:b0:439:34dd:c3cc with SMTP id 5b1f17b1804b1-439581b278amr139019075e9.22.1739548971663;
        Fri, 14 Feb 2025 08:02:51 -0800 (PST)
Received: from rh (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396713feccsm23745125e9.39.2025.02.14.08.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 08:02:51 -0800 (PST)
Date: Fri, 14 Feb 2025 17:02:49 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
cc: kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev, 
    catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
    cohuck@redhat.com, eric.auger@redhat.com, yuzenghui@huawei.com, 
    wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
    jonathan.cameron@huawei.com, anthony.jebson@huawei.com, 
    linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v7 1/5] arm64: Modify _midr_range() functions to read
 MIDR/REVIDR internally
In-Reply-To: <20250214151343.61348-2-shameerali.kolothum.thodi@huawei.com>
Message-ID: <7f7f34a2-8bf5-10aa-1f18-db82cc5dbf2d@redhat.com>
References: <20250214151343.61348-1-shameerali.kolothum.thodi@huawei.com> <20250214151343.61348-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7pZZi_2kvi-26sKTWyhqJO_IU7SBkNIkZjtNUoNMh4o_1739548972
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="-1463806286-2135163484-1739548971=:19562"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_080257_253899_ACFF36D5 
X-CRM114-Status: UNSURE (   9.66  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463806286-2135163484-1739548971=:19562
Content-Type: text/plain; format=flowed; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT

Hi Shameer,

On Fri, 14 Feb 2025, Shameer Kolothum wrote:
> static inline bool
> -is_midr_in_range_list(u32 midr, struct midr_range const *ranges)
> +is_midr_in_range_list(struct midr_range const *ranges)
> {
> 	while (ranges->model)
> -		if (is_midr_in_range(midr, ranges++))
> +		if (is_midr_in_range(ranges++))
> 			return true;
> 	return false;
> }

There's one more user of this:
drivers/hwtracing/coresight/coresight-etm4x-core.c:1219:13: error: too many arguments to function ¡is_midr_in_range_list¢
  1219 |         if (is_midr_in_range_list(read_cpuid_id(), etm_wrong_ccitmin_cpus)) {
       |             ^~~~~~~~~~~~~~~~~~~~~

(sr)
---1463806286-2135163484-1739548971=:19562--


