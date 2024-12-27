Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E16E77191
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AKGn7nMK9/Ut/Y6UeXKdpxBcWZLRuzCPMCeYqx6bNk=; b=WKYv9NUrNpPyA5CjMz1zXyFacF
	bt6ZbV3RA/s5MnpafBFp/a37wHmeDiMuJhmLJHXSQLKMr2SNyY2/+BhtCxkifF4ngDNNiyEqg84zi
	Guru7FSgHNSbP7/nHtQ06DAY2ki0XX8A06d7UCUinEsXbeaYnG0XT8MpoZA+xo3unChYOdaDnXNup
	eapWfS3aZ96cGr/rW30a4SqrbPmarXlq3R+9V51hKeNoZlDOZfT0fH04aU2aJzJ1l5rbJI9ZVW4Mu
	WMPTtfLrutocCPyi2CVNjWPFiGNVlSF87uBk2NNuviB9rJ/H+nXYNCwfCZ+bpP8HJAzFo5G/TCnDV
	HeVZUz5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAKp-00000000HuH-0KAR;
	Fri, 27 Dec 2024 13:24:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAG5-00000000GsN-2kV8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:20:07 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2161eb95317so90789175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 05:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735305604; x=1735910404; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8AKGn7nMK9/Ut/Y6UeXKdpxBcWZLRuzCPMCeYqx6bNk=;
        b=VbT5AnFBsrnWo9EzoAsl9ImzVZCZgwVGAmjUohHLCorgNU7370p5eHSxcJgJuAAi58
         f2oMkKCUfZ4L78IgHOEllmtLXlI+GUemuqKGQUbyGgrsZvUTKkTH2iX6vEqVCA2Hg1Ze
         VntfkXpabNbnDTVekcn7hDRFYuAwZPAy6Y4YrvFSu5IqBPUzURoqik2H6CruXzfr4RNe
         HtHibVLJUcJ03gA3wWdjAyQrVpiV9oN5Hx8ZxKHxr7WGR5iJy8bTfXe0xl877HMB6D8R
         zB5DU4VpNRBqj6+QRmQ5NMtbN2R/yIjR8gL8RQpQOT/Y14cWPrfOmYefzKwRC1dabXPB
         zXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305604; x=1735910404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AKGn7nMK9/Ut/Y6UeXKdpxBcWZLRuzCPMCeYqx6bNk=;
        b=OWWz5C2JYl+AZisXReI7p6oIK7g6wjtQmGo4YaVkhfRYRriumaeJBaH6njwlkC3uGL
         1XkOqi8/dDS4j/gH5cGbtf0EmolvJOtGOYnVbPGEOkXqbz82weznR6zsfNPnh3FeSVR6
         BAsC2Y0rFIe3jc33bGyuq6Z13/D1o/CLKujgG1SMbE2UQF8ybzPml+btD/BLwd2q5JXc
         fQMTPE4DiLm8R00aRcVMMI9y39+x18NXsqpbuValzn0kkxUhhgJTNg/UkXN1tHiB3Hqq
         NtG6Ch7SrHyndtZ/ME4bCV+yCwFZn43QAzGuxy/YTMJ0m20b3UZIheC2qIeAdWPymA+J
         aI6A==
X-Forwarded-Encrypted: i=1; AJvYcCX1nVmAA2zb35J8d2hA02fSxMEFdAsEMT4/wCvkgjccGKHs9YdokZcFMlCIHqNCvuvtwufcXd1/IXkSEDZy5gkv@lists.infradead.org
X-Gm-Message-State: AOJu0YzeE9Ahl562uHU7hEjOfTZmjoONwgARZ52CNbMp2gq/Xxmh7cr0
	WWNy3qcn6kONLZGoej754tQ9J1K3RHbZVlA7ejWgKAdileymRKMqsETAfz8td3ujJR/opQOYITz
	HPr1i12zqsagbXlB5rkNaU7EB184rhwe0Twvf7Q==
X-Gm-Gg: ASbGnctYVax0di8W/G0OdLGvt5BzdyFgRj4xAurevHDJ6mgdymLxsXwyUMcf1pro/cE
	IqW1PkIbyCEUqbiAeN+kmzVHt76DKc6aofc1I
X-Google-Smtp-Source: AGHT+IEGt6OfQFeUdl2dnCUTbJna90fZoStffuKdb/amHUvkirE0mXYEtS1dYZ+9PMXG96Ot/QPVwvp+ateTGZX9k4o=
X-Received: by 2002:a17:90b:54c6:b0:2f4:434d:c7f0 with SMTP id
 98e67ed59e1d1-2f452e22c43mr49131562a91.12.1735305604727; Fri, 27 Dec 2024
 05:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com> <20241211-rk3588-hdmi1-v2-3-02cdca22ff68@collabora.com>
In-Reply-To: <20241211-rk3588-hdmi1-v2-3-02cdca22ff68@collabora.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Fri, 27 Dec 2024 18:49:53 +0530
Message-ID: <CA+VMnFxFBxMXBCiTfJHuMxB1U-zAqBRxeBxMRQWWCE7drr9MgA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: rockchip: Add HDMI1 node on RK3588
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_052005_698612_CD288B06 
X-CRM114-Status: UNSURE (   8.61  )
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

On Wed, 11 Dec 2024 at 04:37, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Add support for the second HDMI TX port found on RK3588 SoC.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Tested-by: Jagan Teki <jagan@edgeble.ai> # edgeble-6tops-modules

