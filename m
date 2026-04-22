Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0145DFA1FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSFlJjwss7taNy6z+vQcHuBtEn5xpw5EWTakbtj//YQ=; b=ODtsBVwU6V+B9Hgt5vQnURWl1H
	ndWI0MxYXeTP5XEXyBOHTBh8FqrrTBc3C0YH28DyKDllFo6UiMscUHjUZwNI2r3vlzFxOIeD1cGUp
	l6iJy/v9sORV8lJqUuypV98Lev63vFnXfXOdK2+tlz02gi7/6+SLRkcZZIsyxtwiUaC+QEqfP+gIG
	mscK1XSzGu6FrtzJXnp0EjikdnjjNWhoH8HYaNXqye6YSqcezbnzuGecSoBd31wHnBRqwQz44nF/u
	KnYvxoAiuIH5bcjPHjL6ujf0PFEAQmPiGBTBBpbiOvPudjHvJlvdgavQZ33SMThygwL8o4vJdSWDY
	OdXcvHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaO9-0000000AVcQ-3H1C;
	Wed, 22 Apr 2026 16:25:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaO5-0000000AVYU-0qOZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776875116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSFlJjwss7taNy6z+vQcHuBtEn5xpw5EWTakbtj//YQ=;
	b=aMdzVyPBEDIHNWttBMsHz2LxaKBJArAh6X+KyAJ90pU3fJmQ4TRhq8qXpmeZH6Iv3CQg21
	QBYS69ID6yO+eIqJkAWuf5ruuGHHp/pg030ZPvMiDMsDTxhm0PRZQY0a9CEDeOjSq0Y38r
	njr1MX2j4Glxr5qBUeBx0BaziiKaxOs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-tJBMeErcPL-qL_30IQoVQg-1; Wed, 22 Apr 2026 12:25:10 -0400
X-MC-Unique: tJBMeErcPL-qL_30IQoVQg-1
X-Mimecast-MFC-AGG-ID: tJBMeErcPL-qL_30IQoVQg_1776875108
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acdd800537so112774836d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 09:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776875108; x=1777479908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSFlJjwss7taNy6z+vQcHuBtEn5xpw5EWTakbtj//YQ=;
        b=E3bFvHtS6ZeSbSYWBKUVsmtvKkWKX9B+qJMkYlQmqofRAtiUHCpVWBWzOmjS8veJZI
         Tsi8zZBG92o4o+BvDOpBiEoAXON0/DrnQopv5uuZmzHLfJZ68X6zsmBrBq1633cFJ8Bx
         0ozin6sshAswnTsO6NNIUSashL8BGdhJbnVvl5EyInF7zqzNbGjGk1xlY8vL2eN92/qx
         TDam21GX5glrftXdC6srEkFYWN27I9lOUTJuBOTFsSz0XgCZlvvP+PoRtY4012xVxcye
         +GCt94YtXGEELwY9+7DlZc/H4BLvIvAteZOqOM95IQ1nENX7mnLoGKaqhT3ljPtjAKYS
         a/1g==
X-Forwarded-Encrypted: i=1; AFNElJ+X53SYvp4Etu2iIY1ddwXuDbgI+VjufWWI719DKlHtgW+JRuPRwD8YP3ULKAnc7Q5YtsiBncY1ZruRinoDT/Ds@lists.infradead.org
X-Gm-Message-State: AOJu0YzFXXfX6ncKkSZ5N9wD4DKC1Jt1QX9cuGba6euTXYCYEo+rT2SR
	ibdTvptMx+R5glZHJ1Dgo/wiyIjPl7qDI2nlRsc2RfzqxiB92wy1FukAVbsDWLFHPGCQ3Gt6pxe
	RMTKgLL5X74h8v8vAoRUTyYvCTzm9leU2P2A7iIb7j8qIWm5r971em2xX8z0zdVBak1RPAw1ERa
	D2
X-Gm-Gg: AeBDieuiJYe1DDaf/83F8iSlPevkRmOUSk4WsEIebiXwrPMV6UsNFWPshJY9ENsRuV/
	B3XhWdX/JbMKtY4ET38y82ELjkvwUMXXn0mlhStSED5oIdWS6vo7W0t2bpPhwgiqL5b3jsS3v+u
	uO8nPqNxaijjb/5afYYPV1Br0+cewhwUh80hAeq8At4H0PHshc2W8lwy7G9pDhfBFCh2NAVtCmA
	CaYYSnKdpqznSwbiA24Lwd3B+Nt5MkvM2v1PmK+1TFdR31OxqP6QZm8tjn3lM564UVbfj5vC29z
	yQQpPPDaIXvfZ19rZol7Zxiqv/SG4AwO1iqCrZ+tmUfdJ+Dt35iHM6riLSapGXH8d/fq1g/6PSG
	4dxyJmcOLxE6DuQW5uCw37M4yJazAtBoz2OWfKZzEQA==
X-Received: by 2002:a0c:e007:0:b0:8ac:a893:8b5d with SMTP id 6a1803df08f44-8b027fd1849mr309816036d6.7.1776875108440;
        Wed, 22 Apr 2026 09:25:08 -0700 (PDT)
X-Received: by 2002:a0c:e007:0:b0:8ac:a893:8b5d with SMTP id 6a1803df08f44-8b027fd1849mr309815476d6.7.1776875107978;
        Wed, 22 Apr 2026 09:25:07 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae7d79esm130910876d6.36.2026.04.22.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:25:07 -0700 (PDT)
Date: Wed, 22 Apr 2026 09:25:03 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 3/3] dts: s32g: Add GPR syscon region
Message-ID: <aej2X2Gp-UI3Vmvo@rh-jkangas-kernel>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
 <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
 <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>
 <aeZYQp9b5aoV7Ihv@stanley.mountain>
MIME-Version: 1.0
In-Reply-To: <aeZYQp9b5aoV7Ihv@stanley.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 03i3FjDoLH4BbARYP0L-0eKP_JNbCyM-t-v8gebfqCc_1776875108
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_092517_310035_27BF08CA 
X-CRM114-Status: GOOD (  21.31  )
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

On Mon, Apr 20, 2026 at 07:45:54PM +0300, Dan Carpenter wrote:
> On Mon, Apr 20, 2026 at 09:04:00AM -0700, Jared Kangas wrote:
> > Fixing Dan's address based on mailmap update, sorry for the noise.
> > 
> > On Fri, Apr 17, 2026 at 02:36:25PM -0700, Jared Kangas wrote:
> > > Hi Dan,
> > > 
> > > [snip]
> > > 
> > > I gave this a test on an S32G-VNP-RDB3 and didn't see any issues on the
> > > dwmac-s32 side, but this appears to trigger a panic when reading the new
> > > debugfs regmap/*/registers file for the syscon node:
> > > 
> > > [snip]
> 
> Oh, ugh...  I didn't realize that this wasn't merged.  I don't have a
> way to test this any more.  The simplest fix would be to do change the
> 0x3000 to 0x100.  The GPR63 register is at 0xFC.
> 
> 		reg = <0x4007c000 0x100>;
> 
> That's probably the best fix as well.  The later register areas would
> be their own syscons.

Tried that out and it looks good to me. With the write routed through
syscon:

    # xxd -g4 /proc/device-tree/soc@0/syscon@4007c000/reg
    00000000: 4007c000 00000100                    @.......
    # cat /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers
    00: 00000000
    04: 00000002
    08: 000000e7
    0c: 00000001
    10: ffffffff
    14: 1fffffff
    18: 00007fff
    1c: 00000000
    20: 00000000
    ...
    f4: 00000000
    f8: 00000000
    fc: 00000000

No more crashes and 04's value lines up with the S32_PHY_INTF_SEL_RGMII
(0x2) write, so if you're able to post a revision, feel free to add my
T-b:

Tested-by: Jared Kangas <jkangas@redhat.com>


