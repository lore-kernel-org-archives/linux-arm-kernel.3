Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6551FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=; b=DF5XbriEV2O+bWuOAJgcaGdJA8
	FXp+PVXxo7a9qp6UIsMuLYUlSQ6FT7DfwLyUpKS3sOCKiaylzG7uROuz2ci406CgMkN8WwsW3IHhr
	+c3veksTaGzC8EQteZO32N+PErBHIBYR+CDTft7LzmYzjzZjzO2p4v88RPJ3ga4C+xIy0R+nHHshN
	KVpoI5jJ0UZ5WVqdoqTF6SpreEgCKGmd8R14wkKtYjYMxQ29vJaAw79TXiEZ+5w5TWoo+bD16Od5T
	1o9p1W5G4BlmA3ofAGSbrVMP2vJ5JWbNLJlvInPm3f57A+JzGWRXrvKbiSB4fdYzTwpD16ht5Y+D7
	ofVPg68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBYM-0000000Flo4-3cKD;
	Tue, 07 Jul 2026 19:33:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBYJ-0000000Flmx-0srI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:33:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ca7aaa4b85so44168145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452834; cv=none;
        d=google.com; s=arc-20260327;
        b=LKvBP3QKESiVG0HAGs5qwcmb8vGR0zX+vY1aPD4TyFeBCQp4PPnR2zjBVToF5TBrVy
         0n+UEm6ncR6iny3YGz5HfbwRFrEqIgMhH0D3IQmVS1hEpZG5F3D1e3IiIDl25jbNq9mS
         A2HwXzPisaUA4cuQ/va6AZByripJg9M89aPdtmWDPEakt3V53ZdE3grdkfCvh09L8bJ0
         IYA+4OSgG5DHYXoqrZ2uza9xJ/4QEA1Mhucn1iM4dDBdPd423LMYkfkcjZuDDXDU1D61
         GmDyAST2V8oOdo6XxP/ZSon0B9BnjSRUTGsu8fn5y8snIPxs7TGxpkGNZ/qnwdonLSU5
         qnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        fh=MJacz9A8jFgSQr3RxJGVPHYU5KFberfVrj9BR+GHiqM=;
        b=YfoVzjkhN4gi8/ANLa2KGskUm7TeS8xqqIzjRM5gmbtYR/1bh0sJgQEKO2zCwXR9g9
         xQ4l9DUtlqv2vTozHYn2y9OWhEhUSONHQhJxEvdH+V3UNJaYMxgCkFojbDbAPb/T8KsV
         Qu0epOQqvdpqUejPTckWVL58hOfulESMwyA2tJNjzDH2IxFCsabIkCulazdGh1ECu5YE
         p0JG2PMQTkB+5lkkQcmnoU/7qFn8UpDATFyc4ghuTbmCG3LudoarLffGynKJcSZTf/cy
         37yguJdlHG/XqLR1g20ekWJ5btI5DB/H2b+vRQeyApr9NCx/amprHYmlSksAadRwZ8gV
         wKIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452834; x=1784057634; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        b=gUGCgq5+TCusR+QLhid3SipeLavCLRi9cQPfcioYSBSHXlOeJDGZy5V5lJotMYpl8c
         DEFUa7TDmU9xSzvBLTDJhezMyFrLgKS72ZyUPyHWbt2UG1LWqdWiDSCOu5tllF8cqDqb
         YOYBMUwB2VRdvlprxIW7tkOmtgd4f6x9978IaWrLFAMYKiRmlDeyJT4bpW6K/uRJbDHo
         TsfL1OqA+tCfUtaBgLqrf8LXGBdMkkDMcRWQWgiiBVjROjr1+31Vnd0QfbGS3NunO9XV
         /waoQBAAKwAoWqornJ1165iJs/YCmKbLLQeceFCKORp0b+lbxrPu022MiIQ9IK3liHM1
         mOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452834; x=1784057634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        b=QNEWP+fbDGJ1scnZvuY7ksudZBrRlgXXKpaHpyhrHDHijkyj8P92lMgcWMDWcFS6JN
         HdGufXe8Uff5Jo77k+Pwp0c4quHWo8BSRn438DDul9FKspDizGQpzdGsV0Exf+XVX8j+
         HmOqoSLFtIb99B4qq84egl62aQt7/fzM0ZfrkFtp50OEkeZ91eWh+mQEYQCa0i4cIDpx
         1tfKbjjNoiq9J0A4TWEPEvM8I90v5zDRhou7pGrnRbKELP8zQyfurxhLj0JVHZfs8LWl
         bvGCd1BAvyS8RIoSPlFmy2fDJ568gYNWUyngc/QA+AuoblX+w0Yu6AtxV2Jv0WZxYJam
         TjmA==
X-Forwarded-Encrypted: i=1; AHgh+RpCFJW8301n/21An7FDPrTYr4iv4aus4Y/e17oVXh29qIWGKhDSHBiVY4ZdbKCrYD3GSp7vckeaz/vYdDkq21DY@lists.infradead.org
X-Gm-Message-State: AOJu0YwBSB6yU7iuWDninsu1KiYT8DaKh15i1KcwrxGffkkXSfi6SGYc
	FLXU+BFS02uiA2ZwEmJQBRAQvBwI3P/DE0WjRUMPaWfUIsY4zeQdqwa8z5GuIRDGyD09+0kWsG/
	Jr7tMYA2jQg56BdJcSM/Xi8NhQrJ3I2VYaa7h
X-Gm-Gg: AfdE7cnT9Hp5Ub4gHa/WavgVf+GPOTe06+Br0CQcHMKw1iAkUMPYeztUmXV7FKRUgJQ
	UUM252UabizMBKshUNKbXh3ZRUiU0VU4jybz3N7zl3fU58prUInvT21IzAy6zoeHL0Ld6d4UG2X
	pXyNr7T+/Yjviw7xDhmFpbU8feKPlVZHF//wJoFbJhf4zieNHADJwtMx1VnwwQ7iP4z5ccas2wZ
	Nj8T2vDGpJZi2M4amGbhjmn/RLbt1jjfuw4v6iPy0iC/r8eUpF/vfPpYZm+i/sAbkNLp01kAP72
	2VfxatNVlSktYGA3JFTeCQlaR2NQ04eCTxho
X-Received: by 2002:a17:902:e88f:b0:2cc:307c:51fc with SMTP id
 d9443c01a7336-2ccbe722438mr59133075ad.21.1783452834318; Tue, 07 Jul 2026
 12:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:33:42 +0200
X-Gm-Features: AVVi8CclFQkx9s_G2Hys9qfZAMuAY5MfDBKVgSfmmojs2V4cbQk8rdJWoP8wXjg
Message-ID: <CAFBinCBbRrt6jWj4pczE=-j86Sw2aiAaBpUoTx1x9XErw5NFpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: xianwei.zhao@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123355_252811_5B3920A5 
X-CRM114-Status: UNSURE (   9.32  )
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

Hi Xianwei Zhao,

On Mon, Jul 6, 2026 at 4:43=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
[...]
> +                               func-ir-in {
> +                                       remote_pins: group-remote-pins {
Can we keep the established naming:
$ git grep remote_input_ao_pins arch/arm64/boot/dts/amlogic/ | wc -l
37

I'm worried that adding IR blaster/output support at some point will
then lead to confusion.


Best regards,
Martin

