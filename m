Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3A9C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 22:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIT6WcUwyEo9KeIbj3Ovq3CYT/DZpCtGV9L8fkEOb3I=; b=3n9iqlU+sGf2XSRy733y0l5IPa
	i3T1DIQlHbJ12beRzFwjLPdavdtZyrkSwf7dxk7VNeIgFhuXycn/jMbisptsv/R1ZNmJAR46x2AdW
	S9MyJM4Lpib2VHvsWiIGE6hoE1DlToXVAwL5kBbq5c6vNwVnfOuE3BWc4cFDwLkXaJP+HWaCYp4m2
	Na8Meh5bZipqBt0tTKe3brxxTQdoSel8nJOIcYWuL/v3jfuqCihnveLFZcfPdWSs5StJ04w5ukPml
	OTylx9+IAr6xTULPG/oS5w0sH8A24EsiV8LEY9l3VK0j+DLkH8GK+yxFh8OCgYf6WZypJugoHoef8
	knT+Liig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdGP7-00000007rNn-2jG6;
	Wed, 29 Jan 2025 22:19:25 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdGNk-00000007rIq-2I3v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 22:18:01 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-219f6ca9a81so14865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 14:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738189080; x=1738793880; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QIT6WcUwyEo9KeIbj3Ovq3CYT/DZpCtGV9L8fkEOb3I=;
        b=4TNh9+bYiX8aME+ttSJ9QtqhLL2OUGMbp33UyeTD1Dkyhv2ELv1PQSgZqJnb918O8t
         W1PkElKdb4I18Do34dDG3doi+lmsCOuGK1yxUku0ojp4LjO7LV3rhu51x2eiKp6Gprm9
         Dv47ttyMd0dce544Sj9oQvJeJ0rjH5AJcW9WggCmxTflLvcCQXbd7f4oKyby3pjrFeB/
         n4muPESsl/SGeDCI5JaMSO20tSpoBGrm3DJy5o+sFq6M4UEJFw43xFwvuQr/kahOwLwI
         pY4RVxSBNTG7TMByrbbX9y3IK7jp2BkrNTvBj7JtLBFGBghiS79P53Odyb47y7y6Pw8Q
         BAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738189080; x=1738793880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIT6WcUwyEo9KeIbj3Ovq3CYT/DZpCtGV9L8fkEOb3I=;
        b=furXixs5jYqz6kSTN2cP7enfrcMNCXg1IFWh4GxWYQeQFdSWustIuIdtKLYl1lIS44
         D7CXtNvaC0mibXclA2rIaNova5iTMzN9ZMHmZlf+xPnM1FHcNqiY/ce9ww42BADzbk4M
         +QPPLGoEKEjL90GbFwiNf+xug+Q0+eIsc6hF/+nDtfxn8QaMER+c2mVyIO4C6kYN9NzJ
         fcu5131v7iV6Oo2iA5KL18gumfVUOmpjYh0yifa+aX0VhENL47I6sPx8xjwzsdZsb9V2
         e2s5lEDaNZeu8EZrB2oJ9xRqTmZ/PCcEdOWVJUUEYARkgMzrg5arRZovcpPVZTyaU/yR
         EA8g==
X-Forwarded-Encrypted: i=1; AJvYcCWjp3PkEIFsvTy2v0L0Xy9u6Pwh+hRqMdX/JFQGZPKUmMMXq9Pf/479YaSA3gyO38vqWDs7qz1OUUagWnF3lp2F@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0032k6IFo+Yv/taoJEIOBgEDSpT1YyeHvEhGfHFb5GG9AeILA
	D2/X4uQD7Y4YdpxmXLmdpgXoqJQH8iedmVoca07S5L0N+ptHUDq09sZ4CCk1OA==
X-Gm-Gg: ASbGncswvnfAR0W/DPoaHA9oo78Fp9YG17mECI2DvsdGetz0jHXcw9z9qAR37UEUb4b
	BP1a2VKaXRFgX7q/ckX1yicofZ9ukEdbwkh8PlCYM+luRYINzRyvgwAgQeFIBv2BjSYpws3oMbS
	ofQAUZqvDd6K39djXcqngmsnClNmI0zD313CufB+b08WuGxy9WD2j0eYdSQJ6lVoqcWLHJo9rJr
	/aDuwSRgswhDBhEft2BDxOL4zChH6SNSXR0fDjcuti2L9mWekt4G/W0W/XYXaIuzcBz0HIOcQzp
	Bc5I/1WXIiWo+X3sv+YitIwsb2Lio2olxulRce1o+De3zp1PzBM=
X-Google-Smtp-Source: AGHT+IHvBIEyFxy7JJRMnJGTsrg+dQOmuNpHdUPyjnzFG47cwFd2UWayuxvRdqP7ClKKnvOhwvLWAw==
X-Received: by 2002:a17:902:7c87:b0:215:b077:5c21 with SMTP id d9443c01a7336-21de2467d36mr776695ad.26.1738189079445;
        Wed, 29 Jan 2025 14:17:59 -0800 (PST)
Received: from google.com (55.131.16.34.bc.googleusercontent.com. [34.16.131.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc97d25sm2363395a91.5.2025.01.29.14.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:17:58 -0800 (PST)
Date: Wed, 29 Jan 2025 22:17:54 +0000
From: Peilin Ye <yepeilin@google.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	David Vernet <void@manifault.com>,
	Alexei Starovoitov <ast@kernel.org>,
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 3/8] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z5qpEkXq-X6ci9UU@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
 <f5b72fa9460e4eda6e6b36756db855bfec67744a.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5b72fa9460e4eda6e6b36756db855bfec67744a.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_141800_586520_F4914C5F 
X-CRM114-Status: GOOD (  14.35  )
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

On Tue, Jan 28, 2025 at 05:30:19PM -0800, Eduard Zingerman wrote:
> On Sat, 2025-01-25 at 02:18 +0000, Peilin Ye wrote:
> > +static int check_atomic_store(struct bpf_verifier_env *env, int insn_idx,
> > +			      struct bpf_insn *insn)
> > +{
> > +	int err;
> > +
> > +	err = check_reg_arg(env, insn->src_reg, SRC_OP);
> > +	if (err)
> > +		return err;
> > +
> > +	err = check_reg_arg(env, insn->dst_reg, SRC_OP);
> > +	if (err)
> > +		return err;
> > +
> > +	if (is_pointer_value(env, insn->src_reg)) {
> > +		verbose(env, "R%d leaks addr into mem\n", insn->src_reg);
> > +		return -EACCES;
> > +	}
> 
> Nit: this check is done by check_mem_access(), albeit only for
>      PTR_TO_MEM, I think it's better to be consistent with
>      what happens for regular stores and avoid this check here.

Got it.  Unprivileged programs will be able to store-release pointers to
the stack, then.  I'll update selftests accordingly.

Thanks,
Peilin Ye


