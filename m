Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E51C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9FGoOFxXhMGTP5ls91WbfqbKMEzNeTHiP62ZYlEVbw=; b=38Z58iaKQWa/8BCmpfDOCvVhtf
	zd9VcreE5C07S1K2KCRDg4PJBYtfahQWFv0aQADxSSfADz61sY87AuU2czDyhEhkTwCXUE1aPpQyw
	tt8K3NBbigYw2i4fiCcTqw9gRYuSRlmbIpzX8LV6J4qClPW4LR0DB0VxpOa4C0JwigBNkCG3UZSe4
	4epNvCI6Dy3y2Zxzvtm8Fxqi//nADBmkvMCWYdeNG9qIXz1HLy0ve6KqUr+l7U/ukIzIPCv4V5zQx
	k024cYmRshygr+3ZytA86RePhj8xznPwWCmVodwyPtC005fcQGVfVJ9KkJYJP0q/D3I6ahhpDFJWu
	WI2FaS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHx-00000004msF-0tKI;
	Fri, 09 May 2025 20:25:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDR9E-00000004O3P-07pm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 17:04:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso11564005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746810270; x=1747415070; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9FGoOFxXhMGTP5ls91WbfqbKMEzNeTHiP62ZYlEVbw=;
        b=eiIrebUjy24L+V6KnLRy12jwSfQePu0WkVFntlpESZCxCYUsblohYZ5yrXcVmYas6H
         9rR782BdvG5csbXKBpP4EflZ6UZH7h4Ng0WYsN19zl09PKU5xrQp88j8z0Vo0O4hoYyt
         XU7UghKydHISNCwjhPyKdN8nV3m5Nlj5l2JgD9tvMIu46ALnK3GDFa4e+0sK0rZS1vgB
         Js6os/5ZkFhEM59J6hAUY2Dbs/35E/oFa20HfKNE00NJ+UCq04H1kOoqeCYZ8/wKYtBp
         qyaEelKYMz3l7uA/tgX5yEsfgzQ7aBerkKeoN7XKrvvsTYo8MjYGWyTPaZnHNEyYSdM8
         MMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746810270; x=1747415070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9FGoOFxXhMGTP5ls91WbfqbKMEzNeTHiP62ZYlEVbw=;
        b=uRXAzvBgEu4YAs7AaMdUYkWTViJ+eJM+HVJmVwrTCJvDmYsH2iLRhSUh52in/S88oe
         69jAHmbKxAF6Yr6E9y1coSJ74wlI3WQNEamhfuoVpyRtCWqEaFsjaR1DR9IDEeC3WWJn
         7A57fkQt3lv4qPhhsgMu+tNSoWqLIf7LFSUqkAD2hyKuWhU0fI8aGsphgUi+Sw7jFqNP
         W42RFGeIWSBxAS2Uk0/xENhCKleDDOZU0oJNuyERYsMDxRp6+AMg/UDTzHvDir9J/xcz
         7XJhMGL+7Fl5x6pVi6UAOjYyz7/ndjqlH887aTu5UwSscsb8CyzqMV5X5hLJNxvUpWfm
         e80g==
X-Forwarded-Encrypted: i=1; AJvYcCXUa5rEgKrVTN0TSn5Zuyw4j+VHzNlNhr5X7BVaUxIPSlJkAc/auGyAj3Ok/xKxWj82v5jtbTf9L37+NToN8aSs@lists.infradead.org
X-Gm-Message-State: AOJu0YwfNPSXN6Z0UWzVAaUBBJpwtJw6OlB1MPlEy92iD2e9l+XZDDZi
	n9V8pVOfVS+MArkmSZfEUrWZP6kEAX58vzXjmIJQ0W5hhGEEHlkNqkG5r2a0GRs2lfLAVw+JpAL
	aj2hFmMRvSZ7OljILPTcpLg8Rw3g=
X-Gm-Gg: ASbGncvYCXeNVumoPufoNx5Og/CJVpxfKGd5sK/1H4xiCus4za+YEuWTadIMeL95UZz
	29JYXfFAyBJAvyGoqpQT/eCkakrx5fjPgDmQfKv0QfzKJDmuqbnvEj9cp0tsdLG31e4lBYmGG4u
	/BoTswjDEgYKt+pFcvr9w3OQZ4tSmQHnD5ykPRFQ==
X-Google-Smtp-Source: AGHT+IFnBYqhXbjNCF8NTXyLF6urD2/hEu6wcbrtnXUvS6VeJLvXHUVn+vYN/eT8TSsjCML7ULcEftXd3SA1OPWI14w=
X-Received: by 2002:a05:600c:64c4:b0:43c:fe15:41e1 with SMTP id
 5b1f17b1804b1-442d6d18bc6mr39356315e9.4.1746810269524; Fri, 09 May 2025
 10:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250509122348.649064-1-skb99@linux.ibm.com>
In-Reply-To: <20250509122348.649064-1-skb99@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 9 May 2025 10:04:18 -0700
X-Gm-Features: AX0GCFtGvd38TEcBIzgZXpP366MKGCZNb_SZxydI264Su3mUoJ1EjhzLUKYHED8
Message-ID: <CAADnVQKBQqur68RdwbDVpRuAZE=8Y=_JaTFo-36d_4vr2DNVyw@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: Fix bpf selftest build error
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Mykola Lysenko <mykolal@fb.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_100432_064616_449E3C36 
X-CRM114-Status: GOOD (  17.76  )
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

On Fri, May 9, 2025 at 5:24=E2=80=AFAM Saket Kumar Bhaskar <skb99@linux.ibm=
.com> wrote:
>
> On linux-next, build for bpf selftest displays an error due to
> mismatch in the expected function signature of bpf_testmod_test_read
> and bpf_testmod_test_write.
>
> Commit 97d06802d10a ("sysfs: constify bin_attribute argument of bin_attri=
bute::read/write()")
> changed the required type for struct bin_attribute to const struct bin_at=
tribute.
>
> To resolve the error, update corresponding signature for the callback.
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/e915da49-2b9a-4c4c-a34f-877f378129f6@=
linux.ibm.com/
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>  tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools=
/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index 2e54b95ad898..194c442580ee 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -385,7 +385,7 @@ int bpf_testmod_fentry_ok;
>
>  noinline ssize_t
>  bpf_testmod_test_read(struct file *file, struct kobject *kobj,
> -                     struct bin_attribute *bin_attr,
> +                     const struct bin_attribute *bin_attr,
>                       char *buf, loff_t off, size_t len)

You didn't even compile it :(

Instead of fixing the build, it breaks the build.

pw-bot: cr

