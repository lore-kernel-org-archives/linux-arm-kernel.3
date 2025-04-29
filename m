Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630A6C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DpuU/QbbCsDjn7g/5fZL7Kv0FMaEuMia8xRIYO6BRcY=; b=l15ZwSLljx/pITOnvDQ0AOQov2
	am0X4FX0evKlmIdCOqckGvPrDWOJDzy8Wp9q9unn+tV8WaOENlgms4vGTANI+kcZErx3KN0IrgDKq
	iaFngnb7b/MhzRFSzgtHNMVyVQVwDGoULPUTGGAGzYo78gGlIjlPE8XIzqN+Kfj7pYP0LH6vi7MVp
	hY5fWlC/yTPu1VOkT1rnpDL7bgZB+UZ8If2S8Ne7YQbnGdWAOhBXF3kf/6V5wrco5So/k2ZHI9iXy
	Yr4GtiLW4EesDnGkHeLkMWK5PLQEQjTHvDCWopSR/FW9UHOidT6WhVkYzE/PJY+UtIk+kI/8UgfIv
	ro2ecvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9r3e-0000000AhEq-06Ha;
	Tue, 29 Apr 2025 19:55:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qz5-0000000AgdO-25vU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 19:51:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4722648f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 12:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745956273; x=1746561073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpuU/QbbCsDjn7g/5fZL7Kv0FMaEuMia8xRIYO6BRcY=;
        b=jOlr6OaDiO9uJlM3AgTgr8O/tDzsZhy6MNYFnweWpC2opL9o4MT3QL5INbEu93lECK
         uprE+hyxrvtrV5WfW9oDTQiy+ewJQqn8z8MoJsPGKy2Be70QuM8sY6P5hhwDxa5ir0rl
         dr3xsAR5P4NP1KyRwOL5u51KRwWAPsCmZjfN7Qif94Mwm5qj5O0Ay3XIn0azTQourKwz
         YiBhK2PtD9tb9yjxnrHXKhxh1R3RUiv1rjhQM6yqwRHkaWlv1LIV8Q0g/uHdkZwbqZ9+
         BACVJ1JwAoliizZenJpa8Pmy7Am2JpQ7UmzlZ/772jLsiTzPK1+L5B+7RQB5omDzjo2P
         WBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745956273; x=1746561073;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DpuU/QbbCsDjn7g/5fZL7Kv0FMaEuMia8xRIYO6BRcY=;
        b=inMpskT2SWundW0XSjQ1FZ3lladafW2X7UArHbC350ZuV17bdbDQzMgsJ4zu3mYVDq
         aftWe3KUDXkrIiCyTp1+MO34ovbTIsyXpiE81+3FFn/OhGWkZKmz+B8HiEYcnE5d92ox
         LUu4Yu+6b7ZH+peC1W2oBGYerHJHp/cz1YCqVZLZrajVhBJFvEJXFUslsYZwO9m+DSEp
         AudsR/L/q5ZW68QSSfOWYDwqMZhiGuljZJRld+CbbvQcIizl51wDRGtUokfrgMbaG/FW
         ZPbMAJCDnAXgCXS+zLw9xOLYbHCVRIsMR8UqZ95Ld9BHSp7bnoMyiclnwNTXibTUshkl
         /7lA==
X-Gm-Message-State: AOJu0YwAXD891/1ltlx15Trtu00UjqqddwISEx6Is9WOaIWQcRxVVu/+
	vLYH/0VgFWTCc9io5dbzH6EzXEyJ1wBENLzmjKGowG/VJJnuw9LpyzqEdfr3
X-Gm-Gg: ASbGncub30Xvc3+qR/myZh7JYc+ZA76UCGrVt345n/60IJYZBXrHzt3x4SLFcMOXwIU
	EpwFdEfe6g8z00YheMT0szws6ZVBK7/nmJUKjg8Rp4+zcid5MhSDaQ6ZhFvULAXKyWskJ8SX48e
	03MsgtecmfptPbRARU/xHB7mBIGL+8Fri5jhaeilUGh3iC+U1OCeVBee4JBGeeN0sM/h40Cw7FC
	PWenJCvs4JhnhVF7ngmbVRWLEqglaJTTW0dc1DFrtWOhNZPHQJWlLw0WbR8Oa4iqmE8Vastyl3T
	7ZYTlmUO/wEoZhJjQnKnHSKvl+KSIyRzTMQFGVQn22LyumqCkZ5O
X-Google-Smtp-Source: AGHT+IEjgsJPfac2XxBU5WYmuZlZ/uRKQBSizR1fl3RJO5bgEc0OUCbXE2MDpOf6drk91+Ec3iF26w==
X-Received: by 2002:a05:6000:420e:b0:39e:dd1e:f325 with SMTP id ffacd0b85a97d-3a08f77c26fmr606792f8f.31.1745956273149;
        Tue, 29 Apr 2025 12:51:13 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46869sm14883373f8f.72.2025.04.29.12.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:51:12 -0700 (PDT)
Message-ID: <c84e8246-8104-4409-8d95-389d61bc07af@gmail.com>
Date: Tue, 29 Apr 2025 21:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
Subject: Cannot boot imx8mm symphony board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_125115_542654_5506B938 
X-CRM114-Status: GOOD (  18.89  )
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

Hello,

I write this to ask for help in booting linux on a slight variation of the development board imx8mm-var-symphony.

At the moment I am using an u-boot version that can boot a linux 6.6 kernel and a 5.15.60 that I have
adapted to my custom board: https://github.com/NeroReflex/linux-imx/tree/old

I can boot that without any problem: the gpu works as well as networking, backlight, RTC and every other device on the board; however I want to use either 6.14.4 or linux-next.

On that version I can see a device tree arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
that, from my understanding, is supposed to at least arrive at the point of printing something from the debug serial, where I can actually pick up and start figuring out what's missing/wrong.

My problem is that u-boot (the same u-boot version that can boot v6.6 just fine) works flawlessly, the fdt is
loaded into memory as well as the kernel, but then I have no output on the debug serial, no backlight is turned on (I tried adding my screen to the device tree) and the ethernet controller on my board does not reset as
it usually does when a working kernel is booted: this lead me into thinking there is a problem somewhere in
the early boot sequence.

Therefore I attempted to use the previously working device tree, the one from 5.15, but to no avail.

At this time I think my problem can only be either one of these:
- u-boot I am using is not suitable to boot kernels past 6.6

- I have a problem in my config

I also tried using the following patch as it appears to be relevant for this hardware:

https://lore.kernel.org/all/20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org

but again to no avail.

Can someone please point me in the right direction? What config am I supposed to be using to boot that board?
What version of u-boot (and configuration) should I be using?

Thanks in advice,
Denis


