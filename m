Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0ECC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6yiAhzWXQxqLcRN0o6sEZQ4X3Bi1Cf4V4RVWpgjdWI=; b=jbUD60sOZnTMSr7UM0wPoZbRCZ
	89jLc8rz4OxKTdj47+uhOn0q/qa1EicHt6ERpxgkSQjNLeUt55GA/vDEIIqQDiPD/cZOGD1404CVX
	WGLXPj0wQRd7HaJ1oG1Mg57CEt9372EEGsOa8gauS/Jma+72TdYCi9NAZiY/2YYTlTuSpCiiNKmff
	6xZwefPJufGnWiqCWMKFPJeme7+PaKSL4678tAoNjfnYmAeNq7lVg4jJgK1baO9svvlynCz8UbODW
	IppKc9SMXs3sl/RwgIrccMmNGrGDcLM/k6ZPWor71bj0k5pti2Z0gWTkMYj/bFw1tDHKhu6v4v4dR
	LI0cgjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IkK-00000005Df7-2o8u;
	Mon, 28 Apr 2025 07:17:44 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ieb-00000005Cnw-3rUd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:11:51 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73972a54919so3596108b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745824309; x=1746429109; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l6yiAhzWXQxqLcRN0o6sEZQ4X3Bi1Cf4V4RVWpgjdWI=;
        b=LqmwKkLbCuKOzJET0MqeAl7ITdwxNuHwJ67EogB632SN4Wo3qhApxWrKqeDO/zof03
         56US4XonQxqz9Nx6RPBzyJk8xDEao+kBXuwjebEOhtK0qjQ1Q0lEF6rRHVvWm//3l+If
         l0zuIyoH3BZftOVpAV2kRbP+EDQw1EnPQhM7bTtYwMSguUohYvjS0HX8MPPgO7hzqSak
         Y6S3Gtxz69tvOfZJVBiLM1rOa/H0+aPMUbsSQjYTI/JHUOGEEItSQbxM1CGGsbc/R0QE
         fdbNTPrxQaZsOnhC1zWel6rST3AhqrlHlXKrVh2DwOkJUZ4GOrGc/yRKnPMZNjEuRBX4
         Tucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824309; x=1746429109;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6yiAhzWXQxqLcRN0o6sEZQ4X3Bi1Cf4V4RVWpgjdWI=;
        b=nzztej+mJth2uNhkbfILQdEuiOJNoAW+zXmGQ5mtS2qUd02PyO/xUCQxKkDLgNO/ju
         3A/8u825b4FX2khFGFHzklgwbguLsi/WjuEnFlzmqetp9zWqI4sFVHgkAq+F7yKDVgaG
         J6xSz3b8pIBuoig+5sCh9y4QNd3nBNTOa208WcwGU5Olw3lA+E3ZDm/x4sQl77eJB3Wi
         JIykz9YvSQ4nr+WlM2ow5o+AG0lEsNMnlMOFgVE+IkOV+8s2pUmCJFx1CzJSwERAbB7+
         71so0BwUGpzqhBYcUZJUU+3r2/L/BnNWPaKje6znn3KJQpwxyvbJvZY6C/4wcoRjA78I
         XpJw==
X-Forwarded-Encrypted: i=1; AJvYcCVd19bn/etctldHjy7o36X2Nqnk69BlpBxm1w7lETGNYlXqCK2djBjGUY4L2zsQpcypLP5O9+Qz+5BMb7N6LDCk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1yf7z/ZXhqWcL9pKioZwTOQQP4mLVOkuV9nRjfO33bp+taPa6
	BroRcr2mhvO8B7CCob/DeyMUYyiZKeWRM6Jx/Hm63JgRXqRl3b21JyrvCT7E
X-Gm-Gg: ASbGnctc8Ic63x8JyewMiHi4tEzW54CN78rY9woBY+yGvAWqldtPcaaF+Iifrjy1/Xu
	k6OOIjB+I2SaGGbnVc/zPh186dGoO8Up1YsTfmVJuEjaUdLJtxmNbGgtTrkLvZlC2+g7XQcfHcJ
	Dfl8yEyv8vx1O8pEzlkG8MjPEuUMQ+kHOl0K6WnrLgTkqKKxwvvbH28iMwLA70pxae88+wVejPq
	qEAGdt0ROorY/wXQRB3K7fwPxUp1YQzKIJ6ecrswwAEazAzHpTKf10fMUNHMKbmS4LwxKK+L3R/
	X+s0dNdkjv4YqGGDHVYbDXDsOt6Iy6ns2jQiuAoVQA3IR+M=
X-Google-Smtp-Source: AGHT+IFfNNR7f+llhGYk1fVhTaVcaX++3ZaR5o1FbRtfz6NVhQBo0HYMUzJEO16Gkwc19jokDXS9gA==
X-Received: by 2002:a05:6a00:3e2a:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-73fd896a139mr12813705b3a.15.1745824309053;
        Mon, 28 Apr 2025 00:11:49 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a8b7sm7495651b3a.104.2025.04.28.00.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:11:48 -0700 (PDT)
Message-ID: <b6878f60a62c4c6b4b7daa2272a18280e8fc362b.camel@gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
From: Eduard Zingerman <eddyz87@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, Alexis =?ISO-8859-1?Q?Lothor=E9?=
	 <alexis.lothore@bootlin.com>, Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  John Fastabend <john.fastabend@gmail.com>, Andrii
 Nakryiko <andrii@kernel.org>, Martin KaFai Lau	 <martin.lau@linux.dev>,
 Song Liu <song@kernel.org>, Yonghong Song	 <yonghong.song@linux.dev>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev	 <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,  Puranjay Mohan
 <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>,  Mykola Lysenko	 <mykolal@fb.com>, Shuah Khan
 <shuah@kernel.org>, Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>,  Florent Revest
 <revest@chromium.org>, Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	ebpf@linuxfoundation.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Mon, 28 Apr 2025 00:11:46 -0700
In-Reply-To: <2f13f928-9148-44e0-a44c-872a3779b0ef@huaweicloud.com>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
	 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
	 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
	 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
	 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
	 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
	 <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
	 <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
	 <2f13f928-9148-44e0-a44c-872a3779b0ef@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_001149_960967_652A841A 
X-CRM114-Status: UNSURE (   9.70  )
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

On Fri, 2025-04-25 at 17:23 +0800, Xu Kuohai wrote:

[...]

> For the two questions you mentioned, I=E2=80=99m not sure if we can acces=
s DWARF attributes
> at runtime. As for adding parameter locations to BTF at building time, I =
think it
> means we would need to record CPU-related register info in BTF, which I d=
on=E2=80=99t think
> is a good idea.

Another option would be for pahole to check if function parameter
DW_AT_locaction is placed in accordance with ABI.
These flags can be recorded in a dedicated section or smth like this.
Having said that, DW_AT_locaction seem to be not very reliable.
E.g. for bpf_testmod.ko generated by clang 19.1.7 I don't see
DW_AT_locaction specified for parameters a, b, c.


