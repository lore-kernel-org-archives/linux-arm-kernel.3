Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB1EC3ABAD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:To:
	From:Date:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=APu7gvDG+GWIH3CqaZfGtDjeCKACn6athf5zXmMCeek=; b=fMNJfEWJs7jUCT
	FNQM4GTOLJ5zIC41UyvV5jtXkzGC+I6VX8eG5JxlGcDrUj4oTg/quQQvehkPZBKEagto/8DtM2WUi
	lWrPTLxGlotiawkyfASri6H8KlOr8FkICQspzG+DEHUkgHBv/lTVbZ2JM7VsE7q5hZXJUfzcOBdgl
	hQ2EbX9c0fOJj/TyfDyYYpXtPxJLA/6JtSsLraz/ELM7zPQk5ptBfH41Oa/o4EYW6p8jPCObPcnp6
	9y5rKUB6ZatdQgWHMAHwlRRKFuwdzCMVMS3+V3uTtxabOG66G9xxdpWdYIMrSsvD/CnM26/OB1V3F
	Zx+pn22LV6Pfcidg+UAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArx3-00000002GrK-3yjK;
	Fri, 02 May 2025 15:05:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArm0-00000002Fgr-2323
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:53:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22c33677183so24708965ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746197635; x=1746802435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APu7gvDG+GWIH3CqaZfGtDjeCKACn6athf5zXmMCeek=;
        b=dZxT9OLXcvpscwyHSMqZz/jLWmfouIzMJMb2DW8yyA7SmI7sDWrLG9Ul1fkVE4vl1p
         NvuSGIR+BY3K7WzIl/cdzgssNqD5Dd/d6Kpzm/eTXVaqMhoEtzVfpDpThod13lz3HTjO
         vbOshNvl9gQGQYpM7k1xepegbb6C3PHOzGodkTFZTtYWCZOR4JfnRhP/YILcFOd7OeBn
         Jv9P5/XSdZvj+shHmWepwY4NuqUOZG0ZTPsUrB0JHhQ6VaSxx6hKaThwhikvVGKM5ELw
         VXYH6CzNPQFUZ0I1vAXOg3DyJE8BFDaNrTczzrGadJDmeDYnmdfzZP7BPvpYy4Jn2O/l
         RbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197635; x=1746802435;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :reply-to:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APu7gvDG+GWIH3CqaZfGtDjeCKACn6athf5zXmMCeek=;
        b=GxMgnOS9v2x7GbaSx9YQ49krOeNYLuTDzo4ObgkVF94BpY27ywTyO6sKN2mrPXrpKl
         cPNZdaMUfoV9Kn9lInm+u/FW1/7zOj5Qyd+EpOFWq2tq9oixrPCkz4hAJ9wePzI5Y8tZ
         +Z7Uhf/nDPliKwzKSF617arCfp3buULICKCeu2Tz24NttzUfct3QABCPHKqZxYY6vrIy
         2Cdlp0hqPQO/tDvaQTEcmP1IA6GWBQDX+AUSztJbIHa91acHmlFaJ/tWCTRxIkz0o0aJ
         0geacsWEl5gqA/3VCgvJ2DY0WZKsjh/ypYSABqjtaZBdrwKYjRol4NG6efbLXo0TLkDp
         KGcA==
X-Gm-Message-State: AOJu0YyDN84nX0n17UPc3gqUnJW7O1iN78HDr8rkeL+ILpL3Vru41LnD
	MHf2xxorYuAFOAHDedJj8yLqMfIYdSY1vP4VUdS951cRgaO9dE1Q9Wd5BBY7Zo8=
X-Gm-Gg: ASbGncurmx1KD1H2CwbUu1y8Mm0y7io3yXn4WwlHT6MsUBg1mdFgmulcLC4KhYUWT0h
	iSStbtRYZxcl6LHr0Mlr/LYIaFBeVAAucbOhu9FT0ApPVMEJgxHTEsSoDAvHT/Rt5uO6ID5zDM5
	fNUQo6HvV1I0mRdNiorBMwKNcHb1802kteYESrKTAftFvGr0tmvgtfdiPx5uv9E+YzVKSmmfi0u
	xnFrCsIjMX2iRX6QuXsur8o7F2PuSanLDD6Uj7yyIXkQesMWhD8gNywzJN3P3nVPQeTLUkXEWFM
	HCIo93XFS5ydDrunCUEXEPBTWPDZaY3njtJe2hZ8hEOxpLirSE2LX+ZUNNb6Q3QpOIrwU3Uqfow
	mOd073Q73dqqyaT9Hq3U68KQCaU4=
X-Google-Smtp-Source: AGHT+IHT3O4Z/MsHWSD8Fu+DtY2sGD0/tiJM+uBDXdKv8HulkHyK1fY7aC6N38rzGcmvgAVJ2vTOvQ==
X-Received: by 2002:a17:903:1a6b:b0:21f:61a9:be7d with SMTP id d9443c01a7336-22e103ecbd7mr50348795ad.49.1746197635009;
        Fri, 02 May 2025 07:53:55 -0700 (PDT)
Received: from 179-190-173-23.cable.cabotelecom.com.br ([179.190.173.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228e57sm8100575ad.174.2025.05.02.07.53.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:53:54 -0700 (PDT)
Date: Fri, 02 May 2025 07:53:54 -0700 (PDT)
X-Google-Original-Date: 2 May 2025 09:53:51 -0500
From: Winston Taylor <sglvlinks@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: wts
Message-ID: <20250502095350.DE2881FB82616B18@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_075356_519955_FE29C775 
X-CRM114-Status: UNSURE (   4.49  )
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
Reply-To: sales1@theleadingone.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello ,

 These are available for sale. If you=E2=80=99re interested in purchasing=
=20
these, please email me

 960GB SSD SATA 600 pcs/18 USD

S/N MTFDDAK960TDS-1AW1ZABDB

Brand New C9200L-48T-4X-E  $1,200 EAC
Brand New ST8000NM017B  $70 EA

Brand New ST20000NM007D
QTY 86  $100 EACH
Brand New ST4000NM000A   $30 EA
Brand New WD80EFPX   $60 EA
 Brand New WD101PURZ    $70 EA

Intel Xeon Gold 5418Y Processors

QTY $70 each



CPU  4416+   200pcs/$500

CPU  5418Y    222pcs/$700

 

8TB 7.2K RPM SATA
6Gbps 512   2500pcs/$70


960GB SSD SATA   600pcs/$30
serial number MTFDDAK960TDS-1AW1ZABDB


SK Hynix 48GB 2RX8 PC5 56008 REO_1010-XT
PH HMCGY8MG8RB227N AA
QTY 239 $50 EACH


SAMSUNG 64GB 4DRX4 PC4-2666V-LD2-12-MAO
M386A8K40BM2-CTD60 S
QTY 320 $42 each


Ipad pro 129 2021 MI 5th Gen 256 WiFi + Cellular
quantity 24 $200 EACH

=20
Ipad pro 12.9 2022 m2 6th Gen 128 WiFi + Cellular
quantity - 44 $250 EAC

Brand New NVIDIA GeForce RTX 4090 Founders
Edition 24GB - QTY: 56 - $700 each

 Brand New ASUS TUF Gaming GeForce RTX 4090 OC
 24GB GDDR6X Graphics Card
 QTY87 $1000 each
=20
Refurbished MacBook Pro with Touch Bar 13 inches
MacBook Pro 2018 i5 8GB 256gb quantity $ 200 EACH
MacBook Pro 2019 i5 8GB 256gb Quantity $ 200
MacBook Pro 2020 i5 8gb 256gb Quantity $200
MacBook Pro 2022 i5 m2 8gb 256gb quantity $250 EACH

 

Refurbished Apple iPhone 14 Pro Max - 256 GB
quantity-10 $35O EACH

Refurbished Apple iPhone 13 Pro Max has
quantity-22 $300 EACH


Apple MacBook Pro 14-inch with M3 Pro chip, 512GB SSD (Space=20
Black)[2023
QTY50
USD 280


Apple MacBook Air 15" (2023) MQKR3LL/A M2 8GB 256GB
QTY25
USD 300 EACH


HP EliteBook 840 G7 i7-10610U 16GB RAM 512GB
SSD Windows 11 Pro TOUCH Screen
QTY 237 USD 100 each


 Best Regards,

300 Laird St, Wilkes-Barre, PA 18702, USA
Mobile: +1 570-890-5512
Email: sales1@theleadingone.net
www.theleadingone.net


