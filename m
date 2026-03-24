Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF9AF54AB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DRTw1k/Deyd3qw7jRPAvPgHwcdUHnkDo3iNQs7+2Vs=; b=di1OZOxZIXWgk6M4QuBmzaRzvQ
	s7ERlyIIpd3teIqEfxbnRNpSOmRHlQpCuJBX9HORObn8M0x0F3xh2QSPr4CES/flj2TJFzXMvLm3v
	NSU65LPyPduR0pjPwB694Wg+gSZ30GIwSsM6DpxCFY8MIY1pY33rj5ORNKp6aJo0QAsMqFwPaGkms
	UuymBw+HW+mFUEWW+cjvlKa0QAkkBu40qhrE2gMNDrXUqlWUFilqvvwGzg9Rb1i7t6eqfh+yiQ0xc
	qBfr9K9sLc3/k8DKEWJtHVw8ffqpuKxQtiiE/Obtv/Y9TBOrjjwiQrXpfB34X0rN1lOd+fs+ChyoD
	RrIxKfXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51u4-00000001YNQ-2eTZ;
	Tue, 24 Mar 2026 13:34:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51u3-00000001YN4-0KNY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:34:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b07069e2efso8466675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359278; x=1774964078; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0DRTw1k/Deyd3qw7jRPAvPgHwcdUHnkDo3iNQs7+2Vs=;
        b=eT6oCzj1cjVrdD9PaRAZKooK0B+rWiXB1pRoHn/sV7W2aYk2DAcrdR1ciPKIe8LoK2
         52z/e5OBkZGMzkhe4Q35JGvcT5qSnMNSI52q3ZrlKrHMyc0nyDMJfU0YUI9cQBHu+/3/
         tyDJNDINVDJ7DrMw1FVikMUWE1cT2jNkV3zlGr27wDOxpFWS2QmtPIid+YQ0526iiAcm
         iVFEW6AQ0ShE2+YWddZNnWtOSVcviWh+3JP5N3DlSv+pX2NThktafM92Igc0fA3vyZ9Z
         h6rQI/4uaaWuoIWmnTXLSzjsWL+7BbrrKBqP72IbA82nzCKvLxJN+G6zYZxCd6EWmUjc
         QLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359278; x=1774964078;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DRTw1k/Deyd3qw7jRPAvPgHwcdUHnkDo3iNQs7+2Vs=;
        b=iWun+XdNgGpzVV2XE+7C6t8LIBoFb8+Uy42bfxZuVrPN8XgZqzkyJpemZagCWRE+zD
         8eZaRZYNZ/xW4mKWH/ifuKRDx9u6Y6FldLE00SjCUmiLB2Vk6FpSfCrkPA7BRIEp/xxn
         aQWfNOpkUKMECafw/eqbrL/BgXkyUW+un02mIioP/sI/Yl5RYqRKSEhpf3uw1MJSgip7
         3BcNI1/iYU1mZhLbCyJGDXzULA4e/hH09fF0S2vKuS5FLT6z4SAW7ndcZe5hUBLYCNrG
         i08MsmE7pwmiCmP9U8yZC5bwIZpT1PDTmJWBa8p805K3IoyhUeLJodDdHey+7qqeZCzv
         kxjA==
X-Forwarded-Encrypted: i=1; AJvYcCUkXMcUZ90xlrk95UGT4dhjyc2La06LEHwAxXZYndV3m1Bd93S8OV4kddN+4EQ9FU7PKd9OdMqTSFkdM1aCpHAJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwqEZMGG75vrnFWtCPlxiDu99yuLJ3ANjR0m14qZvvDMpOFaFQa
	nvu4/i373pWl9gq10WBordRzFc4CHL8232nTds/7ylu975C8BUB5qTs7
X-Gm-Gg: ATEYQzxES7GggcNgQNYas7K3ujyeKOwIWKI7rQgndpek3fvm4oemtekdD9s5goEIGRH
	kXI16K+x4FSOOI2pl/Puv99Gg11vk6UgbmeeSj6x2G6TYgD/LsdukYvex2knkWoQ6Ddi0l/uPeZ
	H8M8CF6AUbgp4Buj2xHd5jIWLKepPvXK68whmJQPEfTgVmqGUjckuzz9ouv4dJivFgxPvtpDmxY
	qCj0kucl5rGwuMN8QHlHZuEhLsEjDDSJc7anQqdiptW9qucyO0HoQy9QN6hdZFj+MRlMPVoHFkr
	siZVvvChdtkDxdHUGOlNmf4uUswFSHr9h2zVd4ff/QYh814K1HHmezVQbulfpn0cXgSQzfCAGSz
	Dy0FMCUaYYwt4T7Qx8edn0W+foyH54DQn9qT0nW0jnkTHwnrE3cegz/l1qg+kFPb6y3Pf1QfExv
	4vSUd7JX6ZstsPEIl+/g2ION2H+wDiqQGnwSWrtlNRFZCRpuyaCzV/GWM8zBQ=
X-Received: by 2002:a17:902:ce82:b0:2ae:47c9:68b9 with SMTP id d9443c01a7336-2b0827ea2edmr157633805ad.49.1774359277914;
        Tue, 24 Mar 2026 06:34:37 -0700 (PDT)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366b5besm148426185ad.55.2026.03.24.06.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:34:37 -0700 (PDT)
Date: Tue, 24 Mar 2026 19:04:32 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, rafael@kernel.org, 
	daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, vireshk@kernel.org, conor+dt@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, simona.toaca@nxp.com, d-gole@ti.com, 
	m-chawdhry@ti.com
Subject: Re: [PATCH 2/2] ARM: dts: st: spear: fix dtbs warning on spear
 thermal sensor
Message-ID: <acKSzjiPNSbcpKrx@toolbx>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
 <20260323133814.14152-3-krishnagopi487@gmail.com>
 <20260324-smoky-radical-hyrax-1274a9@quoll>
 <cd3400ce-295e-450f-b650-6715142ccbde@nxp.com>
 <5a9f84fe-5827-48e7-8e4e-699cf8ae4776@kernel.org>
 <acKEJrB6vc9wfd1k@toolbx>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acKEJrB6vc9wfd1k@toolbx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_063439_156304_8C71D378 
X-CRM114-Status: GOOD (  39.33  )
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

On Tue, Mar 24, 2026 at 07:00:49PM +0530, Gopi Krishna Menon wrote:

> On Tue, Mar 24, 2026 at 11:01:05AM +0100, Krzysztof Kozlowski wrote:
> 
> > On 24/03/2026 11:00, Daniel Baluta wrote:
> > > On 3/24/26 11:26, Krzysztof Kozlowski wrote:
> > >> On Mon, Mar 23, 2026 at 07:08:09PM +0530, Gopi Krishna Menon wrote:
> > >>> Running DTBS checks on st/spear1340-evb.dtb results in the following
> > >>> warning:
> > >>>
> > >>> thermal@e07008c4 (st,thermal-spear1340): Unevaluated properties are not allowed ('thermal_flags' was unexpected)
> > >>>   from schema $id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml
> > >> How is it possible if there is no such file?
> > >>
> > >> Did you just add new warning in patch #1 and then claim in patch #2 that
> > >> you fix it?
> > >>
> > >> You completely miss the point why this change is needed: how could the
> > >> DTS work before? It could not. And that should be your justification for
> > >> the patch, with explanation why it could not work.
> > > 
> > > Correct me if I'm wrong but I think there was a hidden bug here 
> > > 
> > > drivers/thermal/spear_thermal.c:spear_thermal_probe:
> > > 
> > >       if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
> > > »       »       dev_err(&pdev->dev, "Failed: DT Pdata not passed\n");                                                                                                                         
> > > »       »       return -EINVAL;
> > > »       }
> > > 
> > > So, the driver was checking for the correct property as pointed by 
> > 
> > Yes
> > 
> > > 
> > > bindings/thermal/spear-thermal.txt but the dts was using the wrong
> > 
> > No, DTS had two properties - correct one and incorrect.
> > 
> 
> Yup, spear13xx is included by spear1310.dtsi and spear1340.dtsi both of
> which have st,thermal-flags correctly defined. When working on this
> patch, after converting the binding, I ran dtbs check and upon seeing
> dtbs warning immediately fixed it thinking it was complaining because
> st,thermal-flags (thermal_flags) was written incorrectly. (Which is not
> incorrect as st,thermal-flags was there in the final node but there was one

I meant 'incorrect' here not 'not incorrect'

> additional property named thermal_flags as well which is not allowed as
> UnevaluatedProperty is set to false). 
> 
> Also I dont think we have to override the st,thermal-flags property in
> spear1310.dtsi as the flags value is same in spear13xx.dtsi and
> spear1310.dtsi (0x7000).
> 
> > > 
> > > property name: arch/arm/boot/dts/st/spear13xx.dtsi » » » thermal@e07008c4 { » » » » compatible = "st,thermal-spear1340"; » » » » reg = <0xe07008c4 0x4>; » » » » thermal_flags = <0x7000>; » » » }; And because this check is wrong:
> > > 
> > >       if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
> > > 
> > > people really didn't notice it.
> > > 
> > > The check should be:
> > > 
> > >       if (!np || of_property_read_u32(np, "st,thermal-flags", &val)) {
> > > »       »       dev_err(&pdev->dev, "Failed: DT Pdata not passed\n");                                                                                                                         
> > > »       »       return -EINVAL;
> > > »       }
> > > 
> > > So, this actual patch has uncovered a bug! 
> > 
> > Yes. Driver also has bug, so probably was never working. The point is
> > whatever commit is doing, the dtbs_check warning is not the
> > justification, because it was introduced by this patchset.
> > 
> 
> Please correct me if I am wrong Krzysztof but should i send a seperate patch
> fixing the thermal_flags property (Not connected to these converted
> bindings)?.
> 
> Also, is it necessary to set additionalProperties to true? I am not able to
> figure out if that is needed.
> 
> > Best regards,
> > Krzysztof
> 
> Thanks,
> Gopi Krishna Menon

