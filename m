Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E21F506D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYH3+XpB4a2gyPrlHeP5QGbRc5PtadVy9tM/LQIg5+4=; b=XAcA1gKAMSl3wxvBPxb0vQJ5bZ
	KwXlymoVcYxLUtoubuyMxKY4rTUbrwSyPgtc+zl86jHw8xQJ++WLh/+yjnzzVEtibu+lyR3jp1St7
	NaAR0dT/6++wFlqYa7DsHFHN5J4osiZ1kgKmi/sxNaoCRRs3MH/lA715o/theJRdtpkCRDK/0D4+g
	gbie3l4H7zmNpmZP6kuVpvjB0XRTcihHDP7jb0Gie5rXJ6oLGCyqF7KAHbAr7i1CK55L1GJ2UfXyp
	qT+M7390m36dtLMhNcjNGKiweJnT7ocwZrn0+0UHvKjsb0TZz0a1E2Vpgb5NooF9mX46Iz31srdbI
	3+SS4tXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Ig-000000046Kz-2bQB;
	Mon, 16 Mar 2026 13:48:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Ib-000000046KJ-32mR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 13:48:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3183E43DC6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116AFC2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773668881;
	bh=wYH3+XpB4a2gyPrlHeP5QGbRc5PtadVy9tM/LQIg5+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WNO2jL8UFzemSHy8wKyOjybG6A894XcF0Mr2GP7xDqXNPhfOewmTjnPx7+dGP4vrs
	 AAAg+o+rCVE+oYluMYhs8V6q8ink65Zdp06Pgpm3Y4fU/gEjrhAiXx6U89U3c04v4o
	 ovj7CQf3bgi96NwiXcOJIU8SaYv/It8CnR0P0BVraes+pNig4RILxO9x/zrkSGMjod
	 G5/Lmgw1hbQFo0DTTf58Ii4olqXzCxbpOPGFlgCJh1JtZ3Z/UYu5YSis8HNlM0i6GD
	 A/5uQI5V/YN2/7DhivuV2DteoZVmZHw84/JEEAPWUGI4TjIHytGU088MpYQEpRa19N
	 Dc1Ert/rh0oiw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a46260385so10566867b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 06:48:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVX8lERcrRcBz5Ch+OR4pTaCyg1p++VrxtMtP2tmKhuWegLqV0+ifFwzXhCgd1aMv/SCHhfyTR7UD1NGDzrEUIK@lists.infradead.org
X-Gm-Message-State: AOJu0YzXCCw+ZAcOuCQlvFNGB/BvJulapyb6ai6KFa02X0p8j+XtNysf
	z0l144vG9zffLKhK6cjwzIk5FA9kYfIMgBuFo31w3+o0Lb1uw18GtJnRMc3BA7EktMp9GiOKqxc
	sT737XJ1U/KhUbhQpzmifgasGdjwa30A=
X-Received: by 2002:a05:690c:20a2:b0:798:6cc2:69c9 with SMTP id
 00721157ae682-79a1c0d0184mr99248767b3.24.1773668880274; Mon, 16 Mar 2026
 06:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260312113040.68189-1-eleanor.lin@realtek.com> <20260312113040.68189-4-eleanor.lin@realtek.com>
In-Reply-To: <20260312113040.68189-4-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 14:47:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLmyGNR-242npzHpENhXu7mmuwfLf=ZnoFnfKECFdinS2Q@mail.gmail.com>
X-Gm-Features: AaiRm50SIXiDQuSs2d8ukotnHyL489fbFBxqS63wwvx1B_UNJFo44E1ehctETTQ
Message-ID: <CAD++jLmyGNR-242npzHpENhXu7mmuwfLf=ZnoFnfKECFdinS2Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: pinctrl: realtek: Improve
 'realtek,duty-cycle' description
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_064801_791839_C2D361F2 
X-CRM114-Status: GOOD (  10.25  )
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

On Thu, Mar 12, 2026 at 12:30=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> The previous description was misleading because this hardware block is no=
t
> a PWM generator. It does not generate a signal with a specific frequency
> and duty ratio.
>
> Instead, it provides a fixed nanosecond-level adjustment to the rising/
> falling edges of an existing signal.
>
> The property name is kept as 'realtek,duty-cycle' rather than being
> renamed to strictly preserve Device Tree ABI backward compatibility.
>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Thanks for working this out,
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

