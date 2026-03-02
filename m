Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32808FD006E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 04:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR7tI6mgjCUBq1mVAVYHHMgAe2A7qGWTwipNtUinZpU=; b=NmiZn6/aPTbl/FoBEyVKxEuiTH
	ji4/geQXatmxGdmLXEjtSHlkIaIChIvqIT1SLck5Zj9VzLPn4Dc8Ew3S5l68Et4EPzw0HeliAJ5JQ
	7TDSCNUFxUela1D+x/UvbZ3LPfI3nhpfz6H2/7ekMAbf3DOue5bHO3Ja/iNUHm/VZh3cgEQt7Lo0S
	oyJ40ko2i75xLIaDIs+ypvt2x26dcNhkiUE5m0Z9d3j87jBDa6NN/p2Fe4ZxmnhHRnh6xnPErzQfD
	z48Qlcm+pUzzZkuNYG+3CaT0qUy5qPQ9cKpIubSYBGVKYSUXgN0Dd+MYf5bfcsRrXzV6ujcDJDATL
	OgKHukDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxH3R-0000000EUFR-2LIQ;
	Tue, 03 Mar 2026 04:08:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxH3P-0000000EUF5-3foq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 04:08:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso46635105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 20:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772510893; x=1773115693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR7tI6mgjCUBq1mVAVYHHMgAe2A7qGWTwipNtUinZpU=;
        b=VgSlfn8haJ9Hg8cxvgNb1lCDIMTFaVitXanWdC8WHASZuGb/13taEn8ngPluHY0HY2
         ps5vK9+PUpbpkfDTxxrtWhIBc2tstN6P1QKnPasKjKC7QZZvnoo51RVMDYgWhOEl0MBl
         aEi60CGIbW/MALwwsB2R/dG05eAHNi3yV0pxIIFrx9LTOv4ti/srHIqhxhwcc+5s18q6
         bwrJdR3EWSbXRXvJx2AB+1X/JYZAy/1fP7MAYmsRbNif/c5QAnin4p0KkU0g57FXqfzQ
         y71pn7HDohUQWy2auE/FS3sjwLGBQiX91TUbdFNeV3IUnB09G+YajLvV/I0HJl4yhMSv
         Dvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772510893; x=1773115693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XR7tI6mgjCUBq1mVAVYHHMgAe2A7qGWTwipNtUinZpU=;
        b=GLjArjXXbWlGNQ4N8BxXlKEu9I/Wt+XlyJxCqfjtGJ5Ju+eas3ECHJt9P8w2ln7vSZ
         5aKev0T8tFR6IP9uMcTUnq5TJQu15lCbc3g4IRbzYYcDwVTIuWEp2bi4r27c7fUwgmrU
         ebDQdcXgFpbuYi8CuH8EuWue2x/JBZdd5OZGObqLF3uiqQCf7FFtHTyDYyVANkshxXUh
         rDwfywU1UscDjnMe2LblBjiIiU+g2Rq5vs12LAsq8Pm45Soe5MK4hkyVOCXciY7sEOY/
         crqzGVVyvdXCchMBdZ2LJ9S8AgHWFyi+eXO4Pa88pLNHg7wreCrEQ+FNAn27hfjOYji7
         0IKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMafO1efSeRQ8t1rQxsR/psOUuDD1c5KBh3arxUXjBeSDwReAw1mxDivU8Yao6Q4w9f9P4jhTfCWwkH8FnzHx5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv2HQIp19cRhWwPlCBhbGOhP4PBSufmQ+ZpTJWVCr1qYTF+Qa3
	dqvOkznCBe6iUi+zA0gGPDtk7zsZZXFkevxScPZsjmEqkE4SevcBy2Lk
X-Gm-Gg: ATEYQzyfhCJHBd/Jxpt0+e1HgzDH3FLUY7aUwpB+kxneia8IuPx/eceP+iZqjZmp5vi
	mLN5WD7MQ27Rb92/dqMkRAL7XkMS29VPGWMtGRA1qoGJzywC+ZEw0vCvDkg/u/roFFY9HfiiwVl
	dpbOkVlHG3aFM0K9UFyPsPGwgcg/ZlE6gURkjD02jlYZXhJv+RhpmcK3AtIPNDf+CEuwHJIcZAC
	pAdxlDwhHHEZqMi/oLD7ZvLAGig5mfFKDY8UB71LxqVlFEkTfzXzYIiub30Xx0k5F8ybj4nI9MP
	6KgJWUz0ehYndhWnQOZNkYQyml88RXlXWyZ3FbylW/WG47gkJhiLPq4+od6hvsI9tzKO8dvZUjQ
	RyKyqr9NMbryWYhVQOpfO7B83Lt8KWITlxGf4vqYweQirEm+FDSF/C6WosaVbEpBhy/wWOMmOp9
	Ummbk2UrasNIrszmOLsNOoCUJ5MWsnXnDW40QSD2r6DAKt+f2AZrvKNjAAMk7D9qn5K7Zcex+vQ
	Kcm6jPA
X-Received: by 2002:a05:600c:1d0e:b0:480:3bba:1cac with SMTP id 5b1f17b1804b1-483c9bc55c0mr234488635e9.6.1772510893358;
        Mon, 02 Mar 2026 20:08:13 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e6c9sm393590355e9.8.2026.03.02.20.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 20:08:12 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
Date: Mon, 02 Mar 2026 19:43:07 +0100
Message-ID: <5969539.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_200815_920101_628C63E3 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
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

Dne nedelja, 1. marec 2026 ob 15:49:39 Srednjeevropski standardni =C4=8Das =
je Andrey Skvortsov napisal(a):
> From: Samuel Holland <samuel@sholland.org>
>=20
> The register address was already validated for read operations in
> regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operations
> have the same set of possible addresses, and the address is being truncat=
ed
> from u32 to u8 here as well, so the same check is needed.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



