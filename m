Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4DECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=; b=ndQ7nMr9p1t0o5+3pQsbjQ02eg
	zHOv+sc62g/0wZ1yziO0gVzdCpwUivwUaJaBQwmqLwD6xVX1QgdQT7RnVhJGnAOCLpuBtg7+t0wF0
	J7f1xs395GTdSWEPCwrEqjVuNDm5DBQKMsRGxuZZOmqBga3ljwp0/4vEZ/KlvDwYKtc0K09ggymgE
	/Abn+KcvQu9TBlOUPDog4ol04zIzrM53QcnJeR6ewdpMI4bB/+ygIKkdBDJfx44ZZvySsq4k6RYza
	9eDKh0IcdB7Cilz8DFZcImJZba/7/HpJpNzDCNl1i5bTXr9+P6oufC+4QPiFurPU+hFajik2D8/Yx
	SE23wUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwMw-00000003YGx-1Nyl;
	Thu, 07 May 2026 10:54:14 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwMt-00000003YFk-1ydT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 10:54:12 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67b7c77865dso1036908a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 03:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778151248; cv=none;
        d=google.com; s=arc-20240605;
        b=PWqNV+5aR/m3iKrMK3zc/Eo1giFzgirdmzHdQxEgbq0t5QyvEXy1/rb75wFm2awnPU
         BYCePlMLO0O6DaHq9VG90w8dMjA3p1jEN3icvxyL7zbt1pgfL/5ba0YT5hIH6lQRYyFV
         vb4RfIxlTqf/4eSp2TQPxCM4uHLbFmisIr5w++jOiQVGDpXivhav0Lk5j01VOnKFNXua
         QpMIqRMSrWf/bTIIkQjf+mUUq7B8hYbzES2Sy4HCVHdxhN6MhlSQt7MYCjD6e3FUIwH2
         QbF8nULl+uhGlI9J3lYaJ7MGzpdwRqUd3UIfNi2ufGOcCOIzM0h9cVAfiFiEt+ggI44x
         n2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
        fh=P2YxDuHemjZv3vrE0jq5zOBqCPXQN1wMI3Yuh7yDO04=;
        b=H+M+Fu9O+XJ9saPNAXxVEA1PhEPJitnNcuDzVPglCmvBBVIG9D88GJxDpO9Iwi1iC5
         fILDVJed/j+udwYaMt9BJwfMmQ/QvfnhkKnoPYojdWlgmS5F8NW/xDW9zYbxq6SY6y1M
         f4Jxq2z8adLjaZ74ShE4OM41qrWwpCPxdxUcEV0AGJjk0eu4aSWXEhpIbTlRzgfXPGg+
         bVj6xkqNawbksGmyMXjlaChMWgtE+0tsjIHy9P/HWKt8lhZAS5BXxx0zmAjSHwGnNrqz
         iShPvRQIa0lhwKEPI8GfIha9kHrXsVFqxfSEZhHQu+hTcwDBvr4jkDg3fcMqhkUQyT0s
         WblQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778151248; x=1778756048; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
        b=GVbOiDhjGzT+mxeM7NlpVhcK8mhHVoIVK8clsltfkZ3aSYy71MgBNHgUeFR/bLhlRi
         kMSHDDnxxy1DXTJ+W7VU+hoMc1JJY6sjmCoq42ULw9G5pcgrjLnmKDMb3Y9Na39kBrSC
         9lOQofFHs/82kcb6kDI3zrzpTRSwbMKNQsLQu6y0jqiwE+F4+vVajiv4Bb7pRo/xtMvo
         XYCYwaQaVUavWpzaXv7wmgFg9WYuAZLzS+JPRNU7vfTHjGDFUOny/8vkpx2RDteqXqNZ
         kq27jenU686EBJo+DcdYvYlUQDF/8URFq81QXFKLqvhC6t5VpB+ht0y6QqDy9JK60CxA
         8WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151248; x=1778756048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
        b=DARUnFNL/Au1atyweU/ylbrFMy/JD5mjNKxi1PRY6O1Jx+sUtTMz8mSHEr+tcoyRzM
         9ea2B2xzc9JXiQ5UB1d4XKBntobdKmRtraR0oWizNNFwdr51lX2Yx8IWO2xoffJ677cc
         efHPJkLAzh/WWDes8ESGzI9oQlznjszTOEGkSWeMQ0iwfY8d4SWhT5NfC/bDuw1ZFDlb
         r8//Icme50jyRcrb/g+j3ueeJNgMH6MjROnY8KM74u5zEvpG9ADSU5+v8z62xvsUdM/B
         mRtCGXWy4McOMm/FpzsyDcAhxa3KzSz2IvdfKtBKE8zvH7tF4EmpO0d4UtpoE+CSrYgF
         t6hQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZVlGs+6NOCoFzull2I89UnK7k2o1RvbjWyiR31uz4sSlppPwzWebJNvQJywuVmOz7Swf3k7+xGJ+hJbRJ4D4X@lists.infradead.org
X-Gm-Message-State: AOJu0YzMNN11u3sWrfxL+ngRLbx66p4I2P+7ZXN0wSnX7c0g8Iz749U8
	PRvxhjNeWotmMFeK4+LY54opcb2gPcJLi1G+pR/MhOumljPWw8r81nR83qMBqMT3a3XsNShqz/Q
	kGmIXAieK7OnE1qBCvh50Ocl92SdfKAhd3dFzWpFzPA==
X-Gm-Gg: AeBDievQEQhTskhJgNksiyJLo5VZd8NwO+SC+MdMtZDhxcSxLgeEcBmbg82tXBRQkaF
	gH6JrWB4jPJqOlzWs9W3YoyRaMY20pxtLF4xYHcjppB7fby5ijqSuRwYzYw8+ByKmmnsmuPtZxq
	eo+218NEoiZxvsAhx5tQAGONoGbBpA1IqgApu7ZGi1iNVq8Cs93V+88MPWu6WTwEs1BVmYsWeWX
	0TzV8nTjURiGMSdbRYPmCK3TJff/gNquEP2MnIORF/ohaJBVcVDXPqCfhZ9uUekmLcdyHZ+TTg2
	mPbYCWe4MLFZe7Fet/vEMNBsHwZ4DXlpLOWdSEfmNdYLxKa3We4=
X-Received: by 2002:a05:6402:3137:b0:67c:4e1b:9134 with SMTP id
 4fb4d7f45d1cf-67d642c320fmr2566539a12.14.1778151248006; Thu, 07 May 2026
 03:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260505171457.1960837-1-visitorckw@gmail.com>
In-Reply-To: <20260505171457.1960837-1-visitorckw@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 7 May 2026 11:53:56 +0100
X-Gm-Features: AVHnY4LKSqPHnQncQquj9gD7adTrcRRUygj_CaGGPmUeQcE-vkzmMD9ri7yM0M8
Message-ID: <CADrjBPp321nAD1nKs3VApd-6t6guK7b6k-cjsXHhS19_fJiOVQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, alim.akhtar@samsung.com, semen.protsenko@linaro.org, 
	wllee@google.com, hsuanting@google.com, marscheng@google.com, 
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	visitorckw@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_035411_527808_CBEA25A7 
X-CRM114-Status: GOOD (  10.56  )
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

On Tue, 5 May 2026 at 18:15, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>
> In the peric0_clk_regs array, the divider register offset for USI6 was
> accidentally listed twice, while the divider for USI7 was omitted.
>
> Missing this DIV register causes the USI7 clock divider setting to be
> lost and reset to its hardware default value during a suspend/resume
> cycle.
>
> Replace the duplicated USI6 DIV entry with the correct USI7 DIV
> register.
>
> Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

