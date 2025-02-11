Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66C2C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 23:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjUlPt7fQIbCG9HRI9aLi8iTstRFShKsOWhK8luHgiY=; b=BCsjl20KtMbQzz+DOwoYbxDJrj
	ZtVLW/YqNxO79Ugdxlbnxuol2X3r5wD4C4ldyQ5X7JvAyHMqbBV611Q0DnE3bFch54qzJYhaFcuhZ
	Eh5ZaYAykSuCOdyg478lgH5XuZGovxvpVEC2oeS3bNVq3PdRR9ypKS58YOE9/ZiBw67wypuDP8Fzh
	9Rvje+958DaIvB6SNp4jPKgffNEouEreLkdAP9jA4J+R0mCyu3BkMkp1rJgyuiVDQB/RHNG5xrpz1
	XeHlo1jq2bVMOm1M/fXaZaSBAHEp2R6kJmo44x7rPSMfYmjQdbsNFPqzAssg+1urvvi9UUzDEXnBN
	cDGBHqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thzMy-00000005Xzw-0STw;
	Tue, 11 Feb 2025 23:08:44 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thzLX-00000005Xtl-2pPs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 23:07:16 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6ef9b8b4f13so54736307b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 15:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739315234; x=1739920034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjUlPt7fQIbCG9HRI9aLi8iTstRFShKsOWhK8luHgiY=;
        b=UcNkkpTb6fXkMZnLhfxGZguKC4I6MP4X+xnYfxyi/i0f5WXN7UVIMSL0Z4bHIDChQp
         1/60YhhhY18riufraYZ3PLjbCkcVqbMmLXa+Lq5uiMqaX9Zz6Yq9NrMtlumcD+dY7PIt
         UaANCWFBpV6DhgCVZY/YEw53FrAOKcUB4ZXIb/Cid3x2Pj907IxCbOBJmE4G/NZ5t5VI
         pINnhN69TfUgXbXaQKe0107Zck23ApDhrZ/ukOkgfIHDfvXw5ng5MZ1zYMWhhQPZWk1x
         fLDAdhw/wLoIJ8QVyYexZMRNry9FRpk94+lTmLfbZHvDqVHDmgbsUFjJX02Wfv2JtdJW
         iGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739315234; x=1739920034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjUlPt7fQIbCG9HRI9aLi8iTstRFShKsOWhK8luHgiY=;
        b=WZoNr5aQoQJv9rXprQfhwG2evOXvX6RoTep5a9j4CiVBTDiuQarSXDBTk6uOSLeRMc
         1XgyD/b7k1BEMb+0fT/xlY8X/CdIIIRHLYijrKsTnldOaWKv4q2EwuyBlInXld4a4vS3
         aSwQHLDqioQcVCIUQ6bQ9evKTk5FfRbxzZ+Fx3GVYxo2yKBKHw6yZ+T2vHOEb4Z4uwbg
         pcsJqihZI+dcrxksIbL81ZxQphedDlRgdm17fNf0b734srK2y9xUHwjKAr/RbJIKGo3H
         dm79Nosss/N+BCOgk3Hnwea1V/kNXZOVOgXmonNZWPHqHqUPAv9GkHVi8R1q2ZYFOF2z
         w2Uw==
X-Gm-Message-State: AOJu0Yy3QUHCU/xrw76NiDKPLBSf5GMke3fzcR7uPRe6mF9wHdfcD3Fp
	Vqk9CoGq/Z7dnZRIAmeb/Ye1zP/4/Ay9/CoaDcbvjd7kuFdsfQMkauo8KAoF/LLsw3a1IfhcLse
	BDapF9VVl6Li3TEjVVy5nX/zDKjXnimtT
X-Gm-Gg: ASbGncvIcbn63KjVHkdNDKwewRVGCIRyhqr46gyz5OGTulY3LT1qKXIowOU3xyTPDeF
	H/XLwMxCXqOfhPe9S0H/r/OZ9aRpt6yOvBQmei7hTZom25EDOiPcIi+UINEjcGHqLR+3CDMDrkw
	==
X-Google-Smtp-Source: AGHT+IGXt31L2dPfJdVvqFBxiTcALOlz9ju4ydo5Tk9yYDo/4DuIc6WAoXrf+LCnTVdr88ds23cuOt9d7uq2eXMLJ/c=
X-Received: by 2002:a05:690c:6911:b0:6f9:ad48:a3c7 with SMTP id
 00721157ae682-6fb1f1e5e09mr12938727b3.21.1739315234067; Tue, 11 Feb 2025
 15:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20250211181839.1575497-1-robertcnelson@gmail.com> <20250211181839.1575497-2-robertcnelson@gmail.com>
In-Reply-To: <20250211181839.1575497-2-robertcnelson@gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 11 Feb 2025 17:06:47 -0600
X-Gm-Features: AWEUYZnnrz1uhSEz7DwUdf6zeY2QTmIpy4WAgTlvlUWiFBO6xPeRHOiXv3ja3Iw
Message-ID: <CAOCHtYhpvt1_jBqJGRsX3BO_jnn_cqemY+jgVTObUg2pKQ3Sdw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, 
	Andrew Davis <afd@ti.com>, Roger Quadros <rogerq@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Judith Mendez <jm@ti.com>, Andrei Aldea <a-aldea@ti.com>, Jason Kridner <jkridner@beagleboard.org>, 
	Deepak Khatri <lorforlinux@beagleboard.org>, Ayush Singh <ayush@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_150715_710970_09E11BE7 
X-CRM114-Status: UNSURE (   8.11  )
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

On Tue, Feb 11, 2025 at 12:18=E2=80=AFPM Robert Nelson <robertcnelson@gmail=
.com> wrote:
>
> BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> PocketBeagle.  It is based on Texas Instruments AM6232 SoC. Its dual
> A53 cores can provide higher performance than classic PocketBeagle.
> The new design comes with pre-soldered headers, a 3-pin JST-SH 1.00mm
> UART debug port, a USB-C port, Texas Instruments MSPM0L1105 Cortex-M0+
> MCU for ADC, 512MB RAM, and a LiPo Battery charger.
>
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-

Broken copy/paste by me, this is:
https://openbeagle.org/pocketbeagle/pocketbeagle-2

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

