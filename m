Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9E9C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feTLx7y3sxZ57LB+c+M8YbdddVhljMzyHzPRAu6TpA4=; b=znukbuEmowdxEQKUrqhoR6DyRr
	oialw21kaQ/1Wuhqd1/wfjALuVyCrt12ZBfh1hY/7xm4yWY1u9NGs2F3pbBcH1jPwpkwepTa7F8WL
	NsKgYrK+vJMJL8Xt+6hx3qBn1sDU3rBkQ65pxYL62E5KwWahMt5783oXvvAxUofE/jwa4IHqeOkYF
	uw/29z9mBRnDO+3U1Szblq9IX6TOtHLqt+xtzUZbAva8I2FciU5hiFgUPNF1Iku4MZVYJOe576+2/
	BFX2M12P3hl03IGgHqccfAVu1tUxsw1cyGuPWLdUGHAnB26QGtie3Mce3HY8lSkFkVcwBrz98Q7hb
	TZ7h5eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9n4g-0000000BhkK-2gQZ;
	Thu, 24 Sep 2026 17:17:34 +0000
Received: from mail-qk2-x0e.google.com ([2607:f8b0:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9n4e-0000000Bhj5-0lxF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:17:33 +0000
Received: by mail-qk2-x0e.google.com with SMTP id d75a77b69052e-53122c5bbb4so549731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790270251; x=1790875051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=feTLx7y3sxZ57LB+c+M8YbdddVhljMzyHzPRAu6TpA4=;
        b=BmjHDWyrME5CR9CubonolQn2zrlZpmmrPGzRSnah23RWKc47TNtOOoSCKbYXrXjIgx
         lV9SplZYYKe5BCbc2WgYu90B/V6AFF2K9HqVh7Iu70RKk2k46m4r3ryeO7tW97PcOf79
         4BsOQ9QOld7e4jfgOkkiF3JvWsr93APmgX1tasX6gTlvOnPpyBfDv7YiVsVrPO+0Oy04
         K1BpFMclVJpcWHuEZLBzLuxrP2W5yPJYOJ3+wXz6sfwKbuyg+9Bz1g2T+yRQEK5dKmTG
         dH/FglN02tRCAAXNwBcBnf1jCn4STjo0Yd6vXmDN9t743dVFcwrqkX9Fp7wSRLBDK083
         tXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270251; x=1790875051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feTLx7y3sxZ57LB+c+M8YbdddVhljMzyHzPRAu6TpA4=;
        b=iwyqG/stOKGWUiHWSoMGKXhCdw8Jt65bBHf6w4WIaNbsuFhDbXcIoanmG1+a/GqfFS
         TEy+xLEUxNdVzRfsjcgPjB6jeZDNHKKCtmgHPGege5RT2pHNvPhmUTK2UpkrNR5BgIAB
         L2x7Lbe8rfYPmMJqVgJU39jul1Idru2BfWKZDpiX4xZvVrUIBlTOI6pcZS8q2OmxaRlc
         TfapEE7hEeGhXmtj+Mfrk+PuNKeEksr13jwUizBjzVPKPHmplTfcvMERpXJaurNDhtRr
         IM8yIbeLUo+MeEMe2hR04Plb3agnvwTV6lT32mqGcggBbVkshq6PVdfTKsgK76MFehGz
         Oowg==
X-Forwarded-Encrypted: i=1; AKwUvBwBMnVZjOgF3jKZYs7e7fE8xdH8KtM54JpSLgE3RckJMT7V2IhjduSHAV4yH14Ol1qy+12VCrOT2Y6/1q52jKOh@lists.infradead.org
X-Gm-Message-State: AFuF++kLNnUKz6fSSI8WAJI3Ccw69JolBAZyTSh1ClQ6RfxC56/1cTxU
	K77VpwvFuQ66iak13fatEcZjKAV7H+5YrMxfIKrbbg049oIcjUNkLi8fhILg5vmJw8M=
X-Gm-Gg: AYBFou3sJMOWr217tNpKxrfLrKVjwkjazncucmHIXpTiGJK5w/5CYOwZxi8z1gi59Cv
	9rEIYa7CnawAgI6fVS7VLiSIgFHQt1SkSfWk52XmjLHyJYArWH19DvURRscTzu33Ybe1/NITnU2
	08GYJO5Lg0FjVXBswGFVWFCCpMiGk4C2kgEloMl7EnxS32iodAmFYxFj6YJOzTMSAWjlUQRXVYc
	M7eOKFEFJmWdnv7d4b7Wig2ve5In9Hd42RV1E47S+MIZ8m+Q32lWsulOpjV8VVTwZQBQRXL4Ri9
	AFqLa0zoqO7QWvT8vYk4mfeEtG5qFosW3rxbhZH4m9x+FDe8u9tFV6wDF4v5uGaCkjT8/uhjWJ8
	F9x/UXvfs/AbgQnMYhC3tJf/tci75PaQd8HmgsOI9UK1uiUgCJ0qe2z0ZAap5QuVVoCifVJJ2FA
	fidzqFCnc7tc4ZPeNI5fwmBmK21SScVlv9DeGD6IyyblY7KfhKYleNh2ASbU4St6t3QxcISroND
	PPf8DZYhHkFxtbpSL7dU1gieITEiffTEBEM8awzge7ABBU9sm1RLIk=
X-Received: by 2002:a05:622a:2b05:b0:530:42e4:f001 with SMTP id d75a77b69052e-532feb3025amr31555731cf.46.1790270250746;
        Thu, 24 Sep 2026 10:17:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532f8b7174asm25743881cf.14.2026.09.24.10.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:17:30 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:17:28 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 04/40] mm: consistently validate VMA state after
 mmap[_prepare] hooks
Message-ID: <arVW5i8pvySq6Co2@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-4-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-4-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_101732_234694_ED8B2EA9 
X-CRM114-Status: GOOD (  11.86  )
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

On Thu, Sep 17, 2026 at 05:22:13PM +0100, Lorenzo Stoakes (ARM) wrote:
>  static inline int mmap_file(struct file *file, struct vm_area_struct *vma)
>  {
...
> +	err = mmap_hook_validate(prev_start, prev_end, &prev_flags, vma);
> +	if (unlikely(err)) {
> +		vma->vm_start = prev_start;
> +		vma->vm_end = prev_end;
> +		vma_close(vma);
>  	}
> +
> +	return err;
>  }
>  

I indepdeantly validated the sashiko report on this chunk.  Seems like
close() should be deferred until after __map_new_file_vma() calls
unmap_region().

suggested fix is to drop vma_close() from mmap_file()  and update the
cleanup in __mmap_new_file_vma() 

if (error) {
	UNMAP_STATE(unmap, vmi, vma, vma->vm_start, vma->vm_end,
		    map->prev, map->next);
	vma_iter_set(vmi, vma->vm_end);
	unmap_region(&unmap);

	/* Release driver state only after its mappings are gone. */
	vma_close(vma);

	if (map_same_file(map))
		fput(map->vm_file);
	vma->vm_file = NULL;

	return error;
}

Example race:

  Thread A                              Thread B

  mmap(MAP_FIXED, address A)
    driver remap_pfn_range(A, page P)
                                         load/store at known address A
                                         hardware finds the new present PTE
    validation fails
    ->close() frees page P
                                         UAF
    unmap_region()
    TLB shootdown

With that fix

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

~Gregory


