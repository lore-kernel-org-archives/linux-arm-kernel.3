Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD97CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTt43XJFM8d74lWj5+YE+mCHEBEmob8rG+QikYcC3hM=; b=Bz0KmcGHAvAZ9tkMFUua5+b1mR
	OvYmakxjXjdFbvlY9ynmRJqUCYp0LnSx06EQKrwNNbf7pL+ScIoJ429ERAYWPJtg4gDVa8IC75604
	UlBGaBHRlw3f+XTJZxtET4euUMS5Z7uPyefS08EaWBw8mLjC1fJnU8+JWzziBul5ySBH5tIUOnkUV
	miDXCIZ3nRCTIZFkSWRgw4QvopmkIfmpCw2Lh+LxYk3rFnejBIt1TWPKnYJ6TeU+APJ6/8EgtkD0F
	M0NEMbe/YPKYQX+5VsyLyz3h3buYVarS9AdV53BrUKEhMIfdsclkWbNwJd6AlR3+2SJzjgv5w15hh
	3ceoRaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Zh0-00000004f3K-3ilG;
	Tue, 15 Apr 2025 06:22:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZfB-00000004ent-1ZVw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 06:20:54 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac73228ea73so75011566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744698051; x=1745302851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTt43XJFM8d74lWj5+YE+mCHEBEmob8rG+QikYcC3hM=;
        b=kULbMQMbOJ0srNJXBXk5vbsME+h1ISijKCOyvTaUHFRUhDGlV8rUDKT2Sd5KpAHiZK
         P9urYIjW+1f7q6ZmgQKEtY0Mtuc8lQOkdQDo8DakVKk19gn7XoJ89/f5niM7zG/pVJO7
         hXwI7XHJ5br1CYE6t/h5ZF51/pWOF8VCf/8AkB3Q+KESi83tCKK6ylErjABPr3pHWYPU
         SB61aX/vtElim0HSfO6XFwBTe+KOsZOIsyR2k05KEGQIYi5WCm8EyGpoVV/GGDVKU0wu
         jl1B9+/xM12vrhrCuJOoKyYTbRSIdPMUW5W83qBTPQjPcR6h5/Wq9/aYgHysu1HNayRE
         S3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698051; x=1745302851;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTt43XJFM8d74lWj5+YE+mCHEBEmob8rG+QikYcC3hM=;
        b=fmgc8YYVnpvyOmXtHEV0LPKXJ6LgJC2Mwjfcp3VAQjZ8zSUFo7ff7taJ/Czm+Bt3pX
         LvyZh+QmNhg07O5luun/Yd4fXyeqC+UwjFXX4SI57WcT5b9GjvG4FXBYl6/Upehst2A0
         dNkNmfTqA6j5/I+9tZRtJTE7Q92bA0MfKzwaz0iDNlV4Jl4yMhsncTAkV40Pd1Cz30Yh
         7IUrlTW1TCPNjED5switnWtjDK9J8QT3bEe/cJOL6xQRpZd/oiYx+91+T3+9BCedDNQy
         Wv6AQE6k5Wa5IJSjTLwDNxqhcU0xi11wLUbEptbj9uVYB0/biX1zBUuOzr4wx1eq8d6w
         nvTg==
X-Forwarded-Encrypted: i=1; AJvYcCWx4RFOGfsqszPvGsGY/Z1+4RzsRujwScopmPEk4/GIAE02nOGpF7u43696MXOfy5PUQclee9Yi9+gWvkLABVjZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxmyGiWF1Q3RyqGhbGv14Ltfj+DR1T8FmBwJ67j/TOSFJG1bhLR
	zuDxVk3sdfY9aHQDkRLQn9SAcgR28Ox6MU3w4R/KGj51ZCVon+XGffT2EW8HU7P1VmDZCHVPPXl
	1
X-Gm-Gg: ASbGnctOD/CzyOJ9Lgvz2GrbCb68SN+tJK0Dt5cuIJ8IgOYeCdqPZnE7RfTqrfJcfyO
	G2ZwP6pEUd3Gf1PIRJrb3EbteLEhClpy33UdwkO09BAHNiAUh2Pl3XIOVJo/JPx6EumeyPp5lfj
	utHXA1AdNrX3Y5pGB2Cs6Mk7ELWaVaGC8eKCxBm0Ta4v5YVDS7u0zyLFvUd1+V7Uj6gdBBrLwPD
	pWpe4CM8EQyl6TVRnNMwAWQDxrFIXH/U20QuA3cY8fLLZ4Z09EVbPSgcuAPtaCnV4Hhbik4IcHW
	WvMV9tipM2sjU/uVHXZ6lQ10eKjxOKuaWbxPqIluW9vrpoZO7Je/iQmsb30pN3gCX5FzNz4/P7E
	OuknwKU/8bf/Qn5k=
X-Google-Smtp-Source: AGHT+IEN0ddkfxeUgfcu3uOUBPG5D5WB3HL16m1L/qkNsUmiRD8iOuxqK/rPwSxrQiytFN9HNB8I7Q==
X-Received: by 2002:a17:907:bc87:b0:ac0:b71e:44e0 with SMTP id a640c23a62f3a-acad34d87admr480746866b.9.1744698051564;
        Mon, 14 Apr 2025 23:20:51 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm1053861866b.98.2025.04.14.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:20:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: yong.wu@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
References: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add SMI support
Message-Id: <174469805024.15476.6855555365246052771.b4-ty@linaro.org>
Date: Tue, 15 Apr 2025 08:20:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_232053_443068_56248088 
X-CRM114-Status: UNSURE (   8.78  )
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


On Thu, 10 Apr 2025 16:39:56 +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the Smart Multimedia
> Interface and Local Arbiters of the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> AngeloGioacchino Del Regno (2):
>   dt-bindings: memory: mtk-smi: Add support for MT6893
>   memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory: mtk-smi: Add support for MT6893
      https://git.kernel.org/krzk/linux-mem-ctrl/c/98a4109320f9b7007475a9d6706d3434cd8aafb4
[2/2] memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI
      https://git.kernel.org/krzk/linux-mem-ctrl/c/bd4f5f6c84d074d9347b55731891729f136d35c8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


