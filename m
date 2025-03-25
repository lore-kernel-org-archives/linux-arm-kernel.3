Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302E6C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXwOjnHMzxUdXRa1xbPJFsVQQAIPiDayu2d6sm6acno=; b=I1CcCrPwrm7FpntI6cuYMvGLwK
	KGn0oll3v9IiXyZ76js5S1BqIgcTrKfMJAUTs/aV+OVuyczV7lQeNzRD+M9pT1M7tk/AS3T3BfBkK
	29GfBXNHX7ootDQlRYiHHeNp15pF+WV24WDUihvp7YnTkxYk5tFMui+mOOVmhBLbmu2c2cYoh3RtM
	LzizhaGDE7mKlwxJi3457+2ZcghtlY7ZvAEoaTJ0pw5HOfIFrjdx7rNlswwwdAhMiAE8GCFJHGCm8
	9OAE7mBchOrNVGXLANgQrAzOisUrQHPtzufsGhnvrlfD2kW9X0W8PRo3UZ/F646GC4tHeOMrw+HGz
	YhIgI46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twznG-00000005DSj-2OI3;
	Tue, 25 Mar 2025 08:37:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twzlW-00000005D55-3UyM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 08:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742891765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bXwOjnHMzxUdXRa1xbPJFsVQQAIPiDayu2d6sm6acno=;
	b=MP6Dy8UGn/5jzXF83MNgkHpnxTyphxbjNByj/VcR0vHy0+dE2XV23qEmgJQA2LDxAndLu2
	cPxlDbBKxiUXc5I5So9OdVGk1QlBnTs86FUTiRcwOhy3rhhpCpyXBOtaik+ACzfC6iHQjt
	I+Gm3LyW/sNQG5hyRtCGmS3vOniNksE=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-3u6TIrCKM9uyzOIUYrgIbg-1; Tue, 25 Mar 2025 04:36:02 -0400
X-MC-Unique: 3u6TIrCKM9uyzOIUYrgIbg-1
X-Mimecast-MFC-AGG-ID: 3u6TIrCKM9uyzOIUYrgIbg_1742891761
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-849d26dd331so626511739f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 01:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742891761; x=1743496561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXwOjnHMzxUdXRa1xbPJFsVQQAIPiDayu2d6sm6acno=;
        b=rW9zlmuoKzqC1PT3pDF7jDC6iyckzwQDM8adLXdjePJpwtdPGsnn25MbV0VJjzf0Vj
         7QvRy/ZKBxHdvkVrA11xexfD44TxzZY+rydjS5FdTfHYuO6rvnu1DPGhwfS46Qw5NOhs
         eBdw3roWmRYLSsW6Yq3swhM9wn1CO60uMNDAI/a/hrhdkAihdcYF1GZiE8mnYO3rG1SI
         EcOc46L+nba/3jBv7f46hOWzHS50ktNEho0Bl9wjd8GkBLLDccj6RQjEvmiw7CWuNEnU
         HG5SZIKx9XOIouTWJLpkXi5ks9bKVzgS5UiBm1P7citEWfJFnnUWQKVKaK/HA2XK6d3K
         y+IA==
X-Forwarded-Encrypted: i=1; AJvYcCV6CZHZ0SgV2+tWCC10AdSBdqWS+k0DQFExKIR+ImZFh4kwyUqVzaajQG+QIAEw8k/j7+nCOf/pmYiHml8c9jvs@lists.infradead.org
X-Gm-Message-State: AOJu0YzAzo/N17T300FpgOpsUBLde2kQTVR7P6h/Bc1FutkxE3ZjXdJp
	7nAMeRJmhZ1mFjv1ruo0cqZ8AfmVAgzCBEdlF9yLKIjT0UeSEuZEFxvBxl102TrDK/fAo82W6rB
	nljyyv38qUTfymc1bJUiXei8xNem2HAbGeTzZ8A5ISiAoa6oSlboiJzzYzY5fSETR0mPcc2O02k
	GDbzcL2hTSAg3k6YBSAcY22C3XjRxm8kV7SzfiBA/mlKU2Lmw=
X-Gm-Gg: ASbGncta4zKBuUw4+Xonmcb6QB+rotO79Sls3TpzvctvrVoFYpaILv0A7xAvLI1xqGZ
	cIhc6bDqgESr5I1hC4tJkXDCndIqkYso7jgo4KDCzoRV6ZDKXg8L3sc1/IyWCinNGDDjinPAvBg
	==
X-Received: by 2002:a05:6e02:12c9:b0:3d1:4a69:e58f with SMTP id e9e14a558f8ab-3d58e81374emr209274355ab.2.1742891761221;
        Tue, 25 Mar 2025 01:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9E4/EucEBc/+iE2lWu+YyJiDtrud2DOWwH9Ttz3ALKtbFpsWVzZCuYuuSTYSC3OfYElupM2e2tE7hTWgAmd4=
X-Received: by 2002:a05:6e02:12c9:b0:3d1:4a69:e58f with SMTP id
 e9e14a558f8ab-3d58e81374emr209274145ab.2.1742891760802; Tue, 25 Mar 2025
 01:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv>
In-Reply-To: <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv>
From: Dave Young <dyoung@redhat.com>
Date: Tue, 25 Mar 2025 16:36:22 +0800
X-Gm-Features: AQ5f1JqjFlzQ1M_D50CQArcQW8YwNNz0vfJYofXBEYquREvaq-g04uQRlGUrUgs
Message-ID: <CALu+AoQj+mHECTvbuK8CpUTmOYgx6n2oMFm5kQXtSigL+5Ks2w@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Baoquan He <bhe@redhat.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, graf@amazon.com, 
	akpm@linux-foundation.org, luto@kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tpkFpTvvyjgdhKQRmWxbpJrVAWqqzu3KvtT1G-kLeMQ_1742891761
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_013606_936000_8CC8F679 
X-CRM114-Status: GOOD (  14.08  )
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

> >
> > Have you tested kdump?  In my mind there are two issues,  one is with
> > CMA enabled, it could cause kdump crashkernel memory reservation
> > failures more often due to the fragmented low memory.  Secondly,  in
>
> kho scracth memorys are reserved much later than crashkernel, we may not
> need to worry about it.
> ====================
> start_kernel()
>   ......
>   -->setup_arch(&command_line);
>      -->arch_reserve_crashkernel();
>   ......
>   -->mm_core_init();
>      -->kho_memory_init();
>
> > kdump kernel dump the crazy scratch memory in vmcore is not very
> > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > so please disable this option for kdump.

Ok,  it is fine if this is the case, thanks Baoquan for clearing this worry.

But the other concerns are still need to address, eg. KHO use cases
are not good for kdump.
There could be more to think about.
eg. the issues talked in thread:
https://lore.kernel.org/lkml/Z7dc9Cd8KX3b_brB@dwarf.suse.cz/T/


