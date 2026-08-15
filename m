Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5764C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 12:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=; b=N3zhWai5ijSs5z+6VvcMWYz6Wr
	MdySpsYW18Et8LRz/F7kwuoqpVm984YWb1HmO6+U4f1rOAHjKPGPCDLsQwjJuabv6AHMlTe04FWhU
	CqMJSOepHNT93t5vkeOw4mUkp5gaTeS/Q6mtbOxNpNXvKcAUun/RsrFg7fJf1iWrJQCU+IQ1x9Oq+
	5xWAHAcxnXfM2/BMOqrp4M8D66PLeUBERe7hDf1KuNZZtxMfEijC6FXadUu1iUI6QKmMFww586irN
	3L0hKEWitogvsJykUiTCfqsXmdISqKATKeUTLNZGcyiwX2DDrxG5A96OztqJdvinqjYUzYbWIlenv
	V7DZECJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvDPY-00000003oUB-41qd;
	Sat, 15 Aug 2026 12:22:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvDPW-00000003oS1-0E3Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 12:22:52 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47df6a5655aso201854f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796568; x=1787401368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=I/WlMcSBnSbZ9FCqQHpxeYhwldsweLXA0EE4nCt4++ZEN1AoWT3wlclmR6ogz6H768
         Rx1JkDX2QBC8Exk/LdX6GrhsR8fx0/DmW3TwaUetMYDecR3clyvV9/POJ4IF7O9Z5igR
         gZXWrdoswZCLkryiLbEMANKPMrje5IXkfQDPT3DsDsmCp969P1w/ev1culBjzegYdOp+
         FsRkbVMLZGgdm3eOKSvawApXBwxEBhvzdk0fcr9F6tx58sBCgEX5QwYNC2ShmlLTF6r2
         Bl2b/trKiufhfPNCDuHrSXXwd1nHBXfDrBhvjB7lJYxBJFxSqduK0WkXJfE7fmImnE3Y
         JHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796568; x=1787401368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=OJpzQ9FjMA+YFy1lMsilYkpnNjI99E3z9J0biZBcqHYkFHx7PeqMnt9qlcbNji4wpc
         +9aSAB/EiVFQbCLMgnGlHrz2TjKN+EVbrFomjl7yGJorDkFSWv+EcAttPJ4pAnKkxuoc
         LkghAcge80Bc8JNhO9PIVHZjjrAnbH5Y3cGQDV0FZoWRDFj+NZ5UG+CKSqa2HNInZboL
         Re7A0NwIAY8en2r/Vbd8iA2PxeNLW1MWVMq/L9fQ7gVpUgiRMwes2dOk9tqWrphj6CcS
         RUbp1fKv5ZrOkG+Ms3ihWwue+DpUD4J2ygWm59siIQ7VzFrq8BNm9/tk46Y/JJ8SOY4W
         tuLg==
X-Forwarded-Encrypted: i=1; AHgh+RpAwRPs5jFmgtIdAgd2rTlbVWjOactolMxZDXaQurLNArwg/V0ItxSUlaZ0Fe8dst1/gi+baF/iVBCxHs3fh/L5@lists.infradead.org
X-Gm-Message-State: AOJu0YwdCLr1ycA8ewIdth3fNI9kJV6bJQ2QsMzEt4lwUuZhmxIq+gqw
	911a1x86Qehn/yHi/xivX1FDggvMKZQVLw9zQihg8llW9vAvU3xy4BJH
X-Gm-Gg: AR+sD10s984cfL1monrodsAHvwpbJUbJ3NyiB52H0TMS1dK5CU3nFjFmqp7d2fbTkcR
	5L3omLHepjrUdRXAodiE8FoGbwR6ND6AabH2dzCn9/mBc0GMcSlOkxHpO6r9tIcr5ueuwB66e1K
	wpEINLOu3mnFqWgRhdWCBJSKLHDVPAOvAC2PUcuK4bt+FyzR9JykBnZc8L4R50c67168XsmWGHS
	efXTBeKLy1EaW/qnc++AD4yM1wSsueYCwLWNQFbSCBZbDAroCqNM0bNNL3MXjJQZRv7yUs1mnCe
	f9GEOreb9bkk8ra6oRvljX+s73HZbyzyxrEXVbwvmVB6ZZJL1SoaCXkhwp5N6BGul+1YDWWVMhR
	lAZfGNVrnzDLWDNecgbDgbBREabMPvn4nFL0dgi2D4BxHQNsLVpwNN7rQXzEod51I8vRKyIanba
	EUaycVk8t/mYQzFrmJtGD4ua1vCIUnzx9xt/dcS+so/7xngCIY5m+NPirjcraFb2f1C68eud6KY
	eUEPf3u6ycaI+uX7YMeE5/Wk+uHTRwdDJmt7SbzX/bBPnNku2N9Bq3klSfBoD+7VBa2
X-Received: by 2002:a05:6000:2603:b0:47f:9256:52c0 with SMTP id ffacd0b85a97d-4816075e57emr8437144f8f.3.1786796568008;
        Sat, 15 Aug 2026 05:22:48 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:47 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v14 28/38] phy: core: add notifier infrastructure
Date: Sat, 15 Aug 2026 14:22:31 +0200
Message-ID: <20260815122239.65405-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_052250_093586_86961F34 
X-CRM114-Status: UNSURE (   5.83  )
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

Tested on Orange Pi 5 Plus (RK3588), 7.2.0-rc7 from rockchip-devel at
ea51774c5c42; details in my reply to the cover letter.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus

