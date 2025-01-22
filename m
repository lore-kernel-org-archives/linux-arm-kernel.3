Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902A9C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 06:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3KK0MOGtaWAndAtevjHBrqbRfvIMC+MFqCBRHVSmGE=; b=DpJWtDLcY/whSEvB0KdvKhLK5y
	QswYfLeeHCgMzAD0juccrEx/PoWMkDMawYYjJYGi9EJTpHRxh+9Kohj+VHkieiKwHJBXgtTYMj3BB
	FGmGcVJrlRnYYfnmiN+nyYKlkFIa9pwPXGQL8l83OmdIiq18up8PZ69wmYJM/L37fYVRX7qeAl4c1
	4Yvl34Mdkn3ErloA/9H1UxfJvgNe6SOvEj1pJhbJkmj1ugEMwxZHVm/kmuukolbe9PAYduKybbD/D
	JrZfp3/DpT7X5SaBPRj+XZwyivxDmtoTjmwvOwMFjZh8ui8kg+4AW4YEP6jZXGfJ8H4+snNcIq4Oa
	FoO77XoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taU0E-00000009T50-2Kxm;
	Wed, 22 Jan 2025 06:14:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taTyw-00000009Sqc-0mGv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 06:12:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2167141dfa1so9549755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 22:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737526373; x=1738131173; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l3KK0MOGtaWAndAtevjHBrqbRfvIMC+MFqCBRHVSmGE=;
        b=vRN8YLt+Ls8Lun4IwZDOEG7ij0U3pkx19NEZCQbcWE3gVSQdPEaNeEQ9HQUaEBjheu
         KGW4ezkb2sJNF9LpBhV4TAZOHlpIU1Bsme+1kqc8cUNVgWxtE2VaDc05uSsHa0ZXG/ld
         s3gxPKg2iVcJdx23AV3QjJ5gYgHvruyD1nfSRJC9/ObcWA49KwJf9o8XnUl8MUynnaFr
         YHBOY/y/OVyHRuvRGqnPt3n2910QJsdkhdDzxZsW/lmSjQqAI6aihm/Lk0JSKKJymMCF
         W1Ai+iUJ7cpKDJK7qhKzD9uxLfNUht2qXi9AkKqMOEXwYY1yXL9nfDB94ya66kSVTYBu
         3/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737526373; x=1738131173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3KK0MOGtaWAndAtevjHBrqbRfvIMC+MFqCBRHVSmGE=;
        b=vgn0dk7SrABT34VrbVL91vsNXPmSwnHTD91SoTsb+J/uDqd/CRLshWKo9k2wuqW8YH
         lzhyXufR6kbMelWcKC9SNT3oCmIa21eUdbSkvK5vKC6VHHYj7WnXueSg/Q9ynh5cj8e+
         cU2SPDOyJLplrUeYKDg0ONtoM2DZ35kOfNKA4W8dgA3Kj1ZAhOz22W3O2MLWePXW84Vg
         ZfDmFP5CYHMXsyL03fnM+Tlq9xgyZ+RT6XRu3AWzAo8hUVFX/9b+h5YGiIWyHRTfSky9
         G4dqlRDbE1VhNiBqMRgPrkOvX8QJFxQSkHUgYecOgz+eirlrDqp/yckl+qmA2Af12lTM
         Y9jA==
X-Forwarded-Encrypted: i=1; AJvYcCWiuzZrMoDQwAddwetJu8W1MtE/h5PcbH7vbXM1NhXNyh32PTd70cTT7JK4KoOZf/9glNz1vaEOwyphkbfc546U@lists.infradead.org
X-Gm-Message-State: AOJu0YybQFTjN5qHdTTeNfjKLcvrUmFMs/gd/tLp+18GjjRLAzpfhvtS
	32xBD3p6KtqZiRLH7MZBRe5VG6yF9h+ib0AIp3L9piXQqpXEDbxmzgF5MUpYY06Mu08uydQxw4T
	Z
X-Gm-Gg: ASbGncstVCWz2LjlRTyn3fInJETjaUX9GAAabk8ZLo07Xm2NROmFf/xgFFqJVOtnTmp
	TD5BW6NwI2b9hPsrWqcjR1lmxMRfFWOPNW3g7SW3Ssux93Btgd4nbFNGLwa1fHyAL96iWzg9Kv5
	UhoVrsqzZpp6JCPelThyxeD343qgdDoU+r1RvKS9PP2Iq46eOXdEToQ+38ql927aVT4C0IdSNUL
	8ZSXi80rMLhmAw97H9J5X3X6fxfCeuOw0TLHVWEUcInMmCJDX/s6NcqnDxcwJC6eP3HxRvSSBgF
	Me0jNaA=
X-Google-Smtp-Source: AGHT+IED/wG8Z17uHAG8RDgDajZiHT5+stnTHfFUkVB7r5dBPMymGpBSqMx8GkfsJxtH9EE8WcA1qg==
X-Received: by 2002:a17:902:d4cf:b0:21d:90d0:6c10 with SMTP id d9443c01a7336-21d90d06e63mr12437185ad.23.1737526373366;
        Tue, 21 Jan 2025 22:12:53 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d4014dcsm87823835ad.206.2025.01.21.22.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 22:12:52 -0800 (PST)
Date: Wed, 22 Jan 2025 11:42:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH v9 1/5] cpufreq: Allow arch_freq_get_on_cpu to return an
 error
Message-ID: <20250122061250.kxdpkkvce4g5nar2@vireshk-i7>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-2-beata.michalska@arm.com>
 <20250121104706.2gcegucb6hcuksrd@vireshk-i7>
 <Z4-52JUmR7A-7NJP@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4-52JUmR7A-7NJP@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_221254_226424_7A4C6EFD 
X-CRM114-Status: UNSURE (   8.96  )
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

On 21-01-25, 16:14, Beata Michalska wrote:
> Theoretically speaking - it should, though what would 0 actually
> represent then ?

0 won't be a failure, that's clear, since errors are represented
differently now. I am not sure what 0 frequency would mean and it can
be left as an architecture specific value, which is a corner case I am
not sure will ever occur.

-- 
viresh

