Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CDCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vk8FOGphjAtBrbDVk0JfE+k0FaInbVBLe1YsUYKxuMQ=; b=Dt/pcX8mwn9CzM+/2jEv5PfC8c
	YKrBR2tYD/+FUv1w357YLWOrkEdW8XJ8aBZnGFnHkIxr6Cj/Oo8PKflFnH8EOGXbODdH35X/N7jrs
	hl0Q2GMJZElcXXhCAQU1Rra7/qf9sNgr6vNyCcRNlkQ96nAPyNM/OvReeUPBo+EXV9eOsU79chDYq
	GulnIA5UMC99s4UAw9CAhhcG/6l/1uV6p0bd1lJkhOIBbNtsEBGFuoUQ5PMlMKreBJ1i3Xjs+4xH+
	7rev84rWDhCrzBx/AKOg4bzALQX30AZ6AT9uvdRF7H3uWM2wB3SJgnOOltNlRLwxWxWAazlA78dFG
	EDvz8FBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5CB-00000001dNW-1Eb8;
	Mon, 17 Mar 2025 07:47:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5A8-00000001cuq-04Tk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 07:45:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so12277655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 00:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742197526; x=1742802326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk8FOGphjAtBrbDVk0JfE+k0FaInbVBLe1YsUYKxuMQ=;
        b=lo6C2f5ailWtWx1j+huqb1bNuunpVIrWlZptAnyMw3sY8IBCKE9NytTCQTmz4q+1ga
         AoMLUXKr8Rh1lHHki9Ojf+NLLD//BxAE7QTfXQznTnnOuSpQvW3DraJVS658TO6JPi4+
         uHhMW0mLn/YgmEWlCA7QWV7EwDkF56/Qrypx5H82baEacj2GIIbzbMXWgOJHw+DW8Dg1
         Aagk1wFc4hwmM33yKEawDrgRBTJjYURpjKUmOksXuMulo0cTRAfA/pLvn50D0HvX1BMQ
         YP/orqD1oUUvqsZ3kyZHTAJNIOeMp1265EIdci2NFTbd9UUnmC/L7s1KtEsITBGqhpTK
         y2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742197526; x=1742802326;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vk8FOGphjAtBrbDVk0JfE+k0FaInbVBLe1YsUYKxuMQ=;
        b=UhXxaGIvwp05LE32vQGPLeCnK+MEn/XbQcLiNc3x27mk759V6DI6Ks8UH2gKZyedBH
         vGZ5fsROqqJ/lyvV/Po/aEuLxOE7HchRRygldVf25ItCk5mLiC9hZ5ClHC70H2q7PLgu
         2dGr2JXOM0vk2S0BxEyPAsMxVMe+ZsIqpHar2ZflvzmBM5JTnlOpBHnUzLEJ8dwf15cB
         ohdeCW0Y4Niuz2/8Qtmn8ZAjNFveIGxcOQ7eGWdJKhiKP/jC9tOJo9lOxLpJUXQWjrGV
         HFcu5vGw7WdLGU6OMOTAGMzcUP4anS7YCjLR3rcodPhTkywRXPszUL8/1u413l+J/ldd
         E4mw==
X-Forwarded-Encrypted: i=1; AJvYcCU/zBSgylHefIPMZkhJ/EYUwaCbaXGpYpsQUpXbsWO/85ka6kXkWW2ZyVnALlffqWHSZkUza7Ibs+a/4BpoE8x9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Pc6GGb1gjn/8nIor5ZpiaXott0chmbUgArNrD0KPRnYP3ia4
	IFSfJbGryiTEqbO4SEdwgjQ+q4nlsnVBuKuan3CF4d7h7+IcK2Vs05E9a46+roo=
X-Gm-Gg: ASbGncty5x3Ye+hSHaqwBOPHJjETkb318zjj/2BE4fGxm5+DI/nrMm70DuztI+gY5EX
	IRsPdwDRqswNiY0WriB4wLnihwcqt5zRdqbDs1S+Aiqss1a/9YhiPuBtI+rv9l1u0gox7V0+HQK
	tHMPEjcJjGpboC7tv1BfG7hnQuNuFhjiJ5dDux4tVZY8bcSfKkyasT9g5dIg+3agZXfakevQBut
	CWYAcsW3CxfSWmn+/kXsct7rf9XuMd3WtLvI96ijpUhz0nc54ukbR70gc2xCf3SAbarA1XYZNwQ
	mvYOaSI1FrlzgUKjCW6OEW5f9cGjjKjUTh6hK94+eRRtVvWinGBpWa9wEeSzXC4ZPg==
X-Google-Smtp-Source: AGHT+IG6OwIB09eeL1gfs5VuJzC5+gQBxu1FXFMWxkoy1MNMXoRRCuRseYNCRtOrnhIHeZxIA4bArA==
X-Received: by 2002:a5d:598d:0:b0:391:3988:1c7c with SMTP id ffacd0b85a97d-3971ddd6086mr12870277f8f.24.1742197526437;
        Mon, 17 Mar 2025 00:45:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df33aasm13884756f8f.2.2025.03.17.00.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 00:45:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
References: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
Subject: Re: (subset) [PATCH v5 0/4] Add GPIO interrupt support for Amlogic
 A4 and A5 SoCs
Message-Id: <174219752573.3092000.16919170480596322661.b4-ty@linaro.org>
Date: Mon, 17 Mar 2025 08:45:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_004528_086719_C98ACA5E 
X-CRM114-Status: GOOD (  12.13  )
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

On Tue, 11 Mar 2025 11:08:26 +0800, Xianwei Zhao wrote:
> This patch adds GPIO interrupt support for Amlogic A4 and A5 SoCs
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/arm64-dt)

[3/4] arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
      https://git.kernel.org/amlogic/c/31c6bc1948b5a0a0d7679cf948351156608ec148
[4/4] arm64: dts: Add gpio_intc node for Amlogic A5 SoCs
      https://git.kernel.org/amlogic/c/454e0353b226a47f3c3369b17c7a4893f74e29cd

These changes has been applied on the intermediate git tree [1].

The v6.15/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


