Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB53C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 03:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ye0y0tRevzSPz6VhXI7jbdhAlgjaMxZeRJ9jaKbqMD8=; b=ghxs8/3cx7W8Vwc5ZWmaypGex8
	uHdfwH9nHVN09qqBXYbZpygvDC4XQbK5KVybuTRrtex9x1EFFUvDciH6HVaC6zgrdvhK8hzr/2Lp0
	sxelfCr1tuMANSu7k/J2rYOegHq138t1zfFHcaHLR6faE7jGMGyZ4sBbmtntBKnJpj98T5nhmU3zY
	ZZj04EjEx8Dt+38bWg4uqDwxe7e9Ea1NUH1tdmDZHrD+GsNOlXcy+aH/k5v7tGeH+z3m4OPhxMXIa
	3G0ZxgDCxvRrHfjG+YcMBLVLyZYLs5S6BOwFTBdBRMlrxBff080cCLXZXqzUxBaEAnyc2DCkNK5q3
	WS0iYsOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv4yh-00000003RiY-4A8x;
	Sat, 15 Aug 2026 03:22:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv4yf-00000003Ri5-47sN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 03:22:35 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1480341f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 20:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786764151; x=1787368951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ye0y0tRevzSPz6VhXI7jbdhAlgjaMxZeRJ9jaKbqMD8=;
        b=DMeBK63DHNsCJ1BRD0waXT3w9Y4SKByTRYW0lc0AxO+THfLfE8asPb1WrVw7XnLtLM
         mdsr6oTgUkGwE4cm5B3jNHEVwnXJA8Nh1CcekofxRl2qVqgJrIeoVAnRsCjMKRYJD1jW
         Wi0+OwG37KDSRlnahorEs2oLk75JG+aQl+yraE+SMkEALRHXM78Jf1fhLa0IL8rHWMXW
         HyMLqys6VXSnWty0pgBNuh695yYkdWKcPLTx8/Cwq86Ai2AoidIw0Cob+8NoUcVXWxFZ
         sXvWQteIcdRacsVJnOc/7tOdjm2ICtDGIggFf1aPmx66jMWAWNgJWn/X77fcHbTWjGyW
         Zt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786764151; x=1787368951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ye0y0tRevzSPz6VhXI7jbdhAlgjaMxZeRJ9jaKbqMD8=;
        b=QxM1xXNcAgKH8DtPpT4bglmPHRYuJm+HCKe8S+cBbF00LUTOy4YR5SHgvGTj2FHQKy
         nrtt9Khqv3EatY3imCCbAoi/QpA5NYdT4jffkr0DAoVU8P5ehVVtoyoOy9XSNnO3zc/d
         tfAT/1CbyaA4Ob+rFf1USnMD52nDixht8UgMFVfxYALW+FthHRNIK2QlfzQ2nQltb5nm
         CkMYAxnQXi7vX7Fm5Ii/yIX+WxJnb/WcrT8Bgfzi5jjHyTus+WRy9IJJ0wy3pDEdpfL9
         kw33cMqeFRRdOm8G/owb9XHK2A0lfcibuZS1Oi+aylNcw561MUXHvGccVOrHtujx70yR
         j4PQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLEuV/47B2qmPd1nX21sL+e1aj2bL3OEHFaiw5nsc5wGkNZla7DIzHdXEB7teyDTNp7CeIXSgGK13xkv9dYi8d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9HAQRzf330iwW5mcBhTd+IG4UKjlLchBTqBKoyRcnW43UFU0r
	VDlC2HKWNXpQbtRvo7JqhOLdSyUoPB9lXdhDFcbZX/fmszPontL1ZYfO
X-Gm-Gg: AR+sD13WT69JNR+uldrg9iCoMuaIEbGkdGKXa+MLWEcgrvjp3Wgr2Q+D8X+VjWFKipd
	HxtGNvXk2ZzhGrdWKuy94FzX/WQ6mR8aMdXc2gSywqFSa/ReKkLaUe6OvIV87AQsUfm9O4BaWrs
	c21BpVTe0pSUYuJHoQQDoJC2FGpAqxTxExkMXgfADGwLci9Emw6CVpVn/t1wGRaJdaGQeiVEaGC
	lnANH0K4SlXs47FnVu+bDQLEpaOITTrAxSDx4PvKuxNMW+/We9xWjL6OAqHu53cvhwVH1kkDhv3
	rv2cn6n7myBPsj2VOMDg5EEtWCaDK5hZBu8nQqxgG9aD2lI52mkco+hW46d8uUKIb8m8BE9r2F8
	S1Zl+fJs0zL2Z7mJF3YkMEpMjzePFV2gKr30/NikWgs6Bs/ai6x4eHwUnF8VKO+Uh+SmibD/yPI
	LSM41BQejdngtGyq8H+zASc3HJF6N+iTEh3A0VWMfdP9TlfRfhDdMtR6HtbFgWuPEW2h+3Z/zMK
	/Rq2O+muFyC2rq9XznYmuSIU/V7mZyVQPKefTjtDNchNscZrIjZblbBE89glPh+Weu6e8Vw1RR/
	YDK+kWmTmXtwSTpLL3t/Txux5k06pBKJIHSKB/e1+IrTVD+bUqikwre1GDSo7mqy0A==
X-Received: by 2002:a05:6000:dc6:b0:47f:7964:9887 with SMTP id ffacd0b85a97d-481607aafc9mr10977350f8f.25.1786764151253;
        Fri, 14 Aug 2026 20:22:31 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-aecb-d601-fc34-eb31-14a1-3704.310.pool.telefonica.de. [2a02:3100:aecb:d601:fc34:eb31:14a1:3704])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c07d2sm13323196f8f.30.2026.08.14.20.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 20:22:29 -0700 (PDT)
Date: Sat, 15 Aug 2026 05:22:27 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, ljs@kernel.org, 
	Shen Yongchao <grayhat@foxmail.com>, Wei-Lin Chang <weilin.chang@arm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: nv: Fix life cycle of the nested_mmus
 array
Message-ID: <an_ZDzaiPxhrp9zs@gmail.com>
References: <20260814103230.858578-1-maz@kernel.org>
 <20260814103230.858578-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814103230.858578-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_202234_030539_E6872034 
X-CRM114-Status: GOOD (  10.39  )
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

On Fri, Aug 14, 2026 at 11:32:29AM +0100, Marc Zyngier wrote:
> +int kvm_init_nested(struct kvm *kvm)
>  {
> -	kvm->arch.nested_mmus = NULL;
> +	kvm->arch.nested_mmus = kvmalloc_array(KVM_MAX_VCPUS * S2_MMU_PER_VCPU,
> +					       sizeof(struct s2_mmu *),
> +					       GFP_KERNEL_ACCOUNT);

better: sizeof(struct kvm_s2_mmu *) or sizeof(*kvm->arch.nested_mmus) 

> +			return ret;
> +		}
> +		
> +		guard(write_lock)(&kvm->mmu_lock);

tabs in the empty line.

Thanks,
Karl

