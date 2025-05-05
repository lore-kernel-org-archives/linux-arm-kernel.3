Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEB0C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pms5fvQ0dnJoBWv+1H4MBoKeVfIfZlhVgzVaTxFBOSc=; b=buwwajrlV2VpqjdnIwBTFCiwto
	um/ZVtzOIDuENAZoEvbQdkGvgcWpUOj7qROW3lwHVkafpIwhXJ0Q0YIIgCp4wlBGxCDpHwX5UxJz0
	nnczBqo0Lm2v7rTR9PIqJ7EL+QW3XMDiMNCDS+TQRTFwkDmClaXgMZJ8zIFtWMT+F/5FZxAkhYEpN
	aMh90ZzmdYu1uZa05g1OQD5Qh6djNJBWw80ewqBJYNBICimKRBDoctm3f/+LCYLPK/rpnnnK0neJh
	YCEPh7zq20jsvTnOF/mwD8y2JQ5EgIuX/54Tnj+O/5dKa4LcjccfakIdP+5kwH5nfuaniM0ySfQB6
	tYEshMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv7P-00000007N4n-0BlN;
	Mon, 05 May 2025 12:40:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv3b-00000007Kzn-16Hh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:36:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39149bccb69so3348402f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448585; x=1747053385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pms5fvQ0dnJoBWv+1H4MBoKeVfIfZlhVgzVaTxFBOSc=;
        b=y5MSRrvBuKbubR9pkylwuxJs4Vjn7RTzpqFPZRp7dvyxHxJS/ogJzrqsnWrs80k2FW
         uRRZ9VGEVJTbiEQ291AJT96mySdL1wy1vjiu5hdObsB2oUrE1Xuh44yDo/4J9QstMV0b
         zP3JZh07L3BKbLkyaHBFbb67WnCMZW7pieCl/T+8Vi7wVZGyvUYLoor4imAgZW7KbmIV
         9Px9cGicjcgl+hwFRdIMV8mA/qWbyvQPMsc0RU0uJP863ct5FZ1ZZ4OISp6lkA/YvMUZ
         FDPP1Q6CbPaaae5S3Qxr2yAlxR8QZBrMLlHthkvWVju43WSOr82zE25PxWkVtxCv46OZ
         +8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448585; x=1747053385;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pms5fvQ0dnJoBWv+1H4MBoKeVfIfZlhVgzVaTxFBOSc=;
        b=T/RQ0lCLX8JZvFU8yv7rACJ/XZh0ajJML8gLYkUhPo4Nbw21cpKR+EpvA8b1aR0FJx
         2H8p76uoz23fFyhVeq1d/Db1h8mokYdqmJLNnrMSTh3sxoT3fOHVSPgLQMBt8p8qUcoM
         PBuzKSvOknn+Ezs6ABovXZznGVJeDJ8uZK1rSkgjzFbLQP14AfEeej25D4buQPgFS4FV
         y52gqXOyGG9Q1goU1iJST9r2WElfmX2aQFxRGCJuzihAqMlViuHsh2desATIdB10XX9H
         3iYV98bawWZRH3NaT1SaEzysVBQXv9Vq++eTDY1M1290nPL8kmfLvD5ONBAM3A0jQJtq
         VnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuJqjHvAq0n6JvZBkvr3LbVWp7tsvaZNPBfZFv5hYWemTJ/oyrhfFeQ8BFeQ1AicNCI0hCoKyT3b0QOIvM6R/A@lists.infradead.org
X-Gm-Message-State: AOJu0YwPP8pDUWSAZdzyK0Rz5+fPLCTDwdIOthC9gLY1QYZOOeq4Jv8B
	Lcy4OM5cOAf6Z+zkpCEiDctNZPjMLUaxQ3J+8/T8/BD/dtFkqq1KU3SFBf1UEJY=
X-Gm-Gg: ASbGncth+WvSPrYTewKMULr04eK1jrUKrYiDbS5FyuGcaaS8lvEPQIXm+Tbqojr/KnQ
	P5d8yv5Ynl4jbPSCeweueVfijwicdlyB+CgFLSaYV2b3MTe+aL+Wv9gOcIQ9SkCetAnduvckEzv
	yzy7ENkRJtLS8Jp1CHudQYQRV9GoM7g/wDfRiwqM9rHofzptuXzUTX8PhkBHSr31WosjyhD5Mc/
	s/isIXL7dZ8pcUwH3DCOac4Rm/X2inxbS0aI1TY1phpcqlb6EdUGTbPbZYV5c031fP47HkgBKai
	l+h7JlQmx+lt2lktcfUKNrAgS0ioj4qj/7OQeTWM/j2I8AMe5lCFl4Ihct90tuV+ZNedAx08
X-Google-Smtp-Source: AGHT+IGsEliGJnwJASNNzDOIlUfeubpmj2r4ysjGNDPlKRJUSM2MTHWLJu/fnMkKxMkulAhjanR1Kg==
X-Received: by 2002:a05:6000:1a8a:b0:39c:d05:3779 with SMTP id ffacd0b85a97d-3a09cf4d5admr5929318f8f.49.1746448585435;
        Mon, 05 May 2025 05:36:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0cefsm10434442f8f.15.2025.05.05.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:36:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
Cc: stable@vger.kernel.org, Emanuel Strobel <emanuel.strobel@yahoo.com>
In-Reply-To: <20250503084443.3704866-1-christianshewitt@gmail.com>
References: <20250503084443.3704866-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: dreambox: fix missing clkc_audio
 node
Message-Id: <174644858455.1377517.9885445879892405270.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:36:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053627_326268_D97ED077 
X-CRM114-Status: GOOD (  11.53  )
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

Hi,

On Sat, 03 May 2025 08:44:43 +0000, Christian Hewitt wrote:
> Add the clkc_audio node to fix audio support on Dreambox One/Two.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/fixes)

[1/1] arm64: dts: amlogic: dreambox: fix missing clkc_audio node
      https://git.kernel.org/amlogic/c/0f67578587bb9e5a8eecfcdf6b8a501b5bd90526

These changes has been applied on the intermediate git tree [1].

The v6.15/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


