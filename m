Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A00CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79KifPwGGK4mB0WoW1yjJ4Alo2Qr3NmP9KvDMNbO2zU=; b=s6R0ZWRPsjGbGPIIiLpL4VD51q
	oTiMVyjM3cmntmarT5a3oH36g/cZc3Y/8xWwh8u46LuV3CqaRcddB4kSPERQp8z7Xvnbs8QWEEYMd
	N1eavcbyywI/DIXXOYMjapsx1ovWWBvOdDu8Jo5BVGbgvOsJoo28mI7XW1PhZjWpg6kCMYMC/btz9
	wSo4yVV9kWTYYF2ZWUyI7OUMVp6UgndaOrf/djviw/XxAieEPkgmjx1mjdoqQzvdLisN5Le+Hl3XM
	xafAsrD9UH3RpcRVf1JffgKaNaC9dMoYZn4yhKDOd0yKzorCfyQIvPRziybq+gDmIFUdd0QhCNCn5
	6mAZrz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86O0-0000000BzGl-0HSZ;
	Mon, 13 Oct 2025 00:26:00 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86Nx-0000000BzGR-2xLG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 00:25:59 +0000
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2eb5c9c9so105097b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 17:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760315157; x=1760919957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79KifPwGGK4mB0WoW1yjJ4Alo2Qr3NmP9KvDMNbO2zU=;
        b=FMJ6TKMkYpspGN7QFoybeCgKXCsAT8nzvUCZJxVWS5Q8Lwt/40RITU+OMQy1eeHvPe
         EdLA3j6Mzf+uyCCTtYXAYzj7a1mWfDfWxqBMhChNjkdp0KDf4+gNqdEF08fI3KPDBNKN
         1XZEXdWeSe13i7Ey91tkwev5UCq86ev5+ri5STTNkJp5bmETI9o0f0TmHdGKTmZ3Ztav
         L957FzuU13ZP+okZzWgFA8GIcDhrkvbzvPJAki2SaNgzarx2RKfonomMHYbEc/zcOSty
         M/zrMORdXQbEJxwAlc099Hx3n0X2CfMB3xxIZP0LxZAjesKP8ccJGJdI9x6miAFjBT2f
         j70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760315157; x=1760919957;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79KifPwGGK4mB0WoW1yjJ4Alo2Qr3NmP9KvDMNbO2zU=;
        b=q7pDGcRUgDsvgoEks4iZXGCPCq/mseu2HncATteEffMqGrwXP3FJLlk2o6JlyeHBhF
         bl9Z3jls3E4d0EQ9fa0shZRzset39eLV58bOOv4iADXb/uByiePKlBRsSJhoDlHaxNod
         6lJ10m0lbn7woUxrYYY/0mn7ft/FI1hJJgzqFlEnVfl5ZIAL1uj0pp9lSave/BL5f7Op
         Dxbw6azlwF3Gd2G1K9FiUhYrdZSyATnHu7q6/LK9+1nBgpRoSeq00Aqpb3tTAYjowIh+
         Nqy81mw5TT4mmy88lkUBZcnb7QPE5VwPDVeudVi0zdSpp+n2a6Bx/554O8wfCZ9be5CU
         bx6g==
X-Forwarded-Encrypted: i=1; AJvYcCUtXhI5MdktxcHp3sQlSBBbDjhIGRuPkE8ZtB4Srlc1QjMySPP652XAGz0uck9UN7dNu991MpsMfz8oTH4cdOHU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa3uPhDtpJwcRMztNNr32QviP93oG+hJbI7MOuwG7igcI5jgs4
	gGSQFeFVEAXsDiGft/gJfzch6N3wGlRRfzP+x2AGHEjoXYOVz0jesJzlsCO9L7A3WDQ=
X-Gm-Gg: ASbGncuKDxABNIOgVUP71QqsUEvBl5Kcj1AqeQmA/X3qM4mGu5Sic8xjcQjhtmwpf1Y
	hNJ5h5+9pXJVPlcYj3I8SOi0mymPIJ4oz0gakkz9ofa6ectOB/GZMx4Xp/x/+yOsciYx6fSHHl4
	lxPpjhZRwyVXKhaXUQwrEGDjUixfc8+BcGqtoMv2Bw/a6xvb1MA2pj9G46YW4c4bn7lSeJmG9JB
	Lrcc+eUTlQYsPL+duuNJ8W80YYhvYh1RzQkpD9qN5oriPNPhHwpbJyCwhkY7fV2E4yPAuNGYE9y
	8ZCrUnTBGl7cfN5syXaytA/vwHZ9y6vUfa5CWefpBOBycQBRGNQHafMaGSZR09alfXkv48sWqO+
	N4+3X9o9BYRlez2pVBXcY1/Q+2W8ELEuHitxQRm7pwvAIEbyb1HziFz/ZprQUUeCm5ehi/H5oJv
	NDD/sOBw==
X-Google-Smtp-Source: AGHT+IG1iyXL4pN/qvD9XLmsJIck33wkHAeiVhxj8ffXxtDeckyVCZeHinEl84ADeFl2GumlvaBQKA==
X-Received: by 2002:a05:6a00:2295:b0:781:220c:d2c8 with SMTP id d2e1a72fcca58-79387146ba5mr12345789b3a.3.1760315156841;
        Sun, 12 Oct 2025 17:25:56 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096740sm9624862b3a.38.2025.10.12.17.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:25:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-5-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
 <20250928-exynos7870-dt-fixes-v1-5-a40e77a73f16@disroot.org>
Subject: Re: (subset) [PATCH 5/7] arm64: dts: exynos7870-a2corelte: add
 bus-width to mmc0 node
Message-Id: <176031515137.11660.15560543530858079871.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 02:25:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_172557_823893_82EEBDDB 
X-CRM114-Status: UNSURE (   8.75  )
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


On Sun, 28 Sep 2025 22:13:56 +0530, Kaustabh Chakraborty wrote:
> Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
> assumes bus width to be 8 if not present in devicetree, so at least with
> respect to the Linux kernel, this doesn't introduce any functional
> changes. But other drivers referring to it may not. Either way, without
> the bus-width property the hardware description remains incomplete.
> 
> 
> [...]

Applied, thanks!

[5/7] arm64: dts: exynos7870-a2corelte: add bus-width to mmc0 node
      https://git.kernel.org/krzk/linux/c/5b33bce0bd31ca3ebc5e3a75b3053141540ec644

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


