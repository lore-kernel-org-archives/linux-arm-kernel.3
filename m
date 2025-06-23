Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE12C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eio71w/pYJ//+HPI/HFvrWn6wFXbMzWKf+fC/EVlazI=; b=BmhDAfDtm92spwmC6QJEMFtDtp
	hEwgohAXXrleYDFeImc2D0ulPsQphYRm4U+HyVymi9nM89Zh0IkkkSc5anuuT7GQo0sppKuXu/XgE
	vfKIWs//vCxsrtmwCmzaWiWHUpokTJodimCsiAftEGvW/iAY7AWz5TrcBwO6OH7ADPaOdrEi53HVU
	ZuT74PJrsK/JF62ZG+1/Znu8mqTXIQsIiMvyYiuucJ/dae4Lvw8Lr7XQBOeQJqxMV9ogU+lP0/5mg
	i9SAlWUYCvdSw07WFwHFsTfTKwd67jwv59RcorgxEv01+EEc3b1YoSEUcZOQLF/BR4rsHt5SAJ1pL
	9cFhe+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTklH-00000003Wz4-1Wnn;
	Mon, 23 Jun 2025 17:15:15 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThjR-00000002xlI-3Hj3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:01:11 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5535652f42cso4425744e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750687268; x=1751292068; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eio71w/pYJ//+HPI/HFvrWn6wFXbMzWKf+fC/EVlazI=;
        b=UVMere4EGH/f67mzCU7Ap90UH9mvIiJhhlA2cOmNIyMqYcA97xTpk+LQq95vySkI+T
         gJieltg5UpwS6uEmwreQ9UULBrgovCZHQPMpMISWYCb7DXVG5M4fAJkl1FjmRQRbFCYq
         bEwt5mhJ//R6ncWEdiLaDSUAoEPJqnsyLHQ3KKn3/iBWBlb3wNGiEqM4+cqS0w/HG3RP
         b6DHnr2ZVOCQ31R0fgompR4jUmcvHrCPy+I4GYcQ6S26t2MfFCimQ8UCgvYDrjWn6AYR
         hd80GjpWruG4M/m01JoIFW2TbyecClpwB2i2Eo4az1ER4CKhQpLYDDIIWv/rXuNhug5M
         Ob3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687268; x=1751292068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eio71w/pYJ//+HPI/HFvrWn6wFXbMzWKf+fC/EVlazI=;
        b=kn1v7/rqRqA+gYvytKwBq2C9Ez88Doj2ksGEkqrb27ZvwBFx89W5E88RJXlWqqyWMV
         16TbhJMOLozFjgNB8G5l6JxzNzPuJnIXrH9llIOmgQFRJbpzGR/Ovv4ZS/2bvOyoFRcB
         zyXzJWCf7DuHQaa/B6rtFec0p/1mPL0PVjdz/dwKY+BTQ4nbJNE/Mk8F+DTnz4VeI2lZ
         MKB4AqNrn2dMnRIJp625HHJYSQe3o9DYI5NqVeYFgrAtJLYN5Qanjh+uXb62eVv7kgjv
         9Z4jD2mfV1A2eW0NipnKeg8t53lYviN/YT/NmqzW9RMT1AGpYYDwgofKVkWKPA4xob8d
         mpMg==
X-Forwarded-Encrypted: i=1; AJvYcCUvTuiQY4/bsSbhGO/mT19kOGlM/7C15wfCOYxHtzcZ5b1OM/H4ZYCqYt1m/yxlhwUxjUlUAbHXMDD/JkKCiil+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5UIHIyw4H6Qfv3ZzNpcf0QMlOB73aUNEZiX4rrBJ0Kx0y+8bL
	Zfba5XEqTpI/iASgItlajmmR6SxFxSMShj8r8NOx61v3dL24Z7jl13ALyDo2WPD+g98SGZSJxTJ
	sCWk0vBCTDQguzMluYsgk6FrCQ2q5P18=
X-Gm-Gg: ASbGnct2HEFuHlkv282w5G9EwKjdbP83euZkyVcIUp90q3DfQ+NTXmkD2BDQQcEQQJ6
	j/9PIhL626N+i0cCmyogIng1PyLLl0aZfYsac+cg7Y27FxNqsetw3WXwPdlJoLYd+PUYbMx59id
	DC8/5ArLZ46KnOv9Me66TicjDTF0n/M6dU4++jOfLvNYcLNXkTHB1m+9iCONN3FUzYE32HKRX+m
	ek=
X-Google-Smtp-Source: AGHT+IGR9uZU02Z1imHj7MAxQiJrfcrFgQl4Iwi1qMx4X/39RI/yLTLvi2E9TpExz966iw2AnrUaGavuIu6muZwN6T8=
X-Received: by 2002:a05:6512:3ca6:b0:553:24f4:872a with SMTP id
 2adb3069b0e04-553e3bf9f18mr3657639e87.40.1750687266759; Mon, 23 Jun 2025
 07:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250620122353.150700-1-goran.radni@gmail.com>
 <20250620122353.150700-4-goran.radni@gmail.com> <aFVz48C3d+HHVHvv@lizhi-Precision-Tower-5810>
 <00cf9c47-e101-4335-b918-f0b3a3c71de9@gmail.com>
In-Reply-To: <00cf9c47-e101-4335-b918-f0b3a3c71de9@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 23 Jun 2025 11:00:55 -0300
X-Gm-Features: AX0GCFty6Y9honVX8KF-AR5BMA9uPsSpLblXjl7-3v4sjeMadYrJm6ZLkkE2tuQ
Message-ID: <CAOMZO5B39pBzWuXBoo5=eqQzZLxS3zBxCJw_GBYmABKT_cdQww@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
To: Goran Radenovic <goran.radni@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_070109_827773_F33EB8F7 
X-CRM114-Status: GOOD (  10.85  )
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

On Mon, Jun 23, 2025 at 10:17=E2=80=AFAM Goran Radenovic <goran.radni@gmail=
.com> wrote:

> I was using git send-email, and I did not notice any problems with
> dry-run. I have 3 patches and a cover letter. All were marked correctly
> v3 0/3 - v3 3/3.
> Everything looks fine here:
> https://lore.kernel.org/all/20250620122353.150700-1-goran.radni@gmail.com=
/
> Or am I missing something completely?

I only received the patch 3/3 in my Inbox.

It seems you missed copying everyone on the three patches.

