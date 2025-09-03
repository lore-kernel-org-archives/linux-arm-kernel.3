Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8C5CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zvbg028o924LlAp46GQB2tjDgAbUJlME1N2hULgcBJ4=; b=erJIAxwAQr/kyy7vd+rdp0fEbg
	O96xvYJsvprL5i4J2TPLFYL9jDFfBphQ8d5IBCsn/pZnB8IWOvcJWgU98kWfTWemUPWLfqoeL+d28
	nrNhOwE1qv8ACOkPtRormYVDvydgStnWb2L4xovOTHmza2npJRSQqvDRv90F3v4LRzxhwmONdRh8C
	GC9OnVg5ezfD8qHsKYn+LaZyM/Edq7+cU/ln5iR5QONSSVm/mRBSq/dR4oHlO2EC83GaxS8SiHM05
	9wrJXCkc+rXmQWvB8FK9vxsefPdkxZqW/EVJi6X3W5hJCdsyxCVeZkMBWZPMRe3jr5LLsYEYWMEwP
	W1bmsuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthUj-00000004smt-3nPo;
	Wed, 03 Sep 2025 07:01:25 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthS2-00000004rek-0BSQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 06:58:39 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso3285494e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756882716; x=1757487516; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zvbg028o924LlAp46GQB2tjDgAbUJlME1N2hULgcBJ4=;
        b=bwwnybX7a4BMGw24wnS/KLJxbET8kxU5Ks4ZUj+iNIDi3XNVNEY7SQMWwN3E63WL3V
         xa1VVwW9Ej9QlCXXxwdX7fXmOqLyOP8oGRS3+NoCJX1CA+9QrVSmAdnLkfD5pKbcqcqy
         edvGFjkZIi3OkPKUjCfbonI17i14Sgh0xSxO5cBEza6lklzUf4bllJL/uvrHOmogHerx
         PO+CaM5VrBRkE/+0jh3mv29QnDkKWNCmm4vwHkyUpFGQa1UdMCNVrA9nRlqDIemH2j7B
         oJXEA5sLAL8Z3DIdRMxEla2/iBiMMl1MCn9KyMNdkfWDzggg1AyJsKv/WqyLL+mQ0Z8f
         LkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882716; x=1757487516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zvbg028o924LlAp46GQB2tjDgAbUJlME1N2hULgcBJ4=;
        b=aiCDS6zJyhrih6ZDTfMx5xR40jwpkgtuBLbcymmHPUQWxtxJ7i1BV9Z37qNdM4nqxE
         Ixox3QbFLhK+KRUzl33rkPh1W2ASAyOTblJ/UxaCSB06mI1FJ8/BCRXsuxBLXr05t1vf
         sPk16X62Aw08h3QDbdH31vu48g30VVol1JwIi+2RaJRPLupy2FYPW2gmhEcNe6JuEYjA
         sae6jyOOkgf10V8fvnOu+xQ/b4PY/zSUK7I70nAjIwKsTzRi98/AXd/N5sFilNgZoTrx
         gnfXvrJFdHgSeKvwrqSkMz2chI0zWO0WcypQHHu5ORBO1nhl706ALUXNbl0jpulc8e1W
         1x/g==
X-Forwarded-Encrypted: i=1; AJvYcCVdasZ9f4YvczeTVG5J8MpPKeSjuBrTO5A2uHyQksPmDDlHlQ5gAUiQJdvfBgLciLdYxFhGfngguPXUHyX+3dfM@lists.infradead.org
X-Gm-Message-State: AOJu0YwcGJpMGNS4ibjpAU23qk+Pa8K298usKoKSoHKlXVMmXGQWc/TT
	gkbscPubaWkIi76mgd8P1ozA/drb6dDpkIlM3lZEV2smfc7BfC/wIFjaPU+816Sel2lbxZk+a/a
	Lk+qPgUjE44sz87hhBZyD5AxGpTkFvTUg9CkJWvlvPg==
X-Gm-Gg: ASbGnct02mmioR9JCtocaJuL2NztgLWiLNZPcTiEFwLFQ6hB2In0hkDSPiddddJhcjb
	Y7DHvQsDFTPWO+yWWT4fCqI3K8phMWpOnMBFYX2EK0MOc45Pa6EoJRCWDFILr/kNSH5sa977Yc4
	rX26mN0Vxv087n9ONJTH7G+yrVbZKqRNdK05ORGzxREdfSuIGJME/m/0QRbdwWq8B/yiCt64cU8
	hk1VMlDn2GsEU763g==
X-Google-Smtp-Source: AGHT+IH3GxfscI6GGSr/NNb7LHY9u9DqMXt7p2udpQ/Pdohy0CbQd0xJDDE+ctimHiSeoPF/quwYh4dzc17DcEr2yUM=
X-Received: by 2002:a05:6512:6702:b0:55f:486b:7e5b with SMTP id
 2adb3069b0e04-55f70995c72mr3489756e87.41.1756882716285; Tue, 02 Sep 2025
 23:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com>
In-Reply-To: <cover.1756372805.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Sep 2025 08:58:25 +0200
X-Gm-Features: Ac12FXw-cperMlNMDgWs1JD1q73qBaU6s0VdFIuvSNEdtJCo3HZmhANsMkTdUts
Message-ID: <CACRpkdb8fFvgyWPAaP6AumwHUYhnvc7BXX0V5kwO4sts6zSGUA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add pin control driver for BCM2712 SoC
To: Andrea della Porta <andrea.porta@suse.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_235838_084695_81A9B4DC 
X-CRM114-Status: GOOD (  10.90  )
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

On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> The following patches add a pin control driver for the BCM2712 SoC.

I have merged the prerequisites providing .function_is_gpio(),
do you want to do any last minute changes or shall I just apply
the v4 version and fix up anything minor in the process?

Yours,
Linus Walleij

