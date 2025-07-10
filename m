Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DAEC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToFgcIrPsT47qophkUF6t9hEDKpaWGkYpzWGaT7NuQQ=; b=ZvCHCI3OrOBQVd+xlhBQjdsoxH
	t6mV0/Y4FGi6cJXKkoediVp996AHBfPeTJz71K1CTczSUs2gYiJS0glFnyGU29ef9DYFrYMJqWLi1
	yQn801LxQOxzBvTCWHqa0WvHpp9LsnHSqmoqhRW00YwsbULsWYyoNf3181RDREyjs6cCuiDr1U67R
	psOgvHb8tV7HWgEaO2eG/yMd6EX1Cw2qMF2d1Na6h8EttkDSrPqRLrII8q+YnomVf/UphSFm7uPkW
	X1kbYIisSyi2TjKbS7lrQ7647G1v0Zb2DEkMjMRc799ee39J3b1nJj3uyo5XeAWA6eojc7AW6ZEM6
	Jo6ywO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnGJ-0000000BIZV-1lqZ;
	Thu, 10 Jul 2025 09:08:15 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmD6-0000000B69D-3nsK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 08:00:54 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-611e455116aso430830eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752134452; x=1752739252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToFgcIrPsT47qophkUF6t9hEDKpaWGkYpzWGaT7NuQQ=;
        b=AunpoeJpwoACkGGtyeIxeoo92UWo19BthVIdMgIRa2XZgFB1BsHtyqltmgbr6jHrhe
         rwLK5As21N0vtCD5PXST1ytrfF46ts+jp6tonAmO9mDy+HI+yQoaEdMtYeOTD+oNaWCd
         oEyuBbSRUALvGYmRGkgEH1gQfq+NUFHQen/P1PUsy0MAVElxY2hun42aCN1xj8qN6g67
         JuBjiwhkbVIYN70QSOvUjunT8R6g6hgXXu3uI4yEPN1lHccOJqNDdHycujnxlfkFXsIb
         yDN/bTsTJSW+N+PlDVE8q6CHFnMSipxaY6zDBEEfHw2OCjvYQ1/8A9Nfd5Wn90+1TAEk
         V3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752134452; x=1752739252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToFgcIrPsT47qophkUF6t9hEDKpaWGkYpzWGaT7NuQQ=;
        b=G+RhjKCbCCNRf9+9ESslvmuE/xOoM+cD8k/115iWUNmcP5/eZ5PhK8dCLxhJ71S3LY
         I7gZAPv9gOJ/queZeIAWiJwDP3EcK0JorEhwXNf5PzRkgmAlqE7BXLhMYtcBgpjtoQI1
         T7Ub7K+NNJKdvW+4w1L2HeXqoQ9SVYVfkENXYdemX05DcR8tEQLXjbzpRzQtxslUCoT+
         AanQwnVOvoYsfzA8P6N4aR0Z/pI0mpLOxsrIJjLV8F9XO+zzB3+d6Lv+XPdr7o6QaGBD
         C6mzXL4E3ETJd8swKKkRQ4ukC7G7Ky3Xuuqw9aOJXcVSnZgAaq593EH3KJT4r3nX0CTg
         0zog==
X-Forwarded-Encrypted: i=1; AJvYcCXqsZjqnjKfaZy4epnDsPE6sIy4MNJQkdJ+rbTV4HJ2usVz5lw3ZSO437PJLJIsyoo+tDsRXmpJtDp9JsRNJKJ4@lists.infradead.org
X-Gm-Message-State: AOJu0YxbzdXgDefiFpqvN+iMsGswIKNDiiCbnfBDA0Jv12QZBGgMKY2/
	nUAuh51nkG8KNFqGOqW6XMGt6jKxVOveh+G3BQaTVipajsqvnn6t1ZOniOKgOsX2eMsLc67r0Id
	RRgHmfwtlMC8uvtqG3q/gAc6hp4XJwYf1OjBZXEi04g==
X-Gm-Gg: ASbGnct0H3lXwKtiVj6Jughiyc/wZsG9x6MufRVdFNc1Q50cuL2dpUHQdI35ObNGcln
	jQTcPbwsmBh6JNmaJsLa3nwXebQCN/FivoBMjIp1YqAjF/xSOhfE8LPjyYjbB/POntHCHV14Dxg
	8E8kO5TNqIksVri9nU8yJF5bK3ENSB0ZOCeQ7uEhoTVQg=
X-Google-Smtp-Source: AGHT+IG42etH9AipEwoVy40wJMSye+NWVNGQGCdLQSYPBIHb3YYmVeD+/TNpEhAraHgVOha7QcC5U1cAMQ15bwl7bNY=
X-Received: by 2002:a05:6870:a351:b0:2d4:ce45:6990 with SMTP id
 586e51a60fabf-2ff10820374mr954468fac.7.1752134451671; Thu, 10 Jul 2025
 01:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 10 Jul 2025 09:00:40 +0100
X-Gm-Features: Ac12FXyPZ25VVFt9KdiEcMMJ5hhaX1smahS3sKtKfS3Bife6pmJ1SYWsA7BHfaM
Message-ID: <CADrjBPpkZf2Hc_97e+-ZX5hpCw+DubEOUNiJ6fHLx0Kq2PZ7Uw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: tesla/google: MAINTAINERS: Reference "SoC
 clean" maintainer profile
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_010052_960451_6F46B100 
X-CRM114-Status: UNSURE (   8.26  )
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

On Thu, 10 Jul 2025 at 08:35, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Effectively all Tesla FSD and Google GS101 DTS patches go via Samsung
> SoC maintainer, who applies the same rules as for Samsung SoC: DTS must
> be fully DT bindings compliant (`dtbs_check W=3D1`).  Existing sources
> already are compliant, so just document that implicit rule by mentioning
> respective maintainer profile in their entries.
>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

