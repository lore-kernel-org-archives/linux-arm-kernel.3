Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6AEFF60CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iP2TPj18aJwm64GDb8cezFyvgyCXdusMq4tD0QwQd0=; b=41QrlK7xceBlFLOwydQ9LAwfnp
	q2Avvmos+H+5/dW/mF2SUUOaPBv79Hj/t15+uToKxZrrt/A+XqetWiVv7Y3iiTjUGPhcRMFcw4kRO
	Xgwqnr5I8IM+xCg3d40rcO3BTPKbBYqlsWNSWL5vYeGB8DJtI+TkdkDpO2SHbgb5LTRNhqe67BeH9
	XV5OBftLJL60k3ugctf91LdubV3fpqf41BvUxcyaO0aRkbA4i1jV15z+e1kV6s5RUaN0UWsflIPaq
	2MaeqF8VAyXG6lm2atgos1qgBuIESM7y/UWvSc6JzFGvgEQXd2buPsvJVmkY1O0MtpiYKjB8NF7zc
	oXp8xmAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7THD-0000000CRcU-0aIv;
	Tue, 31 Mar 2026 07:12:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7THB-0000000CRbw-2qog
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 07:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3iP2TPj18aJwm64GDb8cezFyvgyCXdusMq4tD0QwQd0=; b=nVG8fUheJ4sVixDoeOfThE26au
	rmcMhcK1ITSXNt0iz/TNzxFGxFPgV7eJzQHzo9817X0Rm5L2miCNHM5CJAx/gl61gmwyshZZelgHI
	fP1FUg3YYIQm7GRNd8QK04Dskw+fsWbAR6VMu0IuOtBZJLoEAg757LdXiF7T89PKpGjx4s3QoYdVs
	fJo5Ni3u/edhwoCmXONOZyGxIJWWnhh4TKpVd/w9KYyTcSbjKyuH8mEUh3PU4fRVq1Vbry6JVPuqJ
	yw8hQm4UKhx8dXMdL2cpKXTl+O66sLyNVsaTsxiQM/t5eoztNQIctjEbbBpkLF5o4ua6NtLArRxjA
	3a5IMI0A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TH6-0000000FFpt-1ky9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774941143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3iP2TPj18aJwm64GDb8cezFyvgyCXdusMq4tD0QwQd0=;
	b=GxSbU4UhV0E0Kg5mzRm9nya7Y/007CerRIOjEOj21IFH/hlvFLN4hqcZHdO8uzB27jLpa9
	zCRn3d+/srApBlckNGaQ5R7tK+PzzdRM94kDfLuTsRuCIK4Wj1dj+93yWk6Lv3ndbFV5h1
	MShHDvPEPRp9rftZ03ReOMQMoARPlQs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774941149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3iP2TPj18aJwm64GDb8cezFyvgyCXdusMq4tD0QwQd0=;
	b=evi/KHnGGeieka/kNCNb/JvhsmlfMb6K0BK4SzjKqjMykupqMTK4IjTQuEFYucX8lO9niX
	mt1eKPbb9d/qbAOL2aL4KXb4bIHLHk11LLhkElPoUNM/tnx3X5CVxP5nKHbfZF9I+f8XEk
	gS6cMiqLt4xil5X58o/Pg7GOHowkzRo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-0gCAyxwHPt-8xrYN4V4r-w-1; Tue,
 31 Mar 2026 03:12:16 -0400
X-MC-Unique: 0gCAyxwHPt-8xrYN4V4r-w-1
X-Mimecast-MFC-AGG-ID: 0gCAyxwHPt-8xrYN4V4r-w_1774941134
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 412801800464;
	Tue, 31 Mar 2026 07:12:13 +0000 (UTC)
Received: from localhost (unknown [10.72.112.177])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D95081800107;
	Tue, 31 Mar 2026 07:12:09 +0000 (UTC)
Date: Tue, 31 Mar 2026 15:12:04 +0800
From: Baoquan He <bhe@redhat.com>
To: Coiby Xu <coxu@redhat.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] crash_dump/dm-crypt: Don't print in arch-specific
 code
Message-ID: <actzxO1p6OlmK2gp@fedora>
References: <20260225060347.718905-1-coxu@redhat.com>
 <20260225060347.718905-2-coxu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260225060347.718905-2-coxu@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: nyeEpNaU0vqloh5Cr9gC0SNmO232f7RH0Ei42xaAGFE_1774941134
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_081233_926166_36C28DBD 
X-CRM114-Status: GOOD (  20.64  )
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

On 02/25/26 at 02:03pm, Coiby Xu wrote:
> When the vmcore dumping target is not a LUKS-encrypted target, it's
> expected that there is no dm-crypt key thus no need to return -ENOENT.
> Also print more logs in crash_load_dm_crypt_keys. The benefit is
> arch-specific code can be more succinct.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Coiby Xu <coxu@redhat.com>
> ---
>  arch/x86/kernel/kexec-bzimage64.c | 6 +-----
>  kernel/crash_dump_dm_crypt.c      | 7 +++++--
>  2 files changed, 6 insertions(+), 7 deletions(-)

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
> index 5630c7dca1f3..7e980ea49d8d 100644
> --- a/arch/x86/kernel/kexec-bzimage64.c
> +++ b/arch/x86/kernel/kexec-bzimage64.c
> @@ -525,12 +525,8 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
>  		if (ret)
>  			return ERR_PTR(ret);
>  		ret = crash_load_dm_crypt_keys(image);
> -		if (ret == -ENOENT) {
> -			kexec_dprintk("No dm crypt key to load\n");
> -		} else if (ret) {
> -			pr_err("Failed to load dm crypt keys\n");
> +		if (ret)
>  			return ERR_PTR(ret);
> -		}
>  		if (image->dm_crypt_keys_addr &&
>  		    cmdline_len + MAX_ELFCOREHDR_STR_LEN + MAX_DMCRYPTKEYS_STR_LEN >
>  			    header->cmdline_size) {
> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> index 1f4067fbdb94..2f7b42b09673 100644
> --- a/kernel/crash_dump_dm_crypt.c
> +++ b/kernel/crash_dump_dm_crypt.c
> @@ -414,14 +414,16 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>  
>  	if (key_count <= 0) {
>  		kexec_dprintk("No dm-crypt keys\n");
> -		return -ENOENT;
> +		return 0;
>  	}
>  
>  	if (!is_dm_key_reused) {
>  		image->dm_crypt_keys_addr = 0;
>  		r = build_keys_header();
> -		if (r)
> +		if (r) {
> +			pr_err("Failed to build dm-crypt keys header, ret=%d\n", r);
>  			return r;
> +		}
>  	}
>  
>  	kbuf.buffer = keys_header;
> @@ -432,6 +434,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>  	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>  	r = kexec_add_buffer(&kbuf);
>  	if (r) {
> +		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
>  		kvfree((void *)kbuf.buffer);
>  		return r;
>  	}
> -- 
> 2.53.0
> 


