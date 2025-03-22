Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD1AC36005
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 11:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C0I2cgJInY6cmpTkLRmKCoqloHxMw+gkBfK5EoLUqHU=; b=WrgBYHE6Y3sb7ciy+6vvqFx/zK
	LIGrGEP33PRajWixDsPvoL4lWvhZTovvuqSo4rB9H9Gxp1CshhE8EPHok1JMBum48ovhbmIa+tqBm
	pzjg/Vuk/gLuuOzI7iGAx1a93DUD/sUFRsyUP4p3eBFzW1+DAw9VIhE/wHcG4gqLHwAhXBY+TuMDx
	uert5NfnOLDVmA+25Kyo7gvZ1/oCegyDlTrDUDzQ2P/gO1Jc7tXOsTqIJvR+25l1TqG93qCo0DA1s
	becsHNqVqO6nMKG1sZO4yetLbVeBWwd1tYOrV3YKSiYdJ0MStwvt7BFNMH/iXx5zNXxdRCv83IT3O
	Z/J9lZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxDx-0000000HLVL-1EdK;
	Sat, 22 Mar 2025 11:41:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxCG-0000000HLLh-0WAd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 11:39:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3912c09be7dso1834629f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Mar 2025 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742643562; x=1743248362; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0I2cgJInY6cmpTkLRmKCoqloHxMw+gkBfK5EoLUqHU=;
        b=lcaz2JygKWXQXLOqb3EgoHQ8hMWRafF3dI6jD2DkbjxdYoCJPrJ8ZE7WSgJ3Nir67m
         YXA9y/x2OO52GeKOkViBuDW3leMsSr9NMZ3wgGfVfIePtRReeRVYPksNeEoLTqr7CQUd
         6rIz+2AGZZqGbMgchBlF2wgh1dI75pvNaJIQ2TPPMQrHT7oWQASWH29oto1PBABju5OZ
         BhbiGD59SrTGP+WlIjI+YuUIBOWyLHwHGwv2juRXsj1DDLnhNH42eN+oQb9prVcA0Kaf
         +EELDtwyUvYFiwxbCKHlOoqIiWx/RYKe0pPiRkYKOFWON7rYtvhcOmfsJyGfmpk0N5t1
         tv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742643562; x=1743248362;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C0I2cgJInY6cmpTkLRmKCoqloHxMw+gkBfK5EoLUqHU=;
        b=dAomChiQRJzvw3WuJOukDbgE6tgD5pRlZzxP3fM3EQpscDPr3HwHc3fqwqoJJXb51v
         OmXPQlv+9aSUXN7cnM1EX44ZWyr0rYza20ZrG406J+uU0iUsNJofF2hgbtQ8jTyiDcKH
         waYnhTaIfS/TvX+tYcEaAJomIGj3J6Wtve/wBxgigAu5naTS/D6dCwj+VK7l2HozF+Wf
         8WjOfqjulLsfd7IBlYOjekr+F5lGsOvrGcp8kcuqx1QtOsG7IFCC7e3fq18xYf6KrGBY
         l2s+7gcXRWOWVNWhv2j2rbB20k1pRa3wgKUPxsEvzHsJraiv9dPTasvEpjH0weUu/pNq
         Egqw==
X-Gm-Message-State: AOJu0YwF43krVIyf2n/vVZGD/g9WBNwASOCX7mw2/F+kYt/xJAuEq221
	R4BOqGK6Bj5bhk7iRSbD89GU8TVn4m4pgnBi5iH1ErG0Y6bkrLkw7UHhKXrszosUffgrCmIotGw
	o
X-Gm-Gg: ASbGnctABmlZWkVWCi63s8XMU4Cp2CwSf4FJ+fiN4Q3f19ngqb6bgqyNlrfKfxNaX67
	Bgdaz6Ljz5DTMbZTFVA22UqLk16V6+DRyAML0FpSBja82/OwjRMy3pTR0HwVM8Cmx2OR1ncY1ck
	P6fGaOMlxVTz9OEgeMX+ETzEL0J5KdzIsbRApEce+F4SlCgTqc/xc9/rHO3Xc0CLQ0sLRQg9Vun
	9c0u4ghKHkSBXfG99ghG5n3ZjoP+C1D6q1mpvGtn0vgZah04+JZRGJ85dVS7xk2IlnKdHJisxT1
	oEuPy8ZW/j5h+H4MX2iZKMGXzJLfLPZhXocVJt8zduFgTD3s2x3RKaDb23lQIm1m2NNUwp1I7vl
	7UkC/Ycyn
X-Google-Smtp-Source: AGHT+IG7ln3MB3z/hMQGp+M0SaWjEL/R1i8Wr00KJP8jpRe5DeXr9bg6JJ9U627gyHVRWhjbcGOAIw==
X-Received: by 2002:a5d:5f85:0:b0:390:d6b0:b89 with SMTP id ffacd0b85a97d-3997f93c41fmr5691671f8f.50.1742643561809;
        Sat, 22 Mar 2025 04:39:21 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f81sm5010457f8f.35.2025.03.22.04.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Mar 2025 04:39:21 -0700 (PDT)
Message-ID: <2f686d68-4852-4aff-a551-51e8515de6e7@linaro.org>
Date: Sat, 22 Mar 2025 12:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: chester62515@gmail.com, Matthias Brugger <mbrugger@suse.com>,
 ghennadi.procopciuc@oss.nxp.com
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, dl-S32 <S32@nxp.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: s32 architecture upstream tree
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_043924_164030_57E7E749 
X-CRM114-Status: UNSURE (   6.60  )
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


Hi,

the MAINTAINER file does not give the information about the location of 
the repository for the s32.

Where is the repo to base the work on ? Especially the device tree

Thanks in advance

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


