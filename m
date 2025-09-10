Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159EFCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+GVMVp49sN89TNRY1pR51HdfIG+sKzC0cYTWR8rn9c=; b=iMAG1vnqu60cFfHXy1apAfSoUr
	dy3lwihx5qrosYZm4NS2pxIjsctscZ7q2dumdx+w841eX/mGdCyLCb2nQKMfaQ8ojYw/r3tqcaDmm
	fZH7SbS6C+WUonzOmVnaGcedxMIrwjMDIQUpjBQ4qe5rXQJfbZH2jCwwbAB+IXdS0p3KOPOn0MFfw
	nVsH6vADBl2nhLsDXdbP6xkZZ3PoEvbypmTzio9pLbu6HuWjspfpO4WAnG7vQcV2JggOtc+u79HVh
	KWxeaJy9OPRVGSMRUjqO5qMndxjag5vBMekQEnRqLQYsCiGd/gVOfwQVKCkf/1DFWcyJT5E3WiSPn
	R7dV71OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGPv-0000000D0pX-0Vxt;
	Wed, 10 Sep 2025 08:43:03 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGPs-0000000D0o7-0bCQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:43:01 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4b4bcb9638aso387851cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757493778; x=1758098578; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E+GVMVp49sN89TNRY1pR51HdfIG+sKzC0cYTWR8rn9c=;
        b=0TepXCqY8VwWjMA0M70FedAK5nHkihutVAZ2Zb3bYY5Ug+qxUAisp60Xl0kmD1xE0q
         6mS7wGUogjhbgZdXYzMm1OKhT4tcZbATQZHQqmFl73La3b36VLOwetTFQ1p8rMkJqnVo
         OfbND8YaGB8A8Ilsv9TgwP4UKrd6Sp1vdHwmLv10j26p1D9yZvwKa6WgmHf9kr+BLPir
         mgNDSAGpKrkdwBwCwxetI9ZG9rAUTAcqPMLLQ2NkxwqRXb7iiaYFrM+hpcmwowhsMz/d
         fW8RWbRcHFtXVjyXb7QCgjPYGstcg2p9KNDeDMXx0X40K4pXMEhnfLGtsBuHR6r37oG1
         pHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493778; x=1758098578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+GVMVp49sN89TNRY1pR51HdfIG+sKzC0cYTWR8rn9c=;
        b=QD1lIF9pJV9euoAAy3RPcVnyVWv/s6Ro027qDU9hGsPSfE02Yqfih2bovqQMTK53ng
         JZGlxFjNJ+6yRHinnP0gaFPN4qXEPmyr3xbfrbctl6qExlg5MqPCOPbTBryVDEhkeoTk
         8PLwrEmkkcCN949+bhACbxycnLDe9i/QG5EXLeRn3oSW7W3BFzI/qjhlXoU/AftELhhl
         YdfVy4j5xc1DTF9y1nsnwUDgVW9lBuO+j9W0lm/5u0Y9jMbAq/zU0moX9M/19koEDo35
         SpeAjRes3JzihDwDrXUyXXLfi+xWOUtT4UF4FjIsiw9AmBsVL25uy+q6P0DrqrYzXog5
         ZO0A==
X-Forwarded-Encrypted: i=1; AJvYcCUMQT18T+sDPkN94MJTW/xLoYd7pObw2GyVwghKpVHrMGa36EF2Nm1dEar5LFu2OOl2pk0hrQ2B3hTp6HityvZS@lists.infradead.org
X-Gm-Message-State: AOJu0YxYNzs/vK2dbT/8QqCGmkJMfBVwnW9ftdxmTcJlaa7+sv85DCay
	qjwEc+J+eXUG49DTGiwJQ1MCr2OQ4n5QRPcgP6abVaFANPMl4nLvsI9zOLrBwLi8YExjqIa1VWf
	HTCh1RHBPUyqL00tCsoX++tQcHKy7d947FKg1gcHy
X-Gm-Gg: ASbGncvLKXuXngVpos5P+HVZjoLDqKkN01FaUFLuY8Fo/XNlZgLtoAHdt2g+hRWvkCP
	FVEOhUYEFJAwZPa/Q6L1pzDg+RKEmsbePQIFqpnt0YT7VIIKp/hzupOKgboo+j6hRDCNa5XbGzW
	vwpjkBoywy4uaVcl6jhCC0BVUG+W6dEgYrU14nsD+TZXPme2IRTR8WzPogzoGObTB31sXLxPnDz
	wScZIojtdzRzn4=
X-Google-Smtp-Source: AGHT+IEl1qHCjtwGPJoxI/PfLa9X0mtc0AgLv0Zml465Cpf+BQz6lmjnBu+sGj/iRqROkYiQzMkZUxAyuxZezUMzUfA=
X-Received: by 2002:a05:622a:199d:b0:4b3:4947:242a with SMTP id
 d75a77b69052e-4b625236043mr3715451cf.12.1757493777772; Wed, 10 Sep 2025
 01:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250909072437.4110547-1-tabba@google.com> <5f26bc44-8bd6-4b98-af1f-0af828df9a4f@sirena.org.uk>
In-Reply-To: <5f26bc44-8bd6-4b98-af1f-0af828df9a4f@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 10 Sep 2025 09:42:21 +0100
X-Gm-Features: AS18NWACwviPrScTMVeYLmQwqqOsfV8wFh5m9VgnliLfcZwmz7Zjl0m4mDWYK6Q
Message-ID: <CA+EHjTyq9tGgLiiwFz6vWLs1iE0ht-bSgVJUoMzyw9_=GBQ6BQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] KVM: arm64: Reserve pKVM VM handle during initial
 VM setup
To: Mark Brown <broonie@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_014300_200226_B9BF6447 
X-CRM114-Status: GOOD (  12.92  )
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

On Tue, 9 Sept 2025 at 22:17, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Sep 09, 2025 at 08:24:27AM +0100, Fuad Tabba wrote:
>
> > - Fix bug reported by Mark [2]. The existing call to pkvm_init_host_vm()
> >   wasn't gated by protected mode being enabled, unlike the call to
> >   pkvm_destroy_hyp_vm(). This imbalance caused failures in non-protected
> >   mode, especially when creating and destroying multiple VMs. Tested
> >   with kvm demand_paging_test using nvhe, vhe, and protected.
>
> I fed this into the testing that blew up with the prior version and it
> seems happy this time so:
>
> Tested-by: Mark Brown <broonie@kernel.org>

Thank you!
/fuad

