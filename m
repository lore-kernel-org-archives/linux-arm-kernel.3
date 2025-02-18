Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C125C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 03:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpIhM0zsF5MRaXYqddzsaHiNvWZ/pZsLy5qS/qUhHO0=; b=EbrQc85J1qEFlT0pEyryd+tw/u
	c5wFSt7b6IE4LSIDUgoAwv9pSDOlzCg4W5LnrhvY2ZSgG30lPMvQPSwjsnp/i7i+qOSh5i79qvtw9
	yZKwyx3irDq9KwQiSJqLleWggiMisdwjbxCaPtITgJUTUc8Ha7FlJs34ZgNxOqT6wghxzih8+W4IZ
	SJXH65ERLgaIPjs1TmY4hqzEXNLwxfhbMBjxZrGW/PiM9BcQI3dSzm4g5eiJwkikOMuhJLX4DsZ5v
	IOocMtZe27kyisNTvG3T1Wl8mq4GSy5xXeo96cug5k4TOWNqZmlVk/tFqme+wSftRSLgIAOMYZbWF
	ODWGvzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkETE-00000006dUo-1ZMF;
	Tue, 18 Feb 2025 03:40:28 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkERk-00000006dJs-439A;
	Tue, 18 Feb 2025 03:38:58 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fc383a11cdso830424a91.2;
        Mon, 17 Feb 2025 19:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739849935; x=1740454735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpIhM0zsF5MRaXYqddzsaHiNvWZ/pZsLy5qS/qUhHO0=;
        b=iL/iSeeJPp8DgwtvIhiFF5ccz4F4udtmFF2zxBufUtA//VJyxFOuxyS76LPkjCRXz/
         vGfoiHnuFmGQgQlaliB4gy5s2r0orpQji9MB9PVU4N/fuOqqeRVSe07QO2LNzSX1Tjvb
         SFlSdIkG4HE6wW5ffu65e/MbCDbgAoXOfggx7JGWVHWVSYLQCGpa7JDXLXmN7Bec9vGx
         knr1bjkhHpZNjma1PPrUIN6877XNZzHMcRvfdlhUtk1bQn51ziDaTSEJoMoKug4QyjFZ
         wmSMJFcVKw/yTe8zqSkf9skekBgshT0jkv/tw1FQ8b/yqWhp5evmxNFUa4jfSY4OuW0k
         vWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739849935; x=1740454735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpIhM0zsF5MRaXYqddzsaHiNvWZ/pZsLy5qS/qUhHO0=;
        b=EQdjrcyaGLAniG3F2F+dzCZgv1dpclE3786FZdqNHQIAUFP4t/tgmzwL9cFIlH16mA
         N9O3LH+hnUAIgtuEB7tX8QwMB1oCVBwbKhICVZgwTR+QHuVwhaAU7mh2ULYFp8w2rzWz
         yPMkxSNnBfDBrEcLN0j8Ya7k2lID+BJo5o5CMKJ8WA3eP4Pkvd/003DNvlZWvjmiMYx6
         fJe5Cw7A8Zue0zmANVPrjLjXYsn9xiUyf1xDvYaIPWUL3K+22TZoQeCwq1jNu5mY5Eul
         4ct7Z9JnlGWUbb747wE8BC2y/TKOUzb2Si3AedZh/2skcWHkbCeo1i62DupyUc7LzOAr
         u+8g==
X-Forwarded-Encrypted: i=1; AJvYcCWiJXvKeA3maTk5oBlFX278YGLVQInB3OPpVjUzdmqsayj2Le3s3j0HxFnbHGxBGK5IvLZPLMAvsf9gFWgn+LgJ@lists.infradead.org, AJvYcCWuGmd2Q0ZtIcd1nuHW4+9JkXs5aQPXvbCqaNQ4C3V8fiyoThWHzKa26oaYBMTlQnx2moheFutboJbqg8KMFY8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLlyEgnMi6RgdXmF9kBQhT+sjkArkwJAZzracsAqcamfYsmMlp
	JajgHjrVNxruwmM+IuYLOzb/Uh2NjXVem/IxhsLwCIhSF/h/izAt
X-Gm-Gg: ASbGncv0UZPQwKcR+jL/LoL3brsINKfKK8h/ljFkBV1zpNGJyD1d1PQk5gwJJYdLLhO
	lkKwihJf0lNXy5+1GKtOnyuD72MZ1MuF2xZg0iKZiP2DJbV0CQjPHYwHeqZe43Dj4Zvt0X9g0IM
	zWaiDc4kVWsUv98mPPWHHmjwWzKiI6D/zgQmeWjWWIFDsXT8ynUTrcUZrE/j0HF9DDPBiYNCiOJ
	nkkjUr6SZyJM4nOwICvENAmT+bSxJKnoHH/vsKuHvf8v+2eB5iy+ZF+x7iljZKkDFA4/aixLcO6
	0In2RqtQZlzgXYXzhhNy
X-Google-Smtp-Source: AGHT+IHp51ZpR11Xenf1xc5xrATpU2b9pYP8ziEHbXQ3EXKCqj44fPEbRUBGOVevxEXu+GXioUS4wg==
X-Received: by 2002:a05:6a00:198c:b0:732:2923:b70e with SMTP id d2e1a72fcca58-73261446955mr7067310b3a.0.1739849935459;
        Mon, 17 Feb 2025 19:38:55 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73271b4a8b6sm3947699b3a.2.2025.02.17.19.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 19:38:54 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: cristian.ciocaltea@collabora.com
Cc: airlied@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	hjc@rock-chips.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3588
Date: Tue, 18 Feb 2025 11:38:46 +0800
Message-ID: <20250218033846.1251897-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
References: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_193857_005561_7B781A07 
X-CRM114-Status: UNSURE (   7.99  )
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

On Tue, 18 Feb 2025 01:33:34 +0200, Cristian Ciocaltea wrote:
>@Jianfeng: Did you encounter any particular issue with the current approach?

This patch is adding a dependency of hdptxphy1 to vop for all rk3588
boards, but not all rk3588 boards have dual hdmi, armsom sige7 is an
example. At runtime I will get errors because there is no hdptxphy1
enabled in devicetree:

[    2.945675] rockchip-drm display-subsystem: [drm] *ERROR* failed to get pll_hdmiphy1

Overwrting vop node at board level to remove the dependency of hdptxphy1
can fix the issue.

Best regards,
Jianfeng

