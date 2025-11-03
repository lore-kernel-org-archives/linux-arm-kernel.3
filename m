Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E15CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5HhCqdsQfAH71nlBy5jT8rmemhezTVFDs0Da9TumsU=; b=VwgEB7/uR3CbyE
	YLfDcRdM03Jy0Uwzqo3M1HcVIeOFovbHfN9J/G2X37jW3S+9Zp7gETUHZYnMQR9IHZ9E0AIrGwKZj
	p9nJHfINUZtTknXEtw/GL64qT7IA/xj2ZbGbT3M0+G/PiWfslRbf0ql444M6K+qyf+g0sVoIUZv8/
	5mfX7jMJKg38nhFS+B5b1WztVoDW36jeO5vrorIe4v9tHuqM8HP8J2QcUZwVlYEuew7c3uT2MTGPt
	ZzFc0d69whcW/oW8RL5AcS/i5DtSC5skcJpknNxszdpExywHEfhrw42+7/wEF4E+fJvdvIJXbDI5Z
	z3uutKtr1ap1txtI1xCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvz1-0000000A3iy-01IN;
	Mon, 03 Nov 2025 14:56:35 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvyy-0000000A3iS-35EO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:56:34 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-592f29e273bso3924905e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 06:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762181788; x=1762786588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5HhCqdsQfAH71nlBy5jT8rmemhezTVFDs0Da9TumsU=;
        b=wVf3GCNvk5ytFkw6J1H97Q1cfWAF+H1NYTytZPyBXnFCkrxD9/3FHQKGf1f63lh5ij
         oa/GDuCs3tgAosoNoDUC3tRMfiV0ZT0+tCOXWHF1QBUCmFw/fQ+2+NDXM/X4CyRQZSRv
         23v5aspN+mvDQ99JRGLgm5dxdpbgeapsxDAs/a2p9+FLG0IqecB77WiIHBhfswbjqpqi
         MSN3kfKbiTEGANJKfSdV4G5l4fIK/HcA8cOVccakDhxvt1FZwr+Gz9JL3fwG5Z8m3Ygm
         svywOCZtsyUQ2j3nuPrRKm1L7tniDAxIxSHRrDIOmGfc1VeKVAC8eDDfOfC973pIYoUI
         kKHg==
X-Forwarded-Encrypted: i=1; AJvYcCXnEPkubvpmfgegouTx5mM9sLLtbAMqtVVlsJVvm7ZSnOh0/IDed7PgL2q05wRQOjBuhriCGKdrLvTd+S9JDYND@lists.infradead.org
X-Gm-Message-State: AOJu0YxcuZEfogSLd+3Rf7BJ3Y0qftKTdXNZvDCYoub2aw/X/n9JtD8U
	6PTUIY9DZE812iITWOF/Zrc5cJOvio+0/QALtA8rKDeRkN7KpHD2DqVXbygIxWal
X-Gm-Gg: ASbGncuNutBmbPB6FTUmav7Vw63oRMc9rxWo+NYekdGx9eBUs35jq9ZZmtls5ilD1S3
	n+Ac4j31go4CsO6SDZz4FkPW67fGiNm7HF4lqBiMW5zBZfLzuJQ3MnF3FITcuqPXj7R/GdlJw2r
	t1DQDMnc13hAj7yM1RpTdtxthLSV2JSIhpjykASuk3IgdV57ZsZ6Ogb/cmToIaCRtM4oS89it0K
	A+LrNj+4f4rR+KuTpx6La7+TjwxZxg6D+UdEmSdA4aC/HQYFH5F3kkKCY9xs0CZpqetVRbskU5b
	2TEshT7AYlBcnVkFD87Hx9LQrG0wC1qtte+iY/eXPe8FcoMOPj/0qPWXJNH0P0xQExeegIc1wSF
	uIj8AvJEjObCz5oxIH5KuviJOdttfERUrpkDS4FxykbgaItJsO78IzmqL3vvNbmmX8jkbtAXMFb
	ZMLvQwqnrPtbVRwWgw98pg9vPxunlVmBJkayM5SpAapXw=
X-Google-Smtp-Source: AGHT+IEoHRnzNSsQ6+rTV3vT0k/W5WVTUhIWkSi+070Dt5yJLz3yAcVPSLBOkZ6QScphqmFNOvimTQ==
X-Received: by 2002:a05:6512:39c5:b0:594:2d32:6efa with SMTP id 2adb3069b0e04-5942d327209mr1007762e87.32.1762181788049;
        Mon, 03 Nov 2025 06:56:28 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5942ce50bf8sm1019866e87.50.2025.11.03.06.56.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 06:56:27 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-378d6fa5aebso44914091fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 06:56:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKxpr8ZqdIO0uiBAt9HThqwNC57woSIonD+UbSaB6jXkRhnuWj5Pk+Y3Fi/V/nX400xWDkiqVgAn5JnO1fnqk9@lists.infradead.org
X-Received: by 2002:a2e:8317:0:b0:375:fa47:14a8 with SMTP id
 38308e7fff4ca-37a18dc644fmr33438281fa.31.1762181787126; Mon, 03 Nov 2025
 06:56:27 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-22-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-22-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 3 Nov 2025 22:56:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Sfk7WvEXNnRfKRehtyn-4KhPBER9tV0E2_pX4JxGC8g@mail.gmail.com>
X-Gm-Features: AWmQ_bmDRSdirXrFZY61Rit-O4eYxqlNFv0KMpQajaon1izsKkp3c6YIV8hGfRk
Message-ID: <CAGb2v64Sfk7WvEXNnRfKRehtyn-4KhPBER9tV0E2_pX4JxGC8g@mail.gmail.com>
Subject: Re: [PATCH 21/30] drm/sun4i: csc: use layer arg instead of mixer
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_065632_774416_1A1F72D3 
X-CRM114-Status: UNSURE (   8.01  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Layer will be more universal, due to DE33 support.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

