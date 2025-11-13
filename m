Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B36CD8C8F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSWIHRyyO3hooO64JACSCpnVieSk/9Ppr4dvEYGltzw=; b=x1QSLwMARXORlKNMtp4l3j6TXT
	k5LSq2er02mHVYQTTv2TTgZRjSVK03+OtOUDm+G+o7TnX0x5dmRuYsb7wByu/jNlMz3VRZ3Ku1fkc
	t+T2FMf4wNO8Zz19TMl8Bxsq2tzfCOuaUe7rMkc0zwbCpv0FrZXpE9Sv0xnGxjcLJk4SrmgQ6t+Ww
	mED80ZIJY7gx+LTpDRMKgHMPlf6rpKz3ShRJCgTP2W5xEYdqvbTI5jIXOoMV6YvJmwLi6JU6QinxV
	/+nvg9RF+Qpjb6bbbtRtDsImgKIvY1vesEqGLc24rjAnODeGAfuF5Py+jlXyu9ewjhXkiWfhJxK7M
	bMjElCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZjw-0000000Al2W-06EQ;
	Thu, 13 Nov 2025 16:00:04 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZjr-0000000Al0o-3EJi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:00:01 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so1391760a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 07:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763049598; x=1763654398; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oSWIHRyyO3hooO64JACSCpnVieSk/9Ppr4dvEYGltzw=;
        b=MYWZ/A+QsxpDsdK7urM+cKOEA09xDeMr8noSz6cn/j1XHZCFnw0B498pwrbXLX8iJF
         xpsHy62JwJ1h9XCHWILT0Lou8A9+9Qi+ILgVBPRSuy7tAtVRXbSScOrkuetreL0LPwnV
         +i6IhTN7q8U1D19CJq6ZPogkWnTnW3sN5WPoN7v27DlMPh0plWT4mNTc+5HhLWf3Q05q
         ZKGnrV7X00xFo7gR9Yt9W2F7bFLlBlh5BOzwFfms7vT49Yy0yGtqVbdf9Vnqg1zgFPgd
         QAcZz6SJogFXryGpTt5ASQJAE8EboikonoiPYufQZLm0alFJgnAKoiRbcYIqCUqLPtYu
         +RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763049598; x=1763654398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSWIHRyyO3hooO64JACSCpnVieSk/9Ppr4dvEYGltzw=;
        b=G5AQB/7v3xSScptGETzqfw7MFkCtvddrgllUiuyM2RWPluTTaUZ+6wVft9fMx0yCld
         Q3sW3FXHMjCldJhpYECw/a13jijTiQuXTKf8al5q4zCTm6Nq9E/uVSCdYgkvzxLA5Gtg
         pFhStcpRDA7wz15b3j5yk27BOY23UvztD9nCJSTP75970510cDO6hMRaMIR957WxPLb/
         ACThoPDl/tMY2R49ZFCrGtXMBJe7oenLOs35h1puuqJx3XgudPjgpY7MzJPAxdpOyda4
         2kKSm9f/WIlbPnCkU5M6QUSCA+y1DZNbR79tyQPSg+djNdkuUXS02fvZYxUCO8DWA/j3
         5r4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5d3esXJ85hx8rrSeRjJobVhlwQbqtIEdiaO99esZccR94rZX2UG60IKBSGkqN7NlnSiceT4j1Mcp6NNeFQNLp@lists.infradead.org
X-Gm-Message-State: AOJu0YxX0Uvu0IAKDXmKov1PnFczN+bCt3OnKSTB+i3DwfMYEKSOI+72
	4/LAfzGwZUu+kQxyGmWE6zZEi0XSkXiwhHiTNBrjamA1ohNqFG4Zw1Mg
X-Gm-Gg: ASbGnctJh7Db4qw70qCmTxIgBK22k5SeGVwb3FsxNOPPqxg/+UZpv3j8eiujlsfJYr3
	Km5IjJ8EPYb7VgbpAsTZ5d8nJCnT05lAKI8DDzKN9cSNiuAv3njA5OJR/DYoc8Buhdal/z9+6DR
	NQVwsJXtvyE1RHHKTYA1PRiTvKwH1Q/QO8CFOvlTst9re/ED00TFyyWDwGbsRQjcm+R3Tk9bqy7
	AmPCk9QikmhQxWj1IFUhw3gatZPTSUaZPvpbTfcUkA2YlG9kSSLMauL6w/AcjtHz8fzsjAwzGrn
	83Za+JXlQNu2Fypm1B4GKAxA2bHxw2Hk3YLETrjj+6HskiwSWpNTKyOzT8yjo2ASeKmjQLtHQNk
	vYh3AItbLohBWFl15Z3ZgJhBD7PgSciS7xHfsN9smXGOJa5zQyN0WZEOC/MA2DXxXLA2dCWf9hI
	kh3DCpIWPmf3JuMo+jeUk4qiI=
X-Google-Smtp-Source: AGHT+IFoy3Qrt2T/zWrqrEncmeovSM7PWIvEMpppfNPTs0PN5vcTlJFJgXzZBDKyyQYJxY9NrZnMDA==
X-Received: by 2002:a05:6402:40c6:b0:640:c454:e9 with SMTP id 4fb4d7f45d1cf-6431a395d46mr6335604a12.4.1763049597599;
        Thu, 13 Nov 2025 07:59:57 -0800 (PST)
Received: from krava (37-188-200-155.red.o2.cz. [37.188.200.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b2615sm1675323a12.32.2025.11.13.07.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 07:59:57 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 13 Nov 2025 16:59:50 +0100
To: bot+bpf-ci@kernel.org
Cc: rostedt@kernel.org, revest@google.com, mark.rutland@arm.com,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, menglong8.dong@gmail.com,
	song@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCHv2 bpf-next 3/8] ftrace: Add update_ftrace_direct_add
 function
Message-ID: <aRYAdoHh0S95C4wA@krava>
References: <20251113123750.2507435-4-jolsa@kernel.org>
 <c341189e76b2cf9bb2fe712c074bdd652f73edd5ea2f409655b2d78a62bd332f@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c341189e76b2cf9bb2fe712c074bdd652f73edd5ea2f409655b2d78a62bd332f@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_075959_848279_B3D717FC 
X-CRM114-Status: GOOD (  16.23  )
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

On Thu, Nov 13, 2025 at 01:02:18PM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index e23e6a859..ded3a306a 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> 
> [ ... ]
> 
> > @@ -568,6 +570,11 @@ static inline int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned l
> >  	return -ENODEV;
> >  }
> >
> > +int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> >  /*
> >   * This must be implemented by the architecture.
> >   * It is the way the ftrace direct_ops helper, when called
> 
> Should this stub function have static inline qualifiers? All the other
> stub functions in this section (ftrace_find_rec_direct,
> register_ftrace_direct, unregister_ftrace_direct, modify_ftrace_direct,
> and modify_ftrace_direct_nolock) use static inline. Without it, this
> could cause multiple definition linker errors when the header is
> included in multiple compilation units.

yep, also the other ones are missing it, will add.. thanks

jirka

> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19332026793


