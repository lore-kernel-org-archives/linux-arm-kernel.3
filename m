Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D62C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LARP5bmG64wd0GpLVR0nEMY/+zhPU+0Nmo0aQ8UdxmY=; b=i79ylMksTGGkZqZGdDVHsN3Q+r
	vSftMoVKZA90oKx7hMA+YDZ2dDWggdyr+4QsDdMAoneRGNSxD9IVrwnXEfoMu97rsNbA+XkkhZeDu
	GGyhBFOhmRUOKa1Bk5TxGzm3HE++K9XT1hCsgKqNvJG3mL4gZNEjyehWy49r9yNymSyDew/OFfbNi
	HGpbTbGt3PMFBrK/x7ps36q3Qix/B0rU1cQl40PH8pXvcAj4OpUQ/bBtMlYVSmYB32eYz2LbiwPZ1
	OYoE5Nk2rgePYcynwXFIY8HGpjB4ATo/s6og86o8sB8+k1ZrhvsNkLoQViRwwsHVMeZtifU8ARO2o
	5XnQRsPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNEM-00000008OiZ-3IcV;
	Tue, 18 Aug 2026 17:04:06 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNEC-00000008Ogh-2JdY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 17:04:00 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-ca80d708489so1004299a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787072635; x=1787677435; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LARP5bmG64wd0GpLVR0nEMY/+zhPU+0Nmo0aQ8UdxmY=;
        b=Qvy+Y0Xadplgvs6z8Qrm84qlO9SGtrmBOLfDz84FWrvga2I88zaL1cHBkh7oKoxkCJ
         u5qHR7ZZyGlx3uwx5NvzgTNXCgYXGKVhxRSseAObz2LCzBzkH+2V0eJWRVShZ6Nn/CsT
         tm4+F1QUqBN01DO4eHlJ8n/oVp6clUN7L4VwT4m9WLcSuNIbeF6mtlNx8fVSW9wu5cgH
         AGhlBXwnsQUKGkSeroiDbVXSgun+wUN6ELYEft2HgbTOMED64aTqNQOrUcpMAhxN8kzu
         /wj23fD9otJuLbwNfqVrih3Ut5ufl+iAUF1CYSzQU4huhmLX7iZDY/d5XNIABIbC60yW
         3CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787072635; x=1787677435;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LARP5bmG64wd0GpLVR0nEMY/+zhPU+0Nmo0aQ8UdxmY=;
        b=JS+AghGv3kMbKOMNTqZtTj1l4cV8MR0oLmpQNWr6/AA+NG+ri6ystcps43r7vEkSzV
         CBUMpbkS0AxFpSv7KDN9CHh1qBaLEBjwff1IybTMiaoC+yckzNKnWbzJvVZ+zWuGuWoZ
         kqDU7t3GQ1+WH9a13JNESCu0gLWo9/bEmNkgyVRTZl4uSwPys6XseaLTQnroeT90HjQB
         AsC2DOsy4yhQDTVFWg2BYHNfZNhFkk1B5aTwOAjfLE40ErzaCcBC1mGgVwK+F41MgN3/
         N6Gk7dCVeohxMTPP2+S5jqZHWdYwQm7cLOeGWPW01Aur8Uy2JCCsHHHLQ97aZfogOpN4
         f9dQ==
X-Forwarded-Encrypted: i=1; AHgh+RraBAJKxig0NKTSxxt/PLfbnt8FbRTtfj6Wt94LQ9uWvvReTICz2aRCxU9lC4i319pu/miToko+2qQaXr8PQSJo@lists.infradead.org
X-Gm-Message-State: AOJu0YyO0lnRX7yo2GKiBfzJWy63KVGeAbUTVwWMFXvjtDgeISEKPsCy
	4Y4mW0aP4RqnZy8BG5ExM3aawbDlckhMdcfQPbJ9vmTYjny1u9BQOxWf
X-Gm-Gg: AR+sD12Tv5j5cU3QW1Wjn78SsBCLuc6L7qK1qFmNtuz96Q1VxDHKJ9glPG7jasPHIdf
	hPi3VWe0oxOel3SqVYePOGvpXQdZXGTPy35yM2RcCjjC4zXw9eQp7J57oH0HZkPJ4JwzcBRKmkS
	ank1qOVB4nz+EAtpfTf/D0eMYA3lDluSHLE2oEUEFnaJp/XMtGA+b6SHedJf7TYCWNDpIkSTV1U
	aDGZyYf5xNKBh2/2I2mJw1qFO9QEb7kAtqyUzMP9hqDCrJg716mlw3XilkODVcKNvjZg9iYVhT5
	ZPJCLpHzalppQ2XXoiQqOd7Y0Q9be27aD5SdiKXzXMUcW/IiQgK0diPismC78X20qmE9btA/8Ol
	6hHxEdyM9Dr8L/QfacaAJD2Ux+EsxYO6DRm0wp9sVvHODMM3NXNa/ls57zyNGpVnREbZzJ/iw+9
	XV+3lHs2OwySKf7kLY46JRPs5vQwQnk3BaQP4DQo6g0jABMycX9Eaesv9xb3Cz9DZ+
X-Received: by 2002:a05:6a20:2446:b0:39b:bc11:9ec5 with SMTP id adf61e73a8af0-3ccded40c3emr7581611637.13.1787072635279;
        Tue, 18 Aug 2026 10:03:55 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:56::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c0445c6sm2311742a12.32.2026.08.18.10.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 10:03:54 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:03:38 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Netdev <netdev@vger.kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Anthony L Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	andrew+netdev@lunn.ch, Saeed Mahameed <saeedm@nvidia.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Simon Horman <horms@kernel.org>, magnus.karlsson@intel.com, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, witu@nvidia.com, 
	Martin KaFai Lau <martin.lau@kernel.org>, yoong.siang.song@intel.com, rohan.g.thomas@intel.com, 
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH net v2 1/3] xsk: align TX metadata layout across ABIs
Message-ID: <aoSQWPGrYEBfZUnP@devvm7509.cco0.facebook.com>
References: <20260813190800.222527-1-sdf@fomichev.me>
 <20260813190800.222527-2-sdf@fomichev.me>
 <06f8153d-2156-4e7d-9d49-006db4b2cec4@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <06f8153d-2156-4e7d-9d49-006db4b2cec4@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_100356_591884_1942A271 
X-CRM114-Status: GOOD (  24.19  )
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

On 08/17, Arnd Bergmann wrote:
> On Thu, Aug 13, 2026, at 21:07, Stanislav Fomichev wrote:
> > Add explicit padding before launch_time so xsk_tx_metadata has the same
> > layout on 32-bit and 64-bit systems.
> >
> > On i386 and m68k, the old native 32-bit layout put launch_time at offset 12
> > and had a natural size of 20 bytes. Using sizeof(struct xsk_tx_metadata) as
> > tx_metadata_len was already rejected because the length must be a multiple
> > of eight, so the straightforward use of the interface was broken on those
> > ABIs. Userspace could still register a padded length of 24 bytes, though;
> > mixing the old and new layouts then silently reads launch_time from the
> > wrong offset and misprograms packet launch times. This intentionally
> > replaces that incompatible layout while the interface is still new.
> >
> > Fixes: ca4419f15abd ("xsk: Add launch time hardware offload support to 
> > XDP Tx metadata")
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> 
> This is probably the right approach, given lack of alternatives.
> In the changelog text, it may be worth noting a few more points:
> 
> - A few additional architectures have the same issue: csky,
>   nios2, openrisc and sh.
> - the commit that introduced the mistake was part of linux-6.15,
>   so the 6.18-lts release also needs an ABI change. I don't
>   think the "while the interface is still new" wording
>   makes sense here.
> - what actually saves us here is that none of the affected
>   architectures are likely to have notable use cases for
>   xdp that would care about the ABI break.
>   The one that is most likely to have affected users
>   is x86-compat, and that is also the only one that is
>   broken right now.

Will try to add that to the commit description, thanks!

