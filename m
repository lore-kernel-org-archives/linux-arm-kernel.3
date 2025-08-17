Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019ECCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 22:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AR9IMnY93Ea9hjevD2RhY6NAfKavG0y3XJMprGSi8GY=; b=ZksNTFMP3fpMTijI9IZKzY6z+S
	W9HLBa177w0CpyhQLlmTfN08yr172Sm58eaZqVDePF65f+WmnOKlewQLK7V6vtow1IdbA7AU0q0BZ
	NBsVuoz4PBFBSXrR3HQIZV98WtB3uWhFUpl1+LBxIsAUYHP7e6T2P51XQgv2xJLkHUL97ZVmIq4bd
	Q7EZoep8KZhl0KvGE4OtXDeAEGDckw4ebf3cuvvInFeOtJawOMdJudE0URGhS6Lx1rIXb0cOIGAkI
	DgJfCm4RhZbBca+BhefodnK5vKaS9emIi+mcw44QZjY/sjUyyNTpktC66XJm8fhGV1kG+xXATci3c
	QOCjhGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unlkq-0000000672p-0vYz;
	Sun, 17 Aug 2025 22:21:32 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unliH-000000066st-3dQj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 22:18:54 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32326789e06so2768790a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 15:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755469133; x=1756073933; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR9IMnY93Ea9hjevD2RhY6NAfKavG0y3XJMprGSi8GY=;
        b=SlAAD42pxVTQjp7PkPeFL+Or1foGAsF9os1nuJpvcWmtq/iUoavDX+F0gwqjhube3I
         W+I8o+zOSpfs4avzu31hIcMxSfpTOogXulAa6mo9xvIq4l4uXHfdIe4TF64eMxGGMMxu
         vuOWzjm6+N81BrJUJNaxU5HiZv0PWIC3dlV2X2UBCGBjS8TkzXdIQjQFJZKc78HnZkuM
         mjDC76IOm1qnNyfaMwgVuOjnCsRTmx1v0YrOgsXaHE8pIHES84akfqJZ6jymWLQ3rFec
         gU9+Ae7TK4XB/6Ah7H7s6hYZ6F3BkFjRfdagDsJZOtinfgSzV59dTyFR1D/s2D54IuW/
         ct8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755469133; x=1756073933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR9IMnY93Ea9hjevD2RhY6NAfKavG0y3XJMprGSi8GY=;
        b=fSKWOh+bgD4vzUlQq0NkZV3Jf53gDJZJBV1ETAWpKvZ94zAjY6daBrEhJp4thohYtD
         vY6LIODE/PP3x+UbSVMNTob3++fcvvVbEcNO0ydmNe0fojpEqdL6Ji/y8eSP+/v+3mGd
         70RwuWXytjl564Jv3EuKdFzCR7C/GAwVBE0WYqTXuHrojuWuLRhmPzOElwYMq3GqEktM
         kV5RZ41uFn71RrwWg84AfIpm/5rZUml6B1sr6KhQmriOP3TCn4YxOTlhaTywRVi2mhdz
         Fdrk+30UkE1c8bKWHS5kYFJS/bgPJCEyCpYFkuRMUpmxiTN4WcnRPHEFN6KFg30eQ4QD
         Hfmg==
X-Gm-Message-State: AOJu0Yys91Ad0BFRKae9EyXiNCqitPSiZd+hp55byQ9evWYO31qDPAq/
	qQKqggc09GyMvtEBjtDg2Nt0p+hOZJglZBh8s9v5g8odIVcGTnyWmkfnz59EIMOQAO/z2Sb5S2Z
	acEK0dAV91ffQu/eWMcqnydKFIUkHZQ==
X-Gm-Gg: ASbGncsMJv2DxPn6QM4iKIVb0BnCE9K/egN4Tb5esIEJ1n1MlAAUfXgTZiAYqspltUB
	2H3fDja1MqygVuwKsk/DO99UC8WIKB8asisCHg24e/gFmLxDCtjRshxpIBpGRjYJEGzP0+zmcb1
	pYY53AMN+NuiC2GcabPwywWhR/vKjhim//fqk23gWmubYD3qkNt2K9+4PUsmqxCCn+AWu2tWqoN
	06rz8B/VU0bHo+cZm+OtZzEbNtUnuGR+5jHgQ==
X-Google-Smtp-Source: AGHT+IGaLw27Ljz9znErL/wXlKrmw2vVvXcybmvvEgz/5LXcZQr8XHkjzeg+8GuJGUPK4l3BPO48YVyBvFg6Txiap80=
X-Received: by 2002:a17:90b:2d4e:b0:31e:d9f0:9b92 with SMTP id
 98e67ed59e1d1-32341ec09f9mr14945541a91.14.1755469132784; Sun, 17 Aug 2025
 15:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250723224504.70862-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250723224504.70862-1-jihed.chaibi.dev@gmail.com>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Mon, 18 Aug 2025 00:18:41 +0200
X-Gm-Features: Ac12FXxNZsd_NKVMb232yi7NEU5fcTyLEUXrOV2bg_aHCMaU0qA9kYq92dWFaRg
Message-ID: <CANBuOYoDXtH+9svKX6WzF4GOhEF8dgxLiFE0wwo5SWfqggUPXA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: armada-370-db: Fix stereo audio input routing
 on Armada 370
To: andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_151853_909662_508E737C 
X-CRM114-Status: GOOD (  17.23  )
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

On Thu, Jul 24, 2025 at 12:45=E2=80=AFAM Jihed Chaibi
<jihed.chaibi.dev@gmail.com> wrote:
>
> The simple-audio-card configuration for the Armada 370 development
> board incorrectly routed the left channel signal ("AIN1L") to both
> sides of the stereo "In Jack".
>
> This commit corrects the typo for the right channel, changing the
> second "AIN1L" entry to "AIN1R" to enable proper stereo input
> recording.
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/armada-370-db.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-370-db.dts b/arch/arm/boot/=
dts/marvell/armada-370-db.dts
> index a7dc4c04d..a9a05d826 100644
> --- a/arch/arm/boot/dts/marvell/armada-370-db.dts
> +++ b/arch/arm/boot/dts/marvell/armada-370-db.dts
> @@ -119,7 +119,7 @@ sound {
>                         "Out Jack", "HPL",
>                         "Out Jack", "HPR",
>                         "AIN1L", "In Jack",
> -                       "AIN1L", "In Jack";
> +                       "AIN1R", "In Jack";
>                 status =3D "okay";
>
>                 simple-audio-card,dai-link@0 {
> --
> 2.39.5
>

Hi there,

Gentle ping for review on this small patch,

cheers

