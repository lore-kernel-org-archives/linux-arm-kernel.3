Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743CBC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=; b=PuOMzPNLvEf8Wh5a7iagUUl8wN
	3vvzPLvMcL7SpVUKDynt3rUUQGxUxvHFzeklzHYPZD5MNSu1sW7ASAb8B2ytVZGIcYip+XVVNdyVI
	RRtPtv35PwHpfuRsjPqIeZLnti1szR0+n8hxL0JXbe+g8qB4eLqyR4s8wsEC5QguYJE9BGiSoNpBV
	bQebwVKRh+MDZCfs8WJvbptX3XupI+FdWuGnNIgJIvVhGaEkZflDbnpwmanMq5rx55LSkYP2tShRg
	Vy0PyAy/NOryMOJXo8KSXrx6Phi+GOAvpTEj1iJPbyv5DOcYicT7IN0c7tNn51vErX9ieTUcQTJ1+
	wO2J9aiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22ML-0000000GiX4-0U7N;
	Thu, 03 Sep 2026 07:59:45 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MI-0000000GiW6-3sX6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:59:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1945083f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422381; x=1789027181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
        b=ag1s9EiQNcRGruCpkg/udnFQz32lcCZRplp49O88pXRbHBjdnPu7qiB5wDd3QbEcZQ
         y4nWt8Y+o7NKh+o23XlzuIXAfaCZzre+1mUd/qhy9Sk/o3CssPmwFo6y6jAYEN9gtFGZ
         HYFsgRrVTsreFF0G87eeuPzf7BTx6KYbw7/kre7iBPc4cLuyVMJS30aq+M2x13D86hkd
         ZROv18Cs68RTW/jjF8Eo+MIASihlYyWL7T5dkxQxW3AfXWqDGdT56mxkkrTGinVo5ksd
         dHY6UrbaZSnJ1AF0oNT1fyXyGhOXQ4sEXDtZqmucpqwh0m4NxEcDK8lvNBTNCrT6j/gq
         brYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422381; x=1789027181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
        b=VFvYrweDulnTapZdodMP17KNVNuITbbgNRUqzdeAxlhKVjV3i1AUt5ayAoHM9USc3R
         TnPBJgybcXgiB6x4L49mZFrmxnzjwjfB/hPHvbP9DhAjUo7dOrnAmLFIeUpDbdcD/qCH
         NCQYyOdrcGF9l6nt4deNUo7rm8RBd4MupLpO7P/M9tYXV5qT1gfOYvgpr6fGV/ZnbxXn
         1Rz4WRN8lZLYmEQWiEYz135y99Qt+3Ahaa8yfEKFS0Bhiq6s+lDMtcDSL90Sg+56nVcR
         O/ag8xIDyKFojDUppWBVWjqjVJS4EcRNtjxZff0bXMGnJRGDSK05l8M8UHUxz0BCmFQ/
         BCCA==
X-Forwarded-Encrypted: i=1; AKwUvBzGYYZ5JlCFqHG7e+hSYayC8IdTEZ6Nnc9cH7IR7u+7FwuqyiaqU4iWHYl832Pxvb62zt28PCF19rmhAu4wi368@lists.infradead.org
X-Gm-Message-State: AFuF++lIvqKuQ/vNUtD0coPLBUrzYUUm9Pdbn4qosmZtocUe0tHdKG5k
	fWQCmChHdg5GBqaZSJ0Ff34AXK2yUJknaGpjJxJ3VXagmoE1kpZKFYYHykZLN3xM
X-Gm-Gg: AYBFou2eFN8+Rp1F2lqCX++z92ZFEw3BWoMcADj8y7HLZqqCjCH+IP2/9eOsaU0RTAm
	myYe85TdbzpjHzQgy8Ypea+BJnHiPHJvshJPxN60uds/mZRojDhSN+iSmzOQ6WJ+QuUZTmQ+qWh
	HsuBdaQ7XYrqgK4dNgv1Kb0QcLpTiVpIog7N1CDC/aP65hf/dmJyA78vujqtNFlrlJfUoM8hNij
	3d2MpBiAIMkb2LTszjRWeJXuCJjasB1maLHswEo+4bKlH+E477wcmICbXTydj3jtaLvbvae9DB5
	7mTUhTU5wTti7wAdYne5jd20feu/hc7QENMrM7gBMCPNp1i8xOOM7J5poyF6CZ3Dy6cqf9NGmGd
	QY/IDRg9HcPuyiofMJfvC2cn5jBzuNeWR3QWEF5NPA4HQP1JcS8RK2pABuNDYrCInNwa/tbLIdh
	B1fAtncfs8tjDMbIhYUVW5Rd1oXkwchTDacl+dAVXa6/v+ynkhCd5JxHLgtE3eTGjkHQ==
X-Received: by 2002:a5d:5d8a:0:b0:484:41cb:d5f0 with SMTP id ffacd0b85a97d-48488f103d7mr17847999f8f.17.1788422380714;
        Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 09:59:36 +0200
Message-ID: <20260903075936.2089280-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903075021.7AF3F1F000E9@smtp.kernel.org>
References: <20260903073143.2068494-4-mehmet.fide@gmail.com> <20260903075021.7AF3F1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_005942_965674_7BA258A4 
X-CRM114-Status: UNSURE (   8.07  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Are we correctly parsing the packed pin configuration value here?

Yes: gpiochip_generic_get_config() hands back what
pinctrl_gpio_get_config() returns, the bare argument, so config is 0 or
1 here. The problem is the get_config() documentation in patch 2, which
says "packed" where the implementation says "argument"; a driver written
to that text would indeed break this check. Patch 2 gets the wording
fixed in v5, this patch stays as it is.

Mehmet

