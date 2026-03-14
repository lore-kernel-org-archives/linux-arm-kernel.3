Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F08107BCFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 08:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3EWWpaovkuLWLz+sEJkJgXI3eScPJ1f3CVwzfTX0zg=; b=tD3o5VSnVPPwoV
	oO/oVaNsGRTTVIP9H+r9vepguHnSMaar4hcMWQEfW4Qy1lL28exv4iWRbQa+LFji2pwLlTBBlVUon
	7ALF1OuWJPKYopTzfJShrSlUi3Dm/pDmAyZPyPnu1aeenxPMqLdE2ajB7doRLVxEG5FKirOgIV5we
	+z0zYPjejM9h2fHv7dzCGaRGhVS4oTwqdMjPj+jAx89ZfhOPuor9LrS4TB9u2ijyEABS7TMNepPl/
	vPJteoSMm0ZlnSPKtWHUE/XuJBP09KeetrYVpbmybbzLBCyhGkS4bod06bOu9HduGDAOWf7fKc3BY
	uNabY2Lrp3oneN31EZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1K0d-00000001bw2-0Bmq;
	Sat, 14 Mar 2026 08:06:07 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1K0a-00000001bvE-0O5z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 08:06:05 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a1687f112bso586494e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 01:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773475558; x=1774080358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3EWWpaovkuLWLz+sEJkJgXI3eScPJ1f3CVwzfTX0zg=;
        b=VTioMEg0lRQGOrx0x/5XN/hka7Qx8GjhPcM1U6erGfJrxmIJuOrf5zE9iG4/MBFKhM
         06//yyKvm0F0LmJGd48+o9+BiYzSRmz7oCQmikoPyE5AjGunTrVS7tZ5D6StOfnR/vZg
         VA5/lj+Rh+lN685okD6Oc0JPEZcaT2L86bRYvAAzx+CyB4uVkCqTpc586fBqhS9D142w
         8JIxaA1hrT3S611uR8FCUpS8KwoTWo7gV9CcUewBhJrRJRLXXxlbx3Nqb1/vgjCOxpuw
         tkDffJHTtpCrS1dJm6FlV4gNwRSnL742xXwYwA4xSZ4Ns/46CZe56t0Kflq/dLUNiYSX
         a6NA==
X-Forwarded-Encrypted: i=1; AJvYcCWmyHtdeEuYsx5BI4y5VCI+HKTBgwfFAtXb8v+x7wbUgxES5RkwinHL143SBHwcxLlcsQQxQn7imP3nHvS0uZg5@lists.infradead.org
X-Gm-Message-State: AOJu0YwKeG4IraJZVOu4XEJlXyDHFoUcUDJ5YHFFMSdatfzmRSodBq96
	ZgCzWdi5lTWlVOV2dwDqCNsGXUoDWmYFIPvi7FMiSzoIFl7bF/fKge+rl1H0momH
X-Gm-Gg: ATEYQzzQNOW3BSPCpuzAS4xR+XjUruXC0IvvYL5ILrWy5vGA/Ka3dTwHQ/iMGd8T9aO
	mY5IJPHJ0wrT+d9tK2TWKZXSLIDlolBwKfYg+8sJiptNhkuVQQF+vKt4Muxd+TcdSrdfp3sucQR
	osCmlSbe6zkVPDQNp52bjWYDunjJtZJ6/Pynmls5c+2/qhUYmXy0molRBeXIOVH79E6JeklUa8C
	EpAKdd3SAdSLPDxbK3xuZHep8mwuu++4Tm5gBL3TAIP3DPyOGQIGf75GmksWAnXbzbApMXLVMq9
	AqO70pt26d0I4egqcaVEq5J5t9hEFnwpb6V0fddULyLfP+f758ma4E/3okPV5a2BbTn2qXxBviz
	vVBgLtHkgSvfX0OawK6a6XCdRp4lSLiv0rkiGuAxTQkXg2exnBd9C92i8BZQmSdNsM6ElIJ/8tx
	ZYchTHQNpeycMOmq2YB10/IZzLtjN6nptq+mCbprOdRsdNfWKh4R+0kwY=
X-Received: by 2002:a05:6512:145a:20b0:5a1:3d07:a057 with SMTP id 2adb3069b0e04-5a162af9ea0mr1598772e87.19.1773475558397;
        Sat, 14 Mar 2026 01:05:58 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162aadsm2071781e87.43.2026.03.14.01.05.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 01:05:53 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a49fc06b4so23074151fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 01:05:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMrH89Ypg9kUtw5Pt7yhqjo6Id8UgjcmyHC05rrMcnMDVv+n63gdwf7KhNyvfgMNtsJxQiToz4ijrrOrwF19NV@lists.infradead.org
X-Received: by 2002:a2e:be87:0:b0:38a:6acb:eb13 with SMTP id
 38308e7fff4ca-38a8969872fmr19535261fa.11.1773475550494; Sat, 14 Mar 2026
 01:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260305100137.2558423-1-richard.genoud@bootlin.com> <20260305100137.2558423-2-richard.genoud@bootlin.com>
In-Reply-To: <20260305100137.2558423-2-richard.genoud@bootlin.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 14 Mar 2026 16:05:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v64DAuSEoFKTcdUeBjj7D8b5BiMbzo+M1xnx_A7fia5rgA@mail.gmail.com>
X-Gm-Features: AaiRm50SXV4USJv7ufJ5S1CHMI-l-YGJ1ASLNXxXfC-UNKPRkpq29G52tlurn4k
Message-ID: <CAGb2v64DAuSEoFKTcdUeBjj7D8b5BiMbzo+M1xnx_A7fia5rgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free
 code clarification
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>, 
	Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_010604_131422_FB909479 
X-CRM114-Status: UNSURE (   9.02  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Mar 5, 2026 at 6:02=E2=80=AFPM Richard Genoud
<richard.genoud@bootlin.com> wrote:
>
> The available length is really USER_DATA_LEN - 2 instead of just 2 (the
> user data length minus the BBM length)
> USER_DATA_LEN being 4, that doesn't change anything now, but if
> USER_DATA_LEN changes, it will.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

