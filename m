Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2583C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 21:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urjJV9cwlFxNv7KbCDA3FefKThqBp2XiJBexrbouUOU=; b=v1wIe6tkclTQ73LVio/ph9hKKT
	yxnlJlW3rz5+ibm2zaP9JX4iywU82IF5jjVmFclRfM9/QX7wwIomxh4zcab4RgAjR2J1ysq5tTy4K
	kRi1vdsBxKGGR7cxbNI+ijpCpl/Zel8QATbPgKgm2DOaTKjeftlmMO2jdjcvYnU2nUDcGx+dZyY6c
	6zDQh1uT6EDGJyPsLnFmWdjR1deTW3eQ9FA95eGgZILBLblALvQ4G7qytA9KF9I5Upi865gl2skIL
	tJiO3g7oGmGrQ/F5DO3bAbjnKEaCRjonxNAJcLs+KHGUo6cbyLgHAnY2K+IdcAk97aMnmvd1gtSKw
	rz+M0aOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9U7Q-00000009XGs-2LYA;
	Wed, 23 Sep 2026 21:03:08 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9U7P-00000009XGJ-0Hbq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 21:03:08 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398c066106cso854188a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 14:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790197386; x=1790802186; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=urjJV9cwlFxNv7KbCDA3FefKThqBp2XiJBexrbouUOU=;
        b=BrgVxa1xzq+pOq3Gu/mw0aU8sZazg098JJ3rHkDUjcgcgDC7M4c6eaTZMo2VCKSdpi
         Z2nQLSrGDVPV1htvzfB3IUyQkPnX6T2p1u+f7G+5JPWKyzvyMbXCUS9iSKQ/LHnrnNwU
         C4PDO/MsB5lzhv9tW8JQ11Y027t9OozuWaUIBUu1TNIK8Lgf3bSuaK5AMez2gnE1KSAh
         VWTIX+6fJTx7bYKGtPuKlYX8M3r34HMrok7KeuQCwWCsG9JX3C5Za4GjLH+cbxEHio3X
         DwSz4sGCL771V3IXhjA5JKcWR3+Q3pAAz30KSUyfpZQZKzUPBq9TP7jjblkYHnsHG/iR
         Rx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197386; x=1790802186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urjJV9cwlFxNv7KbCDA3FefKThqBp2XiJBexrbouUOU=;
        b=zvMY2R0yIdLbEfJzTZz3oLCOTqh4pQ0BzxvLlv+fQzmqcnmQPAcDUqZhTY5JpV4QFZ
         OO8cIxz1ervig6K3kewepKO/zWDS/2q7QuhA3LmWh9vpRsreReS1tDRAbirh7l/wBpmK
         5ttm5CCdnWkmag5ZOupA1JLfoIiCJK+Ap4T78JroMl8TvC3CdtPJiejQ79mo1yXv7/P+
         Vps4fpuh78xFl+eBWF5alhGI6d2znN6TMsyU0HuPoerDEHH5Cvvdu9FciVd/TWE3sTHN
         X629PXaIBPkmNZQQS30sFhZcffn8WZwbw1+mhkMaPntggcvqwzrwTM3RQ+J59MdMTx9k
         q7pQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWlt8LODBdAZSgGAveh0hjbPb4pCC43ti1N8ECW48AnOo1wFZWY3ayUvvBcuj2UcO7b64sXS+TLk+VccwHWm3Z@lists.infradead.org
X-Gm-Message-State: AFuF++nUdePVNgG5st5sD1zlv73Qc5Am/t5XPc2/JQvIxaydH+tngMdP
	pd72+lnr1dyriuEAca+pQDpYJbxIiV5/vDfY4NExGYNJe+2y9Af9sF93
X-Gm-Gg: AYBFou3TH/fIb5V8MjC8m+NSDaIqSmzq+nCAvQMbWRgiX5NLHvpkmY3Kjqil3x8AA4l
	H0UErO8V7T0R+NN9k1MxUhuVv+d7pKNFwSpDo2JXoKHi5XjbKVa6bJ+hrDVTtxBFbKDRRCtDJCo
	xBMNqbhn9im+dX56GwxGVND5kgGsLL+KYGLigLozZLGAe9Z2BYaM6r5pi9Bj1dS7S63pf618Kf+
	SVOWY2f62u4csLAoPnlytEsYo8BczxJlt9ch/ZGS4G5hLJf15bnpxLiLDJGiR1S9LpWc5iMyVO4
	XGDX7gUr/qS8SoGVJJDYrmxaWLQ76hlJUvnS4QazZrl4QZ2JQdd6wII991seDurlkGYvflTZjN8
	wCEIF+9ZwhI62X01XzGR7HK6hXA4PIH4/L1x9cjG89yD+Pl5Wv6PQlGUkPxVu/Ay9zjI0u6Ifwj
	XmCzEVb3NDgRdmtkYjJsbNm8gueQrfJFjOMIkI8skxgVle/IP3YFArrXwkhMF5UQEY6xXBneROv
	h0wta3IAPN4
X-Received: by 2002:a17:90b:4c82:b0:39e:6c68:1552 with SMTP id 98e67ed59e1d1-3a09896ee0fmr243012a91.26.1790197385901;
        Wed, 23 Sep 2026 14:03:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972b15f1sm848270a91.2.2026.09.23.14.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:03:04 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:03:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH 3/4] watchdog: da9062: reset board on watchdog timeout
Message-ID: <10de1304-577b-494b-b8d6-3792ebd1bbf3@roeck-us.net>
References: <20260923111719.2032012-1-primoz.fiser@norik.com>
 <20260923111719.2032012-4-primoz.fiser@norik.com>
 <146c3502-3205-43ce-9d1c-c58b936d160e@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <146c3502-3205-43ce-9d1c-c58b936d160e@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_140307_109744_A7807FCB 
X-CRM114-Status: GOOD (  20.12  )
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

On Wed, Sep 23, 2026 at 02:01:03PM -0700, Guenter Roeck wrote:
> On Wed, Sep 23, 2026 at 01:17:18PM +0200, Primoz Fiser wrote:
> > From: Andrej Picej <andrej.picej@norik.com>
> > 
> > Implement a method to change watchdog timeout configuration based on DT
> > binding ("dlg,wdt-sd"). There is a possibility to change the behaviour
> > of watchdog reset. Setting WATCHDOG_SD bit enables SHUTDOWN mode, and
> > clearing it enables POWERDOWN mode on watchdog timeout.
> > 
> > If no DT binding is specified the WATCHDOG_SD bit stays in default
> > configuration, not breaking behaviour of devices which might depend on
> > default fuse configuration.
> > 
> > Note: This patch requires that the config register CONFIG_I is
> > configured as writable in the da9061/2 multi function device.
> > 
> 
> Please reword to something like:
> 
> Implement a method to change watchdog timeout configuration based on the
> "dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
> SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog timeout.
> 
> If no devicetree property is specified, the WATCHDOG_SD bit stays in default
> configuration, not breaking behaviour of devices which might depend on
> default fuse configuration.
> 
> Specifically, "There is a possibility ..." should not be part of the
> description at all, and "Note:" should not be part of the description
> and be moved below "---".
> 
Also, the subject is wrong. The patch does not "reset board on watchdog
timeout", it implements support for "dlg,wdt-sd".

Guenter

