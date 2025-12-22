Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE14D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Fm0ytkCzzsZtMoWmt94fz5Tfw5Toxhya5YWhR+90lM=; b=2vZW0CY9/j3WfP
	q1WczW1Iwgav66ascEIUulHgx1T/vHtaSall3tGN1k6Ex7LKhCLVBjrewH6ArPaxcJzOw+NF4J6iE
	JZt7ylFy/2Ed78mcvH2GxOYtgKTrZz5+jzqeyXCMR/DpEMthP0xhx21Pb6yHS+q1QzA5xWe0pXKgB
	44PB6U4H8HXo0QFCn65ngO23Mg4Z4wVmE6VmfR6eBUp3iqJEZ6hduL40rmnP35zTNigJJrkvvgbWh
	CSG+B9UMi0dUK+4DLfWkoMg+q0WfPvi3+5KdzSRPbsq1ADdz9CkrwZ1ITVWDH+lCtuGOGgPkAWXP6
	5F4x48qwj5JEXnG3RPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXacK-0000000DMbg-3bLL;
	Mon, 22 Dec 2025 07:46:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXacF-0000000DMar-1PQw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 07:46:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso39158655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 23:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766389562; x=1766994362; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Fm0ytkCzzsZtMoWmt94fz5Tfw5Toxhya5YWhR+90lM=;
        b=e9BfRaauGB2Q7cmgBnS0spgcRNnIkFiUcJfONHIv01ZgSLLExriLHJ9viuvNe0UxLK
         ZY9t+p0GX92k5TzrUkPtUY5Yqhk/29aYnaxkJ9xKe6curF+XHRQZp83R8u4uRA7dTtzj
         6OUjKupeQpzDfehlY/fRg7CQNjyNnqd+9A4bQ9Lb2iQyjnTVS53I++T9uaDO4PNvvQf+
         ta9J8z4FzQyjsSXIZldRQTD/iDwGLKNposb3iUP8J/VMQRp4qBDvEQ3fFtgSprvQpaXd
         LFTbdV4Pcd+cKT2kFG4CWGCHitP9ZNa9Xtsqeez2jSaostdjLRQ0Lrq9afuxCKFPKOyf
         gOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766389562; x=1766994362;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Fm0ytkCzzsZtMoWmt94fz5Tfw5Toxhya5YWhR+90lM=;
        b=ipuPEBBS3Ue99tzJWAD1zQhibT+AKhv33w8ohlgPsG9DNc4eKlORbrXYb++f3T3E5y
         P1HtSGhVk6/1WiVb1xWSm0Sxkfbwa4BQAvKZErlEIGkcOSrUOPUIYEA66NeAyFnrLhPw
         zGozYXB+sS4kgnyc/vl7nQknefnSbuud1rowxs+xI3oobsJcJUu0FpYQau/7u8ZXLsCe
         OJjgVuV+PSVZVx2HNG38lzzxuwuTE1BDVFlZ2dxuawY/Zat8hAht/ILjcLbbbsjBYbMc
         auBEX+klxPBPsJAErak38qWlIxsafcIc8PFya7ATyc2uhvtPhec4kZ+srowiuFDUw0Fi
         6HUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVggIZHfvkBkDqbkS1jgMpay6gEAnKrLUJ6LuQ8TylfjlCR8TY9VlT01jADhrHaVVmXEauz/0ZtF7tINIsqmmpj@lists.infradead.org
X-Gm-Message-State: AOJu0YwgDJh3+MKI6HQGzjp1Vdm+1wBqBvKYcJcpCBGA78ReDHbWWQp/
	JKTizDbcld6j5jE5ctwiDbc7KbHj6OFL+MzLwHrAGLck7wa04eeO8xOD
X-Gm-Gg: AY/fxX7MVNOHaHpUNwgZQbGfyllWC6WUSxbEK+3y3vWxbAFHKTdsV1EyjVDPA6CCfX1
	KQMSC5xFMN0FMIk7hQtOam1LLv7NKT/1QgVA6B54tHKjZS6Y0jdgLDCia+U9aDl/92UctGe1ogI
	Qni17WH9jsv1bInQUCWQzTl4beeQeqxhNXZMClP4VwjjVzj0wkcPBLsOsZTAA8F8neyqSpZea3O
	bBHb6E3oqKhR4eDxEdcKum6DaO71NSq9qKKO4J/UttwEH7toIQlTaB68Ru5fif59TdtT2F2VVRG
	Dx8GBMyJ/Ld/Lab/aNzMlldvfDm910kORqUjKzMr/VEXnuBm7Up/g7wooDY95baMhLhCxdkb752
	8N+vcijrFvx0r7P3I90kJV3WbvM8E55O8GaJSgN7dIPrj3dUiS35r8BgkRs4259WfbdTa0ojp3T
	F34VCc3DcAj4WCTeUtYzO79Kk0B8wx9xDnjGQHpoGCM7TcrAi10Q65dG3Ex2aTYt7yXRWlQxXMF
	fXIwrSw6r1W7VO3
X-Google-Smtp-Source: AGHT+IHZy+xdBVzO/GB6/G2tv0TmbUIkORQVBt6UpRip9g/newtl6CMwaiALwAcivww2CRbJvKrmhA==
X-Received: by 2002:a17:902:f68a:b0:295:99f0:6c66 with SMTP id d9443c01a7336-2a2f2836964mr104720125ad.36.1766389561828;
        Sun, 21 Dec 2025 23:46:01 -0800 (PST)
Received: from [127.0.1.1] (2001-b400-e3a0-2ead-fb96-4f50-681a-bce4.emome-ip6.hinet.net. [2001:b400:e3a0:2ead:fb96:4f50:681a:bce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbb7sm89605105ad.59.2025.12.21.23.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 23:46:01 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Mon, 22 Dec 2025 15:45:42 +0800
Message-Id: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACf3SGkC/x3MQQqAIBBA0avIrBNyosKuEhGWUw2EhVoE0t2Tl
 m/xf4JAnilAJxJ4ujnw4TJUIWDejFtJss0GLLFWiChvcvHyBkd2HNnso41B6lJPFbatbZoacnp
 6Wvj5t/3wvh/iKNU9ZgAAAA==
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=735;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=1U45K3W9FRxsfbvvzg7mdtDjI/jjVfHl92eXMQxiWlM=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBpSPc1Shs0Q0pMY4uKrv/B9B9j/btwZgk1uTBRM
 mt4115VUEaJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaUj3NQAKCRClg0K3CVbE
 gSqoCACl+GJeVtCd6QqxE6qc5Fxc86uBRSxPbrzRkBEviqVGBcy2mry3Uy3SkDFxPZePkHmFY8U
 2et+EtaBHVuzCWQYHRJESKKwWbpOlGCxX8oL9xaLbmUxbnb61aNxd3QGuICWWc9jiR7/H5scRjb
 MFZ8Vn4CIHlfQZEntkPzDWj9R2mbvzoSUVRFVTPpzkmqDFL0Pu0YpvXKJe94xDm94DZ1mAKXnpr
 JaEv/N1vjUm7W4BdKHMNjBR49ezPwzeATHpwwcTpnLWik0W9xCAOjhrEAJnWv7xiXF0I3tHNaN4
 Q08DP5L6ufRxcAb0cV7ndXyvyzfFEaGP5dltz45ztEr2J3jw
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_234603_578777_4FAF8897 
X-CRM114-Status: UNSURE (   6.90  )
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

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2950 ++++++++++++++++++++
 3 files changed, 2952 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>


