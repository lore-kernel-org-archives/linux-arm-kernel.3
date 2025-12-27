Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9F1E9271A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 18:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Waazk7Chr4RkJhnZHpZEcccDmzXQvP+M+uK+a+IMu58=; b=NDL5TDW4nYnA1Zdk6oVjDSs5CP
	QRP5pH1qTMvdYAkkI+3YesQYa/Wr1GT78++NaN0ySxbYAS8PN/IJ5eP/+DRc6/FRxZrW26XwdyAFV
	b7Q/lzIq5HghS72/vXQgjEpcFHiXdZkAwfqGYw7peY3n5tfWa8XIiXuaQjEgUFPmODd4iGoqPnhLp
	U6STA/TjEbO035sNYcHKKkiG34wCXR+x1p+aWL7Crl5OJgIJEgZ20YZixQZLPn1sLhGm3WanMQqtn
	NjA5MeL7RPNqgwVSXE9t4hzXNljrerXcULYrLx/MZhZOWPF7k9Jp5Jx+l5q4x80qm9n8p2wiY/c96
	gE1Iz0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZYhW-00000002819-1HFg;
	Sat, 27 Dec 2025 18:07:38 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZYhT-0000000280p-3Igv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 18:07:36 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5957db5bdedso9246904e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 10:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766858853; x=1767463653; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Waazk7Chr4RkJhnZHpZEcccDmzXQvP+M+uK+a+IMu58=;
        b=KsuPitcpY/VGaaIysAR+1ltaRIsRLm/aLxMVWWCgdwTbOecp3WS87AcLM3N4pT+uR6
         jQ/p0cjVwWH5Ze7rt5jfBzfTJoV3KcWN4KLvYyw24LyqIubXgZ1qx2N0zMYy11zvKu83
         gH9fTi1idHJ8k2WOyS8qoJgOjRFQErjpifAETtdGQtMy7PfMQJKZLWtYNSG8Ns3UBQLT
         XOjkLeF1yXsK7u5yCU8iu2mcFboO9ROWejxWRZ1VL0Mv68DVj3s+jAxAXL9ZWxf3ZPtc
         CJU/OSbnLpKsS4DF9nT0GPqZ10vz8yUpDfCv5C/Y21bdGvJ/NFZLtWusbL7odIqnUcsz
         uNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766858853; x=1767463653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Waazk7Chr4RkJhnZHpZEcccDmzXQvP+M+uK+a+IMu58=;
        b=Az4iMSHsDnQYUA/W0pvcQGe6NDWnjNiWDi0qiKbTS1L17Gk50QogYlM6hBFfrLT87N
         Id4V7pMiLcekTm6T1RV7msyPZq9pietjbwh/WbRSM2SWQ8C8U8ZGPH2JW0/HLYVPU2RX
         42WnVk6403CPFD/ludON33mUQfbS9R2+IC8wWdbwqxd79vKhRRXr/92VDoJ6Fdb9tTYU
         ayS5pTsPg+9j2f6Hh3TOMPTVCqyFPbIGG7z7AM9nFhNClWVRBKlz7ZDwiT+Xks6q86rC
         ps+t1oyKwMELQWCR/DZrqEKrLD1yIAzFSAUwTp6aeMnRw7YVFt6r+dY8XPEbQi/VZ2B8
         UEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUPr6JMDnWDpnC9adAC3txUAumc1vfelcrg0w0FI2qz57cqkCL+wJOBHVBDPFbC+XPr5R6oZG+do4Ce8TzPSeE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh4YEBt6uvAbNhiNVaF+UD5kP1f/ur5iU4Jvo/9Vgc5KiV0mmM
	YM+aaJG5vRREwtn9LmI2Zp4BT5vC0E6C1V/A1S6qLQDVri2FLSDQnQqDTH8t60b87n9iub9CWMC
	DujjMN7fDmXGbGunX7vRsrrnsBWocSOU=
X-Gm-Gg: AY/fxX6PlaNJ+LBo2iIAW4QRejGNWHHVdQCxzAM/XJPpr5JxzzNE3h+jYCKYfgc8QgK
	QJaHUb8XSjEHtoOwuz3AChh4b6lGbug++KJDIPcq3p9vsYfe3GsKo6Ntx6ocBD1s5es/0VXm+Ad
	4Dab//XxM7A3prxYvv69IzqmxvOKAJmAvVs11+X+vVH5XYcuSXN2SK/ji0QbxrpYeWXo7BNJVlz
	4BPnYcVbd3e0WjZnBDidJ8fm8m06lJeRrO988extYpULMWyPs6/gdvrcXVW79T++SmfDVRC1G7g
	NYEE/KYE
X-Google-Smtp-Source: AGHT+IFCWi+xcOloUMoROGoIzYaFAUJZIdqTotKSlbJ0z4kD2aXq3+J175FyLSw03roG3BWHfLUepv8zQ3y6JDq+uvo=
X-Received: by 2002:a05:6512:23a7:b0:598:ef18:accd with SMTP id
 2adb3069b0e04-59a17d366afmr8212530e87.22.1766858852671; Sat, 27 Dec 2025
 10:07:32 -0800 (PST)
MIME-Version: 1.0
References: <20251227-armv45defconfig-fix-v1-1-d7b64abda9fe@solid-run.com>
In-Reply-To: <20251227-armv45defconfig-fix-v1-1-d7b64abda9fe@solid-run.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 27 Dec 2025 15:07:21 -0300
X-Gm-Features: AQt7F2pBf0S97cd38koSQNUJhPS0_8sYhzk2OunlAUme4hgTnsZt7aAHQIzKjyk
Message-ID: <CAOMZO5C=TcDSQE6Snuzs4Ry-2qP36qDZmoDCL7qJ+UHDUgkVYA@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx_v4_v5_defconfig: update for v6.19-rc1
To: Josua Mayer <josua@solid-run.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_100735_855225_6A271F97 
X-CRM114-Status: UNSURE (   8.55  )
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

On Sat, Dec 27, 2025 at 10:24=E2=80=AFAM Josua Mayer <josua@solid-run.com> =
wrote:
>
> The i.MX5/6 defconfig has gone out of sync with some dead options, some
> removed and some missing.

You mention "i.MX5/6 defconfig" here, but this patch touches
imx_v4_v5_defconfig.

i.MX5/6 is covered by imx_v6_v7_defconfig.

