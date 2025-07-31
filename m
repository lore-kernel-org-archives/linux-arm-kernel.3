Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFEAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 03:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YELIpOTk7v58USyg3NWMuW2KC3hMjQSyAozxB3de114=; b=kWl6iCRNv/F8fv9fg2sTt91Q/9
	hFhaO+1wk36C2gYRjv286HI4D7N1Kyq+aUDidas6CtJh+afLQTW7wLT13Kugs2428TpLAs5S4T3EY
	QWM19KALOwvacFhJLsXbUCaMb67mNVaPEDyCNGB82EMGvnN21sMFhT2DufSbE6QTbTm9/ufJOKVG8
	1sS6iEg98X55qGMZAH50Qev7dA4rxm9L6XKknXTK9Hbs0RLkORd768kcdc+uyI6hNFW+B/3knVgnG
	alCIefLSCxWJ8bCr+vKvQ8QTQXVB4zYBuG15cTQlQo8C0iQHJ3jnaizgei28L5vYVB/+zFPsNO4Ut
	DOZTpp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKPC-00000002qrb-2h10;
	Thu, 31 Jul 2025 03:56:34 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKMg-00000002qks-2zYY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 03:54:00 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e3f0287842so4408725ab.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 20:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753934037; x=1754538837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YELIpOTk7v58USyg3NWMuW2KC3hMjQSyAozxB3de114=;
        b=SS4IDEXGg6PEoximTyv0iZG/ILGke0sGj86nh7rW/Z1PtyeOq/l8RBZqAzSMcJPJMH
         2J8vsLCHGRmv3hw4IfMH8ko8dtfH/em+gYKW16arpg+7YjviySVdcftwh5kVN+ACL1Ly
         yoE/wWHbfnE3q5ibqOByyyyhnhgCMHjZDITas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753934037; x=1754538837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YELIpOTk7v58USyg3NWMuW2KC3hMjQSyAozxB3de114=;
        b=enhKlh1UKbmSSUSuz0B/uyskQmZECGsZrOWYmzRjxAlOPtyxNkkHC2utNZ6f3GNuJG
         YLJxQfJlhgLDsr7O01MSt+yDCPhjR0zZvz5gWWLo66ZJ99KsB7FywbwzcXGxW/p0fmE6
         L1uyjnstKi7XlD6n7yv5NnSbYQsHWNJGlE2UaY1ZLcKmwSOevhtrIBwGSTUdZ2Fh1vlU
         QujeNUpVdiXfXH2xoE3jzxZCE4buY3TelSAMixtrOuLuS7lQXCPtC3nPozGInXA+Mzu1
         eabhlgzhInrmTEMn9XZhK6ASGM/RNgIfAxHGgKIAo/xiBpU0JWIx4etMEK1fXhNTyVUk
         vhRA==
X-Forwarded-Encrypted: i=1; AJvYcCWGN7Ygl1YIHHsEdHnPQxUijvZpRW7FPlVgJzlAKNHbTNG+UfTd9qM6Y6EbNOwKB6wjRGgUHZDa4t+hcfgsbkkz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbv7iHFwxxB9IzR6NebimnzVL9jwUUcUTjUrfwq3bjZdJPpLSX
	tRNyTyf1GRr8H+uskzEGDrO7nIxg0XwySxEMsTdN7zwr6d7TUcnUag2QTvZ5uhqgSyYr0OJhnnu
	4oV//4Q==
X-Gm-Gg: ASbGncvkHfIL/xnGVA7U7R7ieTP9H1X3qxdd6oqcc4MSwWVTIWa8ITBdnNZ5CYNM2M6
	afA0gqr0DguPduxIjjkNyHDA6TOKkgnp+nJU/ZytWEqS9kF8vsp28ZCFaJyS5jE1uSG3+11/0bQ
	RyJmqilvDSWwj0kSuoasdlr8BAgKYDV///FvE4msnDt1liQqfDbUoBFi9ty6zLDSuh70Djk6vwp
	hegYQ0Q3ch0M+KHcZf4X2EZ2k5DA0xbVuTmWt6ihQEL6QPQHTVbk/vqYmAXIA0gtbGtCdE6Dxa0
	1lwF0fpKvAfx37swxybdJYVlZpwcRFm9GLVq5hcopuGK7EOpQ6wcjobm7sZk92r2jCCy3hPJSDP
	I3nsCd5cMMS4hJ8VuRyAiMTDZIGAZFGgc5f42jSUshazk3sIVKZGa1M9LyuBjG417ae7V7mnx
X-Google-Smtp-Source: AGHT+IHDm5Eo134sLGGzQfw3WP4uXUgcFKT8RzkQ7O0+wAG4DyvOHGiSQApWgNwA6VRLZjJQrc4hbA==
X-Received: by 2002:a05:6e02:180c:b0:3df:4cf8:dd50 with SMTP id e9e14a558f8ab-3e3f6250cc9mr100601505ab.19.1753934037377;
        Wed, 30 Jul 2025 20:53:57 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55dd8a4esm231638173.95.2025.07.30.20.53.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 20:53:56 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e3f0287842so4408665ab.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 20:53:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIXwjv2geZPM42Y0CeWSe7TAbqAEJr0C+k+BJdYF6v2o6sk4PKgu7c9tCcYpK/oz2pUcoJc+MvPas2SjP+5X5L@lists.infradead.org
X-Received: by 2002:a05:6102:3e92:b0:4fb:dde8:76cf with SMTP id
 ada2fe7eead31-4fbe8753b11mr3988803137.13.1753933616614; Wed, 30 Jul 2025
 20:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-4-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-4-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Jul 2025 11:46:20 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj9eVDxSxPuntMjTSrwhVAhVLMs_s0aR+COQjM2HB0S9A@mail.gmail.com>
X-Gm-Features: Ac12FXyuQfNec5PpeCVYeU9gZNhVWy6e9AZ1QYJ8r0Oc3K8xhe2Kp-euR4Zabx0
Message-ID: <CAC=S1nj9eVDxSxPuntMjTSrwhVAhVLMs_s0aR+COQjM2HB0S9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] thermal/drivers/mediatek/lvts: Guard against zero
 temp_factor in lvts_raw_to_temp
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	linux-mediatek@lists.infradead.org, bchihi@baylibre.com, 
	colin.i.king@gmail.com, lala.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_205359_032820_1E3FE97E 
X-CRM114-Status: UNSURE (   8.72  )
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

On Wed, Jul 30, 2025 at 11:32=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add a guard against zero temp_factor in lvts_raw_to_temp() to prevent
> division by zero and ensure safe conversion.
>
> Fixes: 6725a29321e4 ("thermal/drivers/mediatek/lvts_thermal: Make coeff c=
onfigurable")
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

