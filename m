Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96237FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91hMEBpF69oLnRNrnD3g7Le9m7vY7PSSwV7tbTwrzn4=; b=QBRA9WcFeqCUcN5Cw0Ns1FUddf
	bwOPH6KAgxW0GfvUeo461PEpH6FtUkeV7pu+A+Yr8wAbbr500E5wc3z56Nf3BU4sQdsHUnq9AX2ul
	ZvZNCwrMobIYjHXhmSAL9MtzHIFttmEZKZnC3DVxgl6x4l5ED4qdyUKehhVXGuLZ1y6O8kgLfMWok
	QA/NyaQYSpZUGa9f6ES0cUeOTA2u/PBNEUkZT37PHBGm3leD7hJOuvyG2d6RqoN2RiZ8YXwZT7HpK
	Ephb2c8+w7QSj7AQ6p9ZCpAlM52uPMRRRhjmF5FtJt+aNF6tebW5SzqxkpQrLx08h/7MXzAfGtvyT
	YbWpxBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHRr-0000000GTky-3xY2;
	Mon, 27 Apr 2026 08:36:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHRp-0000000GTjm-14Yz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:36:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso141016225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777278967; x=1777883767; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=91hMEBpF69oLnRNrnD3g7Le9m7vY7PSSwV7tbTwrzn4=;
        b=ZpJbsCFix1N7qwAscdS6e/S48YOUp8GWjawp9YHm87j90oE12nU1igjj2Ec9b7MdVs
         8tM9urWFY0R1k81UIDp+ycQS45M3PzNTxf1uB7m/KTg5hTW9RIGawbTG7GH7/I39JeOu
         caMm3OHVy3nzYfyx51miz3CgLlMAIooN981psMAHpwtn79dQme9lJaixPKNvZgtCCzTu
         6eco04SSzz76kkSrbfZsWin8Zahtnxu83nMKvsXFr1gRnyirlOpR93/5QdeI010bWN/L
         ZS4gvZOugRZ8AIgu73YnhyBz6Nd//Ia5bC8fB/nC+Yf9NFENYqzc3TLDLtLObxvqM22C
         JmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777278967; x=1777883767;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91hMEBpF69oLnRNrnD3g7Le9m7vY7PSSwV7tbTwrzn4=;
        b=JUtDvNGfNQnTCtH7bOzWTXeNXCHzWx/xwEwqEt+yd6E9bdsZZEaggyQVG3Lv5oZbVH
         i37154rT0RUCtFI/1Lni6DiWpeCt+e9T9XL5if7j0KB4pOXiDqdQXjwq9wgLl3x1mdG4
         iJfIYVJtkMbBPonX0rzp0yUZykAWE5XHoFqaAbS2GpjVKqLRmeIMAX12IiFgmMoZ8om6
         WPgzNNe/9BSXs0Et4NtLE39zA+dH+YlKNXhtdfUIb6GsrYsEj8VcIduo09+jAF+l4Y1C
         8MaGKJraIzL4K3MwHEgxEYgdx/X45ltptnsmen+6MdJj7fo1K0G7kHtWdjPtALLSodnJ
         sDMg==
X-Forwarded-Encrypted: i=1; AFNElJ+l/iRWEv0gZY7wev3/e3Rq1tLbfck6iVoD3Dog76cEQI8L71uaxOXbnOjJ15x8mW83VTofMQZ5czwyaQWDeAIv@lists.infradead.org
X-Gm-Message-State: AOJu0YwwDYus9bGqctLQFSy7BQgdXKrwVhnWZcPC2UIU5x3y6OgvDAp6
	Q9pDk2/CVAShDnhLXw56epKI6SeJl5PR3xei0skxWfRLYTIqny7Gp5I7
X-Gm-Gg: AeBDieub+T4n2TcdA0aS//tUHg/doeEAOs4dCisdKSXl1FeIZb/Ai+VSBd/Q0IeZblq
	bAEO7UlzMijvuAeOBnKM5P7ciIR5awrPELx+8tt6yzcD2ZN2S2PzH24vZacb1hBo68f51RNghBZ
	LCXwHBSW/iBOc3nJfP6U48WTRZvjyfXlNXgaCSmknl8nGi23C1/68t/F1L6HWu333c7+2HUeKrG
	zCzjKuDpMy+LUyZeGPJMM5apNW/sVFRCXqjTGtoxDzwk6HTOvAbJM7XqGd9gp6rU1RggT2GEFHM
	B/hIyRExNN2zLRbXdbkE55KVF714O0olGKCRf0J7G7IPvmDO5BifBgEJQ3C9IBW0b2aXtvbS6LE
	hft5323XfP58r3oe0AbVvgCfBKSLb1URdIFMERLmlNkavQpTB4AOjfL6m+oglpZbQPjRV6gSYvn
	obLAkICkQ1Tq8Yck4xCPJbyJe0O3i7Cvt6EQvP
X-Received: by 2002:a05:600c:64c7:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-488fb73aa3bmr605203715e9.3.1777278966523;
        Mon, 27 Apr 2026 01:36:06 -0700 (PDT)
Received: from [10.176.237.185] ([137.201.254.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm90573903f8f.20.2026.04.27.01.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:36:06 -0700 (PDT)
Message-ID: <d7eb5958dcf2a27738973b0c876308a8d34ea47a.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: core: Introduce function
 ufshcd_query_attr_qword()
From: Bean Huo <huobean@gmail.com>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, peter.wang@mediatek.com,
 martin.petersen@oracle.com,  mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Ram Kumar Dwivedi
 <ram.dwivedi@oss.qualcomm.com>, Zhongqiu Han
 <zhongqiu.han@oss.qualcomm.com>, Huan Tang <tanghuan@vivo.com>, Daniel Lee
 <chullee@google.com>, Liu Song <liu.song13@zte.com.cn>, vamshi gajjela
 <vamshigajjela@google.com>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Adrian Hunter <adrian.hunter@intel.com>, open
 list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
Date: Mon, 27 Apr 2026 10:36:03 +0200
In-Reply-To: <20260424151420.111675-2-can.guo@oss.qualcomm.com>
References: <20260424151420.111675-1-can.guo@oss.qualcomm.com>
	 <20260424151420.111675-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_013609_299379_BB210E56 
X-CRM114-Status: UNSURE (   6.98  )
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

On Fri, 2026-04-24 at 08:14 -0700, Can Guo wrote:
> Introduce a new generic function ufshcd_query_attr_qword() to handle
> quad-word (64-bit) UFS attribute operations. This consolidates the
> handling of 64-bit attributes which was previously scattered across
> multiple specialized functions.

Looks good, clean refactoring that consolidates 64 bits attribute handling.

Reviewed-by: Bean Huo <beanhuo@micron.com>

