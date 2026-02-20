Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B0C55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5t9WrkC4cTaT4b6ayhskebEanP2UOkXXIMsIizLdDAg=; b=h+SsYgnl7BTDN2WxxeGu0SF5s5
	wNhq3qnEwPB14VGvstXdMpxoJbj5F6/6RkP4ub9FqMSbLOAOkA92QIQQbBJSkkVU2bU4exVeq3gfY
	1jeaiQpwd74ypHoCcOQOA+lK7rIlF9kDxqf3Fz7+p/N2W0rL10sEtiK9TJ0vbLWuSBfL9tow/t3mo
	3H+DnN3YXm0DVxhEywivw0U2+XRblaX8vLhYHR7cXD/wisrrHWjcstvIwGr1YQCHF+elZ/fAy00dD
	EtwyZj2FcZv38jWcpTyAEbDyZSK08UQpgJMWz5C4KGYkKFYD8yOxMBg/3HcIG+wyQbSBsfVYxJxTv
	7Fl1ygTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQZ2-0000000EXm9-0OAO;
	Fri, 20 Feb 2026 13:29:00 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQYz-0000000EXlq-1xqi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:28:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82418b0178cso1219423b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 05:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771594136; x=1772198936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t9WrkC4cTaT4b6ayhskebEanP2UOkXXIMsIizLdDAg=;
        b=ZV1FPG5BaH25IqMgCv+JhLC6J5Qmsp0GM0y0/rG5g32JwpbdqezOpjasA8pmZy/tLl
         r+10iZc+gnIcoFFLtLDyDLjTGgQwK9k7qfdXA2v/whC5jeOSDKmPimoGtWoGZFR623fg
         1mEjZkncTxfZ6rBTRU8oVG5gFkSWINWRjdDRTWUrhU5u0QPgl7JiV/S2bJEntx9ZcXeK
         NdVuhP9hdU4ucKuHng0xI71/GMqmIzEdeG0WacZn57oxuIqNRkUfNbSfbQ7e10hhsdcL
         G+cLE5kP8mHpTHUpYTTAydGoB3M4B20RZMsgdhWGiqPcsaBcnILpvWpeqleVQemGYyBk
         yrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771594136; x=1772198936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5t9WrkC4cTaT4b6ayhskebEanP2UOkXXIMsIizLdDAg=;
        b=Ch/yl70hAeaUk72m5vWupinnQCid5zoopG7lc6k7V2XbhyBm1jARIXc+2Dbp2GpEFi
         LY3wfM5oX0+KVQozFtPvdCNkZGZ+mzA+OeCLyjBwZntyJvRrQYzHwQnEajJI9ONKpU8C
         GmXh/4vTagX0ib1FJ/R4mnbqebjE39Yll97/x2yivSFLj0nulEK8J16bC+B7tMxdb+7K
         QLM1NmfvhotBXZ4lSYa3O10QMw3D3ozkfZ3NskS8hXP7evmTNGmJG88eHNmPmJ1eWrxb
         oobuJm4CX7ae8qhGFzQqCy20LXVrqFjNDyUuFalwgaONFxo40TR3qNIqK7fY6tZgbpw4
         sbJA==
X-Forwarded-Encrypted: i=1; AJvYcCVgBvqxcUjmjgo+OPkydiiWWgVN1LsBr5WhUMEUpstYcj7pK+Flp/IxFXAfjCHPu7fk0BwhBAyumYf4nllA1h3q@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq2W0pYX791qJfYxPyZi9G9NRGdQexAMhrAyNqsCSKQbFCRBbH
	h8MzEH5ZirNWNiGd2BlkHKkoQwZbSiZ7oUPX/auGZ2PlyN87tbe1TFBN
X-Gm-Gg: AZuq6aKUhnQJrkyUOv5q00LhG4MMdIPeBUn5VoKQcubh+R5fUBw+N14AG+XAS2PSrhb
	5MIM6U5daT32SUf5AMZU0OcskqdXPHYW2OyyhpHrX+Dbp43vmEqh4lfxpNRjrxmqVuzfWFSKlLL
	b07u1X1UXB5xDCizdP8/4aAt4h87RpED6g4GPMNLO4Pb9DP9Z1KiENDMqqZlEO9yY5/d5wWTVnv
	v3Lqo4sjddFz0p+OXfXJ9/l5+MNjAUracKt2DT2TzFAHqLpEwVYoF0gPavg/lTv08UoTuVggMey
	tcwT57vPyUud4w366YNamlRmnxoYjwSOPki/fHP+d8NGcg/cJFhOaLuj7bdFANfpDsa1wygXvzr
	1wUQ06dVSoEDlNdLeuLL8fRUhammcsfHRZox5JBXLlSvnsYb9LoY8o5e5Ne1Y/Iczxd0pOF5ZFq
	0sC1DlCxxcIu6C3yHVWnDIYPB6/qrz52I=
X-Received: by 2002:a05:6300:194:b0:387:5daf:b312 with SMTP id adf61e73a8af0-394fc1f781emr9123102637.35.1771594136314;
        Fri, 20 Feb 2026 05:28:56 -0800 (PST)
Received: from bsp.intra.ifm ([123.252.218.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5331ba14sm18575123a12.29.2026.02.20.05.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 05:28:55 -0800 (PST)
From: Rahul Navale <rahulnavale04@gmail.com>
To: Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Fri, 20 Feb 2026 18:58:44 +0530
Message-ID: <20260220132845.7118-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_052857_530339_BB972DDB 
X-CRM114-Status: UNSURE (   8.28  )
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

From: Rahul Navale <rahul.navale@ifm.com>

Hi Folker,

> Can you help reproduce the issue at our end. How does your setup
> looks like? Is it dependent on PL design ? Unless there is some
> dependency I can try and triage it.

Our setup uses a custom FPGA design with a custom XSA file for the PL.
The multimedia drivers (audio/video) are also customized for our platform.

Regards,
Rahul Navale

