Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB0DC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvoMtFQu/5mLGfm/YlEYZey6eEGMtp23wegCaBbXJv4=; b=NXewC1sEfPOYXvnFhaEdr5Hcy3
	LKHp3eP5sqH5Sk3S61GTPDP0kBdl4g/j9mNmtd+5bz9++VpgZVpFigMPPYMIlcL5hHikewOmgp3tr
	egJbMQcR/MBoDpTpbfD5KfdczmjS4IPEWFLYSzMkZXDvDfvGt2I1tuywcjWILXEodKIfvUKTmopWz
	iD6edcIc3Z5IPWPrFnZBaN0zx1hjupT/8S7iQPO0IM+YSVTPa3h4ZubYuCkNWpTDcqo6V1QW/pBOs
	eB88cSBy1K3ds4qQJRkr3vB4514H2ZHraaVFhlYmUGyoByxfFbP2TbxSdyjPVs1DbypEYjv/xCRYv
	gtntPcag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGsX-0000000CNr5-0wWR;
	Thu, 20 Mar 2025 14:28:13 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGqp-0000000CNev-32qK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 14:26:29 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-307325f2436so9159391fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742480786; x=1743085586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvoMtFQu/5mLGfm/YlEYZey6eEGMtp23wegCaBbXJv4=;
        b=rNkxZY5tuZeLTu9bVro36ITKcqMBlk2DccHLPyB0qpVZclcPNjFRgJfCvCkaYEzl/j
         QujM2cG9BimLe1O+GRNHQTK+3IVacqdYV59V9yHEYCuW/ieAWbS5GEIMoOjxnAx0yDuH
         Wl/V4gNxUMLhlL52tRR0igtKgSuqdkYjeAB9f7Wkiiyrpisu0Y5dzI81/1a8/Tox8xbq
         A3D8IgxsZo0Cua254tTraIAb/yhjnUTLQhoITYmdWTNOa8YCP2VHFJNCHRug/GIRZFIu
         mGkcCNtW4EvfqX+cJSgVW9vmQKTw9BcPa620soR05VnK1G43U92L2Lf1dq9un5QsTZO0
         lTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480786; x=1743085586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvoMtFQu/5mLGfm/YlEYZey6eEGMtp23wegCaBbXJv4=;
        b=HwMpxPUPVpIC8HB7GAmbhA92g6aYtv+Ec7BorIvQlJq8AzlPxYc+nli19t8n2Z6+oc
         ogQ9Vy9TjzO1x+A3Hb6SuOZKb3e5uyljz2aWV7P+2wt+Y+bDhdMNjHxup26LiBrnXBEt
         kafGvRHVTeJiSQZ+ABxhECFvZ1GX1dOxokNsPk4XyrgmBIsaIea19cHCefuHDRqAXYqQ
         ZlKrs+nKIgfMHj4lTa8BaipBOuQEG8jQRzMEzveI5qkcigLvemTGONfPcMTawgqJxGfu
         KJdk8BJATmy8xbNMwKHjXdUc0mvsB0bTSQHgj35ySapvj+L+UzOTWcsWqik6lx2D9Utu
         SREQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdMEiCCiUnuJcn/AgvuvWjZP4tc4XgJVqdLcmknFUNy2H/Rm2Gp5zJc3MVfMlwqtRqgYBVjkS+7a4filnQs3jd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4bET5VZXFMnJpTl/RzyZxxR+VO60dkW1lJbm0VZjJXm3DWAuu
	Nc20oVTzwqacEVqkWUxQstB8/1VCfXPmWBJsUwJJpZlEgozCiQXq+qAlm638Pxw=
X-Gm-Gg: ASbGnctTxXRrHNTa+xr3BNm3XrCWjj574dJSBQthjX/Ll0P1xyvlA//R2Psw9y5gnNT
	RBKLqFnmfTTKOFOHDP/aBAXthCybp20ZMtKOh/cwQ/3qDi4tEjAxTTBbaM4/a37ejCuwrf3N7rF
	pJO98OVDrkSgOsH4L4PFd6kNHWqfnQ8NIwLyUHAIQco2odq7UbEQpoCx7+PeWAKMrUautn0+0Uw
	cFhpA8u6nf0UjbQCdmiaLWtZ8a7Oiv5Y+RxBiwFBcxqzQawcgwcCk3keoIGRfcmEMkU4EdOrTuq
	tbr9xQYy8ceabgNM7qU+8EmY/6qqwWRJxa+K1WJ88NCOWQ03xwlGNlQvt1xo4e2lTEZDE9TbCD8
	S5oMe
X-Google-Smtp-Source: AGHT+IGJdiwH3GLesSTdhfruK4DZmmmGPbFFRhIvLmZNGlq+ysSxYFDz9Vi7Dj6qQxxwk7XjYXZifg==
X-Received: by 2002:a05:6512:1153:b0:545:d70:1d0e with SMTP id 2adb3069b0e04-54ad061ba69mr1646599e87.3.1742480785393;
        Thu, 20 Mar 2025 07:26:25 -0700 (PDT)
Received: from Fecusia.lan (c-92-34-223-1.bbcust.telenor.se. [92.34.223.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a9201sm2216816e87.250.2025.03.20.07.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:26:24 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	oleg@redhat.com,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kees@kernel.org,
	aliceryhl@google.com,
	ojeda@kernel.org,
	samitolvanen@google.com,
	masahiroy@kernel.org,
	rppt@kernel.org,
	xur@google.com,
	paulmck@kernel.org,
	arnd@arndb.de,
	mark.rutland@arm.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	mbenes@suse.cz,
	sudeep.holla@arm.com,
	guohanjun@huawei.com,
	prarit@redhat.com,
	liuwei09@cestc.cn,
	Jonathan.Cameron@huawei.com,
	dwmw@amazon.co.uk,
	kristina.martsenko@arm.com,
	liaochang1@huawei.com,
	ptosi@google.com,
	thiago.bauermann@linaro.org,
	kevin.brodsky@arm.com,
	Dave.Martin@arm.com,
	joey.gouly@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Cc: ruanjinjie@huawei.com,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next v6 1/8] entry: Split generic entry into generic exception and syscall entry
Date: Thu, 20 Mar 2025 15:26:12 +0100
Message-ID: <20250320142612.396250-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213130007.1418890-2-ruanjinjie@huawei.com>
References: <20250213130007.1418890-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_072627_764964_62D224C8 
X-CRM114-Status: GOOD (  11.50  )
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

> Currently CONFIG_GENERIC_ENTRY enables both the generic exception
> entry logic and the generic syscall entry logic, which are otherwise
> loosely coupled.
>
> Introduce separate config options for these so that archtiectures can
> select the two independently. This will make it easier for
> architectures to migrate to generic entry code.
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

If the generic entry maintainer (hi Thomas) thinks this patch is
OK it would be nice to have it applied because it will also make
the ARM32 transition to generic entry easier as we can work on
exception and syscall entry each in isolation.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

