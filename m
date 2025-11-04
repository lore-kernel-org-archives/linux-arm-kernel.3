Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FD3CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZzjlCCT3j9j2Nd7pQrTgnxvKhulGcz35Gruny6M5Bw=; b=0fQtNM20u3zQ1PGEuQq5CpBLy3
	MzH+9gOLsdZWMTbhsK5MYWn9cMGyZt15Xdl0PLpYXdjMOfrnome/aibqp4l9cwS3LPNsrxvzndZHx
	g8Ux4SM08slKRmiCUTXCLWWf1A8FCcnXb5H8T/1/PkNMvW+k/Vqy1YVUl0U0ZYCIAPdz04aJRYeVd
	4siPq11nU1meHM6q4XQCteMgjqwSVNdv0lXJSq08mNM/NyWrEkeSZidi4sTD3shuncGFb/oiOdMeQ
	nH5ZVzVPto8QSX14fnXRop7/5Qf8143Y0bGTZtJiuCUnQ7oWQjBHNetoRK8C5PYYPCn4SCpKrPhDW
	3mURUIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCjL-0000000BSfN-0j0p;
	Tue, 04 Nov 2025 08:49:31 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCjJ-0000000BSeo-0w1a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:49:30 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b99bfb451e5so1509144a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 00:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762246168; x=1762850968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZzjlCCT3j9j2Nd7pQrTgnxvKhulGcz35Gruny6M5Bw=;
        b=QsrwvUpYoAQ4ZY3w/GPw8HmX7w97HfqIqH+3zk8gAF4m5yijyFQrvvFrALHVL5g2QI
         dJOndCEDgoj7/UP2K8rKZUaO3oJYLGbT35b5lbsNAA7/ItOxIeDHIE5eFgK41MkA9vM6
         I2sKQlZn4Bxvvw7x8JAf9PnN8MvVmpiyI0JkabhyEGKLHGq4Y0QNKCcmVUnWsDLCUK+L
         45T5W8sOjbKOPrNksbXZNpJyLptoQSMY7xCZu2d/vkf6dqOLZBRKPniyNgux5jV3KkIE
         ApyV1C0SWGeP+QtfiAGGZZU6DbgTahzpGF+GwganfaSwXO2PNdsCUYCDAtpmFm3gSxrY
         5AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762246168; x=1762850968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZzjlCCT3j9j2Nd7pQrTgnxvKhulGcz35Gruny6M5Bw=;
        b=NRs1j0fpdf0c3DnASIP95QVBsIzT3NRkCyl840gLkzOvlAGBXVK4WJsGOymo2qCuWy
         C1pmbgSBYY7ysB0TLQKxegfBMYhaJPa1mmfNhSqS0md9BIicOHRDgs8uphczvoG0iNb5
         ZhtoNjyaly9XEj89zUt1DYJonvrJxwHc36NYU82aM3nUU1rTXZ8mQHA/CfigngysMSZz
         e/wD7rdbIK/mmjuDlWFnn/fhcR8Ic/Xp9XGNxuHU6x6ZTOW3E9nLjTecU+xxUKKVP5n+
         NihiFySqPH1j1Jm/soCh/qpM5Ci7s9LXa7z2ZoO12AHd/KiwsR+WPRwiO+pjO5A8dLX/
         uorQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA7wCczUE5Lwo/C+6PPjGAvbdCLU2LVRueXB1OzgHlK8PobqUXXD6Aeq2jLMJ3tmCG2i8t84e4HCa1ZeT6UIhy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6Dw+bLe5OtL+k4/E6sismDeSrypgGPWxC7er8bxvlghrtCDJm
	cT4ewSQs9pKLejnMjsth80k5w77UdG3gpV5M15RBvsj9hvCHgDbuzzvG
X-Gm-Gg: ASbGncuw0uDHbDKGrV9DSabNf++vhn5nnM85/P3FkAGjuiUt0RhtLgPoPn9ZucGGxkj
	AWNOEXDImDJP91CPt78JXi01CKhxT25kSlXj1wl4igZ/hLv8eWFfTgfwQGC/vuZngnYX3fHd0nz
	pU4A2wYzojYFasEFnqMCGRyfdeVTk2NSsrvUlSnm6GJH3v5LyobwK5fvthMAA+kSDp3cr7vfLsy
	R+hwM7u/NgEaadxGaOciMOylGaoOeIByYjGCeyBSg42cR2NFrcyPwjc8WhViW8muBf38Q2x0NW8
	6JK9/Z1VgbGoWWroAQmo7fwYnAgkcfLnlxJNUEQLL0ayHwUDgPHObbBuleyeXvyZ2BVPZplSChQ
	OBBnbRe+fhl++NfKSpuQy0ZufL0XMOlvbhzuUradoiOV4xpuQdMCf0oVMgxbdQAd/pmNz/GSBaJ
	4mD0RB7bwxfI9aDVDEi37G2g==
X-Google-Smtp-Source: AGHT+IEjMIiSe0x3JjyWJftYAjRTnLk4yj1+5guJH64mFdGd5LprT3gQcg1E9FYpKQf1UnNjUVPGcA==
X-Received: by 2002:a17:902:e801:b0:295:7f3f:b943 with SMTP id d9443c01a7336-2957f3fd4d1mr114855785ad.28.1762246167913;
        Tue, 04 Nov 2025 00:49:27 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:600d:d663:3d9f:b9aa:53e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cc1sm3692393a91.18.2025.11.04.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:49:27 -0800 (PST)
From: Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: thomas.weissschuh@linutronix.de
Cc: Jason@zx2c4.com,
	agordeev@linux.ibm.com,
	andreas@gaisler.com,
	arnd@arndb.de,
	borntraeger@linux.ibm.com,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	christophe.leroy@csgroup.eu,
	davem@davemloft.net,
	glaubitz@physik.fu-berlin.de,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	jstultz@google.com,
	kernel@xen0n.name,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	luto@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	nagarathnam.muthusamy@oracle.com,
	nick.alcock@oracle.com,
	npiggin@gmail.com,
	sboyd@kernel.org,
	shuah@kernel.org,
	sln@onemain.com,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de,
	tytso@mit.edu,
	vincenzo.frascino@arm.com,
	will@kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [tip: timers/vdso] vdso/datastore: Allocate data pages dynamically
Date: Tue,  4 Nov 2025 08:49:11 +0000
Message-ID: <20251104084911.6961-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_004929_262974_F98DC026 
X-CRM114-Status: UNSURE (   6.57  )
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

This commit breaks boot on Renesas arm64 RZ/V2H and RZ/V2N platforms.

The boot process doesn't complete anymore with no obvious error logs to
indicate the cause of the failure.

Reverting the following two commits fixes the boot issue:
  10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically")
  6a011a228293 ("vdso/datastore: Map pages through struct page")

Cheers,
Prabhakar

