Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A67EC1116
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S3D2amG83bMjq3rYrixdtz5QNwrXVFuIOF99KB48r8=; b=KsJizWagOccDvCgIH/K+GrRRBI
	Ff3yemDCVfc2x8qwVIpNIx7gEKtrR/tu3JsvyAcd1hc9KebI6Lf2uK+gvvmCUo2thcGx9Q+kjfSrt
	nd4wQJpvFqt9+kOkwMHUgrUtwZh61yGou5eBTTjURvM6d6zRFAImCJBVybEGXuiQfntcaKPKKRFVA
	VpiM3imzmFFz2cXMPloj0D55Ffvun7qAXCWnsVf2GagD10jIEkV4akx1ULYFk+nHaUGnh4Ks1gR6l
	HYbRpVUydrIqiYVE1tVT2rLAofepaL7Ks1WKv5debw5mCRyaQdyC+LK5VR+v/oVO0vfk2zm8r7fuE
	PF878csQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua9M-00000000ptP-1O8s;
	Mon, 23 Feb 2026 17:55:16 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua9J-00000000psh-1DEg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:55:14 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1271195d2a7so105403c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771869312; x=1772474112; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8S3D2amG83bMjq3rYrixdtz5QNwrXVFuIOF99KB48r8=;
        b=QSyg660UlKYrFi43YIwDo2LyEuZ3g3QWKTg/ARY1HOoEu/MjRfp9IoXseC4+HrEyX3
         4wJaw/TGXslUUUtHwcvgC9S2gfQZerVj8mfa7hQQ9VSsfmASVOq9auAbg1fJnykKa4Lw
         vogt1sBk+jvLHPaP00leOkWgam1xITucdD9/ScnsFHpCdSpWxVHKFmVtiyZBlFNl6vEW
         9Kaf4Rfa48cgh3yQfqwogC5w24dOoVJhudUnUXAY9efNdPhOZvbU/34xN6IpxD8jHSuF
         1WIUa9GuYeb0tgm6Rvd2OF+M5UCwHUeVIL4g/ahdNhBRl9Xy90+iLNXZI8WJeWxLaOZD
         f0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771869312; x=1772474112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S3D2amG83bMjq3rYrixdtz5QNwrXVFuIOF99KB48r8=;
        b=IZnTrNXInPmrqv+veu1rgDdcd27A3vi/Y+mCVV0Kb/jG+9qv6HdkEcsWCMvFQjeKLJ
         fDZW3qrOXo1q0+JwhORLZRkOfuW5xvDd+0wypsdVGZ/ejk4csrsgFcFvcilZkEIW77lI
         68UMuvDoASi9gaqyPZvOLfDY3JvjsPD4CgwtlBjPjSjQQcVAaC/LKLzw4gV3FgkEPXGs
         mi4zZpEi7Hq99co+0KsUoUHoAwEM8jgPFVJm3GIsTkh8CwnBwomS/Qo7y2Kv1CAYgCve
         JgGixHfqadxrPbsvI4rOXU/TWQtUi8s+uodfuKpFT6WNgDJH3raEuNSPJEDGJ9w7hEOn
         1+aw==
X-Forwarded-Encrypted: i=1; AJvYcCWOqElaa54NC5WBWKYkR8AGgeAxMuNSh7wo3NCwFAEF3x5yx9SB4No4ky6GWVuCu93Zl8g58Pg2a3Wd99U0PKSB@lists.infradead.org
X-Gm-Message-State: AOJu0YyRf2qE6mtN7YeuUKSPpruOizrfozKSm+O/ARdWfYZdBjnqbenu
	R4ABDpz0oG0NTNQCFY4x7rwCbRTI74PFAyGZq+ccsWQbE0mC0NbZjrRG
X-Gm-Gg: AZuq6aLXWeI0KyqqaCXfbmC0BF8Id2Bfy5kTTsPQq0/APbH68abI7kp1pjBvlTVKHzA
	2/wnkwO+jvfWo4D15KUPLHN8maR18NG3YzNpJaMfe8jjAbnAPWyll01WSuGr+yGBLqVNq0NAtfd
	0/OF6PgSYe0CXr8gRCrnEA7In235UlcCJxkURVZAZsbTJob/UbDixRXqox55jC/2AgcxNQiwBk/
	mu/GNORp3vteUEVa4OU9uy38f/0xvvU+osQT1gEHSk1fi6XpTE/zgvtFTyPnsZewSgQbiVSMYI/
	C+3XvEyvTvlhURDuiLzuqtdswhoHjO73V8goIqKoZqMQ4JPQlhuAhwzSPIxBb7LnmrkI8qeUMoE
	4zTm0e7Ljvg2abcITyiRvwIqGEXmF/aUkCzKGqQfdBhVzlIgEFT34Z8dabhffC/miYKqpcMMpDd
	FOl/L2FqNw50TC3nfHYXLfGYFMDsYDqo+COnWUNCriv/mlggR3+JwQHyxkhX06BqOjmAaMmJbah
	S4=
X-Received: by 2002:a05:7022:2214:b0:11b:9386:a3bf with SMTP id a92af1059eb24-1276ad61a70mr4534016c88.42.1771869312175;
        Mon, 23 Feb 2026 09:55:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1b48:5d6e:ab6e:5287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ad65sm7334624c88.11.2026.02.23.09.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:55:11 -0800 (PST)
Date: Mon, 23 Feb 2026 09:55:08 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 7/9] input: keyboard: mtk-pmic-keys: add MT6392 support
Message-ID: <aZyUXip4zgeDUdVQ@google.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
 <2c96591313084d240ac94b9d42d91d984fa9bce7.1771865015.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c96591313084d240ac94b9d42d91d984fa9bce7.1771865015.git.l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_095513_331335_2BF370F1 
X-CRM114-Status: GOOD (  11.22  )
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

On Mon, Feb 23, 2026 at 05:12:46PM +0000, Luca Leonardo Scorcia wrote:
> From: Val Packett <val@packett.cool>
> 
> Add support for the MT6392 PMIC to the keys driver.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the series.

Thanks.

-- 
Dmitry

