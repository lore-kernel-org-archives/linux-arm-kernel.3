Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845FBC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 22:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIPE161XE6h+XbpKbqRdjbwFF+hmkeZmLDbhV/M2UTU=; b=Z/akeiB3H1pAhhYLz5mYtX8nTa
	A6tg0+18OxWJ7qqCh0XPEWglAm9Xsr/XV5FlDscnaFOU25Jm0hEl1l4GukeEFj2+YHvZwgwwW5vFM
	r9fb3QKiK7N9kBh9d/zRWeAxb7i6faik+lAxX5e6V+1brXR+AJTj+xwe7Rod6Lan7cyoQrthlIBMR
	Nsuy9Fmp/kOgiPjX+0XXOp6Qzzy1u05kE616IhiTKbP/+OT79xlLMfxP46mG8IZlCe44i94De8qqJ
	CpmpyTTvnLEl9vik+hpR3FUkE2j1HoHigyvGZPE64TZGrIm+VlJhMEiWBt0D1rUjgf6MiYIKAtsDy
	OOp1xZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEBM-00000002Smk-33Nx;
	Mon, 03 Mar 2025 22:22:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpE9n-00000002Sbw-16of
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 22:21:04 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2237a32c03aso21725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 14:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741040462; x=1741645262; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TIPE161XE6h+XbpKbqRdjbwFF+hmkeZmLDbhV/M2UTU=;
        b=idr66MgQhO5V/Wr7qFHIiVFIbSOr0kfP6PlHwpPGzanehmcXDHj1cv0OsiSm5Q6umW
         jEr5nGi2wHu2jvXiYUpzhwqr8qGa0iBjrnifZlbymdScA92xCPh7Akmv2towORivHST+
         i/s86pIx55vxego4Vsw5LOx2UxKh2rsq0NgNWd1e3fpsQP06MKEj/pvLZh8zsHFvBJL6
         Z04clTqiy/T2OhGKmbg/f0ozFIf5MTJlS9lRXWpkKeOawolKFZtxPXjRS5lAOUKhOvWo
         bRceW8h6J1NkyMFZIxrpvT0yIN/Lj1zZ+Xy2mPtupwroFMmuztvbfJMp+oY6ffyH4x2H
         VodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741040462; x=1741645262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIPE161XE6h+XbpKbqRdjbwFF+hmkeZmLDbhV/M2UTU=;
        b=ixTHqH0GMQZ8srkRulnWCJx2L6OO+/yOhjyzdMRfDSH3rdPpx8M4BtkN3gZcqxVNTB
         yMfl7HGhugtAeu3J8r8+vbmA1RCgkMtwf1EjZXJLFQAwKwli5yp7aBaX7b4yCe6gt5SV
         m2hItBgEU48h7ctwsuMbBhXWKIFP+RKfWxQVsWNcvJcwtmjVCZlNWoLWLIw4QXwwZGjK
         WHIS8HQIF09Cot507b60xL0BOd2NOnoKZcGphWPF5v6HbHy/Vkt+7c8jJ9xMpgOc7AJp
         LGyRYAbuI9X23vd96+YVioCENYJTSPGQlkW4mr6L4dSF4PO9W966D+AzV4h/PunxZtDu
         HOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4qSy3OiSqt+u3eiUJHAb5r7joNOPikr3IBs7+OKMX+x8M/Um2pL9oIFwjehOeAYiEjigKe61ox0M6iiwKBSAP@lists.infradead.org
X-Gm-Message-State: AOJu0YxRwaoqu0xPXTHTCg/Z7JsLUR4dfSlQ7Z4OuA5XOhqEa6qdNJmg
	2Y+cUaYzuqsXBdfIm6H+o5Hx8pxtmP3qiO6OMNMUtOL4U5mUIjwPT6xf1tzncg==
X-Gm-Gg: ASbGncu1o9sbyuG9crNnKpklaSFxSHq+ASkWrEB6hdi8HR7gNk0s5r9dYoUmGW8dFIC
	CqXH3EZkPPN7MA8YfkaqDhkgTR1/GsMonH05a/Ar29Gd50KzLDOIxERmrf11R8mCUJEugAzldw9
	U5Im0zV31Ex7YA57IKz+ymwwJRclE+rOTY0ZuhpFvkwSp7PD9DnfEpOtArk2mqCoqGBP6gKWK2Z
	9pP3SIs8LImMg/5f8nKR/mOZrOPMWmU7+WcOOxdvty/UmdWXYDd37pAoymfwPhhveO0AKxnxSdC
	sFk7es7GypZIO645AiNZQCcVgZ6azxQF7bXrARBK+p+fFrE3hF+CDCETwHMBdjhAw931o4dFHEX
	YqV+6rxQ=
X-Google-Smtp-Source: AGHT+IHFnd6jZyLm3rBh852SMedzrz4n0Ml2vmv/2ld5Rglar/I+rjdCt1PE6PBirI1AmbiL/BJNuA==
X-Received: by 2002:a17:902:e546:b0:21f:3e29:9cd4 with SMTP id d9443c01a7336-223d9e656cfmr770325ad.20.1741040462117;
        Mon, 03 Mar 2025 14:21:02 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dedd22esm7402504a12.63.2025.03.03.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:21:01 -0800 (PST)
Date: Mon, 3 Mar 2025 22:20:55 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Yingchi Long <longyingchi24s@ict.ac.cn>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 03/10] bpf/verifier: Factor out
 check_load_mem() and check_store_reg()
Message-ID: <Z8YrR7p7ikaw0Kpr@google.com>
References: <cover.1740978603.git.yepeilin@google.com>
 <8b39c94eac2bb7389ff12392ca666f939124ec4f.1740978603.git.yepeilin@google.com>
 <CAADnVQKyMx64_mP+u+rmnRGyzVoBs4rViTHeE4_0Rr+Kf3R5Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQKyMx64_mP+u+rmnRGyzVoBs4rViTHeE4_0Rr+Kf3R5Tg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_142103_303856_C716B986 
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

On Mon, Mar 03, 2025 at 10:52:08AM -0800, Alexei Starovoitov wrote:
> > Extract BPF_LDX and most non-ATOMIC BPF_STX instruction handling logic
> > in do_check() into helper functions to be used later.  While we are
> > here, make that comment about "reserved fields" more specific.
> >
> > Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
> > Acked-by: Eduard Zingerman <eddyz87@gmail.com>
> > Signed-off-by: Peilin Ye <yepeilin@google.com>
> 
> Applied the first 3 patches.

Thanks!

I'll fix that build issue for 32-bit arches, then send remaining patches
(except v4 10/10) as v5.

Cheers,
Peilin Ye


