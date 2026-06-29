Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571CFC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv3/bI7mQQBzw4o7vxFb5GrHgzhC/QfD51paBaJ+fHA=; b=DAzaseZ9c1AN+Hf8R8Ob2grYtl
	NwhJDkw4usTXEflRFNLPxBVl5+Gta1MJGwGESbCDA6kFjpNhfT76bI8THOeagEz8aBVJxcsc/no/n
	WcoH7fK8OE/oJbQPDrJR2vuvYQQkIBE8eVx6HiwLKgpX0NxwMsnleJjYFSspvpHyZWNfSkG4epHnH
	i91DkrdVaK8oxSidz2BqRmGnlsR9b0mvZULof7XW2d5qPGtJiQ6Cl04hxO4ERGZ+ck5RkqzKkfa8C
	rOWX/jFKOI9CQ4nIwqDAtgJ/PuLwciOQWzvI0wpzJNYHnNuUJYUTOv8rdmJFSm6wcS9Ul/pb/bgK7
	MYlkXP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Mw-0000000EAo2-3ois;
	Mon, 29 Jun 2026 09:33:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Mu-0000000EAmh-0wvG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:33:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1750823f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782725610; x=1783330410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv3/bI7mQQBzw4o7vxFb5GrHgzhC/QfD51paBaJ+fHA=;
        b=KwXOfCYok09vFtrYtXkqWuBqtpcQJ+Eqji6f0tyfPRCcNBYiyoqzJT8INIJijNyYma
         8BJW7fcefSRuLxVMTKjDti6dLg3DFV78Cqz1660XWREV/e4bWB8sc3632BcVJeZu5077
         WnLc0OkvbPBrX495pLD6mS11rBFCsu80nKanHy2409La5YXwHAt2kiFTo4s2zpIH3ZQ/
         P3tG5TPqvNLlRkidNdkoJL8dT/hORwPePW124pJSZfC2PXrmb8NxaPQq2bDrPsNHvAYM
         /Ic5DYBigjwbu4UbIDszZU5s4wU+5F/VhrCClztxCu2czcry/YuK8pirRrJeOj5QI9WY
         LrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725610; x=1783330410;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vv3/bI7mQQBzw4o7vxFb5GrHgzhC/QfD51paBaJ+fHA=;
        b=KhMBK88GUIJrECgD6MLtQOz2fndm2pqSp1sEU76mJ78xGShaRV9I4Ye6UqtCNA+mzj
         b2dKvuUqSM3la1Sbho1K4E3PIYaU++yceqicWOeAx8bUGkDd5H5rjI/YpWd9GvmVabFp
         8HLEIn8bbX2OPQRLUdq7PUM4hY6M00UpcycnLtG4MEgdvCiJpyPmlBSt0D4zQxOAR1bQ
         c8MrcY//ecbSukH7/YOf9SChTSXwk3PdGL/9ZuwQEeTlaz+KEv26KS95G6KUukCJ60kQ
         etKzb5ARLx/M8LWpkBaPc/IdI9P7I/CBai+jiAC1DeDjx5SqB9w9hdinGye1lnp5DTiQ
         wD9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrIHLZXg5ErgARum0iF7bSbr9dNJAJjlpMn3/+GqOlwEWrUCdhviwMAWO26sgjWFGNWpzgv57KXT7ZFI+0ucux9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6AMFyiZQhbOSqe6NFX04NW9yuIfNImzLr059eln1WsIsbCkcl
	iaEatdIIqUOX/DsqUX5Ny+9vRQeAaP7hl9kyZRTYUh8ZhzQFognO/bNu6BB29Ac7058=
X-Gm-Gg: AfdE7ckZmGg2spZ4F8qLiKyio2Z4i/mRQi76N2xlSvcSHc+e3XYFMokJJQftucBGA49
	UT8fB2YYmDTj3r9AIzDvwYXqKFHzMIRPM1xXmGBa0jW34lkQWuQCy78bdlGrsTT1yUEm05rVd+3
	aB9gK81bCA5UAmBQhv1wqegJciJ6wnFVFc7Ve6vgLqjJ/qBSVZc92KKDam6aLTWqAAXILRuahkJ
	t9P22oIrr61K4iD8T0Sx6WaLvCXd2TBzYk97iTpZMVYL7KaPioQ/TRPq6ihtXZP+vALGOeJ/U5C
	HxZxOveofiVn9aDcLpabdTxNvN3m6VbHVy0g7XGy71SQRTaIRmBVwCbac549JkXOc0XCzrc3pmI
	odWhDi7pOr1aP+W4BiiiXdEBugA4nYepmOI8o1d8c0NobD2/11TKcOsaAW8cysNKfc1V7FeEvAR
	rusTkqGhXQzWo=
X-Received: by 2002:a05:6000:46c7:b0:46e:5c5d:b2cc with SMTP id ffacd0b85a97d-46e5c5db779mr19780582f8f.23.1782725609875;
        Mon, 29 Jun 2026 02:33:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46cf775a4f0sm39251229f8f.17.2026.06.29.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:33:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>, 
 stable@vger.kernel.org
In-Reply-To: <20260623201956.1324992-1-martin.blumenstingl@googlemail.com>
References: <20260623201956.1324992-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] clk: meson: align gxbb_32k_clk_sel number of
 parents with actual count
Message-Id: <178272560746.2490611.124390800107278004.b4-ty@b4>
Date: Mon, 29 Jun 2026 11:33:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_023332_275027_174E39A9 
X-CRM114-Status: UNSURE (   4.80  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
      https://github.com/BayLibre/clk-meson/commit/628b6fee9fca

Best regards,
--
Jerome


