Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDACBC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuxOMmFLlhO7PBg7Pbai7BgbNylrrfzDckYCbeR2JDg=; b=g9WSNk843t08eYMKvQr9rJqgYX
	uQOodGBjYHp7Mv2qJJu4dVNHMxB7H7fKg3fyo1v+ko58zt3Ktm8aUZkqtJv59QYHb7r0SFYH1cRIH
	Oh9cIF8t3c5eOJr1vwa8XlvGISAUoljK+ABqOAV0JL+iktMpFs/VBo38gPM8Cc61MjnAiZ959uhRr
	ikB1PhZn70V60oLQR8ZPnLaqYo1NBG3xFvHMnkCWYho4WL81IlfHYBtTAeMP0mJxTA/J8+gJ8Za+Y
	MWfkZ/e3f8IszYQotTdOTankr9ZtEcdJTbkpoRUMbXE7hecRVU4ridZyfA9MYiSbv0k68JzjgG5lR
	uBDFmPuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qxd-0000000Fhu2-3q9T;
	Fri, 11 Sep 2026 02:25:53 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qxa-0000000Fhtg-3PgK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:25:52 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-398a5aad413so394780a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 19:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789093550; x=1789698350; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuxOMmFLlhO7PBg7Pbai7BgbNylrrfzDckYCbeR2JDg=;
        b=jrQ+zffDOmLNnqWLtgNOlaZ+FYnPo9x3qO9rJzH/IKYREhggpjTSv8Chmk/fbQIG+z
         FT/5xqpAOZkREoWTW0GKdprX7gRn1MSiv7ynfdPSFUOUBCNeN5PG3HPrcxxRU/utGg9Y
         yqq5Aj4RnHqZgesalBrlY9qsqug8cGyWvNNc0IEp9DZAq0zwZ0XKizDMkWN+q6XPQtJ7
         yMDDPSv6c93DXmhKKIwHhQ1YoPk/Uma40Sa2xtVPW/D33CSHj2KC8A4G4PJ4UOgotuj9
         cg70t3G7QN+jPCuGngNuPjSz/Kfg25Q/GG6pZzcsHv4DYE350tLWSW/hu1604o+ZfhwV
         s+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093550; x=1789698350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuxOMmFLlhO7PBg7Pbai7BgbNylrrfzDckYCbeR2JDg=;
        b=CsZEZhWj1zb4CmCOslFNiYX6YVIil0YRz06dH4CkPhXKItWD9Tc4zVPoHx8Cm1dCdg
         6yoBYpGcHYFAnfECB5wmwodB9d6BBaM3ZoAtX5vDxctJF/wkPD7KqQCN105d94rKGmyN
         vxbbI+LzqWiC81mpBH7aOMqGcLeicbSd7e0jciraILy1wzUzniQXAOxyv6QC5OGYfjMu
         MlA5rqZrjIife2j27GlNrTDE7r1d+lO/t0+m/TtVkThG3KdKRPQK1WjBvcgz4rvSW4WM
         v5ZXlD+bpehRFIpUzrDHlQDhBNSr7dOWLYFX8fYC+qeb+EtJ5MY2zoTaHj6Du4ps/V91
         3TNw==
X-Forwarded-Encrypted: i=1; AKwUvBzAgssj9nV9YZElrDb/2Mu5SeQ2jDMdKlSBQp1r1loh7o/EIpJ+38fjWGd6UmQRH0kKHdaZwZT1DwNuqoQdWCqL@lists.infradead.org
X-Gm-Message-State: AFuF++mRGy8NNrb17Ygo/gC4VUOCgBvEGpxDafJudWKW6Cd1i4V3D+Op
	sjrMLe2cADVO2GCJWwFeLVjgTZExB0jv5Ck+vNLxVdYgG1+AU9YuOa2I
X-Gm-Gg: AYBFou0nmWD6vXv0Lqkakh5cwByeLG/fDjtfWOfe+opKU48UOo8pr0xKB5Jme64PrcR
	lkOeGoa1W5/R1mYl2JjBvwkaJvgLFTTBKidWhmMJiU17hAj3zdSc7yyUL8pX/pw9nkYE5hdleCT
	0kVKdI/WnkIcTnoaMS4+FHueLjL50FlC5jVJt7WJ5cVe1iIpModiDTUPvOu1zcyZxkt8ZHFa7qP
	aUmh74pqlug+iFpd8YlAs+L7i7KLKf8UJ9OlpvjUj2t2p4jWYCaacX1MZQQjYYJX7SS3IV0d/r9
	O2r+2TjhFfyu/eEqAguOldqEosPhBjKwzUGRqeu5Uz3oM63VPSHyBosuIdGTxeQY1eDA1QZbUww
	WiqKkT6/6OGByVE7Um5LvFihzrw1+3VGcBROA9G1IMvcJ6Z+X+doQCat7VlzvF7T0arXW6dAbYg
	LffIjRP0sYsULhMMhFMMHyTFWJJKNffZwb8I+IfU1Qxfb2aPKOcG+7kULtDjo2MYvD/Q1ld+0bz
	CsvU0C+n27EZd1Yw7AdfkRix5SQJD+y94x+eHWQ/qH+osd4oL943ss=
X-Received: by 2002:a17:90a:d2cb:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39d9bd971fcmr2831000a91.8.1789093549708;
        Thu, 10 Sep 2026 19:25:49 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602e7sm1998815a91.5.2026.09.10.19.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 19:25:49 -0700 (PDT)
Message-ID: <c7dc7356-22fb-4194-aeb6-084b5d3f9b73@gmail.com>
Date: Fri, 11 Sep 2026 10:25:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Zi-Yu Chen <zychennvt@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mkl@pengutronix.de
References: <20260908014526.413399-1-zychennvt@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260908014526.413399-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_192550_883884_FD866D50 
X-CRM114-Status: UNSURE (   6.02  )
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

Hi Zi-Yu,

I reviewed v3 of this patch, including the CAN controller addresses,
interrupts, clocks, Message RAM ranges, pinctrl settings, and the
board-level clock configuration.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang


