Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F234ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 19:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUSH9JvyIKyy+/sQF9Fg04XQIcS5328kuqvUN7VZnEs=; b=VkG1oslxlmUuIa2WPnh8+K3XJ8
	1+Q6YN717+YJNrZMOkj1tkg5k2tCKgsa1eCrvOGMLi6Hl0/xbTKt3714aaSWsbVRWCfVjPytoKVhl
	cVBDhnwtTVqzMe4MoXMZZ1cEYPJf80hq84aFJJHEaXmlNULiE4zpV9/VgONy+KTmAClsOYu7dPPkw
	pdMrfRCAK/OmxFzjWcU+hLcdfwyDDY7fFhi6DXISSwGoPxgZPqT7rOHffhYmejCG1fiwOA/7Qkljh
	PZE2RMHaxAGr07oSM/FqAMJ3A6UpizuQbOh1NsgrvPjrxsXkwEHP/kGG+b1poC2qyUtp27iSfHvHf
	amqYbpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uptkO-00000005ETq-03sD;
	Sat, 23 Aug 2025 19:17:52 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ups1d-000000057gG-10g3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 17:27:34 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7e8702fd3b2so311795885a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755970052; x=1756574852; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XUSH9JvyIKyy+/sQF9Fg04XQIcS5328kuqvUN7VZnEs=;
        b=NMlXPkjOeBqDD9M4FXFW9ZEiJ1KqEBkJH21IVDIXfx2yDfEBEpNTVroomPPNvu6G85
         Qxd3yIqCVWYx2vJDhXl2MZDmYK+HBiagJve3uSaPmq3wV6Fv23gMquz89w+blMjzJfMG
         6ULNcjoX2WLdbjI03Srg0GJUKM0FlrgbPUXWgMEXkchHmNtSod+u1uB6RxtP4RqKn+Lu
         sAdvolf3ubxt7hLwFy/zfuw623jTnpMxmmqbqFIqlEBM+AoCUpVdwQb9Wjz5VNcXeHrD
         AJhGGhiIBskxmza3upKqIwqLKAA7nne9PM8HjsoiG5ZIMbOx6NrueIytcu85UicNBOTi
         J9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755970052; x=1756574852;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUSH9JvyIKyy+/sQF9Fg04XQIcS5328kuqvUN7VZnEs=;
        b=Egcr1HLeZ1t/krHbtayGcFZmJFN1QsEGCUfLOuwbSxg/K4mTNYwfQ1LGEbpGNZrF5M
         +yWcYtcXhpBgCZobBgLntds0MjX3D6FHKEQekSBWioQgT71vNqE5f6j2PsJ6QXzcpeN1
         a+CxMRz8Y45cN3SILlcgls55dFyUlBav/1PGkg1nrqYXQPoyEROYDLPAYazk6OmBO6V+
         WEl+8NYPtKAxnGHdiDv06ioimsfgmJQbu7+NhXoRPiX6KyM9jBDN8GvH1wPMcoR/gnto
         Tjp9QVXoUiNJblxuYbqiCS+61Jf8VhmeO9ljMAha7TdlQntwh7lOLy1WSOnvElimRU5L
         FO8g==
X-Forwarded-Encrypted: i=1; AJvYcCUTdaqC7yxOoSn8EsU0zKLo/aRvFtFxjt8hmwi95RoiWOBCetE/Ls+WYZovHtWUVcWlF1R0dq3q4hcfYiXuaMyj@lists.infradead.org
X-Gm-Message-State: AOJu0YzCU3M4dONKUSkXJzmDI//mGahI14tcMi5nvt63GG/7gAtm6REa
	MpSiajpTPQCvQH7T7HoTTBjc0kYMtLk2OI5UQ9UGPzTaDf85BIwtiSLp
X-Gm-Gg: ASbGncs43v8Q1bDn6O0CaU1eLu7WPYKCwYA6GzkCC+jHczrInpAgIiEinVi95L1LPGj
	8j+DmWJBL0vFcumVWbnGxzFS2l5fgCH+utbsia6hhgEWdAmpba7lTDwoLi4G+didQN051cmVuew
	afF5Yb9hYdMFo/5DRIpCPUNGsplmlwYvdm5ngkc3ZzaZ/gjs2DjsRDAQL1uSsNmfZEJOQi0fuc+
	Ithe4+eY1VKTSeH7GLAKXsAAnN1FYivJu7AdzqxJSynLaaEot/lG3+t5i0SqBgR4Z64Q1Dl8HN8
	yxslZH9TVsHhbxn53kQAf+lHZmr5jnYrbg5/CfZx2sbxKvFXCV9F1LiAWthGqtiZ22C5hJOd4YI
	tUlyU3zD1PUkdFFPBbhvonXniJac1qIfHhQ==
X-Google-Smtp-Source: AGHT+IHsakSgynYXDTEIxfql1qjzpysL0gClsR895vhO///5Zbblp31VQLCpZlK+UWogbB1c6SvypQ==
X-Received: by 2002:a05:620a:3189:b0:7e9:f820:2b8f with SMTP id af79cd13be357-7ea110b94b7mr813978585a.80.1755970051597;
        Sat, 23 Aug 2025 10:27:31 -0700 (PDT)
Received: from codespaces-a28d22 ([20.42.11.29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebede53d5esm176063185a.24.2025.08.23.10.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 10:27:31 -0700 (PDT)
Date: Sat, 23 Aug 2025 17:27:29 +0000
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: exynos990: Reorder IDs clocks
 and extend
Message-ID: <aKn6AYIAG9eUeSx2@codespaces-a28d22>
References: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
 <20250820-2-v2-2-bd45e196d4c4@gmail.com>
 <20250820-diffused-impaired-ba776d39692f@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820-diffused-impaired-ba776d39692f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_102733_277331_6C750982 
X-CRM114-Status: GOOD (  10.47  )
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

> This looks like a massive ABI break, where is the justification for
> doing it?
>
> Cheers,
> Conor.

Hi Conor,

I reordered because the current IDs don’t match CMU_TOP:
the PLL mux select is in PLL_CON0, not CON3, which gave wrong/low rates.
I also added DPU/CMUREF and a missing fixed-factor path to stop bad rates
and clk_summary hangs on hardware.
I’d rather fix the mapping now than keep a wrong layout.

Thanks,
Denzeel

