Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6ABCD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JizQCa6CKf1Pc60IEt3VBkq3Yghxi9EHYLc82CAFTk=; b=j8tjWXWxbvfuosC88wHGkG5Rqh
	WC37P0yel+5P5OUvwe6JOL6SvJCyOtJdbqAc6MwPPbTy/aZas7MbXZef+u0RUXJLhx5thjcf55OUW
	Ib1aZfQuu+WGeV3QzHoUfAtKB2fZQHc63N7Y4OzV4bMuEjOKLl0EAY056su9zIgOCsc6FxyjcQDK0
	CNOyrf1rH/i8KW53lhjK6Z6OvATdHWXqH2+7A1GgS8G+aaesDu1ClVqBDTlWie3XSGP9HfTZrlYNP
	ERwbLuHfEDsFQUtRoBCpxq03oPWxD7S6w8THBt5fPd6CeqdHrcHGk4fWApJICFtoDImFQR7ZdHp7G
	fRgmv24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4tb-00000006S4j-3Tr2;
	Tue, 09 Jun 2026 22:26:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4tW-00000006S21-0Uce
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:26:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf1cda2b17so45266765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781043961; x=1781648761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JizQCa6CKf1Pc60IEt3VBkq3Yghxi9EHYLc82CAFTk=;
        b=lbFShsN2QsEwoWLzCJaraoA1qfYEeVokRi3d/4PdhhcT25IfQUVHo2voHy0rtBY9bj
         t8Ih/8f31+oD34BPrSOx4WXsyX+3nazcjAYjnGXAX9YMVvqvpR5NcdSgxaVSTjc/Ww1F
         RvFmRZKovhXk4htS7G7OL0YPskwC7GyTCeFkBmg983fiML0oV9HR1b0jUCCGNohMqlue
         u3OYS2dckJC1vabRKzvbRhalE2ZAOgcdTcm8e5mR0Sn0pjuQ6PiyYnIjhyMgA2NMshj+
         WPHMgs8ssjC92xAzeL38COu4izhvo7mH+tcrhe6xd1Pr4PC9joXO+uHuETbmceXM+HrU
         jHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043961; x=1781648761;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7JizQCa6CKf1Pc60IEt3VBkq3Yghxi9EHYLc82CAFTk=;
        b=T1Fi+ToWO1iuJzssfJxHxUQOWQlqNoRXcWzzlTFqXeBkT5FzTGQcwdh8vPEecvLHGx
         vgSGaIBSTeuNi0nSpBUlz94BDcranyrrJQrk6VVGMOmcBoUXcWTGD1uiTf50h1zQZw+m
         a/DSYctAJhCOac1IZz0+mPYp97XmlgEStgbJN+8hCtxv50eprmIMoSq/a0nZ5FgsanMO
         td5GwXUkr9jdrV1X3Q7zhgPm72CkQR4Ulq/kQBzKw3HY7DUMviIwxoogs9wFqUEsJ6zr
         Uhjh6VOrWGC/rRSdGuX/uXRAQpIdLDVkotqMQc96whVluMW/cF6URQm1m/stXMIEPYUi
         Wugw==
X-Gm-Message-State: AOJu0YxMJ6fqvXxrxlvDFK/Q4xM8ThyxSeZVJt5QCRDZ4XH9Mox1ZLzZ
	VjxTYVpYUk2xc7Wmzai/sz2uFqSM0UwLJtvtP57t/wKyZDmykjveWKZ0o1FHdl9aRbs=
X-Gm-Gg: Acq92OFf5COBxNbuPwzzk8AOD49FqjRuTKz9i1e8G2PlESOOtoPia0Afihg8T/5jdaV
	L5yE9+yYLxr5syEkxwg6Wsvd46KOtOinvpXJgeaQH7ZKiL1gPPrVG7SI1PFefhAVYgRaOfyz5Yq
	2svAVzVjKLlffXBr1npQkDp1tf0FPgup9/lS7kdw2Pz2vUg6o4WAUOYEvjBn02bwyDUBqc+w/7R
	c+I4rNYVzrDQbEati+vACo4RxWAct2seC/RqBx7p38cSlaQ1puvEVBNz/ITf7xbTRF/7reN34sx
	kPyDOUEwuJIO+8oK/Bi8q3PtKVixO3cgHAOvQQuaebdbSqWJsYxd+3azUNYUfM9Q6rQ4+rjIOde
	y/v/U8Ao8PVV+s7RgSEVz4L54cpMNcpOjbKyXXbKvpycYHS+iTtRJoAGBMWRlGK/XB7z2STJug9
	OadLLYx1st+sVG74aOa/z2dqeVWtdIj20=
X-Received: by 2002:a17:903:22c6:b0:2bf:2ea3:af30 with SMTP id d9443c01a7336-2c1ec3f5d20mr182091185ad.4.1781043961261;
        Tue, 09 Jun 2026 15:26:01 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2c1664950aesm216500775ad.69.2026.06.09.15.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:26:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: nm@ti.com, vigneshr@ti.com, linux@armlinux.org.uk, ardb@kernel.org, 
 ebiggers@kernel.org, krzysztof.kozlowski@oss.qualcomm.com, arnd@arndb.de, 
 geert+renesas@glider.be, tiwai@suse.de, kory.maincent@bootlin.com, 
 andreas@kemnade.info, dmitry.baryshkov@oss.qualcomm.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, twoerner@gmail.com, 
 Parvathi Pudi <parvathi@couthit.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 pratheesh@ti.com, j-rameshbabu@ti.com, praneeth@ti.com, srk@ti.com, 
 rogerq@ti.com, danishanwar@ti.com, m-malladi@ti.com, krishna@couthit.com, 
 mohan@couthit.com, pmohan@couthit.com, basharath@couthit.com
In-Reply-To: <20260428085003.3023464-1-parvathi@couthit.com>
References: <20260428085003.3023464-1-parvathi@couthit.com>
Subject: Re: [PATCH v4] arm: multi_v7_defconfig: Enable BRIDGE and
 DP83848_PHY for TI AM57xx, AM437x and AM335x
Message-Id: <178104396005.234140.8829386156461640812.b4-ty@b4>
Date: Tue, 09 Jun 2026 15:26:00 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_152602_159852_BFCCD7D6 
X-CRM114-Status: UNSURE (   7.42  )
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


On Tue, 28 Apr 2026 14:17:31 +0530, Parvathi Pudi wrote:
> This patch enables BRIDGE and DP83848_PHY as kernel modules for AM57xx,
> AM437x and AM335x SoCs. BRIDGE is to support STP/RSTP Switch mode using
> PRU-ICSS which got recently merged and DP83848 PHY driver to support
> TI TLK10X PHY.

Applied, thanks!

[1/1] arm: multi_v7_defconfig: Enable BRIDGE and DP83848_PHY for TI AM57xx, AM437x and AM335x
      commit: 7ec7f27d5d078e5786274a669feda967efef674e

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


