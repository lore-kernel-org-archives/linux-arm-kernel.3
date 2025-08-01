Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ECEC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 00:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNB7Jz1zScMDFfs0rZoZMRdIEP+98i95rIMN/mYlt4g=; b=GD7yHFNaDGiFc/iyt9LZQf5U2k
	fup+riHHu5TEvmA86uEbaEncO4kITtPbcV1Pecg4WTRm4cr7q4EbAsxrFTv/9dP2mGLe2dHArXwCG
	UqlYmq2HW4YBGpwL3MMrsCQ+EnJWE15Mf2xxICkTg+HoOKBvHvOQyY+xnWTXNxPXKZxJet5obTjhU
	UKvTkkddrHWt95LXGiqBy1gRPJDyMixMWWAsTIQydPoWupqLGV+xijtWhdB/x2T3wcJPUfsN0O6r3
	jn9/A1EQPDK18V2ShGaJJg+CRQIw7SgKk/ZoIE+C4cBGlGeRU7r3SI+tDYQ3gZS+xY93TXXSQ8gAr
	vD6w13VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdhC-00000004k6N-27bR;
	Fri, 01 Aug 2025 00:32:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdVi-00000004j8n-0XTY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 00:20:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24070ef9e2eso71545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 17:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754007633; x=1754612433; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNB7Jz1zScMDFfs0rZoZMRdIEP+98i95rIMN/mYlt4g=;
        b=bmhZYWsRieNaiVFTESrKcEclTr4phMi4U2zUF7nEjNPCDzrSZ7RkTO9f+R0UIAt6Qh
         xAbcDeevMLFcFRhx7k8ook6MZ0v2vJLswLG/xIPEQn/enFawyXfVWkafoU8MomoIKAlj
         38t9IrqgLth6c/15IgIEaebi7qHw7O79onUUV400kqkef0+XEJR4imhpD7GSuEU+sMH2
         hQ5HYaJ0Qao2dPJ878nxsBoOG6Q8afqb0nUYGffAkMu70SbVq9vpJIRr4kb6BoE+pT8l
         QnMCb+EB3maAgkmS5SdpcSL74WEI0/Sx1VpNu3leBOBhWzRGioqTws1lM3MU/Moyync4
         Rn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754007633; x=1754612433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNB7Jz1zScMDFfs0rZoZMRdIEP+98i95rIMN/mYlt4g=;
        b=cdAtrvE+MDJW2FU+k+JezdOe5eq9oTuQwv6xJVJHV4kBo8bOVwO+R5X+p/UuNzi0iS
         AyHxOCJ8/mJPcBOLQWUA+iWFHVkd2B3bc9jzo5Sy6FzlE/rOtFuPSFkWck8jw04SpAsf
         PKyXwcu/5SQxZ3sra2rAeHNXp99OCc5x2OBvRiSpvPedwNMK0dJhL7ioP8E9z1Zeg1zJ
         BqVA6JRHowNz4EtYgPJ+Ibzj+r0ZNCBCTvyVt/iKAqlLWyt32FaVJhLn5C3fQKxGK3x5
         RAFdIcVf6P2gt6hLCjH3u0MTfQk7B8dBy92kUeuLbcfzPn0JM9UCoXBjm0r6C3yJ+bkA
         a3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV4yI1FzfJl+xi3bmLiCLXhuWoABnMlOZlu07VnZaUbLOeoToJzk43FC6sDhLsqvuYcBdHPE/STrq0TGLE0q9RO@lists.infradead.org
X-Gm-Message-State: AOJu0YwkAIarUZ9fc/4Nhl+1F/kR8wt09c5IMua9II83OZYeiDFmQq9P
	Bsi3vNqYosnMC+TiaDGinMVyBx1VbihAMGR7D1P+ApZYKiJdGbElr2gueK+6b6WZ4WdKIRUdGwl
	Ggif9mHZt4AGbRqLvnUktWoVhhSeNkNDbcWiOLOGMTRhcz3DC5GxqiKNY58M=
X-Gm-Gg: ASbGncvYG+L/y4c3lfOAiX/PXZeo/aB8xZv5iJed1f9EM0U3qxEs7o4ra/zhdX3A3Uo
	QhFEU1zMaa0AOuHeNlE8ktKUDuJIiIFbsjR/XKtjYGOCEPNmqq3QWkZdSJB+lr6BW3eH/Ez/xly
	14y2R7jEmtmH84bTnSXdsq5qKK7fL191STbqAWyKjEY3sSJXC10BX4tDUJyhDJ45u2BcrIIliMA
	3/1
X-Google-Smtp-Source: AGHT+IGDNTpuGVYj629USNLNeLL0siDgIzRTNjyg8lKmShUIJzDxKbLaciUPqUZUh7MiGlrWcRaOPFqL3XPjnpsCEO0=
X-Received: by 2002:a17:902:f689:b0:234:bfa1:da3e with SMTP id
 d9443c01a7336-2422a3269f5mr903815ad.5.1754007632274; Thu, 31 Jul 2025
 17:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250722205357.3347626-5-samitolvanen@google.com>
 <20250722205357.3347626-8-samitolvanen@google.com> <CAADnVQ+FeGjNAJFyvpF_POB8tZUMXDN3cz_oBFNZZS_jOMXSAQ@mail.gmail.com>
In-Reply-To: <CAADnVQ+FeGjNAJFyvpF_POB8tZUMXDN3cz_oBFNZZS_jOMXSAQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 31 Jul 2025 17:19:55 -0700
X-Gm-Features: Ac12FXxGz4A0byvVJth-oygtQdLKvl3dv5m_3xt8Zj3SIwF40d5KdT8i3auolbs
Message-ID: <CABCJKudX80K5VazPgHAmVd7yBFVeNY7hRm_xF-i1JKaWs-4RXw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v13 3/3] arm64/cfi,bpf: Support kCFI + BPF on arm64
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Maxwell Bland <mbland@motorola.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Dao Huang <huangdao1@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_172034_176604_F01B4476 
X-CRM114-Status: UNSURE (   8.24  )
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

Hi,

On Thu, Jul 31, 2025 at 11:39=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> Unfortunately there is a conflict. Please respin.

Rebased: https://lore.kernel.org/bpf/20250801001004.1859976-5-samitolvanen@=
google.com/

Sami

