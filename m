Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1709FC35FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 23:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhaLeXI33H4wC5eS68es3oEBN2a+09QOjpgGG+TYMwk=; b=3B712/T6r2JU9u9R89of11KKwx
	6k3cRuFPY8zMJWhrlUwbiHkE5LRKrmDY3G/2L7xPqW4YTzNZb6TiPG8TEMxl3vVKuji7lROKWQlfJ
	X6t7avgrk8hxAc9KSPa9WxDvhNFelFg053lCksj4OhG0VgfmtT9UdQUkaHFuGIuYw7HhDJUABebgk
	fAuXUd/joRqaLH50CZSG7tLElTSBHuX1iPn9mji8vnaeglBydSygNG2FHFzNYHyaIsfDnghs9v9AP
	BQBhCu14L2/QmGLZ8ywf5yBWhERkHcJ+LnBJkZ4+Vjq+0q0mhswxregaFBYGhuQ/eLxPrsQfSINN0
	NtfqJ/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEpH-0000000FXnw-01UT;
	Fri, 14 Mar 2025 23:52:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEnc-0000000FXgj-1YlC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Mar 2025 23:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FhaLeXI33H4wC5eS68es3oEBN2a+09QOjpgGG+TYMwk=; b=CU7LsZFDtkHIs7NeRMSIpebI9C
	gFyoQ3nJQT89fR2tDkZPrjY9vhZN2B1zAPj7u8p5p9zl4wjtjnhgMpuzenzZQIn44GaFKHCxeQQld
	r/kwxjORkkWTNW8VTnZn65KM25Roe6mx4Xfr+sBq4mMNfOr1hrOc75esc/7QvQeMiom99QXeINz4l
	Qc9MMweF9T7I1V1WrLLiU2zUsyLW2VzIxfq5PpMirMeurERfTEp4klk/x6Vyti10SwQUKta4Nex9u
	c0/rn9rph1v+cNFK2xU2s3Vx3nATPdglEMGbtF8kd3RyeA0FLr8SvrF1k4UPHvpw8BjsRPkYlehwd
	ZKtGrIqg==;
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEnO-0000000310M-2Nww
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 23:50:42 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-ac298c8fa50so497786866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 16:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741996228; x=1742601028; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FhaLeXI33H4wC5eS68es3oEBN2a+09QOjpgGG+TYMwk=;
        b=ObdZZQOL304m4wfs0lE1vCg3ZYayJHcWciFXVk2Q52psK+mvqv5/+dgOpJPODSKMmI
         BwyrYaK5tW8P23LyYW01Gya/2wgoY6H/8cab1dWzXz2r+JIz3T9OQDSqA32S4jAr6mJo
         Sgcgv3WNTiWjY/4Z/Cs2sMKsRt5DsQXUv80yrIPD+yZpLjIrB2zPqY4zsnh3lq0NPGJV
         tSBJjN/lliX9tcIKzx72xzrN1xZlYPaNpYloMNL9SwI/3aJW1sA0RwDCxGJuenNCNozU
         60cwcMv+8ofPTaMl2in2kpHXLAFeaH+u2AXvShc+rG4xHMVFyEqks+tjgTf333WOlUR/
         znog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741996228; x=1742601028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhaLeXI33H4wC5eS68es3oEBN2a+09QOjpgGG+TYMwk=;
        b=U7ChKA3vZuFmjcjwav3S4YTLbzMGXBC/O+nTz1lV09540X4R9g4Q3zjUI6oGhJ/7+e
         upnsrLy7udEeRSl2FeZTeDBuNaHcc4g6MWplKnu6fbXV8UgvM3EUrUL2OH8YHeHNVfgb
         B63zqTE8TaLBBKmMehHrjSPp4EYMdJOE+QxQSZMqWp5//4P3qoxwLxX93uH4VIdHnaYs
         BbqXt5f1OE1Q1KKX2oSOmTzsVsY6AOYoh3KABip875mk02Dpf5SxzX2Bxsyz+WS0kMeV
         87trNaSACoJK4K53YhLT026v1S+TvLhRwNMi4WgP4bnhc7h9JWrfaKvvndgXtkqp/33k
         IFSg==
X-Forwarded-Encrypted: i=1; AJvYcCUecpkJWkltlfkBHiw6TMdhA/92mjqMNA+Nn4hukmBOq0XZL1Z9Ihob4ougo7sNYmDlVkmg6xC8vW28XM/3I3C0@lists.infradead.org
X-Gm-Message-State: AOJu0YykAleR+ZZFlZ8gdIQlKwiXQGaTCsbRjVpefiWtg3Oh5BCxevq0
	/RrHbwPMNkbwJuCLmlZAHYlsbCaqCnerBzLoqB9APBAdAKO0KfeqOkKDTMy5DWxElMew/it1Qms
	pGNPw3knqj3vyko0fvWxMSw2xg7w=
X-Gm-Gg: ASbGncsWMHX6CyOi2vkW1r46TOm5nmzjJSrX9yGkka8YbYdaOqsRWjG2bYaFzirEflK
	P6x7xNp6+EJQdwfiBh2sjgnkAdU5QCnenqwYDbdRUa0LY79U9/hSwQzUPEuNsIOwtxFSa17R9i9
	QnbhtOBOrgPpG0ad/RwQm4UMiLlVkArmvYgBm+K2nwdmFLUa5+XWc/4fAQ2Q==
X-Google-Smtp-Source: AGHT+IFseiObElwtIvtwwHdh6W2D/y7AiXA+tiz3sPg/0iJkCw16MaB9jRCfbh+AF0S93nY9BT48BWskRpDCmzUJ804=
X-Received: by 2002:a17:907:3f9a:b0:abf:68b5:f798 with SMTP id
 a640c23a62f3a-ac3301e1c42mr425515866b.9.1741996227456; Fri, 14 Mar 2025
 16:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250303152305.3195648-1-memxor@gmail.com>
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 15 Mar 2025 00:49:51 +0100
X-Gm-Features: AQ5f1Jqb8X_ecTpFBQJRSB2pLw8-43_Uphf1mm0uCmpV5lZuYqh9UnxBIZQL3Zc
Message-ID: <CAP01T75iEw0mU6LeigHMp06DGsgZHp7UWY422xZtX1U7tVHa0Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 00/25] Resilient Queued Spin Lock
To: bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, Barret Rhoden <brho@google.com>, 
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel@lists.infradead.org, kkd@meta.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_235030_813424_8DB1C389 
X-CRM114-Status: GOOD (  11.47  )
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

On Mon, 3 Mar 2025 at 16:23, Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
>
>

Hello,

In v4, we will fix a couple of issues noticed in patchwork, where the
locktorture patch breaks bisection and needs to be ordered after the
Makefile change (patch 17 and 18 need to be swapped), but the biggest
change is that we will move rqspinlock implementation under
kernel/bpf/ to make it clear that it should be used by the BPF
subsystem only.

Thanks

>
> Introduction
> ------------
>
> This patch set introduces Resilient Queued Spin Lock (or rqspinlock with
> res_spin_lock() and res_spin_unlock() APIs).
>
> [...]

