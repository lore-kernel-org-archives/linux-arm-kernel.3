Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38735103E2EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6gegApxL8KyG7p7ftnWFqHKVt/5DrxD+pUpVnG9ZLo=; b=2EXlCHZ5VBupNJtJSJi+Uv0Vpa
	B0Qg1PbAp+H6GFY9nxf+lolc9a43WLKgRIuAiA8cLFOvpkzcCpZKQkXBL/naiKhu4J0W1jPS0zNEp
	ktNt8BGusoiz7BCt4l2LZmbU+ZEdMo+LtOPQeA5H/7jUyYVE3tbs+LlZePVm6gYOqrPcr90fLcPNm
	c1pP2Gvhecu3/W5U4nNnbiu9i7HQl5bp2VZmKHm8//lEVNxS8MJqsLwMcCfS8dhDEbYJp12aj4LsI
	sq3lqilHC+/3mrjMYCCXe6bj5e6bh9loHoiZjjINSN2vREPUC2AvET99QbJ/J5X5s6bqW1MPQaNA7
	aoDtpssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ScP-0000000Ckhk-0CPu;
	Wed, 11 Mar 2026 23:05:36 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ScL-0000000Ckgt-2gxY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:05:31 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-128ce536fe0so4106c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773270328; x=1773875128; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6gegApxL8KyG7p7ftnWFqHKVt/5DrxD+pUpVnG9ZLo=;
        b=yJzCFTHMl0RurNmQdJlmiD6W5aF1/qWkymEVJBIbuJ/YH6oE6+uxhikO7CY6HSdQnZ
         zxHwma0QPDAx6DeE9mCo4c9g72QAsAMDc0jBqBKxUZNHpkbpUzz4E98E6o87gmeOtaSX
         OYrzJwpjNvOnvNwm2o4SIIQjW61BwbCWLgf4mtvehF+R4rXdsv4SbY0D2L4vhynJim3g
         IaP5TBL1C9a+G1T9FC/xlH5sD8OkAaluhid6jeb24jXq1WqWkbWjfEMjtJl2n4I6B6bT
         IjS72cIGPLL5+EwsqybT/xN3D7q5rF7FDsuNoKmFP9Thh/74Nf1Mo+QG/iNrjAY0Nk+r
         yMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773270328; x=1773875128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6gegApxL8KyG7p7ftnWFqHKVt/5DrxD+pUpVnG9ZLo=;
        b=g+7aB2tVdgps+s+Fu64X1M5fs9bJIOwFUi1QbOYn6Np5PeKUz/liTY3TAhDrgpxbSc
         uJzpDlpoTh7w8WSqrGBL9pPOXxjwESfYOjvJ0vpxadg6yB3hnx/Mirn7qNm60Kt/knll
         Ni6z4+u+O/8UMPPrwIZwu9vc86dOqLW+eeanvP/JIOag4Hx1QMWQBeIU9k9lrHWAGoPz
         e56y31XcQG76MYEJE3QdebP1VIx9cUkbVp6WQdvJPFQEDVh2UObfMxSH7e55dvhLmZaa
         N6j44nNUvVIqBJtO1vb53BueguNNvib6HB6UORLmXKXTofl4nlAPBvuzZzbHDPj+oeul
         Hldw==
X-Forwarded-Encrypted: i=1; AJvYcCWl45bTBTyZUHbjct3GKYte7NJkFPMqKoC9GbAGpPQt+9XBnzt22DCDIBntqwjcPjdg2EGBH9fuxzf9O2bXqyIS@lists.infradead.org
X-Gm-Message-State: AOJu0YxzRtVu8Dt1Z1cG57xJoFSW1svcPP6ehXBgjn9yZ3VGN7xzqgK1
	axVASY6Qo7G+V/j72FExBUkY2ubNd4SLUI2VP2hWVU2ciSEvJbSsf9sT2YCbTmHrmw==
X-Gm-Gg: ATEYQzy6/uVP9Zkx2osg73mqZ5pdo0J0EeOc42fg3gKxLlNwiIqrcoJ/JuvAGkdACD6
	giZv5ZPnupI2x/Pi/O4YdNQsU1FyIOFqOUggQgcvg4GebrE0+c0ngMbvGtJEnIETTSyxdpomRva
	E1Lg+TUIA22p1D7oSbWhNbg9f/lPgZcIpcN8b06fmGXd9lnpm0k6IX/oEcOqmQQZ7Bn+41J5+hk
	WlLe52v9azyI0SKlsX81gT0IiR6FIgL4qZqpStafbYRq4w0LqzN5sCqc+eBsakXRnDwZ0TYl8Wc
	/hg5f2gKYvm2o6ugozGpjvb/9ARXNWBAFpurKqcAGB7POWtdWRyjyPETtiQEFoZ5WeizuQcKRxM
	hf0Z5WOIDT5H+kzTVh0jFn5g1LuSWd8F//kW/2r5tL7GglYEexz7ZPz1Yxd90h0NpJEfm3H11S4
	bbL35TYrNQ5sBe1rLO7bBHRGC4l7WQpPungCY/AvzobzWyCJfziLvTAtm/pc5s+4x0TbXN9SGm
X-Received: by 2002:a05:7022:b88:b0:128:dfb1:61ab with SMTP id a92af1059eb24-128edc2e654mr30066c88.7.1773270327111;
        Wed, 11 Mar 2026 16:05:27 -0700 (PDT)
Received: from google.com (154.52.125.34.bc.googleusercontent.com. [34.125.52.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7cb5208sm6853358c88.9.2026.03.11.16.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:05:26 -0700 (PDT)
Date: Wed, 11 Mar 2026 23:05:22 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	kvmarm <kvmarm@lists.cs.columbia.edu>, kvm@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH v4 09/17] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <abH1Mkm-MV7fLNsp@google.com>
References: <20211111020738.2512932-1-seanjc@google.com>
 <20211111020738.2512932-10-seanjc@google.com>
 <YfrQzoIWyv9lNljh@google.com>
 <CABCJKufg=ONNOvF8+BRXfLoTUfeiZZsdd8TnpV-GaNK_o-HuaA@mail.gmail.com>
 <202202061011.A255DE55B@keescook>
 <YgAvhG4wvnslbTqP@hirez.programming.kicks-ass.net>
 <202202061854.B5B11282@keescook>
 <aa8fNT3P54t5W53T@google.com>
 <20260309223156.GA73501@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309223156.GA73501@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_160529_685277_B9F5F648 
X-CRM114-Status: GOOD (  13.86  )
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

On Mon, Mar 09, 2026 at 10:31:56PM +0000, Sami Tolvanen wrote:
> Hi Carlos,
> 
> If you need a stub with a matching CFI type for an arbitrary function,
> perhaps you can do something like this (arm64, untested):
> 
>   #define DEFINE_TYPED_STUB_RET0(name, reffunc)			\
> 	typeof(reffunc) name;					\
> 	__ADDRESSABLE(name);					\
> 	asm(							\
> 	"	" __ALIGN_STR "				\n"	\
> 	"	.4byte	__kcfi_typeid_" #name "		\n"	\
> 	#name ":					\n"	\
> 	"	bti c					\n"	\
> 	"	mov x0, xzr				\n"	\
> 	"	ret					"	\
> 	)
> 
> For the !CONFIG_CFI case, or architectures that implement static calls,
> you can probably just point the stub to __static_call_return0:
> 
>   #define DEFINE_TYPED_STUB_RET0(name, reffunc) \
> 	typeof(reffunc) name __asm__("__static_call_return0")
> 
> Sami

Alright, I've sent out a patch for this here:
https://lore.kernel.org/all/20260311225822.1565895-1-cmllamas@google.com/

It might seem "incomplete" because it only handles the RET0 case and it
doesn't export the stubs either. However, I didn't find any static_calls
for which the lack of these things would be an issue.

I can address such things in a v2 if really needed though.

Cheers,
--
Carlos Llamas

