Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC56CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pajLU4q8bCN5YoHUmk+hCyhoUL3rH3RIe6W8LPCHUfg=; b=4sJFpsvaQ43WCSpjsdcSK66tRW
	bDuHbR/a/Sxp0nmDJJOKq+dsF3BafY5UzQGcMQib9j28sfpCtn4tbD9dfAfg/ZYZiyRFCy4Y/LooX
	WfO1XNY9k//47sMmJTCcZGYRyel6znxMvs5KGKWXSUf8Yx+OgQb2t81PSSMf922AzIRA1usghKoCP
	g30TgZ+2otbmoYciW7fsa4gyGlYURVuz6mJGWiXiEudw8/KXVDImL8gnCrv3fO/RxaZWJAxWtvehk
	4YY1X7q/i2v2/YTIK3JQoGRu8OAEAMCWJB6ndTkq/1EymQOTceSz5BK9XI9xJJd9d+63FfyyV66vl
	esj74Mag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjpq-00000009ryF-0azy;
	Thu, 11 Jun 2026 18:08:58 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjpn-00000009rxv-1jFU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:08:56 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso230418a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781201334; x=1781806134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pajLU4q8bCN5YoHUmk+hCyhoUL3rH3RIe6W8LPCHUfg=;
        b=i8McFXulznYvVOd5s9p47ji5zukPNFTmjpRfzwMWI4jhE/AJPexyJaSJFN+exOIFU8
         1Y9pAWgDM0Dy9qpKfOrqgHydOWIDvjgVV9gkZWWENiaw0soPs7e40jYm273v75+CDr6Y
         DjTuxHCCR4+76JhRWHNtBD/cD27VydiAji5PBF45NFv9ZVwShrQW7PBFTAykPOqoGBbE
         1UpOvXy/JV3XLZH+JbSEDcJ4c+z7apFqmU0wk6ewLad7KS6nPEbimk3f4SIijLaRXD5c
         xX0kibtJRkkr8hkxFG/hQWgnH8cepLA8AEbpcE5MaTzXnX7rm5AW9CovQldIfw6kKBm1
         CCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781201334; x=1781806134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pajLU4q8bCN5YoHUmk+hCyhoUL3rH3RIe6W8LPCHUfg=;
        b=cIqKt8OdiOdrNzDnJXxpiC4kSp7pWSv06Pp/H6GGXDXJDbD2VNkBZSF3C7+jKU/7ny
         1D6QtWIzJWlguSu3LoP2B6o62RT/2L5RwwyRGWv+j/nkNzBQfIYWhPOELhxrFCmRtwBx
         CPBMubPdEF6B5ePqE0Y4yIklweUyFUQbePMCp6tksd4qrbmU+CWMcqFpqtPKB734PPwF
         hjePsf6KfSphyJQMQqsmfQnAshymc8tOMR5kPSPTdV8nfKbat58/fzeW5qLeUNiwdA+p
         55QVM7KAWhTtybUNbmmQ6R+g49VMnirUb/waNbBZrEe6Z7x7cmXvTgegF77NpIN0LB64
         4aqg==
X-Forwarded-Encrypted: i=1; AFNElJ/Hw+W7WrBHPR+R1grFfj69s43PVGvXtuSESTY682tl+jLZgAOlluqblermj0WAPRvkqXjEutqWuinNTk6A6nPx@lists.infradead.org
X-Gm-Message-State: AOJu0YzhjC9bb9t/z2J9ablhooPcejcdPkywpdr56PLSxhLFVVGSGDqe
	t8WqgETcZ2rbt8L74jbqNPzgA6ndQoJOXsbn+VNwO7RYJ3AaSXw8hlUQ
X-Gm-Gg: Acq92OGjItb2vRsiNxpeMZBga2uIZzeiZ3K4YcaCbFNvGXNpZ7H9v5fctNhqv+bPZra
	YFhTTNu92DWwvr0NXtx1VScAXd+D5/qZvV3Uqrix/hEOrhTIGtbgidJLhOxdDCVkQIiKGX+UBOI
	cEGbKjdg+52P8wmENV+EU5s7rlET4MQTmXSlhN50esmziGriuYY1ngMn9OkmSya8AOCrDwuAVGX
	RcoAzXO5T5FHyVB9zev4ffVUJnOZdRjoyabkLwok9ua4lMrtZ9wdu2bA9mqvucnPSh02PKLfRaj
	FGt8mYQklbF4osrpaH0Qqq7Kgc/2ZSpwrgcXwTm4pJOT415q6sk382e7eVtJSVVsWck3UUEV3u9
	MP1U+YhCvl91eevayGLf5I78Mdly2RF7XonBfEhZF60wBEB8MoDm3DVPiCXM6luKzNQug8+ABlX
	vgyXHbwGDCwnYYSsD4ueFJODx/75/zPnUEGbYYTfqMVb21iFq86jBbSxLY
X-Received: by 2002:a17:90b:2dc8:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-377aa799f69mr5239736a91.22.1781201334232;
        Thu, 11 Jun 2026 11:08:54 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.202.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37752d59ff8sm3256230a91.8.2026.06.11.11.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:08:53 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: andrew@codeconstruct.com.au
Cc: joel@jms.id.au,
	andrew@aj.id.au,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5] soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
Date: Thu, 11 Jun 2026 18:08:45 +0000
Message-ID: <20260611180845.6556-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_110855_481519_62F925A7 
X-CRM114-Status: UNSURE (   6.58  )
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

Hi Andrew,

Thanks Andrew. The __guarded_by annotation and context analysis integration look good, I wasn't aware of that infrastructure.
Thanks for applying the fix-up on top.

Thanks,
Karthikeyan

