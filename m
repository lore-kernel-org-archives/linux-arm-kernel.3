Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8161CEDEC12
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 06:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9B/eoXPHzf4Ne438osq3GavHWtC0eEvRnIZrrT/wzs=; b=tCgMq9M4Kr4qyWStVmGRY1f/YE
	HLuKqTAmO33rD1TlUooj2Av/3liNE6arz5JrXS0vvS41B0GwNjGzZmhFIdEyoXI13I4un2wz774x0
	cBy2kzLTq7+esnZfvRFFeS4cE66B0YtlgfpD99geFvh1OS53rqZk4WI/13QcnF2E5USlldaWI59U3
	Ul025o5cFZeiVcgTH0g08eIMb+J2264uq2LmGvr7dyDUKEUOyobIwdY+kxKN1oDglTLVX9kqe7p0h
	8U4rIp05CLNJSFURKnGh56wwiGv8R1UgFHkggF2JM0eS9pFpbRCG9KLZcfFmqGT/EhjGnfVsPf6bw
	7FMYpYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxfdb-0000000GWL8-2qnt;
	Wed, 04 Mar 2026 06:23:15 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxfdZ-0000000GWKP-2ZWJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 06:23:14 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c7059b9df33so2443667a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 22:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772605392; x=1773210192; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f9B/eoXPHzf4Ne438osq3GavHWtC0eEvRnIZrrT/wzs=;
        b=jThn7EybM3Yu2ysWvohaaNJ+x/FTAMgiwWJnbYqAdfHiGJiyL1Hwe+wKdwrT2KGIol
         GB0rTJX+L3ODkJ5Xmwhe3UgXr58wECyZjCdnBsQZngtwWwhqArFPA6UfUvZVSswUawzr
         j7r5mvE5YRhzhS8T9+DAXCWeRwgyn/gh80f9tpRTYnKU07QA2aVwLCq9xRpAnQNaE9iO
         m4uhTzOqdocHDLV5Qw+mVplOlX/FeIJJ4mVUO+qbpCtUNRHb6WME92lvKNBWlTtt12Dl
         oDErFJ8+0WK6ZawJxkbMywT2G+QwfCnW6udqm6/RIdF1HOwsXVJdRS5N8CDNcUAc4yAm
         TufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772605392; x=1773210192;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9B/eoXPHzf4Ne438osq3GavHWtC0eEvRnIZrrT/wzs=;
        b=jSRHkAIdpd3NV0rHT9gnhGCsnoldOxDc3HPAQnf4NNzXSZcYxmy4IahXG4B6ghc7GF
         bqJkuFXTR5IX0SOQeRrYCwNocTlngBmawdjo0/tT7bENK9cGkNMnzMulj+2ZSYDzKIbw
         dSTmpyM4LMKr3slMy4irWYgDEZXwkU1MuO6SBjj1ZDZ+yVzQ3n8XjfKP2T12WE7JkZ4a
         dmvDeruL0OjRiWty9aHveOYFuLkhe9OHrCMjZogWwTMoc96wFEnvVWGN4vq3G8a5YdMt
         kuIv4hOXnK15kTmEXM+TeBU3WVSwkJB+S+o7WVYF5b3Y1eJrQqzTqoMfg+nWkaRsc4OX
         V1pA==
X-Forwarded-Encrypted: i=1; AJvYcCUcrNx64MD3bBnlgaVFC3nSJvZfxhWHH+yQYpagId7sLbg/445VsuuiccQBVYClgl7gDCVvm3Mhd8GvVXrrBlWx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7n9sikb8OnBg7sxXgDtPz7ywZJugWTDcK//ykOVMD6yCnhBu3
	p9pvNkyzXkUGrwE3cOh/38eASpCnlAutS7d7A0AKmEgY+WxGFqjRyDXT
X-Gm-Gg: ATEYQzy7YkP8BXTcQet5Np5eVpeuYM1FK9lQ+EcEYXAB6GWoJGA/dEUuM2Y9YQYl05Q
	KEFxxgPpEOzQsBGNe6W5jhm6ZPCOWNAORLHILdLvw8cEh4VEHN1Z4SX7a41enyE9kuEhVq2A+Xm
	s7tfxPCPcxj4Ybu7DGQlRC5aPnglpMHd01crKZSrZl2ZJMcKvVQf+6y0DwARTohsn7At5dqWz3P
	TRqOM7QWeWExgTDAZqAsmndeCZReOpKYnUKMqI3GK6ZfVxZf5E+x816M961Nq12qMVWXly0CuJL
	JcN/BK3oK5w4w31bTxgNT78jEaGCix+s1xt2rIS+vGvsGfUkC68uAcO+jp4rdifNIbdS8HgEYFS
	dT0P3MI6I8BkQqLpB3iYTMiTdS9KTzeZmndX2mn2Q5TnKsdzRGekc7IitajpH+RPZBSYiEXDqrD
	FxU6SllPFvZe9G7++mIQgIffeXf/NUpM/DJ97BuKAC2KBN7FZ17Hwg
X-Received: by 2002:a17:90b:2f87:b0:352:d933:5574 with SMTP id 98e67ed59e1d1-3599ceb537dmr4072869a91.9.1772605392279;
        Tue, 03 Mar 2026 22:23:12 -0800 (PST)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54e394aasm96198375ad.77.2026.03.03.22.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 22:23:11 -0800 (PST)
Message-ID: <e50cb1e9f805d55a04cf0396aeb9fa3823a2f37b.camel@gmail.com>
Subject: Re: [PATCH bpf-next v5 4/5] bpf, x86: Emit ENDBR for indirect jump
 targets
From: Eduard Zingerman <eddyz87@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Yonghong Song	 <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov
 <a.s.protopopov@gmail.com>
Date: Tue, 03 Mar 2026 22:23:09 -0800
In-Reply-To: <20260302102726.1126019-5-xukuohai@huaweicloud.com>
References: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
	 <20260302102726.1126019-5-xukuohai@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_222313_656059_98D20635 
X-CRM114-Status: UNSURE (   9.03  )
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

On Mon, 2026-03-02 at 18:27 +0800, Xu Kuohai wrote:

[...]

> @@ -2449,7 +2452,7 @@ st:			if (is_imm8(insn->off))
> =20
>  			/* call */
>  		case BPF_JMP | BPF_CALL: {
> -			u8 *ip =3D image + addrs[i - 1];
> +			u8 *ip =3D image + addrs[i - 1] + (prog - temp);
                                                        ^^^^^^^^^^^^^
			Could you please comment a bit why this addend is needed?
> =20
>  			func =3D (u8 *) __bpf_call_base + imm32;
>  			if (src_reg =3D=3D BPF_PSEUDO_CALL && tail_call_reachable) {

[...]

