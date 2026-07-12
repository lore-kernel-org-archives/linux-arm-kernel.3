Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE28C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 18:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6YF9Ptz3U1E3BzqqGAaNIm/PU93N/xwLs3WvAhZwqc=; b=tsEOQIB2zhdsZ5PPx+NDpX8cY7
	1O8Ri5M4vbahFmhXsjVUDOF3UHfCH5Vw5G7PNviimIX1d73TyeeK+IV7T1xlwG4YP50V7M3fpcmxu
	w2QTnZy9+leEhR2fhZ7/BB0WDHkjE1VZmXV5PmwqTlsCvYygQtJlyxbQHNAyKDhtXVCyBLb/OuGqO
	+6RbFYxXl98y/cuVw8/oRsFu/xSNnI+VX/tTc/dIGUwybEtkNWheKvnrC1muWeimEHXufLWcAHY+Z
	U/9DR/+bOFPWoQ2OG4HaQBM0AN90zN3IYnPKu+V/P4eDtpjJuehnn3PNu+vThgyBfcvyQYtCKigPa
	Fy9kgmwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiyTX-00000007epF-2SMV;
	Sun, 12 Jul 2026 18:00:23 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiyTT-00000007eny-3X5s
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 18:00:21 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84a2c90e383so316192b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 11:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783879219; cv=none;
        d=google.com; s=arc-20260327;
        b=iZglgQ9404hjGFNlZs+66XZjT6dGosqm/zQGbYCqSfvooiKHiLlj11Pyf4MW2FI++H
         VDQIHtR56kvNL/yJO3QFwLgjL2MT4tMcUOG0geMejIfX6BbGhu/+22BX0b3/NdFtIolG
         33VTnWZ+N6+72XlGHAaHWPJLfs0O6QXvCnMwccoGp3emHO5khZVcpp0CjFlOMa4xzDTf
         4BukA50ulcqG67DIKB0Uhy4J0YkCrmrF2UWKxmPcnEppEEM/R0Re8OHp7nxf9wmBWqsM
         v0vPQc5/gwWFutfSIThOGV82CGbyJnMKJtvSppYmu4inYE2sIWWva0bqm1wffmNtOPwp
         bofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z6YF9Ptz3U1E3BzqqGAaNIm/PU93N/xwLs3WvAhZwqc=;
        fh=Bv09bkuKISTz575ckVTGXCk8iCNTFatoVnDW/P+iPe0=;
        b=Yx9TXou8CHAiziV6yOXx52BlW+XmyTtkO570uEQRj3tuidixtJVm5L/xraTzYWMpJo
         KxD9mW+FCeJNID57XE9oO+R6YmyzRDBBgoH+o21YPqilEldts+4t5nIQ9dce/19G7J5v
         ZaBPS4cTo3uLyyDS0FRGjINAyETbMtsLFwTteTf1GzhZK0MuMYvwRkJ/Q7v7jGVQ5eGb
         ZPJbNW8f8mOndJoiaXLwHe20tmlQUYk4oMxOBHSNOUGM2XdB6w6O9E17f+qOAyUqq13j
         HbzTPYMCdjrUsVsftjxET7t2QSYz2bJr86iEQnUOZlGMqm2EMBlZUUwfQHO292L0uYZL
         H2oQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783879219; x=1784484019; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6YF9Ptz3U1E3BzqqGAaNIm/PU93N/xwLs3WvAhZwqc=;
        b=q61bSXzrUXb8twKm60t3EMGmPF1W79I+QRwYz53s27CnzHauao2n8+fvihdkSkzTmC
         +gVcloQfapJ7dXBNZ3nbYGXTRNzbY8g2X2T6ev4bHb8aHTfBWTgE60yqZgYk+Fpc643h
         9s24wJNKg9z78LwwQVa8wnbRnh9+3yIX4QKsnY+uz3UfQgdWUllNl2Rw7TxcCJGCKBgM
         BAxDw5RTKaVfb05m98sH8YXkG9PnIRzGiikkEtLXEnPww2GA05Qyx8OjgCPmre0L211e
         rgEg/j1ouWyijS1Tw2pqK9K8zcpQ1kSe5+eSUDIA3eLWO1S3rEfY3Mf5tetJa1ICcGb1
         XEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783879219; x=1784484019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z6YF9Ptz3U1E3BzqqGAaNIm/PU93N/xwLs3WvAhZwqc=;
        b=ETRWuxDaZgzwSx9sxLl42jJE6Cq8LPl7Qt2XZFQSQL9mb4FW6Xz1wv0xDeB2n1Kbq9
         PleUrVbpKHezkW0mET4Md5f4/t0zqkgWfHAmLgev7M8gUD5u+RF5Rs3FHImnyJRw12v5
         tYSYg22MkPRusdpN9XZlwACY3irsSoqDMgpq2SEPBQK5j65V5hxRtEPOFEzyNBvl0Lob
         lMumrqN+uLKx6ovn4KCu1f77pZsQ2IpSlbfjfP+LXdbAsNndURV1GLvgdrdbuaaqpUC6
         f1iUbGcyOSRcjaCfbXtFfcJ0qHQ1I8TL/hAf2k6vEuwttRnULJ7MwbvyVfHnl1j1O7vA
         OgmA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3m1Z7qNKSi2oVgnYKqYu8MCo5ZdOyPzjgoOTOkAqyYgwusXZAdoC2UZa3fBb7V9H7BK/TqdF5h+EKT66O6XmS@lists.infradead.org
X-Gm-Message-State: AOJu0YxKYFX9krZ4kb/IvX9PkOKuyEyG37152aaCD2TCONSkI4nC/wwh
	CIefMb7l5H58hyXPE50D+8JBIc+ChpJBIqpSXST5Z7bQqo3x1JEQzJGrn11xSaG6jF8OBcGF/49
	yUdGSf44kndkX/Wk4F32pImMJ0Oi0hLw=
X-Gm-Gg: AfdE7cnQjNyCGNEzHrwuI1p/xQt13DtY2aa+rafVSd2DwWuSvI2ruBAQ+zM2Hygtp6+
	0hxoT7qjhM5ae201WPo6riHJ/EuBWsg+Ui4iVaI+TtrVg/qmGD5Se/odJeRXURfl94b0DOGlYA2
	wMfZvrEM9YBMla92FiLJeCaVJnXyKuHiiHu9ZhqNaPCRF5fyn1AIsCknXrRaSrsEJMbAGdxcFKe
	FmkCAifDih/an52pWZ/ZDwe9deFL0f1U0zHuzHjUDEtbD5qAVKktb0qy4lZaoE9yve5+RjKI+NE
	FQnEZR6jlz9aDoMO3rrCXqmc5E1Z05tFM0Ry1zFE7I1R5j3gknvDzJwZgQ+nt+Lq7pbUmmp8tnh
	39n2OvTe1ng==
X-Received: by 2002:a05:6a00:1f14:b0:848:2a69:97be with SMTP id
 d2e1a72fcca58-8488ab8fc78mr4988265b3a.10.1783879218918; Sun, 12 Jul 2026
 11:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-8-422675a65402@gmail.com> <b9a5beb6-b701-430c-b667-44780736dd89@kwiboo.xyz>
In-Reply-To: <b9a5beb6-b701-430c-b667-44780736dd89@kwiboo.xyz>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Sun, 12 Jul 2026 20:00:07 +0200
X-Gm-Features: AVVi8Ce_3L_f8KZWdaCv0iUnfK1E_2A_iQtzLV2gceK6YTWldORZsT30D6eKJVM
Message-ID: <CAPSPb=t=jZke2pEinPvJ4mbxKMF3hSqMfx3GMjEUT6N2FEyygg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 always-on from vdd_npu_s0 reg
To: Jonas Karlman <jonas@kwiboo.xyz>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	diederik@cknow-tech.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_110019_881432_21435697 
X-CRM114-Status: GOOD (  20.46  )
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

Hi Jonas,

On Sat, 11 Jul 2026 at 01:24, Jonas Karlman <jonas@kwiboo.xyz> wrote:
>
> Hi Joachim,
>
> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > Since the NPU is hooked up on these the always-on isn't needed anymore.
> >
> > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> > index bcb2f5d63a61..463cfeddf270 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> > @@ -258,7 +258,6 @@ vdd_npu_s0: regulator@42 {
> >               regulator-max-microvolt = <950000>;
> >               regulator-ramp-delay = <2300>;
> >               regulator-boot-on;
>
> Why is boot-on kept?, NPU is likely not needed until OS has started.

I am not really sure.
Looking at the other rk3588(s) boards, they also kept the boot-on parameter
when the always-on was removed.

> With PD domain-supply the regulator should be enabled automatically, or
> is there some other issue that requires boot firmware to enable this
> regulator before OS is started?

Maybe some Rockchip people can enlighten us?

I haven't had the time to actually test the NPU. I'll try to test it next week.
So this patch is based on similar changes done to other RK3588 boards.


best regards,
Joachim Eastwood

