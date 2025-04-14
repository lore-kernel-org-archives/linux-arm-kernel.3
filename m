Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CB4C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27blyDXAmQsVOsKFI9FbgvEj0N3VDQZVe4EB+Ij1Y8E=; b=WKfgJeuRIq50hpMmfr1mIwyD87
	ZHFQIQtjvQm33gcHWLwbt9eQT31Z1e17UBQ/Fe7FkcT4BjA2jY7RSwroLEi91ChK1SQoiKEQ/2z8J
	/a7q+6zfEIIGfgIQPntPvs57RmWn3wHjZfDOQp3I0y0P9wAVJ+F3k98EBt+oV20i9HBPTsvjsyvmJ
	9IXRigLitZB4X7oIvDy1E1HXOgBbEk2ZEQDAnEd0tjSq0hLEcga8vnXxqqyKiSflBN3SoNJv9sCs8
	PpAh1sZqwI7h41K8gOaiG/ssFRjGJkl5f0yH9Xe3El/T0J9AcVzb+JjbbvzhKnJPP7ivJ5rXTSPGf
	tkrotXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IaC-00000001sft-2pFe;
	Mon, 14 Apr 2025 12:06:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IQi-00000001rBa-0UZv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:56:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so3598866f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744631806; x=1745236606; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=27blyDXAmQsVOsKFI9FbgvEj0N3VDQZVe4EB+Ij1Y8E=;
        b=bRqUuBw9xXbrefp72UM3w+E0d6dzYT8TgA0cZxm/ezNNwV0F+wn5YubPZbsP9EQw/8
         Tw2vkSvYx8MaV1g/h6lIOKnIHXBg+CqqD6OKUJ5blWH5trlTHTPmp2gx79RNY2Z2OkfM
         LqEhL2mBZDDth94rI2406RT2WxoTonkqpR4Ezwf8yd5+i6JW+TxCJOLKFAgbATRwyj9u
         0e09EN7A3wClATwL24Oi3qKPQKEVQn2kfgGynJc+ICk43uJIZd5Pa9gjFaJUuuzCsl+7
         BfKCtmy+wW/0mCkL0Q/cdRo/GudkQ8YTQrddaQue9UfzLGeedbw5HVKuAb2G+7qBVKeo
         zSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631806; x=1745236606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27blyDXAmQsVOsKFI9FbgvEj0N3VDQZVe4EB+Ij1Y8E=;
        b=vWNdJ1gRj4O+6bUcu7ESldFaxEldWtCH56zL6b97Nji00r95BbP0KcXwTmrvZTqFpF
         hyQRk882Y+t1cgoRTEKP444K5B34OBYxyNwfflKUh2EL/jULynr5IUuKDXAqJMOEGF2d
         B+CKcTVynURdtHTmzcb55QpRO9SITj+N30z8lqsIbYonyjnt8M4FBlvEFzzIqN60tTZ/
         FLK+QLEFAEp8XpNWb8VRnwlXVUDFFHLo1iN9zvm2WsXy6lSZj8roFdN8fbQEPrK9ZGTG
         V7EGHLW1fuwFz+os0rZMZXqEqEo9EZSls0rDM0iArtGNPcR172o82CQZ9GZL9RX1FN/X
         CVdw==
X-Forwarded-Encrypted: i=1; AJvYcCWPgVf16N9Tl3v1Bg/D0qRZ88PyRnQ/KpISNLpWyNLfmq79UqSUbEBT6Z+kdox43YpV4bLo60TiTn8bJThuNc1x@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8GAQRg/aT2v0kwjRXQgU537fS8vYMi0YMpNcSKdJMCUZ3y3Rs
	+PREUg0cGng1IHyWDPFh+mzMgzk9Q5rVRwgoeiphQ1T4BFsz29wWCBytyQ==
X-Gm-Gg: ASbGnctSWL7+MQfwY9ciKWtbdg0Q1NrsI353CrpX32GOPmn4x2teCgyrx+hRCqs1A4V
	jtZMn+AjnfwOGmjD1PZx+gS+NBGDxsdta6iGVQIvclDDq70S1TBZB+fLoMFfD++v4m//dAvj7hI
	85rC4ew4xETE/G5br46SMidMHHKOlmmJD1Br7cfQRup9+7x+PbmDfk2BLS+jNCBA2sbLp+RUUYs
	qEmFunaqdTvrTbmlL1CMnfPzRNmsdW7wrFHRiFkK8CL98xcEHQ2hVi46yCTnvKAdt7MKvVf4jwE
	fHTLumdLajmT5AF8HJsCHLh6cD9uT6yjX0ceqwTc
X-Google-Smtp-Source: AGHT+IGj7Vl3mhp98LI+iMc6cVdaQkfgWL6li+cKl/2bRIaqhFJ3JwH9UyrUXt2MUMKwXfrTR1rG+g==
X-Received: by 2002:a05:6000:144b:b0:38d:e584:81ea with SMTP id ffacd0b85a97d-39eaaebeadamr9595715f8f.45.1744631805537;
        Mon, 14 Apr 2025 04:56:45 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f23572c4esm176735115e9.26.2025.04.14.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:56:44 -0700 (PDT)
Date: Mon, 14 Apr 2025 13:56:42 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
	davem@davemloft.net, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/4] crypto: sun8i-ss - use API helpers to setup fallback
 request
Message-ID: <Z_z3-kNlDoh4ly9T@Red>
References: <20250407123604.2109561-1-ovidiu.panait.oss@gmail.com>
 <20250407123604.2109561-3-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407123604.2109561-3-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_045648_158926_CB3D6987 
X-CRM114-Status: GOOD (  10.91  )
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

Le Mon, Apr 07, 2025 at 03:36:03PM +0300, Ovidiu Panait a écrit :
> Rather than setting up the fallback request by hand, use
> ahash_request_set_callback() and ahash_request_set_crypt() API helpers
> to properly setup the new request.
> 
> This also ensures that the completion callback is properly passed down
> to the fallback algorithm, which avoids a crash with async fallbacks.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
> Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> 
Hello

Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks

