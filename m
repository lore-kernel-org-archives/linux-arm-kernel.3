Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E189EC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFphVcqK3mFE7z2xyqgIGdTaijWdMSkT/C4V2pISyXU=; b=KB4IXTMvgzO7ytfTTUa9wMxdHG
	ccHiRebBFrrcoZF/71wYdHwj8a/c38aclR0f9yZrpDBwe4mndFdM3V3Rk3foWVZq/IK5Q2rZC9Mva
	Y7F8Q/m0JuWVVMIhduhOC1TuqJfpzljL+5Qgb/3rsJcofjag+zXqWCiUuUyIg+rgFbIEHxs846mSA
	KNe8+kWAwobMJ57ON2ixmDOD6lrbilaD//RIb89NGtDS4TjNYaJDi9Zb3YNIqjuPsIZY5mr8njNFo
	QZP0IKKy2IHgeATBHsQXdEXWA4aXboy4+Kf30G3XkLfRVkHwPbl6TwU0taOKWGk3kgcic5bvP2Uuj
	d6Fh2KNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Bnh-00000004oGT-2e7q;
	Tue, 08 Apr 2025 16:27:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Blv-00000004o5T-0O2l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 16:26:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so4372425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 09:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744129557; x=1744734357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFphVcqK3mFE7z2xyqgIGdTaijWdMSkT/C4V2pISyXU=;
        b=q76AC32GIUN8jFu99rpKXKcV8CKW0UQx3Wg5m8i7rUHTO8Cs+bAj8ZuRoBnHZmDwfN
         AU4a5su7xcpxz2kuRCXEB6wDMtKMVl4MoAV69/VYl+eRglkEYK6YAFxu6qnnuGA5W2jf
         +RqMhgvt1JcA8Lne3K3O4Ozdd8Rylj7lzE5gyOEqOwpu528XOCRHSjNboe8PWqgcfcSd
         7ss+Q/TOf2EH3LA+wd4zAqibYLdA395b5wzsd6XtppHgKqx0TwyxK0YB0Q7S8dSn1ciq
         OUBV+rHqi5AzciY7lVggZ0/lTgg72itenyU13i9DD04hfbKSWBpi5+NPVqtOA3APM/jo
         MmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744129557; x=1744734357;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFphVcqK3mFE7z2xyqgIGdTaijWdMSkT/C4V2pISyXU=;
        b=Gx/Ha15lAbM5ENWM7PCk9Ib9BV9RiKJG+Mp4DaZfs93TJ4Z7OmgoLoLZNC5o3auXeP
         rBkmMBu5FIJLldIkWLMVYFGAKmLN/sLzfkB3GumyKK6HyBHrSS9CdHoIWQLLbBxIkONX
         i4JXfEfWM5ka0BNYDejPWebSPAfoj/2Y+JVeecvw/xDUTXfyMldA6rN/exen8s3JRiln
         sL/gklKnVW0XizHQl7evi90ruWwwfJEqaZoTUBKc1Bicnq9ACGXMMJPL8MTjFoTq9/tY
         df5Zx/pb8/YpTW94WdHzvBJUFcWhZIhkSxkUI1Km8KQ/Rc9OkJbhK4MlZRAf7rvVpHR8
         gk1g==
X-Forwarded-Encrypted: i=1; AJvYcCWUecto3P3ikb9iXd2M8lNWMMqsEA6QRBOSt4yDeAaTLlzIXYPeS0aNeD3PaLTTokvqxk1i72Q4yvUUa4M5oThi@lists.infradead.org
X-Gm-Message-State: AOJu0YzoVL4d0X9A74QkQd5CZhU1sPu65nG1j66BmCAQxz7wrKCP4kZK
	1s0ao6Xrm3AVm8mPPryVunSlqLgh6VSLGxxpmQKvIDBtVFW6YvEDk+kJiqV2liM=
X-Gm-Gg: ASbGncsBlkyzXcg1IrUE7bTFi6KQuiwJ5Sfi0AH5fOFmHUpqyx5OMc5JfJHvzi30cXJ
	dKhIfFyaRhRRWqdZEnF9CJBo6VBVBalTTt7Z4f1Rvc9kjFYt3dfIZpIsaZvCnvwBoUOArhq3bC2
	EFg0XkOqGg4VGU2uvdMOJtA3fFIJ2DRESmYwwSSjnHLdJTS0UCvP1M8uo0C1+QdPeKfogvwgRQG
	oFuKWeWjlUO95Q/qR3RDPUlVz/Sl1m1PUU/hURl7KDREPJPi+3QifrzxkPlOH2c/uCdCN3pCgGV
	5if17XOiV9UuLv3oWYe0L560hptjcaSmOvXlRyMLSgOzJNRSHx+KBKYVdlw9vu1T3T97r8AKOA=
	=
X-Google-Smtp-Source: AGHT+IHcjPw7vTVflIx/On2eYRJY4Tq9MrtcT3MQ3yA+ESz6rLfbUvrWYzlL9vvcgtQLsbxNYvAtHw==
X-Received: by 2002:a05:600c:848d:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-43ecfa18ba7mr56191265e9.6.1744129557114;
        Tue, 08 Apr 2025 09:25:57 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm164763125e9.9.2025.04.08.09.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:25:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk+dt@kernel.org, linux-fsd@tesla.com, robh@kernel.org, 
 conor+dt@kernel.org, richardcochran@gmail.com, alim.akhtar@samsung.com, 
 Swathi K S <swathi.ks@samsung.com>
Cc: jayati.sahu@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
In-Reply-To: <20250307044904.59077-1-swathi.ks@samsung.com>
References: <CGME20250307045516epcas5p3b4006a5e2005beda04170179dc92ad16@epcas5p3.samsung.com>
 <20250307044904.59077-1-swathi.ks@samsung.com>
Subject: Re: [PATCH v8 0/2] arm64: dts: fsd: Add Ethernet support for FSD
 SoC
Message-Id: <174412955552.86459.1583748766350981659.b4-ty@linaro.org>
Date: Tue, 08 Apr 2025 18:25:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_092559_155258_70F193B8 
X-CRM114-Status: UNSURE (   9.77  )
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


On Fri, 07 Mar 2025 10:19:02 +0530, Swathi K S wrote:
> FSD platform has two instances of EQoS IP, one is in FSYS0 block and
> another one is in PERIC block. This patch series add required DT file
> modifications for the same.
> 
> Changes since v1:
> 1. Addressed the format related corrections.
> 2. Addressed the MAC address correction.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: fsd: Add Ethernet support for FSYS0 Block of FSD SoC
      https://git.kernel.org/krzk/linux/c/1d62af229b18bff2430ea5dde0e129d43515e12c
[2/2] arm64: dts: fsd: Add Ethernet support for PERIC Block of FSD SoC
      https://git.kernel.org/krzk/linux/c/ebeab0be707ddcffd2b7f6ff4f9bd8e0c1c49fdd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


