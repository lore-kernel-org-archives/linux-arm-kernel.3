Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67227CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fkwu36sIqKlccEWXHkKiOjIdmvv3IpUTfWruAp8yJD4=; b=chaiVzyDSZYT5m4dXlMGWzieDE
	VJo1IPwpnqUUpvkwlJGHnKbsnN1hhGAvVyxexyl71kJ/o0kJFW6SnTYk7Cf+yDB/uqMC9yK8ujm5B
	15kB6ycm3wtn9Vqn+Ubp3ZmSD6MjTakKNpQUD98npvcwxuN0BLyKM7PvY9rkcbA+p7xlSReTsQdfy
	3GJhtJAqds2dALuvSSWjsWMuOtCsyxOwK1tn0uob3HQJDhVYd+FzL6mJdGhIuB8Er8Yy9RUkEX2Fp
	6SA8zKQ+v1VUusp3aovGJTYsYVyL3RgicWHEW2wJNrf4pTZdBZXcpcnADRtty5e6GO13hnchez0q+
	yaCBLIoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHUt-0000000DMFe-40qS;
	Wed, 10 Sep 2025 09:52:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHUr-0000000DMEP-1UIG;
	Wed, 10 Sep 2025 09:52:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45de287cc11so2529775e9.1;
        Wed, 10 Sep 2025 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757497931; x=1758102731; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fkwu36sIqKlccEWXHkKiOjIdmvv3IpUTfWruAp8yJD4=;
        b=AAWXPWex8T56lfAYMxV+F1WwGrEqzghHb0dYNzTAEP9cwAwdvkDrLN5H+dzJ9OkShu
         K3st8A/Juy7wLDAV7zcHCC9Sr5AeIXGnvp+UWpgxADs2KmLyWD/x+Q+UP9Fx4mrY84PK
         EIbLHGP30/XEJYHY73r1iDlmBckKGKEqK4oRz+Wlz+2xFbV7stHFb93NoJ2ajF7fUwR/
         0vHuNMm3z7XD8AuPNnHeN3FbbZwWKec87/o/VpWwFvY+ffzSOd4qmfQV4EE6OKKpoTjs
         9/tY/uOkRgszaDzo0s8yIZHHNAxbz72BoK9z4WwiMwMacngXHrxc4SEyMSWFpylfP5cC
         vPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497931; x=1758102731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkwu36sIqKlccEWXHkKiOjIdmvv3IpUTfWruAp8yJD4=;
        b=XTjqISRDSFq7xewX81G3pfGQq9SkM9PVk/2FUudKTPu1YUu07Hzq5yNp3e9Q1sXR6x
         +8ZY5us2qyqv4UVb0vhwHdrfpUjrhCG/wTGhfnRUF6hj692uCC0xSAWONOgGRF5QGehx
         tNpvVLMg6W2QeUbrQkMX/UXhjzNyjOt+quPqG9Tao0mPejkvsvxBYM1soHQFz00ojZBo
         YQH1cDhBQUVZQ1dNAzWAzKjyhTK6l7ojmW0AO83ZJn7U2hEpb1cwckTrFKdWO3TDZbcu
         21/tRalLVCugYQ3AyA3d+p6OZ2bCIOuOD12bjCffHVKAhC6E1LlsV+FEf9geldIaViF1
         HZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdvaVbiLIDZAFomS0/OOuUfGwm9OiKzrPepcG63Vt3xlcJhWRrwwrGh3EQQnepK4/AR5v+Uln8I2GCNEtSlgo=@lists.infradead.org, AJvYcCVtYnE3IkRSdcLM/wJYOUxtvCv+pnOAFo2Wgp7OvkFNfXguDh8xPAs1bczthjEaHGdRUKb0AyN0DmgK+koaHWX4@lists.infradead.org
X-Gm-Message-State: AOJu0YxTi0fP2HyGgkeu21D1LPqyXjPR+M0AexrMMbZyTpc+pRExBloH
	RRl5tWXxfThvZIssaSEAh0GoC7OPIfavE2YxEN9v6TaO+aw6fHMGvtek
X-Gm-Gg: ASbGnctbFJbIDKxWdMfudf7Rn63ymMgZzbiyEV5PzmtkawDPFmk4mTqpv1t68PQ0yRA
	dTN4Uu3GOxMwqPp5o92+t9MjtCnlbiXRxxOVNXcqlE/jgPQi230Nesr7sdDL3JRZ3pO5XhhrOlQ
	8s3WdVp0fMNMl4/CiHle5GfTFThx7BdgcLLMnOdTC9Kx26NOw+yXg2S6pwtGm6r2G6QJPQPJ+Xn
	F24IniU6vjs7Jxoyen+H29eTUweWJZNDVPE6n95Pzy/VgYWlxe7KUVXk/F66kElqHnmV3Rez6n4
	axfs4UQhdrjYJhZxHSMoF11zYbja0cBmTXfMTuLIxOhmwGJR+lLCx6kno2RLaJ1wTKVUPekfe59
	9RmLIUydHCNDrxiY611NuCVHXD4k8YJpeYljNi9HMv8dDPWtZUVRykARfUGj9lA04b1/vh4974r
	AwkOu09Dw=
X-Google-Smtp-Source: AGHT+IHm66PjMPCOgJddrhyW/UFJ502yp0yYCzeOV7xdKQ14Xo/bl1MIKxHU3kUumA8xFUXACR4S1Q==
X-Received: by 2002:a5d:64e6:0:b0:3e1:ca94:3199 with SMTP id ffacd0b85a97d-3e629b44341mr14421484f8f.14.1757497931132;
        Wed, 10 Sep 2025 02:52:11 -0700 (PDT)
Received: from [192.168.0.24] (static-39-127-60-95.ipcom.comunitel.net. [95.60.127.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238760sm6091362f8f.34.2025.09.10.02.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:52:10 -0700 (PDT)
Message-ID: <0730bb06-46fe-4451-af50-fe79daa44f28@gmail.com>
Date: Wed, 10 Sep 2025 11:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add support for Grinn GenioSBC-510/700 boards
To: Mateusz Koza <mateusz.koza@grinn-global.com>,
 angelogioacchino.delregno@collabora.com, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, marcin.czarnecki@grinn-global.com,
 b.bilas@grinn-global.com, andrew@lunn.ch
References: <20250908130620.2309399-1-mateusz.koza@grinn-global.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250908130620.2309399-1-mateusz.koza@grinn-global.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_025213_423938_CDBC1D1C 
X-CRM114-Status: GOOD (  16.60  )
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

Patch 2 and 4 queued, thanks

Matthias

On 08/09/2025 15:05, Mateusz Koza wrote:
> This patch series adds support for Grinn GenioSBC-510 and GenioSBC-700
> boards based on MediaTek MT8370 and MT8390 SoCs, respectively. It
> includes device tree files for both boards, updates to the device tree
> bindings, and necessary modifications to the Makefile.
> 
> As far as I know, <angelogioacchino.delregno@collabora.com> has access
> to the schematics for these boards, as we've shared them under NDA with
> Collabora.
> 
> Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>
> ---
> v2:	Fixed the subject prefixes,
> 	Fixed alignment in dts files,
> 	Added missing SPDX-License-Identifier,
> 	Fixed the ordering in dt-bindings,
> 	Dropped redundant info from commit messages,
> 	Run checkpatch.pl on the patchset and fixed the issues,
> 	as suggested by Krzysztof Kozlowski <krzk@kernel.org>.
> 
> v3:	Changed eth phy-mode to 'rgmii-id',
> 	Changed eth mediatek,tx-delay-ps to 30,
> 	as suggested by Andrew Lunn <andrew@lunn.ch>.
> 
> v4:	Removed the nodes that are not present in upstream,
> 	as suggested by Louis-Alexis <angelogioacchino.delregno@collabora.com>.
> 
> 	Added default pinctrl to ssusb0,
> 	Enabled the scp_cluster node,
> 	as suggested by Bartosz Biłas <b.bilas@grinn-global.com>.
> ---
> 
> Bartosz Bilas (1):
>    arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn
>      GenioSBC-510
> 
> Mateusz Koza (3):
>    arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700
>    dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
>    dt-bindings: arm: mediatek: Add grinn,genio-510-sbc
> 
>   .../devicetree/bindings/arm/mediatek.yaml     |   2 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>   .../mediatek/mt8370-grinn-genio-510-sbc.dts   |  19 +
>   .../mediatek/mt8390-grinn-genio-700-sbc.dts   |  19 +
>   .../dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 538 ++++++++++++++++++
>   .../dts/mediatek/mt8390-grinn-genio-som.dtsi  | 209 +++++++
>   6 files changed, 789 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
> 


