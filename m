Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83160C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDsLjtFBj3deI+dVxQXARgpzZU1fDZVAfCzc3BIDOTU=; b=KH+ZSCEZuiyplqp3PYU8/r8I/1
	yIj6QRC4e4xn5Mg/3hXeAp7PKGMddQzbs0wVI7UvjfjRTA9pMZLynn+kW+uFHHS2v3T927TRpFkau
	r+5PkrjnOGJ9nuiRZx1Av/11Jz0/L6c3AdTyOhrooePhbMlY+0xIueuiIKP4JHd3ebmDQOnOhtSVh
	771w6j3Ezc11FwVURH/Xh3OSg8uZsjfYzeoJQ1E1otX+t3DydNwIe6XFEu16rd5zRp6m0Vq0NOPt2
	7JqlXPXP8ECjA+22RuSxiIzSrafSUrZr6//NNwQqDjKLGUEZ3DfMBLbygriRyMYg+WC4x8xcJifAs
	pWl0BNEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvPn-0000000G84p-0HnP;
	Thu, 20 Feb 2025 01:31:47 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvFy-0000000G5AN-1pCI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:21:39 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2fbf77b2b64so805991a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740014497; x=1740619297; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IDsLjtFBj3deI+dVxQXARgpzZU1fDZVAfCzc3BIDOTU=;
        b=GsNYrHKMLfwVHXZhJMnTYs8UUPOz1VUIXyHD/utbCYhHagh/Ae4sHePIMw51ejg8cG
         WvywqFaZivVr/tyFDUazX/KV+tOth8Sjma4oKdwDHWLwAGcjY7sxR/hS7DWt3IGUFl1O
         vHFnV9qiiJz7KneTAHQB01ZBKI2FQLeyLYT31vKkJitRX4869+qDt7A5Stcu2fKlI5v7
         oiKa1aXAF1L+78DKaYddbV+kZs5NTE8qbnFaWU01pRvwM+tnjjbVx5ZDfTOVJ+kTrp4r
         xrMptRCr4G2DPwqGbpdr2YTPFgfxUnWUNR4PgrAbnSt8XOVr9Q3dnRDx+z5zE3W3U8Z+
         GTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740014497; x=1740619297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IDsLjtFBj3deI+dVxQXARgpzZU1fDZVAfCzc3BIDOTU=;
        b=JbQtZZUYkJOCxOLG/lSs1SCgmJsqCOh6xq2ryMd6B4buqrnDG9ZQ64XV66YkhbVE5b
         C7XK4NEgh4AmVcYAmLxuOWu/QAwnY7Hl7EtiTGndjBFKstxhX6kGRUV+a5OkTES1OI67
         66uDlpUqMmTnLeFV5yXV8Z7IO1DSFzZZNdRpcz+9/Oj1/OQA8Tguv2acA0LMPmSHesw4
         ca8yGH5U6YSrwa6p17soO+3tJ/94/sO5sIOUz1xvYRAkdSil3quiP4F0Wv/QX5lFd1wM
         7jRyc1Dln0G3XctZpPwSu2mNwYVXMAL9uRe+yfFPrmPBdI5n8Lct00isI5FBxlqxFnKy
         1SQg==
X-Forwarded-Encrypted: i=1; AJvYcCXugq0KQWWSWvH/azSnTI6XlZdMMOBj4Qshf4MOxt57qO3Gv9noKWguIqc+2rJHQM7U1WE8UcQYW2VodiOZ8tvc@lists.infradead.org
X-Gm-Message-State: AOJu0YxKHzFlkWqrMCEQMJExZ5OCfwB2xfhxsnMoKXZ+wm/btBHh0bP3
	4KYWBfe03JnC+5aP/kl/kAw4BmyMWC2hrMHR32kzViYrbMyAT18/
X-Gm-Gg: ASbGncvCvbVBimpmgwz+16K1I9T9b9+30hpmD9ZHhIvsXuTw0fXyE3HrpbF44vgeHQy
	Y+H2XhplJdrHqFumtBTmrIavBKSjVNpRoRxml8gCy/7mRPG2Fd7pYl1XI8H5q4wSXGeUCBFOOjR
	bFDiisLkQ67XkLNIQFCJOe9aWhsYfoc21/c0u9oW5Ckt41T3rPHBVFXJqoBfl+/okLov70UGDkt
	Tc5YKpJQ55vbo9lf/0KIfOSInIcEaPHHikF7ZeS0YQu7Z7+s4g+tVT8VUkVQNIu9Mf7zEE94agg
	PANbOGIOCrIe
X-Google-Smtp-Source: AGHT+IHk9GIHf8OOYIkBRVhPLEFoCcWI13PAFtnrMzZXve0ebZLem5ph7p/HYu2/e3qv9LJ51Ex82A==
X-Received: by 2002:a17:90b:1646:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-2fcb5a15a04mr10720243a91.12.1740014497002;
        Wed, 19 Feb 2025 17:21:37 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536457esm110713175ad.85.2025.02.19.17.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 17:21:36 -0800 (PST)
Message-ID: <137eabdcb1494debd9f321ad6dc39443c084ad34.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 8/9] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
From: Eduard Zingerman <eddyz87@gmail.com>
To: Peilin Ye <yepeilin@google.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
  Xu Kuohai <xukuohai@huaweicloud.com>, David Vernet <void@manifault.com>,
 Alexei Starovoitov	 <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko	 <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu	 <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend	 <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev	 <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,  Jonathan Corbet	
 <corbet@lwn.net>, "Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan	
 <puranjay@kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens
	 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Quentin Monnet	
 <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan
 <shuah@kernel.org>,  Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long
 <longyingchi24s@ict.ac.cn>, Josh Don <joshdon@google.com>,  Barret Rhoden
 <brho@google.com>, Neel Natu <neelnatu@google.com>, Benjamin Segall
 <bsegall@google.com>, 	linux-kernel@vger.kernel.org
Date: Wed, 19 Feb 2025 17:21:31 -0800
In-Reply-To: <Z7aAmYi5zaVIgRKR@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
	 <3ac854ac5cc62e78fadd2a7f1af9087ec3fc7a9c.1738888641.git.yepeilin@google.com>
	 <6976077bc2d417169a437bc582a72defd1dec3d4.camel@gmail.com>
	 <Z6ugQ1bd0opoGRYg@google.com>
	 <1d2d919ae6848e2cf80b81ffe5f94fd31b8ea6ae.camel@gmail.com>
	 <Z6u4O930eIbAVVMZ@google.com> <Z7aAmYi5zaVIgRKR@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_172138_474918_3BAB4C46 
X-CRM114-Status: GOOD (  11.45  )
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

On Thu, 2025-02-20 at 01:08 +0000, Peilin Ye wrote:

[...]

> Then realized that I can't check __clang_major__ in .../prog_tests/*
> files (e.g. I was building prog_tests/verifier.c using GCC).  I think
> ideally we should do something similar to prog{,_test}s/arena_atomics.c,
> i.e. use a global bool in BPF source to indicate if we should skip this
> test, but that seems to require non-trivial changes to
> prog_tests/verifier.c?
>=20
> For the purpose of this patchset, let me keep dummy_test(), like what we
> have now in verifier_ldsx.c.

Well, that's unfortunate.
Thank you for trying.


