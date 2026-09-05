Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6775C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gzn74/He6vpPugMVv60IyFY+oEpXPCD/bgVBASQsf8=; b=c0OZ/jWRNcbYmD
	0qgY7AhlKkqVS1DdpywdZjHiRC2mffU6ZHc2qFuO+ULj7jWIseBmf/6GRkz6+Sb+bNCV6PIhKx7cI
	DRwl4gYON3Uk7H7Oicd93GUNmYR/8sZTKmzP8b11Jqy2pE4lvJhfc5fO/RrSolJL3k/nmI97+sFp1
	TKp6BZ/AQFtp5ydo0ZrMYHTeeJhg1Ukh5PmAb/fqgyd4eV6q0/ZUB220Yik93ZlksngTMhWmmB/da
	oPah1lyKw6fqCNYr9Zh62EqOj+oHDfFMx0RqWJzZiVi/vkJ0cU0yty1LbdYuuhJlRxttNnCXA4xDO
	iEqgotWBs6e4yx/SLmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mJ5-00000003tae-0zwO;
	Sat, 05 Sep 2026 09:03:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mJ2-00000003tZl-1lx9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:03:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso12777605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788599002; x=1789203802; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2gzn74/He6vpPugMVv60IyFY+oEpXPCD/bgVBASQsf8=;
        b=GAapgHrTeulkwh2aBe5/3cCsu0KCCcrxWiOlygTLq7EEIO7vSud23+GqiwrDZG7qr6
         yOeT2fqLTvum8J2SthS5X4rcmsb+FSgY+Rw7RQ2/F0wAHvW3JXNMgKgbGj9oEi8pFYTi
         FAJ2HxGF82q0Zqz2s71VT5xs+ZqnPJ05zg5bfae45ePkNFlEmK11FUhmoHVhc1js2+6y
         u1ZL57EAzyCsMyVmBzo1+8/Yz53SD8SOErw8D4+gyXsCju0A3tN5aghTgeFqbKaazPBv
         Qt9D2oUmuIIZgCLrzVC6f7HHUqUknSIsGfQumlMhOLol9YAj8U8obpBg0T5qCWpwIVQ3
         /M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788599002; x=1789203802;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gzn74/He6vpPugMVv60IyFY+oEpXPCD/bgVBASQsf8=;
        b=FRYtgExqSUlLRdLWBRUFw5J/2vumkqFU3vfsBhPUHKGzbPwwoSBZ/xDtlu9fwg2tPd
         9/dIX1zzJnmncRpSzxmljpQRJwFcYCvOTWa2efvFuFsPaztlZOKwkiCrgDcBYdmMzl3p
         zB4ySLS1Z3KIPJOSL7ZLkGXFur2vGHwV4YZwi1P9GGIkLesLLyT6Ue/pcE3RNj6Fj5oL
         0MJpRcPvhKAtewmim6X6utCgMbEQtzxAzEwzH1qD0IdW1szyNoOekpmkwBYrurSeDgZD
         COfT3jRG2K1xZwheQIBGZzvdIxriJV8LbFu73virgIsaF7ALxECgTDUxTiasXK0s7+aT
         wUsQ==
X-Gm-Message-State: AFuF++nq1b67cC6oZdNDE8KUzbC0WXCmY+GFh4r9jnJiAbiMyShH8XZV
	QdSs1Lmp9IRVV5Nvyys23772c/ZeHW5vlDtkj46WeMjvVTLaHBhyWaGmq56fZYKn
X-Gm-Gg: AYBFou1xn1VuuESvMt7b8dqxi0KUgIb0VJEZ1hrGvyM2yxQgvWzLjhCeTF5dqWEoyDs
	jsn97FmIrXI/yHIWDbx/6+wMF6Ga9oejPfKk6rFRNo1fb4FYuOpXu5IGDYsboBKb5yGdIQPBsVg
	wN5uv4ZfuCn99fF8tnH3CPqh/T9G1lOE1Fz8iyUvlQCO1WMEWqMWZZEoGVfPGvurCHh3DRSUcfq
	1d9XEA682CObFupBNpKuqiN592UqYZv0jIhoigDh/kfzecuUqoyiqsRYaD7dZ+UWGfQsyel8JKF
	RjSE/70Y86xv5glvB8B0CwhH+D2qTBmXxoqa4k86ASP/G+HkzBf3vHGAsgpdAkhvIHxiESayJme
	DOc/MAz08vIboxLw8iFxUblDOvGkGqKqH3kmor9JruMv2BrhUpBqtwBS5CoN2LTAHx88x14vBSB
	eR4bsEBrORQg83wxSbVbtaNqBA5xTlzjAk3GEJp9uJWViBGg3TBEnThE007ehkoRe4b5ycFLtWu
	IyabVh3agNviXT16hGBGJGkNA==
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49cfa211cd7mr94741675e9.27.1788599001762;
        Sat, 05 Sep 2026 02:03:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm233373185e9.14.2026.09.05.02.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:03:21 -0700 (PDT)
Date: Sat, 5 Sep 2026 10:03:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 16/21] arm64: percpu: Implement preemptible void RMW
 ops
Message-ID: <20260905100319.0a50c17f@pumpkin>
In-Reply-To: <20260904161758.376504-17-mark.rutland@arm.com>
References: <20260904161758.376504-1-mark.rutland@arm.com>
	<20260904161758.376504-17-mark.rutland@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_020324_523968_087A1AC5 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: vladimir.murzin@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri,  4 Sep 2026 17:17:53 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> Use the PCPU GPR infrastructure to implement all of the RMW ops which do
> not return a value.
...
>  #define __PERCPU_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\

Isn't this definition exactly the same as __PERCPU_RET_OP_CASE() except
for s/tmp/ret/ and the 'return ret'?

Since the compiler will just ignore the unwanted return value
there is not point replicating the definition.

David

