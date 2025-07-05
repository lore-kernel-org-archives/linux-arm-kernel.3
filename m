Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FB4C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 14:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GxrMRQg3ClHbYVYGNow/NsJAM3b7dz8NkMi6RpKX/2A=; b=hYJQcgZljfMX+47yOuiDZT9DyJ
	axFs4yLHGxMMdjSKgE04fA101TR3c1IOzgt9br3QsoiCK1XngYJuGFQF0M9B2czFHtZT5rahD5aoG
	YY2uIzPp7/ZHumFTJLb2cBQqtMw4+zFwI+51f4LJPVeoX1ryePnxWr5Y8jaTXMtdp2fpMZNDDpncE
	ooP5SEAx43UMcX5Jr+G+TUBVz4r/WkbycY7vY7WEe0tpMTnvwxyCIicXqurTsoZ5BZHMA/EvV+h55
	V/evxj7Q/Iq+ILaWxvJuToS6NE+LCqrIik/97DlaEjLgtiUYu98VxhiT4ltI3O5q8NQEvWfVxpNV0
	dJEg+f1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY3aB-0000000GbZU-0F8C;
	Sat, 05 Jul 2025 14:09:35 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY3Xr-0000000GbON-2ODy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 14:07:12 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4a4bb155edeso22154801cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 07:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751724430; x=1752329230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxrMRQg3ClHbYVYGNow/NsJAM3b7dz8NkMi6RpKX/2A=;
        b=U8NgyXYNMFS2R9Qx4pj4EjMUGbYCnMRoRq23i9mbDH0lagiTp5yDlUt3JmXzWFqhLL
         stRj/SrHqKyLJS3qBKv4ehDk5oPukWDr8FvlDB93D8AqwkEYEuHM9BgphQ2xeC8WwjI0
         akLWTVokypFKUG6eDu93++JF7j+IxoyztUl4QorK8h2n9AUG4Z86fCUtGv2+dktSVhmK
         KKseFvR871BAHiKUZgpFulQoVXuZY1Yc6i8hOnKVXFYMWMzBzqDVosyTMJMaEiSxkgBP
         0FRrJ1Xc+fK60o4SerSU3659GxTIa2c5jz5Ri6qjGraAVufggXo2/quSobc3xgJROsru
         NmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751724430; x=1752329230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxrMRQg3ClHbYVYGNow/NsJAM3b7dz8NkMi6RpKX/2A=;
        b=qoYkrqTFUn6XC+P1rzfDylf4jMCBvwozYkJW+mWRnlAqTICYX48w8FYKzZ247pmUAP
         zx+99+/T6aoNDd353JJfi+KqjhvmqEsDv4pSaqtn33k0k2/fVddX8K4zvdCKxxVOZo/p
         ASR26HxPxYnmF/1XTJ2sjfCp9JlWoIom3zyg229fCoGuhPAIPrVMbFIKs87IskoAlyBD
         ENW/RiFCpdIWrQkiL8L8VbL5c5d6dPRXwCFa4k6uppFddscetF7rlr/i8no6ZgT8WPHY
         6nmo+ySoliG9HWUAeQfAJvKADE6tJmAM+aFHT4QlBvRzzr0wYwFznXoo75Enbe4PeynM
         Ytbg==
X-Gm-Message-State: AOJu0YyWakVJei/tUt1IWSAmC+5GLdmWQ1N9pBkYQmnbx5VwG9/ht6mU
	NxY1/tX8Xp2wo7t2RqF0cz1kkwOmm0JrJc16seUCt/6P4TyJMJEw4uWB5ggqOhYU4Hps/cdIsVr
	gt57CLHj2PNJcBKWqVdfynQOR1tTKofo=
X-Gm-Gg: ASbGncuL0YCMJnZgtFeqohGGtCt0TPiDA1SfohfLQrZPsC4EIOS/cpV8miEw9NNcK56
	84stOAbQ28SXqzJ+iBZnxgduf4fbQZYEo3eFJGg+VR8WCps2ZPxjgAhBQZH21wKThAPSmo0/UY/
	otpR9RyzE2qLAQQjlbGV7jkiEk62q3cuyZWtoTC+43vkCte32o56YWdo3ZLVp6QT6NQW3BiunBE
	p9VMQ==
X-Google-Smtp-Source: AGHT+IGsDdoQUx+rSGSzzxXCkVQDODMY7OH1HVs+DAsqxKXPp3PdFxseodwOcARcUr09rHXKr9lxP26x5Z/74k075ZY=
X-Received: by 2002:a05:622a:8c0b:b0:494:acc8:b4ce with SMTP id
 d75a77b69052e-4a9afc199bemr12740321cf.11.1751724429590; Sat, 05 Jul 2025
 07:07:09 -0700 (PDT)
MIME-Version: 1.0
From: Sui <sui999924@gmail.com>
Date: Sat, 5 Jul 2025 22:06:59 +0800
X-Gm-Features: Ac12FXwxhjoOA5doABq9pXsHKKNI0Lm9-AgrhCbufh34BRyNbE1ih_yh2bJvRwM
Message-ID: <CAObhpgi5uBNYOygBi3E-8H=XrnyrAqgkS5RwjCTjOUh+aq-zww@mail.gmail.com>
Subject: =?UTF-8?B?W1BBVENIXSBhcm06IGxhbnlhbmc6IGZpeCB0d28g4oCcbGFibGXigJ3ihpLigJxsYWJlbA==?=
	=?UTF-8?B?4oCdIHR5cG9zIGluIERUUw==?=
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_070711_636775_D5C3E371 
X-CRM114-Status: UNSURE (   4.92  )
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

In arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts the properties =E2=80=9Clab=
le=E2=80=9D are
misspelled. Correct them to =E2=80=9Clabel=E2=80=9D so tooling and bindings=
 pick up the
node names properly.

Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D205891
Signed-off-by: Jake <jakecontactxyz@gmail.com>

--- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
@@ -52,12 +52,14 @@ hdd_fault {
         gpios =3D <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
     };
     bmc_err {
- lable =3D "BMC_fault";
+ /* typo fixed: lable =E2=86=92 label */
+ label =3D "BMC_fault";
         gpios =3D <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
     };
     sys_err {
- lable =3D "Sys_fault";
+ /* typo fixed: lable =E2=86=92 label */
+ label =3D "Sys_fault";
         gpios =3D <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
     };
 };

