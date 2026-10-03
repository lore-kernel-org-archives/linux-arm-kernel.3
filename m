Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD48DCA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfcvLuUEPFWe2mOv6aQ2IkNlSkoxsO/iYToWb+ipXsQ=; b=WmYDUDNsVrqCqVTJWON0Z49OIc
	O61u9/4/HYFDa6wk803vskYt6rRFMIZJVkohsESVtbGTsP/Sw2Q1SzEGoY7C/7aYxOGWWCcut/oWK
	gC1bD0zU+GnM+NJbTE12ATFoFi40K2FlsyHVNu5K72MyOY501lbkhhIfcmCje2oXpsmEMqaMrSJo3
	yOtXsAy9ZsD/lajpby7pPDFXXLApZ+8WdI+Cc9Jsd6oKcZQe3v5g1L2JexHLxjqHjiVd1b4G2aTaA
	jMXCssyBDIZnivxLSyb/tDTMI9J9mmqsh0sxZlPz6bgD+sR455Jthfu3if9bF2uk2dX6SFY8626XZ
	TtOFZKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnHl-0000000Cm6M-063w;
	Sat, 03 Oct 2026 00:07:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnHi-0000000Cm5p-1iS4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:07:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso468765ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790986045; cv=none;
        d=google.com; s=arc-20260327;
        b=M6jQJqLHks4AG40sv7f7LzWmbl1POHGNj1um/xGDBihEcZkLv4e+sGXAXkdsXQvWWh
         mUfuyQQe8V2RpYCQhWq7/jCACBDInA5yFw8eDXjU5+0Ahba71p5dnce+YqejKaXkpINP
         448ILjeV158Rhsy590PLlJocTSZYweRjk6gSMwQEqwLPsXEfHdp+Fe3LzCrdLThv8VE2
         PY9hKY8cHtF75j+dbmLYMTphtRn48L1xJgFwiDUDX28Lq+Q8rCQzbrPydWGtvqyzbfHq
         gpF6274hiK1UD+q3xAnQ04+9wp1gbTVh2KKAmHAPo1zFN+e104bAo0y66t0u4cCRdCZK
         O9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HfcvLuUEPFWe2mOv6aQ2IkNlSkoxsO/iYToWb+ipXsQ=;
        fh=p1S8iL5G0hTpyzb6jV8+992/IqSPKV8YsmSjZSLp9g8=;
        b=i9+9Onzzhd48EpsU0pSuRjEGz9jUitmAUEUdyC+m4CJnzngGRgzxY9hZUF3rMCh47L
         G//xYlC4B1rVXYzXW3fCy0B9wLUVTcmdmRjZR4j1PnWIP3FadNddpzqKN5tPv0UCL1/w
         8P61bE/4L16VR90s69Z6jpxn+2E7tLbYVBz5jHrUPfMHvpgHhprSTp+LrQqAEaOqqatU
         FFou+7pHsZNW3rnwj302JoKlzrlQWmJ8MUu19ZHl/78vea/YqOn5DqylasWq8/cTZHup
         EA6tTG4LOUwUDfISJmlC+wjBhoa2UP/rejAQ3xShkmkidd21jlzAR7kzR4B0qCxKTKxb
         UKuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790986045; x=1791590845; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfcvLuUEPFWe2mOv6aQ2IkNlSkoxsO/iYToWb+ipXsQ=;
        b=SkFNZD0MkFLd8S95ykJeqa4W+rlXTwKoqZiuQ6+oLp0M4+sbGur6/QGfKUHlcZXkIs
         ZeJzBFbQF2+HfgIRXWJBS2dNH33TXgRGfUEM3eZW04YAUzeznEEaR1b8ytsbmDf/xG7K
         0dgORmnkQZQqYoZuQTvV/749xGI+gq194sySPMSnFbZpfh256Y1fRaepVwUhv5/n4gtd
         5TJ+5lhrUw6wuMO7LYkHd5JtxQCz0vpHowmN0cQHqxaJCp731mvsPAeTH45cs25BzQDJ
         qzybt7wcFj7ddxUY69GT0l4JoXwAzZdrG8X+3fuVhccRWHBcucC6HJURTiOACpOLZIxx
         8KIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986045; x=1791590845;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HfcvLuUEPFWe2mOv6aQ2IkNlSkoxsO/iYToWb+ipXsQ=;
        b=TnXrz8Oy+IgVYQpf4ZQn+JUJK9FFRWu1urKU2bVIhtG3WiieJCyhO3I5lMzqfD+/Bq
         w+B49yHO0tMmZZfm0kUGNE7Cq9DndvqkRqsWO2V/Sd5ZtummMV2obtxYD7pbJnZmCVoG
         7cFC3CQUMtPfrLgkwnmS9mDifXXnd9PLiwVk5u7GHbwOAUnGLfR1JmOCnLUN4XStcHdl
         duzpHxBOFyCcmmie+ehneQEjab4p0U4rGF++774ihGh1FRNLJxkVafiFb5KbPA3RAmIq
         EeK6kXeRlwxCEu8hArcwcusmREWN9kDnA7vE9XhwyBDTTBQv3yHqvk1vdRJibeiI2Nz+
         5Bsg==
X-Forwarded-Encrypted: i=1; AKwUvBzkJWElu5aMT5HK9+VeejUG+Zpgqy94V8Dd5Q3JIiMgiErAhpl28lvrN5ajOBwIFIbnYbv2uEtvYMrGZY1ymeH2@lists.infradead.org
X-Gm-Message-State: AFq9FYJGYk/RjWkfhzJ4M3HNcjdnMQYhzYqVQKdocRtiJE8uWcpADhWZ
	Dhh2F8QrF0p0k1DhRhQFFQxeiIIm1SNVyzirfpyZ2Wom29XN2gx3QAKykhSFx5CJg8ysJH/MBOd
	ApN3HtAXTWM0tak3A87GQWNBEE3ZRhQ8=
X-Gm-Gg: AYBFou0t/Y5ms0n3l8dpHj2rV+lggy/YdIYH0SPg10WZmowaoLWvg9WbHTYfKIj5sLT
	iFZzv/xbkYJycXVCyAy6hCIuQSZXTXMuUUUsFFstzEpDPYZD9FTwRXU5yzFrey0WPZEM+xrwyfX
	g5/JM43dVYR1GwXr0DahjeGjQpkfetC1xXUEyE/SeAFg+v0FEF1GLF3Jusaw59rw1ETqACaUNRi
	k6YifHAaClZG/jT9PcVP+LawQPXa1jH2BM/Y75xwEOHmnFIj8FRInhiOoJ1MZLjD+Zg2Aq71mbS
	QVHU1yRYJ0E5glT2Gb6zkeLfwD0K0WdFQJbdH+aUM4wPf+lBa56iWmwILAlwfHMenEzJy0xS1aR
	pCa+ryEqc+7bKlSU20lxUb4mbYtb3hxU3S0nbqXUx2wyjTWcJI4S1sZ/flIFKMTAGv9Jy9SJurz
	xsLgO0FueIh/ZTWwJgWPKc8+T4lg==
X-Received: by 2002:a17:90b:5108:b0:3a6:e5ee:52c with SMTP id
 98e67ed59e1d1-3a7877615bcmr603948a91.63.1790986045194; Fri, 02 Oct 2026
 17:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260811041934.7609-1-phucduc.bui@gmail.com> <ar_fLAeFU4rmrwiH@willie-the-truck>
In-Reply-To: <ar_fLAeFU4rmrwiH@willie-the-truck>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 3 Oct 2026 07:07:12 +0700
X-Gm-Features: AclHuK-xDRj275wrNIYauFmD4ArHDsq6qQwz8Qk8YquS81RnLrT5xbVpnSPRvtE
Message-ID: <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ lookup
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_170726_477367_BBB831E9 
X-CRM114-Status: GOOD (  11.01  )
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

Hi Will,

Thank you for your review.

>
> Not sure about this. If it's optional, why should we bail the probe if
> we don't manage to get an irq? Surely it's better to continue without
> the interrupt in that case?
>

platform_get_irq_optional() returns -ENXIO when no IRQ is available.
Other negative return values indicate errors, including -EPROBE_DEFER.
In the case of -EPROBE_DEFER, we should propagate the error so that
the probe can be retried later.

Best regard,
Phuc

