Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5CCFD2D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cjMHYImNRSSja4s6HqYCd0m/oShCUOYPaIwWGsmcTM=; b=1WcqlmsGWQSf1FmYVXsUCE7chH
	Y5YEX1dA6mysB8wpsVemR1o/ozAEMRTfVWbf80GCIfj3SG0WhTS/j+ua41fxgps5Roe4gOMjbomog
	RG8LtGD8fHlkYStE/lyhDL8qPSZNN2g2utakDp8zlYewejJ9kVvurW66rMRL1voyduGmlVpE/op5E
	INzuOVf6C8vwgUO4JIQuyivMhIFOlC45FHEWS2QOJeeOUH3epAzRzAkhpD61QC09TpIyeF4q0tEfu
	06ytQ47Ts+XVb+TQ3cUUkB+xinykK6IFvRBPOl/zK6t2gy0d1b9dNCGv9yOf6WX7JdAjxISCLmGvY
	mjuLq8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxfg-00000009eqi-3RdH;
	Tue, 10 Mar 2026 14:02:52 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxfd-00000009emz-27He
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 14:02:51 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a1307438ddso5342116e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 07:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773151367; cv=none;
        d=google.com; s=arc-20240605;
        b=N77mT4T1BGxG/waqo/hHb1EzfvKJrU+hhJKKW8qLgX1drUWvmg0hadjeZLWWA0GBlT
         gUgcU1Rrv7PW8Tn1wZq15GtjJvKojT0N+9tuwPYlwC4R/IGb0GHdKofOUbmA/+TrS2d8
         yX1M0elxAsi4U3DTqX4BATzkGMfZRRKGQPkBJdpFb5CmaqMX7v+j/nMkwpa5OPJ6y2w5
         C2lg5o9fWMlhcp7bAeZTnVHd38dGp0LXqMmrWYUGIfospWJt6HmWI+EseObhjoa3H5s5
         cVeo7uwGe8YeQJxqysc5INI9bV1rHThLz4JM/dMRdenWMXwymg5wxEVXnnsl5hVAQ77X
         fD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cjMHYImNRSSja4s6HqYCd0m/oShCUOYPaIwWGsmcTM=;
        fh=4aBNK4+UA1KQQPpsqCs/WSWrt62piUep8Kh08PLB2iA=;
        b=JDKI3cinFCRS8gLm9uBi01vTMarT67FdYMmyEGivCuD73Um/JSZI6xpHM07LIXxndC
         xZ6/AaSfI7OP1zDBBKwa0BiAWixARqpFLoFHXYHsPXMUq53n2+3qx9URx8wjCPMo306m
         DmT5y7rXtiZBMg4IfPM69ReCR29y+HMVeOHCp74L2y2J6uU2ml9ZQXOc7ua4ta1vfSAF
         TET4vZQo7McVLF0IPPhH+QF4XIeZJA0ii2Mihe+KVjtu03LZF/eEieYn1WJfMpoLh9a1
         QAjEXdmgzvEWleqFKELJTEtvPt4tDK9LHpqeG2qMmpbWzHvhgK7gN4nbHWazuJDlWP+J
         Q9tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773151367; x=1773756167; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cjMHYImNRSSja4s6HqYCd0m/oShCUOYPaIwWGsmcTM=;
        b=WnS5p2hAn0vHHxYxrzTEI1nqAUAFF7+gqJbL9wSF7viHJDhmVxApJVGwzykGrMFCOh
         gSxcD7n5D7gV8QLeflwFQrXb/v6bYagpFcnl4ytByrAYQdNySWeD5CH0SguB3SH2++dZ
         UjtMrOVjMGI8EHGIJNvlMph0Hrmgk4RhnIXTX4yzkJByWqaRAgPiSpxo20A6P87NSmdF
         oZOxIIitctGjfioAClNRV6MLzUzwf4Ci1v3RH5FmyHZU2s7r2U2tZmTUrgOuSyTy43Ij
         APo7nKj3P/MkvTbTOZ1y3CanJsmAtI/AUlbjEnem/UuzHn/+hKfT9ExhfJGbaU32hPqt
         Bqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151367; x=1773756167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cjMHYImNRSSja4s6HqYCd0m/oShCUOYPaIwWGsmcTM=;
        b=CLIkHT8yLm4xe+c8KdWC27wbNZVhScCU9x1sj1YKy0NLnhqkHlqOW9JzNAcEThOMXd
         b6aclwL252KeyvpUdFN9BwN/4XnmPE+1ob8B4D9xvvMf28WDVSuHer5eoj4TwWOJwkXg
         ThlfKblqlqyLHSCakCWvoBpQouWgAk0kZvlm1DuaQ4T7UNmm0KVt2cMssw9kIA+b+PD+
         Dk4mC376NszuOXMjKtcauGNsm7HYbIwe1Gtkq7yH12ml7GR/a4Hm1jdXT0R+ZLVWk2fT
         pBKankbXzH1fT56CdJp4zagaLugF8WpWS6qLp3DBrclKCXaOlKmSvsJoAfTWJsO2+kqT
         N3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+xLdSdSpCzAzZaUutujZr5AQ6lvjkd8adnuGDtqRYf2LgdXqVI6rVCztldjCcXEBuysxLhXv38Pk5ikNa0Vtd@lists.infradead.org
X-Gm-Message-State: AOJu0YwqZRUirUNQHX+q6zJCxhinv+1DBiDJjLL/DXs35Q7GYIOI0xh6
	6iN/XHLe3ycIgH1epa9H85DVcnAL32P8QGvQca0V47LfWrSWtkHAtL6DSL3VTTnWIzi19xuJ5U8
	FxS7kUOHs5lScGqFplo36KSETF/qUWA8=
X-Gm-Gg: ATEYQzxQdicoxtie28f/+quLPhWWlTtwqTwhJ/dL5hClD3ZuVNeVunXMQcnunj2/ZCq
	hPi2cDv5mkXDTeCQ3tpkj6PPyfygahInUGNF8VvnVA077o6XgHyMqEhyidUqHLdX+qj/RoV2EzG
	bklNGrxazSajAmDjTMaS5TEVt29zFjw4ZyMXRwWZKSwWd18za8U8wrV5WwlzocMvwt36HFCNxPO
	q2pZSFt+DSWv3STFMKE00Em9AHOPPnfKAGfasGwVOiS55dLM2wm/g9iSYMqWXQYl8m7Z1brsQ7f
	NmOYSGvoYn/kwGiP1Lv+SFJ+yW4za+KclfCS+F2DIsyncqFm84TdL0d8YrXefczBxrpfUlc=
X-Received: by 2002:a05:6512:63cb:b0:5a1:5305:74c9 with SMTP id
 2adb3069b0e04-5a1530575afmr52626e87.49.1773151366877; Tue, 10 Mar 2026
 07:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124950.1345117-1-andrei.botila@oss.nxp.com>
 <CAOMZO5BVtRHW1+qtMEH9akO7ULS3LppzGXMB2_M-JJVwjbv1oQ@mail.gmail.com> <67e082c5-2b34-4960-8fd1-6cd007e0584c@oss.nxp.com>
In-Reply-To: <67e082c5-2b34-4960-8fd1-6cd007e0584c@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Mar 2026 11:02:35 -0300
X-Gm-Features: AaiRm52bhcWWMfREEMDJLPaGrxzwDMESu5gS0-COwtzMY13DiIy4Ieg-CBISC-g
Message-ID: <CAOMZO5CHGssc3Tuf6fJg2_P=bp7=itfDVRANqQOiK2b-2ooeFA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: s32g: force S32G RTC as rtc0
To: Andrei Botila <andrei.botila@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_070249_601303_8C8E1FF2 
X-CRM114-Status: GOOD (  10.50  )
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

On Tue, Mar 10, 2026 at 10:50=E2=80=AFAM Andrei Botila
<andrei.botila@oss.nxp.com> wrote:

> Regarding the I2C RTC(PCA85073A) commands like hwclock or rtcwake use by
> default /dev/rtc, /dev/rtc0 so they will try to use PCA and fail.

These commands should not fail.

date -s "2026-03-10 11:00:00"
hwclock -w

Power-cycle the board. Does the "date" command retain the correct time?

> Also from what I could find online PCA85073A is also not battery-backed.

I haven't checked, but this looks strange. How will the board retain
the time then, after a power cycle?

