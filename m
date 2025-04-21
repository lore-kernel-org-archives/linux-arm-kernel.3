Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7462C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 05:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0NfzkN0fnmS5Mofw8S9sgeOeVdElW9vhWvMoUL3Xt0Y=; b=zMqIuvcEDkIvRC
	q1oTyfTdNQ0B1DbKdBaSkX5dmzyfd2DKYdp3Jx4F52EUGfsKVHSdWPwqw13Lw6rATVju+pVKeqp9O
	C5rzXmuGcAyPzyah1hDRnAOTdkAWhmUNN6ArTBqlNMb+Da9y+FXgUwGZZ37Hksx4KJMAzzbvq4EZ6
	XehTeycxzY2OzcvwdWMGrQW0vdSPl22owh7mX6cDf9wiqIdykFKt5JF2yOJG2tUh95MJOAiB9WToK
	O2EO+fW41nldlcNCwGU1xEhyeoXEHUaqfdJZnGvSysCEsCglzmmVJxLyjlZHIgFYXcAaVXz0855Xc
	8vLc2f/h/I+fADXJmi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6jsS-00000003dwW-4AtP;
	Mon, 21 Apr 2025 05:39:32 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6jps-00000003dfh-2qOW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 05:36:54 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-736c062b1f5so2780105b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 22:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213811; x=1745818611; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0NfzkN0fnmS5Mofw8S9sgeOeVdElW9vhWvMoUL3Xt0Y=;
        b=Dq258WtDSjVK8vCXzUJRvnPLRJrwCbv54Sb1e+msjwf0DfS2jXWpVUW+fJ5n7WRMyx
         GNfVszrP+RrGw2ktrnOAUVZ1bRWQssGxY7Z8LKjKS1bbS4HRSjBtbsUQzruhqx8VVjB1
         YOXHwFDYqLwVQUC1wOMOln4QZSWBlSTElO8v5scyp6YX2b1XqM9TOCR2BsOWEgxxooud
         R+eR47q8fEimc6Jk7Jhk+AlTEi56UUDKQj+ypUZbePSXY0+iJR8qZwblv+AsGVGEOpVR
         6WGFLuIMLlc3/ptDB+dqttGxWoMSbCexd2UAkqHTyEnufOlUBttejjlkmmX93luqAA0q
         4Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213811; x=1745818611;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NfzkN0fnmS5Mofw8S9sgeOeVdElW9vhWvMoUL3Xt0Y=;
        b=s0R0qhAAI9+XTfRlQXBdCnO9x44teEGOX5obhNtEJI0yImx2HIBf6XvWCab4FmvlPh
         qhdp2vaZdaq7x9P0pctDFihPfiNWXDSe/cUodro+wPf8y/bVbFoIYD8Q1pqLqq00bNwG
         CKtKTJ+s0DrmthnOfzLyTOPIfksGSLvpieGm0w3EDA93wVCfA8CDYR6+aVFSQ9iMDNKc
         H8bX4838o82GCUQJ+u1ugG6+tmJn2eTwqj3XGnhoOMmx2YTCkxEc32eoUhQcsZt0r7Dq
         USmQ7uZQuoYCX8qnF5l8s7G9vCNqfGD4hMySDdP0x/V3sqnNW1MTF+Iejs2Gs43kieIl
         CHmw==
X-Forwarded-Encrypted: i=1; AJvYcCXJGAiFka5ZX3V9bGrBZvlErTjLuqImMfstTx7W5NR9oK1ipZb5MCC40QYzrQcn/Iahn9Rzl9zbZhCbxHZhhGMc@lists.infradead.org
X-Gm-Message-State: AOJu0YzWGf3ZGLNh6K3PcTzwa2usL98GagDHzxlspVCgpKPLLPZIiSEq
	+IC1f6PVNir0ttt9F2AGGjnEs6JOoctPxjtt5y6UpcODPTqEztqIUUpcr9NWn4b3skJP
X-Gm-Gg: ASbGncv2XJS7ITwk2LODETpLfjYQFucWtDv9Dqa98ZuKY+mUnwi2sPZPYbTeiof+CJA
	ZJtr0HWU/GVy76RLLGDb77RYaakpGVTc//02IcFPPF182MQpdfH3wVUx/PzTLHxBd1rZeUz0Osg
	ULoEZiXYh/zI98GFuYIM71Du9grIfjHqQ0ah0WcSTqJq0MeUuIIxoBVyz8wDPG9Rbi2iYpKbXKd
	ZMlfTHQrFTvitdiX4g/A8tpoxGEoT2bkv+W3mPcBKbiMlPVTEpZ8N/6ireHXmbyWRTeSHCsdGmn
	CGomuRJT2xpOnFtyazI0tJH4
X-Google-Smtp-Source: AGHT+IEqHUOUzK9rh3J+NJTMwGu4gKoRvfeJw0Sh1VhcSH7waFXHAmJiBxIoiBwRq+DUpuFuKqUz/g==
X-Received: by 2002:a05:6a00:4606:b0:739:3f55:b23f with SMTP id d2e1a72fcca58-73dc14d3124mr13013679b3a.14.1745213811299;
        Sun, 20 Apr 2025 22:36:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beaf2sm5634270b3a.5.2025.04.20.22.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:36:50 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH 0/2] i2c: imx: adapting the mainline
Date: Mon, 21 Apr 2025 13:36:37 +0800
Message-Id: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXZBWgC/x3MTQqAIBBA4avIrBtQ6Y+uEi3EmWoWlWhFIN09a
 fkt3suQOAonGFSGyLckOfYCUynwq9sXRqFisNo2urYGxXqU7cErkDsZyRhqW6K+4x5KFCLP8vz
 DcXrfDxlXioJgAAAA
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745213806; l=809;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=jd5oGOx/Si3BQhqWyzuRg6hu/nzPXuQweQYGrnIy6Fk=;
 b=TxNveZGO01XjAtbsV0BKVuLJNalcayVMoh5gzsY1Su3nli5TPvpvv7Edu1GqZdmBjy9whtRWt
 Q2gGB+1aSJHD3NMjOf48wZt8iGFb5JQy3/1TcqMGOITcFQvAiSyYTgm
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_223652_741831_5A053C06 
X-CRM114-Status: UNSURE (   6.92  )
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

Since this patch[1], we have new callback function names.
Since this patch[2], we can use `guard` to call `spin_lock_irqsave`
and release this lock when it goes out of scope.

Link:
https://lore.kernel.org/all/20240706112116.24543-2-wsa+renesas@sang-engineering.com/ [1]
https://lore.kernel.org/all/20250227221924.265259-10-lyude@redhat.com/ [2]

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>


