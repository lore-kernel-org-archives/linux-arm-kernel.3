Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9982EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hNgW4kby0iU/XtbfyNGjM7Ij3cEWeDVAVgxTdH2+aQ=; b=bc4ocCuypACb47h1fiIpgDDdRU
	Qne67exs9uC7on/LHLH9H2EVNmtpB5WMmsxSy0UtsfO91vNaReqBDGkzTqAC9xCiqVc69oKmErXLW
	hsRXIti/KReo/Hce0JBi/TWdpELSr6ocfkKiBxS/cjoc7x6IUQgFHu11n9/E4q9yqnr2UieBTZgHj
	dWb1cJ8jd8VmG1bMmcAsNmkHfFMHf5tXcr2oyVBziRdbmsi9Lu7+5mWwUmoX3R25qe2LH/UX8ev2/
	/8vX1yXAavKhWWDcZRjbB/O0jatP+Js+9spYtmaki+W1KmmFwRZBJOJFJarmppFDH+wcdrlBeJI1X
	0zpqbXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbb1-00000004cQr-2JE8;
	Tue, 15 Jul 2025 09:05:07 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubavF-00000004VQO-2hM8;
	Tue, 15 Jul 2025 08:21:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-74924255af4so4271437b3a.1;
        Tue, 15 Jul 2025 01:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752567717; x=1753172517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hNgW4kby0iU/XtbfyNGjM7Ij3cEWeDVAVgxTdH2+aQ=;
        b=i6yjlymmHSdsPrMcjwRvKvhuXa+QkehtR0eYb+GvlAp3hh/LIsPxtMqaqMXB4nJuL7
         bzF9qOfirYJiqRJpO8cIpoeYNx4pug2KLuliBHDiywlT/hjoZ4izLyjGGIDZ7ORDeCYf
         NwtZfhvWbtjYcjDhsQqsHFSDgddB+wyUfDWvhfJtmd5ppIlE1lNJeqAbUBt2OzshgBPl
         5EwPHULKEIcHPXzRCjerE59C/hal7cVGb7jMVKuG+NcexVvds2fB2d3NjH50ot5hetYL
         qF1cTbSkNVvkLrfu13c8n9aMmFd1rjvrTTxKabaWQlTnpivndkcd23tu9l9BqCWTOL5C
         GU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567717; x=1753172517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hNgW4kby0iU/XtbfyNGjM7Ij3cEWeDVAVgxTdH2+aQ=;
        b=OcuOXFws94txU2SVCmVHg1x0TKmDk8Ocnu325FAbmFhMaYThdLP8mF/HujAcS8Vc03
         AdOh+Yu8dvPIRZtGO+HN8ySMUp+pIttU3Tt6rJWdvP86wHxKr+3kMfo6YE6l6rC9HzNB
         VrofoLJerZt6KdTJiI4DqxHL3DVOLHmN2/TJD0mTABdvrcDFr3e8KpK7HTygCv6qi+NW
         t3L2OZEaUjFqWGXrrNEzPj6VHYG1gYdXk8uydcRgGSmz+uD2k6ENRyZnaHm5Z8By7Bou
         v5dVhDojisriuFqLi5gwh/fIoQKEoI4eFgZuYcGMH7B+5p4TIe8AXu85OgwwXhSUDgCl
         kABQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/xDKK8OZU4eWq/no8OHMgrvlTR/9JMeyRjHLVbVzOJz3M8NBPnckEj5IEjAlCBKoH4VlwdIdtGsNyTJwz+dw=@lists.infradead.org, AJvYcCXrUhU2hj7GF/BfQSfQfFjA3hdZ7MbsYvBpmaHfwB/vggpyzmi/eXDv+KPvAx1sBtJIBN9cjFru3T8lN8LJdPLl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr0qBOPdiJz9caGTAMfYo0dED6dmtdhoTUbUeUZTK2HAuVSWpe
	oZriwoBJa9yWYAVBlwnKKcS8E6d4dtdCoIsR+2w/itVfNCP1JfWxYpqRqZbCGzD8pPsezrWPdae
	yOI8jRQk7iaPz4gNSl5y8TD3mzRcjSsY=
X-Gm-Gg: ASbGnctBy2afm4eNFPJH7qx5QKKCwlAJJqopBhOZtXOcwA6xRDXo7vK00cZFDwCbilN
	jvUDsK27LCkEO4Smb5hjiFOxf3TGxju0jX2aQkpAtCrezrf7e7ZYTMXLF6PiPIM+yPJpdPfW2Mt
	K+a7fMgSU7DaepWO4zgXUNjorw52bcz2JIMMTJ27XUjmBwFq2AGOMNRevkGgyj1Y3fO2X8NEYfV
	xnD
X-Google-Smtp-Source: AGHT+IEggynKq4vD6SNTsY3SuiaP/yVTDeVqAA+gk8qh26/Eyl7WSxbYYZGy5UpZ/5sv+D7En1DMCxw9GKvAVwKvF8g=
X-Received: by 2002:a17:90b:4a0a:b0:311:ea13:2e70 with SMTP id
 98e67ed59e1d1-31c4f4ccca2mr26575080a91.14.1752567716750; Tue, 15 Jul 2025
 01:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250712210448.429318-1-rosenp@gmail.com> <20250712210448.429318-5-rosenp@gmail.com>
In-Reply-To: <20250712210448.429318-5-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 15 Jul 2025 10:21:45 +0200
X-Gm-Features: Ac12FXzvb6Vo4hFlEEN171p2VK_2rD2O8rW8KBf-Sr8ny31IT3KEqoC_trh2J6Q
Message-ID: <CAMhs-H_T+Nh==pxeW+uwk1gSr8YZMAva1DO9hF947tH7ot4=kg@mail.gmail.com>
Subject: Re: [PATCHv4 wireless-next 4/7] wifi: rt2800: move 2x00soc to 2800soc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_012157_680555_DEB5E954 
X-CRM114-Status: UNSURE (   9.79  )
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

On Sat, Jul 12, 2025 at 11:05=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> This driver was written with multiple SOC platforms in mind. However
> since Ralink was aquired by Mediatek, it only effectively got used by
> older platforms. As such, we can slim down the driver slightly by moving
> all of rt2x00soc to rt2800soc in order to benefit from inlining.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
> ---
>  drivers/net/wireless/ralink/rt2x00/Kconfig    |   5 -
>  drivers/net/wireless/ralink/rt2x00/Makefile   |   1 -
>  .../net/wireless/ralink/rt2x00/rt2800soc.c    | 119 +++++++++++++-
>  .../net/wireless/ralink/rt2x00/rt2x00soc.c    | 151 ------------------
>  .../net/wireless/ralink/rt2x00/rt2x00soc.h    |  29 ----
>  5 files changed, 118 insertions(+), 187 deletions(-)
>  delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
>  delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.h

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

