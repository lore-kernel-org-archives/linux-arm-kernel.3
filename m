Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9430DC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 02:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jd4HwW3C0GzbkZ4o5YXYERwcRmz2KQTD3y8I//0WkKo=; b=albaCvBsPi02wiGOELf9g9E/5E
	fpQQS1L15Mha2N3/o9KQzCinJosV+berPUAOELDx+Mbwp0mkjgaKy+E4E/IqIAwq+2Vfug8QqnlG3
	vkL3RXLXsEIcbQ5MVpcwXM6HZ1WU1GCGAxz52EB5f+t0qY9kFq8GigZHnC9I+nb96HkS0JGVF6y6E
	A0Rhz5d9ILCy96B7W2X65DX4uSJRlJ77ICEbVEkuBbgiaFA2lKtKPT5FhSSqNm7IFuiOBfS5QcL7W
	teGabq4rRgRuiA5jSm/sCwfO9wN7jpnk9SM3rVzZLwiZHWR3Jzj+5tRCGtW/0ccv+KHk43/nYxqfp
	M2i2dYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjr0H-000000033QU-0Y44;
	Mon, 17 Feb 2025 02:37:01 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjqyn-000000033F3-3TT8;
	Mon, 17 Feb 2025 02:35:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21f8f3bd828so7240285ad.2;
        Sun, 16 Feb 2025 18:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739759728; x=1740364528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd4HwW3C0GzbkZ4o5YXYERwcRmz2KQTD3y8I//0WkKo=;
        b=fSwzAcNtqV77zaVivPzWkobZ3XNa4E1SIjewWtIe0ictxhhZel6zYKH/ZxLuvTpIEu
         +IYvPWhqBqWze+/PxcONi7/mEQmoH4kLffuqQ3VrgAR2jT+Z9Fu3heItii75G1d8Rajj
         t4AfFJNMqOsWEJG30DcEX0y8Vs48ZXSiK7PWjs8twJ+IIxKcsCI2bT77IU4M8ajVcxvC
         Xn56wiT5qbopyejBsxa00Tben7/58KluZQOKy5/zcqIQvmiVNilP3L/RaPVm/FRLKL68
         RMypKcTPmUoMb2u8uommqmoS/4CcDtwZ2WJuZ0BqqRWN17jaV6QsEpBxfAjbO+AQQxEf
         Y9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739759728; x=1740364528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jd4HwW3C0GzbkZ4o5YXYERwcRmz2KQTD3y8I//0WkKo=;
        b=VGYuL40Ejpi5h+ApeUVVIxZXa3QuoyuoxQANX3QiUQq+V0DiTR5UiyaK7Aw1YsBSIl
         jU/xQsrzy9u2+h7Pneg3+mNkFdsA/92jJfckBzC+UlmQQVfnGhwxTsxwMohkNElw31Ag
         nRgMLfBkgf1RgRIjGtoNmgsW6kGrXJ9gO7Iit9QmAMygdsPm+E6LMdh43VmCpd8TMcZG
         UKY4FnyB6KNSe962ZDLD8Aio+T95tUXjkcotxs7TUyVjWUksHZjoKnA5m1lHLWjPu3YC
         9h7xTOYmOdyjAIDspVpp9KekuN04b3krLowUxqlYrwEhuDW4vuAPnX5g9INNyCN2U8dw
         KzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOg0322zNI2+wzBk43z6znKb+kWb93c0+Owcaj1ZeDt1fsrNcH+ux0aVd0VT4ZO/5laZ3h3xMfYdFSrTKoX5o=@lists.infradead.org, AJvYcCW1Hg2ZrMfEN3YYOXiXnyPYeQLGIszwN1RS5jq3u0SO1gJO/Hni9IMNaSe0Jbq/ldREkMsPu+nWVV/318fLkv7K@lists.infradead.org
X-Gm-Message-State: AOJu0YzUiYlKyF6a+R/bSGKr509q1DSfqyCAFmZNWAQkBqc1gsMH6Bu3
	Pn4SgywCZOzpvfCtqEovW8atFMUXoT3GFf+nxcAGoNRWsrM1EdeS4Cj2Owkw
X-Gm-Gg: ASbGnct21/MoSJwS0zZ1uCCZCpz1d3VMSYaZUBh7U2h4kDYx75wPlV+4HXZ+dE/VMdl
	uDXwmKJ2tS17e8Z431jp3EE0ne+niPmdX6drA0n7XMjLgGQojf/haJmk8lKEev2CRE0EsOg40n1
	HQQBsNFMcpidgIPNmzLQZ7wxu7OhQxOS3WejEiXhNyYO3vjVzxW8H8Zw3WKZyOZ7/7LUfNjovP7
	BCS5XCvwzr1BpA0WEidQYfA4NoUT5Ebfy9vs5NAcyYs2hcXIGvceLHdqmQsF06u7GPiqyB1rbPV
	Cw4Ln4JTdUdvE3yyTVL8
X-Google-Smtp-Source: AGHT+IGNbbo7ikAW7Im+6gY74ZetG4o01fHwxCYPD6wtGVa+4XQqxJ9KfHcssadTuHK692BYrU0wVA==
X-Received: by 2002:a05:6a21:78a1:b0:1ea:ddd1:2fe4 with SMTP id adf61e73a8af0-1ee8c9aa127mr5494706637.0.1739759728075;
        Sun, 16 Feb 2025 18:35:28 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73260f9e6e2sm3702199b3a.79.2025.02.16.18.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 18:35:27 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: piotr.oniszczuk@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [PATCH] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
Date: Mon, 17 Feb 2025 10:35:21 +0800
Message-ID: <20250217023521.35071-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2FE649E5-61FE-4299-81D1-F838298A04A5@gmail.com>
References: <2FE649E5-61FE-4299-81D1-F838298A04A5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_183529_866426_B38DCA68 
X-CRM114-Status: UNSURE (   9.56  )
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

On Sun, 16 Feb 2025 20:53:27 +0100, Piotr Oniszczuk wrote:
>[    0.531139] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops dw_hdmi_qp_rockchip_ops)

It seems that hdmi qp driver is built in kernel, while armbian builds it
as module. I don't know if this is related. And here is the dmesg output
of drm on armbian:

jfliu@rock-5-itx:~$ sudo dmesg |grep drm
[    2.190256] panthor fb000000.gpu: [drm] clock rate = 198000000
[    2.191470] panthor fb000000.gpu: [drm] mali-g610 id 0xa867 major 0x0 minor 0x0 status 0x5
[    2.191478] panthor fb000000.gpu: [drm] Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[    2.191482] panthor fb000000.gpu: [drm] shader_present=0x50005 l2_present=0x1 tiler_present=0x1
[    2.195853] panthor fb000000.gpu: [drm] Firmware protected mode entry not be supported, ignoring
[    2.196019] panthor fb000000.gpu: [drm] Firmware git sha: 814b47b551159067b67a37c4e9adda458ad9d852
[    2.196407] panthor fb000000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0 Instrumentation features 0x71
[    2.221006] [drm] Initialized panthor 1.3.0 for fb000000.gpu on minor 0
[    2.566800] rockchip-drm display-subsystem: bound fdd90000.vop (ops rockchip_drm_fini [rockchipdrm])
[    2.567523] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops rockchip_drm_fini [rockchipdrm])
[    2.567882] [drm] Initialized rockchip 1.0.0 for display-subsystem on minor 1
[    2.740995] rockchip-drm display-subsystem: [drm] fb0: rockchipdrmfb frame buffer device

>Is it possible to provide me url with kernel package you are using (wich works ok for you)?

I'm working on 6.14-rc2 now and this patch is included in this armbian pr:
https://github.com/armbian/build/pull/7835

And here is the kernel deb I built, which is confirmed working:
https://cdn.haguro.top/share/kernel-rockchip64-edge_6.14-rc2-rock5itx-hdmi1_arm64.tar

Best regards,
Jianfeng

