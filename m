Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633C0D715F6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 21:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUW+Nn1xQDwW+fDL2+2weYSRCbL1Ugg4lN7x4qKedq0=; b=sRoCYaBdSaWJv9t72klQVl8cqd
	eIE/v2O9OCOd3BSYh7WLO2jyFAyFSjwdnOp/KbZBqtrAP8DPNVJubg2qPDg0GI1ErEfm/fEYcnET9
	2B2biLzqVPzBG9O1hOftxwSOLp8fhY3VRLcn/vVTJoyxa1zc92I8De125VdwaGL1tN5w7UBXy1NxN
	3nFoftU57p9YAyoRoGLJTQpR9QNycvTHqya8ULKWd9x5iz4Ica4kGmCoCzyxOdYTOLq17lA+J/p+P
	5U3FnDE1fvIaoAwHexAGxYszzZVtQvQbC1YSsPOaE4tAhn4q9ZBqaGGsYT7gClWssMr8B/l7z3Snx
	ME19mjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjl3z-0000000AcAe-1URI;
	Sat, 24 Jan 2026 21:20:59 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjl3w-0000000AcA1-3tUz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 21:20:58 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-385d75e1a79so22594751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 13:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769289654; cv=none;
        d=google.com; s=arc-20240605;
        b=f77ryxCtmKZeAfDQQl/yUQkeKIzTHqxGuPXYLjmrKLW5j3vO6s/ywlXp+ttq9/nIrk
         maTz6JstBJVJl2ba+VMjYtSWkISgd086yvm+Ya6xMfp2xThqdxDsAOF0FMaqiIHkQczK
         j0aJ32f7FcrPsLdnLZRb7msEyVONcNBmnXMqvGvhUefRuVJVHxelI7cdBVid2eHzB1t9
         4a0Gh2DdNhIZjUriRgk5YDMChhqIXUixS2RMPmhmXY6GdBljgQjj1vfirN2QoCf8S/aY
         1NKRDIfiWuzR+oIE8xgHmxaR/Lzib/ThB0ncesXQQibsgRjXG4+L+WEcXfw2u8+K0K0R
         3EVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eUW+Nn1xQDwW+fDL2+2weYSRCbL1Ugg4lN7x4qKedq0=;
        fh=eppm20a2XYpxbbK5Uy90fIxpKDoSunjPwxu0qo2zrWI=;
        b=Oo3cYU1ESNLeK00Qw1js6FVdPessVU2r+xFEwJDlGfOBTR8lypr1AEsnV5Gh9zolNP
         sQUCVBsI76IMVX/DVAEPiqp64efJDR9VE2iCDVvYl6zuPSS/BkxmRPEnTAK1mkzy2AHL
         wdb8evf6Q2MZIi+MGn/YCuv5DQA8xsgS/PxG8+wK7LaysCUBv/GHFLr9we/hYIXBLeie
         4SgTcz+Bc1sp1o2tg5+WUbALRQ+gmHj4Ksly6V+gwRjK8XUMv8jJibPBzSZldjnKB3f7
         53/v1DFBL82U9HBrUhN4Fp9JM0V9j3r5jVGTkLJ0+AWB/h7wH81BQF1mnQMw8RHJni0C
         heaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769289654; x=1769894454; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUW+Nn1xQDwW+fDL2+2weYSRCbL1Ugg4lN7x4qKedq0=;
        b=EuYiTQ03UoxFxEkgPgxxg0TjqMiDYMAwPRw5Iz+XLcAg14BVIdy6C5fcmxK0C7pk2Y
         G1QArz3rfvTguONOozY5IsDdjcYnONaplBPqQVPX916teWB9ryoqhdnohyI7T9eFoszw
         wUe4ne7SwzlWrUhVA8ciNt26ecAmn/OGj/0Gf+8a/SGt34J0Cyj2NSTqnvlas04fT8QN
         siaypGRU3CecCe9Lje7w2P5pGz00FMsiPyDEHNjG/r4BOAjdV0psPaMz2tDORuZc0vt0
         cttHUpNoYZxfjAUPajx0pHy6JI8PPuLC53jKpR73myneb2Y6FbJwE+YRoHYMgiBO1VWV
         ArEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769289654; x=1769894454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eUW+Nn1xQDwW+fDL2+2weYSRCbL1Ugg4lN7x4qKedq0=;
        b=NFHGey5Z+d4TRcUTituo7Oowt9sAwT7pu+49dysy6D4mpClLd7GUwHH+P7eVAJgsuo
         FHDPty/u6qATSmX5zO0KEZHQJAszg1EeI8xl9fy7vAvH60KbPse9/BLoNuPtw494+6Al
         sbxwKwpJATkyPO8RAbJR4oN0PIl3j5bBWSxZOJTRbk6GJtfhrLDlZXgkkjHEKoNtaCV5
         9CLLwbgW9l3FFgwiyzWvqtci06hqyyAiNCsq07ZgqMDrOyY5oSU16pzwa3Bdl6ISQJb/
         5hCZ8taJvJRes6QNvlNM6aZuia+sosL9Va0sbS4VL3A5KZk8iJFriYbyo5STTnsbxlQJ
         Kp0A==
X-Forwarded-Encrypted: i=1; AJvYcCW1u9hVPYmWqRCw+gdV/guqZ/Hc6QUfu3qAO+cTAPdAnmQXFaIS/l5rmp4ZBdZiEbAGcIcDsmS/lm2SF6iygwcr@lists.infradead.org
X-Gm-Message-State: AOJu0YwmbK+u836fDRlDUTy80KknL2VEsH1Yq8lKXe9YV3yO/YND8aJD
	JhAW6aZLukDpGgnlqQicN4WSDGu3TjhClCnOc6SEK5qC5tx8pCLt9CcV/QMxQbw4yAIOymdxNh/
	B/pijQj6qYU6ECAH3741hzL2Z+I2e7HM=
X-Gm-Gg: AZuq6aJQaPvho1SveojmiFGm4lSY19aMjLESV/1H210pT8EPtNKs7oBYrvffUN6xCwS
	MQBpUI+sZIvC5oM4aq8CRg9nU3cnvXu6wtVFunAbyJzd4xtCmcbhOSQfjA5LxeeG/wepucYq6de
	c0csxf3ofQ0LY5bNNbU2QY1m4rHrzrHIF7AxyG6OqpEXUaCWsiN16ou7K/o0zvBXOPc4FVQX5IJ
	QFkTTFkegmzp5b5AnIyVqqbf9nSt62rwuiP3DY0JcqmAOqu0+AGPa5ngK8Rwfe1z0meoryF/iLQ
	LUb3PIlUpiPPCJGaWaz8yx2JhBr/pjGSrFC1
X-Received: by 2002:a05:651c:31dc:b0:383:18fb:fdf0 with SMTP id
 38308e7fff4ca-385fa18a1a7mr202501fa.22.1769289654024; Sat, 24 Jan 2026
 13:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
In-Reply-To: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 24 Jan 2026 18:20:42 -0300
X-Gm-Features: AZwV_QjYUVpRsQS5aWPwAi-rYkpNXVxY9EFDkrf6zt0nUDYNEKpxxlUFDNbm7q8
Message-ID: <CAOMZO5Ag6jtVqeXW30QNy5+1ykmGTt4G8DxcsyOUMvNaeJf5Ug@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
To: Jacky Bai <ping.bai@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_132056_987544_28E7185B 
X-CRM114-Status: GOOD (  11.76  )
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

On Thu, Jan 22, 2026 at 11:51=E2=80=AFPM Jacky Bai <ping.bai@nxp.com> wrote=
:
>
> On i.MX8MM, the GPUMIX, GPU2D, and GPU3D blocks share a common reset
> domain. Due to this hardware limitation, powering off/on GPU2D or GPU3D
> also triggers a reset of the GPUMIX domain, including its ADB400 port.
> However, the ADB400 interface must always be placed into power=E2=80=91do=
wn mode
> before being reset.
>
> Currently the GPUMIX and GPU2D/3D power domains rely on runtime PM to
> handle dependency ordering. In some corner cases, the GPUMIX power off
> sequence is skipped, leaving the ADB400 port active when GPU2D/3D reset.
> This causes the GPUMIX ADB400 port to be reset while still active,
> leading to unpredictable bus behavior and GPU hangs.
>
> To avoid this, refine the power=E2=80=91domain control logic so that the =
GPUMIX
> ADB400 port is explicitly powered down and powered up as part of the GPU
> power domain on/off sequence. This ensures proper ordering and prevents
> incorrect ADB400 reset.
>
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Shouldn't this have a Fixes tag?

