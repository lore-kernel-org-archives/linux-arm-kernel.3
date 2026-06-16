Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5248CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNTSMzgRJmXIzWcqWEqDdC42PhcZeRCvxhxGiPL0LsI=; b=b3UPaKqqsMvmiY+Kw+k5MQtzX7
	iEAbvtDnGZMB5J6DOQZvMJQGmve2+J07qAN+k5e1bEm1wAiEbVQW97cEtBbCjuuP9R/Admu1/giup
	iZAyLq6hS3ncxN6jY7hGC+dbmvSKTEPhW2jijXjd0kDSWxLGwKhIOesMogITerVCpEFMR1OdbmQjI
	CWnJTVAX4UaUkgAatr535C7cDn5ABUyzHiXizOvYnaE4PGdnqFgBlmC/jPtrzhLzR45X464/t24tF
	p4Ns6hgZcLynBVhq5n/VhstuuvjVc4iYNwOZlC1XHLZI7NGc1dQ4u0nPLBR+TuLmM35JHK0UHnFrk
	OeuG7Jcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTPO-0000000Fo5K-3dWg;
	Tue, 16 Jun 2026 13:00:50 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTPL-0000000Fo4z-2p3F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 13:00:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso914697266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781614845; x=1782219645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wNTSMzgRJmXIzWcqWEqDdC42PhcZeRCvxhxGiPL0LsI=;
        b=DEh+Uf+xCS1MSFLxFYsec/S2AeqflRA2Ppg0P5HtI5HwmnIL35iOV9Ng1MBJmK8495
         +3ZEmqkdd6T3Bq63ouRCtcE3XIT3olrzmR3BbbDJRnJZMoRg6JOsmwkcx2E1WDG2S5qz
         2xiz55pL7ikM1o5fxQ2V2moNw1eCqFcfHfinWWPhhJLgIdmSeqlsKF0oH46p8hrYaWaT
         z49sbF14CyxICW6HGycQJ6iIDa/7rq7014xHLK2hc21MJf1BvU0r7AJTyZaAGvXpKTbi
         A/aele+aVAITHdHhluMdk18KpyusIBbS+COa+zA7yG9AhgM5ZsJfGYMPYZwh0G5tWp+I
         kZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781614845; x=1782219645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNTSMzgRJmXIzWcqWEqDdC42PhcZeRCvxhxGiPL0LsI=;
        b=LndRwxeSAZ9H2xUlvs6ZE+z/X+0n0c0nGFplFMtX4+1+TqlZ+Y0ZV4LT5nqT79UNlp
         XOg48GkggnIE2RuHjb947TdUjv+iuXZP6kYULkDDOjezHT/36wTmRI2oxgF5SNVb+zwh
         OkeAUkA/wzTCtzPfIGs63j3i+lzwSz1Lj1JkCRQ8x5CIU7qn9rAOrFtKurGQnNj7lRBg
         pWKYa+GDcQJ534xUQskWT2Rv9WBLSiUe9bezlZdI+HHDZWae4poHnrTbhB2xd2cB6Ms1
         7DtrldvRue6z1/f86mQqFsSse5ybHAVgasYu7+SyTigX6ROaDNnX3QSJFL1cEQ9F7XUg
         ehNg==
X-Forwarded-Encrypted: i=1; AFNElJ+N/a7jM2C5P+uiS71KLEO1vjWuvXK5bZJzuhOC2nTQ+GEaMnD229KwWObD5j7yl8DfcaLv2wdL3cE8Uarfzsj8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtmy0cHhXH+Hj93t0RY0GTu3WT3YmJfLBBBihBxKqN69Df8AvI
	9o3W5fk3BVnk98a5LCmwdijZqChTFppIFWqyXcjxOgrW0cpzqpOD8PxnDHjpVowlFQ==
X-Gm-Gg: Acq92OE32jb817LkGBzl8ci5iVmxt+fwwQFKPNkZBEhM9drjJD3CkREul+J7NdFOvA/
	vEOOMlI+ODsQ6DF0wyRrmMh/KAKMYFbcRWAR9wSMJUD0ye7Z+YcHehkT9ynNdI0JegePOdimE8W
	b9bsWhST0PSBRiuF4f9I9e+MGKc2jyIUOMN5h41GY/IhXt5CVPiMmSpMoEnlCe4SmgG5HqVSTM7
	6NxtCH6QvG4uaeU+HHTIYtF8CwLhm/vxnlwcmwhtba15V9C63wcXDNoSmAnUckHVxEcI+5Dwe6G
	NBTaAp/XfzQk3lCApWcSWmE06L4qGBqNgijajZZ65u23Dvx4aQxxZpxG9uS67kTSrw3dJUN9Kbw
	8fb2HRmgoM7Oyb/MvACiAaiEqiSa5LoleV/Ih2sn417bLF8tMKTmCNymnHjjVt7jfokmXEdY3EZ
	r/dxFnMM25ecOLY9cmBAjp/CfzF7cVFQ02slVIS4ry68mYEPAxAaZw42PiVWqlTLF89q0=
X-Received: by 2002:a17:906:f5a0:b0:c04:1973:cdd1 with SMTP id a640c23a62f3a-c041973d111mr250472566b.36.1781614845012;
        Tue, 16 Jun 2026 06:00:45 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c03ba328d6dsm214905966b.49.2026.06.16.06.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:00:43 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:00:39 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 1/7] KVM: arm64: Enforce strict SBZ checks in the FF-A
 proxy
Message-ID: <ajFI95hZJxZfFg5q@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-2-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616105417.2578670-2-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_060047_814058_EA973190 
X-CRM114-Status: GOOD (  16.63  )
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

On Tue, Jun 16, 2026 at 10:54:08AM +0000, Sebastian Ene wrote:
> Introduce a helper method ffa_check_unused_args_sbz to enforce strict
> arguments checking when the hypervisor acts as a relayer between the
> host and Trustzone.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 47 +++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 1af722771178..c723a21006aa 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -71,6 +71,18 @@ static u32 hyp_ffa_version;
>  static bool has_version_negotiated;
>  static hyp_spinlock_t version_lock;
>  
> +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> +{
> +	int reg;
> +
> +	for (reg = first_reg; reg < 17; reg++) {

Hum, should it be reg <= 17? 


> +		if (cpu_reg(ctxt, reg))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +

[...]

