Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5957C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5qcHiI82/LFv1dYpB1HoVb5XMF47rsmDr7PMAQ9iF1c=; b=L2z4hEPph15r6S
	BrTUHPcJTwBKH8Dqmr1oD14R66yjF9e6YvQC3JG2VzYyEIUeMwKr+uUZKnKbBKbGBPNkeOCQojlZ4
	dki7RZBiphKWLbMWLfJc9CyKZ5C6IhCUhfz36jnNPpLjrFQ1bce4n45Y23h5wXh/5H7ZU8K2jYHjW
	cz+/r/4zojF8tRO764kwY74gsnmo/GtHOTr9ilDge7qdX1JbtPr3AZh3YO19dcSy494ApyO0790Ds
	hfWjBJA9FNwQAa9JHSLC7IsZ7Ia2Yya8euBuDWvyV6/KYEqc5+66tTEBXP88syh5JuOYbc8ul9+lD
	E7NxDNw80RE/VVn6ijVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLGCD-00000003SUA-0Nji;
	Sat, 31 May 2025 06:59:57 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLGA3-00000003SKD-2XJw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 06:57:44 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2347012f81fso36251815ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748674662; x=1749279462; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qcHiI82/LFv1dYpB1HoVb5XMF47rsmDr7PMAQ9iF1c=;
        b=SVCGdH2+8igoL0W5sL2oU+y9E9kpRsUens+ewJBCH5mEGFwdyEMxAz6uXRhiyUaAnm
         CjpONxEttD1tUYDxf6MC+lmLAOGkGf9YKNdGCCn/K6V8o3WzTCYGMY+9Nw/h6dfcuTF2
         eQV+XkpLxD1FgRp5gW7LXknvv29Z0EfpOu/Gcj8YpWhLfGogLptnmxqZqy2qCfaVT1EP
         QrjY2dhJZfW74aSwSy5qnCOLcsbQUAnW4Nh6JxuiZ0KdosF3eiEblQKK3mSFsGjbPUxW
         hbbvAXATVTHlj8sW/KfIuXSX/7qeH3bEO4lLmzoW1pMNpwWeHxgnYswiOWWzNQlkenOL
         KZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748674662; x=1749279462;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qcHiI82/LFv1dYpB1HoVb5XMF47rsmDr7PMAQ9iF1c=;
        b=p7LStmbjWmonKnDzJUKxDXuCcA0QG8QFJ2GEliTDkxSDcWm6nJ9SNvsgMs36pf4R+Y
         KhSMK0D2kvLzWJKgra5Cz8e/8g4b++72YXGUvE/EzFoPgEn2G/KYmsB0RwCpIBFcR2kL
         sErhxkEcFztlB+iV/kMj1BJwFgf4ncJdh/SNdNS8Fs7ikNH9IA4nceAN38nPWLivPYRE
         rfECM1Kr00kuD8CKbGLU2T2L5zph41Fzv9RpwsIqDCDTXOTY4953R6iw/vteaIrRQ7g/
         uSheWk3AQiBSzcXHrnfKPGtWEY9kuRD5a2XX/EMQJaGKWryeztRAGg6gkLsW5Osg8tvY
         TLcA==
X-Forwarded-Encrypted: i=1; AJvYcCW4oWSfSQ19J8Ncy9PM5hTL/iHd8qjMNqT/nqh3RtdTo0Ac4DFapuBZVO7pdZridHDJ1z0QfBMKAMnzz5QXHAWy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2s57r7xJoXwPHaeAUZzzVoA/vngEznxM7IEDnXiXpgaSoSGF1
	MQecXWLoJCk/OZQ96gHjMnr3jUM6oT2moc0GXCq0sCPp70DqNA6+9Dnf
X-Gm-Gg: ASbGncvAajppT9oT4bXE5AmdR9hKXVq7UmG5KdoVmfvx9uwcJ5hlLRCEGFOUPn0pAo3
	lREVq2rRVlXyq3riDn+FhxEyBANrZzuFuv3+hEeYOx7WkzH73h0JOaw/Di+TaP490AGunTYXaUn
	pIoNnJim84E+EhqeclTXNetbLIgJSizpYmAAzKEHIN8vwh3xZ7WLWoAJovS+KGUBAuNpgKeWNv7
	PqynRnLwUACN5Bu1+GTWzmnjBX5V4Z+R5c14zcRitayMs102Diw8NTsAkeOEAD3VJ4rBNukdMk3
	id6jqN5IfPWKFBmZ5fsmFPA3Cy8ELTiH2sM=
X-Google-Smtp-Source: AGHT+IGGhT3HnZACqSoO0BWBt2NHArRjjRnsN6QNso3lrv38ZJCqSmd60+cj2QxJNX1QE7jAAytsCQ==
X-Received: by 2002:a17:903:b4e:b0:235:1ae7:a99c with SMTP id d9443c01a7336-235395b2408mr63803315ad.32.1748674662034;
        Fri, 30 May 2025 23:57:42 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5448sm37596625ad.185.2025.05.30.23.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:57:41 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v4 0/2] i2c: imx: guard and drop prefix
Date: Sat, 31 May 2025 14:57:25 +0800
Message-Id: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFWoOmgC/3XMyw6CMBCF4VchXVvDdChFV76HcQF0gEnkkoIEQ
 3h3CxuJxOU5yffPoifH1ItrMAtHI/fcNn5Ep0DkVdqUJNn6LVSodBgpkKxyyfUkX51NB5IWwMa
 xtYmhRHjUOSp42oL3h98V90Pr3lt/hPX9mxpBhhIATQEFarT6VtYpP895W4s1Nao9NweuPLcIi
 vASZdrgL8cv14AHjp4nYDITqTiNDe35siwf+D109CoBAAA=
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Carlos Song <carlos.song@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748674650; l=1377;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=7XrLppQO5qB5g9WEeeWY3UVbzJBtnah+myNv+a9FfF4=;
 b=yNqJnBELWXIrnWc0OTDAapEeh0k2sIvvzRqEwsOj6o/ZZMXsWmRcGtIy1Okf8MET6yz0doUaX
 iHpUyHvR+vFAe3WpHJ7EZbP1jUaz9rAUzUkR6viFFygw06souqRcV2j
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_235743_659071_E5917AB6 
X-CRM114-Status: UNSURE (   9.52  )
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
Changes in v4:
- Add Reviewed-by: Carlos Song and Acked-by: Oleksij Rempel
- No code changes
- Link to v3: https://lore.kernel.org/r/20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com

Changes in v3:
- use scoped_guard
- Link to v2: https://lore.kernel.org/r/20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com

Changes in v2:
- Add more details in the commit message
- Drop a useless variable
- Refactor the logic of i2c_imx_isr function
- Link to v1: https://lore.kernel.org/r/20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com

---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>


