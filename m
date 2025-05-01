Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA768C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 22:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7quJAgqtByXNTdZlZiyaqw3qQ6ApoXnPxA/dYk2LZiw=; b=4L9An0j1R6ItYcrSyFTApwrs82
	CwdTxXSGvfUlyRkbhPqXAYh1kshsFfAFXbXiwoLVPd2KxRy2q1pqEjzRZ/nsml+zighi2n/YnhGKy
	Li2/2JzGmTIKm1Gpyv5AvCGyRKd6jY/pAbEjVbw5FjREam9gDPQXwZZgwjogg3pLKgtoqgLORrYEq
	MO/AZBYwktf9ikbjmbUL4tgtpSvVfPYsK1ZI/Lzt3ZDVhWysY2vbvWPF/v3jthHBGaTVfv/FgkBMd
	A3FBHFKR7mF3eenj9vJspFQxgcZbKq7dRl0A8v5on5X9qrA6jRZxrGYIiRsG09QXYWN63DICkQt20
	Cgslsw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAc94-0000000HUEV-0VV6;
	Thu, 01 May 2025 22:12:42 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAc4c-0000000HRpY-0UaA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 22:08:07 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso2518148a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 15:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746137285; x=1746742085; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7quJAgqtByXNTdZlZiyaqw3qQ6ApoXnPxA/dYk2LZiw=;
        b=COV0Eda5MoomYiO+XIIe+LpNwiogJqp7dsrP0PHR5yRArA1NAFn7BQibkkSK0RDVwX
         qWryBwXMCtt0jQpv/yJSJafkL4lSqS+Pic+YGn3Bl+VSf693uLFlSytPl+lSRV0z385y
         7HpGB2NxykWuDUkCYnbSblcf0IdTbaV0i8VA7ChP5He+wm2TcPIOPc7JFRf59HcBVNfx
         +/+jIDVv0BMUfrxOyDLI7hbfP595dlLVzIoCEqZOvjxl0QF62/zpTatZycFJ8+F5uD3P
         LWSmXK0uKgxZKp543+4bZazuBMgt/hHwDeIXjwu82Ynhql/oZEYQ/urdxBjejYmr+5bR
         gyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746137285; x=1746742085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7quJAgqtByXNTdZlZiyaqw3qQ6ApoXnPxA/dYk2LZiw=;
        b=aH0iBTH06mZgXUO2JDvnlKMYzqOiJYeDe2uGqr12tLKwc27GOtoZ4h96JLAYJq+rZd
         QPpBF+4aa4n8vqFkCOTtf+EHTRviSeCyIsSSQWTqjTaFFwQxiHIBRFA1ov13PwWaWgaW
         fMXA1+LPVSrtXNddB/O2Rq0x6cMcfEGNqtq22OZg2cBTi0EhFezR1+zOsQu8xU4ST6vE
         ybyTlTESFYpYCEjVwRNFDjzBJ7HCYlL+pYFSWOlWOU+iWUIZ9bBQ+4XpymLdwsl21Z52
         Bms9AzSZ1NBh/3eu8kFP4R2ohpc7tRWFLt+eSF5rAH80puEQxMWJakpy7dDxgTC395AC
         Ke2g==
X-Forwarded-Encrypted: i=1; AJvYcCVD5VzHUlUHkW3A/Bgq6/UMzvSgBoLC6ukhKqBEpxQEbtp3J2xttN9Q65SQ+eZQ1/IpGqjaYNIY7k8VAMUkGnqe@lists.infradead.org
X-Gm-Message-State: AOJu0YwcU5sm4nuO5I94/u+jtbGqt9JfEa56croEZGGPOZGI/g2BAEHE
	Ni8WqJLXfrInLuqZ4Z2HMaBH43TaRk8p8M5Q+95kZs1fTZzxxJZ0MH0I7LWFbnrOYGr0v6/bvaO
	/yLO4q7p6MtBjOaxaLheaZRA4qv8=
X-Gm-Gg: ASbGnctS4onKgH5ZpFB4t6nP+NAjGgaurpojq49WuZbIS0StdYcYIFYvggJQD6ScrfB
	V5PAcRnvidsYyL7MhMrBlLXuZfHSXAAUiIcOfsRflrSr2USzzA3uxs+LqIodHQx14YGSp0AO9kF
	0tgGUCBnqYnxnmgPYkoHClTk5kZQJCHfzy+7ZIPTA3JsQ=
X-Google-Smtp-Source: AGHT+IEpCphxCqMgTrla7wQvz59TQTpY+aaLkW8rSW5jI9j4mNhEMH7gT93PVUghkBIu58Z86lHq44KdoKbiLLlzMQg=
X-Received: by 2002:a05:6402:27d4:b0:5f4:5a6d:20c9 with SMTP id
 4fb4d7f45d1cf-5fa77d559e6mr348036a12.0.1746137284554; Thu, 01 May 2025
 15:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-5-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-5-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 00:07:27 +0200
X-Gm-Features: ATxdqUG83OGzyF1YRlc-RZCuhJkMxQqfI4mWekVT0IBHPEfZLUOvcZSUG01W9MI
Message-ID: <CAP01T75Eg0EA5jmVQs=FFFbkpZPP2rHS-HTO508rQS5CwC2h=A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 04/11] bpf: Return -EFAULT on internal errors
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_150806_163532_F8E655AF 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

On Thu, 1 May 2025 at 09:48, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This prevents us from trying to recover from these on speculative paths
> in the future.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

