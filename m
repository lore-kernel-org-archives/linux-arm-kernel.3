Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCB9C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 01:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nonWuzicTCeYBkiKvjrnS+sct50ruoIlfuFduwj3gS8=; b=XsQDbN0pWF7c6A+/bSAyrkCw91
	gNfrpDaMFsGQuO9pLYQz3mo6Qrjb40714VfyNM0CNy/EYq5querqtBDRbwg3IEZrgG7LAcwaerFYB
	e9+JFNLzN/s6lIopHgD0le20nyFA7B4XHMlKna1n0CS9exCy2jwywMoXoi04DfHvHTuIGsuUqjilQ
	ART2by/h9zwn/JG9/6hvbQmibQca11plmvQjN5bbTUNfvPGkysUOEq2Vx40k3txCtNb7lM+xow6t2
	R+vNb2EBbo8T6mzyP9kkd5nwfplZmaZLESqI7ADYn2aEDhK5Kl8f4ByV9R+4r9aZHSoqOFVqWUQyq
	PP1nsHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70dQ-0000000AOPR-1Hlv;
	Thu, 17 Sep 2026 01:09:56 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70dM-0000000AOOA-494o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 01:09:55 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-8692a856865so249422b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 18:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607391; x=1790212191; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nonWuzicTCeYBkiKvjrnS+sct50ruoIlfuFduwj3gS8=;
        b=pgcFPWCjOISjuZRQx+WG4wXhX7LNevtDs2cT+ux14AwPaB/3o8xaxW1CFICtHpdWpC
         0oGSePGLIxr8T85tJWk8TUN2ghsG0BPdIecHObRmhB/YZbTEgfaVwonpwfehj1/6EbmR
         AP6gG07OVyUYA2pdgZj6Aaalb8CuPaYW32q2MsFAW7wgVmVTLt7ttaCxWaVYfsu5yyL6
         jS0A/LKnMVQ2O9chZ51p8HpMC8EwOMiy5forgpCd8JBISF4BesYc4yt9KBmgW8YB8Egf
         MVUzdTznPnMIc4rIALj23Xk6StwxQ4AfkCdHN3T54uJLFYHmrCuH2JBquMkgVQF//wwp
         t+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607391; x=1790212191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nonWuzicTCeYBkiKvjrnS+sct50ruoIlfuFduwj3gS8=;
        b=SV5LYCr3lxlQGxcDZ5AydAAzwY//fWIDNGZWZ4CObp9rtlaErswTNQD7+0AL58j1oQ
         Ut7wdPXMB5bXixYpQ9KZwCCXdpstgcGCX0LmXxu0ajUbeu7ynBvlfeBS8rff96Fpb01x
         z12BClcfvPlkpU9LCpZFWLxEKz4O7zUHtGheW/TsXbBVvzq8Tgeu8RV1XDb9aG0e2VXb
         Qu4j4ZCSwE61rMGKMvNr9krOAdlPXhjp5ZQpI9bQQE2DtIQ1nwroAi4qRCV96SgOnYuC
         6pXQb85czDRD2KtEYlSy5ZTnWBTyQvBw+Jgg+uBqqC2QK/4scXh7NTnypO0dmgI191Nc
         1ilA==
X-Forwarded-Encrypted: i=1; AKwUvByWPLjfPknsLSpH5U42VgyncPF45usDDP5LzS+37UOsO1YINLM+CNyM4XOwpq3fjeVpHjx4KAgK6zTDq9tS93s1@lists.infradead.org
X-Gm-Message-State: AFuF++ncjHj9DDJAqRAFk+t+VoC7wd335dj1uPd0/bNg4TqaQ1Sgm5eY
	34ZfDPBw3AzbOHd2YBafCCKUlMFMGeiBV+KvxsgZIGVABsZbZLi1QFAG
X-Gm-Gg: AYBFou3OrE/AdkgjXgZlZwgb/qgUMfaY86bwM/hdWYOWwrn3M2oIzXamPMKy31KIhDs
	KdY4MPa77ts765Zhe7QIYtAl6TKFzaJhgiLuwRPl0MiB2TpwEAcBVBw51YsZhpOBTb6qcFWX5vU
	y8wT7Fr4QgTckXJFxZwiT3wLSdsWp37BNQtqN6CHqPpyQYGoHo6hLEEf0QTZHCSD0sWgjxN+6lB
	4XQ+7f+tbhWwqOqWS4xUBeg17yiw/SJaJo0f9Q1DHESvOADMO9Zz4/2swGy2sGHWYieaSSlT8TW
	k557TNLsxnI5UYSc/AgFq+AiNY8YeHeZeHQP5axJhpLevdkzdn64R8x09rSWXolj1tbxgz/tmIr
	Oz0OGbnmSHrkruAvn51iRgxu30tMGjI/7w8bN2+rdcHWQ0zAr+fF0nn+s58P4/qvAWi1yqiNrRw
	4RtkOYAFUoX2hZrIoWy+RG9/HDERxDqf9dPDqahWa1RDSuS1AQ9AMbkCCER/EfnqMriQAv0P4Q/
	hmeQTs+Nd63
X-Received: by 2002:a17:90b:2c88:b0:39e:26a7:7aca with SMTP id 98e67ed59e1d1-39e26a77cefmr11932602a91.23.1789607391606;
        Wed, 16 Sep 2026 18:09:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cfb0b1sm8545272c88.5.2026.09.16.18.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:09:51 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:09:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/8] dt-bindings: watchdog: Add compatible for
 MediaTek mt8167
Message-ID: <f0ceff89-4fdc-4d93-8e0a-26137e1f4279@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-4-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_180953_020215_35E55070 
X-CRM114-Status: GOOD (  12.31  )
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

On Tue, Sep 08, 2026 at 07:38:30PM +0200, Luca Leonardo Scorcia wrote:
> Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
> which in turn falls back on mt6589-wdt. However according to the data
> sheet mt8167 toprgu is not actually compatible with mt6589 (it has 14 sw
> resets instead of 12, and its reset bit map table is different from
> mt6589).
> 
> Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
> add the IDs that can be used in device trees to identify subsystem resets.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

