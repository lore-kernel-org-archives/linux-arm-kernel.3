Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921DCC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3hYwC+8YXd3ZBbv37u4GOv6TST5pjo7r9wcpsmJejTU=; b=iDbde6gtRtt8unzPO9XMJmKo1U
	Vkgiy2fauWoBgxAk3aTMFbD4puNdnYEepNszuff1Qp8Nna3xaqE63J65rZMhnEyQTrW5R5mlo3WnH
	IwSc1BVPp5sbSWRNZxwz+RucePMalh4OOfKPRzKTbNc3CsAMObMboUAnii4gzOQ+SnGMMmsu8xL0X
	RiWwe2jNI2y5E3Ue8bIyAyrvUqu8ce80eyaznw2wiioqkYVwxGAUFBzzQQAhwS9B9fI39dZTJM3P/
	65ZCsF68hv7JUe9mFHlafKUP4eUu/WRsrNkzzP1Dkk/3THWjoV6vd3VQ/dH9BPlSOO7pdTEY11xrE
	Gg/KgctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EF6-0000000Bj8j-1zem;
	Thu, 17 Sep 2026 15:41:44 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EF4-0000000Bj7m-2ANf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:41:43 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so7242845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659700; x=1790264500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3hYwC+8YXd3ZBbv37u4GOv6TST5pjo7r9wcpsmJejTU=;
        b=Ah8mDkqA2XXHOyTeRr9FZXQJ4OGjyqNWo1F/WRvrBUMkpolB5x4f5Y0I45q17W0H/q
         p297cGt2KhE4NCYW1oOQf4Z5HQl03Hm0zAKzJDRgkyIwoTeJ0xvXONcuPW5/XYI293dv
         W8q8f/oHMoiAvUtm1wHPtv7yDBwf4O4+IXsGUt+ZzLb/9xhSSkA/1LAuOwzstH4eRIGE
         HoqD4duVYnwLl9vZqY+Xokr60Xh3WDPHjDxg7juBOFe/3HXnnhQn2TketudUNigv5A5T
         d0sqZNns2zdXtCHNyQLJtDeqSnQC9wbTV2JgC4zGNuACLv33ZPe+a1rDboXR/4ghHBla
         xtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659700; x=1790264500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hYwC+8YXd3ZBbv37u4GOv6TST5pjo7r9wcpsmJejTU=;
        b=sceCIQ7dJ8WrRXmWvis8jyBcHm3eNuIeKCWOBL+GOhTMOtQsD4VGZ3EOp2lqxqulz3
         EHIatTaCWLn66T7eAghPF2P1V7sz/AyKFBOy5o0bZvGK2NhaIln4KoeQg6aG8NoSOlOP
         6Q6/bxEdFFj8Dm75MMo1bVr4y2jmihTVg4zOq6lk3nL2UGRMFssi+7z2n+ovrkh+Qu0L
         RPYeQJm9Ucp8iCkHNI+QiI/sCWZmfyPPvVrrymR5vU5lfEmtWHvYaZ+6vtwjV6eTOyaH
         pkE+SvHtfwlXr1OVHEP+Y/xEQAQIVz5xab22OCg3aiLltkbMNW9Ik4VFKNMHRmabfVcF
         OpXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZzl3Y+zhDzYVadTHb5cKuANcoxWhzjI42t+sJ6tFhOmH4x9AvMrDgucHyY1IPub7q4kuFMxl51KASvzlLdCQw@lists.infradead.org
X-Gm-Message-State: AFuF++mPUDBbbC4OYPUQs5vh99LPYyH/oKr8vMSNnDuzG0m+qtzrh8yw
	3VDyxP6GxEJ+fV1Begooh7igYFPAziayZvQJYU0vBRT+VRawDhD9lg6epI07m6FU
X-Gm-Gg: AYBFou3NdgT1RrgFMYYnyJW1dSXkRr+jIWUCYYZODpt9JnHmY3xVoL9uUCbVqbfRsvg
	zflrqRpEBSGyVIPsiar3dGz/LRv6uyUeKTu36seArartv4U7HNQZx83s5QnA/7UmIk+x8mzIj/6
	5hscHhKmdi1fWTfO4GDEY3TFlS94xiWMxcg4ZeLWHwYaexXVSd1x0CEK5rjOstIqQbJ5siB7lms
	VwBAfE89DcS8WUQJsLivJZa2NjEGAolmew8v7r9Am0nJteEvoF/cdw7y/U1w8v6qYWh7tYL81zt
	hu/hrTF6QWxFa7ZvSU3dbRRfOnjhL8xe6ZsAq5SlcS0vu1+umX8VXAMGbk9Sj3RAl92g5YGgmK7
	lj9cTAfXMi3SflHc/F7EZVwZ5I80CiyVY1RL5PsHPYEGh6zDnZZcw26rQMNdJrx8/UO4siHf08n
	EYIJikHy0c6UcksEX7D2mDV9pv8XZAWLzcBVu5zj/SGW51+LexqKtdnteFx0708fLO7I2xcuwIh
	SY8+2kWr875+sVSOlTdq9ymKPbWrKr+L6zYKjZCFQbFQt098F6DFEc861m04QIeb+AaL7q7ANPf
	ExTGtIno1kEwfMNqIsToIg==
X-Received: by 2002:a05:600c:6298:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49eb73143bcmr86991055e9.4.1789659700261;
        Thu, 17 Sep 2026 08:41:40 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:39 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Thu, 17 Sep 2026 17:41:27 +0200
Message-ID: <cover.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084142_558907_66BC3AA8 
X-CRM114-Status: UNSURE (   8.86  )
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

This series updates the Variscite DART-MX8M-MINI SoM device tree to
better reflect the currently supported hardware configuration.

The changes configure SAI3 in synchronous RX mode, add TPM support,
and increase the Ethernet PHY reset deassert delay to improve PHY
detection reliability.

v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3


