Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC45C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTzXTB5/hI3k/tUV1QdjmWKVi1pI+jp0+a6jtCFIsMQ=; b=PmI20JwyxpydUJOoDeQFw+XdTH
	oe38N778IQ4/0x0i29/AVHRLRw0xZuwGmFGRROp/Ua87JVpt9Urh23fhWY+dIIDbAM1fcUtWmNYFN
	CZMOpXzITM16KvGRlDJwacCypz7x6gN79u3Yzhxyj+U0ZKrLBn7qNI/sa3AVtJc8b0W1WMW/GiOWS
	34UQ/7a8VVwkQNPhDedeff5aLH1kwcf3xfFbg9CrUWxSMa0FYjVgw3qzVoQbbbb6IEBHHySkmZgH9
	yJ1UgHc9GwMtiNztpCHQDp3AktuLlcWIVuGcdm0wqaC6kNshevzVVB4N4xrNDiImzPdSIoXU0wBJg
	5hRvq3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqgky-0000000Fl1t-1NCB;
	Fri, 07 Mar 2025 23:05:28 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqgjL-0000000Fklm-2hkw;
	Fri, 07 Mar 2025 23:03:48 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e8fb8ad525so18824086d6.3;
        Fri, 07 Mar 2025 15:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741388626; x=1741993426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTzXTB5/hI3k/tUV1QdjmWKVi1pI+jp0+a6jtCFIsMQ=;
        b=QrB/NDOjKWM2PoOaRPpZwvhqAAT4Mn8dh6mfnl2G2xDGk1JXJRbc2M+hUrl9rGc2jz
         GA67yo30e2oU8JhmgJm+Npf9F7PefBuisN6jTh/itpQH6JaRqPA43IHzedfdZOrJTAkp
         etaorUQLsdDXOXFm669JFoZtBY9Kpob0cUtDSuSU2XWGQX9XnkQkwmlJHSFKOuSv9Hzh
         nFc4w1+SQqEsCpyM4GX39hyymVVw3nnug883QtcFrUUWjdsEMgqBDJdA8OPSEXi22k1G
         1w5sOmUOlj6g3oaSs/uo2nremKYdQvVK2pcgCKrVIi97Sk+ctKtF0Gfh7tdbyTDpfPru
         bN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741388626; x=1741993426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTzXTB5/hI3k/tUV1QdjmWKVi1pI+jp0+a6jtCFIsMQ=;
        b=j1mF7fSBi28mOk9w3yZ+foGLkXrP+zWx8gSw717FAYJVpai24l4rgy8gg8QFTYCi7I
         dl7dC1rRX6Q+5/pWDwtB8guHiQ19fVvoGIuTffxV2Kh55P8rKIaQDuEqfu4vSxLQYKtF
         ONNFBmNG2FzxpjiwgZUCQe3tbyyTjO+bcn4ZZfFfsYTy2cT2+AMAWIaQIlJ2xD0PhEIE
         ad3zWtN5F7SxqxNoVqc7F1BsIv0I7Iy4nIQ3ONe5gieOVnLXxrFDbIyrr4j3iex6LlkZ
         4LJmM/VQAYglAzmU95VrE+WKN7k3xNVTDCZiYQbJkDId+0AUELfl/Vf6k5JJTg3SmAc8
         U5dA==
X-Forwarded-Encrypted: i=1; AJvYcCWiCPbuxNOlulEoO4MQKnIvmr0fCdNsEFM6T7tMSZiQ3D9erxj3gyMOjMnWtd+J1dd9Ft+WTzg8FPyKrbgF3LtV@lists.infradead.org, AJvYcCXsExnMcgwYp/qwvRz4fWMXYh+u1CUUccKF5awDCuxgi0JBwTXcKM88Uf5tBmFKEsdVKwkyOH94hkXfXTwIkk4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHBc02iyalezKbN7P5vcPKUL2ayi3w+/51M2yAut86Fr11a25I
	UqmXtj1F5G4wLmVfwJxtSyWs6N2smhsKysdBYBYrppTvPy8TD9G+7FSp4ulplg7qpHiASHcNYdK
	uZEQyxzdfHJk5m5aayTxOU/EtxnM=
X-Gm-Gg: ASbGnctRIFtMwXXOvSBlI+MMwtXZS4dL885J9dC7Aw+F7D/Tq/j9wuoA5YUJq7LPLB9
	DdOdBWWXtmnKo/yE7M4VjDfghs0ZpgM2LMZiu9PesIiLiW/R8jHiKcyzIcRXvRXytly+bQUMLuR
	8spSc8g5kPpUgmi5lzEYYwAAd0rpnP92BKjwa4WuPMsg==
X-Google-Smtp-Source: AGHT+IGuZ0NkG/KYo9Dv4g1oyD3XwK6X16DBM6QY/A6W3C/6eEhj7vqNq1AeDarxJvsQFObtM42FXnLLMg29Plyo2bk=
X-Received: by 2002:a05:6214:2aa7:b0:6e8:9e9c:d20f with SMTP id
 6a1803df08f44-6e900621afcmr58352476d6.21.1741388625281; Fri, 07 Mar 2025
 15:03:45 -0800 (PST)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
In-Reply-To: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 7 Mar 2025 15:03:34 -0800
X-Gm-Features: AQ5f1Jr_FBnz9qk1uNlckq4_7pHKTqldI029tYPnmq326QX8Uckh0mZErYX0PQo
Message-ID: <CAKEwX=NfKrisQL-DBcNxBwK2ErK-u=MSzHNpETcuWWNBh9s9Bg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris Li <chrisl@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Kairui Song <kasong@tencent.com>, Dan Schatzberg <schatzberg.dan@gmail.com>, 
	Barry Song <baohua@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Casper Li <casper.li@mediatek.com>, Chinwen Chang <chinwen.chang@mediatek.com>, 
	Andrew Yang <andrew.yang@mediatek.com>, James Hsu <james.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_150347_683402_193250A0 
X-CRM114-Status: GOOD (  16.05  )
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

On Fri, Mar 7, 2025 at 4:02=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@mediatek.co=
m> wrote:
>
> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system. The
> main goal is to separate the tasks of page scanning and page compression
> into distinct processes or threads, thereby reducing the load on the
> kswapd thread and enhancing overall system performance under high memory
> pressure conditions.

Please excuse my ignorance, but from your cover letter I still don't
quite get what is the problem here? And how would decouple compression
and scanning help?

>
> Problem:
>  In the current system, the kswapd thread is responsible for both
>  scanning the LRU pages and compressing pages into the ZRAM. This
>  combined responsibility can lead to significant performance bottlenecks,

What bottleneck are we talking about? Is one stage slower than the other?

>  especially under high memory pressure. The kswapd thread becomes a
>  single point of contention, causing delays in memory reclaiming and
>  overall system performance degradation.
>
> Target:
>  The target of this invention is to improve the efficiency of memory
>  reclaiming. By separating the tasks of page scanning and page
>  compression into distinct processes or threads, the system can handle
>  memory pressure more effectively.

I'm not a zram maintainer, so I'm definitely not trying to stop this
patch. But whatever problem zram is facing will likely occur with
zswap too, so I'd like to learn more :)

