Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3498EC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5tWsuLYebqW+3y76WtKrIdRf2XYwkMQtn4K8NAAL+Q=; b=0itqRMgwL2EfuEIJOMp6NTWleG
	XYnMhz7Ezik5GmXNYBV1IKhGm9CACT639I7tw9YeY4vp8HP6AAjHugNsG24jCmAeR79nXJC3cCU5v
	LSMRjjgsRoXsA9AMfmgdIKMkO45bFVe4g4hkKmakQutgNuw48eWpq0A73E7041cjB9LVeN/aXZgZh
	T2LD+IDxAHT9r2akMq58HwZBkWaBgYm1AhmzUkQ3CiFvp0HIkJOYKa2NuPLOl2AVfVaDA3fCZOPby
	JJBXfge8B0SqZ16LzEHpu7vzjSJ5mzo7j4R9/jgzSaFiIdcjbtC/FGtXarHQqgN/K61JfMm1QBLqa
	FNgyBcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttMaP-0000000G0Rh-2hhk;
	Sat, 15 Mar 2025 08:09:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttMXy-0000000FzuX-2lIf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 08:07:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2254e0b4b79so71483985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 01:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742026026; x=1742630826; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C5tWsuLYebqW+3y76WtKrIdRf2XYwkMQtn4K8NAAL+Q=;
        b=RxnmrV3P3BTkL9GXoqWrC7nZ+XL8zlmo3KWpc9mzQ8Q84iqX5hxK7B2Yoa2BygCrPM
         gbYHxEHGHDvYsb8jXlPBjHZNQNEbKs3UW2QN5WR5EICAh2EgGMn0n/xrq5t1LmFI7X35
         5sDKB7j4+Kb/UK64TIc4BGwJxaHvAXEktfN3B/b1hOT4GmlwwYMhnTuLL0nlBerB0uz/
         LtxqIQB6K1Sk2M1tYUBBJaoBAInmUXWmQlZyz6BetAUd7hqlPgXjjsLIp0oZdkgQtiLW
         UW0sBNhTXjOl/aLeotYXpFx9JKVBF4M1IgRZHCWYPd/jVrdj/ONKMq3omft1mwzbvpM/
         NkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742026026; x=1742630826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5tWsuLYebqW+3y76WtKrIdRf2XYwkMQtn4K8NAAL+Q=;
        b=vKqvu5u1CaWZDsX3ajeVPVn2nE/jGogWf96UXzr67HuU3EkVN0FQlAgl0okF6MwTt4
         AHkKrT2s2DTljS+ptytCQ0SoWFMz/oYkWfh0ohNnT2XwbUSDMUp8lvixrCM5mRYDFTHp
         hI0V6yIEWWW0UapiWny31w9Mdpj19n44Af+Xkl1VuOfSKlAGXfIV7ociAHpGzJaE11g0
         xl9nAUtU4dv4d2MkZu6Csax4RXx6I869o+iehN9NItRisNapipU6cklooeVndTVHccZn
         hdRVxCAh3S12WsF8FEyvgd2B1qSoWSuGlMJubfY0ofSK2YrZlvqs7mks0rP5gv1O4T0N
         lIDw==
X-Forwarded-Encrypted: i=1; AJvYcCWFCW9xYSRwl+Nyc5QaLNdZLDIUidyqCBR0bZoxUycdTzO/5V9ccEb8hzR/bNHSGLqVzZqM69QKezmRR+lmjXpU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7BtB3XASGMxzxK/f1qF8Uqi/mkHKa3ZNTDLanbW2YlBXDxKyB
	JxrxNbUkGLB0yXEwZhMnB2BdylH3we7BXsA19/ei7+yqLH8H7TCQ
X-Gm-Gg: ASbGncvUxiYo1V2itW0HfkdmRxSihniZverHIjZb6qLo1e+Y36HXOsUj2kTCwmVCyjW
	oy7CyPbf7T881mEekkcSteCNdD8DAQJqX6odupq9So84AbUujpWBdfj/wSTG7vzmWislyLaKnck
	tee8DKWyx2UceylokvWFsV3U2uVf5cez5mAXk+kjDFp/phXyDNbK/EAcezTk6gr55qjfJN4s8Yo
	vMceX7gn5ruGisDImCK2S/n9HFozkLxbc36/IlRck5SkSDWuQnsQLB2z9OlD9T+SSWZ0qgFmemD
	LM1E1fPyNYjKjldNNsmKpFHlTZRmJogfuf/UhDbB
X-Google-Smtp-Source: AGHT+IGkNV2xTO9dQHlWSeyy/i0XrYakerLhhNGAIMLNT4Ti+wVWJjCGhEhKRAxcpm1P6DPPcR4EQQ==
X-Received: by 2002:a17:902:ce0b:b0:223:668d:eba9 with SMTP id d9443c01a7336-225e0a15945mr71542395ad.10.1742026026102;
        Sat, 15 Mar 2025 01:07:06 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a80e3sm40085605ad.83.2025.03.15.01.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 01:07:05 -0700 (PDT)
Message-ID: <46a0770582be4f8f80701aca4eb17b1706609033.camel@gmail.com>
Subject: Re: [PATCH bpf-next 03/11] bpf: Return -EFAULT on internal errors
From: Eduard Zingerman <eddyz87@gmail.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Catalin Marinas	 <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Hari Bathini	 <hbathini@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman	 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Mykola
 Lysenko	 <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Henriette Herzog	
 <henriette.herzog@rub.de>, Cupertino Miranda
 <cupertino.miranda@oracle.com>,  Matan Shachnai <m.shachnai@gmail.com>,
 Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, Shung-Hsi Yu	
 <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, George Guo	
 <guodongtai@kylinos.cn>, WANG Xuerui <git@xen0n.name>, Tiezhu Yang	
 <yangtiezhu@loongson.cn>
Cc: Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Date: Sat, 15 Mar 2025 01:07:01 -0700
In-Reply-To: <20250313172919.1103397-1-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	 <20250313172919.1103397-1-luis.gerhorst@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_010706_730021_51ACFB06 
X-CRM114-Status: UNSURE (   7.95  )
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

On Thu, 2025-03-13 at 18:29 +0100, Luis Gerhorst wrote:
> This prevents us from trying to recover from these on speculative paths
> in the future.
>=20
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Same as for previous patch.

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]


