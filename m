Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A661CCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 00:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1QXi58qlKHlCD7Wqn6QSRPDdT06IzAWRUafTU9bmtI=; b=gjuNtPT3WzvK4WGbMKasxGm3q4
	dHQAsiHPV+uF+Rj9yJqSRc6QIL9qY47IbBMNMMWpQLZEHNGRKZ49hx7stdyDhQVXAjgPuJLiv0el/
	bAay3aNp0jSYpt3nuvVMJnr4ejC24anSfa51KsGhHFtR6fJDXEfUjv8wXLQhDkjSGkmBl8jFtp4OO
	rUC0aLGX/QnQIO8daJqz3oeRCYUGDKjJvbzXqwtM+hrQK6uzMN9WmogvKc3ZvWEfWO9i0Bmsf79r7
	cSpTgTE0jFbjvE9XpTDpIm4al9okoJluCJFSarP6ygTo5IhvkauqysIr34MM0xtCcItbjifiGQyPo
	J622+kmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKOD-00000004Cig-1qYk;
	Thu, 14 May 2026 00:57:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKOA-00000004Chz-2MmA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 00:57:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48909558b3aso72294295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778720240; x=1779325040; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1QXi58qlKHlCD7Wqn6QSRPDdT06IzAWRUafTU9bmtI=;
        b=v9fHPFabI0b2xMUl/366cGWbvqrRFUExOiENLLlaHDk+ktCR1qgeskbflnNOBzXbQz
         ThuiOKB/N8KANFZumswF+fbam+0rhPvUGDA68nkaiabPJPUsNhIZ2bssxZ9JLRyumqJ3
         RnuEpwqVZ7nyO+ociJMjzbdDo430amn+7DvsgLjEJ7Zb8URr3auqC8QRdgeYn5AQugye
         nv9m+rp8kg14nXfTi6Y7kYNUkje1IMa4PPyycZNkXlbXYnDERzlsSTl8HIx1r/AyKrXb
         yiynaLRUy3qwY8ob/+A/ArbKT6QTADWGnQg7Vqj9394Oz2RDbB41MXUd6Ysk82wk7aet
         hf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778720240; x=1779325040;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1QXi58qlKHlCD7Wqn6QSRPDdT06IzAWRUafTU9bmtI=;
        b=Zt3Ma0eIRqfb3lCPfC1TVZAtLmGKp7o7pgivdxu7wsQS5R4su02vx8c1TNOHRZURx3
         /tebfapDkKx21C5piLStY8IdY7QtjKrKfc/mBNc1Y2LmBKd1vU32O/WJ3rOqHfHyKaq5
         E9ABneOpyiC2+/tClvy0lbWv1sADShpHP5pqjStvDm96TnttFePh4dIERZwaCYAuHsTE
         FZW5WWg5MHlFRdlHo9mkN+9FB8F9EvYc0AyL+vUolfN/ZeUJMuNI7RsoJ4/8Q45rlodn
         PYUh+feXEcBKebT+X6vnilX37OE2sHmsIyT+/bTZrC2vFXpvm+QTi8DAcRokGyYUKiLr
         KtqA==
X-Forwarded-Encrypted: i=1; AFNElJ/YIg19VijKG68W4mmj7KJhvlm5zzi7ktIFWvlS9UAfghGWsER19VG/HGZSDHb2AIeqB7kmEV1l0yQq2VuzeZgZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ0T47srHnQ92iZhyk4QVlad1jO88QL7QNW+iZQCZLFSGP6fo8
	RdZfQOpXm5ol8/uncqFNIDfRqH6NeJZTRLjjxI5/WdAh9yyyFHL6UPGTEltil3ViSEM=
X-Gm-Gg: Acq92OHegGK+f3tyBTJm4PKUduzpxXYOim8zqdoGoA2tVYz+fskkDtEm9mZDTpOiklM
	AnWb3mnDqYgp2zVa8dmmA5wxoyeiF33/SwI7YmK63F8QPxs0qUmWwDUtOLAh5T/gMZgt4g2G8IG
	k1qR1vOdxy6qLwhx9vOdeHlwJovPAo5WB4DQKGxR8oTdg+lci/HWLtipQdWd7592EW/0qYVP09F
	N5/gkqtE/fyHD2cHtDXYHaS3xQEiA+3z3xNq1Q2VBZuPPTjaYqkn2w0uOQL1vqqiXa3bdmQie6J
	0f6Gqp5rOD5VLeNVtt+gWaOAM7/z2eVK/VHTIFTuoVesPk102Yb6dSLfZ1/ZBtonB1ctSVE9GHg
	T5uCPYWVn9JPLj98nJy2AVcMQIdOIsKaI9C96MzhStJLL47jgfdMC4ZMk5HIz/P20/eaAuQ+EVN
	XnYzgvlxHsk+pMd7Woq6xdTppun/Ko6B3AJJEpPmeVWqJs/P2hoxrkKPk1GA0PBlvEygKFF96eB
	J4ATuszu6vdLQ==
X-Received: by 2002:a05:600c:3109:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48fce9ef234mr73045015e9.13.1778720240170;
        Wed, 13 May 2026 17:57:20 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd76911b1sm6210275e9.31.2026.05.13.17.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 17:57:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 01:57:18 +0100
Message-Id: <DIHZP941PFXU.3I5V0ITG12EDC@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] mailbox: exynos: Drop unused register definitions
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260430-exynos-mbox-dead-def-v1-1-a69176b7d0f0@linaro.org>
In-Reply-To: <20260430-exynos-mbox-dead-def-v1-1-a69176b7d0f0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_175722_619829_43732F1A 
X-CRM114-Status: UNSURE (   9.08  )
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

On Thu Apr 30, 2026 at 12:12 PM BST, Tudor Ambarus wrote:
> Leaving these dead definitions in place hides which registers are
> actually being used by the hardware, making the driver harder to read
> and maintain. Remove them to clean up the file.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 7 -------
>  1 file changed, 7 deletions(-)

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

