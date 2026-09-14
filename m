Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C79BC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqstWO1ZgVHH8TktNFCBcMfA6S7qInTZbOl2DmKbnYU=; b=a+1HOEebq5s1FaMzwonxM811dz
	tJYHIy/jNEb/Ije4uQ5eDwDEL86TVVTOuHexl4Uq00r6HKwyTPi/3pNalcmodWgLw1JAMa6Xbk4qZ
	QV/ZTjNwSyM1D68j3HG/3PuqeeilKey3/BkBHHgQsjtlHXRJ4Jb7zghn8N8NKLJFFPq9emTvu13kR
	n7D6GhVhnZQ9oIFiS9fvFR67yxLzAapN3ZQSA9N/oJy+xvCfx1UuLH6oPEzZISad1TH/QZmp3ZaTi
	AJhSV6ShFV2VJ4xo8+a6Nnxiyvy7VOBf1LB4ZoypyItYj2W2zD/W2QyXV1snpG0sEDmKmzSBg/ZTX
	2gV2yB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zmP-00000002OmQ-3fJY;
	Mon, 14 Sep 2026 06:03:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zmN-00000002Oll-2gAX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789365778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqstWO1ZgVHH8TktNFCBcMfA6S7qInTZbOl2DmKbnYU=;
	b=Qq10oqsP3MV4jHwYiXRxqDokyQvZInyAGMr3RPAYzNXL2qp2qI8gDQ3n3dk0hNmiKXOjgj
	dy8s8ipeYOJs94wWhnqExfjgfRxj0bjJwh1ji7vpE9xdahfRL+UOv2j+jBCAD3ggWh5bOD
	xYtu6Hz+KfD5OF6n2razITMM54aTEsc=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-tXrC-sU0NVSUDi5puRwjOw-1; Mon, 14 Sep 2026 02:02:57 -0400
X-MC-Unique: tXrC-sU0NVSUDi5puRwjOw-1
X-Mimecast-MFC-AGG-ID: tXrC-sU0NVSUDi5puRwjOw_1789365776
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c1bb6ec882so2426135eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365776; x=1789970576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqstWO1ZgVHH8TktNFCBcMfA6S7qInTZbOl2DmKbnYU=;
        b=NtoDZYNISxuow8RQNiYqt/EFrFyiD/oRqm6F1q10X6DFNP0CsF/H2wfREwPtPOZdp3
         vkDXLcq0ZwCS4Ou6tOzvxOJfdgbtQRCptcs6AFmdI22DtbqTbZ9whKHNGOEv8P+ZtHgF
         mioIlXOvHK8DfpA9eTvS0GEvbdufE/ZFILZyLJg32Gd9b5Ml1X/m0uWDIampPwmwXOIa
         WIA0XAGQpRhuYfFjF+5Z+7NQ5FMfTOQS492uu0SuZsJdZ5u5A4Wvzw4Ns92jTqxq+nNG
         wxc+f7A4YdTVA73uVOdveq2w6QFsDPtYJ2nuZvj2O7HW3QW0UO2UnCizkFr6mxi6nny6
         KhmA==
X-Forwarded-Encrypted: i=1; AKwUvBxNN2YJrR8i1mbubzEWHFOrK/dtFIWdmlem8yVnTy6EBXkrT9zO/Uqr/Ac0nhx0r6th2nf7CxwszlSAOq1PMiiW@lists.infradead.org
X-Gm-Message-State: AFuF++kB41WFOLi6jUD84qzVOG1/Eb472TJzM8Pn6+4+RoxswH+vRWun
	rLjGpJA9C/u7zO+EwUr/xS2rjVphctOQA6nmGYfV9CmOlNaF0JZQ6caEEXSHIehYSi47stmQOYc
	O6UExBLRYwG+V6KOs8lry1HXV8736CCsGJRN+UetA1ZM4NwpjsTi0NOtrQbALGrsy2+3PFCbIIv
	wZ
X-Gm-Gg: AYBFou2W2vJ6lMJWOTI2fztNhH4H+GyhLRlXZ2eMYONBarSPUEz//FsE2SkxEHwIZH0
	D0w2o+qNuopGNmxVprcAAHgozPDxPj/XEkBXnKwt8O/B4yNKgy3x3JiL32Wch5gfe5tTYzT5nUN
	QhSuC4jGLa+vOat0Msphi8R/NKjBbgyhQ7fTvZybIAAGGBFBUfkALWlkeQaJQh/mfbEam79nnWL
	hBNQZfbgRUtuVdrQWJtJZ2wEcFHC4PPXmIdPieie/o8fzDrC1Mz3Wf7ZX1+v8FK2UqOUAMZBEsG
	pkSgfLFbGg25Y81Jwf/oWM6RgURdgkOBhzy3k5cuscDSLLA+wj3QxhIgooD5mQOXI29A3eMaqDO
	9DF0PdwAxn1ecuOpizwIfcCxETcW46iVvSOz8ycHS6g==
X-Received: by 2002:a05:6820:985:b0:6b7:46fc:1e6 with SMTP id 006d021491bc7-6c542f1e27bmr483601eaf.69.1789365776267;
        Sun, 13 Sep 2026 23:02:56 -0700 (PDT)
X-Received: by 2002:a05:6820:985:b0:6b7:46fc:1e6 with SMTP id 006d021491bc7-6c542f1e27bmr483565eaf.69.1789365775779;
        Sun, 13 Sep 2026 23:02:55 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm23239081c88.0.2026.09.13.23.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:02:55 -0700 (PDT)
Message-ID: <37ff6cc7-9a72-41df-a473-b45803ad5239@redhat.com>
Date: Mon, 14 Sep 2026 16:02:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net, x86@kernel.org,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260911163613.1131447-1-ben.horgan@arm.com>
 <20260911163613.1131447-3-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260911163613.1131447-3-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GJNar5QeZR0OEH8vzJLAWKmCCa9ZT_F4Q33TUBo_t50_1789365776
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_230259_755147_A92F8FF6 
X-CRM114-Status: GOOD (  13.95  )
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

On 9/12/26 2:36 AM, Ben Horgan wrote:
> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
> MPAM uses a binary fixed point fraction format for MBA rather than a
> decimal percentage, this introduces rounding errors.
> 
> Without this additional rounding, if the user reads the value in an MB
> schema and then writes it back to the schema, the value in hardware won't
> change. However, with this additional rounding, this guarantee is broken
> for systems with mbw_wd < 7.
> 
> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
> to specify the conversion resctrl does to the user-provided bandwidth
> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
> conversion.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> Changes since v3:
> Parameter order switch (Reinette)
> Add Reinette's R-b
> 
> Changes since v4:
> Add missing tearoff divider, ---
> ---
>   drivers/resctrl/mpam_resctrl.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


