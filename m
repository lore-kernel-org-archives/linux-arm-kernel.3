Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C66AC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 22:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2g5LjnoCgSVPYj+V0KyZ1ldqlVr5HdI2cHTBekjJ8s=; b=s/tLM5rpZWJFN13ugaparGBgjv
	bqGm6owDOIoRxcUs42RfRFlqO9ByXzpWmKsKGXEeYv6VfLPNAR799APAa+/2kiLKEd1bSuf+SE8V1
	qPa4mjHisxgzAHvDHxr9lHjWYPbaDxOhw611mpBlnXXzb8V9h4XrUU7vNarsPXgg1bW14ykTeStAj
	bNsPA+WuvF+GjT3dlygaj8T6Woffuk6wbdxJXGWTYYn85nHqutXfWjQEi9kyo+Vvd5wKcm8xfZa5V
	K7gkOGABGzejYT8j9j3Ljp0sWne85x2tm38TDBUOCjlRTOmfuDYLb3GoeIOLpqhMR4ZVf5NR/XdbB
	qi5d9mHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpE7X-00000002S3B-2WNQ;
	Mon, 03 Mar 2025 22:18:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpE5x-00000002Ree-06xn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 22:17:06 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22342c56242so52925ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 14:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741040224; x=1741645024; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y2g5LjnoCgSVPYj+V0KyZ1ldqlVr5HdI2cHTBekjJ8s=;
        b=LrVVq+jK4pcZsPdj24QCIR/a/Yelv4iqfWW7MuudPIki06MxhomxB8QRUp0DER4yUF
         eJ8KtlQ8KvLl639gF/AEs0sLpmQF91R9rCWSmUdqO4GiMo8KzQAKzXU0zOtIOGiqIqkr
         7Ey+0SBWUTrF8UKsOoJw+WfznTxywIqHcHpAyg/MKI4c+1YNPeVxbD7fSHF/z5/qzpXC
         MxnERyk3KVS0tYguOudxkHQ2symcwM5lmvbSYF0ir89OFVcznaR+GaEEujX2RSAlFyT9
         G2LGR2AEMCr5u4rdFgvn0bwITCDsEmqiUosYkvAt/qXhvNaJdaYS6EWCZoHAHauaes7n
         A1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741040224; x=1741645024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2g5LjnoCgSVPYj+V0KyZ1ldqlVr5HdI2cHTBekjJ8s=;
        b=DhAEHmaV/3Dklne2HA1k/O8tOBktbtL+cjy6x4sxjfjWXDumeeXxy9pcj3N7hPSkXh
         XfJEFWcYkVF6WfAck+D79tCeLlRzNPr88+2+Yhi446qSCHIWsLj3GHDCaBnEZwfUC5qk
         a5szvwrxyfTL0AZa61Vmx+j4ljEnTRyqCtRNI/VJJJwYzC0PO5YhHoaWHq1FZglGAA2o
         D5W+uwW4nae8My5HpNOWUVGQpsLPIXX/r7CWOb7hA+XY8yYUUkw+JpNhJBQAk+WV8hMl
         OXQEY04uS5jcwOEFX+D7ZGoJMnAEMClhAS88kVCBY1zJMp4niwzTUjXq08KuFVf5mlNt
         xKvA==
X-Forwarded-Encrypted: i=1; AJvYcCUygfytEpAJgvAE/fwk2dur62PAReB2+VS1xsviXywJeb+EJP9AmcoLj0oqBsFN2tKEXvR9OAIEvEvTNb1ncg13@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+U7A59lhVq54a8gxFx3tfGnGkv+meXNvn1FSHHyhJLzEiLBte
	b/URWkwUQBgP3LSWg+qccUn1Qwn0rmhjPud/bqBF1Q1hdNoo1h1lngGM5hrH8g==
X-Gm-Gg: ASbGnct+i/n3d9R1RpuG6mGbIFvwp2YakEBs2D86H6dPEwpjSP7DeZ1JH4EPTdgPmgA
	Bks8aZlFupbzKuoTCq+9FZuwk7OaCLNX/1KNOFHUVtYJQ3EiOAUkYA9lK6bPQKryeCqCxTdVhHo
	7ERMaBveyZwv+9aUNIDqpzTjMeOD7L9eglNw3CLVC8XQl9UQ7UgQEf2KQVDylYWosoOhfma+DdE
	oVlt1Wgjd6vLeuP2SV8Ulg/nsMIr4I61YsgsfJ1X0SQYtFjz8XCLqQbP38BDSnA82zLYkGdwQ3n
	5HPwzveTpTUCfU9xD2SkFu3PVA/d2/Y8FVDE905ez1+f/d2ftrGOUJvUVVwDF3/XARO1OKzUlXa
	WnjxD7QM=
X-Google-Smtp-Source: AGHT+IEoTfo4TNw4P4ewmD3fmkA6z28ycidagkXgXZhflGUxyOEfcxd5Zz7ComAIMQ04cJm1JLLsvw==
X-Received: by 2002:a17:902:f7d2:b0:20c:f40e:6ec3 with SMTP id d9443c01a7336-223d9e6616cmr720025ad.22.1741040224035;
        Mon, 03 Mar 2025 14:17:04 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734d444a9fasm7386454b3a.60.2025.03.03.14.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:17:03 -0800 (PST)
Date: Mon, 3 Mar 2025 22:16:57 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	oe-kbuild-all@lists.linux.dev, bpf@ietf.org,
	Alexei Starovoitov <ast@kernel.org>,
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
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v4 04/10] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z8YqWQuyArxCQWeD@google.com>
References: <2c82b29f3530b961b41f94a4942e490ab35a31c8.1740978603.git.yepeilin@google.com>
 <202503031631.OeUhVRHz-lkp@intel.com>
 <CAADnVQLLhNRmpjwDYHB0-59TDrGcgXzqSkop+-5eHYsG-Ws08Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQLLhNRmpjwDYHB0-59TDrGcgXzqSkop+-5eHYsG-Ws08Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_141705_082070_D2821A15 
X-CRM114-Status: GOOD (  13.05  )
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

On Mon, Mar 03, 2025 at 10:43:07AM -0800, Alexei Starovoitov wrote:
> > compiler: arc-elf-gcc (GCC) 13.2.0
> 
> ...
> 
> >    kernel/bpf/core.c:2228:25: note: in expansion of macro 'LOAD_ACQUIRE'
> >     2228 |                         LOAD_ACQUIRE(DW, u64)
> >          |                         ^~~~~~~~~~~~

*facepalm*

> Peilin,
> 
> how do you plan on fixing this?
> So far I could only think of making compilation conditional for CONFIG_64BIT
> and let the verifier reject these insns on 32-bit arches.

Agreed - after searching for "Need native word sized stores/loads for
atomicity." on lore, it appears that we can't have 64-bit
smp_{load_acquire,store_release}() on 32-bit arches.  My draft fix is:

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 323af18d7d49..6df1d3e379a4 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -2225,7 +2225,9 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
                        LOAD_ACQUIRE(B,   u8)
                        LOAD_ACQUIRE(H,  u16)
                        LOAD_ACQUIRE(W,  u32)
+#ifdef CONFIG_64BIT
                        LOAD_ACQUIRE(DW, u64)
+#endif
 #undef LOAD_ACQUIRE
                        default:
                                goto default_label;
@@ -2241,7 +2243,9 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
                        STORE_RELEASE(B,   u8)
                        STORE_RELEASE(H,  u16)
                        STORE_RELEASE(W,  u32)
+#ifdef CONFIG_64BIT
                        STORE_RELEASE(DW, u64)
+#endif
 #undef STORE_RELEASE
                        default:
                                goto default_label;
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index dac7af73ac8a..d0e4c6bab37d 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7814,8 +7814,16 @@ static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
        case BPF_CMPXCHG:
                return check_atomic_rmw(env, insn);
        case BPF_LOAD_ACQ:
+               if (BPF_SIZE(insn->code) == BPF_DW && BITS_PER_LONG != 64) {
+                       verbose(env, "64-bit load-acquire is only supported on 64-bit arches\n");
+                       return -ENOTSUPP;
+               }
                return check_atomic_load(env, insn);
        case BPF_STORE_REL:
+               if (BPF_SIZE(insn->code) == BPF_DW && BITS_PER_LONG != 64) {
+                       verbose(env, "64-bit store-release is only supported on 64-bit arches\n");
+                       return -ENOTSUPP;
+               }
                return check_atomic_store(env, insn);
        default:
                verbose(env, "BPF_ATOMIC uses invalid atomic opcode %02x\n",

Thanks,
Peilin Ye


