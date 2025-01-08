Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97A4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vJmTv+KjscVDVpip0BiVAIpbXRVtsfL2L/KDsAFORfE=; b=DQNCdhy9s8Q1ZNe+LIyKA7yq9V
	XEXHroK/hwEaF9YD1Xv9RY34tnixxUa5oLwugNuSHeR7KkN5vNPxN4RY5tcRwBKBWDt5BoInJ8O5A
	xR44sGNmqsaTT+VIrN78nCB2ZncpJpo4O8ufpKTPALMpv7AsSLN/HYCgm9qLtOFBEt/xZGj0qK0g+
	WGtpS3KkQ4OHQYROKcNlR9rUBPIAHCOl6cTW8zqnAbVH4bG+cJMmgzXHRsHHPrcFCwyXh0o5v1g/v
	xB2muHOnOlHsEtbDL7NflGkKuImg0lFtwqNgWeh2nsU+UCX5NrVwijEWdSITxTJhN3hNxgusg9Z5m
	AlDKrFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVgE-00000008Wsg-2reZ;
	Wed, 08 Jan 2025 13:01:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUxi-00000008Nlx-0106;
	Wed, 08 Jan 2025 12:15:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso165535555e9.0;
        Wed, 08 Jan 2025 04:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736338500; x=1736943300; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJmTv+KjscVDVpip0BiVAIpbXRVtsfL2L/KDsAFORfE=;
        b=Bg/DHjo+RTbMt4wZVaVseTwbHJmihRDIkOYGbYGbspaci32WxVOmET9fx5d+ekTer1
         mDq4V7tIVst2shWbMKhiri0vorCF9Oj+mxrXdLT5dCS3uilILghOJMfxDyXf/nAGCfe5
         1+rOC80UsFd/0biJh+CkV3cXFPz2qfTGHC85BYcDdbQymouZ9ySJpR4qW9V1qfithx1J
         VBnb5yvtEY28I/fozzqWGEA5ychvj3Tg8nEIoijULiDSDypARFBvvxiOdGutK7BJ7Cwl
         E+cX6Pj+06tJD51PAd6eeJtMRsauQVB99tpak0jGtVy8nqeg/sqE2w3J2StiVlqV8ef/
         o4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736338500; x=1736943300;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJmTv+KjscVDVpip0BiVAIpbXRVtsfL2L/KDsAFORfE=;
        b=p/NFoHES9UIO/xDVYMMGLWJVLOr3gDECHSyRW+HXkt6pg4ud10+Ulxl1XlyGjIIKi1
         QAfiXDTYD8BXLWybmgXde1bTGFxOCRxUzpCpZaM61s8vxcI6kYCmbrA6xP/k6AaizvfN
         WpsATlXyJdjOZW8ecwKo8qpaSW4oNR8m7kaR0wjVVhUAs11ZIw8l5hoinBgXNtKQ1BpI
         zfESyIxA9s4Xp8OadnOpLGaOePq1HMAt9I1x1uzk3LHM19d/d3+h7Mn77DB+c915T7MI
         YsYHvGbgnUIZkQADcYTfD7VNkaw1m1N6TYnDbRb71D7p1TP7Yi+WS8GFPEnWhUGDxdJK
         cHoA==
X-Forwarded-Encrypted: i=1; AJvYcCWx8XVJ3KUqvUN7vgmSrA06Ay0KGVI8/682bvUSVRXJA9+49qKGa/57LGE8p4pvWgwq0u+cUeICr1x0bo9IcWKU@lists.infradead.org
X-Gm-Message-State: AOJu0YyGLBMKq0pBQ91Dua3qq2BjdT06ex7sPQLYDtw1pISpYgoe52WW
	Ka/+IUlUsWLpGmN1ETuUOpmuWp07IDAw4vJPwWZQxIOyTtsvpdLGOexVTIV8
X-Gm-Gg: ASbGncuk0FQhuaoBWGI8gfO8rFRGdOQh8PCW2BkMDB9x8hJ70WvxMFlJqAXIfY24MlR
	/qOynHzowIuL8HJO9jmJCDUfy5L5b1gxYxCN+sPzzP4p+UQksqyyS9/nwjlXt27U4ddpoUtiI/2
	3EmhjsDM4c8duHtX/y+sMm1THHWXHd5shapT+jVoR7h5DtWnq3Bxtq7gI8wk7NhC+zf6TwiXlkD
	NOx7tgBhof7LsELOfxlVEFTdkBiqgjX5EvB5EZzpGvoA4cNRFi+c0gBwu0d5g6DdQB2QfSSy0RO
	FZOlFmwNXHh8ZgzcuW5maao=
X-Google-Smtp-Source: AGHT+IFlV40g81acpz+C6YMGGUm7izT6zhq4OhN0NjEMOos3WDWwzDbZk2fc1aPx2QisQ1Y0idOlZg==
X-Received: by 2002:a05:600c:5246:b0:434:feb1:adbb with SMTP id 5b1f17b1804b1-436e271d5d6mr23289225e9.31.1736338499475;
        Wed, 08 Jan 2025 04:14:59 -0800 (PST)
Received: from [192.168.0.31] (80.224.71.185.static.user.ono.com. [80.224.71.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89ca5sm18859145e9.29.2025.01.08.04.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:14:58 -0800 (PST)
Message-ID: <ea93d0ea-a1a0-4d36-8880-4f05c85f0c1b@gmail.com>
Date: Wed, 8 Jan 2025 13:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek ARM32 DTS updates for v6.14
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_041502_044610_AEB71A73 
X-CRM114-Status: UNSURE (   7.17  )
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

Hi Arnd,

Would you mind to pull the following patches.

Regards,
Matthias

---
The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/mtk-dts32-for-v6.14

for you to fetch changes up to 90234cf9b37c57201a24b78c217a91a8af774109:

   ARM: dts: mediatek: mt7623: fix IR nodename (2025-01-08 13:08:20 +0100)

----------------------------------------------------------------
mt7623: fix validation error of ir-receiver

----------------------------------------------------------------
Rafał Miłecki (1):
       ARM: dts: mediatek: mt7623: fix IR nodename

  arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

