Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E82D3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 04:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMIVlrIRMHzT8RfJZ0XmrU2xGjPLrLeQG/AGz65dD1I=; b=vsv/NINe5uRcye1AmGt76TtrRt
	F3HUHyje92S2PY7mEQqqElCvWWemc4gGravhz5liSQRfAh3EMBNb8vtfscpxjR2Tqk17n3L41YzII
	2p0CjMUQ59njGoOc7HNP/+a5lvYz5LMCZF3KvIIJRaLboM0FHoD3j1iJKqQIvO8p+MDttuVL7xFRC
	K0xCQXUfmnVkwJAg3+WX9jw4pb7MhJlOVWg+uhHXavHOrD3BRISyORgLXryYDx3DzVt9tNu+7CTlg
	88OHzN5PAv3Fw2hCBwnlNQ5GixmnX+cmcxqsKHz6znZh9tGgh435NHnzM/PHV/dVtsdIJKVVu9iXH
	tZZgA9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTC7j-0000000F6UC-19ja;
	Wed, 10 Dec 2025 04:48:23 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTC7f-0000000F6TP-2FtV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 04:48:21 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-bc8ceb76c04so4458767a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 20:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765342096; x=1765946896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMIVlrIRMHzT8RfJZ0XmrU2xGjPLrLeQG/AGz65dD1I=;
        b=gnqPxxWGZMK1haoPkpLT11uZ6opQEoBuvugQNtLgJ/zllV9FIVrDcaGLhJD/Y3etPx
         OhPxEsaBKfdCi6Kzrtujrdk1erDM4UZ0idh3vwi/B9md28FJPKY1h1gNnGhR+5Ojnntd
         ewXM1rLdUauCjDpVlNMEfFWH8wcxNMim0K77X0iEwCLee+vAHrmgCtvbH6t5k8ApYYTd
         b6tGJ/VIRSIaPdZ4xGiJo395tj8zxZsp1qWIq4qryoPaJodvfopGGFhJhi/7QTqoJfHo
         8iuave2w0Ogh4cEAoqjFwvvuyWeaDrGj1BVE5nt5k7PODH5vg5FWOsTlAeQbQGq5tfvA
         az9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765342096; x=1765946896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMIVlrIRMHzT8RfJZ0XmrU2xGjPLrLeQG/AGz65dD1I=;
        b=VMDRmWu49C+dfPy4IKLJFFJD41VOqzxquMKOVoPIsxQNWty6StQHtJpYBi/Mw00JF5
         OaPYyjRlxpXVt+lBBn2wAOXcPeEczweSK05DVcZ192EqPkAInWCD84moS1km2pTMc6oe
         6zJau4BpRHtuKhBijKFWnMzw2MRBcz4s7QSHEMgq7DjKndXLq8O0XS1Y2u4tvP028RRp
         2KlKW1bDDd4+v4q0VSU7ix4HsWOG9yCjdhd2iGj2ZaJcNB5kqfmP5S7RkO7TDvgAxnaB
         u5cEJac0C+6YtjVJtymBEHr58MhLsiWh6uFrF1B6bJhez/xFPopELuSY6V9GGaMoey8U
         wuoA==
X-Forwarded-Encrypted: i=1; AJvYcCVgeoUNFTVDhfKeJQDwesT+Zh5SNSueg6uZRnZImtD4BhN6hXRceJxCVDv6ug1JQPsM4ukoDgJFBY3+e7YnhVHx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmolec4BjSp52VcP59/x/jLUrZVKTdQdfRXTQMMhZsYpV/HXxK
	Gne5uyBrRAeTp9OJsSIY84C7gvkZGQnQSey4XfndsVzdoXIYKqs87eKl
X-Gm-Gg: ASbGncsqawrf7B9u72J4nrGgBbFk4yZg3VVghiVwA7UCNxEikqY7htb7WD9bo8CrPxq
	KZcDMTJgRtSmwHP1xEFuqHhFvBNX3Zoy0dLMu4QtLXfRujseDIlgOsGh+LmpqKnnbo3sjipwCIP
	ioMxYvJfMDZVHkEGHrW8foTfEq804I5enzCH1zum3WvO/9VgGflEz1V2fAiPPtoU9+l/d40oijn
	nRyMD6OOOctm8aRIrcEMdpi6hbR99s7q6S8fRKsCytWmk2nEC8UY8DsvWkew3iXMEOZ1kWQnPgp
	5y933tWtxvl/prTbLdNoDnrEugXWz4RBl7QXZh0Md3wyNotQqrjZI/leTcTKhCMtLdP+0ZwVdEB
	lL65W6hMsxp2ybAhFP2VyNEOox1w87UqNRtCc5dQfuzq2F0R4+jVdcZKImtNbuacDzjUz+5N6kx
	a9oeK0kClpPiTOGVVMuwZJUUDE/6jn6a4qX5L2Zb3BGDkdzJ8MdZYfMFCgpGK15MM=
X-Google-Smtp-Source: AGHT+IGwhF10o8oXBvj6kF3XVHLwewCx7u/bdxSK0ksb+PGLHRX/iWeDMbigiy2qXuWF8UnfAfUzMw==
X-Received: by 2002:a05:7022:4299:b0:119:e569:f626 with SMTP id a92af1059eb24-11f29689922mr965432c88.31.1765342096391;
        Tue, 09 Dec 2025 20:48:16 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:205a:5a0a:c468:f44f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2f3csm72522829c88.5.2025.12.09.20.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:48:16 -0800 (PST)
Date: Tue, 9 Dec 2025 20:48:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	louisalexis.eyraud@collabora.com, bisson.gary@gmail.com, julien.massot@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] input: mtk-pmic-keys: Fix potential NULL pointer
 dereference in probe()
Message-ID: <inmlorhcpi5g7kfs45rhtpwq7aatmzxemgnulamvjqxmmmtl2j@vfcd5kndbhep>
References: <20251210030013.913-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210030013.913-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_204819_602469_A47F98C9 
X-CRM114-Status: GOOD (  11.72  )
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

Hi Haotian,

On Wed, Dec 10, 2025 at 11:00:13AM +0800, Haotian Zhang wrote:
> of_match_device() may return NULL when the device node
> does not match any entry in the driver's match table.
> The current code dereferences of_id->data unconditionally,
> which can lead to a NULL pointer dereference.

How are we getting into probe() without matching compatible?

We already had a discussion about this in [1] and patched the MFD
portion to not use generic driver name when instantiating the keypad
sub-device.

[1] http://lore.kernel.org/r/20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com

Thanks.

-- 
Dmitry

