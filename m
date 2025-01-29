Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D663C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 02:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/7rpkCRjrjLUYXMCzO9/+2F2CRM8/XcJAntFkoNsbU=; b=hcnC4n9pbxQt0+s7hzAXIhadrU
	VX8Fs+5xbRzyK66emOSFFzpojrQeF9xc10aJWPIztML/jbAeFsyqbZ/8wXrFmiVyN47KusJZjDWli
	/BRPaFV/FD0mOPjxENaDEPHAujbgflh+7ESSSbhWwE3FWSxEsK3TNSZ+xlzfS3EWigz0WuT3C5lrL
	qE9ZAe30qFEYcS05js086S2H4/JoT+nCXp+LGPymeSfIbn3N4IbLfRVlfmgFY/Zld4tlwPl7D5DRo
	Q4mclc1Mg/Y8z8+SAjcqHQ51hMfANjtVVMAEggr74f8LgpfPMnTU/paakHEbcam236W71YsLEnAG3
	quYHzmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcxfV-00000006DfT-2xF6;
	Wed, 29 Jan 2025 02:19:05 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcxe4-00000006DVk-0riA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 02:17:37 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21680814d42so103767535ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 18:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738117055; x=1738721855; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L/7rpkCRjrjLUYXMCzO9/+2F2CRM8/XcJAntFkoNsbU=;
        b=HYNxfWQlhVNsIn4/lE2CcNo79tNjUhlnwAcrtc6FGJlbqfp06dMvSVy3q7iwcAgv50
         iXIRTrfTI/CI7O7JFTScFGzZTJASQcm8LvKC70Dpj7Ibu6MsMNc06JxJurOS5MrIU6cI
         OoS53P4JNTICXN+WKhZT4O4k/qOiIpjdg7PYZ9xt13zGlhPSosWot0gOL14dv63vCc/O
         19CfJGLdrtP/cw8fidnVr53qedw7Ag+TbsHz+HCdCkxnya0uneK0b4WcPmF8TbA4WjKG
         baIIi6vDnLQOymROH4vGkd9lGCI/DjOfVjD7MpeSl9UxDRc8eUX69YT5TQJRrbU76Gpk
         hWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738117055; x=1738721855;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/7rpkCRjrjLUYXMCzO9/+2F2CRM8/XcJAntFkoNsbU=;
        b=CWzkeHyKXJwBq+yNjPxCDi+/mGjDjwUHbYdk5oE6QLyfO6tYvTD4KkJilTcG/tS1pS
         Tt73oNu4phWfg+ExuGdsilt9HX4tNsQVn/OD3sM/MV1MqWU8vD9Aes+Q5Jo53+RL2fIn
         3k4iugHqdAhCotx6E4uf0H6ziKWAPyWs1sH65lYlcKe4ctXAYCTcXW0nhvqpyKC/ePj+
         HOezZfvlXzfHM14RC5QzneNnqRNRdBK/Uop95HlYaVR84UdgAeCPEsr88KuJEwJIo7wh
         pmjwkp2NW8dpfuRv6JcrSUHeOhplkB5qZ0s0CDfPHlNSxFkXIgx74M5xAl0H+oNuSnoQ
         bEeA==
X-Forwarded-Encrypted: i=1; AJvYcCUXgs7noYn78IXPdctW8X7on8x4HCCGWRDCDBB7KXYeISQiNw++N3sL5SB0QFELqDr4u2wtz3Ux9RRmDZw9d+az@lists.infradead.org
X-Gm-Message-State: AOJu0Yy62/eTEIzHhWyKvqelgch/CdSD7rRGMRfiVT11T8bzKRnXsxKW
	gtBr5LsaJ8nPZvgd+ZccgSI/Mjc8AU1od3V5oO5Z05Uhd8Fxxw1g
X-Gm-Gg: ASbGncvrcpaYj+BgHro16SkDLHLYbwVbUSZeBMHLm8eL9ozsBA2G6EJSJmHcI5uHIrT
	/AiG5yHsQOqLlg1w0n6VsJNHNnIxZUdQgjlwbJ1PE6jI6U3DcAWB4MW+JfeWMTpMHVW/GlX3kZ8
	gnINBJrepoaw+AfDyZqK5YT+4bT2Q2azHnm4qvakntX5KLk6P/cgvvAX5sYr6vf2CS7piMIMTCI
	sZmvPAxIk1nuLOEr+NAsvZ4fOnrh1q+iJPjTSfyms08Rsy9cm2oyHWIYisW5Kwf3BT4vjuPab19
	araO8T13PNxp
X-Google-Smtp-Source: AGHT+IHuAK5Hv9o5X/1iIXi7Nk/IsYkAIpLhfpe0mnp0C3ElcAbj2ipHe69cLEPwepZTcfn4AV2G1w==
X-Received: by 2002:a17:902:d551:b0:216:5556:8b46 with SMTP id d9443c01a7336-21dd7e0728fmr22399605ad.49.1738117055220;
        Tue, 28 Jan 2025 18:17:35 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac495d590e0sm9005157a12.51.2025.01.28.18.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 18:17:34 -0800 (PST)
Message-ID: <6c7a14503338699fa99a4cf13f1e2b0abbfc9dfb.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 7/8] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Peilin Ye
 <yepeilin@google.com>, 	bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, David Vernet	
 <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann	
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau	 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh	 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo	
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet	
 <corbet@lwn.net>, "Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan	
 <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Quentin Monnet <qmo@kernel.org>, Mykola Lysenko	
 <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Josh Don
 <joshdon@google.com>,  Barret Rhoden <brho@google.com>, Neel Natu
 <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>, 
	linux-kernel@vger.kernel.org
Date: Tue, 28 Jan 2025 18:17:29 -0800
In-Reply-To: <bda935ed074d3151d9afe02df06f026b8ea30690@linux.dev>
References: <cover.1737763916.git.yepeilin@google.com>
	 <3f2de7c6e5d2def7bdfb091347c1dacea0915974.1737763916.git.yepeilin@google.com>
	 <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
	 <bda935ed074d3151d9afe02df06f026b8ea30690@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_181736_245900_D52C1C4B 
X-CRM114-Status: GOOD (  12.34  )
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

On Wed, 2025-01-29 at 02:07 +0000, Ihor Solodrai wrote:

[...]

> > This restriction would mean that tests are skipped on BPF CI, as it
> >=20
> > currently runs using llvm 17 and 18. Instead, I suggest using some
>=20
> Eduard, if this feature requires a particular version of LLVM, it's
> not difficult to add a configuration for it to BPF CI.
>=20
> Whether we want to do it is an open question though. Issues may come
> up with other tests when newer LLVM is used.

These changes have not landed yet and would be in llvm main for some time.
The workaround is straightforward and I don't see a reason to add more jobs=
 to CI.


