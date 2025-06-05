Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7A0C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 02:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFSrb8j+TsZDDx26k/IZM4ETWwV2iNubnWTQvXXtJow=; b=hC/3aQlLkWOdhOblOfGBPkO3zR
	eUc1HXAAx72DjDnRCVZgLOPUTxGIAaqFWqYuZzABcStH8O20XJrm54vuCgvO64W4bGxQA4XrkRsWQ
	JlkwjUBmA9YqGlSXXGdBP3u1n5qB5/pqgQAl/h0Xw9a0vBVsH4odkKefNwH8iH2vHgDW/COeDrebK
	4y0R2qtlIFMtX3xfTlEe8/5MwgSh3bDaNIIazV6FqqAx589nemS05NemAhbURZScelM3Uua70XbMP
	W59f6xwIG6w4dF3+guVKxWeJXkapWe7JocZchX+VSwdWyivLUhQBZi7RkqzGMhgkMQLO8t6GbsgXB
	PMzMmpHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN0cP-0000000Ebjz-0rYf;
	Thu, 05 Jun 2025 02:46:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN0aI-0000000EbU9-0kLC;
	Thu, 05 Jun 2025 02:44:03 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so373834f8f.3;
        Wed, 04 Jun 2025 19:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749091437; x=1749696237; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BFSrb8j+TsZDDx26k/IZM4ETWwV2iNubnWTQvXXtJow=;
        b=EkW+NOd31YrYUB+x+tXYK+Wx7UslNT59iZRx9xB+0FgYScrxteGVgJbE21MGIz2xUn
         RmAA3gufwNQDqCPIvxHx4AYKqvEdaGQcIuGVp1DiM2Q8truCv1+vUH+q5LiyjydvRpVd
         yxh3UUgNpLgruFQCwBceJ3D/C78gthD2S/U8nNP93ZWNDHGnr/UuEr/dQrES/31pLM+q
         Jl2oFzq/IeSq5ZmLOPKjRDvtqivclkYyXw4NCC7eZat0h/JF7SE8BzkGCFsxJvOdG22R
         LhY3f/XYraz3OECqG/2PVuKkLeXnT71rOQe+1rl3ATwO/MxOjZd/TnZHapwYLIAqZmQO
         s1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749091437; x=1749696237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFSrb8j+TsZDDx26k/IZM4ETWwV2iNubnWTQvXXtJow=;
        b=dYxtHLcwj6D8Dib9j+5fnkfQXuvTQWD3g2YQgJxP12v6Mg/i1oFVf55dX6qJa5wRoo
         Q9uWxr7ehs3T0abZg8X2myosq2DLQXNE0dEUN11PhBV6F2G0So6+/C59MbNm54nAsT4C
         1/eujkH3JjLR1pZzyugFiUl6AwWENj+g4u4YflMFyPbI9Dh32f+dtbXaSDgWnJGNtXyv
         q3vN/bMoFAw6tcm7CwaPzLdmDRzkiOzaZwLNY9IiKIx55skIQUSvCxMcncuJueVkVh90
         WrZcxLTyezg7Sd/G5N4XuDDolHjD9XDcrbYWL8kbuhfpYQkZ08kRtx+kG269R3XusBuv
         Kugg==
X-Forwarded-Encrypted: i=1; AJvYcCUBXLBrTgdbJ2uPAccKy9Ppt11eywzrIbi9AS+uvpne9zC+lsFOVaB7HEaeBTogKyofwGGRdEm2dqkUrPtBZDkW@lists.infradead.org, AJvYcCXcSGh8KAQ8ps5f7qTf7sFoSzFBmW6oAFFWNN/u3ShZRJIidA5pVsqiNO3MxX5Kg5OTXBYQO7A8QGYABHPFjJc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQGWVMyXPpIL+Xt2EQarEzUl4QMHZQuJVT+Yia+XX9U9tXAKxO
	RYAvy5nllFpyB2p3Yc8SjRl5ZVeu6zxXWXtF8NKYUeBQ9eTy2EJPB8lwQoMUpe3LyBE2E3MNOSo
	yiH9spVb7Q+Vgy+kgetzJhYjQyjcL+9Q+ZYEAlk4=
X-Gm-Gg: ASbGncsQEY8iyO6TLhZ61dzdHGbUsvIVBfjOyGnPRtg6h/ETHo4XNiBTPHTk5kVz0qh
	0MiZQ3SkMG5v4+NdabFPeL5HCCjJEoF7gmazEoEbgjYzvLxQy+ERjYZKe54JgWD0NrqgIgJ4Xgj
	F1+L9yHauV4LkQAydLo3ig3h4mOUb6Qih/GLHtVAkOyTnwkPUZsQCMlYr4ZG0pIIo=
X-Google-Smtp-Source: AGHT+IFSSZj0ukXU+2d3TU2Y4BCGC/2FaXL1ZAZo0ytno6jkv2ETLaLY19ZjsW9GYPHc8YHRKr8hlJ3OUwdWgf0Zwq8=
X-Received: by 2002:a05:6000:240c:b0:3a4:f038:af87 with SMTP id
 ffacd0b85a97d-3a51d967d58mr4094685f8f.47.1749091436596; Wed, 04 Jun 2025
 19:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com> <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Wed, 4 Jun 2025 21:43:45 -0500
X-Gm-Features: AX0GCFt-8bMRNRfnCBvnWW5DVHg0Cj_xQytd5HCYOhhrfd9EqhtKt0epNoFKT20
Message-ID: <CALWfF7JOJSihtfqrFiZtTxnzvoU6FP3WXuWjYOVaAvjPJZWWgg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_194402_216144_54BA2DA6 
X-CRM114-Status: UNSURE (   8.25  )
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

>
> +&sdio {
> +       bus-width = <4>;
> +       cap-sdio-irq;
> +       disable-wp;
> +       keep-power-in-suspend;
> +       mmc-pwrseq = <&sdio_pwrseq>;
> +       no-sd;
> +       no-mmc;
> +       non-removable;
> +       sd-uhs-sdr50;
> +       sd-uhs-sdr104;
> +       vmmc-supply = <&vcc_3v3_s3>;
> +       vqmmc-supply = <&vcc_1v8_s3>;
> +       wakeup-source;
> +       status = "okay";
> +};

When you enable the sdio node on your v1.2 board with the broadcom
chip (using SYN43752), does the btsdio.ko bind to the device and
create an extra rfkill bluetooth node?

If so, you'll want to blacklist the SYN43752 chip in the btsdio.ko.
Similar to https://github.com/jimmyhon/linux/commit/81c14dc2dea2ceaea8d390188b352d32e278abc8
The original logic was introduced in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/bluetooth/btsdio.c?id=b4cdaba274247c9c841c6a682c08fa91fb3aa549

Jimmy

