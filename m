Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E82FCDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=; b=DueuOLHsg3Hiosz2qF018+s+Ba
	aBKtY3MJNOWvDIbnQRafqesTjPlmiVKbk3Pel9zUZtuPZ+BY/lMuR2TVKTZmvEtMWX4gdg4GjNe3R
	xQ2nER3U8k7eSbp+2kFloRINoHT/A9mnbK/jQ/O9nWGcHJ2q81CzaV/OxyDEYtrHFYoWSWnumKsPI
	3Pp07OnP4Bgo9gpAb4TnCPltID2xyHp9zHmU+xa1uh8MUJwLmewDbB5jQx9yAH2Pzb7oI6pwyTsvp
	AUhst2NY7ka9RqXz+bUo6nXOH/isqppaX7cZoiU8OhMFp7Y9bEUF75p5yA0GhZSNsWEY30gJi2q/W
	Z1+LQ+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2cZ-0000000Awoc-1zpA;
	Fri, 26 Jun 2026 09:13:11 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2cX-0000000Awnm-1Q9g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:13:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-697ce8cfe65so1203984a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 02:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782465187; cv=none;
        d=google.com; s=arc-20260327;
        b=aiBu9mBF/MTtZczVu44U3r1bsPHJp0PdLMiM1JMTaJAGPQAKTSOaYkLdE/zbZrG2PT
         FoAjTJR7WYg8fbYUadD5axM0rKtTfMPiRXSGIBOOgQMrIb71UJlWElbLKOKYM+94cwNL
         UfZ7c+spPsRqadEAhbC9G6R+xNtL/x9lX0mXCll+4gEngWrlohEzaDLI3gTmpclgJHSW
         ZjFmZ7MO/xketpIQ0ITyGgCZ+rWMH5dLv0xVo06vQMsBsBvNXI9OkLWVJpeh70oQkYy4
         l/M3WCcSxlw3gGWzd9hR71VpnaikrPhyNzTt6/jAg/JmeIT+nNIFgb2903PvUnTXWIKf
         qcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        fh=jv81HdMqMDRGpT1xLWiZO6xoK65UAiYnmwLjVALc3pM=;
        b=cdMzEED+5pNxNGrd/yDPsS/c0yhx361g1DfUFwXxRXgDbhNUiB84nNRyQBpc51wCFg
         ifA606fAH353ubgbuFpQZgpR2mKOFR7E2nqnNCrsvoqJklCx+WjfiRPRbRbId2UvvCJD
         Q3oy45xNFMaeQIWYMFzoM4LDlZjHGfI3uOA5GKMZ88mVYfS+BJGeL4IVLwu3I/zuve/Q
         EYtiPU2fALrZ1O7DMJDa2uGSeKl9NByBsv489mar3P6toVHiCp6ti63xtDP/mTnE/zdY
         i32Nm9d7iiX9haVf1sYqMiroVAnPwurmPz5jbXDTfpqG4O15xHVvMiZ6LParc6fYO/94
         xhfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465187; x=1783069987; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        b=owOvVd+Dj9igwUZJsrH7H8Bkvjr4RFaGXZ+xr/z+YDLsrfDd5BzJ8qo6zoCW+oxdR9
         YcZ6zAq3uPvhE+25WuLhwuU0vukaxSKqe6voGbIa2wdgFTXmz//X3P+4DnB4Yt9y06ZQ
         tu6iV7vBTiBrageSgtK33jwIK767jS3KwdglMRyQW+OspBG5goLMO1HKCoEm3Z99Sb4U
         WJbmAXU9Z6CEIiPYpjMGiYWq+szJYZVY9DFOrofh8nE8q/+G4nyUTsQq8/YjJpZxkdzb
         ybOx7TJRGmXIGggMXGXpqbyQc9RAt6+YpBk/8OP1yPC+EXvxx0rSL1iMw5cjgTz7VqtR
         OQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465187; x=1783069987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        b=P5IRo0Y0k54sZu1mBvp0sVuMiG5QJL+KTmwHcwxYkkvx00TXMgbWxdQ1zBSWz7/nhQ
         VPNhBxNfLD+PLQP2PsstIYqItjHM3wztpxU1UKhZ1lVaE6bnfte4JPdMSqy37o4q9LxL
         xGJ+IQw/GMAPybsszLIKuayvp6OShJ3JB2YypyAPCModVZAT23k/D5ivcRqWpb2Un3XV
         Sjvtn4siyU1GlEeK4FhH22SvJfIF0aQvaozyTUBtY9ED4r6H5wjyW1ru0AEZQX08QANM
         itaFunDGKZkmkSnfd40DT8ZoNLRab/JRt+89ipYnVsWi+5PZpA53PaHi4J9UBhgjflP0
         VuSA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+oLMvx3AUVO2ezdcY6PrYtug5blm0AKMjefnlWsh1GGwPsGr5bKWmPdPza2OevCuwha6vxA8hO9Rb3Zx5c0oO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyly/YoUERimKREQWIa3Sao5cQ9dL/u9JXUHNsehm6TIwoh1DbU
	BWqOuP4ekT9peWLsgNmAkMue7a5vxpGHcnqcuCG0QYqKkbjledqVaWv2Q+xq9SFfqa/ilH8WXDH
	BdPFJOxvZOXxq0otjLcs2xRawA7nJAsg=
X-Gm-Gg: AfdE7cnxtMBfh5sxt6SFthf4LdTiCfVV4zq6qNy/1LqCfqduQxEAQ6h1CdMI5j619r8
	FIVdnnpz8ZwcczmBUHG/Ap1Gc8khCVuo+LMPPxWNXGYjoqFcl/ixVNIM2WnmPU76EUQvDuLoEOW
	PP+z0SW5XSjwout1Xgzy5ow6W+vI67yDXCDEIZwfp6X2Biqq5TvUY37kEK8UYLRXTx3dzJTWsg8
	OTxlCZ3bTiBXLcwz5rbjNRC/wFSuRZVIaChdfgVR46NJQ8/zoxjql50ZMC7v85tVlO/OYA=
X-Received: by 2002:a05:6402:190b:b0:697:c0f6:394c with SMTP id
 4fb4d7f45d1cf-69810a44a6dmr1504110a12.9.1782465186628; Fri, 26 Jun 2026
 02:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260625104742.113803-1-l.scorcia@gmail.com> <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud> <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
 <20260625-unearth-suffering-e2c59d39da0f@spud>
In-Reply-To: <20260625-unearth-suffering-e2c59d39da0f@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 26 Jun 2026 11:12:55 +0200
X-Gm-Features: AVVi8CdLNvDTFf3GfQHOzooYBWEAR15rw8FIdBZyi6PI5TChocrGHW_idD11qis
Message-ID: <CAORyz2L5YuBifG-ud7QHPva+_nyL_SyXMVQ5EeC0s52isc5J3w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_021309_396783_77D4C633 
X-CRM114-Status: GOOD (  14.00  )
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

> Usually when making ABI changes because something was inaccurate (but
> not wrong to the point that it didn't work at all) it's possible to
> support both new and old ABIs at the same time because of new properties
> etc. This is a difficult one because it's using the same properties in
> different ways. A new compatible would definitely be required for a
> genuine fresh start while retaining kernel support for the old mechanism
> in this case.

All things considered, the cleanest solution seems to be adding a new
compatible, mark the old one as deprecated and also try to fix the old
driver code. I'll try to do that before submitting again.
Thank you for your help!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

