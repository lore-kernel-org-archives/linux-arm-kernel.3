Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989D8FC72C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 23:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGIgG4x0tVmgRfuQsw6tg6zo3VdRQ0TMw0o7dZSruE8=; b=wLlj65UN/ykjxRakD09OhR/R2g
	p1ChK6DEhICmnVIhlms/f6MXuIBt5NygJhzJuwm6mPb6YxBhmP3PszDfqAAVWFLGddiLFLbigOueW
	BsZ/bhY3u6fVhxEInLGJOQHMbooPWBi7xXOdClhXpj9HKefRtIeYMGd2BSnzEL3Xlg2xwNnZn9EQS
	QKI9ocIgSQKujDc/em1RMsqhnp8HFY7R9bpcpHS7tOqrwWW8T5Q7x4LcTVW7qMbvloDX0FELniA1H
	EPiKC4GKulxwGDwe58mrlkqmS+vG2W/HAqfQmf90gQ9Aj/n230ZGJ0uW1tNOgVs+Uwc3V0dnJNNn+
	LdsZytaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p1q-00000000ASg-3eWO;
	Mon, 23 Mar 2026 23:49:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p1o-00000000ARd-35dH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 23:49:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so7401245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 16:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774309787; x=1774914587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIgG4x0tVmgRfuQsw6tg6zo3VdRQ0TMw0o7dZSruE8=;
        b=YauU5IP9sXaT5pVusZc2xEkds0kO1SM5dYIp8YCR0LkmFn2oq1b6X3Vn6awyK7CuK9
         frFb25VJ6GRrdKA3D53hW/ZwkvrWUqCGiaIlDMu6O5MJ2dfHaW1UUxZNzIh794DOU5V3
         zVAR4ugaLz6CCztVU9BMcqI+zo8GcFBxOZfOqP8lXked31fzlmZuDPgi8FUHNKuSy6KV
         kMTH3A2CnZ/tcMhOlekR+p/XGTqD+NuIQg1KGIw64xKybg/eUOqSDKNTFiQi3qYiXi7G
         KOccJnPD5/M4dbUrcCSoS9FUCm7vbf+HXE0wLTdM+w80li2nHqQP3VM5EJTvDvpCFcDZ
         bYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774309787; x=1774914587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tGIgG4x0tVmgRfuQsw6tg6zo3VdRQ0TMw0o7dZSruE8=;
        b=orJ2KaAgDvJ6ePdFi3ekDaiQopW2Wmt9pUeXeJVSoiCnEJtAsxwNyzYagIDxwyothO
         Y67s9BqviwSQCgHRKB/gabBl/lleIBMhE/irQBxfk82gqr57qJg9hCroskZtN2BWXnhx
         H2NspjNVvHv+b3RJtRAoSMFJ1iFOAgPV+srpHJKqVKXBqflJINY61w+MUKLKB7IM1avh
         esQvlBdNKLjnkmnzDKRKMLvCMkwh0Fa0Krd/BZhTGt+U7yyzl7KtgnlI4dhHzwyVDa+t
         j8d+9r6TaSC7Yf7Cuet/VtZWqtKiLRD+OcNoy4BE458JwzN6w6uMK03eZoTn5dKUF2RG
         JgRA==
X-Forwarded-Encrypted: i=1; AJvYcCXiq1eIGkKWUZMiPRxkgWFv7g1YaiZL7gll527ALQSCNkV/RUNElHZ9UIrDkCYKrNnV5BR/XHCQtjHbZWWXZ0eQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwWzTSnz7HSvYzp6QvLZqt6D6N0bQOouBcI9Shl1ZyJaDXehqB7
	1zJcsbAX3dagkmBnBzd2qelk+qnvlsE1C5kUVEVA9qN2JsgjwMfsyl1I
X-Gm-Gg: ATEYQzzYWYABLBcBp1AbZkWUrE448vJy/3KA4Y2WWS4sw5eJIQePnKdLE59v5TzuSwq
	moqCZowGTx7prZ8tvQ92xlzfq8S2du+6mAIlL7K2wSC7iOvNFnxtOKTJEt7f9RiZGv8lvDCerLA
	i6Ii99mf6vvyW1Nhu7Wm5iNf2brsVeUoSVz12A44XyVcgKsIpDD9bobtb6AJfyNeo3RtTuBT5qr
	kl5Q26YBIGwKrK2PkF4hUSfjG9MaR6TSShLAQIL4SP26Ix/T/vN6LzRKSLrDgfbmDHdnguXBhjE
	PST33wNhjS2totJnAVQH5IghF0pr4xsx+vaoBxskND4F23ihAw9RwAMHCe5TOU1s3Iz9smjo1UD
	6C6zGE6q4gNRy/F7C9bzc1VhWj2qf2szFIj+K7KoY7so2gmEKCFbF+hV/v1OA79G5g0lxVGjNuI
	pyV2CDSl+NUtFl8qdyhjbTih9RXwWDr0880yF57YJIww==
X-Received: by 2002:a05:600c:3546:b0:485:3f1c:d887 with SMTP id 5b1f17b1804b1-486fee28918mr192372785e9.26.1774309786702;
        Mon, 23 Mar 2026 16:49:46 -0700 (PDT)
Received: from jernej-laptop.localnet ([167.71.101.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116939b8sm12830385e9.3.2026.03.23.16.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:49:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: sun55i: Fix r-spi DMA
Date: Tue, 24 Mar 2026 00:49:42 +0100
Message-ID: <2822434.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260323171927.1256507-1-wens@kernel.org>
References: <20260323171927.1256507-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_164948_778535_E6A6EFC4 
X-CRM114-Status: GOOD (  10.11  )
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

Dne ponedeljek, 23. marec 2026 ob 18:19:26 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> r-spi has DRQs for both the main and MCU DMA controllers on the A523 SoC
> family, however it seems it that it is mainly routed to the MCU DMA
> controller, with no obvious way to change it.
>=20
> Change the DMA channels of r-spi to the MCU so that it works properly.
>=20
> Fixes: 1bec3bd1f839 ("arm64: dts: allwinner: sun55i: Add SPI controllers")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



