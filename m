Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6936AC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 07:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NK9DHfY2dsc8jq9n6ZVImYQWBLnQJ77QjsmfzjQ2MVM=; b=G0Z165m8J2nWtHqAcmylB/JAgT
	1Be6e3JZu1siQbgI/NVQdxc7tpOK5VBIaFAlQKYEvWa46EoORLVKNrBlBZvt5CP/4v/LX6rnhl5Yb
	T5hAfTlbT2P0P0IRGxAv7CQiKk216thgCxv/LiyPOPYXf/IPkTA3IBj8KxqcIQEzQ0m6TFI9FXrUT
	8+1TyFkorbZNLJylgevLoFCBRrX0UJOihnmhZBR9Ajoeq0K9qrHFpR7WCgWdSxnviiYzf44zF/X3B
	VmA14Ca/vXlxRSq1kKmYS/fdr0MSbuURiqGCgs/6cPdAet8Rp3RRpkMB4E9hKanvPM+KY7Yfy5B2f
	kKPOSgsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ5RV-00000006epd-3uNN;
	Sun, 25 May 2025 07:06:45 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ5PC-00000006eax-1NUl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 07:04:23 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-606440d92eeso548851eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 00:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156661; x=1748761461; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK9DHfY2dsc8jq9n6ZVImYQWBLnQJ77QjsmfzjQ2MVM=;
        b=NSeHaOHYJzcgLJ660x7etMA+5g//YYLHZP0SGQ13uLbJcxt6Y/ximnCf8x/hL188Hn
         cL+G0gndLs7FjWRRkYdzlzRni1rmIczsqPp5a7sU281Gw3v2A7D+hu+oKISvOgiCuF0F
         wsiMIF6PkltTfU9tGPdsVTzvfGRRpcO1/lK7Aakkvbye2dlade8Y/96oFF7EYi7+zWvN
         wNUGeG1BjzKqdoCe1zE9qYLxrmYa/057ihET+2r40E91jcuJ0ZB489+l40UIdTFgmD49
         1nk73tvivvAEBzyni7GQai29U18/3fxP36qR9DuUOSDAYyV2YCmWVKn062YsuUuNlgvw
         YCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156661; x=1748761461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK9DHfY2dsc8jq9n6ZVImYQWBLnQJ77QjsmfzjQ2MVM=;
        b=Fh5BciVBsev5WBDovnbJgXZVu04MhXx9YTVQSErHhzfRATI5JUj9YjJJFihz78vE5o
         g/jpVwXLX+1jABUx56NpFDRgFEAY1abbAHrnBuKpjOlUaqQG0dK3Gr7W2JIan5oSnWS0
         BenebZZTI0Lnl7vTMcbM7FG7u/dAnzMZ1U/RICAfEmHOd39TeUlAGd9f1kR8hnKdXJ5t
         lKmUjuPI93yUHSFbGW2F93vI+O+pYuedgta4QodeqPZeWxRYgplpbYqOVJxaL4y/Saco
         TKT58TXmzLV5oD91R9ciI6iXc32UU8jOk8n9V1B1sekxJQVi0K70t4U/oV5NPNOTw7RQ
         YSEg==
X-Forwarded-Encrypted: i=1; AJvYcCXpmSQ1FndXwgG4jZa3p9CJUlFEFGmdICcCmOrrWHUUz73peUEmXk/sj3ec0JBacQuqQ+zzoLJIREykADbikOHX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9+4lmHG5kwaQTfUF3LK1ztcrXsPwBY1WCvBIwnuVpbEn18B80
	c0jSgo+N6mBscXXA/1xT+eNumGaOWut1pIoE+L3hzLyP51UUBapIf6tZ0oLSSn9khRZIrO2ilC+
	SpHnPFrpKDyJ/JYzLXxYsf402Xj73KdrzEK2r0ih/kw==
X-Gm-Gg: ASbGncvTB0vQA6iHpat+w7GHGi/FicjKD8ARao7RR+av5BtpKJveCiBmlVU/4Ig2FAW
	j2+tQu+xbIDiMHWmFYnAFfQGrc6gaNvbmmNuZTYH9TOcMUaog79W8FQ/L8nUHMK6KEuXrPouGlh
	QHpdNADVjC1m3vXDXwNvlX+kIiqoKNxZlyXoWYhy2FvJLTqW9jvQrq/tbi19ym1Z5M/w==
X-Google-Smtp-Source: AGHT+IEobv1MmUdm3OhF2+QlgOMO6v4WRzce7p+hyeEZuMdsOou9ZkqZae4dTJbR6DrzynyTOeJDFtFyhDMmxSAEcOs=
X-Received: by 2002:a05:6820:138c:b0:60b:a44c:e987 with SMTP id
 006d021491bc7-60ba44cee17mr2124135eaf.2.1748156661280; Sun, 25 May 2025
 00:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-4-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-4-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 08:04:10 +0100
X-Gm-Features: AX0GCFszlaYSVG9g4VM6bmqpxuLkf0fqSSgw3AbEnkb0rK3QTfE_tt5gub6lw4o
Message-ID: <CADrjBPrvr3F+A-MVAB+BLriy5orCGvBJmqrw0LGo_BaRpQ2YRw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: exynos: gs101: add dm-verity-device-corrupted
 syscon-reboot-mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_000422_374966_BF0E3ACD 
X-CRM114-Status: GOOD (  10.00  )
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

On Sat, 24 May 2025 at 06:21, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On gs101, the boot mode is stored both in a syscon register, and in
> nvmem.
>
> Add the dm-verity-device-corrupted reboot mode to the syscon-reboot-
> based boot mode as well, as both (nvmem & syscon) modes should be in
> sync.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

