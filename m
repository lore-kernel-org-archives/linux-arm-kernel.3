Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029EAD609A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RaB9SM+pvwUf1QmqN2DN92hZRXQJ2LlXiPVs66C+PM=; b=dI08oeSNzDI08OoPhWaji+QgQn
	M/EplWQKNaMXPD1u1XsHrb2ki6eamzu3HqztZdlAg1wvg6LKgr59brTNBlkJuAhpUtPTkVWF28A+2
	w2p/M7sTJyGw/DA4jPmAlI3GXwuvF56Y6Z4RjU3AI6dA8zUv1FaEi8Ra2qrFzAQ4MydXMwZECtXJ/
	OnGyrrM0XerDgTgIIBM2NMkxk4dNdsszx7M9QRGtpOyWTDkM0nZpVEoFWDwGP0lvqG6MAicx0UF+o
	bnOTgDq6WyAdl0rqSDp7aR9SSYR5E/Ft+YKejAQShCmqKMDH6h/xwKUUeTdXYKtqA8+5zKlMJAx75
	al0g+31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWjW-00000005QRw-0t3X;
	Tue, 16 Dec 2025 15:13:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWjR-00000005QRV-3cYe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:13:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so11272525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 07:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765897976; x=1766502776; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RaB9SM+pvwUf1QmqN2DN92hZRXQJ2LlXiPVs66C+PM=;
        b=MU+qaB7Rqr4PNjDzRf4FiYsBJREXXUtWYPRln5oeyvb6QbyB42qaZjgMhmN9KOOxf4
         sc9OMVx7kTRJ4ypOa7cZzauLLT43e7mRcFgwrnyr3tWy7biDLg0hTWVdkCAZw6oxD1Gw
         CSflMqXEuxFjI1gGBpylpGXz5Uc5FA3CQzxZVdOMCShoJ3Mn0QrImoiaFmPxlcjMD3lZ
         BSrzOhhCppvwtVHPpZD2CQWOD8I926sKQLk3DwZ5CleNQkbSgLCSfruckKBHP4PLs68L
         18aZDjOR6hMVqfisGDwDEvGRFXnXwvjM7xvoGvA1AX+yjw6boScqBncbhRikrRQXK8oj
         3FXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765897976; x=1766502776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RaB9SM+pvwUf1QmqN2DN92hZRXQJ2LlXiPVs66C+PM=;
        b=dKDkOaW58cqGRWQNhzu6JR91DxHJzM3Zz8zurO6Hofz13KdUDHFCv8myYP6O2ZReRC
         sS3hUPsopOayLeG8ts0F3u0s7195ASXbjTi2cIAev/Z8TjXMzlr9dCMMe1pEYJy0AmXb
         p/86sBohXb4nyeon+xeyJRrN9oSrPwOvrmP9UQXstVtoGQUQalRJFfglBrRNMHhp5mQS
         io4gdH9Sav28JO6Kgl++LgQaePxf00UJ81ACewVLttcBG1QQGiEQHRlOw2Ew7JA7TzfC
         jHVoaYpQpNJ3TzmvyBQcKJQKeK3F9n7dg/zrzsIvny/MiD8FtC9cI4TtEVRFqH6Ca4xC
         wpBA==
X-Forwarded-Encrypted: i=1; AJvYcCV4eiBux3r7je2ETasPoT17B2fNacBVD01x4C84bx41MgYKfiknQLpw0tp3ONjwd3rw2Ru9HwgwQ/SVRL3nsblA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1KKINnfWSe/vziYrr5FMr6J8U84PmYAMy5Wr4PueBoC0yipvv
	TWnUG6D3JlU5Ue9wmCxdFTjV9i0KfiUzNreoiQOOv6b2KXbF7anSScklnNaOZek8TO8=
X-Gm-Gg: AY/fxX7EiISj5fl/wUAyvVFfF379ztg96DVFS855c81xTYP/NGc5NrNEEyH2fbyHDEG
	T3hvEbrUqNkp8DKG47Q3bD/db0zRXxqpJEjZwdiVL+SWwgmncuPENrpLoTTKWOa81pN7dxdY0Od
	GDcEZ9ZbR3icfpxjIwp4TAEnVoasXmgSt4yZFTh2LBFKZ2364jzUAm1kyB+3oY5MADudEyys4k8
	MYMJz5HZ3byFQxsD3GPp8vRvQP8ouxfM5U24VKt02lukrodwjO8AC68+Hz8BxPKboCyuexFAG8q
	JVhPBnzih95y+15x1zpVKyQP+rWjIyPtD+LZiDqBuGWlsIGMDj1IgEqHawsh+0u0GOaXlwZfppW
	3YP0WZ2zH+xwoMOIJV5CXSAcxqpwwTOf2g4+XGVvbcWkvW5lT9nHT2GiywM0vopD7h2Ad/Q8Cfv
	O21VKoVXFp5XEIMg==
X-Google-Smtp-Source: AGHT+IFg1h+oSthyGc4tPORkNrPPpnVeUr6FNMPfEJgnXBupogksrkrfKGsIU7DtuK9+emJLDR1CpQ==
X-Received: by 2002:a05:600c:608d:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-47a8f8c18d1mr142495795e9.11.1765897975942;
        Tue, 16 Dec 2025 07:12:55 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd90b81e6sm12034075e9.3.2025.12.16.07.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:12:55 -0800 (PST)
Date: Tue, 16 Dec 2025 16:12:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
	rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
	mhocko@suse.com, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 21/26] printk: Register information into meminspect
Message-ID: <aUF29MLUj3YRh4v_@pathway.suse.cz>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-22-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-22-eugen.hristev@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_071258_371782_0EDCF478 
X-CRM114-Status: GOOD (  11.51  )
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

On Wed 2025-11-19 17:44:22, Eugen Hristev wrote:
> Annotate vital static information into meminspect:
>  - prb_descs
>  - prb_infos
>  - prb
>  - prb_data
>  - printk_rb_static
>  - printk_rb_dynamic
> 
> Information on these variables is stored into inspection table.
> 
> Register dynamic information into meminspect:
>  - new_descs
>  - new_infos
>  - new_log_buf
> This information is being allocated as a memblock, so call
> memblock_mark_inspect to mark the block accordingly.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>

I haven't tested this. But it looks reasonable from my POV.
I assume that the output from the "log" command was from your
synthetic test so that "crash" was even able to print the messages.

Feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I haven't attended Plumbers conference this year so
    I do not know what is the current state of this project.
    

